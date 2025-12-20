Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2422154B
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239263; cv=none; b=S9xFKGBViCMekPWIC4z41l87nHCXz0fedk3tVXWv5S8TfwtIA7FSVlRm2pfCOHrEZk9XW1DwlZzrr8iml4km01sWkZr88rgHGZKEiaedlNQO4QkTxltL4BeKjOx39ISdI/ah1X6eGncZMMOR4yY9ty2bkDMvDvuYpDjvtIfyDPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239263; c=relaxed/simple;
	bh=fA/qnNCSm8WWyATmGKgytrnE1fmfYjRsd9F5lgTe5NE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T4EPTilcNU+gtSIagH1feYtq4LoyW+QSnim7do6ty5S2/Jv3D8y0Bl/ICkzPAO2+B9+Ldvd0qg8jddsb1gB6OkSj0uGjv+vsY4tb5rSAeIXW747TDB7vw7mqPEUOlneRVAWbMC2vQTO6V/4oWZeSBWpc6vqZ41uWemtgqQvCZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qpvo3tSe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qpvo3tSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766239261; x=1797775261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fA/qnNCSm8WWyATmGKgytrnE1fmfYjRsd9F5lgTe5NE=;
  b=Qpvo3tSeQFD+xexI5OE0Xk5ORkNaTV4UpSC/UUAacSIe/B3OQMDvX64Y
   59FTjpvGlRLn7FiNmin8/2Um2UrLy92ixG0opeG6lhoeL+f7BHW6JFzeq
   eW/fMfq56mw+fkXsEUtV2mZwi8y7niY5gODkuAEswFBK9V6XAFclru/Zd
   FpL2u4xmE828vecPOcyweQQLOJNHQQIl0hxMnxf9MUbdfqtq9MQSM49lU
   QmQsOqZ1Tt5SXL2lBnk1n4Itsk3LrXoHPMo7NF2NO2/u367hlsZaF+Xwt
   0BwLnMu6QbwQzIOT7ruLieD6cEOd0U8nYA2noyDcZ32D7XfxXPoI9lhWJ
   Q==;
X-CSE-ConnectionGUID: wWPlD+/UQo2TWEpS1iiEew==
X-CSE-MsgGUID: KFtCp1/STg+kkyFjlSC8gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85590751"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85590751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:00:58 -0800
X-CSE-ConnectionGUID: Lwm+tA0cRgSjnBiJo9waHg==
X-CSE-MsgGUID: GGNBszQgSpOBXtBZgbaxBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199344218"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 06:00:56 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxVu-000000004bJ-0TJm;
	Sat, 20 Dec 2025 14:00:54 +0000
Date: Sat, 20 Dec 2025 21:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 06/12] efi/cper: adopt estatus iteration helpers
Message-ID: <202512202100.83KwezgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "maintainer prefers to test the version of patch actually in efi/next"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251217112845.1814119-7-ahmed.tiba@arm.com>
References: <20251217112845.1814119-7-ahmed.tiba@arm.com>
TO: Ahmed Tiba <ahmed.tiba@arm.com>
TO: linux-acpi@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: tony.luck@intel.com
CC: bp@alien8.de
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: catalin.marinas@arm.com
CC: will@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: rafael@kernel.org
CC: linux-doc@vger.kernel.org
CC: Dmitry.Lamerov@arm.com
CC: Michael.Zhao2@arm.com
CC: ahmed.tiba@arm.com

