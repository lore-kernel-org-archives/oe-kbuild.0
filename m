Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD32135E1AF
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 18:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783534538; cv=none; b=Iwpgf4NsFxBlzzy0xf7u7sNRvHTMgYE0gCMOVsW/WDnHhw6aaZFHLDLQGSgSHZCXnejj5UDDwLijF+i3zCtdR0P6wwGQZtiu0QoWK/FdHkPqqpQaFF0mZfXVYMe6EvcaEkj7/Q40962WJFP8LWmyvIJa5AGEPi2xCLfY3Bf00wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783534538; c=relaxed/simple;
	bh=ZZSXUTgs75p8U8Va0LLT/7sqPWkRZYiIGmJTMQjgvCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ci54CANROytPwgccB70aq2xTjkWSOCnFfjrEBdxs5UEwfiF83cM4fGgbLKIeaYcNvYtewraj7ioMF6K2MyuVH4T7c2Ap4SZuT2pB+wSULwRxy1DdqsZe5CTkMkH3DF7XnUQGhuzIW310Fpo1x7dvFr+Sx+Me0VEYgt5nF3/a2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjsfHOZQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjsfHOZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783534534; x=1815070534;
  h=date:from:to:cc:subject:message-id;
  bh=ZZSXUTgs75p8U8Va0LLT/7sqPWkRZYiIGmJTMQjgvCI=;
  b=ZjsfHOZQDuqIQ67mHlKwqbyBDs1mOIzk/otfcKzq+sipA/5Qm/PMhXE6
   sGraYV2Q5YWFgmG0gmm4Ht8WGylSgt5RZoQcLMiukyROvIEV/OVHLXfUJ
   GSXZEaua/vPSmtZdUav61udNwERINxGtJ+IXC5Mo3Gn4exxibBmTMAqpU
   /ahrpKtA5qQUaE4ctBSKrgVI7phwxr1OJ8NoEkar/i98U+daSe5cZDOIL
   CH3mWE+ISsgZpxDT5LTYvcsD8uOYGlCy+Fp9fSjyvAm8D6+tPnWhRnAHr
   upZkFKT1aWUTNVcnfHwOLl30Wz0U4DxiVM0NyEJYPnIdnaPExywnd7Yn9
   g==;
X-CSE-ConnectionGUID: vtje0uG7Q3KLM1RKg0jlow==
X-CSE-MsgGUID: pujWh8U/T5eoX32Mtw2TkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71728672"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71728672"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 11:15:32 -0700
X-CSE-ConnectionGUID: wl1leyZrT4e19GxwyfEGfg==
X-CSE-MsgGUID: qEhKqWBvSMWjBktBNZpLQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253275789"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2026 11:15:32 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whWnx-000000002mT-164X;
	Wed, 08 Jul 2026 18:15:29 +0000
Date: Wed, 08 Jul 2026 20:15:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 62/196]
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: panel@0
 (flipkart,rimob-panel-nt35532-cs): compatible:
 ['flipkart,rimob-panel-nt35532-cs'] is too short
Message-ID: <202607082030.jGL6lsHg-lkp@intel.com>
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
TO: Cristian Cozzolino <cristian_ci@protonmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   e43584952ee7df0f72e8311341d780d84f03159c
commit: a8c0bd4233a9612f200a27f535b66e71eec289a6 [62/196] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260707 (https://download.01.org/0day-ci/archive/20260708/202607082030.jGL6lsHg-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082030.jGL6lsHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607082030.jGL6lsHg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: panel@0 (flipkart,rimob-panel-nt35532-cs): compatible: ['flipkart,rimob-panel-nt35532-cs'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/novatek,nt35532.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
