Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4421EB195
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759504768; cv=none; b=b4dwcAad2Yvz1ej8QZwRaZ4XtieP1OsSZ7HizsCPObLhhESqj9CfO3BLPo2lO8vsYwtVuf2sp+icuGSexK+8LuSCgESQYTQtfENielZNGNuX3Lo5UDj4VURXesGK7w15KXDTAFdDOunQ5Eez2QSb4Z5I2Jj7WMZ0+gLKZjjC2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759504768; c=relaxed/simple;
	bh=qaUB1vIrVanglZ3uXHiGz6mZU7Oq+gAJhMprtZNpuw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swMvnRxA+d4h79bFGbK2DG2jE3GZm8CFERV4Qow8KHU9GFezGTCXDa/DQkuHtGsFBd+D2A5a4yEtgnlKsJnLUxA29oanmvtHSqIiUA33/taY3iRsAifvOiOxsFPOkb9eb4V1s1c4wy1zOtnu3TJYyBgrGyWVL4ek2XWTkKXJ5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtgiF9HN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtgiF9HN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759504766; x=1791040766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qaUB1vIrVanglZ3uXHiGz6mZU7Oq+gAJhMprtZNpuw4=;
  b=DtgiF9HN/yPa0cA5+fruPZiqSmFXaf2yVgeSoFNNpVoU/t9pcu0wQIvr
   G60Laa9UGyMLKj1qLgDdd1wKo1HWCrTiSNE4WiwDy0Ulrv/CJ20HcSxhx
   FHE/qT41W+NF281hdOjJt9iPe7T9rQxLpPl0u/gtAWUvB1MbWHWbRsbJo
   PZEyDgxOrJSCajdVXlCwfQkdLr0l7WURkbXXFEKIJsyMAGQgtFjTMn5b9
   ew9YCGdsKfkC6KZx2+t4I4zVLUpM10yGvVHP5/3Ifp2YCUGbIkwpqZy2m
   MQpVN1af839HfPL0OnTLJhr1z7dhUXLbALSzv6PpJdVNyk728vZog8Rap
   A==;
X-CSE-ConnectionGUID: BwfLqjigQHqmbs/xwPOUdw==
X-CSE-MsgGUID: q8o5/4yWSvO9lI0DwRnG8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72463544"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="72463544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 08:19:25 -0700
X-CSE-ConnectionGUID: e0bV2UB7QVWhW3n4BPrZDg==
X-CSE-MsgGUID: rT7tR8++SFaoPRVnO6ZX5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="179243793"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2025 08:19:24 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4hZ4-0004cJ-18;
	Fri, 03 Oct 2025 15:19:22 +0000
Date: Fri, 3 Oct 2025 23:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] dt-bindings: net: Convert Marvell 8897/8997 bindings
 to DT schema
Message-ID: <202510032213.JOVBx2tt-lkp@intel.com>
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
In-Reply-To: <20251001183320.83221-1-ariel.dalessandro@collabora.com>
References: <20251001183320.83221-1-ariel.dalessandro@collabora.com>
TO: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
TO: andrew+netdev@lunn.ch
TO: angelogioacchino.delregno@collabora.com
TO: ariel.dalessandro@collabora.com
TO: conor+dt@kernel.org
TO: davem@davemloft.net
TO: edumazet@google.com
TO: krzk+dt@kernel.org
TO: kuba@kernel.org
TO: luiz.dentz@gmail.com
TO: pabeni@redhat.com
TO: robh@kernel.org
CC: devicetree@vger.kernel.org
CC: kernel@collabora.com
CC: linux-bluetooth@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org

Hi Ariel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17 next-20251002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariel-D-Alessandro/dt-bindings-net-Convert-Marvell-8897-8997-bindings-to-DT-schema/20251002-023641
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251001183320.83221-1-ariel.dalessandro%40collabora.com
patch subject: [PATCH v3] dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-053-20251002 (https://download.01.org/0day-ci/archive/20251003/202510032213.JOVBx2tt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032213.JOVBx2tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510032213.JOVBx2tt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: / (google,veyron-fievel-rev8): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: ethernet@ff290000 (rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: / (google,veyron-jaq-rev5): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: panel (innolux,n116bge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: / (google,veyron-mighty-rev5): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: panel (innolux,n116bge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: / (google,veyron-tiger-rev8): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: ethernet@ff290000 (rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (rockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: /sound: failed to match any schema with compatible: ['rockchip,rockchip-audio-max98090']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