Hi Ahmed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on efi/next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge robh/for-next arm64/for-next/core linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ras-add-estatus-core-interfaces/20251217-200718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251217112845.1814119-7-ahmed.tiba%40arm.com
patch subject: [PATCH 06/12] efi/cper: adopt estatus iteration helpers
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251220/202512202100.83KwezgT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202100.83KwezgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202100.83KwezgT-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/um/include/asm/pgtable.h:60:9: note: this is the location of the previous definition
      60 | #define _PAGE_CHG_MASK  (PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:205:9: warning: "PAGE_NONE" redefined
     205 | #define PAGE_NONE            __pg(   0|   0|   0|___A|   0|   0|   0|___G)
         |         ^~~~~~~~~
   arch/um/include/asm/pgtable.h:63:9: note: this is the location of the previous definition
      63 | #define PAGE_NONE       __pgprot(_PAGE_PROTNONE | _PAGE_ACCESSED)
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:206:9: warning: "PAGE_SHARED" redefined
     206 | #define PAGE_SHARED          __pg(__PP|__RW|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:64:9: note: this is the location of the previous definition
      64 | #define PAGE_SHARED     __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:210:9: warning: "PAGE_COPY" redefined
     210 | #define PAGE_COPY            __pg(__PP|   0|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~
   arch/um/include/asm/pgtable.h:65:9: note: this is the location of the previous definition
      65 | #define PAGE_COPY       __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:211:9: warning: "PAGE_READONLY" redefined
     211 | #define PAGE_READONLY        __pg(__PP|   0|_USR|___A|__NX|   0|   0|   0)
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:66:9: note: this is the location of the previous definition
      66 | #define PAGE_READONLY   __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:219:9: warning: "_KERNPG_TABLE" redefined
     219 | #define _KERNPG_TABLE            (__PP|__RW|   0|___A|   0|___D|   0|   0| _ENC)
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:59:9: note: this is the location of the previous definition
      59 | #define _KERNPG_TABLE   (_PAGE_PRESENT | _PAGE_RW | _PAGE_ACCESSED | _PAGE_DIRTY)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:221:9: warning: "_PAGE_TABLE" redefined
     221 | #define _PAGE_TABLE              (__PP|__RW|_USR|___A|   0|___D|   0|   0| _ENC)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:58:9: note: this is the location of the previous definition
      58 | #define _PAGE_TABLE     (_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED | _PAGE_DIRTY)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:226:9: warning: "__PAGE_KERNEL_EXEC" redefined
     226 | #define __PAGE_KERNEL_EXEC       (__PP|__RW|   0|___A|   0|___D|   0|___G)
         |         ^~~~~~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:61:9: note: this is the location of the previous definition
      61 | #define __PAGE_KERNEL_EXEC                                              \
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:247:9: warning: "PAGE_KERNEL" redefined
     247 | #define PAGE_KERNEL             __pgprot_mask(__PAGE_KERNEL            | _ENC)
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:67:9: note: this is the location of the previous definition
      67 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | _PAGE_ACCESSED)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:249:9: warning: "PAGE_KERNEL_RO" redefined
     249 | #define PAGE_KERNEL_RO          __pgprot_mask(__PAGE_KERNEL_RO         | _ENC)
         |         ^~~~~~~~~~~~~~
   include/linux/pgtable.h:1963:10: note: this is the location of the previous definition
    1963 | # define PAGE_KERNEL_RO PAGE_KERNEL
         |          ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:250:9: warning: "PAGE_KERNEL_EXEC" redefined
     250 | #define PAGE_KERNEL_EXEC        __pgprot_mask(__PAGE_KERNEL_EXEC       | _ENC)
         |         ^~~~~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:68:9: note: this is the location of the previous definition
      68 | #define PAGE_KERNEL_EXEC        __pgprot(__PAGE_KERNEL_EXEC)
         |         ^~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/pgtable_types.h:277:
   arch/x86/include/asm/pgtable_64_types.h:21:34: error: conflicting types for 'pte_t'; have 'struct <anonymous>'
      21 | typedef struct { pteval_t pte; } pte_t;
         |                                  ^~~~~
   arch/um/include/asm/page.h:32:39: note: previous declaration of 'pte_t' with type 'pte_t'
      32 | typedef struct { unsigned long pte; } pte_t;
         |                                       ^~~~~
   arch/x86/include/asm/pgtable_64_types.h:22:34: error: conflicting types for 'pmd_t'; have 'struct <anonymous>'
      22 | typedef struct { pmdval_t pmd; } pmd_t;
         |                                  ^~~~~
   arch/um/include/asm/page.h:37:39: note: previous declaration of 'pmd_t' with type 'pmd_t'
      37 | typedef struct { unsigned long pmd; } pmd_t;
         |                                       ^~~~~
>> arch/x86/include/asm/pgtable_64_types.h:39:9: warning: "ARCH_PAGE_TABLE_SYNC_MASK" redefined
      39 | #define ARCH_PAGE_TABLE_SYNC_MASK \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1480:9: note: this is the location of the previous definition
    1480 | #define ARCH_PAGE_TABLE_SYNC_MASK 0
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
   include/linux/pgtable.h:2154:9: note: this is the location of the previous definition
    2154 | #define MAX_PTRS_PER_P4D PTRS_PER_P4D
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
   arch/um/include/asm/pgtable.h:53:9: note: this is the location of the previous definition
      53 | #define VMALLOC_START   ((high_physmem + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1))
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:133:9: warning: "VMALLOC_END" redefined
     133 | #define VMALLOC_END             VMEMORY_END
         |         ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:54:9: note: this is the location of the previous definition
      54 | #define VMALLOC_END     (TASK_SIZE-2*PAGE_SIZE)
         |         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:171:9: warning: "MODULES_VADDR" redefined
     171 | #define MODULES_VADDR           (__START_KERNEL_map + KERNEL_IMAGE_SIZE)
         |         ^~~~~~~~~~~~~
   arch/um/include/asm/pgtable.h:55:9: note: this is the location of the previous definition
      55 | #define MODULES_VADDR   VMALLOC_START
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:174:10: warning: "MODULES_END" redefined
     174 | # define MODULES_END            _AC(0xffffffffff000000, UL)
         |          ^~~~~~~~~~~


vim +/ARCH_PAGE_TABLE_SYNC_MASK +39 arch/x86/include/asm/pgtable_64_types.h

ed7588d5dc6f5e Kiryl Shutsemau 2018-05-18  38  
6659d027998083 Harry Yoo       2025-08-18 @39  #define ARCH_PAGE_TABLE_SYNC_MASK \
6659d027998083 Harry Yoo       2025-08-18  40  	(pgtable_l5_enabled() ? PGTBL_PGD_MODIFIED : PGTBL_P4D_MODIFIED)
6659d027998083 Harry Yoo       2025-08-18  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
