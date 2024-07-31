Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E06D2F5
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 01:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722391033; cv=none; b=Lby4gBnTvnt3gdS9gXVmp27xTQTnGPomiPu7XK0dVt0K7sjkrcb3ZM8Fyfb5VR405J7OgMkxtBVyGfOZsNdrg7JX2lGw1H5pOToHeU4I0OwEuF8S1H0D7h51fVMTJIhsYlsSmp3fBQZL77M5eFPcZAPSIARNl3IMgX+0SXzwunU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722391033; c=relaxed/simple;
	bh=Zo0kWGCBOwAzerQ9ZAHwpVlAJK9nutectn1aypIohF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bv9W3tH2HqhvMaVXBNaOEsY1v3Kcw9mIv91+pKdvM+B99vzUWubFHSJgNeYU0Xlu15KR4cE/FYVfB9IMwrQ5KcxcsMkBAPArXUcReSpPhJS9u37Dm4xFWJR1PrKbo9l8Oq5nnthJ0FM7r4Nz0wvdCQlxggTIx37+ThpAT+tSKTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrJCNoIo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrJCNoIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722391030; x=1753927030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zo0kWGCBOwAzerQ9ZAHwpVlAJK9nutectn1aypIohF0=;
  b=BrJCNoIoo1GuKH0/hiIv+plX2pnh+FkjwiOJDjJHRrsUIvAbdVcFcByt
   exZMdvvzOf202xC1wLFuwO/mp4+27vLNft3dnT38XshxOdvEAe8oZ67fE
   YBBi1owgeBd7YJ6ML7WvZW+gxvgabbW96j5rnlXel52RV0ct/c7RHNI/J
   KHEqWEK4b8dGmG9kZUb2vusP5TWZIQVSBflNVpfbzjokqLIimzln+afTM
   idJriTgiYh+qREUr1+yI1omqOPRTEYnYj8W02rlt+DFup+fE7B3DN2XaP
   ZaxYOy2qllhsWDhFrkLpfs9khp1Vug6QDjs+Ns5BoLQDZpNbTZOiC8Jr4
   w==;
X-CSE-ConnectionGUID: lgyCIBGAQKmADKN4YtGDTQ==
X-CSE-MsgGUID: tYLTs2IySNO7HxAVlCarZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20051912"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="20051912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 18:57:09 -0700
X-CSE-ConnectionGUID: 8oxoJyVRQ/+9yEVVaUXEuQ==
X-CSE-MsgGUID: z3yHf3pSQkqrmo49jGyAmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="58857315"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2024 18:57:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYyaQ-000tcL-2C;
	Wed, 31 Jul 2024 01:57:06 +0000
Date: Wed, 31 Jul 2024 09:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.12 22/22]
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: touchscreen@50:
 linux,keycodes: [580, 158] is too short
Message-ID: <202407310944.oePhsjt9-lkp@intel.com>
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
TO: Raymond Hackley <raymondhackley@protonmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.12
head:   4e597323ef3d28441c792a00a1faddf71350f090
commit: 4e597323ef3d28441c792a00a1faddf71350f090 [22/22] arm64: dts: qcom: msm8916-samsung-rossa: Add touchscreen
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240731/202407310944.oePhsjt9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310944.oePhsjt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310944.oePhsjt9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: magnetometer@12: 'mount-matrix' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/magnetometer/bosch,bmc150_magn.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: touchscreen@50: linux,keycodes: [580, 158] is too short
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: touchscreen@50: linux,keycodes: False schema does not allow [580, 158]
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
