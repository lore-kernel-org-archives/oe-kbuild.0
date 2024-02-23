Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC2BE5D
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Feb 2024 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708657244; cv=none; b=mqIV63SSfQ4EvLqNX5IRcP33dZ+/8xvaAYCWZVM0WN36A9d6t3EF7WoFpy8nTXwVvvknfPwxQzK2I9g7HtD6z6bYiIuxPhCulGvMVj4PTWf+ErFKZ3ecR8+XtxCEDfi7iQkvQ2xdLUlhPu6qYiYKUDVT2fAglO/uD+KYx9U26Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708657244; c=relaxed/simple;
	bh=GapBaLW4b8UyKc+vk5KzzQa5CggRMiANa6RKpnm3aTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YD1hnpaRoBhksgl9GKp5Yi57caNTJYIa/BF5wqzOZt29gXw1HOCO/NpwosXoWiTNYTh1bt5Lo/LjxJek5xZg5KwA0XNmfO77OJCVPRSQNsNLDnnYQniE+hgC7XUgfd5h0+GeRoXmg0MTDoKYFmpI4LF4rhI8EZe/2uPS9EnrUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGG9JZCL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGG9JZCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708657242; x=1740193242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GapBaLW4b8UyKc+vk5KzzQa5CggRMiANa6RKpnm3aTA=;
  b=PGG9JZCL6bWk9rHLZhNVArrREjNHSqDHu991QLA+Psl3xSNN6Yj//mzs
   0t6FMFRN7o/umPEgqPfX9e9tvowqHEKSigSuJVPWASUB1c3cVGHRAT8I4
   D1qXg5Euc5YRNWVE7JTK6bRkFKNXLsDg5kI52el/ccgtX08cX7odV3p8Y
   2cJ2j6fAQrlauj40N6ZITi0LH/mScpRYpcGN9FUhCHbqFol4XmzeM3wBY
   jvnpY7HaqZ0ri0VRB4Ln/frZt/ju/SLuY6KCRmk11V0R8n97OJtU4wO53
   VPBzaEKVDIRMHAZ5e+2EiqRvHVDi4eaW0AJO2/d2UsVvEN2CjLdi4B8bg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3118420"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3118420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 19:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5778826"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2024 19:00:37 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdLnf-000708-1G;
	Fri, 23 Feb 2024 03:00:35 +0000
Date: Fri, 23 Feb 2024 11:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.c:4369:33: sparse: sparse: break/continue not in iterator
 scope
