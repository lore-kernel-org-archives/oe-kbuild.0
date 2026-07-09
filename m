Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73A3F0AB9
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586231; cv=none; b=dbQ6Xy1xCL4VBMMCssDr2BUKImyJxXV612w+5TD5bfqkHCcO18on7ZGmMyuB5apKgP45M1rRy/dOoSENGJPEu42Aq6SeU47nk61gy28BvBUPTAc8f/eyaGwtUUl81x06cRxWOkrDo7PC68pOYlVO3Usx+9bcNM1ZXQ0wolYjPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586231; c=relaxed/simple;
	bh=rNV1HiVb0R/D2k2yU7B80Sbicw4eIH/07wgGoXgUPtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nGJYZTrqCorMw4D9PGiqBEtYKDMZ87ZM3HENymw6X047d6Fs8pH2JKSURofSLbcwP4r/dnvX4EQZ69gB+GWt7pEGhFX022aDMkPgQeyaXV4vFuChNTk5h3FjnItgzG7bTdRzlZ2GHBjN8gprPf4SnuYnR6q+A2NXWL0j0P1fwOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezFpTR9S; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezFpTR9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783586230; x=1815122230;
  h=date:from:to:cc:subject:message-id;
  bh=rNV1HiVb0R/D2k2yU7B80Sbicw4eIH/07wgGoXgUPtI=;
  b=ezFpTR9SsZz4FeZwLLNmbCvACmuxA/Q3PjF1Pex1BaMaouXRHCE6YxhJ
   67IrJYWchSaR7e2lrZjImCrkeNb51I8Ek5DWF7WOzyICVrZU8ebiiBi1B
   +aWTFleVRWM5DOAbjPjP3Gee9U437ZG5EiXzJIa7heHbLqV2pVcJkG+10
   AYjgG7yb3uWXhAF2NMk6wQKDV80KppEc+3FajHASy+Z3eGxvOEQGIfoM+
   ixFhPxU/xhBsnzbtIUTZRxAF5YfFP6+C9N+MNIAXhb5bqpwGF0EXSWyNM
   oPvAAMeKYMLwFRP+emDLJlhVfoXtS4lC4wmarbE1YJyhhEMxpBEuMC5PP
   g==;
X-CSE-ConnectionGUID: NSQseflbQ0WAcd2qPFR3LA==
X-CSE-MsgGUID: o9zOktXNSUyRGtaD22BrIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87946458"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87946458"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:37:10 -0700
X-CSE-ConnectionGUID: Lhg9Un22SlKT8nscRTNuEw==
X-CSE-MsgGUID: 6tUc9FeaSqesWRE1D3SqVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248152399"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2026 01:37:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whkFl-00000000HSH-3xWQ;
	Thu, 09 Jul 2026 08:37:05 +0000
Date: Thu, 09 Jul 2026 16:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/include/asm/pgtable_64_types.h:21:34: error:
 conflicting types for 'pte_t'; have 'struct <anonymous>'
