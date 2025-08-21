Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141051388
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779560; cv=none; b=ZFrNAvneAWNvXnVjygRIvWf/8Kft8MBexyHG90iI2cEd3LHk/kroYtj4OZdWakRrST1rEGetlX6vE9QBadCAHeXYwOTB8e+OaLbGf/JLOjtSl9hFIrDpOnrl+SE3np1dzTGvOj1T3iHkwm3LNSdMVuzAZXXL45f211UXmFLbG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779560; c=relaxed/simple;
	bh=NwBQ07iX0hqNID4ZnX2olCckRiwZ667xulHWKp4H/Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9seym8wqdjOfG9ECVyFsZtVGa2wLuZSzhMxd0CVUycHWlimiv6UHVB2glx4vnyuwFtxsrIEgZSx28OiBevzk5LwlWFvX7f2tvBEzFVr5zEMS8qClRCCfjh53KbYo4Achi99OuQFPuBC7Vkuq+GucEMOGFMe+oh+drrcgA2REOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpuBNsrQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpuBNsrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755779559; x=1787315559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NwBQ07iX0hqNID4ZnX2olCckRiwZ667xulHWKp4H/Zk=;
  b=WpuBNsrQrL5GiOWmfEq5adMSBKYIdL2l8BxYohTCL1IGd6Fo/5rnDFFi
   C6HT8wBFspjc+WMM8k9ztenXarDLYFAPRhVOXWCRQpp5F+su3VdR7VQyf
   bMKMlRC3vMPxFGnHxlpOtRZsD+5UUku68Z75L+bfedSWt218nwDBVoj0z
   sodEvOE0WuGsSPBNWHyMO7JprFwfhOM3uOxPBu/obuxsHmgUVapPbu6hz
   yOFozOo7HrdeXAsXYH5HiFIVPqruGorTGjI2Or0nCIxXuQACwxBDH/wvE
   rNGHeqDyFCgAOtP81GukAVq+gX0vyugpypQAjqjhQkckRTlaU5FLQfiqA
   g==;
X-CSE-ConnectionGUID: wU5mKQ+FT06Z5hGFR6EXRA==
X-CSE-MsgGUID: 5pvA0Ja3S0Wa1xDUp7Pnng==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61894504"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61894504"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:32:38 -0700
X-CSE-ConnectionGUID: wwHMGaNVT0C3b7LETxBIpA==
X-CSE-MsgGUID: jnXZdy3rQ4CQKaPiajHj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172619206"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2025 05:32:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up4SH-000KGN-04;
	Thu, 21 Aug 2025 12:31:48 +0000
Date: Thu, 21 Aug 2025 20:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf
 requirements
Message-ID: <202508212032.ppho9zJb-lkp@intel.com>
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
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>
CC: Diederik de Haas <didi.debian@cknow.org>
CC: linux-pm@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: kernel@collabora.com
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/thermal-rockchip-unify-struct-rockchip_tsadc_chip-format/20250821-014309
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8%40kernel.org
patch subject: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf requirements
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212032.ppho9zJb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212032.ppho9zJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508212032.ppho9zJb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[52]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: ethernet@ff550000 (rockchip,rk3328-gmac): Unevaluated properties are not allowed ('assigned-clock-rate' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[57]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[55]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: ethernet@ff550000 (rockchip,rk3328-gmac): Unevaluated properties are not allowed ('assigned-clock-rate' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[56]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[56]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
