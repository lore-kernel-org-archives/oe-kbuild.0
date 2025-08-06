Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0C944F
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491864; cv=none; b=orklKhwKmFhnKlOwN6qdk0MuYgnXPMed/P0tzwuUtUlqTxsHiDxBDS33Cr/Ss41ONwEKtFzEdAfvZa7bFJe46bqrdRTlq4EzOwJXv8Zk9CROiaVn/XTCOarIB0MNa1dhG5AHfIrzKRMrsiHkEpMJL8QfYkEvSfKGxUP5+C7BXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491864; c=relaxed/simple;
	bh=DUtDePTQHWwzq+6rdqFtBthdjDq08J7JwQ+uabxy9mM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8V44p0VTTUaN+yvLRz1AgHfUGm581Bt+Yt2e24r7WYUO+hFCnsqHv7/bWBHWDe8YNEPMSjEAaa1lbzajV3O5Jqh88udMOmd0BbLhxe43TRx5O+cDARAiBSt1+XMUDCrjdm/YMgbACbrLJF3Y5q0G8cRFzvVo7VhNasyuA4Hc/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzIXpnDw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzIXpnDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754491863; x=1786027863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUtDePTQHWwzq+6rdqFtBthdjDq08J7JwQ+uabxy9mM=;
  b=GzIXpnDw1wbxj/GKGacG4Hke82h6XSLnp8NeLlYw6joCcTCwZ2674DK5
   w2TUvKxBKLjRZEO+xoXGlIHpVsWOOLFLU26Oa18hse5NwFI4aWqmp+QHa
   U9MlfGKHVXpjVN32lFi+6l3t0nHh3eAbgB+ediupzeSSxw5IBWXE7K2m5
   3T9emo4c6x76d07Rwe31cSO3L7Dkys4FSkAzrfjUqoWKz9p9bKTWovbvE
   CYrH++CMhzvDXW50E5sRvm0xzhKrsGd2Z6OwbnspHyjAqzr65kcGDH8D8
   WY2a6tpDBAySNuo3Dvcm80wG4lftU9rcVel9rMJ5hXjMjxizBuNKZBkov
   w==;
X-CSE-ConnectionGUID: 8kWq8dsrTW+T02bB/cO7TA==
X-CSE-MsgGUID: WFdBN6VvRmaO2vuLPrWXmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67078653"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="67078653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 07:51:02 -0700
X-CSE-ConnectionGUID: uS4zCircSVep97y4p8irAw==
X-CSE-MsgGUID: wkoM4WVrSh2xuY3VHJAC/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="165567426"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2025 07:51:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujfTn-0001nA-04;
	Wed, 06 Aug 2025 14:50:59 +0000
Date: Wed, 6 Aug 2025 22:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ebiggers:wip-libcrypto 29/29] net/sctp/sysctl.c:400
 proc_sctp_do_hmac_alg() warn: (struct ctl_table)->procname cannot be NULL.
 Expression : tbl.procname
