Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47693C3BE8
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829168; cv=none; b=LStPwxjoMtZ5xjGy8NB0Zil7T3Qti5HLT/1ahTCuELIcVa+xlPr6JhXxoSm/gOEL/28A8L/QNDWe3DXEhT01pWLdoN8V3jziNPDnNu9NGNfNwF5TVQvsMMUc9ak5YKsjLbqSoVh5bq4vUvYoejb4IpPD685ni/dbOhvoxBIAxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829168; c=relaxed/simple;
	bh=Ci09SFMouSX3O73EZmVTkcWGU3ihBCKZijF3zT9PvaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fkZ8zJ/6K40RZGHwYiFoL3kD1xVh0C8kHAWg3ksyKZpQRSG+zYJ0a832KKtHuyif9PWsNxRp1K4eGxNjnFau3un9c7jpb3fCdUX2DB99YBqvk25v+rKL14u8XR2SzUaw0TIuwIpPTE0DzAs5tk9TFKgkG847z7GTiMuYjYvMH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNf9BH67; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNf9BH67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775829165; x=1807365165;
  h=date:from:to:cc:subject:message-id;
  bh=Ci09SFMouSX3O73EZmVTkcWGU3ihBCKZijF3zT9PvaM=;
  b=ZNf9BH678HUczCSfI17bFIk+bSVaasOBWOPGKxMws+Yi/B+g7cpzRsqa
   Z1XvI/BNDFc5GulkIr03FeXeM06T2guolsoUZH7hjM+2VH0g5koPxRCWQ
   ZRhPQYr+xxwEyJ2a6dRVnfkyxjhMjx7dV5D5dUiuW4ao7+wbGW8OOlvq9
   soq/rSW0d69uVm7rKvC+GBuVEmr0eGKydRDw4NyUjfpytlBWpUFG/r4EQ
   Wnunz7g1ydxg20ij7xBctc9xcuhBFpUgHG0rQ6GjfZ6DDU1vjAce6/Ehh
   eWWd4RU6uG7LpJxF3Wu6D/SE4h9t14YSyFBR3EIZVU/34a1n62qivk3q5
   A==;
X-CSE-ConnectionGUID: Eaets373Q8eGDTuSUnOFPA==
X-CSE-MsgGUID: SrUDbB2BSSuc//afMROALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99482252"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="99482252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:52:45 -0700
X-CSE-ConnectionGUID: NJxej8yPSCqonchuE10NWg==
X-CSE-MsgGUID: Ocj6C/PkR2KYi/rOvk+u9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="229005412"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2026 06:52:43 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBCHo-000000003nh-1i1t;
	Fri, 10 Apr 2026 13:52:40 +0000
Date: Fri, 10 Apr 2026 21:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [fustini:b4/ssqosid-cbqri-rqsc 15/19]
 include/linux/bits.h:48:20: warning: left shift count >= width of type
