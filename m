Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35813B29B
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 06:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740982228; cv=none; b=DCN7g9jWrNUCW9NvYr+EN83SWA/MzTwxMkCRExT0Eu3w71teh9ZW4dY2XPsD00uzP3dJOh3pFiNYWj8MenDRHzOgQnISjLap/HoloXl7rgSh/LQRCumzhSuvlr6fbVRwoExAtyqEIXh/6ZBLHtR2GPxndgR27WWtGJGX3J+B1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740982228; c=relaxed/simple;
	bh=wnlxZG9U8T1BH8WqRTfow7cKzJ0DADAMZN9yGE7NWO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPCzO5ljxcv4lfDsAaetwLCxdlZJVc6X7QfX27j5HHRWAryootKJ8lICHw58BMxfqOsI0ERoQX+3Nml2TPlk/+PzrT8CgdYv/Agfkwx6h3siJSf2fdiQ8c9ybHX+MwH9DgkB6/hRYgsFIN7Zi6EvAaiHEJF9alFnqjlZ7B5aNC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sl6gcV2/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sl6gcV2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740982226; x=1772518226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wnlxZG9U8T1BH8WqRTfow7cKzJ0DADAMZN9yGE7NWO0=;
  b=Sl6gcV2/2l7Tp3N+g6KkhUHsQ653SuLzTNP4trs2jdLqU3y+LiHTh0X/
   ztBWDPHMlzOZN2ZCaNoE1b7RYnxvBcvUMnO/CJMHxwpcgETYHhq3/nWRQ
   XecYa4ulr3WMh1Jmb2N5Mx+fbeQzxEBnPSJvfDdINHcLt9MTqDcOUbpxF
   y6xkKkjij5+NGVNgxY0rO79jdepIutma3m8Jec4pp0ABwaZeaP2azuZdp
   nmlHQR72oTGY3M5ALWczCIDQplf6jV5BCCKv20DoKJT6vLhdTMZsUqnXT
   JnkJnnRDv6boMpTotd4hOacT6wsKYPRU6GUJT990OugyrgQC7OnW91Abk
   g==;
X-CSE-ConnectionGUID: 0urRgdzaTYaN7Cz8CflGGg==
X-CSE-MsgGUID: 6xg9O8u0RuixMCtWYlZykg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44658859"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="44658859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 22:10:25 -0800
X-CSE-ConnectionGUID: KluVKNkJRAyyLqweS0GhZw==
X-CSE-MsgGUID: 1eIK/xc9QVisvM+bmrd/pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117928343"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Mar 2025 22:10:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toz0P-000I0H-0Z;
	Mon, 03 Mar 2025 06:10:21 +0000
Date: Mon, 3 Mar 2025 14:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 63/64]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: power-controller:
 power-domain@12: Unevaluated properties are not allowed ('domain-supply' was
 unexpected)
Message-ID: <202503031425.MRzwnm55-lkp@intel.com>
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
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   c55c9e91d1643493d0434f246917aea7a2653e0f
commit: f94500eb7328b35f3d0927635b1aba26c85ea4b0 [63/64] arm64: dts: rockchip: Add GPU power domain regulator dependency for RK3588
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250302 (https://download.01.org/0day-ci/archive/20250303/202503031425.MRzwnm55-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031425.MRzwnm55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503031425.MRzwnm55-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1393.7-1401.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1187.7-1195.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
