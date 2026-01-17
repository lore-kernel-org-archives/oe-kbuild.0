Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A904C6C
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768645914; cv=none; b=MOEuLn9EAn+UIlqQSOuHiuas+W4x4ME4BDQrJYeumqgcjd6IxaYBz5B2X98jrSJT8y7xkDSaAAMQbIUSAjJrUJTZ6gDwqrbsLA9FVjQ52/sNuKWD0nCKiTul9Mx4bwqc0DN+90tMme1fBh80Wsu1CMfh6POzNx1oz2qnv+FxhMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768645914; c=relaxed/simple;
	bh=5nAPap1bFdEcEB6BnGLRRgh3L3qfwwu/gJ5osc75wak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtPsFURMTikrl0qC8ka0rn8sO2s40SBdTznhmVblVxMi9N0BtMZOic3NOza+kjd7fe3JIpOmTgBEGxMKNGtcM51GnkdwfSNNOmBN1iIhN2zxGl2KRSVuYXI2Woh4QzNTv5Lc3+byA+lG9H7+xeqL7PtGZurYyGJKrRi74NVJ1cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIfrkokL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIfrkokL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768645913; x=1800181913;
  h=date:from:to:cc:subject:message-id;
  bh=5nAPap1bFdEcEB6BnGLRRgh3L3qfwwu/gJ5osc75wak=;
  b=jIfrkokL6Bu9YyqETDZcBwyhfOZyuoDa3taWmadS9RXwjOUAV3cPix3+
   Umos50KVw6sSzUO7LvaPSEIYCxD0/lXoScB+qdrUSVCgZlajq2kBcviGl
   8vqFfoFPNFA6iayVwMki8aKUTJi2KqZLcUZyMqOnrxexM1ezl9u70+TQC
   49ud+trbyq2bSxaymBxyBJCEBfEhYBbR7l+hULvD0iEZ3lqxyfA+VjV6d
   bbEKRpzdE3DwXEeDtCJK7bwBsIvDadt0NtDxzkrg+G05ak6EPuwqMMP0f
   kxp45iL3x8jpZbYzC9gg/n6YZT9jC3VbIIIIOh9HVW5tJ47ffLcy1M7Ye
   Q==;
X-CSE-ConnectionGUID: hwY60/vRRCOp16mSKpvOmA==
X-CSE-MsgGUID: EBHDO8gpQeyjoftglkhdlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="72531418"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="72531418"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 02:31:52 -0800
X-CSE-ConnectionGUID: 1gzORwJXTcub9TRyTYqxqw==
X-CSE-MsgGUID: Um1X+OwKTKGWdJqrquDkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="236139861"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jan 2026 02:31:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh3au-00000000LlN-2E7z;
	Sat, 17 Jan 2026 10:31:48 +0000
Date: Sat, 17 Jan 2026 18:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/s390/kernel/vdso/vdso.so.dbg: dynamic relocations are
 not supported
Message-ID: <202601171833.NOLCIAqW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dynamic relocations are not supported"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Jens Remus <jremus@linux.ibm.com>

Hi Heiko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: c0087d807ae86cc82cc356e366d2dccf0e3bb225 s390/vdso: Rename vdso64 to vdso
date:   8 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-r123-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171833.NOLCIAqW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171833.NOLCIAqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601171833.NOLCIAqW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h: In function 'mm_cid_get':
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
     struct cpumask *cpumask;
                     ^~~~~~~
>> arch/s390/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/s390/kernel/vdso/Makefile:54: arch/s390/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:154: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
