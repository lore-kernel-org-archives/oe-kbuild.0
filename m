Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E1018801C
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722357416; cv=none; b=jeQ8EyLE6G1Rmf9bzArQyNn0mlu55IbZGdrfYS6TqnNRdmzavizHG/akdLEHVYpe+DhMGOLcstjt0W1CD5rYLPp+rpYUko9PM/UsP4vwn7KDFM58oBtSxepEMj8TVXnOqX0kacBfWGdUnR01B9fVr6GMsLWHohHQ51jHh4xDGwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722357416; c=relaxed/simple;
	bh=boqPpK9yQEkbfebFynPLZ203T3hnlkBx75kqFP+Ba5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pee5JEJ4iyF4+0p8zZ1OgzUAYjDk5fdVnT4rxk5bx5iOw0x3s+CjQHIITM8fLy5VMgnzN40tKsbKo8LtemsWJgmF9Ue1PfslDihew+3xXNmCHXpEHSsU+LCBuyAS2r0x9wwCA6/QksYvKKeUcNti08U9Pg6HdknXxHrzgb06HMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsKNCjRI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsKNCjRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722357414; x=1753893414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=boqPpK9yQEkbfebFynPLZ203T3hnlkBx75kqFP+Ba5E=;
  b=bsKNCjRIrM8MBYQ3zdLGosA7dhqaKPqR6/lS/7XeU/4gmD7/glG//h1Y
   TZSsmoZTbE/TaqaPFjm2f/tuHK/cYo6zCSc7iRiMCL0QZqg1PhMALhF7O
   RazR7bGMbYB3etyP1sFkkyqxqD0EtsD9tNU9MAAV/0JfjBx8QWdJbjF1G
   hAIbW7kP0xAlXTxY4dSN0kxnkz3wmSOtwkbiOrOJ73KpQhRSrFkxIgPPx
   RiabeSv9ueMtycrZnNlPp4jWVxFU62SbwSkDvg0y2pf+7I6x9KuAEDdhQ
   4kU/RGpjG9CpQrxPSmZK+yELOQw0RQkL8TxW+Em0zHsQz2DSbeLNisdzg
   A==;
X-CSE-ConnectionGUID: gHGXJSDkR5ipdS8Elin1eA==
X-CSE-MsgGUID: KseMB/r4QjCsblt9mdc1iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20349015"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20349015"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 09:36:51 -0700
X-CSE-ConnectionGUID: Va4eFz/2R72Z6vV0vDkwUA==
X-CSE-MsgGUID: l0AcwpHJSzqwdVgxif/uAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54068186"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2024 09:36:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYpqC-000t7b-0t;
	Tue, 30 Jul 2024 16:36:48 +0000
Date: Wed, 31 Jul 2024 00:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/mempolicy.o: warning: objtool: page_rmappable_folio+0x3c:
 unreachable instruction
Message-ID: <202407310036.4isnKoQg-lkp@intel.com>
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
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94ede2a3e9135764736221c080ac7c0ad993dc2d
commit: 85edc15a4c606094a14c36ebf5bceea7f9a3e395 mm: remove folio_prep_large_rmappable()
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310036.4isnKoQg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310036.4isnKoQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310036.4isnKoQg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from arch/loongarch/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> mm/compaction.o: warning: objtool: folio_flags+0x30: unreachable instruction
   mm/compaction.o: warning: objtool: __SetPageMovable+0x34: unreachable instruction
   mm/compaction.o: warning: objtool: isolate_migratepages_block+0x404: unreachable instruction
   mm/compaction.o: warning: objtool: PageMovable+0x34: unreachable instruction
   mm/compaction.o: warning: objtool: compact_zone+0x518: unreachable instruction
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/page_alloc.c:19:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.o: warning: objtool: const_folio_flags+0x30: unreachable instruction
   mm/page_alloc.o: warning: objtool: set_page_refcounted+0x34: unreachable instruction
   mm/page_alloc.o: warning: objtool: split_page+0x40: unreachable instruction
   mm/page_alloc.o: warning: objtool: del_page_from_free_list+0x2c: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_one_page+0x84: unreachable instruction
   mm/page_alloc.o: warning: objtool: move_freepages+0xbc: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_pages_ok+0xb0: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_unref_page_prepare+0x94: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_pages_prepare+0x8c: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_pages_core+0xbc: unreachable instruction
   mm/page_alloc.o: warning: objtool: rmqueue+0x478: unreachable instruction
>> mm/page_alloc.o: warning: objtool: __folio_alloc_noprof+0x48: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_reserved_area+0xa8: unreachable instruction
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/pagemap.h:8,
                    from include/linux/mempolicy.h:15,
                    from mm/mempolicy.c:80:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> mm/mempolicy.o: warning: objtool: page_rmappable_folio+0x3c: unreachable instruction


objdump-func vmlinux.o page_rmappable_folio:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