Message-ID: <202402231005.rCgl4hpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/vmscan.c:4369:33: sparse: sparse: break/continue not in iterator scope"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 06d37efeef4689ee10a610bbe91d85de62b88d6c mm: pagecache limit per cgroup support
date:   2 years, 4 months ago
:::::: branch date: 4 months ago
:::::: commit date: 2 years, 4 months ago
config: x86_64-randconfig-123-20240222 (https://download.01.org/0day-ci/archive/20240223/202402231005.rCgl4hpD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231005.rCgl4hpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402231005.rCgl4hpD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/vmscan.c:4356:71: sparse: sparse: Expected ; at end of statement
   mm/vmscan.c:4356:71: sparse: sparse: got {
>> mm/vmscan.c:4369:33: sparse: sparse: break/continue not in iterator scope
   mm/vmscan.c:4375:4: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4375:4: sparse: sparse: got :
>> mm/vmscan.c:4378:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   mm/vmscan.c:4378:16: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4378:16: sparse: sparse: got sc
   mm/vmscan.c:4379:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4379:1: sparse: sparse: got }
   mm/vmscan.c:4389:29: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4389:29: sparse: sparse: got (
>> mm/vmscan.c:4389:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   mm/vmscan.c:4392:15: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4392:15: sparse: sparse: got ;
>> mm/vmscan.c:4392:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   mm/vmscan.c:4392:19: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4392:19: sparse: sparse: got )
   mm/vmscan.c:4394:33: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4394:33: sparse: sparse: got &
   mm/vmscan.c:4396:21: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4396:21: sparse: sparse: got !
   mm/vmscan.c:4396:17: sparse: sparse: Trying to use reserved word 'if' as identifier
>> mm/vmscan.c:4398:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   mm/vmscan.c:4398:22: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4398:22: sparse: sparse: got {
>> mm/vmscan.c:4400:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   mm/vmscan.c:4401:17: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4401:17: sparse: sparse: got }
   mm/vmscan.c:4403:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4403:9: sparse: sparse: got }
   mm/vmscan.c:4405:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   mm/vmscan.c:4405:16: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4405:16: sparse: sparse: got 0
   mm/vmscan.c:4406:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4406:1: sparse: sparse: got }
   mm/vmscan.c:4412:9: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4412:9: sparse: sparse: got &
   mm/vmscan.c:4413:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4413:1: sparse: sparse: got }
   mm/vmscan.c:4420:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   mm/vmscan.c:4421:25: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4421:25: sparse: sparse: got wakeup_kpclimitd
   mm/vmscan.c:4422:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4422:9: sparse: sparse: got }
   mm/vmscan.c:4430:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   mm/vmscan.c:4430:16: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4430:16: sparse: sparse: got 0
   mm/vmscan.c:4431:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4431:1: sparse: sparse: got }
   mm/vmscan.c:4441:9: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4441:9: sparse: sparse: got (
   mm/vmscan.c:4441:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   mm/vmscan.c:4441:9: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4441:9: sparse: sparse: got <
   mm/vmscan.c:4441:9: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4441:9: sparse: sparse: got )
   mm/vmscan.c:4447:21: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4447:21: sparse: sparse: got (
   mm/vmscan.c:4447:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   mm/vmscan.c:4450:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4450:9: sparse: sparse: got }
   mm/vmscan.c:4452:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4452:1: sparse: sparse: got }
   mm/vmscan.c:4463:18: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4463:18: sparse: sparse: got ->
   mm/vmscan.c:4463:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   mm/vmscan.c:4466:14: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4466:14: sparse: sparse: got ->
   mm/vmscan.c:4466:25: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4466:25: sparse: sparse: got !
   mm/vmscan.c:4466:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   mm/vmscan.c:4466:25: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4466:25: sparse: sparse: got }
   mm/vmscan.c:4467:19: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4467:19: sparse: sparse: got (
   mm/vmscan.c:4467:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   mm/vmscan.c:4469:17: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4469:17: sparse: sparse: got }
>> mm/vmscan.c:4469:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   mm/vmscan.c:4469:17: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4469:17: sparse: sparse: got {
   mm/vmscan.c:4469:17: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4469:17: sparse: sparse: got }
   mm/vmscan.c:4469:17: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4469:17: sparse: sparse: got }
   mm/vmscan.c:4469:17: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4469:17: sparse: sparse: got }
   mm/vmscan.c:4469:17: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4469:17: sparse: sparse: got }
   mm/vmscan.c:4470:17: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4470:17: sparse: sparse: got "001"
   mm/vmscan.c:4472:22: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4472:22: sparse: sparse: got ->
   mm/vmscan.c:4473:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4473:9: sparse: sparse: got }
   mm/vmscan.c:4475:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4475:1: sparse: sparse: got }
   mm/vmscan.c:4485:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> mm/vmscan.c:4485:13: sparse: sparse: missing type declaration for parameter 'kswapd'
   mm/vmscan.c:4489:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4489:1: sparse: sparse: got }
   mm/vmscan.c:4496:9: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4496:9: sparse: sparse: got (
   mm/vmscan.c:4496:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   mm/vmscan.c:4496:9: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4496:9: sparse: sparse: got <
   mm/vmscan.c:4496:9: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4496:9: sparse: sparse: got )
   mm/vmscan.c:4501:9: sparse: sparse: Expected ) in nested declarator
   mm/vmscan.c:4501:9: sparse: sparse: got {
   mm/vmscan.c:4501:9: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4501:9: sparse: sparse: got (
   mm/vmscan.c:4501:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   mm/vmscan.c:4501:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4501:9: sparse: sparse: got }
   mm/vmscan.c:4501:9: sparse: sparse: Expected ) in nested declarator
   mm/vmscan.c:4501:9: sparse: sparse: got {
   mm/vmscan.c:4501:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4501:9: sparse: sparse: got }
   mm/vmscan.c:4501:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4501:9: sparse: sparse: got }
   mm/vmscan.c:4501:9: sparse: sparse: Expected ) in function declarator
   mm/vmscan.c:4501:9: sparse: sparse: got !
   mm/vmscan.c:4501:9: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4501:9: sparse: sparse: got }
   mm/vmscan.c:4502:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   mm/vmscan.c:4502:16: sparse: sparse: Expected ; at end of declaration
   mm/vmscan.c:4502:16: sparse: sparse: got 0
   mm/vmscan.c:4503:1: sparse: sparse: Expected ; at the end of type declaration
   mm/vmscan.c:4503:1: sparse: sparse: got }
