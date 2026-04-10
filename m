Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5263DBD65
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842931; cv=none; b=KijzCrJjU4+9dw+CRqFZPKZ/RBzwIvgK7RlIiSUBfKu5fcQheVJkuH5N7OY0lJ30dkgzGGXv9ZiiwFfM6SjH5BrHx6MR8UN4f7ZslnX5xmDMndOtr+VnpqSz3nbYhXTy33RI09seKfzFCQJyQUMLQga30OpHcvUrFPYygYNAHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842931; c=relaxed/simple;
	bh=Fm+WoAqzOCSFN/E28lPcZm0U5swcHXMzgeY2nncKcYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jPMV/Qg2IkLa7EhAbhgYDsaM+9XwGcR0GzFxlSzz4RMGJnSx6mKI2jXPKXMH36cLedpmGm611uMPym/fJ5iYEs8T+xMA5GHp0VTBCMeGTl+YoS2FelL3dB7Td9HktvYe7ohVhKegETpIeRJi165pVptF3NYbbwLPOK5n58fVdsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMuIPbql; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMuIPbql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775842929; x=1807378929;
  h=date:from:to:cc:subject:message-id;
  bh=Fm+WoAqzOCSFN/E28lPcZm0U5swcHXMzgeY2nncKcYc=;
  b=PMuIPbqlKeyRy7M3hEKRYUGxc6X+ml7hXgKQMKOKea+2Jm3qMfeLMZdM
   yWVml+ImcehMa8wexDGxTh8E4T7ovIMR0/EVxoBTsgfJAXltDjLB5/xqt
   thjdEyivltg2idajsZO+th5NpIa4KL/ni/wqP7kNHhPGIU2Ost5wJRsXI
   13kCIDXeaqXkkThaSy1QbxjlBuvaujd623PK8/vAoCYVcgj4axaFdNIXe
   wQ2UNVEwntpWrASWTTAOUPvbJSnjGJqLnYW4IT9jitkIPruuLM15Ep7JP
   hfAL7WziMJmT0EtlJEtxbe8nP9OLpgmbeVjKR8fzhVYAG9NNjTD7ssZOF
   Q==;
X-CSE-ConnectionGUID: wzXugXGPQcmvbrXPkqS/uA==
X-CSE-MsgGUID: 9XpN7RaFRX67rHdAyRhm2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79456347"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="79456347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 10:42:09 -0700
X-CSE-ConnectionGUID: dODzeQeJTVeqI/lt7WOaEg==
X-CSE-MsgGUID: VbSjshJWS0K1ZMsfLdceLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252345924"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2026 10:42:06 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBFrp-0000000046v-0Z4M;
	Fri, 10 Apr 2026 17:42:05 +0000
Date: Sat, 11 Apr 2026 01:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [fustini:b4/ssqosid-cbqri-rqsc 15/19]
 arch/riscv/kernel/qos/qos_resctrl.c:40:2: error: implicit declaration of
 function 'iowrite64'; did you mean 'iowrite32'?
Message-ID: <202604110127.A9TP1tkS-lkp@intel.com>
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
config: riscv-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110127.A9TP1tkS-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110127.A9TP1tkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604110127.A9TP1tkS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_cbm':
>> arch/riscv/kernel/qos/qos_resctrl.c:40:2: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     iowrite64(cbm, ctrl->base + reg_offset);
     ^~~~~~~~~
     iowrite32
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_rbwb':
>> arch/riscv/kernel/qos/qos_resctrl.c:50:8: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     reg = ioread64(ctrl->base + reg_offset);
           ^~~~~~~~
           ioread32
   In file included from <command-line>:
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_wait_busy_flag':
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
--
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:19: note: in expansion of macro 'FIELD_GET'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                      ^~~~~~~~~
   In file included from arch/riscv/kernel/qos/internal.h:5,
                    from arch/riscv/kernel/qos/qos_resctrl.c:15:
   include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/bitfield.h:98:28: note: in definition of macro '__FIELD_GET'
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                               ^~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:19: note: in expansion of macro 'FIELD_GET'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                      ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:33:45: note: in expansion of macro 'GENMASK'
    #define CBQRI_BC_CAPABILITIES_MRBWB_MASK    GENMASK(47, 32)
                                                ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:29: note: in expansion of macro 'CBQRI_BC_CAPABILITIES_MRBWB_MASK'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bitfield.h:98:28: note: in definition of macro '__FIELD_GET'
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                               ^~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:19: note: in expansion of macro 'FIELD_GET'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                      ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:33:45: note: in expansion of macro 'GENMASK'
    #define CBQRI_BC_CAPABILITIES_MRBWB_MASK    GENMASK(47, 32)
                                                ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:29: note: in expansion of macro 'CBQRI_BC_CAPABILITIES_MRBWB_MASK'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:48:20: warning: left shift count >= width of type [-Wshift-count-overflow]
          (type_max(t) << (l) &    \
                       ^~
   include/linux/bitfield.h:47:38: note: in definition of macro '__bf_shf'
    #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                         ^
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:19: note: in expansion of macro 'FIELD_GET'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                      ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:33:45: note: in expansion of macro 'GENMASK'
    #define CBQRI_BC_CAPABILITIES_MRBWB_MASK    GENMASK(47, 32)
                                                ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:29: note: in expansion of macro 'CBQRI_BC_CAPABILITIES_MRBWB_MASK'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: warning: right shift count >= width of type [-Wshift-count-overflow]
           type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
                       ^~
   include/linux/bitfield.h:47:38: note: in definition of macro '__bf_shf'
    #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                         ^
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:19: note: in expansion of macro 'FIELD_GET'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                      ^~~~~~~~~
   include/linux/bits.h:51:24: note: in expansion of macro 'GENMASK_TYPE'
    #define GENMASK(h, l)  GENMASK_TYPE(unsigned long, h, l)
                           ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:33:45: note: in expansion of macro 'GENMASK'
    #define CBQRI_BC_CAPABILITIES_MRBWB_MASK    GENMASK(47, 32)
                                                ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:29: note: in expansion of macro 'CBQRI_BC_CAPABILITIES_MRBWB_MASK'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:98:35: warning: right shift count is negative [-Wshift-count-negative]
      (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask)); \
                                      ^~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:385:19: note: in expansion of macro 'FIELD_GET'
     ctrl->bc.mrbwb = FIELD_GET(CBQRI_BC_CAPABILITIES_MRBWB_MASK, reg);
                      ^~~~~~~~~
   In file included from <command-line>:
   In function 'cbqri_wait_busy_flag.part.4',
       inlined from 'cbqri_wait_busy_flag' at arch/riscv/kernel/qos/qos_resctrl.c:67:12:
