Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71741537A7
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548193; cv=none; b=E9rRVewNZ1Arlu1Pz+bfyITTGusPzaVIHQrU6a+cdZWRsfLv/pseZhrYE7ZOXRqMibpovsBRxT2bb0T2VvI+JJPyC2WBZWGxZ39or9nafFCRQtfgx0eJzOqi03374i5qQhVZfzfOGoNlnekNf217l9u4VDN2OWwLK1Xx12pgdEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548193; c=relaxed/simple;
	bh=QgAlVzzzZ3HPyRGrnvtKsG2viSElv/g39j/HFcvYp7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjBhyJWNgeIpZ46JFPBNAJO8cQyCdvtyj1qDXctQQuKT9f/qh3YyznJHL1qphY8hUIZki4ncka/a8YpvaJPXaIub9ZoT5gkLAjF24WLOy0HRCIC2HNaCj8jQEj3xyE/aDcaa2zLPeLH16P/41AjP4flU8qFKMmxKalyywZzWAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXCo+WF3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXCo+WF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754548190; x=1786084190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgAlVzzzZ3HPyRGrnvtKsG2viSElv/g39j/HFcvYp7w=;
  b=iXCo+WF361e23pd4PbC853X6p/FZSSIX2RFiXQp9kAqfy7v1AlGvSS/T
   hIXRwh4MyB5b0HN8SGz9Be14qdXqTeE9gmL0Z0FG53hmCkLYrfV4EtepJ
   9erQl3IcQpdUikcjh7pXhkQDkx9LIfwKQZp0opgav2X0CVaXIcLuMSaTk
   9HSRg9ALW1aC3n1kPNz/T7rRXPewBt+kndu4Cn9wMAs1GmETfONcwvc+M
   9vd3o+UEsjSwWBAHVfAvmiLSkMSfs8w5dtz/+CcGvbiUYkDeCfzJC5fqW
   meloxLtl4v2wd13g3qUDVcwD/LiUYljYwQUbS3LIM/Gx62636v9PSLy/2
   A==;
X-CSE-ConnectionGUID: jReSxNJjT9iYkz8rENU9FQ==
X-CSE-MsgGUID: 7csnC+eUQduH4QfJvqscgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59489465"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="59489465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:29:50 -0700
X-CSE-ConnectionGUID: ZEXDV1ndRWycvwxAAyNKmw==
X-CSE-MsgGUID: clWfNT5yRLiNCK+uIGamRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164500604"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 23:29:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uju8J-0002Si-0u;
	Thu, 07 Aug 2025 06:29:47 +0000
Date: Thu, 7 Aug 2025 14:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 14/34] net/sched/act_api.c:66
 tcf_set_action_cookie() error: uninitialized symbol 'old'.
Message-ID: <202508071401.PJIfqLEX-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   4402c229e926bc7daad98d65e55297b090302dac
commit: 706499ce0fa57b3087c860c2595c9b7699dd4946 [14/34] rcu: Support Clang's capability analysis
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071401.PJIfqLEX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508071401.PJIfqLEX-lkp@intel.com/

smatch warnings:
net/sched/act_api.c:66 tcf_set_action_cookie() error: uninitialized symbol 'old'.

vim +/old +66 net/sched/act_api.c

eec94fdb048067 Vlad Buslov  2018-07-05  59  
eec94fdb048067 Vlad Buslov  2018-07-05  60  static void tcf_set_action_cookie(struct tc_cookie __rcu **old_cookie,
eec94fdb048067 Vlad Buslov  2018-07-05  61  				  struct tc_cookie *new_cookie)
eec94fdb048067 Vlad Buslov  2018-07-05  62  {
eec94fdb048067 Vlad Buslov  2018-07-05  63  	struct tc_cookie *old;
eec94fdb048067 Vlad Buslov  2018-07-05  64  
b4cb4a1391dcdc Eric Dumazet 2024-06-04  65  	old = unrcu_pointer(xchg(old_cookie, RCU_INITIALIZER(new_cookie)));
eec94fdb048067 Vlad Buslov  2018-07-05 @66  	if (old)
eec94fdb048067 Vlad Buslov  2018-07-05  67  		call_rcu(&old->rcu, tcf_free_cookie_rcu);
eec94fdb048067 Vlad Buslov  2018-07-05  68  }
eec94fdb048067 Vlad Buslov  2018-07-05  69  

:::::: The code at line 66 was first introduced by commit
:::::: eec94fdb04806790c7b7e6ea347820064cc6d467 net: sched: use rcu for action cookie update

:::::: TO: Vlad Buslov <vladbu@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
