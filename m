Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D73859E9
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772076439; cv=none; b=gnZF+wm9Uzoaqao1gC9lUKBpLc6VsBVMp5Wrcx1TAlLXRJiP0yinEDc42RnoUBf2TxIluKOz62AssnNc+ksQfHJtPTJ31Rd9ahK8C/g+/PU4FGVuqxD0rhvlKLCo1DqLwkcOB4IrMBcfPPQv8QaIhmnhsnHkbyWU5VIh+C9X5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772076439; c=relaxed/simple;
	bh=1tyLSzKz7RYJEb+VfDFhOhMsoC8radvcVbhhghOEyPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aWBF0qbAp7O0tMOnf4zhgHl/1q3jhyFpLL04ldn7kl5adGteSLhbRwB44af+6Yu9E04mLBCoIKFru3xiSZvDMPRbeLt/7+fyw7y2Pd/C/Qj5fb22Z67JAXY+mMcIRY6VY7O8C0SEOT7TxYG1iiLHzaLaQJKNKw7q/S7Uy16cx2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADCp8t7x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADCp8t7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772076438; x=1803612438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1tyLSzKz7RYJEb+VfDFhOhMsoC8radvcVbhhghOEyPE=;
  b=ADCp8t7xE4uVrNdfmPgh2ATM/f6UsnbW4T533SDwz5o1Ta0qYPvsqv0W
   /R45l0in6b5VAhaySnMMtg/nDpdpRWLpgBoy3QUwshjeXF2rIzMTDddhB
   uC/aGWzSHR0q+cbe7g/YfolkL+q9seny6UGEos70wDpdKQkyAjFenWe+K
   47x2ilA2pJnAyQZaghqfeACEDo9gCa5WfwozDwzoaOTjxHwLQchbKaSKd
   a/5l451ew8uId+sy8g3oyb9VtX2XILcc15mmlCQNfQ4xFmUU5OvLF2PDB
   oiIbTrxEA40cT+42nQNH7qPU1yatL4UWCVgSTYo7QK5Fjas5EdmEoKP2W
   g==;
X-CSE-ConnectionGUID: cEE+OKytSJaQmMWSPoRTGg==
X-CSE-MsgGUID: 3ixKUYmbR1m2WyZLt/5WSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83460252"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="83460252"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 19:27:18 -0800
X-CSE-ConnectionGUID: aawijUGhT2CZuG8G0e6U+Q==
X-CSE-MsgGUID: tcf4o8ihSwKwIq6scW5Suw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="246973943"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Feb 2026 19:27:17 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvS1x-00000000809-1oid;
	Thu, 26 Feb 2026 03:27:13 +0000
Date: Thu, 26 Feb 2026 11:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [i915-ci-only NO-REVIEW 24/25] PREEMPT_RT injection
Message-ID: <202602261133.iUrP8Wec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260225131931.60724-25-dev@lankhorst.se>
References: <20260225131931.60724-25-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-gfx@lists.freedesktop.org

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on next-20260225]
[cannot apply to drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-xe/drm-xe-next linus/master v7.0-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-vblank_work-Add-methods-to-schedule-vblank_work-in-2-stages/20260226-012447
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260225131931.60724-25-dev%40lankhorst.se
patch subject: [i915-ci-only NO-REVIEW 24/25] PREEMPT_RT injection
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: loongarch-randconfig-r132-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261133.iUrP8Wec-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261133.iUrP8Wec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602261133.iUrP8Wec-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/rwsem.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
--
   kernel/locking/spinlock_rt.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow
>> arch/loongarch/include/asm/atomic-amo.h:61:1: sparse: sparse: constant integer operation overflow

vim +61 arch/loongarch/include/asm/atomic-amo.h

79974cc3ba45f3 Huacai Chen 2025-12-06  52  
79974cc3ba45f3 Huacai Chen 2025-12-06  53  #define ATOMIC_OPS(op, I, asm_op, c_op)					\
79974cc3ba45f3 Huacai Chen 2025-12-06  54  	ATOMIC_OP(op, I, asm_op)					\
79974cc3ba45f3 Huacai Chen 2025-12-06  55  	ATOMIC_OP_RETURN(op, I, asm_op, c_op, _db,         )		\
79974cc3ba45f3 Huacai Chen 2025-12-06  56  	ATOMIC_OP_RETURN(op, I, asm_op, c_op,    , _relaxed)		\
79974cc3ba45f3 Huacai Chen 2025-12-06  57  	ATOMIC_FETCH_OP(op, I, asm_op, _db,         )			\
79974cc3ba45f3 Huacai Chen 2025-12-06  58  	ATOMIC_FETCH_OP(op, I, asm_op,    , _relaxed)
79974cc3ba45f3 Huacai Chen 2025-12-06  59  
79974cc3ba45f3 Huacai Chen 2025-12-06  60  ATOMIC_OPS(add, i, add, +)
79974cc3ba45f3 Huacai Chen 2025-12-06 @61  ATOMIC_OPS(sub, -i, add, +)
79974cc3ba45f3 Huacai Chen 2025-12-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
