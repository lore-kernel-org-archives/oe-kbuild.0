Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313E158538
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763891034; cv=none; b=ZIFmzdjohxP1akrNHXRAVkIuwnq62Naq0pCl4NwQOfeHsk8M/wRlLm/c4O68O78/Q3Eglh0Hk5YuYiv2yAJfMnaWNnlejAMfH93jtNFdHdfiKbZZjzbjrqu7MXt3hKF3x6ULHUP+fRxjl30meP3DluSlG4AWnHfQVHYCXmwq//k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763891034; c=relaxed/simple;
	bh=q1EE+TydUBw8PHid8UKhdNgQBPXbCMnMMRZd2WVnvYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/PT8EQB75hKXbhWSQy0yzZ2WpONAQDwspf8ouihf5ItjAWO73u4GlbBckfyYuMi2ear1w+YabEmxwZuFdQW/SmD1WjAoL1Uq5lNYl3W3S03L7kIa7kA1W4LyvyynCWi5X2SfAbOcH2A/UIGnzSNcxsFTLCReua4X9ouUUXhaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji11Ke3I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji11Ke3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763891033; x=1795427033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1EE+TydUBw8PHid8UKhdNgQBPXbCMnMMRZd2WVnvYg=;
  b=Ji11Ke3I8UfkZwKbj+gMypJ+Yb6bPsvm+MNzywn63C/rkmu3p+msX3sr
   IxWmZSxMcQZng0eEVoup0wlifvXwv1hhq+jabfGV0kGrHtYfIhNG+drFq
   A/ObfZOkTrQbGztJWl5Ge/ovrlfh1ryOuHSWhFvQYu9ckeJqR9HA+E6P6
   KsiAdBrZoy2JP4nSwIWnHB3V64F5zTkPDgQ6Tgc+rC4bqJ0HY+GJih0p9
   +YB+MIfa1NCMGoGxG01VEvQwfcHVb4goRCbhB6jB0PxH+8h/SPlXevrE+
   wiw8pyQvjPXKgDHnTfz7Cu1Mv8+PFnwru/lQULMyQG4Pj/qD0tgLYgxZ7
   Q==;
X-CSE-ConnectionGUID: XPcpcM5ZSFO4caWktj/Xjw==
X-CSE-MsgGUID: 9mI4TNqESiufF8U/vDvVoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69538383"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="69538383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 01:43:52 -0800
X-CSE-ConnectionGUID: ZLfboxQCTy23G7wOxEVbug==
X-CSE-MsgGUID: vXxmfB8DQTSFSC8qFIi7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192852121"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Nov 2025 01:43:50 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vN6dI-000000002Nn-1SLo;
	Sun, 23 Nov 2025 09:43:48 +0000
Date: Sun, 23 Nov 2025 10:43:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:qcom/dt64 39/134]
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66
 (maxim,max77705): '#interrupt-cells', 'interrupt-controller' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202511231059.J6muQEAc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Dzmitry Sankouski <dsankouski@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/dt64
head:   f481e772e014da92fa1232de54e4cac66b5fc5e4
commit: 4372b15d89e253e40816f0bde100890cddd25a81 [39/134] arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts
:::::: branch date: 9 days ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251123/202511231059.J6muQEAc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231059.J6muQEAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231059.J6muQEAc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66 (maxim,max77705): '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): $nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@60' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