Message-ID: <202607091617.EUrFMELm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260708-220441, commit: f9237a1d5a16cdb9f3d83dd59e5c314f89e27e5c"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ahmed Tiba <ahmed.tiba@arm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260708-220441
head:   f9237a1d5a16cdb9f3d83dd59e5c314f89e27e5c
commit: f9237a1d5a16cdb9f3d83dd59e5c314f89e27e5c RAS: add firmware-first CPER provider
date:   18 hours ago
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260709/202607091617.EUrFMELm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091617.EUrFMELm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607091617.EUrFMELm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/include/asm/pgtable.h:14:9: note: this is the location of the previous definition
      14 | #define _PAGE_PRESENT   0x001
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:52:9: warning: "_PAGE_RW" redefined
      52 | #define _PAGE_RW        (_AT(pteval_t, 1) << _PAGE_BIT_RW)
         |         ^~~~~~~~
   arch/um/include/asm/pgtable.h:16:9: note: this is the location of the previous definition
      16 | #define _PAGE_RW        0x020
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable_types.h:53:9: warning: "_PAGE_USER" redefined
      53 | #define _PAGE_USER      (_AT(pteval_t, 1) << _PAGE_BIT_USER)
         |         ^~~~~~~~~~
   arch/um/include/asm/pgtable.h:17:9: note: this is the location of the previous definition
      17 | #define _PAGE_USER      0x040
         |         ^~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:56:9: warning: "_PAGE_ACCESSED" redefined
      56 | #define _PAGE_ACCESSED  (_AT(pteval_t, 1) << _PAGE_BIT_ACCESSED)
         |         ^~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:18:9: note: this is the location of the previous definition
      18 | #define _PAGE_ACCESSED  0x080
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:57:9: warning: "_PAGE_DIRTY" redefined
      57 | #define _PAGE_DIRTY     (_AT(pteval_t, 1) << _PAGE_BIT_DIRTY)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:19:9: note: this is the location of the previous definition
      19 | #define _PAGE_DIRTY     0x100
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:141:9: warning: "_PAGE_PROTNONE" redefined
     141 | #define _PAGE_PROTNONE  (_AT(pteval_t, 1) << _PAGE_BIT_PROTNONE)
         |         ^~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:21:9: note: this is the location of the previous definition
      21 | #define _PAGE_PROTNONE  0x010   /* if the user mapped it with PROT_NONE;
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:155:9: warning: "_PAGE_CHG_MASK" redefined
     155 | #define _PAGE_CHG_MASK  (_COMMON_PAGE_CHG_MASK | _PAGE_PAT)
         |         ^~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:57:9: note: this is the location of the previous definition
      57 | #define _PAGE_CHG_MASK  (PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:205:9: warning: "PAGE_NONE" redefined
     205 | #define PAGE_NONE            __pg(   0|   0|   0|___A|   0|   0|   0|___G)
         |         ^~~~~~~~~
   arch/um/include/asm/pgtable.h:60:9: note: this is the location of the previous definition
      60 | #define PAGE_NONE       __pgprot(_PAGE_PROTNONE | _PAGE_ACCESSED)
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:206:9: warning: "PAGE_SHARED" redefined
     206 | #define PAGE_SHARED          __pg(__PP|__RW|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:61:9: note: this is the location of the previous definition
      61 | #define PAGE_SHARED     __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:210:9: warning: "PAGE_COPY" redefined
     210 | #define PAGE_COPY            __pg(__PP|   0|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~
   arch/um/include/asm/pgtable.h:62:9: note: this is the location of the previous definition
      62 | #define PAGE_COPY       __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:211:9: warning: "PAGE_READONLY" redefined
     211 | #define PAGE_READONLY        __pg(__PP|   0|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:63:9: note: this is the location of the previous definition
      63 | #define PAGE_READONLY   __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:219:9: warning: "_KERNPG_TABLE" redefined
     219 | #define _KERNPG_TABLE            (__PP|__RW|   0|___A|   0|___D|   0|   0| _ENC)
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:56:9: note: this is the location of the previous definition
      56 | #define _KERNPG_TABLE   (_PAGE_PRESENT | _PAGE_RW | _PAGE_ACCESSED | _PAGE_DIRTY)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:221:9: warning: "_PAGE_TABLE" redefined
     221 | #define _PAGE_TABLE              (__PP|__RW|_USR|___A|   0|___D|   0|   0| _ENC)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:55:9: note: this is the location of the previous definition
      55 | #define _PAGE_TABLE     (_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED | _PAGE_DIRTY)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:226:9: warning: "__PAGE_KERNEL_EXEC" redefined
     226 | #define __PAGE_KERNEL_EXEC       (__PP|__RW|   0|___A|   0|___D|   0|___G)
         |         ^~~~~~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:58:9: note: this is the location of the previous definition
      58 | #define __PAGE_KERNEL_EXEC                                              \
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:247:9: warning: "PAGE_KERNEL" redefined
     247 | #define PAGE_KERNEL             __pgprot_mask(__PAGE_KERNEL            | _ENC)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:64:9: note: this is the location of the previous definition
      64 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:249:9: warning: "PAGE_KERNEL_RO" redefined
     249 | #define PAGE_KERNEL_RO          __pgprot_mask(__PAGE_KERNEL_RO         | _ENC)
         |         ^~~~~~~~~~~~~~
   include/linux/pgtable.h:2266:10: note: this is the location of the previous definition
    2266 | # define PAGE_KERNEL_RO PAGE_KERNEL
         |          ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:250:9: warning: "PAGE_KERNEL_EXEC" redefined
     250 | #define PAGE_KERNEL_EXEC        __pgprot_mask(__PAGE_KERNEL_EXEC       | _ENC)
         |         ^~~~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:65:9: note: this is the location of the previous definition
      65 | #define PAGE_KERNEL_EXEC        __pgprot(__PAGE_KERNEL_EXEC)
         |         ^~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/pgtable_types.h:277:
