Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE641B4224
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 00:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558544; cv=none; b=UfLZFoFTmw+By+tWo6Y/brNQ+K9Tec+f3EPlFVmnx0DUY2J+Qjfop83AyxLVuy2wo7lY/MjVFkPSoq8HjMwEQ6OSXFff4LPbUPGzg/32fd3QaAu2yvKQDwwosJr8kP8w41tPbSLry8Zz6lPIPfgM3HzCdOE0qxIefpBzcIbvyMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558544; c=relaxed/simple;
	bh=B/BiqGZyxycr6KBh8GjQ0GX/RZ59N34kHbsJK+6uhlg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GL970LgeVeTOl9+IwBf+JajSF05+UFNunEwhb8pY44E5nWhjNEmJTZbyvYYiuKb1MAiSr18MKxL64AzfnmQyOchk6PS1GMvvacH3bd7KDGAyOEBhBIJXNiV0gIDO+42hRXEhtnXAH2MAY211LjmeazKDwvnmf4TkS3+ct/3eb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuaCgACg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuaCgACg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783558542; x=1815094542;
  h=date:from:to:cc:subject:message-id;
  bh=B/BiqGZyxycr6KBh8GjQ0GX/RZ59N34kHbsJK+6uhlg=;
  b=kuaCgACgth9ygvxFXUDLUoNV0NLH9edcRp2nIAFBgxf9zz+8o/Axe+Ay
   dnodo8/J8J4mjYskbY/+axR6VGbhVQGg93kQmCTqDzBiGg04ollTZrY+Y
   7GqKUAyWgh9mbdu+qdQsmu0LiRaM25pXyAY5VWPOce/F6ySdx8cWKSgVE
   esFAZoRkQbCseq8BpbV7WMSXrAL55zu5EqfjioLAz0+EPzPcR+QPT9JjP
   cnuB39EQY9E7rjAqJD2NaovrWvv7FX5QXw0m2r48UGappmSpDU9jG3puM
   dI6IgmgW/Pq3rHgUORqBMQVSLNfGCBnor9iImzhVLP70XRy5EBTpVXhkP
   A==;
X-CSE-ConnectionGUID: z38FFdPMSpOoLHyYka7CBw==
X-CSE-MsgGUID: c/EaK9g6SdK46NFeJbPGbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71754626"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71754626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 17:55:41 -0700
X-CSE-ConnectionGUID: 3JpvB1DzRtismn7x//eIQA==
X-CSE-MsgGUID: 9B8wU8RHQ4G1GV6qEInSBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277667664"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2026 17:55:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whd3B-00000000H5r-0jNg;
	Thu, 09 Jul 2026 00:55:37 +0000
Date: Thu, 09 Jul 2026 08:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/include/asm/page_types.h:27:9: warning:
 "PAGE_OFFSET" redefined
Message-ID: <202607090829.dOovYZyZ-lkp@intel.com>
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
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260709/202607090829.dOovYZyZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090829.dOovYZyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607090829.dOovYZyZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_types.h:8,
                    from arch/x86/include/asm/fixmap.h:38,
                    from include/acpi/ghes_cper.h:24,
                    from drivers/ras/cper-esource.c:26:
>> arch/x86/include/asm/page_types.h:27:9: warning: "PAGE_OFFSET" redefined
      27 | #define PAGE_OFFSET             ((unsigned long)__PAGE_OFFSET)
         |         ^~~~~~~~~~~
   In file included from arch/um/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/um/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/smp.h:117,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/seq_file.h:9,
                    from include/linux/seq_buf.h:7,
                    from include/linux/trace_seq.h:5,
                    from include/linux/cper.h:13,
                    from drivers/ras/cper-esource.c:13:
   arch/um/include/asm/page.h:73:9: note: this is the location of the previous definition
      73 | #define PAGE_OFFSET (uml_physmem)
         |         ^~~~~~~~~~~
   In file included from arch/x86/include/asm/page_types.h:37:
