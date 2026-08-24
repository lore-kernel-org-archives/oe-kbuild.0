Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A92D38735D
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 19:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598927; cv=none; b=d29w+HEY1Yqerr5kD4zBBG4ur+OT0C6+/Z3L7yT/VGaysQ+aFsJxG0esBbqvr7wM7D6jXkMAw/lQkyzRdocyeAowc7Vh1pNg37bqZVPj32EtFk9nbCA6MrfHel5hF8suSmra1MMuxxfXXDLhhXz7JqbxWWDj/0n1EGIan/uYqWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598927; c=relaxed/simple;
	bh=CsB5JlHWRNAop2Ja9Yy+eoRg3+mc1rIS5OvpjHGUCpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRPJZ9CDtlWeZArexqy0DFCIOVXhbEE71hMU1G3GTghn3mcp3zvNJCLieCBtLtadcp2FU8+88sA5kvyTAHXJp4I7IAed9HdrYYBhhcJJ8/678igLQ/K+NlnoPS7hnmzonF/Gk0fT25fyPtsPslwl89ds+wELnTMae/b/si7ncgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atuJQyXA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atuJQyXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598926; x=1819134926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CsB5JlHWRNAop2Ja9Yy+eoRg3+mc1rIS5OvpjHGUCpw=;
  b=atuJQyXAmgYuj+Kcjftf1awN84z2zm1VS5NjIBT+JYjkXDmcl+IB9NFV
   1c6m6Vn3Ce3oFELqSYm6Q//gvq8cGtVDVm+rQ2DxS5nnrec4qnw2WSYmx
   vNGwOnz04Ys7jlLMipeAq5qxsyL7csWhAksRvum3DwJjOL4eqFIRRCmuy
   h6SsRNlQJgFg94u8TXDxU3nBOI4XfPVj4c41crHHZ1Xl/f6+atkOwBUZp
   aITWXKvBlp5ZFRcAz0qsPsZRUhOe75nbwn6XQC+sJR8+WvF7z9w1nNG1c
   uzw0bjmz5frRg/GHKlkU78BDUuRRkUPCbj1FuPoohRs49SqHlWyfvBZoD
   Q==;
X-CSE-ConnectionGUID: uePVqRcRQmuh+lWI8MZCzA==
X-CSE-MsgGUID: L2HBCGHPSLaowBi5hWT2Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88073503"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88073503"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:15:26 -0700
X-CSE-ConnectionGUID: bGisN/VQT/CJZh1KrRV9rQ==
X-CSE-MsgGUID: 5og4FwFoRWCFe3ocSLajog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265771452"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2026 12:15:25 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wya8b-000000003rZ-3ddG;
	Mon, 24 Aug 2026 19:15:19 +0000
Date: Tue, 25 Aug 2026 03:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC] mm: Drop pxd_ERROR()
Message-ID: <202608250331.Hvrq389Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260806080639.1916749-1-anshuman.khandual@arm.com>
References: <20260806080639.1916749-1-anshuman.khandual@arm.com>
TO: Anshuman Khandual <anshuman.khandual@arm.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linux-review/Anshuman-Khandual/mm-Standardize-printing-for-pgtable-entries/20260709-124528 powerpc/next powerpc/fixes geert-m68k/for-next geert-m68k/for-linus tip/x86/core linus/master arnd-asm-generic/master v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-Drop-pxd_ERROR/20260806-133639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260806080639.1916749-1-anshuman.khandual%40arm.com
patch subject: [RFC] mm: Drop pxd_ERROR()
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260825/202608250331.Hvrq389Y-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250331.Hvrq389Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608250331.Hvrq389Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/parisc/kernel/pci-dma.c: In function 'unmap_uncached_pte':
>> arch/parisc/kernel/pci-dma.c:163:17: error: implicit declaration of function 'pmd_ERROR'; did you mean 'pgd_ERROR'? [-Wimplicit-function-declaration]
     163 |                 pmd_ERROR(*pmd);
         |                 ^~~~~~~~~
         |                 pgd_ERROR


vim +163 arch/parisc/kernel/pci-dma.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  152  
^1da177e4c3f415 Linus Torvalds 2005-04-16  153  static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
^1da177e4c3f415 Linus Torvalds 2005-04-16  154  		unsigned long size)
^1da177e4c3f415 Linus Torvalds 2005-04-16  155  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  156  	pte_t * pte;
^1da177e4c3f415 Linus Torvalds 2005-04-16  157  	unsigned long end;
^1da177e4c3f415 Linus Torvalds 2005-04-16  158  	unsigned long orig_vaddr = vaddr;
^1da177e4c3f415 Linus Torvalds 2005-04-16  159  
^1da177e4c3f415 Linus Torvalds 2005-04-16  160  	if (pmd_none(*pmd))
^1da177e4c3f415 Linus Torvalds 2005-04-16  161  		return;
^1da177e4c3f415 Linus Torvalds 2005-04-16  162  	if (pmd_bad(*pmd)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16 @163  		pmd_ERROR(*pmd);
^1da177e4c3f415 Linus Torvalds 2005-04-16  164  		pmd_clear(pmd);
^1da177e4c3f415 Linus Torvalds 2005-04-16  165  		return;
^1da177e4c3f415 Linus Torvalds 2005-04-16  166  	}
ffd3e90a8fda600 Hugh Dickins   2023-06-08  167  	pte = pte_offset_kernel(pmd, vaddr);
^1da177e4c3f415 Linus Torvalds 2005-04-16  168  	vaddr &= ~PMD_MASK;
^1da177e4c3f415 Linus Torvalds 2005-04-16  169  	end = vaddr + size;
^1da177e4c3f415 Linus Torvalds 2005-04-16  170  	if (end > PMD_SIZE)
^1da177e4c3f415 Linus Torvalds 2005-04-16  171  		end = PMD_SIZE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  172  	do {
e82a3b75127188f Helge Deller   2009-06-16  173  		unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  174  		pte_t page = *pte;
e82a3b75127188f Helge Deller   2009-06-16  175  
^1da177e4c3f415 Linus Torvalds 2005-04-16  176  		pte_clear(&init_mm, vaddr, pte);
e82a3b75127188f Helge Deller   2009-06-16  177  		purge_tlb_start(flags);
360bd6c658076f9 Helge Deller   2022-02-17  178  		pdtlb(SR_KERNEL, orig_vaddr);
e82a3b75127188f Helge Deller   2009-06-16  179  		purge_tlb_end(flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  180  		vaddr += PAGE_SIZE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  181  		orig_vaddr += PAGE_SIZE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  182  		pte++;
^1da177e4c3f415 Linus Torvalds 2005-04-16  183  		if (pte_none(page) || pte_present(page))
^1da177e4c3f415 Linus Torvalds 2005-04-16  184  			continue;
^1da177e4c3f415 Linus Torvalds 2005-04-16  185  		printk(KERN_CRIT "Whee.. Swapped out page in kernel page table\n");
^1da177e4c3f415 Linus Torvalds 2005-04-16  186  	} while (vaddr < end);
^1da177e4c3f415 Linus Torvalds 2005-04-16  187  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  188  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