>> mm/vmscan.c:4318:17: sparse: sparse: label 'out' was not declared
   mm/vmscan.c:4350:33: sparse: sparse: label 'out' was not declared
   mm/vmscan.c:4356:33: sparse: sparse: undefined identifier 'for_each_mem_cgroup_tree'
   mm/vmscan.c:4363:33: sparse: sparse: label 'out' was not declared
   mm/vmscan.c:4384:9: sparse: sparse: symbol 'kpclimitd_context' has multiple initializers (originally initialized at mm/vmscan.c:176)
   mm/vmscan.c:4384:9: sparse: sparse: symbol 'kpclimitd_context' redeclared with different type (different type sizes):
   mm/vmscan.c:4384:9: sparse:    int static [toplevel] kpclimitd_context
   mm/vmscan.c:176:13: sparse: note: previously declared as:
   mm/vmscan.c:176:13: sparse:    bool static [toplevel] [usertype] kpclimitd_context
   mm/vmscan.c:4445:40: sparse: sparse: undefined identifier 'pgdat'
   mm/vmscan.c:4445:17: sparse: sparse: symbol 'mask' redeclared with different type (different base types):
   mm/vmscan.c:4445:17: sparse:    int [addressable] [toplevel] mask
   mm/vmscan.c:4443:38: sparse: note: previously declared as:
   mm/vmscan.c:4443:38: sparse:    struct cpumask const *[addressable] [toplevel] mask
>> mm/vmscan.c:4471:36: sparse: sparse: cannot dereference this type
   mm/vmscan.c:4471:17: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at mm/vmscan.c:4461)
   mm/vmscan.c:4496:9: sparse: sparse: symbol 'nid' has multiple initializers (originally initialized at mm/vmscan.c:4441)
   mm/vmscan.c:4499:61: sparse: sparse: undefined identifier 'kswapd_cpu_online'
   mm/vmscan.c:4498:9: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at mm/vmscan.c:4471)
   mm/vmscan.c:4514:21: sparse: sparse: undefined identifier 'kpagecache_limitd'
>> mm/vmscan.c:4516:17: sparse: sparse: too many arguments for function printk
>> mm/vmscan.c:4601:13: sparse: sparse: too many arguments for function __builtin_expect

vim +4369 mm/vmscan.c