Message-ID: <202604102136.uRJQobPn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Drew Fustini <fustini@kernel.org>
CC: Adrien Ricciardi <aricciardi@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri-rqsc
head:   11e30be7cbd915592685a3e18bcf53f4ff0c94f7
commit: bfd6a2f1cb6b4fd665530e33c5452f95040e86e6 [15/19] RISC-V: QoS: add to build when CONFIG_RISCV_ISA_SSQOSID set
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604102136.uRJQobPn-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102136.uRJQobPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604102136.uRJQobPn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_cbm':
   arch/riscv/kernel/qos/qos_resctrl.c:40:2: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     iowrite64(cbm, ctrl->base + reg_offset);
     ^~~~~~~~~
     iowrite32
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_rbwb':
   arch/riscv/kernel/qos/qos_resctrl.c:50:8: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     reg = ioread64(ctrl->base + reg_offset);
           ^~~~~~~~
           ioread32
   In file included from <command-line>:
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_wait_busy_flag':
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:71:16: warning: right shift count is negative [-Wshift-count-negative]
         ~((_mask) >> __bf_shf(_mask)) & \
                   ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:75:18: warning: left shift count is negative [-Wshift-count-negative]
               (1ULL << __bf_shf(_mask))); \
                     ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:21: note: in expansion of macro '__bf_shf'
               (1ULL << __bf_shf(_mask))); \
                        ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:75:18: warning: left shift count is negative [-Wshift-count-negative]
               (1ULL << __bf_shf(_mask))); \
                     ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   In file included from arch/riscv/kernel/qos/internal.h:5,
                    from arch/riscv/kernel/qos/qos_resctrl.c:15:
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/bitfield.h:98:28: note: in definition of macro '__FIELD_GET'
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                               ^~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bitfield.h:98:28: note: in definition of macro '__FIELD_GET'
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                               ^~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/bitfield.h:47:38: note: in definition of macro '__bf_shf'
    #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                         ^
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bitfield.h:47:38: note: in definition of macro '__bf_shf'
    #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                         ^
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:20: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:98:35: warning: right shift count is negative [-Wshift-count-negative]
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                                      ^~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:75:10: note: in expansion of macro 'FIELD_GET'
      busy = FIELD_GET(CBQRI_CONTROL_REGISTERS_BUSY_MASK, reg);
             ^~~~~~~~~
   In file included from <command-line>:
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_cc_alloc_op':
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
     ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:19: note: in expansion of macro '__bf_cast_unsigned'
     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >  \
                      ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:3: note: in expansion of macro '__BF_FIELD_CHECK_REG'
      __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: "); \
      ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero"); \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:19: note: in expansion of macro '__bf_shf'
         ~((_mask) >> __bf_shf(_mask)) & \
                      ^~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:71:16: warning: right shift count is negative [-Wshift-count-negative]
         ~((_mask) >> __bf_shf(_mask)) & \
                   ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
     ^~~~~~~~~~~~
   include/linux/bitfield.h:74:3: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +   \
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:40:46: note: in expansion of macro 'GENMASK'
    #define CBQRI_CONTROL_REGISTERS_STATUS_MASK  GENMASK(38, 32)
                                                 ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:125:21: note: in expansion of macro 'CBQRI_CONTROL_REGISTERS_STATUS_MASK'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);


vim +48 include/linux/bits.h

31299a5e0211241 Vincent Mailhol 2025-03-26  35  
19408200c094858 Vincent Mailhol 2025-03-26  36  /*
19408200c094858 Vincent Mailhol 2025-03-26  37   * Generate a mask for the specified type @t. Additional checks are made to
19408200c094858 Vincent Mailhol 2025-03-26  38   * guarantee the value returned fits in that type, relying on
19408200c094858 Vincent Mailhol 2025-03-26  39   * -Wshift-count-overflow compiler check to detect incompatible arguments.
19408200c094858 Vincent Mailhol 2025-03-26  40   * For example, all these create build errors or warnings:
19408200c094858 Vincent Mailhol 2025-03-26  41   *
19408200c094858 Vincent Mailhol 2025-03-26  42   * - GENMASK(15, 20): wrong argument order
19408200c094858 Vincent Mailhol 2025-03-26  43   * - GENMASK(72, 15): doesn't fit unsigned long
19408200c094858 Vincent Mailhol 2025-03-26  44   * - GENMASK_U32(33, 15): doesn't fit in a u32
19408200c094858 Vincent Mailhol 2025-03-26  45   */
19408200c094858 Vincent Mailhol 2025-03-26  46  #define GENMASK_TYPE(t, h, l)					\
19408200c094858 Vincent Mailhol 2025-03-26  47  	((t)(GENMASK_INPUT_CHECK(h, l) +			\
19408200c094858 Vincent Mailhol 2025-03-26 @48  	     (type_max(t) << (l) &				\
19408200c094858 Vincent Mailhol 2025-03-26  49  	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
19408200c094858 Vincent Mailhol 2025-03-26  50  

:::::: The code at line 48 was first introduced by commit
:::::: 19408200c094858d952a90bf4977733dc89a4df5 bits: introduce fixed-type GENMASK_U*()

:::::: TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
