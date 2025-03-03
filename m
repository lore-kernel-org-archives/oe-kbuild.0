Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1046F2B9BB
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 01:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740965801; cv=none; b=Ip/sjnW8kHAdygQVxfSWG77qoj3hIPyw+Gg6cj38ukxfYf7PhUahfWc0E/Vq5EhXEzjmxxy+WfGFPSRPFPSo7T4z8WkmgjyzcJpXWX6GIjsokEI8+cIdpS9+BjXdgh4i33VliH1xmKIY7UCsugjtvM3sY5b2/4TJtX87mREoPGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740965801; c=relaxed/simple;
	bh=9kqicJIMc0uG+L14/JSM4M1afLiTDie8bSEmvrkZh0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ny902Kj6XN0kpIH5lUedNLs/g7ZA0x1lOq/MCcxADKXmh5q4+mnymkV3KEZq1lR//0xnWjMJV3OBUqi/cympyv/yeALRVBphC146b19PdUTi5zWPmMnH5UNnJSIYECWPTQ9gnqPtRActBEIyNwIWlTOpCN4rkvKJqyAfz54uZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKwFvoPU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKwFvoPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740965798; x=1772501798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kqicJIMc0uG+L14/JSM4M1afLiTDie8bSEmvrkZh0c=;
  b=BKwFvoPUUES3G/PhpDno/ke0raHYiK/r8zHxA2LDNvfhlwfGPR0BLZpI
   PYWX5FdWfLPpgKMhCiPU/WNj51brq2ku41zgfkwL5aI1pcW94/pn/rpiV
   YbIx6bLyDiAHiotTcUMp20fdBrVkk+r9bfImrFob+ev25GOTyIZvPymw9
   6447G8xXom3EzxVBE1QPog+V0O3fnGIB/G4FV0qshppR3nIk7yhr82EVT
   vjM56OTVkt4KLpBou9H/chZHAQ0I+7ZJZkEOLhv+1d2Kv61NSP/mZjHC9
   p+2kPiw4DG9LH0MONU+cCFrT8LE33Bz0QlWhc7bjIA6EyCK6Ph19DlQFR
   Q==;
X-CSE-ConnectionGUID: 1zB9J0giRkmI2OxjL5ItIg==
X-CSE-MsgGUID: ed6L9KgNTLSsGFuKjBplpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41715240"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41715240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 17:36:37 -0800
X-CSE-ConnectionGUID: W5MfiEfHRhC1SwrOEd9zEA==
X-CSE-MsgGUID: 8wekd2AtSEqotA5PJqGV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121992736"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2025 17:36:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toujR-000HoD-3B;
	Mon, 03 Mar 2025 01:36:33 +0000
Date: Mon, 3 Mar 2025 09:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 63/64]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: power-controller:
 power-domain@12: Unevaluated properties are not allowed ('domain-supply' was
 unexpected)
Message-ID: <202503030923.XB1Ebn1Z-lkp@intel.com>
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
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250303/202503030923.XB1Ebn1Z-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030923.XB1Ebn1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503030923.XB1Ebn1Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [109], [110]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [105], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1134.7-1142.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: vop@fdd90000: clocks: [[30, 605], [30, 604], [30, 609], [30, 610], [30, 611], [30, 612], [30, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [109]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
