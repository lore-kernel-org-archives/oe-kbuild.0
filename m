Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF3A930
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755966669; cv=none; b=Vyvc+rz9bqep5++699zSfjUiN9JyVnKF/byUcIoZvpQPjppB8iZ7kVhsar3N0GB476oJmm0bJjzDgXTBQDsKupVneafKrnHfiNqugFH/EvThzfS21COZu4jxXrne9M2xTvpcq5RNOgMpif/btqwrY28YPELEm9qDU7fLxdmijzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755966669; c=relaxed/simple;
	bh=idCfkSUD0O9tAoTGyaMikcJMz1ljTGFgm+LRgbJpCEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eK/fvGDuSkBq07/89sk68467KKDPMZhGj7N6O8ji/WkDE8Bjl/IA1XKmeejp200vl48lugglk++gTsWBXQLUTv61p37iQ2EpYbgtrZKP2mk9V3aMa+HD8Jb7K6fQPOKEGTgJXTQnkU40YG4f0rQ2IhNmqNkZBDifbpyddHBpByY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8OvJ8KW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8OvJ8KW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755966666; x=1787502666;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=idCfkSUD0O9tAoTGyaMikcJMz1ljTGFgm+LRgbJpCEI=;
  b=O8OvJ8KW4lom9BrlK9nUIfY2OX4bXGCCyazJTdy8grqbyJQXNRetGvx/
   BQ7yKnOio8LM6q7cpI04pY97kXSSsVi5vbhTvVpjUOEsrN75LkLzK1zQ1
   spA7BgxdtlGycb0gbHFiN/CY9shfBA9KJvCmnpq419Qo9s/mkcmGtW7ZM
   HbhxDbeGdQr3qDWHyFRQDr2A840bqepoJlUKyme7Ls5L5Ox99d2PAR+yY
   VGPuQaZ8RFvsMRggyBK4ZzQlsbefExB4+gZQRZ5qwvUmnaMz/Og8N7snD
   KXWAB+UoHo4XtuUDoEirIUUp2zipf53SSDxiEpQJW2aBtJmSAuvJFWk7y
   w==;
X-CSE-ConnectionGUID: ekyW1sR5TZGbU72boUaWeg==
X-CSE-MsgGUID: rCeEW5UNS8+IFofWALEUew==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57264467"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57264467"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 09:31:05 -0700
X-CSE-ConnectionGUID: oGWkRyapRLSmzD83BWx9yQ==
X-CSE-MsgGUID: O4A2+/jLRm+N4PFcfrlfLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199822094"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2025 09:31:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upr8v-000MQF-37;
	Sat, 23 Aug 2025 16:31:01 +0000
Date: Sun, 24 Aug 2025 00:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf
 requirements