>> arch/x86/include/asm/page_64_types.h:15:9: warning: "THREAD_SIZE_ORDER" redefined
      15 | #define THREAD_SIZE_ORDER       (2 + KASAN_STACK_ORDER)
         |         ^~~~~~~~~~~~~~~~~
   arch/um/include/asm/thread_info.h:9:9: note: this is the location of the previous definition
       9 | #define THREAD_SIZE_ORDER CONFIG_KERNEL_STACK_ORDER
         |         ^~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/page_64_types.h:16:9: warning: "THREAD_SIZE" redefined
      16 | #define THREAD_SIZE  (PAGE_SIZE << THREAD_SIZE_ORDER)
         |         ^~~~~~~~~~~
   arch/um/include/asm/thread_info.h:10:9: note: this is the location of the previous definition
      10 | #define THREAD_SIZE ((1 << CONFIG_KERNEL_STACK_ORDER) * PAGE_SIZE)
         |         ^~~~~~~~~~~
>> arch/x86/include/asm/page_64_types.h:53:9: warning: "TASK_SIZE_MAX" redefined
      53 | #define TASK_SIZE_MAX           task_size_max()
         |         ^~~~~~~~~~~~~
   In file included from include/asm-generic/uaccess.h:11,
                    from arch/um/include/asm/uaccess.h:32,
                    from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/seq_file.h:11:
   include/asm-generic/access_ok.h:16:9: note: this is the location of the previous definition
      16 | #define TASK_SIZE_MAX                   TASK_SIZE
         |         ^~~~~~~~~~~~~
>> arch/x86/include/asm/page_64_types.h:64:9: warning: "TASK_SIZE" redefined
      64 | #define TASK_SIZE               (test_thread_flag(TIF_ADDR32) ? \
         |         ^~~~~~~~~
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/mutex.h:19:
   arch/um/include/asm/processor-generic.h:53:9: note: this is the location of the previous definition
      53 | #define TASK_SIZE (task_size)
         |         ^~~~~~~~~
>> arch/x86/include/asm/page_64_types.h:66:9: warning: "TASK_SIZE_OF" redefined
      66 | #define TASK_SIZE_OF(child)     ((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
         |         ^~~~~~~~~~~~
   In file included from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7:
   include/linux/sched.h:2314:9: note: this is the location of the previous definition
    2314 | #define TASK_SIZE_OF(tsk)       TASK_SIZE
         |         ^~~~~~~~~~~~
>> arch/x86/include/asm/page_64_types.h:69:9: warning: "STACK_TOP" redefined
      69 | #define STACK_TOP               TASK_SIZE_LOW
         |         ^~~~~~~~~
   arch/um/include/asm/processor-generic.h:61:9: note: this is the location of the previous definition
      61 | #define STACK_TOP       (TASK_SIZE - 2 * PAGE_SIZE)
         |         ^~~~~~~~~
