Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD93191F66
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Feb 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739605697; cv=none; b=PXH5YAeW71/j+7CV29zSU2aiYS1D0nqh436/6ihjsVqTPcDa6vuXC++vYqnBcD+x3AN4aL0KPVs5+itYnNaQ1oNYg1LsDF+azbwiNDR6JnUp3IRZK9/zUqpd8t896T52gpwu/aaBPuS5fhOxnXWB36AaIvCEJD5u7CjjzXsESCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739605697; c=relaxed/simple;
	bh=4MxBS2Zw+bmkIye+Ce4OAHwFTy/SVYwtpJlLYd4Jf8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfyP3nx6RlatIkvAD7pfd6L0B0mRjWU0T2+28e+GptujXr/QbhRMoNI1obM497vWCYIY3O0EjzzyXe23N61KLMHK1qXDbH/rEXz87HI4A9UlyD3Drwp9VBFtXXY+cMwhKGGN/z69K3wCtxGz+lXs8YaOG0L69n0ZIZS9hMmp3vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glfeR7AK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glfeR7AK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739605696; x=1771141696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4MxBS2Zw+bmkIye+Ce4OAHwFTy/SVYwtpJlLYd4Jf8A=;
  b=glfeR7AKgX3CG6JCOH1WHz3lr5j3HYx309/qwLBRR8dsP/LVvnC54vtB
   rlDWgaNjHZ0m719GyvBueOW/NdeROf8PO/JJdcdyCxy75yrOc5CFhJDdx
   EMacF2xXe6mpPhOxyJyzm1eQWW5X1PX6b62g4ru5XqhXRHY1Fnqri+PJL
   Otr2SxZlFhGqm4iA6x4g3HZdLpobb4UM/vhqE7mFvQhg5/ht8QHvTzcl0
   AmBE6dHcrOBt/i2p+OZfeNKYhWVRzKOkunvidW41OM51lHv4snNNLZ+gu
   TuKXuZnLoAK6sdgEHHSzLX/etPzmUzpiKplWMvTEIuC7ZbZx/Zos1XpDm
   A==;
X-CSE-ConnectionGUID: FLUK4hWnSl+bTPsKD0nstw==
X-CSE-MsgGUID: 7hiAGXOCQzy2FXGW168W/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51772493"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="51772493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 23:48:15 -0800
X-CSE-ConnectionGUID: GCqm4d8sQWCuNA4sIsWLdA==
X-CSE-MsgGUID: 2BSnNdUNQB2gGDSzX9xB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136879100"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Feb 2025 23:48:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjCuJ-001Abf-0W;
	Sat, 15 Feb 2025 07:48:11 +0000
Date: Sat, 15 Feb 2025 15:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 9/31]
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: vop@fdd90000: clocks:
 [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31,
 603], [104]] is too long
Message-ID: <202502151552.ILEZ316e-lkp@intel.com>
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
CC: linux-rockchip@lists.infradead.org
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   887ff17cdd8f088a52e2b61e71f2b6c9b9678de6
commit: eb4262203d7d85eb7b6f2696816db272e41f5464 [9/31] arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3588
:::::: branch date: 9 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-051-20250215 (https://download.01.org/0day-ci/archive/20250215/202502151552.ILEZ316e-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151552.ILEZ316e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502151552.ILEZ316e-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1358.7-1366.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: phy@fed90000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: phy@fed90000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1149.7-1157.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1130.7-1138.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: vop@fdd90000: clocks: [[28, 605], [28, 604], [28, 609], [28, 610], [28, 611], [28, 612], [28, 603], [100]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