Message-ID: <202508240001.a5Rn0B3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kerne=
l.org>
References: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel=
=2Eorg>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/th=
ermal-rockchip-unify-struct-rockchip_tsadc_chip-format/20250821-014309
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250820-thermal-rockchip-grf-warn=
ing-v2-3-c7e2d35017b8%40kernel.org
patch subject: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf r=
equirements
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250821 (https://download.01.org/0day-ci/archiv=
e/20250824/202508240001.a5Rn0B3T-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d=
24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250824/202508240001.a5Rn0B3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508240001.a5Rn0B3T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dtb: tsadc@ff280000 (rockc=
hip,rk3288-tsadc): rockchip,grf: False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dtb: power-controller (roc=
kchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks'=
 do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-=
f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dtb: power-controller (roc=
kchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fix=
ed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dtb: panel (lg,lp079qx1-sp=
0v): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/rockchip/rk3288-evb-rk808.dtb: tsadc@ff280000 (rockchi=
p,rk3288-tsadc): rockchip,grf: False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-evb-rk808.dtb: power-controller (rockc=
hip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' d=
o not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]=
+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-evb-rk808.dtb: power-controller (rockc=
hip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-evb-rk808.dtb: panel (lg,lp079qx1-sp0v=
): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
>> arch/arm/boot/dts/rockchip/rk3288-firefly-beta.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): rockchip,grf: False schema does not allow [[62]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-beta.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks=
' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a=
-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-beta.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fi=
xed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
>> arch/arm/boot/dts/rockchip/rk3288-firefly.dtb: tsadc@ff280000 (rockchip,=
rk3288-tsadc): rockchip,grf: False schema does not allow [[62]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly.dtb: power-controller (rockchi=
p,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do =
not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly.dtb: power-controller (rockchi=
p,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts:77.32-80.5: Warning=
 (unit_address_vs_reg): /sound/simple-audio-card,dai-link@1: node has a uni=
t name, but no reg or ranges property
>> arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: tsadc@ff280000 (ro=
ckchip,rk3288-tsadc): rockchip,grf: False schema does not allow [[63]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: hym8563@51 (haoyu,=
hym8563): $nodename:0: 'hym8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][=
0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: hym8563@51 (haoyu,=
hym8563): Unevaluated properties are not allowed ('clock-frequency' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: es8328@10 (everest=
,es8328): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+=
$'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yam=
l#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: es8328@10 (everest=
,es8328): clocks: [[7, 462], [7, 82]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yam=
l#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: power-controller (=
rockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-cloc=
ks' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-=
9a-f]+$'
--
>> arch/arm/boot/dts/rockchip/rk3288-miqi.dtb: tsadc@ff280000 (rockchip,rk3=
288-tsadc): rockchip,grf: False schema does not allow [[55]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-miqi.dtb: power-controller (rockchip,r=
k3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not=
 match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-miqi.dtb: power-controller (rockchip,r=
k3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi:19.9-22.4: Warning (u=
nit_address_vs_reg): /memory: node has a reg or ranges property, but no uni=
t name
   arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: / (phytec,rk3288-pcm-=
947): memory: False schema does not allow {'device_type': ['memory'], 'reg'=
: [[0, 0, 0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: touchscreen@44 (st,st=
mpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: /i2c@ff140000/rtc@68:=
 failed to match any schema with compatible: ['rv4162']
   arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: leddimmer@62 (nxp,pca=
9533): 'led1', 'led2', 'led3', 'led4' do not match any of the regexes: '^le=
d-[0-9a-z]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca953x.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: tsadc@ff280000 (rockc=
hip,rk3288-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: ethernet@ff290000 (ro=
ckchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: power-controller (roc=
kchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks'=
 do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-=
f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dtb: power-controller (roc=
kchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fix=
ed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
>> arch/arm/boot/dts/rockchip/rk3288-popmetal.dtb: tsadc@ff280000 (rockchip=
,rk3288-tsadc): rockchip,grf: False schema does not allow [[57]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-popmetal.dtb: power-controller (rockch=
ip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+=
$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-popmetal.dtb: power-controller (rockch=
ip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
>> arch/arm/boot/dts/rockchip/rk3288-r89.dtb: tsadc@ff280000 (rockchip,rk32=
88-tsadc): rockchip,grf: False schema does not allow [[49]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-r89.dtb: power-controller (rockchip,rk=
3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do not =
match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-r89.dtb: power-controller (rockchip,rk=
3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-rock2-square.dts:67.32-70.5: Warning (=
unit_address_vs_reg): /sound/simple-audio-card,dai-link@1: node has a unit =
name, but no reg or ranges property
>> arch/arm/boot/dts/rockchip/rk3288-rock2-square.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): rockchip,grf: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-rock2-square.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks=
' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a=
-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-rock2-square.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fi=
xed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-rock2-square.dtb: /sound-i2s: failed t=
o match any schema with compatible: ['rockchip,rk3288-hdmi-analog']
   arch/arm/boot/dts/rockchip/rk3288-rock2-square.dtb: sound-i2s (rockchip,=
rk3288-hdmi-analog): rockchip,routing: b'Analog\x00LOUT2\x00Analog\x00ROUT2=
\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm/boot/dts/rockchip/rk3288-rock-pi-n8.dtb: tsadc@ff280000 (rockch=
ip,rk3288-tsadc): rockchip,grf: False schema does not allow [[59]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-rock-pi-n8.dtb: power-controller (rock=
chip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' =
do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f=
]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-rock-pi-n8.dtb: power-controller (rock=
chip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixe=
d:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi:15.9-18.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-tinker.dtb: / (asus,rk3288-tinker): me=
mory: False schema does not allow {'reg': [[0, 0, 0, 2147483648]], 'device_=
type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-tinker.dtb: tsadc@ff280000 (rockchip,r=
k3288-tsadc): rockchip,grf: False schema does not allow [[56]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-tinker.dtb: power-controller (rockchip=
,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-tinker.dtb: power-controller (rockchip=
,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi:15.9-18.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-tinker-s.dtb: / (asus,rk3288-tinker-s)=
: memory: False schema does not allow {'reg': [[0, 0, 0, 2147483648]], 'dev=
ice_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-tinker-s.dtb: tsadc@ff280000 (rockchip=
,rk3288-tsadc): rockchip,grf: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-tinker-s.dtb: power-controller (rockch=
ip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+=
$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-tinker-s.dtb: power-controller (rockch=
ip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dtb: / (google,veyron-bra=
in-rev0): memory: False schema does not allow {'device_type': ['memory'], '=
reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dtb: pmic@1b (rockchip,rk=
808): regulators:LDO_REG7: Unevaluated properties are not allowed ('regulat=
or-suspend-mem-disabled' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk808.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dtb: pmic@1b (rockchip,rk=
808): regulators:SWITCH_REG2: Unevaluated properties are not allowed ('regu=
lator-suspend-mem-disabled' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk808.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks=
' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a=
-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fi=
xed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: / (google,veyron-fi=
evel-rev8): memory: False schema does not allow {'device_type': ['memory'],=
 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: /mmc@ff0d0000/btmrv=
l@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
>> arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: ethernet@ff290000 (=
rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wa=
keup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clock=
s' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9=
a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be f=
ixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: /sound: failed to m=
atch any schema with compatible: ['rockchip,rockchip-audio-max98090']
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: / (google,veyron-jaq-r=
ev5): memory: False schema does not allow {'device_type': ['memory'], 'reg'=
: [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: /mmc@ff0d0000/btmrvl@2=
: failed to match any schema with compatible: ['marvell,sd8897-bt']
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: tsadc@ff280000 (rockch=
ip,rk3288-tsadc): rockchip,grf: False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rock=
chip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' =
do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f=
]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: power-controller (rock=
chip,rk3288-power-controller): 'anyOf' conditional failed, one must be fixe=
d:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: /sound: failed to matc=
h any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: panel (innolux,n116bge=
): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: / (google,veyron-jer=
ry-rev15): memory: False schema does not allow {'device_type': ['memory'], =
'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: wifi@1 (marvell,sd88=
97): marvell,caldata-txpwrlimit-2g: [1, 0, 6, 0, 8, 2, 137, 1, 36, 0, 103, =
9, 20, 1, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9=
, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 2=
, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12=
, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 3, 0, 15,=
 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12=
, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 4, 0, 15, 1, 12, =
2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12=
, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 5, 0, 15, 1, 12, 2, 12, 3=
, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9,=
 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 6, 0, 15, 1, 12, 2, 12, 3, 12, 4,=
 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, =
15, 9, 137, 1, 36, 0, 103, 9, 20, 7, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, =
12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 1=
37, 1, 36, 0, 103, 9, 20, 8, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 1=
2, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 3=
6, 0, 103, 9, 20, 9, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9,=
 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 10=
3, 9, 20, 10, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, =
9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 2=
0, 11, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 1=
0, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 12, =
0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, =
11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 13, 0, 15, =
1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12,=
 12, 12, 13, 9, 14, 9, 15, 9] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/marvell,sd8=
787.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: wifi@1 (marvell,sd88=
97): marvell,caldata-txpwrlimit-5g-sub2: [1, 0, 6, 0, 54, 1, 137, 1, 58, 0,=
 136, 19, 20, 149, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9,=
 8, 10, 10, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5=
, 20, 5, 21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 13=
6, 19, 20, 153, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8,=
 10, 10, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 2=
0, 5, 21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, =
19, 20, 157, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10=
, 10, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, =
5, 21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19,=
 20, 161, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 1=
0, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, =
21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19, 20=
, 165, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 10, =
11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, 21,=
 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/marvell,sd8=
787.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: trackpad@2c (hid-ove=
r-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): rockchip,grf: False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks=
' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a=
-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fi=
xed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: /sound: failed to ma=
tch any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: panel (innolux,n116b=
ge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: / (google,veyron-mi=
ckey-rev8): memory: False schema does not allow {'device_type': ['memory'],=
 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: thermal-zones: cpu-=
thermal:cooling-maps: 'cpu_almost_hot_limit_cpu', 'cpu_hot_limit_cpu', 'cpu=
_hotter_limit_cpu', 'cpu_very_hot_limit_cpu', 'cpu_very_hot_limit_gpu', 'cp=
u_warm_limit_cpu', 'cpu_warm_limit_gpu' do not match any of the regexes: '^=
map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: thermal-zones: gpu-=
thermal:cooling-maps: 'gpu_hotter_limit_gpu', 'gpu_very_very_hot_limit_gpu'=
, 'gpu_warm_limit_cpu', 'gpu_warmish_limit_gpu' do not match any of the reg=
exes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): rockchip,grf: False schema does not allow [[64]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: pmic@1b (rockchip,r=
k808): regulators:LDO_REG7: Unevaluated properties are not allowed ('regula=
tor-suspend-mem-disabled' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk808.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: pmic@1b (rockchip,r=
k808): regulators:LDO_REG8: Unevaluated properties are not allowed ('regula=
tor-suspend-mem-disabled' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk808.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clock=
s' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9=
a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be f=
ixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: / (google,veyron-mi=
ghty-rev5): memory: False schema does not allow {'device_type': ['memory'],=
 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: /mmc@ff0d0000/btmrv=
l@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
>> arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): rockchip,grf: False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clock=
s' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9=
a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be f=
ixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: /sound: failed to m=
atch any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: panel (innolux,n116=
bge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: / (google,veyron-mi=
nnie-rev4): memory: False schema does not allow {'device_type': ['memory'],=
 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): rockchip,grf: False schema does not allow [[75]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clock=
s' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9=
a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be f=
ixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: /sound: failed to m=
atch any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: panel (auo,b101ean0=
1): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: / (google,veyron-pin=
ky-rev2): memory: False schema does not allow {'device_type': ['memory'], '=
reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): rockchip,grf: False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks=
' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a=
-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fi=
xed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: /sound: failed to ma=
tch any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: panel (innolux,n116b=
ge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: / (google,veyron-sp=
eedy-rev9): memory: False schema does not allow {'device_type': ['memory'],=
 'reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): rockchip,grf: False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clock=
s' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9=
a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: power-controller (r=
ockchip,rk3288-power-controller): 'anyOf' conditional failed, one must be f=
ixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: /sound: failed to m=
atch any schema with compatible: ['rockchip,rockchip-audio-max98090']
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: panel (innolux,n116=
bge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml#
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288.dtsi:1230.20-1232.6: Warning (graph_ch=
ild_address): /dp@ff970000/ports/port@1: graph node has single child node '=
endpoint@0', #address-cells/#size-cells are not necessary
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: / (google,veyron-tig=
er-rev8): memory: False schema does not allow {'device_type': ['memory'], '=
reg': [[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: /mmc@ff0d0000/btmrvl=
@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
>> arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): rockchip,grf: False schema does not allow [[62]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: ethernet@ff290000 (r=
ockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wak=
eup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks=
' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a=
-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: power-controller (ro=
ckchip,rk3288-power-controller): 'anyOf' conditional failed, one must be fi=
xed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: /sound: failed to ma=
tch any schema with compatible: ['rockchip,rockchip-audio-max98090']
--
   arch/arm/boot/dts/rockchip/rk3288-vyasa.dts:17.9-20.4: Warning (unit_add=
ress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-vyasa.dtb: / (amarula,vyasa-rk3288): m=
emory: False schema does not allow {'reg': [[0, 0, 0, 2147483648]], 'device=
_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-vyasa.dtb: tsadc@ff280000 (rockchip,rk=
3288-tsadc): rockchip,grf: False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml#
   arch/arm/boot/dts/rockchip/rk3288-vyasa.dtb: power-controller (rockchip,=
rk3288-power-controller): 'assigned-clock-parents', 'assigned-clocks' do no=
t match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-con=
troller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-vyasa.dtb: power-controller (rockchip,=
rk3288-power-controller): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
