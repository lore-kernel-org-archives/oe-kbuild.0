Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4921CC5A
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 04:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775882419; cv=none; b=UArwXqxfcKSNQVNz+qyxjuD0o+1jL86zIKbDw3QY5E+ALMJD8E12w+M/P8AmbAV8H1/6jYHUlajzHdM0xOGlIRdC7xdEDOHV9VmQjrRfAkH05z2fD1yMu02jGhHkM18exkL+yfmGcRgEedmHP24rpbEU5ZyKK/Ry00q7Ct3rwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775882419; c=relaxed/simple;
	bh=buWlHfpKy93BB5JE4pLUz70zsHnxyifN5jTSuAIBMvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JaMJRSSu1bzJx9hOQYdWWkkTO1go6mPVjaqcSH0P+9yZ4xI8Rpmq3Q2T7U4BSHOvEuNxL7BMYVHJYBfHqobjhcbX7GmW+kgg9+ifuVDkS4VoMZZfT0v+dqFjQibBS14bbkLsnhk4B3Kof5fGDC9CJJvsT1tBZA483DwgKRtI/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YP5LxRxV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YP5LxRxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775882417; x=1807418417;
  h=date:from:to:cc:subject:message-id;
  bh=buWlHfpKy93BB5JE4pLUz70zsHnxyifN5jTSuAIBMvE=;
  b=YP5LxRxVkSIE3mjWLM1ys1yfjvMtrgFgyEl8tq6pzo20aVDWtKPUemgj
   J0/3vpCVR8ae3NVSE4IROc5cEUtRleP/Lit540an88i0WUkONszQWseN7
   Dpnx1wuRwgsUIF+ufTAQMcrgbxI7eLYiPstlflZdLJT0CNUCPSUXniqPy
   szgsk3T366STlx6XBvmvqG7vKnCmytweSUKfEO/G0Pptc392fVqH7G0Um
   6uKHfmkgFhHgaROvSkk7tf2QkkH3utE91EFsuct1RtEA5Esgv2G0BGj5U
   qLJ70XJT13jUR79WGdTJ8N0Pb/PTtW/m8QBEuiePxR9VqcovmWmyUmZfa
   w==;
X-CSE-ConnectionGUID: Rg9TBdCiTwGiTVvNhhKvUw==
X-CSE-MsgGUID: NYlgjpRCTj6YrKIq20FEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77083161"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="77083161"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 21:40:16 -0700
X-CSE-ConnectionGUID: hXwOPnAzTcaszIKYnMVbgQ==
X-CSE-MsgGUID: lKpL1nOOQ5mCgGbkxu0wIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="229193063"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2026 21:40:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBQ8j-00000000B0v-3Ew7;
	Sat, 11 Apr 2026 04:40:13 +0000
Date: Sat, 11 Apr 2026 06:40:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 86/106]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1-el2.dtb: remoteproc@62400000
 (qcom,sc7180-adsp-pas): Unevaluated properties are not allowed
 ('qcom,broken-reset' was unexpected)
Message-ID: <202604110632.YvSAUqAY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Stephan Gerhold <stephan@gerhold.net>
CC: Sebastian Reichel <sre@kernel.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: c30c82c57888685a7320fd80062511ceb727fba7 [86/106] arm64: dts: qcom: sc7180-el2: Add qcom,broken-reset where needed
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-2052-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110632.YvSAUqAY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110632.YvSAUqAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604110632.YvSAUqAY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1-el2.dtb: remoteproc@62400000 (qcom,sc7180-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc7180-pas.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