>> arch/x86/include/asm/pgtable_64_types.h:21:34: error: conflicting types for 'pte_t'; have 'struct <anonymous>'
      21 | typedef struct { pteval_t pte; } pte_t;
         |                                  ^~~~~
   arch/um/include/asm/page.h:31:39: note: previous declaration of 'pte_t' with type 'pte_t'
      31 | typedef struct { unsigned long pte; } pte_t;
         |                                       ^~~~~
>> arch/x86/include/asm/pgtable_64_types.h:22:34: error: conflicting types for 'pmd_t'; have 'struct <anonymous>'
      22 | typedef struct { pmdval_t pmd; } pmd_t;
         |                                  ^~~~~
   arch/um/include/asm/page.h:36:39: note: previous declaration of 'pmd_t' with type 'pmd_t'
      36 | typedef struct { unsigned long pmd; } pmd_t;
         |                                       ^~~~~
   arch/x86/include/asm/pgtable_64_types.h:39:9: warning: "ARCH_PAGE_TABLE_SYNC_MASK" redefined
      39 | #define ARCH_PAGE_TABLE_SYNC_MASK \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1749:9: note: this is the location of the previous definition
    1749 | #define ARCH_PAGE_TABLE_SYNC_MASK 0
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:50:9: warning: "PGDIR_SHIFT" redefined
      50 | #define PGDIR_SHIFT     pgdir_shift
         |         ^~~~~~~~~~~
   In file included from arch/um/include/asm/pgtable.h:28:
   arch/um/include/asm/pgtable-4level.h:14:9: note: this is the location of the previous definition
      14 | #define PGDIR_SHIFT     39
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:56:9: warning: "P4D_SHIFT" redefined
      56 | #define P4D_SHIFT               39
         |         ^~~~~~~~~
   In file included from arch/um/include/asm/pgtable-4level.h:10:
   include/asm-generic/pgtable-nop4d.h:11:9: note: this is the location of the previous definition
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:57:9: warning: "MAX_PTRS_PER_P4D" redefined
      57 | #define MAX_PTRS_PER_P4D        512
         |         ^~~~~~~~~~~~~~~~
   include/linux/pgtable.h:2457:9: note: this is the location of the previous definition
    2457 | #define MAX_PTRS_PER_P4D PTRS_PER_P4D
         |         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:58:9: warning: "PTRS_PER_P4D" redefined
      58 | #define PTRS_PER_P4D            ptrs_per_p4d
         |         ^~~~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:12:9: note: this is the location of the previous definition
      12 | #define PTRS_PER_P4D            1
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:59:9: warning: "P4D_SIZE" redefined
      59 | #define P4D_SIZE                (_AC(1, UL) << P4D_SHIFT)
         |         ^~~~~~~~
   include/asm-generic/pgtable-nop4d.h:13:9: note: this is the location of the previous definition
      13 | #define P4D_SIZE                (1UL << P4D_SHIFT)
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:60:9: warning: "P4D_MASK" redefined
      60 | #define P4D_MASK                (~(P4D_SIZE - 1))
         |         ^~~~~~~~
   include/asm-generic/pgtable-nop4d.h:14:9: note: this is the location of the previous definition
      14 | #define P4D_MASK                (~(P4D_SIZE-1))
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:82:9: warning: "PMD_SIZE" redefined
      82 | #define PMD_SIZE        (_AC(1, UL) << PMD_SHIFT)
         |         ^~~~~~~~
   arch/um/include/asm/pgtable-4level.h:31:9: note: this is the location of the previous definition
      31 | #define PMD_SIZE        (1UL << PMD_SHIFT)
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:83:9: warning: "PMD_MASK" redefined
      83 | #define PMD_MASK        (~(PMD_SIZE - 1))
         |         ^~~~~~~~
   arch/um/include/asm/pgtable-4level.h:32:9: note: this is the location of the previous definition
      32 | #define PMD_MASK        (~(PMD_SIZE-1))
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:84:9: warning: "PUD_SIZE" redefined
      84 | #define PUD_SIZE        (_AC(1, UL) << PUD_SHIFT)
         |         ^~~~~~~~
   arch/um/include/asm/pgtable-4level.h:23:9: note: this is the location of the previous definition
      23 | #define PUD_SIZE        (1UL << PUD_SHIFT)
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:85:9: warning: "PUD_MASK" redefined
      85 | #define PUD_MASK        (~(PUD_SIZE - 1))
         |         ^~~~~~~~
   arch/um/include/asm/pgtable-4level.h:24:9: note: this is the location of the previous definition
      24 | #define PUD_MASK        (~(PUD_SIZE-1))
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:86:9: warning: "PGDIR_SIZE" redefined
      86 | #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
         |         ^~~~~~~~~~
   arch/um/include/asm/pgtable-4level.h:15:9: note: this is the location of the previous definition
      15 | #define PGDIR_SIZE      (1UL << PGDIR_SHIFT)
         |         ^~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:87:9: warning: "PGDIR_MASK" redefined
      87 | #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
         |         ^~~~~~~~~~
   arch/um/include/asm/pgtable-4level.h:16:9: note: this is the location of the previous definition
      16 | #define PGDIR_MASK      (~(PGDIR_SIZE-1))
         |         ^~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:116:10: warning: "VMALLOC_START" redefined
     116 | # define VMALLOC_START          vmalloc_base
         |          ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:50:9: note: this is the location of the previous definition
      50 | #define VMALLOC_START   ((high_physmem + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1))
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:133:9: warning: "VMALLOC_END" redefined
     133 | #define VMALLOC_END             VMEMORY_END
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:51:9: note: this is the location of the previous definition
      51 | #define VMALLOC_END     (TASK_SIZE-2*PAGE_SIZE)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:171:9: warning: "MODULES_VADDR" redefined
     171 | #define MODULES_VADDR           (__START_KERNEL_map + KERNEL_IMAGE_SIZE)
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:52:9: note: this is the location of the previous definition
      52 | #define MODULES_VADDR   VMALLOC_START
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:174:10: warning: "MODULES_END" redefined
     174 | # define MODULES_END            _AC(0xffffffffff000000, UL)
         |          ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:53:9: note: this is the location of the previous definition
      53 | #define MODULES_END     VMALLOC_END
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:196:9: warning: "_PAGE_SWP_EXCLUSIVE" redefined
     196 | #define _PAGE_SWP_EXCLUSIVE     _PAGE_PWT
         |         ^~~~~~~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:25:9: note: this is the location of the previous definition
      25 | #define _PAGE_SWP_EXCLUSIVE     0x400
         |         ^~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:293:47: error: conflicting types for 'pgprot_t'; have 'struct pgprot'
     293 | typedef struct pgprot { pgprotval_t pgprot; } pgprot_t;
         |                                               ^~~~~~~~
   arch/um/include/asm/page.h:60:42: note: previous declaration of 'pgprot_t' with type 'pgprot_t'
      60 | typedef struct { unsigned long pgprot; } pgprot_t;
         |                                          ^~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:295:34: error: conflicting types for 'pgd_t'; have 'struct <anonymous>'
     295 | typedef struct { pgdval_t pgd; } pgd_t;
         |                                  ^~~~~
   arch/um/include/asm/page.h:32:39: note: previous declaration of 'pgd_t' with type 'pgd_t'
      32 | typedef struct { unsigned long pgd; } pgd_t;
         |                                       ^~~~~
