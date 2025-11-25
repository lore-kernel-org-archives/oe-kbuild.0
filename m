Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60E1531C1
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 00:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029978; cv=none; b=M3+IZH1gbLKoyFDApY07js5nguMfigu1dKapeJ4JkGM1+HzdQYqPgyob9Vqv9IYpaKVGMa8rd3hAYpseLMD2Vvs2wolBiiMmRsO0PIINkt/AkW8/wfrdyh6suMK7SbrmrilIeSTWrshGHy9j4FVi0k+XeN3VWGTI6hUAJHgMk8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029978; c=relaxed/simple;
	bh=/8Y+n29OH1A8tPU4/IvccmZtkp71aLovJWg7Xy4ESPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiS4SoGGznm83vIeEn/Jzuk9cqLf3Vvqqu6omaPBrZVQbAf6rJKGvHfCxmNhghwUk6FkYMLvXjDnS6TzMYWB7VLbWQ+r1x3+5ZqqvQonFtVc0eepwynM6TNmzLSCKr2IZTW5NVtksRoPHIRN+I+U9EWJiM3TWAAYlX18BXY4fMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3A4T+An; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3A4T+An"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764029977; x=1795565977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/8Y+n29OH1A8tPU4/IvccmZtkp71aLovJWg7Xy4ESPs=;
  b=n3A4T+AnQZbSAznSjV8FCiHlNHIzXunYKo/Nyf23Z0tdiu+Pgo9GVaKe
   L2JzuMxDQFZPL5/1eH+oSIlnpEXYTtYwjPbEwiTESeJFCoHgj1l9jBqYX
   ifLds40zZ7JBX/3cQRg/pemuxR8kaL/qNPyfW7z8RuQy8lvCwhMYw6qtJ
   jf4jLJ6f0jG/QGl4g4pMDUsvE1zbi13oI2w/BJ2MRGwXyc8Qlh1Advw8b
   +0uGzzXEm7lMi975y4UfBN172jwnVeAfa/Rht3fjMbY4Q5T6x4JAQGcrJ
   xvMXH7SrMqo6OP1ukwWF/eaMwZKi30V0OPG6AWe+M9m1IGi1JuMNFtHki
   w==;
X-CSE-ConnectionGUID: Eb+RsBkVTb+OR5lC5a5okw==
X-CSE-MsgGUID: 9Z5fu2LWQlGfV1kpPL3RuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69899198"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="69899198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 16:19:36 -0800
X-CSE-ConnectionGUID: gLiqsVMWQK+HPrAOUa8I+g==
X-CSE-MsgGUID: 8L7c49eySliXafzGRqNUjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192564558"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 24 Nov 2025 16:19:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNgmK-000000000MD-2li9;
	Tue, 25 Nov 2025 00:19:32 +0000
Date: Tue, 25 Nov 2025 01:18:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] mm/memory.c:1807:22: warning:
 variable 'mapped_pte' set but not used
Message-ID: <202511250100.9VNeAX9M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 67a982ee20d20e112f15eff98592a718de7c652e [5/5] mm/memory.c: fix potential pte_unmap_unlock pte error
:::::: branch date: 14 hours ago
:::::: commit date: 4 years, 9 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511250100.9VNeAX9M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250100.9VNeAX9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511250100.9VNeAX9M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'copy_pte_range':
   mm/memory.c:800:31: warning: variable 'orig_dst_pte' set but not used [-Wunused-but-set-variable]
     800 |         pte_t *orig_src_pte, *orig_dst_pte;
         |                               ^~~~~~~~~~~~
   mm/memory.c:800:16: warning: variable 'orig_src_pte' set but not used [-Wunused-but-set-variable]
     800 |         pte_t *orig_src_pte, *orig_dst_pte;
         |                ^~~~~~~~~~~~
   mm/memory.c: In function 'remap_pte_range':
>> mm/memory.c:1807:22: warning: variable 'mapped_pte' set but not used [-Wunused-but-set-variable]
    1807 |         pte_t *pte, *mapped_pte;
         |                      ^~~~~~~~~~


vim +/mapped_pte +1807 mm/memory.c

b2770da6425406 Ross Zwisler   2017-09-06  1797  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1798  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  1799   * maps a range of physical memory into the requested pages. the old
^1da177e4c3f41 Linus Torvalds 2005-04-16  1800   * mappings are removed. any references to nonexistent pages results
^1da177e4c3f41 Linus Torvalds 2005-04-16  1801   * in null mappings (currently treated as "copy-on-access")
^1da177e4c3f41 Linus Torvalds 2005-04-16  1802   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1803  static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
^1da177e4c3f41 Linus Torvalds 2005-04-16  1804  			unsigned long addr, unsigned long end,
^1da177e4c3f41 Linus Torvalds 2005-04-16  1805  			unsigned long pfn, pgprot_t prot)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1806  {
67a982ee20d20e Miaohe Lin     2021-02-24 @1807  	pte_t *pte, *mapped_pte;
c74df32c724a16 Hugh Dickins   2005-10-29  1808  	spinlock_t *ptl;
42e4089c789072 Andi Kleen     2018-06-13  1809  	int err = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1810  
67a982ee20d20e Miaohe Lin     2021-02-24  1811  	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1812  	if (!pte)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1813  		return -ENOMEM;
6606c3e0da5360 Zachary Amsden 2006-09-30  1814  	arch_enter_lazy_mmu_mode();
^1da177e4c3f41 Linus Torvalds 2005-04-16  1815  	do {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1816  		BUG_ON(!pte_none(*pte));
42e4089c789072 Andi Kleen     2018-06-13  1817  		if (!pfn_modify_allowed(pfn, prot)) {
42e4089c789072 Andi Kleen     2018-06-13  1818  			err = -EACCES;
42e4089c789072 Andi Kleen     2018-06-13  1819  			break;
42e4089c789072 Andi Kleen     2018-06-13  1820  		}
7e675137a8e1a4 Nick Piggin    2008-04-28  1821  		set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
^1da177e4c3f41 Linus Torvalds 2005-04-16  1822  		pfn++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1823  	} while (pte++, addr += PAGE_SIZE, addr != end);
6606c3e0da5360 Zachary Amsden 2006-09-30  1824  	arch_leave_lazy_mmu_mode();
67a982ee20d20e Miaohe Lin     2021-02-24  1825  	pte_unmap_unlock(mapped_pte, ptl);
42e4089c789072 Andi Kleen     2018-06-13  1826  	return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1827  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1828  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
