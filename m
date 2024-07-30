Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDF818C336
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338739; cv=none; b=P/WqYCGvn6D6uzxdedoa84LdLuCLPRkOWtxJBgixcyIH4n9HZoGVePC9hiikyZ/3URsnJY5NEptlm3UV72Z2n9tJkBMM65Z1Uu3pf75za+uqdh8rrnHc+5M16SePGgNNeRTr0IMPDWCtaVVnhRjXOvKtZuqX9hGSud7aGNcnRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338739; c=relaxed/simple;
	bh=Ofubj/ZP4GnL+0bQ+IKvTMMN4MLGRvgOIQm/fDZVugM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QXSwXd+iA1MzZghmKU6d3rIOduEKoGMePrSj21QlokVM4/zxYZ+Bi1T1iY2ACWeF6MG5XP1fAVg61UsyVafGN39MtEDQ9C3VUA5vIHeM8xwZLaXypM0EvKSgATGaVwagsTZZjbX0qTCBUwYuSmwtxXga6kAsiKw+xA5kpirzj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRygT4a3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRygT4a3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722338737; x=1753874737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ofubj/ZP4GnL+0bQ+IKvTMMN4MLGRvgOIQm/fDZVugM=;
  b=KRygT4a30ERd4BhzAbvGUCLFH41aDF3By/qsuRAJ0/EXLSeA1p3/fHQP
   x8S5rWZBpWtkWamnNNiPISgcI1BAojbLMlAsyxFeDIm8XfcoCqbheXv8a
   fbTbIpioSVHi7lSpHzdxmUm99IplnAaf1aoKwRH5Sg9yoxrr4UQEIXHVV
   CGzBtsnymlIb31yf8J9xXcPsr0LG7XFrN85rI+AYDRojaiqLGb3sPrfsd
   IMkyeN8iMYZlTUOsILv3bbKFQoDjHZABOCfxQVmWPD9libe0QH9e5UdSH
   ysmHMNqKbHVtfLu+7LuCjt8huE7fDEwANYcJ/blN/L8ioNn7nSMmloYee
   w==;
X-CSE-ConnectionGUID: 0CJRIRjFQ2+SLWS76oPQfg==
X-CSE-MsgGUID: b6xe3Q9yQICxkdrzUSiP9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31541847"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="31541847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 04:25:36 -0700
X-CSE-ConnectionGUID: O0Cw5Xj4SXu5XiLLiAsaww==
X-CSE-MsgGUID: p1HiMP0lRIKDIatbyVXglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="58633566"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2024 04:25:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYkyy-000sna-1p;
	Tue, 30 Jul 2024 11:25:32 +0000
Date: Tue, 30 Jul 2024 19:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memory.o: warning: objtool: pte_alloc_one_noprof.isra.0+0x3c:
 unreachable instruction
Message-ID: <202407301904.LX4eqs6J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94ede2a3e9135764736221c080ac7c0ad993dc2d
commit: 2c321f3f70bc284510598f712b702ce8d60c4d14 mm: change inlined allocation helpers to account at the call site
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301904.LX4eqs6J-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301904.LX4eqs6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407301904.LX4eqs6J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/asm-generic/io.h:1048,
                    from arch/loongarch/include/asm/io.h:86,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from arch/loongarch/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/memory.o: warning: objtool: pfn_swap_entry_folio+0x58: unreachable instruction
   mm/memory.o: warning: objtool: folio_try_dup_anon_rmap_ptes+0x70: unreachable instruction
   mm/memory.o: warning: objtool: wp_page_reuse+0x24: unreachable instruction
   mm/memory.o: warning: objtool: copy_present_ptes+0x36c: unreachable instruction
   mm/memory.o: warning: objtool: do_wp_page+0x2ec: unreachable instruction
>> mm/memory.o: warning: objtool: pte_alloc_one_noprof.isra.0+0x3c: unreachable instruction
   mm/memory.o: warning: objtool: copy_page_range+0x114: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_page+0x6c: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_pages+0x80: unreachable instruction
   mm/memory.o: warning: objtool: remap_pfn_range_notrack+0xa4: unreachable instruction
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/huge_memory.c:8:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/huge_memory.o: warning: objtool: folio_flags+0x30: unreachable instruction
   mm/huge_memory.o: warning: objtool: const_folio_flags+0x30: unreachable instruction
   mm/huge_memory.o: warning: objtool: lru_add_page_tail+0x30: unreachable instruction
   mm/huge_memory.o: warning: objtool: folio_try_share_anon_rmap_pmd+0x5c: unreachable instruction
   mm/huge_memory.o: warning: objtool: folio_try_dup_anon_rmap_pmd+0x64: unreachable instruction
>> mm/huge_memory.o: warning: objtool: pte_alloc_one_noprof.isra.0+0x40: unreachable instruction
   mm/huge_memory.o: warning: objtool: __split_huge_page_tail+0x50: unreachable instruction
   mm/huge_memory.o: warning: objtool: __split_huge_page+0x188: unreachable instruction
   mm/huge_memory.o: warning: objtool: zap_huge_pmd+0xe8: unreachable instruction
   mm/huge_memory.o: warning: objtool: move_huge_pmd+0x5c: unreachable instruction
   mm/huge_memory.o: warning: objtool: copy_huge_pmd+0xac: unreachable instruction
   mm/huge_memory.o: warning: objtool: do_huge_pmd_wp_page+0x5c: unreachable instruction
   mm/huge_memory.o: warning: objtool: split_huge_page_to_list_to_order+0xcc: unreachable instruction
   mm/huge_memory.o: warning: objtool: set_pmd_migration_entry+0x9c: unreachable instruction
   mm/huge_memory.o: warning: objtool: remove_migration_pmd+0x134: unreachable instruction


objdump-func vmlinux.o pte_alloc_one_noprof.isra.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
