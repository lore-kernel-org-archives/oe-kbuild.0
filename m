Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B51386C9
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 23:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204572; cv=none; b=I2VkzR8tDhblWTSapajXc+9hGdfF3t6+icclew7KusHwbL6/ZtRTkewektuRlkfZpwolFvkYXIAAxTCgIE0Ph/fVG7LIaXAmo6sF6a0zdNTrg1DkggCPMpNkCFB86zggEcxFaZRq1SrIIuuiDWIjsQl+nkM24QgBaQgAeN7GBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204572; c=relaxed/simple;
	bh=cLZQrs0l2n087OLSl1O7xmp6Gibsy4hac/tC5+SeHrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UHZtbbztQNrnRe7aAxaVZ+UfirTYiP0NxpgUd2WxqyRkf8mtHsRjFTLBZcVfglSc+EHy3S1q3nudYr+bViRxnufJabpG5wdQ1/Hh0P0OAIPlfUjkgulMbC6z6dw5HhFiIaz2b8AWclmX8xmFQm7YmLEm7LiRhN+qTvYYI24HYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CubwEtLL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CubwEtLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790204570; x=1821740570;
  h=date:from:to:cc:subject:message-id;
  bh=cLZQrs0l2n087OLSl1O7xmp6Gibsy4hac/tC5+SeHrg=;
  b=CubwEtLLVuGaF0avO9zrcJuT460XsjpGykKTymYTiFJPr8vvElGvy5uT
   YWwTi2OlYGuSwDEbs3wRwEvvcknXa/Fc8fg58WiAJqWzoydr320wmNcrp
   hCma1wEB+q9f62M7zHvn6FFTFYnZYV00SBdB5/c/5XjRTNSul9w5vNZFJ
   ko/TT4XIqJWCSgUKzpG7AMeL88swrKvOF1HEcmp03ZWB/T+EEJ6pPUX5P
   BYzuNeV2rmByyVJJocBBuaOXKJEAS3olYoJrtJtiPtq3NX5VI+AR2bKgY
   NLb5ziegLTC1PvkLfK0JM8NT3U+B8IcWc8xh4wmTpVXxzJaVaZWC8MoQy
   w==;
X-CSE-ConnectionGUID: xlc8z3A+StquYsTWv7lGlg==
X-CSE-MsgGUID: m2eX11UHSA+7oXko6RhS1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78507994"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="78507994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:02:50 -0700
X-CSE-ConnectionGUID: h1TFUJYcRPax3/HYEmL1MQ==
X-CSE-MsgGUID: X5AAmbVWT8itK45vylZVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="278553038"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2026 16:02:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9VzC-00000000Hvc-38PS;
	Wed, 23 Sep 2026 23:02:46 +0000
Date: Thu, 24 Sep 2026 07:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/sparc/kernel/perf_regs.c:39:5: error: conflicting types
 for 'perf_reg_validate'
Message-ID: <202609240654.HWe45OzQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Stian-Halseth/perf-core-Let-an-arch-prepare-the-user-stack-before-it-is-dumped/20260922-221505, commit: eb8b7ebf8d9465ac22ef57720168a3b8183a91f5"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Stian Halseth <stian@itx.no>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Stian-Halseth/perf-core-Let-an-arch-prepare-the-user-stack-before-it-is-dumped/20260922-221505
head:   c221c81210abcb491cd4557f5cbcc2e652cbf127
commit: eb8b7ebf8d9465ac22ef57720168a3b8183a91f5 sparc64: Support PERF_SAMPLE_REGS_USER and PERF_SAMPLE_STACK_USER
date:   26 hours ago
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260924/202609240654.HWe45OzQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240654.HWe45OzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609240654.HWe45OzQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/kernel/perf_regs.c:39:5: error: conflicting types for 'perf_reg_validate'
      39 | int perf_reg_validate(u64 mask)
         |     ^
   include/linux/perf_regs.h:13:5: note: previous declaration is here
      13 | int perf_reg_validate(u64 mask, bool simd_enabled);
         |     ^
   1 error generated.


vim +/perf_reg_validate +39 arch/sparc/kernel/perf_regs.c

eb8b7ebf8d9465 Stian Halseth 2026-09-22  38  
eb8b7ebf8d9465 Stian Halseth 2026-09-22 @39  int perf_reg_validate(u64 mask)
eb8b7ebf8d9465 Stian Halseth 2026-09-22  40  {
eb8b7ebf8d9465 Stian Halseth 2026-09-22  41  	if (!mask || mask & REG_RESERVED)
eb8b7ebf8d9465 Stian Halseth 2026-09-22  42  		return -EINVAL;
eb8b7ebf8d9465 Stian Halseth 2026-09-22  43  
eb8b7ebf8d9465 Stian Halseth 2026-09-22  44  	return 0;
eb8b7ebf8d9465 Stian Halseth 2026-09-22  45  }
eb8b7ebf8d9465 Stian Halseth 2026-09-22  46  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
