Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32243750CB
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Apr 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045927; cv=none; b=NZfTAskupbW0iCfTgwEqRGCZO4H/IbAcjwBrCYI9HYSGxUw9T7jEvT7lHwnddecB6U4QeBZnWLfe1VqUk+40kqCw/rdIHIKbGwe9VdEalKnRV+PZ1mNFj+61yBULue8zzDxEQnvt9RMe6+2aZqXX0AxIf0B+RvFiFW0e7WeS6ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045927; c=relaxed/simple;
	bh=8bXlD7Mq3uC8skqO7Ugg89SdUYC6/EwSGyg3LtCjWuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bhBa457cLNlUEt16hNdvM94Ana2ntp93vbVbrsAG8U/5GgdKl6hDzPd6iI2Y5ouIYe9NJ2S+p1r+e/bO+OXYh+g53EwDX28M4B/G5K8Fh/s25clpbI0p3SWbhGi4kxzhUzWTXiLofQp4Haq5d243/92IBeEnDpFRuzkceePLMbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jr7Br1EX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jr7Br1EX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777045925; x=1808581925;
  h=date:from:to:cc:subject:message-id;
  bh=8bXlD7Mq3uC8skqO7Ugg89SdUYC6/EwSGyg3LtCjWuI=;
  b=Jr7Br1EX968bZw+rRYBgVnW0vORZWDEQCOcoA9/dUiSx5CDN9taHvpA0
   /igknGqzoJeb/6DyjmyK8lIaEoHO2ZQmk6tl11bfVdkLbmDcpefnisKlZ
   8HkHmbTGosOqKaHcBHqbF2PX1OEPYJKC11u5aae6zf7eRWI33XeDokKPb
   UIVVFFrNY4f9TLR5cDVwsvb67uc48Im6OpSDw16eBOUOKyzXDEAP8QfRY
   Dc9A0QncgsCBQ76Y12H0Lp/nVZKI8npEPrp5sOXrSvAkB02jiiyhWwSg1
   9FFMM+9rKS4LFvB5RVDUFbnRBJdDEXhkx+NXovegwxMKhY8RllVvUwiXW
   Q==;
X-CSE-ConnectionGUID: rU6DLv8eTs6PgRVph0lqVg==
X-CSE-MsgGUID: iiz71tJIQYSJSdnfdy4rpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="89411273"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89411273"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 08:52:04 -0700
X-CSE-ConnectionGUID: 3tf4Hb+uQV6JElKmn3z3sQ==
X-CSE-MsgGUID: aNk1dC/BRZuL1KnAYltzHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232836706"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 Apr 2026 08:52:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGIoy-000000003Gn-3j57;
	Fri, 24 Apr 2026 15:52:00 +0000
Date: Fri, 24 Apr 2026 17:51:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bluetooth-next:master 17/72]
 arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: btmrvl@2
 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match
 '^bluetooth(@.*)?$'
Message-ID: <202604241716.gHsutyXO-lkp@intel.com>
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
CC: linux-bluetooth@vger.kernel.org
TO: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   0105c3e2a97e33c37d582a32d4307df6fb3c4cc3
commit: 73d2d709cc172da53402c9b2ead39bebc774ea16 [17/72] dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-2051-20260423 (https://download.01.org/0day-ci/archive/20260424/202604241716.gHsutyXO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241716.gHsutyXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604241716.gHsutyXO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: / (google,veyron-fievel-rev8): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: ethernet@ff290000 (rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: / (google,veyron-jaq-rev5): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: / (google,veyron-mighty-rev5): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: / (google,veyron-tiger-rev8): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: tsadc@ff280000 (rockchip,rk3288-tsadc): False schema does not allow [[62]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: ethernet@ff290000 (rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