>> arch/x86/include/asm/page_64_types.h:70:9: warning: "STACK_TOP_MAX" redefined
      70 | #define STACK_TOP_MAX           TASK_SIZE_MAX
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/processor-generic.h:62:9: note: this is the location of the previous definition
      62 | #define STACK_TOP_MAX   STACK_TOP
         |         ^~~~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:51:9: warning: "_PAGE_PRESENT" redefined
      51 | #define _PAGE_PRESENT   (_AT(pteval_t, 1) << _PAGE_BIT_PRESENT)
         |         ^~~~~~~~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:38,
                    from include/linux/slab.h:264,
                    from include/linux/fs.h:45:
   arch/um/include/asm/pgtable.h:14:9: note: this is the location of the previous definition
      14 | #define _PAGE_PRESENT   0x001
         |         ^~~~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:52:9: warning: "_PAGE_RW" redefined
      52 | #define _PAGE_RW        (_AT(pteval_t, 1) << _PAGE_BIT_RW)
         |         ^~~~~~~~
   arch/um/include/asm/pgtable.h:16:9: note: this is the location of the previous definition
      16 | #define _PAGE_RW        0x020
         |         ^~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:53:9: warning: "_PAGE_USER" redefined
      53 | #define _PAGE_USER      (_AT(pteval_t, 1) << _PAGE_BIT_USER)
         |         ^~~~~~~~~~
   arch/um/include/asm/pgtable.h:17:9: note: this is the location of the previous definition
      17 | #define _PAGE_USER      0x040
         |         ^~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:56:9: warning: "_PAGE_ACCESSED" redefined
      56 | #define _PAGE_ACCESSED  (_AT(pteval_t, 1) << _PAGE_BIT_ACCESSED)
         |         ^~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:18:9: note: this is the location of the previous definition
      18 | #define _PAGE_ACCESSED  0x080
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:57:9: warning: "_PAGE_DIRTY" redefined
      57 | #define _PAGE_DIRTY     (_AT(pteval_t, 1) << _PAGE_BIT_DIRTY)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:19:9: note: this is the location of the previous definition
      19 | #define _PAGE_DIRTY     0x100
         |         ^~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:141:9: warning: "_PAGE_PROTNONE" redefined
     141 | #define _PAGE_PROTNONE  (_AT(pteval_t, 1) << _PAGE_BIT_PROTNONE)
         |         ^~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:21:9: note: this is the location of the previous definition
      21 | #define _PAGE_PROTNONE  0x010   /* if the user mapped it with PROT_NONE;
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:155:9: warning: "_PAGE_CHG_MASK" redefined
     155 | #define _PAGE_CHG_MASK  (_COMMON_PAGE_CHG_MASK | _PAGE_PAT)
         |         ^~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:57:9: note: this is the location of the previous definition
      57 | #define _PAGE_CHG_MASK  (PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:205:9: warning: "PAGE_NONE" redefined
     205 | #define PAGE_NONE            __pg(   0|   0|   0|___A|   0|   0|   0|___G)
         |         ^~~~~~~~~
   arch/um/include/asm/pgtable.h:60:9: note: this is the location of the previous definition
      60 | #define PAGE_NONE       __pgprot(_PAGE_PROTNONE | _PAGE_ACCESSED)
         |         ^~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:206:9: warning: "PAGE_SHARED" redefined
     206 | #define PAGE_SHARED          __pg(__PP|__RW|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:61:9: note: this is the location of the previous definition
      61 | #define PAGE_SHARED     __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:210:9: warning: "PAGE_COPY" redefined
     210 | #define PAGE_COPY            __pg(__PP|   0|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~
   arch/um/include/asm/pgtable.h:62:9: note: this is the location of the previous definition
      62 | #define PAGE_COPY       __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:211:9: warning: "PAGE_READONLY" redefined
     211 | #define PAGE_READONLY        __pg(__PP|   0|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:63:9: note: this is the location of the previous definition
      63 | #define PAGE_READONLY   __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~~~
>> arch/x86/include/asm/pgtable_types.h:219:9: warning: "_KERNPG_TABLE" redefined
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
   arch/x86/include/asm/pgtable_64_types.h:21:34: error: conflicting types for 'pte_t'; have 'struct <anonymous>'
      21 | typedef struct { pteval_t pte; } pte_t;
         |                                  ^~~~~
   arch/um/include/asm/page.h:31:39: note: previous declaration of 'pte_t' with type 'pte_t'
      31 | typedef struct { unsigned long pte; } pte_t;
         |                                       ^~~~~
   arch/x86/include/asm/pgtable_64_types.h:22:34: error: conflicting types for 'pmd_t'; have 'struct <anonymous>'
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


vim +/PAGE_OFFSET +27 arch/x86/include/asm/page_types.h

51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  26  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08 @27  #define PAGE_OFFSET		((unsigned long)__PAGE_OFFSET)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  28  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
