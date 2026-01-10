Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553D0C8EB
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768044714; cv=none; b=A/ctHEkvGRUkHe+CQoxYUl/0inOzeJ2NX1xGwcZbDsKpIvhIOuA6Y4eRjspMlmOAotZq0FMs+Q9Hds6jQrtLvdUcgJfy0WUb4KDkew8Q9o3DsoKFXM0PjZz2viSh96JNlF55c7hYHO2A1R2Rj170eNxBv1NC8eZIY6fpFJ3tPLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768044714; c=relaxed/simple;
	bh=gpeWJE1iYRTtuIECH903b9gSC7xWBLiy9Kj1ZaRLWDA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K3MTr7mJPUJPUG3sMG+hQUvggUMIbZAKAVuq6BpN/6txwjPZ6pP7zG+wvTrszUjq4H0QjxBPU75f/5YndIxDfJVQ08rfxLvN35IOwQ1qhiyLA9/LLH+ghO0kGBxrGyoGXNsYNBIjnn5RG3MgNDM7rNn0VIM3GFKKEgb434U39Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7Bx9qC6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7Bx9qC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768044712; x=1799580712;
  h=date:from:to:cc:subject:message-id;
  bh=gpeWJE1iYRTtuIECH903b9gSC7xWBLiy9Kj1ZaRLWDA=;
  b=J7Bx9qC6EEtem5+NNbAp3RxoIn/iDwiBDTPA3iSx58O2z1E/1grnaCil
   q67m6As6+LqBuDmuLnsC7XcsCqN0EsbqlUBbwHQbk62Q0Ftd990fX9Czg
   /RdR0QC2eEIDieN+AvgM33sNndRHCL/SiwE7wPR3vO66okvuywz3qVeNA
   JP2R1LZiP/4L5wo0h5yTnCEmgKvb4rmdkIT8gJNmujk0TJ0qOD/L7HpSj
   5+j5ZM2LRf5fOtbIDq9oY3NY52tSRBSlEkTHNN6pygPvZSxIl1Dgw+wJJ
   4Mu/cPrupDKvytYTEgUWu6Uay17PFKOcDFclPGUL3Vz39OH7YtJopY1EC
   A==;
X-CSE-ConnectionGUID: 3eo//yyeTzanzw8XB7nBmQ==
X-CSE-MsgGUID: k3gQoMynRcOeOzhfWnBq5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80508550"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80508550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 03:31:52 -0800
X-CSE-ConnectionGUID: MZ4MWYaaSp2w1IhQ+TN7iA==
X-CSE-MsgGUID: +nSddEgtTgCqoHoHtogxYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203758693"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jan 2026 03:31:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veXC8-000000008aa-3jNh;
	Sat, 10 Jan 2026 11:31:48 +0000
Date: Sat, 10 Jan 2026 19:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4156/5095]
 drivers/clk/qcom/cambistmclkcc-sm8750.c:453:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601101903.XopziuUm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/cambistmclkcc-sm8750.c:453:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Taniya Das <taniya.das@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: f9580bafd39cff31bd51031e8784ea44acddf20e [4156/5095] clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC
:::::: branch date: 31 hours ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r132-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101903.XopziuUm-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101903.XopziuUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601101903.XopziuUm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/cambistmclkcc-sm8750.c:453:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/cambistmclkcc-sm8750.c:453:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/cambistmclkcc-sm8750.c:454:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/cambistmclkcc-sm8750.c:454:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/qcom/cambistmclkcc-sm8750.c:454:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/cambistmclkcc-sm8750.c:454:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/clk/qcom/camcc-sm8750.c:46:22: sparse: sparse: decimal constant 2500000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
>> drivers/clk/qcom/camcc-sm8750.c:2709:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/camcc-sm8750.c:2709:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/camcc-sm8750.c:2710:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/camcc-sm8750.c:2710:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/qcom/camcc-sm8750.c:2710:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/camcc-sm8750.c:2710:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +453 drivers/clk/qcom/cambistmclkcc-sm8750.c

f9580bafd39cff Taniya Das 2025-12-02  452  
f9580bafd39cff Taniya Das 2025-12-02 @453  MODULE_DESCRIPTION("QTI CAMBISTMCLKCC SM8750 Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