^590eaf1fec755 Kaixu Xia    2021-03-16  4308  
^590eaf1fec755 Kaixu Xia    2021-03-16  4309  	/*
^590eaf1fec755 Kaixu Xia    2021-03-16  4310  	 * Return early if there's no work to do.
^590eaf1fec755 Kaixu Xia    2021-03-16  4311  	 * Wake up reclaimers that couldn't scan any zone due to congestion.
^590eaf1fec755 Kaixu Xia    2021-03-16  4312  	 * There is apparently nothing to do so they do not have to sleep.
^590eaf1fec755 Kaixu Xia    2021-03-16  4313  	 * This makes sure that no sleeping reclaimer will stay behind.
^590eaf1fec755 Kaixu Xia    2021-03-16  4314  	 * Allow breaching the limit if the task is on the way out.
^590eaf1fec755 Kaixu Xia    2021-03-16  4315  	 */
06d37efeef4689 linuszeng    2021-10-08  4316  	if (nr_pages == 0 || fatal_signal_pending(current)) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4317  		wake_up_interruptible(&pagecache_reclaim_wq);
^590eaf1fec755 Kaixu Xia    2021-03-16 @4318  		goto out;
^590eaf1fec755 Kaixu Xia    2021-03-16  4319  	}
^590eaf1fec755 Kaixu Xia    2021-03-16  4320  
^590eaf1fec755 Kaixu Xia    2021-03-16  4321  	/* But do a few at least */
^590eaf1fec755 Kaixu Xia    2021-03-16  4322  	nr_pages = max_t(unsigned long, nr_pages, 8*SWAP_CLUSTER_MAX);
^590eaf1fec755 Kaixu Xia    2021-03-16  4323  
^590eaf1fec755 Kaixu Xia    2021-03-16  4324  	current->reclaim_state = &reclaim_state;
^590eaf1fec755 Kaixu Xia    2021-03-16  4325  
^590eaf1fec755 Kaixu Xia    2021-03-16  4326  	/*
^590eaf1fec755 Kaixu Xia    2021-03-16  4327  	 * Shrink the LRU in 4 passes:
^590eaf1fec755 Kaixu Xia    2021-03-16  4328  	 * 0 = Reclaim from inactive_list only (fast)
^590eaf1fec755 Kaixu Xia    2021-03-16  4329  	 * 1 = Reclaim from active list but don't reclaim mapped and dirtied (not that fast)
^590eaf1fec755 Kaixu Xia    2021-03-16  4330  	 * 2 = Reclaim from active list but don't reclaim mapped (2nd pass)
^590eaf1fec755 Kaixu Xia    2021-03-16  4331  	 * it may reclaim dirtied if  vm_pagecache_ignore_dirty = 0
^590eaf1fec755 Kaixu Xia    2021-03-16  4332  	 * 3 = same as pass 2, but it will reclaim some few pages , detail in shrink_all_zones
^590eaf1fec755 Kaixu Xia    2021-03-16  4333  	 */
^590eaf1fec755 Kaixu Xia    2021-03-16  4334  	for (; pass <= 3; pass++) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4335  		for (sc.priority = DEF_PRIORITY; sc.priority >= 0; sc.priority--) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4336  			unsigned long nr_to_scan = nr_pages - ret;
^590eaf1fec755 Kaixu Xia    2021-03-16  4337  			int nid;
^590eaf1fec755 Kaixu Xia    2021-03-16  4338  
^590eaf1fec755 Kaixu Xia    2021-03-16  4339  			sc.nr_scanned = 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4340  
^590eaf1fec755 Kaixu Xia    2021-03-16  4341  			/*
^590eaf1fec755 Kaixu Xia    2021-03-16  4342  			 * No zone reclaimed because of too many reclaimers. Retry whether
^590eaf1fec755 Kaixu Xia    2021-03-16  4343  			 * there is still something to do
^590eaf1fec755 Kaixu Xia    2021-03-16  4344  			 */
^590eaf1fec755 Kaixu Xia    2021-03-16  4345  			if (!shrink_all_zones(nr_to_scan, pass, &sc))
^590eaf1fec755 Kaixu Xia    2021-03-16  4346  				goto retry;
^590eaf1fec755 Kaixu Xia    2021-03-16  4347  
^590eaf1fec755 Kaixu Xia    2021-03-16  4348  			ret += sc.nr_reclaimed;
^590eaf1fec755 Kaixu Xia    2021-03-16  4349  			if (ret >= nr_pages)
^590eaf1fec755 Kaixu Xia    2021-03-16  4350  				goto out;
^590eaf1fec755 Kaixu Xia    2021-03-16  4351  
^590eaf1fec755 Kaixu Xia    2021-03-16  4352  			reclaim_state.reclaimed_slab = 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4353  			for_each_online_node(nid) {
06d37efeef4689 linuszeng    2021-10-08  4354  				struct mem_cgroup *iter;
4961ab8f2a8cbb Chunguang Xu 2021-04-27  4355  
06d37efeef4689 linuszeng    2021-10-08 @4356  				for_each_mem_cgroup_tree(iter, memcg) {
06d37efeef4689 linuszeng    2021-10-08  4357  					shrink_slab(mask, nid, iter, sc.priority);
06d37efeef4689 linuszeng    2021-10-08  4358  				}
^590eaf1fec755 Kaixu Xia    2021-03-16  4359  			}
^590eaf1fec755 Kaixu Xia    2021-03-16  4360  			ret += reclaim_state.reclaimed_slab;
^590eaf1fec755 Kaixu Xia    2021-03-16  4361  
^590eaf1fec755 Kaixu Xia    2021-03-16  4362  			if (ret >= nr_pages)
^590eaf1fec755 Kaixu Xia    2021-03-16  4363  				goto out;
^590eaf1fec755 Kaixu Xia    2021-03-16  4364  
^590eaf1fec755 Kaixu Xia    2021-03-16  4365  		}
^590eaf1fec755 Kaixu Xia    2021-03-16  4366  		if (pass == 1) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4367  			if (vm_pagecache_ignore_dirty == 1 ||
^590eaf1fec755 Kaixu Xia    2021-03-16  4368  			    (mask & (__GFP_IO | __GFP_FS)) != (__GFP_IO | __GFP_FS) )
^590eaf1fec755 Kaixu Xia    2021-03-16 @4369  				break;
^590eaf1fec755 Kaixu Xia    2021-03-16  4370  			else
^590eaf1fec755 Kaixu Xia    2021-03-16  4371  				sc.may_writepage = 1;
^590eaf1fec755 Kaixu Xia    2021-03-16  4372  		}
^590eaf1fec755 Kaixu Xia    2021-03-16  4373  	}
^590eaf1fec755 Kaixu Xia    2021-03-16  4374  
^590eaf1fec755 Kaixu Xia    2021-03-16 @4375  out:
^590eaf1fec755 Kaixu Xia    2021-03-16  4376  	current->reclaim_state = old_rs;
06d37efeef4689 linuszeng    2021-10-08  4377  
06d37efeef4689 linuszeng    2021-10-08 @4378  	return sc.nr_reclaimed;
^590eaf1fec755 Kaixu Xia    2021-03-16  4379  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4380  
^590eaf1fec755 Kaixu Xia    2021-03-16  4381  static int kpagecache_limitd(void *data)
^590eaf1fec755 Kaixu Xia    2021-03-16  4382  {
^590eaf1fec755 Kaixu Xia    2021-03-16  4383  	DEFINE_WAIT(wait);
^590eaf1fec755 Kaixu Xia    2021-03-16 @4384  	kpclimitd_context = true;
^590eaf1fec755 Kaixu Xia    2021-03-16  4385  
^590eaf1fec755 Kaixu Xia    2021-03-16  4386  	/*
^590eaf1fec755 Kaixu Xia    2021-03-16  4387  	 * make sure all work threads woken up, when switch to async mode
^590eaf1fec755 Kaixu Xia    2021-03-16  4388  	*/
^590eaf1fec755 Kaixu Xia    2021-03-16 @4389  	if (waitqueue_active(&pagecache_reclaim_wq))
^590eaf1fec755 Kaixu Xia    2021-03-16  4390  		wake_up_interruptible(&pagecache_reclaim_wq);
^590eaf1fec755 Kaixu Xia    2021-03-16  4391  
^590eaf1fec755 Kaixu Xia    2021-03-16 @4392  	for ( ; ; ) {
06d37efeef4689 linuszeng    2021-10-08  4393  		__shrink_page_cache(GFP_KERNEL, NULL, pagecache_over_limit());
^590eaf1fec755 Kaixu Xia    2021-03-16  4394  		prepare_to_wait(&kpagecache_limitd_wq, &wait, TASK_INTERRUPTIBLE);
^590eaf1fec755 Kaixu Xia    2021-03-16  4395  
^590eaf1fec755 Kaixu Xia    2021-03-16  4396  		if (!kthread_should_stop())
^590eaf1fec755 Kaixu Xia    2021-03-16  4397  			schedule();
^590eaf1fec755 Kaixu Xia    2021-03-16 @4398  		else {
^590eaf1fec755 Kaixu Xia    2021-03-16  4399  			finish_wait(&kpagecache_limitd_wq, &wait);
^590eaf1fec755 Kaixu Xia    2021-03-16 @4400  			break;
^590eaf1fec755 Kaixu Xia    2021-03-16  4401  		}
^590eaf1fec755 Kaixu Xia    2021-03-16  4402  		finish_wait(&kpagecache_limitd_wq, &wait);
^590eaf1fec755 Kaixu Xia    2021-03-16  4403  	}
^590eaf1fec755 Kaixu Xia    2021-03-16  4404  	kpclimitd_context = false;
^590eaf1fec755 Kaixu Xia    2021-03-16  4405  	return 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4406  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4407  
^590eaf1fec755 Kaixu Xia    2021-03-16  4408  static void wakeup_kpclimitd(gfp_t mask)
^590eaf1fec755 Kaixu Xia    2021-03-16  4409  {
^590eaf1fec755 Kaixu Xia    2021-03-16  4410  	if (!waitqueue_active(&kpagecache_limitd_wq))
^590eaf1fec755 Kaixu Xia    2021-03-16  4411  		return;
^590eaf1fec755 Kaixu Xia    2021-03-16  4412  	wake_up_interruptible(&kpagecache_limitd_wq);
^590eaf1fec755 Kaixu Xia    2021-03-16  4413  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4414  
^590eaf1fec755 Kaixu Xia    2021-03-16  4415  void shrink_page_cache(gfp_t mask, struct page *page)
^590eaf1fec755 Kaixu Xia    2021-03-16  4416  {
06d37efeef4689 linuszeng    2021-10-08  4417  	if (vm_pagecache_limit_global) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4418  		if (0 == vm_pagecache_limit_async)
06d37efeef4689 linuszeng    2021-10-08  4419  			__shrink_page_cache(mask, NULL, pagecache_over_limit());
^590eaf1fec755 Kaixu Xia    2021-03-16  4420  		else
^590eaf1fec755 Kaixu Xia    2021-03-16  4421  			wakeup_kpclimitd(mask);
^590eaf1fec755 Kaixu Xia    2021-03-16  4422  	}
06d37efeef4689 linuszeng    2021-10-08  4423  }
06d37efeef4689 linuszeng    2021-10-08  4424  
06d37efeef4689 linuszeng    2021-10-08  4425  unsigned long shrink_page_cache_memcg(gfp_t mask, struct mem_cgroup *memcg, unsigned long nr_pages)
06d37efeef4689 linuszeng    2021-10-08  4426  {
06d37efeef4689 linuszeng    2021-10-08  4427  	if (!vm_pagecache_limit_global)
06d37efeef4689 linuszeng    2021-10-08  4428  		return  __shrink_page_cache(mask, memcg, nr_pages);
06d37efeef4689 linuszeng    2021-10-08  4429  
06d37efeef4689 linuszeng    2021-10-08  4430  	return 0;
06d37efeef4689 linuszeng    2021-10-08  4431  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4432  
^590eaf1fec755 Kaixu Xia    2021-03-16  4433  /* It's optimal to keep kswapds on the same CPUs as their memory, but
^590eaf1fec755 Kaixu Xia    2021-03-16  4434     not required for correctness.  So if the last cpu in a node goes
^590eaf1fec755 Kaixu Xia    2021-03-16  4435     away, we get changed to run anywhere: as the first one comes back,
^590eaf1fec755 Kaixu Xia    2021-03-16  4436     restore their cpu bindings. */
^590eaf1fec755 Kaixu Xia    2021-03-16  4437  static int kswapd_cpu_online(unsigned int cpu)
^590eaf1fec755 Kaixu Xia    2021-03-16  4438  {
^590eaf1fec755 Kaixu Xia    2021-03-16  4439  	int nid;
^590eaf1fec755 Kaixu Xia    2021-03-16  4440  
^590eaf1fec755 Kaixu Xia    2021-03-16  4441  	for_each_node_state(nid, N_MEMORY) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4442  		pg_data_t *pgdat = NODE_DATA(nid);
^590eaf1fec755 Kaixu Xia    2021-03-16 @4443  		const struct cpumask *mask;
^590eaf1fec755 Kaixu Xia    2021-03-16  4444  
^590eaf1fec755 Kaixu Xia    2021-03-16 @4445  		mask = cpumask_of_node(pgdat->node_id);
^590eaf1fec755 Kaixu Xia    2021-03-16  4446  
^590eaf1fec755 Kaixu Xia    2021-03-16  4447  		if (cpumask_any_and(cpu_online_mask, mask) < nr_cpu_ids)
^590eaf1fec755 Kaixu Xia    2021-03-16  4448  			/* One of our CPUs online: restore mask */
^590eaf1fec755 Kaixu Xia    2021-03-16  4449  			set_cpus_allowed_ptr(pgdat->kswapd, mask);
^590eaf1fec755 Kaixu Xia    2021-03-16  4450  	}
^590eaf1fec755 Kaixu Xia    2021-03-16  4451  	return 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4452  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4453  
^590eaf1fec755 Kaixu Xia    2021-03-16  4454  /*
^590eaf1fec755 Kaixu Xia    2021-03-16  4455   * This kswapd start function will be called by init and node-hot-add.
^590eaf1fec755 Kaixu Xia    2021-03-16  4456   * On node-hot-add, kswapd will moved to proper cpus if cpus are hot-added.
^590eaf1fec755 Kaixu Xia    2021-03-16  4457   */
^590eaf1fec755 Kaixu Xia    2021-03-16  4458  int kswapd_run(int nid)
^590eaf1fec755 Kaixu Xia    2021-03-16  4459  {
^590eaf1fec755 Kaixu Xia    2021-03-16  4460  	pg_data_t *pgdat = NODE_DATA(nid);
^590eaf1fec755 Kaixu Xia    2021-03-16  4461  	int ret = 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4462  
^590eaf1fec755 Kaixu Xia    2021-03-16  4463  	if (pgdat->kswapd)
^590eaf1fec755 Kaixu Xia    2021-03-16  4464  		return 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4465  
^590eaf1fec755 Kaixu Xia    2021-03-16 @4466  	pgdat->kswapd = kthread_run(kswapd, pgdat, "kswapd%d", nid);
^590eaf1fec755 Kaixu Xia    2021-03-16  4467  	if (IS_ERR(pgdat->kswapd)) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4468  		/* failure at boot is fatal */
^590eaf1fec755 Kaixu Xia    2021-03-16 @4469  		BUG_ON(system_state < SYSTEM_RUNNING);
^590eaf1fec755 Kaixu Xia    2021-03-16 @4470  		pr_err("Failed to start kswapd on node %d\n", nid);
^590eaf1fec755 Kaixu Xia    2021-03-16 @4471  		ret = PTR_ERR(pgdat->kswapd);
^590eaf1fec755 Kaixu Xia    2021-03-16  4472  		pgdat->kswapd = NULL;
^590eaf1fec755 Kaixu Xia    2021-03-16  4473  	}
^590eaf1fec755 Kaixu Xia    2021-03-16  4474  	return ret;
^590eaf1fec755 Kaixu Xia    2021-03-16  4475  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4476  
^590eaf1fec755 Kaixu Xia    2021-03-16  4477  /*
^590eaf1fec755 Kaixu Xia    2021-03-16  4478   * Called by memory hotplug when all memory in a node is offlined.  Caller must
^590eaf1fec755 Kaixu Xia    2021-03-16  4479   * hold mem_hotplug_begin/end().
^590eaf1fec755 Kaixu Xia    2021-03-16  4480   */
^590eaf1fec755 Kaixu Xia    2021-03-16  4481  void kswapd_stop(int nid)
^590eaf1fec755 Kaixu Xia    2021-03-16  4482  {
^590eaf1fec755 Kaixu Xia    2021-03-16  4483  	struct task_struct *kswapd = NODE_DATA(nid)->kswapd;
^590eaf1fec755 Kaixu Xia    2021-03-16  4484  
^590eaf1fec755 Kaixu Xia    2021-03-16 @4485  	if (kswapd) {
^590eaf1fec755 Kaixu Xia    2021-03-16  4486  		kthread_stop(kswapd);
^590eaf1fec755 Kaixu Xia    2021-03-16  4487  		NODE_DATA(nid)->kswapd = NULL;
^590eaf1fec755 Kaixu Xia    2021-03-16  4488  	}
^590eaf1fec755 Kaixu Xia    2021-03-16  4489  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4490  
^590eaf1fec755 Kaixu Xia    2021-03-16  4491  static int __init kswapd_init(void)
^590eaf1fec755 Kaixu Xia    2021-03-16  4492  {
^590eaf1fec755 Kaixu Xia    2021-03-16  4493  	int nid, ret;
^590eaf1fec755 Kaixu Xia    2021-03-16  4494  
^590eaf1fec755 Kaixu Xia    2021-03-16  4495  	swap_setup();
^590eaf1fec755 Kaixu Xia    2021-03-16  4496  	for_each_node_state(nid, N_MEMORY)
^590eaf1fec755 Kaixu Xia    2021-03-16  4497   		kswapd_run(nid);
^590eaf1fec755 Kaixu Xia    2021-03-16  4498  	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
^590eaf1fec755 Kaixu Xia    2021-03-16  4499  					"mm/vmscan:online", kswapd_cpu_online,
^590eaf1fec755 Kaixu Xia    2021-03-16  4500  					NULL);
^590eaf1fec755 Kaixu Xia    2021-03-16 @4501  	WARN_ON(ret < 0);
^590eaf1fec755 Kaixu Xia    2021-03-16  4502  	return 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4503  }
^590eaf1fec755 Kaixu Xia    2021-03-16  4504  
^590eaf1fec755 Kaixu Xia    2021-03-16  4505  module_init(kswapd_init)
^590eaf1fec755 Kaixu Xia    2021-03-16  4506  
^590eaf1fec755 Kaixu Xia    2021-03-16  4507  int kpagecache_limitd_run(void)
^590eaf1fec755 Kaixu Xia    2021-03-16  4508  {
^590eaf1fec755 Kaixu Xia    2021-03-16  4509  	int ret = 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4510  
^590eaf1fec755 Kaixu Xia    2021-03-16  4511  	if (kpclimitd)
^590eaf1fec755 Kaixu Xia    2021-03-16  4512  		return 0;
^590eaf1fec755 Kaixu Xia    2021-03-16  4513  
^590eaf1fec755 Kaixu Xia    2021-03-16  4514  	kpclimitd = kthread_run(kpagecache_limitd, NULL, "kpclimitd");
^590eaf1fec755 Kaixu Xia    2021-03-16  4515  	if (IS_ERR(kpclimitd)) {
^590eaf1fec755 Kaixu Xia    2021-03-16 @4516  		pr_err("Failed to start kpagecache_limitd thread\n");
^590eaf1fec755 Kaixu Xia    2021-03-16  4517  		ret = PTR_ERR(kpclimitd);
^590eaf1fec755 Kaixu Xia    2021-03-16  4518  		kpclimitd = NULL;
^590eaf1fec755 Kaixu Xia    2021-03-16  4519  	}
^590eaf1fec755 Kaixu Xia    2021-03-16  4520  	return ret;
^590eaf1fec755 Kaixu Xia    2021-03-16  4521  

:::::: The code at line 4369 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
