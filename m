Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A128399
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 01:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756516570; cv=none; b=eZVlooiIocGqQNZm+vFnx+eL3tEzg+zNxSG60Z1+6CMQXby8qlZw9M0wrq9pvbJS6szPmAJ0mNVXsVPRLo+DYfWGw6GX9eRpIkuMHSQpMxbcx9ntoTe7qeDi7CeIdQIOHx7+3RfZ25I1/p0c4FpMDui2fE3g0TOcDO+Blf9Sk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756516570; c=relaxed/simple;
	bh=o5TBRqvHpI/zSy3Z9II8z4S1ZV1JZAri+EtRKikDieA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6/jZZzYEe06l8b6OETkHojwz4KlCQums83A64PvdZI38ApTZgfB9sgnnf4EVRnDFhKE4+Jfc+QbXmbFuiLeqJWASvQBUJmg7yntNsHncGQPUdVLsKvfu48eZCzr6bk/aq5CTfuyzo2k7637kYgiL4fEDkM+LxfT3F+hb2tadAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIt9l6Ua; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIt9l6Ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756516565; x=1788052565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5TBRqvHpI/zSy3Z9II8z4S1ZV1JZAri+EtRKikDieA=;
  b=CIt9l6UavlY1RQ2BMsdBDS2aCCL5qc0q/0it3tFHGFi1dEwB6KgnagzN
   WlRusbzz9opmcXDNzsuncCzRcNhPyDyiuBWBywkvNgiYT7nzNrIAEbUnq
   nEPwvYgIkRhXxhXTge7HechRD+hBr+WIRka4rZ6JhZfrfMpxKkVQPmwml
   eVIRNIcP5ddRrFaX2eSYm0B1L/VK9dKod1lUfpAFSXYunKqjG9MiGo3M2
   5b2KCN4hxo7Pp8YXBdp5mi55m+aFxESKlCKz0aK0B4dly7adF6Cu6dYe0
   n7HdeURYSCxi4N/QFDIKQhdYSwieN+dPEW+lvxsulf2b77OasksBvK0tX
   w==;
X-CSE-ConnectionGUID: 5eOMC51VRia9yfQS1Gq/7g==
X-CSE-MsgGUID: h7Qa1jHjQUiqQO/uAxhcMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70177377"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70177377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 18:16:04 -0700
X-CSE-ConnectionGUID: JFZFBKiATbeZQoWEBmCQEg==
X-CSE-MsgGUID: bDc9I2W+To2r92oGr1AFbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="169805436"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2025 18:16:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usAC2-000V63-1P;
	Sat, 30 Aug 2025 01:15:54 +0000
Date: Sat, 30 Aug 2025 09:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4756/5283] kernel/fork.c:457
 account_kernel_stack() warn: we never enter this loop
Message-ID: <202508300929.TrRovUMu-lkp@intel.com>
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
TO: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cace99d63192a7250461b058279a42d91075d0c
commit: e0aa7237ef4323a66ed06953225d9b07cf039530 [4756/5283] mm: tag kernel stack pages
:::::: branch date: 20 hours ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r072-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300929.TrRovUMu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508300929.TrRovUMu-lkp@intel.com/

smatch warnings:
kernel/fork.c:457 account_kernel_stack() warn: we never enter this loop
kernel/fork.c:457 account_kernel_stack() warn: unsigned 'i' is never less than zero.
kernel/fork.c:457 account_kernel_stack() warn: unsigned 'i' is never less than zero.
kernel/fork.c:479 exit_task_stack_account() warn: we never enter this loop
kernel/fork.c:479 exit_task_stack_account() warn: unsigned 'i' is never less than zero.
kernel/fork.c:479 exit_task_stack_account() warn: unsigned 'i' is never less than zero.

vim +457 kernel/fork.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  436  
ba14a194a434cc Andy Lutomirski           2016-08-11  437  static void account_kernel_stack(struct task_struct *tsk, int account)
c6a7f5728a1db4 KOSAKI Motohiro           2009-09-21  438  {
0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  439  	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  440  		struct vm_struct *vm_area = task_stack_vm_area(tsk);
27faca83a7e955 Muchun Song               2021-04-29  441  		int i;
efdc94907977d2 Andy Lutomirski           2016-07-28  442  
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  443) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  444  			mod_lruvec_page_state(vm_area->pages[i], NR_KERNEL_STACK_KB,
27faca83a7e955 Muchun Song               2021-04-29  445  					      account * (PAGE_SIZE / 1024));
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  446) 			__SetPageStack(vm_area->pages[i]);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  447) 		}
27faca83a7e955 Muchun Song               2021-04-29  448  	} else {
0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  449  		void *stack = task_stack_page(tsk);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  450) 		struct page *page = virt_to_head_page(stack);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  451) 		int i;
0ce055f85335e4 Sebastian Andrzej Siewior 2022-02-17  452  
991e7673859ed4 Shakeel Butt              2020-08-06  453  		/* All stack pages are in the same node. */
da3ceeff923e3b Muchun Song               2020-12-14  454  		mod_lruvec_kmem_state(stack, NR_KERNEL_STACK_KB,
efdc94907977d2 Andy Lutomirski           2016-07-28  455  				      account * (THREAD_SIZE / 1024));
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  456) 
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20 @457) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++, page++)
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  458) 			__SetPageStack(page);
ba14a194a434cc Andy Lutomirski           2016-08-11  459  	}
27faca83a7e955 Muchun Song               2021-04-29  460  }
c6a7f5728a1db4 KOSAKI Motohiro           2009-09-21  461  
1a03d3f13ffe5d Sebastian Andrzej Siewior 2022-02-17  462  void exit_task_stack_account(struct task_struct *tsk)
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  463  {
1a03d3f13ffe5d Sebastian Andrzej Siewior 2022-02-17  464  	account_kernel_stack(tsk, -1);
991e7673859ed4 Shakeel Butt              2020-08-06  465  
1a03d3f13ffe5d Sebastian Andrzej Siewior 2022-02-17  466  	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  467  		struct vm_struct *vm_area;
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  468  		int i;
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  469  
449e0b4ed5a16c Pasha Tatashin            2025-05-09  470  		vm_area = task_stack_vm_area(tsk);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  471) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
449e0b4ed5a16c Pasha Tatashin            2025-05-09  472  			memcg_kmem_uncharge_page(vm_area->pages[i], 0);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  473) 			__ClearPageStack(vm_area->pages[i]);
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  474) 		}
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  475) 	} else {
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  476) 		struct page *page = virt_to_head_page(task_stack_page(tsk));
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  477) 		int i;
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  478) 
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20 @479) 		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++, page++)
e0aa7237ef4323 Vishal Moola (Oracle      2025-08-20  480) 			__ClearPageStack(page);
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  481  	}
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  482  }
9b6f7e163cd0f4 Roman Gushchin            2018-10-26  483  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
