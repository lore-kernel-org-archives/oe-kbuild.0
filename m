Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910FD3E63A7
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Apr 2026 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371710; cv=none; b=sKGAdQmzl/1JjfRMr2Mgq0wJWqlZNP7EkzzUIa4uHEX2SHhudyQAGeLTHYTMC1QaxC/J6ZXTzpD/AIB/7Itd1e+tYiznIdXdRbiY4AyP/XfvGI8woRdedECALtBsNesb/e2nb2Rfb+dq2gytHu+f4oCI6VmlUFU5zda6qSjYf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371710; c=relaxed/simple;
	bh=mCG38zXYDoskhBwWWmyFVj3ljtfr6oNNjPu+KU6pQkI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ktb4CFHVfGtVL/d4PnfyYbI5a8pPZoWw1ZIp8SImYndMuCs/UlI33iWqQphKzHvMS5qNIyU4RnAggtQUwfG2W9rMsCSOmbJhO2AGK22b+N6YNGeB3hcmR0MRp1XeTT6AlzLglRCATfq+WfVG6whjEsqOJUbdO08yzPw71LlKZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsCwUZv5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsCwUZv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777371709; x=1808907709;
  h=date:from:to:cc:subject:message-id;
  bh=mCG38zXYDoskhBwWWmyFVj3ljtfr6oNNjPu+KU6pQkI=;
  b=gsCwUZv5abs7oURz/kSLa881F/8xXklWH1Jtd/lhbKGJzJbaf6/TKcw4
   lDvQBLdKqcvl2p6ErXAL7gqRksoQOWlQQB3EEG+WT7yiw2+EeghMIRb97
   CURe664fPFLVyvv/S1B6KN6JvKENoYxBDdxvU74uBWfmry19SlIDU+uwK
   X390Q7OsFIMbfm/aLvHF0OWuCWER7UYmDJXeAomd74eqrIQIXOygFktJF
   JtlTP3BKWAHKi9Tw+GtXYlVZgvnw+o+4315B+CtmxTKEJnTvCSCiYzG31
   cd/2qHF4KhUsUxQhoT6E+uCnecJivbOuPerlruS+R+VGYhjSSGc9VfDpX
   w==;
X-CSE-ConnectionGUID: 0dMjFuBzQCKfwQqkkQqnCA==
X-CSE-MsgGUID: 7iCsSlIWRliW7Zufh/scsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78192696"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78192696"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:21:48 -0700
X-CSE-ConnectionGUID: gz21IsVMTMed7lCwaBD8Sg==
X-CSE-MsgGUID: xGryKjZySmiUrGUPUIyxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="237874082"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Apr 2026 03:21:47 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHfZY-000000009jE-1EaL;
	Tue, 28 Apr 2026 10:21:44 +0000
Date: Tue, 28 Apr 2026 18:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/sctp/auth.c:480 sctp_auth_asoc_get_hmac() warn:
 potential spectre issue 'sctp_hmac_list' [r]
Message-ID: <202604281827.8GnvjQ8r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
commit: bf40785fa437c1752117df2edb3220e9c37d98a6 sctp: Use HMAC-SHA1 and HMAC-SHA256 library for chunk authentication
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
config: m68k-randconfig-r072-20260428 (https://download.01.org/0day-ci/archive/20260428/202604281827.8GnvjQ8r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf40785fa437 ("sctp: Use HMAC-SHA1 and HMAC-SHA256 library for chunk authentication")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604281827.8GnvjQ8r-lkp@intel.com/

New smatch warnings:
net/sctp/auth.c:480 sctp_auth_asoc_get_hmac() warn: potential spectre issue 'sctp_hmac_list' [r]

Old smatch warnings:
net/sctp/auth.c:678 sctp_auth_ep_add_chunkid() warn: potential spectre issue 'p->chunks' [w] (local cap)
net/sctp/auth.c:943 sctp_auth_init() warn: assigning (-32764) to unsigned variable 'auth_hmacs->param_hdr.type'
net/sctp/auth.c:958 sctp_auth_init() warn: assigning (-32765) to unsigned variable 'auth_chunks->param_hdr.type'

vim +/sctp_hmac_list +480 net/sctp/auth.c

1f485649f52929 Vlad Yasevich 2007-10-09  452  
1f485649f52929 Vlad Yasevich 2007-10-09  453  /* Get an hmac description information that we can use to build
1f485649f52929 Vlad Yasevich 2007-10-09  454   * the AUTH chunk
1f485649f52929 Vlad Yasevich 2007-10-09  455   */
bf40785fa437c1 Eric Biggers  2025-08-18  456  const struct sctp_hmac *
bf40785fa437c1 Eric Biggers  2025-08-18  457  sctp_auth_asoc_get_hmac(const struct sctp_association *asoc)
1f485649f52929 Vlad Yasevich 2007-10-09  458  {
1f485649f52929 Vlad Yasevich 2007-10-09  459  	struct sctp_hmac_algo_param *hmacs;
1f485649f52929 Vlad Yasevich 2007-10-09  460  	__u16 n_elt;
1f485649f52929 Vlad Yasevich 2007-10-09  461  	__u16 id = 0;
1f485649f52929 Vlad Yasevich 2007-10-09  462  	int i;
1f485649f52929 Vlad Yasevich 2007-10-09  463  
1f485649f52929 Vlad Yasevich 2007-10-09  464  	/* If we have a default entry, use it */
1f485649f52929 Vlad Yasevich 2007-10-09  465  	if (asoc->default_hmac_id)
1f485649f52929 Vlad Yasevich 2007-10-09  466  		return &sctp_hmac_list[asoc->default_hmac_id];
1f485649f52929 Vlad Yasevich 2007-10-09  467  
1f485649f52929 Vlad Yasevich 2007-10-09  468  	/* Since we do not have a default entry, find the first entry
1f485649f52929 Vlad Yasevich 2007-10-09  469  	 * we support and return that.  Do not cache that id.
1f485649f52929 Vlad Yasevich 2007-10-09  470  	 */
1f485649f52929 Vlad Yasevich 2007-10-09  471  	hmacs = asoc->peer.peer_hmacs;
1f485649f52929 Vlad Yasevich 2007-10-09  472  	if (!hmacs)
1f485649f52929 Vlad Yasevich 2007-10-09  473  		return NULL;
1f485649f52929 Vlad Yasevich 2007-10-09  474  
3c918704921412 Xin Long      2017-06-30  475  	n_elt = (ntohs(hmacs->param_hdr.length) -
3c918704921412 Xin Long      2017-06-30  476  		 sizeof(struct sctp_paramhdr)) >> 1;
1f485649f52929 Vlad Yasevich 2007-10-09  477  	for (i = 0; i < n_elt; i++) {
1f485649f52929 Vlad Yasevich 2007-10-09  478  		id = ntohs(hmacs->hmac_ids[i]);
bf40785fa437c1 Eric Biggers  2025-08-18  479  		if (sctp_hmac_supported(id))
bf40785fa437c1 Eric Biggers  2025-08-18 @480  			return &sctp_hmac_list[id];
1f485649f52929 Vlad Yasevich 2007-10-09  481  	}
1f485649f52929 Vlad Yasevich 2007-10-09  482  	return NULL;
1f485649f52929 Vlad Yasevich 2007-10-09  483  }
1f485649f52929 Vlad Yasevich 2007-10-09  484  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
