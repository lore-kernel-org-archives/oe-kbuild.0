Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2D0A95E
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 01:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769510; cv=none; b=KdY4/QnSBqQmBR1ONOpcVQ5gE7HIcuiWsh2JLI9AOn7l0B4Z854iuFpuaSUK2aEGKL+ddQReFwJpA4d4UfVmgdxOUjCD0LcMKEU9v4GrDJVanE/yy+mMCo0NMeGHAkGKtYOq948/KR6hS7KZplh/P4OerOEyp66oLut+McY4/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769510; c=relaxed/simple;
	bh=74e08MNGjI+ZGcBEhE/VdmRL1LEGfO9qmNUWMD5mhFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ylz6RV+qMejm0exL+O46/loaHvxLyDcIpNCisudHlD5xL+zKXwM4QTxEuOvim6rV9aQD/jtkvClNehWp59kltNauDpE10MgoMrfaECxnkZQifnd3PAG4jvqsBCaBkUtcYIAODUU4EIO4YHTlFIFe0v36vYimZlV6o1TaTVhRpA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWlvU6k8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWlvU6k8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784769509; x=1816305509;
  h=date:from:to:cc:subject:message-id;
  bh=74e08MNGjI+ZGcBEhE/VdmRL1LEGfO9qmNUWMD5mhFc=;
  b=IWlvU6k8SYW4d1f/SxiZwMghd759EmucG92eMUUy3xDz32jtJSAz38F9
   5KxP8VP9O7Ne2VzrOJVIwduzwiYTCFjKM3g3D+fDfm0jpbxkMm0JBC8Qw
   xzBtK8x6PcAZiLSyp4fkP9n80KYM8EQiLoWPE7WbJcc2Y3yHBDniNGgTE
   I8ebGFjgsaejLAXr44UMucfssUZ1oPTG+IvUcixjVIThqpGav3jtGhq/C
   eLqCGnETJdqsmenW8x6eyevpA5qO3GrM7zTx7L5GwVz7F0YjLCxQadlpF
   4rNpSA83UcC/B00BPuP5qe3mZj2gPZiTeRbjl5ap89J4wJT00xHyW8Ngt
   A==;
X-CSE-ConnectionGUID: FTXyGlrZQV+lOX0usyENTQ==
X-CSE-MsgGUID: VSV2hxQiS7epsYSqzWXYUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85610952"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="85610952"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 18:18:28 -0700
X-CSE-ConnectionGUID: 4bmEXneTQ9+oE20HwXeDOA==
X-CSE-MsgGUID: 8oNPwC5YRJ2ugluYd42TBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="255604753"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jul 2026 18:18:27 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmi4u-000000000co-3Cv7;
	Thu, 23 Jul 2026 01:18:24 +0000
Date: Thu, 23 Jul 2026 03:18:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb:
 dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
Message-ID: <202607230331.Luw8noE4-lkp@intel.com>
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
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/drm-bridge-synopsys-dw-dp-Fix-incorrect-resource-lifetimes-in-bind-callback/20260722-020521
head:   11840dced893f72206f912c652c851f2f77c7507
commit: 49b2aa7145a860909131f8f0505f939a01c7bd46 dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells
date:   31 hours ago
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2051-20260722 (https://download.01.org/0day-ci/archive/20260723/202607230331.Luw8noE4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ba2be3f8add2e63266686cb1bcd40c9fab07de7b)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607230331.Luw8noE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607230331.Luw8noE4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
