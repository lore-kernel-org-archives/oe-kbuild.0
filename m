Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF121E082
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325801; cv=none; b=iS2RO+Sz+xotZCT7S/8CjHnE3gKRSNUJuesWNVZAEmM05Y73SwqePofCMPsyXHUW5THtCm00P/HecJr3veubgae8KMcJztAtumty9T4YcXdlRk76uzFLZdqyHBEGFiu5PuLCWU7uCrRRmCo740wWQqF5glc+ILScWlcMRE7bpz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325801; c=relaxed/simple;
	bh=4aTcUYnIAakaj4a3pga/HgDnpnY7YndrB+8bMV1k13w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNL7/Bjjlif5wRDT+SJYcsnOpe9+yetVxu7pTVq2GSyZmvM4woaCxrGLF2DUZJA7RRWdmdCfZflOtHoptAPfp/455q3pJuNgdOTUC+ec/TZUV7vi3eq36mcvdxSbylWWt73iKxbhzLHBWOVw+qwIL9dkbPKdqTzsUF9H17sExn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1N6gzen; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1N6gzen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750325798; x=1781861798;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4aTcUYnIAakaj4a3pga/HgDnpnY7YndrB+8bMV1k13w=;
  b=g1N6gzenCaBz2NJd4Q7PzIUU/YV/7oGFwOArtWtfY/T6VTn6NDs5KdB6
   8TyscsoS/Ucx8pCNrxzoqGChk68lTNcVPOxlGRhjM61RqG97hi4+tQ7wz
   etrVHqhBaXLdar2Zo4iswtw7Bowu8Dzk68H4yd6z5vjpOuszZ06DnKcw4
   aLVscoh1xdYyhoQU+3bmfsiJEj7by64gfL28QdGxtKj+w/XH8K/7wW3wl
   ruHA3aLD96+HH1VexJxno4TqprjCSFB1TXRczKIIRNCUPqO316ljOGv3f
   z/svTqCVM7iuJrFB3v6M0eNZ2b9HDgeraeVDMqbh1hIERFg6OPbOgHxQd
   A==;
X-CSE-ConnectionGUID: Rgpl0RTKTTSxLpqS1mCVWw==
X-CSE-MsgGUID: V2jccY24QG60dBBXpeejGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52657286"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52657286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:36:38 -0700
X-CSE-ConnectionGUID: 2nbnB/3ETaaGrLeamLq+Pw==
X-CSE-MsgGUID: Hv0FCY5fT4e0Tec7RfvXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150680689"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jun 2025 02:36:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSBhC-000KcQ-2m;
	Thu, 19 Jun 2025 09:36:34 +0000
Date: Thu, 19 Jun 2025 17:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 12/13] arm64: dts: rockchip: add mipi csi-2 receiver
 node to rk356x
Message-ID: <202506191718.AGLdyjHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com>
References: <20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com>
TO: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
TO: Mehdi Djait <mehdi.djait@linux.intel.com>
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
TO: "Théo Lebrun" <theo.lebrun@bootlin.com>
TO: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
TO: Gerald Loacker <gerald.loacker@wolfvision.net>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
TO: Markus Elfring <Markus.Elfring@web.de>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Kever Yang <kever.yang@rock-chips.com>
TO: Nicolas Dufresne <nicolas.dufresne@collabora.com>
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
TO: Collabora Kernel Team <kernel@collabora.com>
TO: Paul Kocialkowski <paulk@sys-base.io>
TO: Alexander Shiyan <eagle.alexander923@gmail.com>
TO: Val Packett <val@packett.cool>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: Michael Riesch <michael.riesch@collabora.com>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch-via-B4-Relay/Documentation-admin-guide-media-add-rockchip-camera-interface/20250618-235355
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20240220-rk3568-vicap-v9-12-ace1e5cc4a82%40collabora.com
patch subject: [PATCH v9 12/13] arm64: dts: rockchip: add mipi csi-2 receiver node to rk356x
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191718.AGLdyjHT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191718.AGLdyjHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506191718.AGLdyjHT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
   arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:288.10-292.5: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:289.29-291.6: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: panel@0 (boe,th101mb31ig002-28a): 'port@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,th101mb31ig002-28a.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: phy@fe870000 (rockchip,rk3568-csi-dphy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-inno-csi-dphy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:288.10-292.5: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:289.29-291.6: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: panel@0 (boe,th101mb31ig002-28a): 'port@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,th101mb31ig002-28a.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: phy@fe870000 (rockchip,rk3568-csi-dphy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-inno-csi-dphy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm43455-fmac'] is too short
   	'brcm,bcm43455-fmac' is not one of ['brcm,bcm4329-fmac', 'pci14e4,43dc', 'pci14e4,4464', 'pci14e4,4488', 'pci14e4,4425', 'pci14e4,4433', 'pci14e4,449d']
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: panel@0 (jasonic,jt240mhqs-hwt-ek-e3): compatible: ['jasonic,jt240mhqs-hwt-ek-e3', 'sitronix,st7789v'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible:0: 'sitronix,st1624' is not one of ['sitronix,st1232', 'sitronix,st1633']
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible: ['sitronix,st1624', 'sitronix,st1633'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed ('compatible', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /i2c@fe5a0000/touchscreen@55: failed to match any schema with compatible: ['sitronix,st1624', 'sitronix,st1633']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
