Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14FA2EDD40
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062837; cv=none; b=gp/TjwhyJaC/+Ly0sUYSS5rVvv1Xb56Halgo2i9joowPfaB/BaUyk4qthH8//gFv0LvovBsoXP5hKh+FkaoyM0TvNzOmGnSEHQ6FX8H9g2qDZIB/jkdBvjsjQzohXoL7d6rURsX6T1NpN0JFT9U8p+GDgKoOpV7DNsLECil4l28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062837; c=relaxed/simple;
	bh=4GCtYXSuTRdL7Ut61uJeJpKFWwdmLxfy/qvTZGLyuBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eQnMG7tIHANoZX259SBnghMSu/rT83Pz+HxHVET6cj3/4kwAxui9WE547/dyJT+7oa7D3bIEP2CacRAP7SL0VXftdNjsr9zDecbYQdX/UHW/VbptxRAzUfnKEOUiPvWH0ETRZMdwO95hvPto7hB7IC+l99wCTIRsLEWCnEF89ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzl39xxa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzl39xxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778062835; x=1809598835;
  h=date:from:to:cc:subject:message-id;
  bh=4GCtYXSuTRdL7Ut61uJeJpKFWwdmLxfy/qvTZGLyuBE=;
  b=gzl39xxa+YWvQTzsZGHgu2IMREaldE04rNrlTheFF5q2V0Q+7hMLFSc5
   vrL0UnP8kBD3BnQE3n51PcvjG6mF5SKx3BMHGX/FGBCSXCauAyjobgELS
   jXNBbq6BOZD1wWCHY6+iEbeI4ffYkztrkvg3opu+OgJD6bImFgsa9fPpN
   1vqm2/F66a6hTm/ZF6LneyD6SMuUjf1QuvCWqb9rePGJei0c80oPUr/VK
   xXsUxazafvl9O4BpyUCSCXnZyD5CEqXKz5hwHDdOrLVNK2M9B5cP2nFkm
   6j6MFWAi28j9dOQMR2Sa5IZEiNFLQAk3oE3S0HOZWpW5hitpf0EmjRtNP
   Q==;
X-CSE-ConnectionGUID: 7yqCdBUaQNmRc1zAq7wP4g==
X-CSE-MsgGUID: XSOkGFvNQh+rDUCL59D84g==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78975264"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78975264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:20:35 -0700
X-CSE-ConnectionGUID: Afe5ph+wQtyMecFliZl/Ag==
X-CSE-MsgGUID: Ah8oS1CISaGbGW13E0GQZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="274229760"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2026 03:20:34 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKZMl-000000000sb-1vwa;
	Wed, 06 May 2026 10:20:31 +0000
Date: Wed, 06 May 2026 18:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2426/2999] error[E0080]: evaluation of
 constant value failed
Message-ID: <202605061804.ejfuwuAg-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
commit: 5643c6b2c8308b206cb01cbfd0e6ac80f9f1bc9a [2426/2999] LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-002-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061804.ejfuwuAg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061804.ejfuwuAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605061804.ejfuwuAg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0080]: evaluation of constant value failed
   --> rust/kernel/build_assert.rs:110:23
   |
   110 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation panicked: assertion failed: size_of::<isize>() == size_of::<isize_atomic_repr>()
   |
   ::: rust/kernel/sync/atomic/predefine.rs:100:1
   |
   100 | static_assert!(size_of::<isize>() == size_of::<isize_atomic_repr>());
   | -------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: evaluation of constant value failed
   --> rust/kernel/build_assert.rs:110:23
   |
   110 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation panicked: assertion failed: align_of::<isize>() == align_of::<isize_atomic_repr>()
   |
   ::: rust/kernel/sync/atomic/predefine.rs:101:1
   |
   101 | static_assert!(align_of::<isize>() == align_of::<isize_atomic_repr>());
   | ---------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: evaluation of constant value failed
   --> rust/kernel/build_assert.rs:110:23
   |
   110 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation panicked: assertion failed: size_of::<usize>() == size_of::<isize_atomic_repr>()
   |
   ::: rust/kernel/sync/atomic/predefine.rs:102:1
   |
   102 | static_assert!(size_of::<usize>() == size_of::<isize_atomic_repr>());
   | -------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: evaluation of constant value failed
   --> rust/kernel/build_assert.rs:110:23
   |
   110 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation panicked: assertion failed: align_of::<usize>() == align_of::<isize_atomic_repr>()
   |
   ::: rust/kernel/sync/atomic/predefine.rs:103:1
   |
   103 | static_assert!(align_of::<usize>() == align_of::<isize_atomic_repr>());
   | ---------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