>> include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_222' declared with attribute error: FIELD_GET: mask is zero
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
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
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_cc_alloc_op':
   include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_247' declared with attribute error: FIELD_GET: mask is zero
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
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
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_bc_alloc_op':
   include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_262' declared with attribute error: FIELD_GET: mask is zero
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
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
   arch/riscv/kernel/qos/qos_resctrl.c:198:11: note: in expansion of macro 'FIELD_GET'
     status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
              ^~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_probe_feature.isra.7.constprop':
   include/linux/compiler_types.h:706:38: error: call to '__compiletime_assert_272' declared with attribute error: FIELD_GET: mask is zero
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:687:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
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
   arch/riscv/kernel/qos/qos_resctrl.c:269:12: note: in expansion of macro 'FIELD_GET'
     *status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
               ^~~~~~~~~
   In function 'cbqri_probe_bc',
       inlined from 'cbqri_probe_controller' at arch/riscv/kernel/qos/qos_resctrl.c:476:9,


vim +40 arch/riscv/kernel/qos/qos_resctrl.c

f059ca8e1b4643 Drew Fustini 2026-04-06  33  
f059ca8e1b4643 Drew Fustini 2026-04-06  34  /* Set capacity block mask (cc_block_mask) */
f059ca8e1b4643 Drew Fustini 2026-04-06  35  static void cbqri_set_cbm(struct cbqri_controller *ctrl, u64 cbm)
f059ca8e1b4643 Drew Fustini 2026-04-06  36  {
f059ca8e1b4643 Drew Fustini 2026-04-06  37  	int reg_offset;
f059ca8e1b4643 Drew Fustini 2026-04-06  38  
f059ca8e1b4643 Drew Fustini 2026-04-06  39  	reg_offset = CBQRI_CC_BLOCK_MASK_OFF;
f059ca8e1b4643 Drew Fustini 2026-04-06 @40  	iowrite64(cbm, ctrl->base + reg_offset);
f059ca8e1b4643 Drew Fustini 2026-04-06  41  }
f059ca8e1b4643 Drew Fustini 2026-04-06  42  
f059ca8e1b4643 Drew Fustini 2026-04-06  43  /* Set the Rbwb (reserved bandwidth blocks) field in bc_bw_alloc */
f059ca8e1b4643 Drew Fustini 2026-04-06  44  static void cbqri_set_rbwb(struct cbqri_controller *ctrl, u64 rbwb)
f059ca8e1b4643 Drew Fustini 2026-04-06  45  {
f059ca8e1b4643 Drew Fustini 2026-04-06  46  	int reg_offset;
f059ca8e1b4643 Drew Fustini 2026-04-06  47  	u64 reg;
f059ca8e1b4643 Drew Fustini 2026-04-06  48  
f059ca8e1b4643 Drew Fustini 2026-04-06  49  	reg_offset = CBQRI_BC_BW_ALLOC_OFF;
f059ca8e1b4643 Drew Fustini 2026-04-06 @50  	reg = ioread64(ctrl->base + reg_offset);
f059ca8e1b4643 Drew Fustini 2026-04-06  51  	reg &= ~CBQRI_CONTROL_REGISTERS_RBWB_MASK;
f059ca8e1b4643 Drew Fustini 2026-04-06  52  	reg |= FIELD_PREP(CBQRI_CONTROL_REGISTERS_RBWB_MASK, rbwb);
f059ca8e1b4643 Drew Fustini 2026-04-06  53  	iowrite64(reg, ctrl->base + reg_offset);
f059ca8e1b4643 Drew Fustini 2026-04-06  54  }
f059ca8e1b4643 Drew Fustini 2026-04-06  55  

:::::: The code at line 40 was first introduced by commit
:::::: f059ca8e1b46435bda65e41248ff09ca7330c7f1 RISC-V: QoS: add CBQRI hardware interface

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