Message-ID: <202508062204.GxOYdyd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-libcrypto
head:   7fbf88966943cc7f22f9dade58354f59b70be55d
commit: 7fbf88966943cc7f22f9dade58354f59b70be55d [29/29] sctp: Use HMAC-MD5 and HMAC-SHA1 library for cookie generation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r071-20250806 (https://download.01.org/0day-ci/archive/20250806/202508062204.GxOYdyd1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508062204.GxOYdyd1-lkp@intel.com/

smatch warnings:
net/sctp/sysctl.c:400 proc_sctp_do_hmac_alg() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/sctp/sysctl.c:400 proc_sctp_do_hmac_alg() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

vim +400 net/sctp/sysctl.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  386  
78eb4ea25cd5fd Joel Granados          2024-07-24  387  static int proc_sctp_do_hmac_alg(const struct ctl_table *ctl, int write,
32927393dc1ccd Christoph Hellwig      2020-04-24  388  				 void *buffer, size_t *lenp, loff_t *ppos)
3c68198e75111a Neil Horman            2012-10-24  389  {
7fbf88966943cc Eric Biggers           2025-08-02  390  	static const struct {
7fbf88966943cc Eric Biggers           2025-08-02  391  		enum sctp_cookie_hmac_alg id;
7fbf88966943cc Eric Biggers           2025-08-02  392  		const char *name;
7fbf88966943cc Eric Biggers           2025-08-02  393  	} algs[] = {
7fbf88966943cc Eric Biggers           2025-08-02  394  		{ SCTP_COOKIE_HMAC_ALG_NONE, "none" },
7fbf88966943cc Eric Biggers           2025-08-02  395  		{ SCTP_COOKIE_HMAC_ALG_MD5, "md5" },
7fbf88966943cc Eric Biggers           2025-08-02  396  		{ SCTP_COOKIE_HMAC_ALG_SHA1, "sha1" },
7fbf88966943cc Eric Biggers           2025-08-02  397  	};
ea62dd1383913b Matthieu Baerts (NGI0  2025-01-08  398) 	struct net *net = container_of(ctl->data, struct net,
7fbf88966943cc Eric Biggers           2025-08-02  399  				       sctp.cookie_hmac_alg);
7fbf88966943cc Eric Biggers           2025-08-02 @400  	struct ctl_table tbl = {};
7fbf88966943cc Eric Biggers           2025-08-02  401  
7fbf88966943cc Eric Biggers           2025-08-02  402  	if (write) {
320f1a4a175e7c Sasha Levin            2016-01-07  403  		char tmp[8] = {0};
ff5e92c1affe71 Daniel Borkmann        2014-06-19  404  		int ret;
3c68198e75111a Neil Horman            2012-10-24  405  
3c68198e75111a Neil Horman            2012-10-24  406  		tbl.data = tmp;
ff5e92c1affe71 Daniel Borkmann        2014-06-19  407  		tbl.maxlen = sizeof(tmp);
7fbf88966943cc Eric Biggers           2025-08-02  408  		ret = proc_dostring(&tbl, 1, buffer, lenp, ppos);
7fbf88966943cc Eric Biggers           2025-08-02  409  		if (ret)
7fbf88966943cc Eric Biggers           2025-08-02  410  			return ret;
7fbf88966943cc Eric Biggers           2025-08-02  411  		for (size_t i = 0; i < ARRAY_SIZE(algs); i++) {
7fbf88966943cc Eric Biggers           2025-08-02  412  			if (!strncmp(tmp, algs[i].name, strlen(algs[i].name))) {
7fbf88966943cc Eric Biggers           2025-08-02  413  				net->sctp.cookie_hmac_alg = algs[i].id;
7fbf88966943cc Eric Biggers           2025-08-02  414  				return 0;
3c68198e75111a Neil Horman            2012-10-24  415  			}
3c68198e75111a Neil Horman            2012-10-24  416  		}
7fbf88966943cc Eric Biggers           2025-08-02  417  	} else {
7fbf88966943cc Eric Biggers           2025-08-02  418  		for (size_t i = 0; i < ARRAY_SIZE(algs); i++) {
7fbf88966943cc Eric Biggers           2025-08-02  419  			if (net->sctp.cookie_hmac_alg == algs[i].id) {
7fbf88966943cc Eric Biggers           2025-08-02  420  				tbl.data = (void *)algs[i].name;
7fbf88966943cc Eric Biggers           2025-08-02  421  				tbl.maxlen = strlen(algs[i].name);
7fbf88966943cc Eric Biggers           2025-08-02  422  				return proc_dostring(&tbl, 0, buffer, lenp, ppos);
3c68198e75111a Neil Horman            2012-10-24  423  			}
3c68198e75111a Neil Horman            2012-10-24  424  		}
3c68198e75111a Neil Horman            2012-10-24  425  	}
7fbf88966943cc Eric Biggers           2025-08-02  426  	return -EINVAL;
3c68198e75111a Neil Horman            2012-10-24  427  }
3c68198e75111a Neil Horman            2012-10-24  428  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