>> arch/x86/include/asm/pgtable_types.h:297:43: error: expected ')' before 'prot'
     297 | static inline pgprot_t pgprot_nx(pgprot_t prot)
         |                                           ^~~~
   include/linux/pgtable.h:1786:26: note: in definition of macro 'pgprot_nx'
    1786 | #define pgprot_nx(prot) (prot)
         |                          ^~~~
   arch/x86/include/asm/pgtable_types.h:301:9: warning: "pgprot_nx" redefined
     301 | #define pgprot_nx pgprot_nx
         |         ^~~~~~~~~
   include/linux/pgtable.h:1786:9: note: this is the location of the previous definition
    1786 | #define pgprot_nx(prot) (prot)
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h: In function 'native_make_p4d':
>> arch/x86/include/asm/pgtable_types.h:358:33: error: incompatible types when initializing type 'long unsigned int' using type 'pgd_t'
     358 |         return (p4d_t) { .pgd = native_make_pgd((pgdval_t)val) };
         |                                 ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h: In function 'native_p4d_val':
>> arch/x86/include/asm/pgtable_types.h:363:34: error: incompatible type for argument 1 of 'native_pgd_val'
     363 |         return native_pgd_val(p4d.pgd);
         |                               ~~~^~~~
         |                                  |
         |                                  pgd_t
   arch/x86/include/asm/pgtable_types.h:331:45: note: expected 'pgd_t' but argument is of type 'pgd_t'
     331 | static inline pgdval_t native_pgd_val(pgd_t pgd)
         |                                       ~~~~~~^~~
   arch/x86/include/asm/pgtable_types.h: At top level:
>> arch/x86/include/asm/pgtable_types.h:368:34: error: conflicting types for 'pud_t'; have 'struct <anonymous>'
     368 | typedef struct { pudval_t pud; } pud_t;
         |                                  ^~~~~
   arch/um/include/asm/page.h:42:39: note: previous declaration of 'pud_t' with type 'pud_t'
      42 | typedef struct { unsigned long pud; } pud_t;
         |                                       ^~~~~
   arch/x86/include/asm/pgtable_types.h:521:9: warning: "pgprot_writecombine" redefined
     521 | #define pgprot_writecombine     pgprot_writecombine
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1794:9: note: this is the location of the previous definition
    1794 | #define pgprot_writecombine pgprot_noncached
         |         ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:524:9: warning: "pgprot_writethrough" redefined
     524 | #define pgprot_writethrough     pgprot_writethrough
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1798:9: note: this is the location of the previous definition
    1798 | #define pgprot_writethrough pgprot_noncached
         |         ^~~~~~~~~~~~~~~~~~~


vim +21 arch/x86/include/asm/pgtable_64_types.h

54321d947ae9d6 Jeremy Fitzhardinge 2009-02-11  20  
54321d947ae9d6 Jeremy Fitzhardinge 2009-02-11 @21  typedef struct { pteval_t pte; } pte_t;
fbfdec9989e69e Peter Zijlstra      2020-11-26 @22  typedef struct { pmdval_t pmd; } pmd_t;
54321d947ae9d6 Jeremy Fitzhardinge 2009-02-11  23  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
