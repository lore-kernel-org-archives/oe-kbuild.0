Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F376221FB2
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 05:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311268; cv=none; b=Vuq/moHx9XkdieNThpvyfSRBdTSL16j6TF/NY6XsqpuvS7b/aAykzTPkT79192selA/SnEZp8NVMxL5sj0CBkBayUrDkErdwaUFAqqvbzYk64lbDxqdIYMUeYn4o0RrPPPmzyDgGQjoyX4X6Oklrqi4vOjDcz5tc0s3HdAtWBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311268; c=relaxed/simple;
	bh=rdO5IpH1UWL9ZmlLEa9lNYG6yhyqT4MIkSnSZEI8SeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqZ6HydkSfB5ylhnu3FrclkbjEMIf5hCuo3FzC45XBNKoK2aaeJXnLW2NhhtG3jrRKoPRwJhHVxPYOiE2PmWg9jyChhfIfV7BpQFDfVMX6OWTFALt0KgHlujy+VaUhHjSNCJSYqJRPkya5cdtqDr3aA2j7s4qrbAjC+3h4Ienc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+JXO0af; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+JXO0af"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750311260; x=1781847260;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rdO5IpH1UWL9ZmlLEa9lNYG6yhyqT4MIkSnSZEI8SeA=;
  b=P+JXO0af18v6o+dPWRSs3arQdqOOc537USdTIairjS2fmuFnJ48MMaHs
   LcacxuT/KO0uXeKHD0ePOc9ZmUkP8igeqJCy966NpHI0ZhaxHPglEch8g
   WKD76cBH3vQjOB2xvmct3uNxBd6AhD8iuNaV2uukp0V3RmkSc6MDWwMd2
   ITeWzaAmeZytLaHm9x3aYBctQOHxHwZU/A1mOeyeSNqiyHVj7kiXdtM5f
   s2L2CcPQMMxAuTRBKTYvOJr+/XWg29Eto0j8ZjlvVXawBmq/gOd6Tr8nT
   8mAlHRzyO3+o1PEvsrzyc3LtVPhPhNmQapQcRxwGhs5KqXA26VxNGUTSC
   A==;
X-CSE-ConnectionGUID: HkMjCmpoQrqXfEdQgsjARA==
X-CSE-MsgGUID: DyT+9h4RTDO8Cvmz5TBX7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40163080"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="40163080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:34:18 -0700
X-CSE-ConnectionGUID: veuKDkf0QTKtHq2VhwcAxA==
X-CSE-MsgGUID: yVmH0Kd6T9qX9P4/kLh8dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="156232801"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jun 2025 22:34:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS7uf-000KR4-0K;
	Thu, 19 Jun 2025 05:34:13 +0000
Date: Thu, 19 Jun 2025 13:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 12/13] arm64: dts: rockchip: add mipi csi-2 receiver
 node to rk356x
Message-ID: <202506191327.wbrz3oHo-lkp@intel.com>
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
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-002-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191327.wbrz3oHo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191327.wbrz3oHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506191327.wbrz3oHo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
--
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:288.10-292.5: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:289.29-291.6: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0/endpoint@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
--
>> arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
   arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +282 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi

a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    14  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    15  / {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    16  	interrupt-parent = <&gic>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    17  	#address-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    18  	#size-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    19  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    20  	aliases {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    21  		gpio0 = &gpio0;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    22  		gpio1 = &gpio1;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    23  		gpio2 = &gpio2;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    24  		gpio3 = &gpio3;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    25  		gpio4 = &gpio4;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    26  		i2c0 = &i2c0;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    27  		i2c1 = &i2c1;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    28  		i2c2 = &i2c2;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    29  		i2c3 = &i2c3;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    30  		i2c4 = &i2c4;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    31  		i2c5 = &i2c5;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    32  		serial0 = &uart0;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    33  		serial1 = &uart1;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    34  		serial2 = &uart2;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    35  		serial3 = &uart3;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    36  		serial4 = &uart4;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    37  		serial5 = &uart5;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    38  		serial6 = &uart6;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    39  		serial7 = &uart7;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    40  		serial8 = &uart8;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    41  		serial9 = &uart9;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27    42  		spi0 = &spi0;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27    43  		spi1 = &spi1;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27    44  		spi2 = &spi2;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27    45  		spi3 = &spi3;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    46  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    47  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    48  	cpus {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    49  		#address-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    50  		#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    51  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    52  		cpu0: cpu@0 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    53  			device_type = "cpu";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    54  			compatible = "arm,cortex-a55";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    55  			reg = <0x0 0x0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    56  			clocks = <&scmi_clk 0>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28    57  			#cooling-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    58  			enable-method = "psci";
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    59  			i-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    60  			i-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    61  			i-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    62  			d-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    63  			d-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    64  			d-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    65  			next-level-cache = <&l3_cache>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    66  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    67  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    68  		cpu1: cpu@100 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    69  			device_type = "cpu";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    70  			compatible = "arm,cortex-a55";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    71  			reg = <0x0 0x100>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28    72  			#cooling-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    73  			enable-method = "psci";
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    74  			i-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    75  			i-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    76  			i-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    77  			d-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    78  			d-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    79  			d-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    80  			next-level-cache = <&l3_cache>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    81  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    82  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    83  		cpu2: cpu@200 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    84  			device_type = "cpu";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    85  			compatible = "arm,cortex-a55";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    86  			reg = <0x0 0x200>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28    87  			#cooling-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    88  			enable-method = "psci";
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    89  			i-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    90  			i-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    91  			i-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    92  			d-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    93  			d-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    94  			d-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09    95  			next-level-cache = <&l3_cache>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    96  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    97  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    98  		cpu3: cpu@300 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22    99  			device_type = "cpu";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   100  			compatible = "arm,cortex-a55";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   101  			reg = <0x0 0x300>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   102  			#cooling-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   103  			enable-method = "psci";
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   104  			i-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   105  			i-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   106  			i-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   107  			d-cache-size = <0x8000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   108  			d-cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   109  			d-cache-sets = <128>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   110  			next-level-cache = <&l3_cache>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   111  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   112  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   113  
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   114  	/*
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   115  	 * There are no private per-core L2 caches, but only the
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   116  	 * L3 cache that appears to the CPU cores as L2 caches
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   117  	 */
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   118  	l3_cache: l3-cache {
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   119  		compatible = "cache";
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   120  		cache-level = <2>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   121  		cache-unified;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   122  		cache-size = <0x80000>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   123  		cache-line-size = <64>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   124  		cache-sets = <512>;
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   125  	};
8612169a05c5e97 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Dragan Simic         2024-03-09   126  
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   127  	display_subsystem: display-subsystem {
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   128  		compatible = "rockchip,display-subsystem";
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   129  		ports = <&vop_out>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   130  	};
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   131  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   132  	firmware {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   133  		scmi: scmi {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   134  			compatible = "arm,scmi-smc";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   135  			arm,smc-id = <0x82000010>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   136  			shmem = <&scmi_shmem>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   137  			#address-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   138  			#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   139  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   140  			scmi_clk: protocol@14 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   141  				reg = <0x14>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   142  				#clock-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   143  			};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   144  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   145  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   146  
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   147  	hdmi_sound: hdmi-sound {
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   148  		compatible = "simple-audio-card";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   149  		simple-audio-card,name = "HDMI";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   150  		simple-audio-card,format = "i2s";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   151  		simple-audio-card,mclk-fs = <256>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   152  		status = "disabled";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   153  
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   154  		simple-audio-card,codec {
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   155  			sound-dai = <&hdmi>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   156  		};
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   157  
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   158  		simple-audio-card,cpu {
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   159  			sound-dai = <&i2s0_8ch>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   160  		};
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   161  	};
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11   162  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   163  	pmu {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   164  		compatible = "arm,cortex-a55-pmu";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   165  		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   166  			     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   167  			     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   168  			     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   169  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   170  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   171  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   172  	psci {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   173  		compatible = "arm,psci-1.0";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   174  		method = "smc";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   175  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   176  
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   177  	reserved-memory {
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   178  		#address-cells = <2>;
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   179  		#size-cells = <2>;
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   180  		ranges;
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   181  
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   182  		scmi_shmem: shmem@10f000 {
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   183  			compatible = "arm,scmi-shmem";
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   184  			reg = <0x0 0x0010f000 0x0 0x100>;
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   185  			no-map;
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   186  		};
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   187  	};
8fbb9376f0c489d arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2025-03-08   188  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   189  	timer {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   190  		compatible = "arm,armv8-timer";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   191  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   192  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   193  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   194  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   195  		arm,no-tick-in-suspend;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   196  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   197  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   198  	xin24m: xin24m {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   199  		compatible = "fixed-clock";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   200  		clock-frequency = <24000000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   201  		clock-output-names = "xin24m";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   202  		#clock-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   203  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   204  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   205  	xin32k: xin32k {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   206  		compatible = "fixed-clock";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   207  		clock-frequency = <32768>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   208  		clock-output-names = "xin32k";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   209  		pinctrl-0 = <&clk32k_out0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   210  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   211  		#clock-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   212  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   213  
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   214  	sata1: sata@fc400000 {
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   215  		compatible = "rockchip,rk3568-dwc-ahci", "snps,dwc-ahci";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   216  		reg = <0 0xfc400000 0 0x1000>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   217  		clocks = <&cru ACLK_SATA1>, <&cru CLK_SATA1_PMALIVE>,
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   218  			 <&cru CLK_SATA1_RXOOB>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   219  		clock-names = "sata", "pmalive", "rxoob";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   220  		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   221  		phys = <&combphy1 PHY_TYPE_SATA>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   222  		phy-names = "sata-phy";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   223  		ports-implemented = <0x1>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   224  		power-domains = <&power RK3568_PD_PIPE>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   225  		status = "disabled";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   226  	};
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   227  
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   228  	sata2: sata@fc800000 {
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   229  		compatible = "rockchip,rk3568-dwc-ahci", "snps,dwc-ahci";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   230  		reg = <0 0xfc800000 0 0x1000>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   231  		clocks = <&cru ACLK_SATA2>, <&cru CLK_SATA2_PMALIVE>,
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   232  			 <&cru CLK_SATA2_RXOOB>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   233  		clock-names = "sata", "pmalive", "rxoob";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   234  		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   235  		phys = <&combphy2 PHY_TYPE_SATA>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   236  		phy-names = "sata-phy";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   237  		ports-implemented = <0x1>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   238  		power-domains = <&power RK3568_PD_PIPE>;
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   239  		status = "disabled";
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   240  	};
16c0f95d9ed14f0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-03-11   241  
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   242  	usb_host0_xhci: usb@fcc00000 {
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   243  		compatible = "rockchip,rk3568-dwc3", "snps,dwc3";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   244  		reg = <0x0 0xfcc00000 0x0 0x400000>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   245  		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   246  		clocks = <&cru CLK_USB3OTG0_REF>, <&cru CLK_USB3OTG0_SUSPEND>,
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   247  			 <&cru ACLK_USB3OTG0>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   248  		clock-names = "ref_clk", "suspend_clk",
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   249  			      "bus_clk";
bc405bb3eeee4b7 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-04-25   250  		dr_mode = "otg";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   251  		phy_type = "utmi_wide";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   252  		power-domains = <&power RK3568_PD_PIPE>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   253  		resets = <&cru SRST_USB3OTG0>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   254  		snps,dis_u2_susphy_quirk;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   255  		status = "disabled";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   256  	};
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   257  
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   258  	usb_host1_xhci: usb@fd000000 {
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   259  		compatible = "rockchip,rk3568-dwc3", "snps,dwc3";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   260  		reg = <0x0 0xfd000000 0x0 0x400000>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   261  		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   262  		clocks = <&cru CLK_USB3OTG1_REF>, <&cru CLK_USB3OTG1_SUSPEND>,
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   263  			 <&cru ACLK_USB3OTG1>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   264  		clock-names = "ref_clk", "suspend_clk",
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   265  			      "bus_clk";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   266  		dr_mode = "host";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   267  		phys = <&usb2phy0_host>, <&combphy1 PHY_TYPE_USB3>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   268  		phy-names = "usb2-phy", "usb3-phy";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   269  		phy_type = "utmi_wide";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   270  		power-domains = <&power RK3568_PD_PIPE>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   271  		resets = <&cru SRST_USB3OTG1>;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   272  		snps,dis_u2_susphy_quirk;
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   273  		status = "disabled";
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   274  	};
9f4c480f24e2ce1 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-08   275  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   276  	gic: interrupt-controller@fd400000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   277  		compatible = "arm,gic-v3";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   278  		reg = <0x0 0xfd400000 0 0x10000>, /* GICD */
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   279  		      <0x0 0xfd460000 0 0x80000>; /* GICR */
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   280  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   281  		interrupt-controller;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  @282  		#interrupt-cells = <3>;
b6c1a590148c63f arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   283  		mbi-alias = <0x0 0xfd410000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   284  		mbi-ranges = <296 24>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   285  		msi-controller;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   286  		ranges;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   287  		#address-cells = <2>;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   288  		#size-cells = <2>;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   289  		dma-noncoherent;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   290  
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   291  		its: msi-controller@fd440000 {
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   292  			compatible = "arm,gic-v3-its";
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   293  			reg = <0x0 0xfd440000 0 0x20000>;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   294  			dma-noncoherent;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   295  			msi-controller;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   296  			#msi-cells = <1>;
f15be3d4a0a55db arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17   297  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   298  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   299  
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   300  	usb_host0_ehci: usb@fd800000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   301  		compatible = "generic-ehci";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   302  		reg = <0x0 0xfd800000 0x0 0x40000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   303  		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   304  		clocks = <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   305  			 <&cru PCLK_USB>;
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27   306  		phys = <&usb2phy1_otg>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   307  		phy-names = "usb";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   308  		status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   309  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   310  
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   311  	usb_host0_ohci: usb@fd840000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   312  		compatible = "generic-ohci";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   313  		reg = <0x0 0xfd840000 0x0 0x40000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   314  		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   315  		clocks = <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   316  			 <&cru PCLK_USB>;
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27   317  		phys = <&usb2phy1_otg>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   318  		phy-names = "usb";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   319  		status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   320  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   321  
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   322  	usb_host1_ehci: usb@fd880000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   323  		compatible = "generic-ehci";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   324  		reg = <0x0 0xfd880000 0x0 0x40000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   325  		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   326  		clocks = <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   327  			 <&cru PCLK_USB>;
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27   328  		phys = <&usb2phy1_host>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   329  		phy-names = "usb";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   330  		status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   331  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   332  
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   333  	usb_host1_ohci: usb@fd8c0000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   334  		compatible = "generic-ohci";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   335  		reg = <0x0 0xfd8c0000 0x0 0x40000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   336  		interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   337  		clocks = <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   338  			 <&cru PCLK_USB>;
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27   339  		phys = <&usb2phy1_host>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   340  		phy-names = "usb";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   341  		status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   342  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   343  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   344  	pmugrf: syscon@fdc20000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   345  		compatible = "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   346  		reg = <0x0 0xfdc20000 0x0 0x10000>;
2dbcb2514c83416 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2021-08-05   347  
2dbcb2514c83416 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2021-08-05   348  		pmu_io_domains: io-domains {
2dbcb2514c83416 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2021-08-05   349  			compatible = "rockchip,rk3568-pmu-io-voltage-domain";
2dbcb2514c83416 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2021-08-05   350  			status = "disabled";
2dbcb2514c83416 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2021-08-05   351  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   352  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   353  
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   354  	pipegrf: syscon@fdc50000 {
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   355  		reg = <0x0 0xfdc50000 0x0 0x1000>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   356  	};
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   357  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   358  	grf: syscon@fdc60000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   359  		compatible = "rockchip,rk3568-grf", "syscon", "simple-mfd";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   360  		reg = <0x0 0xfdc60000 0x0 0x10000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   361  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   362  
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   363  	pipe_phy_grf1: syscon@fdc80000 {
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   364  		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   365  		reg = <0x0 0xfdc80000 0x0 0x1000>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   366  	};
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   367  
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   368  	pipe_phy_grf2: syscon@fdc90000 {
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   369  		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   370  		reg = <0x0 0xfdc90000 0x0 0x1000>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   371  	};
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08   372  
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   373  	usb2phy0_grf: syscon@fdca0000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   374  		compatible = "rockchip,rk3568-usb2phy-grf", "syscon";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   375  		reg = <0x0 0xfdca0000 0x0 0x8000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   376  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   377  
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   378  	usb2phy1_grf: syscon@fdca8000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   379  		compatible = "rockchip,rk3568-usb2phy-grf", "syscon";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   380  		reg = <0x0 0xfdca8000 0x0 0x8000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   381  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15   382  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   383  	pmucru: clock-controller@fdd00000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   384  		compatible = "rockchip,rk3568-pmucru";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   385  		reg = <0x0 0xfdd00000 0x0 0x1000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   386  		#clock-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   387  		#reset-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   388  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   389  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   390  	cru: clock-controller@fdd20000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   391  		compatible = "rockchip,rk3568-cru";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   392  		reg = <0x0 0xfdd20000 0x0 0x1000>;
cd2d081d18de396 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-05-11   393  		clocks = <&xin24m>;
cd2d081d18de396 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-05-11   394  		clock-names = "xin24m";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   395  		#clock-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   396  		#reset-cells = <1>;
64b69474edf3b88 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Jonas Karlman        2023-01-10   397  		assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>, <&pmucru PLL_PPLL>;
64b69474edf3b88 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Jonas Karlman        2023-01-10   398  		assigned-clock-rates = <32768>, <1200000000>, <200000000>;
64b69474edf3b88 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Jonas Karlman        2023-01-10   399  		assigned-clock-parents = <&pmucru CLK_RTC32K_FRAC>;
95ad4dbe5f43bf6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2021-08-23   400  		rockchip,grf = <&grf>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   401  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   402  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   403  	i2c0: i2c@fdd40000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   404  		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   405  		reg = <0x0 0xfdd40000 0x0 0x1000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   406  		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   407  		clocks = <&pmucru CLK_I2C0>, <&pmucru PCLK_I2C0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   408  		clock-names = "i2c", "pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   409  		pinctrl-0 = <&i2c0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   410  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   411  		#address-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   412  		#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   413  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   414  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   415  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   416  	uart0: serial@fdd50000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   417  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   418  		reg = <0x0 0xfdd50000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   419  		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   420  		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   421  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   422  		dmas = <&dmac0 0>, <&dmac0 1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   423  		pinctrl-0 = <&uart0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   424  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   425  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   426  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   427  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   428  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   429  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   430  	pwm0: pwm@fdd70000 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   431  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   432  		reg = <0x0 0xfdd70000 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   433  		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   434  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   435  		pinctrl-0 = <&pwm0m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08   436  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   437  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   438  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   439  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   440  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   441  	pwm1: pwm@fdd70010 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   442  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   443  		reg = <0x0 0xfdd70010 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   444  		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   445  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   446  		pinctrl-0 = <&pwm1m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08   447  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   448  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   449  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   450  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   451  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   452  	pwm2: pwm@fdd70020 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   453  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   454  		reg = <0x0 0xfdd70020 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   455  		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   456  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   457  		pinctrl-0 = <&pwm2m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08   458  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   459  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   460  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   461  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   462  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   463  	pwm3: pwm@fdd70030 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   464  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   465  		reg = <0x0 0xfdd70030 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   466  		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   467  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   468  		pinctrl-0 = <&pwm3_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08   469  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   470  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   471  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   472  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26   473  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   474  	pmu: power-management@fdd90000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   475  		compatible = "rockchip,rk3568-pmu", "syscon", "simple-mfd";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   476  		reg = <0x0 0xfdd90000 0x0 0x1000>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   477  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   478  		power: power-controller {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   479  			compatible = "rockchip,rk3568-power-controller";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   480  			#power-domain-cells = <1>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   481  			#address-cells = <1>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   482  			#size-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   483  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   484  			/* These power domains are grouped by VD_GPU */
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   485  			power-domain@RK3568_PD_GPU {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   486  				reg = <RK3568_PD_GPU>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   487  				clocks = <&cru ACLK_GPU_PRE>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   488  					 <&cru PCLK_GPU_PRE>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   489  				pm_qos = <&qos_gpu>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   490  				#power-domain-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   491  			};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   492  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   493  			/* These power domains are grouped by VD_LOGIC */
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   494  			power-domain@RK3568_PD_VI {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   495  				reg = <RK3568_PD_VI>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   496  				clocks = <&cru HCLK_VI>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   497  					 <&cru PCLK_VI>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   498  				pm_qos = <&qos_isp>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   499  					 <&qos_vicap0>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   500  					 <&qos_vicap1>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   501  				#power-domain-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   502  			};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   503  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   504  			power-domain@RK3568_PD_VO {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   505  				reg = <RK3568_PD_VO>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   506  				clocks = <&cru HCLK_VO>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   507  					 <&cru PCLK_VO>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   508  					 <&cru ACLK_VOP_PRE>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   509  				pm_qos = <&qos_hdcp>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   510  					 <&qos_vop_m0>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   511  					 <&qos_vop_m1>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   512  				#power-domain-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   513  			};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   514  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   515  			power-domain@RK3568_PD_RGA {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   516  				reg = <RK3568_PD_RGA>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   517  				clocks = <&cru HCLK_RGA_PRE>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   518  					 <&cru PCLK_RGA_PRE>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   519  				pm_qos = <&qos_ebc>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   520  					 <&qos_iep>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   521  					 <&qos_jpeg_dec>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   522  					 <&qos_jpeg_enc>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   523  					 <&qos_rga_rd>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   524  					 <&qos_rga_wr>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   525  				#power-domain-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   526  			};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   527  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   528  			power-domain@RK3568_PD_VPU {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   529  				reg = <RK3568_PD_VPU>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   530  				clocks = <&cru HCLK_VPU_PRE>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   531  				pm_qos = <&qos_vpu>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   532  				#power-domain-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   533  			};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   534  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   535  			power-domain@RK3568_PD_RKVDEC {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   536  				clocks = <&cru HCLK_RKVDEC_PRE>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   537  				reg = <RK3568_PD_RKVDEC>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   538  				pm_qos = <&qos_rkvdec>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   539  				#power-domain-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   540  			};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   541  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   542  			power-domain@RK3568_PD_RKVENC {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   543  				reg = <RK3568_PD_RKVENC>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   544  				clocks = <&cru HCLK_RKVENC_PRE>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   545  				pm_qos = <&qos_rkvenc_rd_m0>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   546  					 <&qos_rkvenc_rd_m1>,
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   547  					 <&qos_rkvenc_wr_m0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   548  				#power-domain-cells = <0>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   549  			};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   550  		};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   551  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   552  
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   553  	gpu: gpu@fde60000 {
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   554  		compatible = "rockchip,rk3568-mali", "arm,mali-bifrost";
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   555  		reg = <0x0 0xfde60000 0x0 0x4000>;
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   556  		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   557  			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   558  			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   559  		interrupt-names = "job", "mmu", "gpu";
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   560  		clocks = <&scmi_clk 1>, <&cru CLK_GPU>;
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   561  		clock-names = "gpu", "bus";
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   562  		#cooling-cells = <2>;
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   563  		power-domains = <&power RK3568_PD_GPU>;
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   564  		status = "disabled";
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   565  	};
810028668c6d9da arch/arm64/boot/dts/rockchip/rk356x.dtsi      Ezequiel Garcia      2022-02-09   566  
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   567  	csi: csi@fdfb0000 {
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   568  		compatible = "rockchip,rk3568-mipi-csi";
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   569  		reg = <0x0 0xfdfb0000 0x0 0x10000>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   570  		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   571  			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   572  		interrupt-names = "irq1", "irq2";
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   573  		clocks = <&cru PCLK_CSI2HOST1>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   574  		phys = <&csi_dphy>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   575  		power-domains = <&power RK3568_PD_VI>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   576  		resets = <&cru SRST_P_CSI2HOST1>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   577  		status = "disabled";
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   578  
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   579  		ports {
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   580  			#address-cells = <1>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   581  			#size-cells = <0>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   582  
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   583  			csi_in: port@0 {
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   584  				reg = <0>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   585  			};
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   586  
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   587  			csi_out: port@1 {
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   588  				reg = <1>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   589  
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   590  				csi_output: endpoint {
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   591  					remote-endpoint = <&vicap_mipi_input>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   592  				};
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   593  			};
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   594  		};
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   595  	};
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   596  
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   597  	vicap: video-capture@fdfe0000 {
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   598  		compatible = "rockchip,rk3568-vicap";
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   599  		reg = <0x0 0xfdfe0000 0x0 0x200>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   600  		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   601  		assigned-clocks = <&cru DCLK_VICAP>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   602  		assigned-clock-rates = <300000000>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   603  		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   604  			 <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   605  		clock-names = "aclk", "hclk", "dclk", "iclk";
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   606  		iommus = <&vicap_mmu>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   607  		power-domains = <&power RK3568_PD_VI>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   608  		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   609  			 <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   610  			 <&cru SRST_I_VICAP>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   611  		reset-names = "arst", "hrst", "drst", "prst", "irst";
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   612  		rockchip,grf = <&grf>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   613  		status = "disabled";
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   614  
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   615  		ports {
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   616  			#address-cells = <1>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   617  			#size-cells = <0>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   618  
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   619  			vicap_dvp: port@0 {
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   620  				reg = <0>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   621  			};
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   622  
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   623  			vicap_mipi: port@1 {
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   624  				reg = <1>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   625  
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   626  				vicap_mipi_input: endpoint {
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   627  					remote-endpoint = <&csi_output>;
447b2badad0bf07 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   628  				};
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   629  			};
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   630  		};
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   631  	};
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   632  
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   633  	vicap_mmu: iommu@fdfe0800 {
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   634  		compatible = "rockchip,rk3568-iommu";
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   635  		reg = <0x0 0xfdfe0800 0x0 0x100>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   636  		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   637  		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   638  		clock-names = "aclk", "iface";
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   639  		#iommu-cells = <0>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   640  		power-domains = <&power RK3568_PD_VI>;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   641  		rockchip,disable-mmu-reset;
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   642  		status = "disabled";
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   643  	};
ff6375d29bd4efa arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Michael Riesch       2025-06-18   644  
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   645  	vpu: video-codec@fdea0400 {
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   646  		compatible = "rockchip,rk3568-vpu";
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   647  		reg = <0x0 0xfdea0000 0x0 0x800>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   648  		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
d1c44d9afa6f89a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2024-02-27   649  		interrupt-names = "vdpu";
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   650  		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   651  		clock-names = "aclk", "hclk";
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   652  		iommus = <&vdpu_mmu>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   653  		power-domains = <&power RK3568_PD_VPU>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   654  	};
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   655  
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   656  	vdpu_mmu: iommu@fdea0800 {
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   657  		compatible = "rockchip,rk3568-iommu";
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   658  		reg = <0x0 0xfdea0800 0x0 0x40>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   659  		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   660  		clock-names = "aclk", "iface";
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   661  		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   662  		power-domains = <&power RK3568_PD_VPU>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   663  		#iommu-cells = <0>;
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   664  	};
944be6fba401639 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Piotr Oniszczuk      2022-02-14   665  
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   666  	rga: rga@fdeb0000 {
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   667  		compatible = "rockchip,rk3568-rga", "rockchip,rk3288-rga";
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   668  		reg = <0x0 0xfdeb0000 0x0 0x180>;
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   669  		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   670  		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru CLK_RGA_CORE>;
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   671  		clock-names = "aclk", "hclk", "sclk";
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   672  		resets = <&cru SRST_RGA_CORE>, <&cru SRST_A_RGA>, <&cru SRST_H_RGA>;
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   673  		reset-names = "core", "axi", "ahb";
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   674  		power-domains = <&power RK3568_PD_RGA>;
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   675  	};
0c3391f8bb06b74 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Tretter      2023-01-20   676  
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   677  	vepu: video-codec@fdee0000 {
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   678  		compatible = "rockchip,rk3568-vepu";
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   679  		reg = <0x0 0xfdee0000 0x0 0x800>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   680  		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   681  		clocks = <&cru ACLK_JENC>, <&cru HCLK_JENC>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   682  		clock-names = "aclk", "hclk";
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   683  		iommus = <&vepu_mmu>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   684  		power-domains = <&power RK3568_PD_RGA>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   685  	};
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   686  
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   687  	vepu_mmu: iommu@fdee0800 {
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   688  		compatible = "rockchip,rk3568-iommu";
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   689  		reg = <0x0 0xfdee0800 0x0 0x40>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   690  		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   691  		clocks = <&cru ACLK_JENC>, <&cru HCLK_JENC>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   692  		clock-names = "aclk", "iface";
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   693  		power-domains = <&power RK3568_PD_RGA>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   694  		#iommu-cells = <0>;
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   695  	};
03d86fb5a56919c arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-12   696  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   697  	sdmmc2: mmc@fe000000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   698  		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   699  		reg = <0x0 0xfe000000 0x0 0x4000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   700  		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   701  		clocks = <&cru HCLK_SDMMC2>, <&cru CLK_SDMMC2>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   702  			 <&cru SCLK_SDMMC2_DRV>, <&cru SCLK_SDMMC2_SAMPLE>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   703  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   704  		fifo-depth = <0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   705  		max-frequency = <150000000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   706  		resets = <&cru SRST_SDMMC2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   707  		reset-names = "reset";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   708  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   709  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22   710  
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   711  	gmac1: ethernet@fe010000 {
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   712  		compatible = "rockchip,rk3568-gmac", "snps,dwmac-4.20a";
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   713  		reg = <0x0 0xfe010000 0x0 0x10000>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   714  		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   715  			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   716  		interrupt-names = "macirq", "eth_wake_irq";
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   717  		clocks = <&cru SCLK_GMAC1>, <&cru SCLK_GMAC1_RX_TX>,
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   718  			 <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_MAC1_REFOUT>,
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   719  			 <&cru ACLK_GMAC1>, <&cru PCLK_GMAC1>,
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   720  			 <&cru SCLK_GMAC1_RX_TX>, <&cru CLK_GMAC1_PTP_REF>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   721  		clock-names = "stmmaceth", "mac_clk_rx",
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   722  			      "mac_clk_tx", "clk_mac_refout",
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   723  			      "aclk_mac", "pclk_mac",
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   724  			      "clk_mac_speed", "ptp_ref";
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   725  		resets = <&cru SRST_A_GMAC1>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   726  		reset-names = "stmmaceth";
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   727  		rockchip,grf = <&grf>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   728  		snps,axi-config = <&gmac1_stmmac_axi_setup>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   729  		snps,mixed-burst;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   730  		snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   731  		snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   732  		snps,tso;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   733  		status = "disabled";
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   734  
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   735  		mdio1: mdio {
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   736  			compatible = "snps,dwmac-mdio";
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   737  			#address-cells = <0x1>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   738  			#size-cells = <0x0>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   739  		};
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   740  
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   741  		gmac1_stmmac_axi_setup: stmmac-axi-config {
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   742  			snps,blen = <0 0 0 0 16 8 4>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   743  			snps,rd_osr_lmt = <8>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   744  			snps,wr_osr_lmt = <4>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   745  		};
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   746  
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   747  		gmac1_mtl_rx_setup: rx-queues-config {
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   748  			snps,rx-queues-to-use = <1>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   749  			queue0 {};
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   750  		};
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   751  
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   752  		gmac1_mtl_tx_setup: tx-queues-config {
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   753  			snps,tx-queues-to-use = <1>;
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   754  			queue0 {};
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   755  		};
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   756  	};
0dcec571cee5199 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28   757  
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   758  	vop: vop@fe040000 {
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   759  		reg = <0x0 0xfe040000 0x0 0x3000>, <0x0 0xfe044000 0x0 0x1000>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   760  		reg-names = "vop", "gamma-lut";
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   761  		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   762  		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>, <&cru DCLK_VOP0>,
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   763  			 <&cru DCLK_VOP1>, <&cru DCLK_VOP2>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   764  		clock-names = "aclk", "hclk", "dclk_vp0", "dclk_vp1", "dclk_vp2";
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   765  		iommus = <&vop_mmu>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   766  		power-domains = <&power RK3568_PD_VO>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   767  		rockchip,grf = <&grf>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   768  		status = "disabled";
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   769  
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   770  		vop_out: ports {
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   771  			#address-cells = <1>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   772  			#size-cells = <0>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   773  
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   774  			vp0: port@0 {
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   775  				reg = <0>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   776  				#address-cells = <1>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   777  				#size-cells = <0>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   778  			};
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   779  
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   780  			vp1: port@1 {
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   781  				reg = <1>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   782  				#address-cells = <1>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   783  				#size-cells = <0>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   784  			};
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   785  
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   786  			vp2: port@2 {
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   787  				reg = <2>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   788  				#address-cells = <1>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   789  				#size-cells = <0>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   790  			};
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   791  		};
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   792  	};
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   793  
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   794  	vop_mmu: iommu@fe043e00 {
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   795  		compatible = "rockchip,rk3568-iommu";
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   796  		reg = <0x0 0xfe043e00 0x0 0x100>, <0x0 0xfe043f00 0x0 0x100>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   797  		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   798  		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   799  		clock-names = "aclk", "iface";
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   800  		#iommu-cells = <0>;
9d42c3ee3ce37cd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Cristian Ciocaltea   2024-07-02   801  		power-domains = <&power RK3568_PD_VO>;
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   802  		status = "disabled";
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   803  	};
9d6c6d978f97fab arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   804  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   805  	dsi0: dsi@fe060000 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   806  		compatible = "rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   807  		reg = <0x00 0xfe060000 0x00 0x10000>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   808  		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
cadda005961cd6a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Johan Jonker         2022-12-22   809  		clock-names = "pclk";
cadda005961cd6a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Johan Jonker         2022-12-22   810  		clocks = <&cru PCLK_DSITX_0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   811  		phy-names = "dphy";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   812  		phys = <&dsi_dphy0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   813  		power-domains = <&power RK3568_PD_VO>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   814  		reset-names = "apb";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   815  		resets = <&cru SRST_P_DSITX_0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   816  		rockchip,grf = <&grf>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   817  		status = "disabled";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   818  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   819  		ports {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   820  			#address-cells = <1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   821  			#size-cells = <0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   822  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   823  			dsi0_in: port@0 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   824  				reg = <0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   825  			};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   826  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   827  			dsi0_out: port@1 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   828  				reg = <1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   829  			};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   830  		};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   831  	};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   832  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   833  	dsi1: dsi@fe070000 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   834  		compatible = "rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   835  		reg = <0x0 0xfe070000 0x0 0x10000>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   836  		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
cadda005961cd6a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Johan Jonker         2022-12-22   837  		clock-names = "pclk";
cadda005961cd6a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Johan Jonker         2022-12-22   838  		clocks = <&cru PCLK_DSITX_1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   839  		phy-names = "dphy";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   840  		phys = <&dsi_dphy1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   841  		power-domains = <&power RK3568_PD_VO>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   842  		reset-names = "apb";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   843  		resets = <&cru SRST_P_DSITX_1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   844  		rockchip,grf = <&grf>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   845  		status = "disabled";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   846  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   847  		ports {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   848  			#address-cells = <1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   849  			#size-cells = <0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   850  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   851  			dsi1_in: port@0 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   852  				reg = <0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   853  			};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   854  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   855  			dsi1_out: port@1 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   856  				reg = <1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   857  			};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   858  		};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   859  	};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19   860  
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   861  	hdmi: hdmi@fe0a0000 {
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   862  		compatible = "rockchip,rk3568-dw-hdmi";
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   863  		reg = <0x0 0xfe0a0000 0x0 0x20000>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   864  		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   865  		clocks = <&cru PCLK_HDMI_HOST>,
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   866  			 <&cru CLK_HDMI_SFR>,
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   867  			 <&cru CLK_HDMI_CEC>,
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   868  			 <&pmucru CLK_HDMI_REF>,
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   869  			 <&cru HCLK_VO>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   870  		clock-names = "iahb", "isfr", "cec", "ref";
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   871  		pinctrl-names = "default";
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   872  		pinctrl-0 = <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   873  		power-domains = <&power RK3568_PD_VO>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   874  		reg-io-width = <4>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   875  		rockchip,grf = <&grf>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   876  		#sound-dai-cells = <0>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   877  		status = "disabled";
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   878  
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   879  		ports {
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   880  			#address-cells = <1>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   881  			#size-cells = <0>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   882  
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   883  			hdmi_in: port@0 {
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   884  				reg = <0>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   885  			};
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   886  
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   887  			hdmi_out: port@1 {
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   888  				reg = <1>;
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   889  			};
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   890  		};
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   891  	};
d689e5709b8a9d5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2022-04-22   892  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   893  	qos_gpu: qos@fe128000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   894  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   895  		reg = <0x0 0xfe128000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   896  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   897  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   898  	qos_rkvenc_rd_m0: qos@fe138080 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   899  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   900  		reg = <0x0 0xfe138080 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   901  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   902  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   903  	qos_rkvenc_rd_m1: qos@fe138100 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   904  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   905  		reg = <0x0 0xfe138100 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   906  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   907  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   908  	qos_rkvenc_wr_m0: qos@fe138180 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   909  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   910  		reg = <0x0 0xfe138180 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   911  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   912  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   913  	qos_isp: qos@fe148000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   914  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   915  		reg = <0x0 0xfe148000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   916  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   917  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   918  	qos_vicap0: qos@fe148080 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   919  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   920  		reg = <0x0 0xfe148080 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   921  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   922  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   923  	qos_vicap1: qos@fe148100 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   924  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   925  		reg = <0x0 0xfe148100 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   926  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   927  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   928  	qos_vpu: qos@fe150000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   929  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   930  		reg = <0x0 0xfe150000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   931  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   932  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   933  	qos_ebc: qos@fe158000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   934  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   935  		reg = <0x0 0xfe158000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   936  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   937  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   938  	qos_iep: qos@fe158100 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   939  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   940  		reg = <0x0 0xfe158100 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   941  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   942  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   943  	qos_jpeg_dec: qos@fe158180 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   944  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   945  		reg = <0x0 0xfe158180 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   946  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   947  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   948  	qos_jpeg_enc: qos@fe158200 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   949  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   950  		reg = <0x0 0xfe158200 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   951  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   952  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   953  	qos_rga_rd: qos@fe158280 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   954  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   955  		reg = <0x0 0xfe158280 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   956  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   957  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   958  	qos_rga_wr: qos@fe158300 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   959  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   960  		reg = <0x0 0xfe158300 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   961  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   962  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   963  	qos_npu: qos@fe180000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   964  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   965  		reg = <0x0 0xfe180000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   966  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   967  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   968  	qos_pcie2x1: qos@fe190000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   969  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   970  		reg = <0x0 0xfe190000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   971  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   972  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   973  	qos_sata1: qos@fe190280 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   974  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   975  		reg = <0x0 0xfe190280 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   976  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   977  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   978  	qos_sata2: qos@fe190300 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   979  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   980  		reg = <0x0 0xfe190300 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   981  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   982  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   983  	qos_usb3_0: qos@fe190380 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   984  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   985  		reg = <0x0 0xfe190380 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   986  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   987  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   988  	qos_usb3_1: qos@fe190400 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   989  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   990  		reg = <0x0 0xfe190400 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   991  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   992  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   993  	qos_rkvdec: qos@fe198000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   994  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   995  		reg = <0x0 0xfe198000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   996  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   997  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   998  	qos_hdcp: qos@fe1a8000 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24   999  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1000  		reg = <0x0 0xfe1a8000 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1001  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1002  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1003  	qos_vop_m0: qos@fe1a8080 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1004  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1005  		reg = <0x0 0xfe1a8080 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1006  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1007  
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1008  	qos_vop_m1: qos@fe1a8100 {
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1009  		compatible = "rockchip,rk3568-qos", "syscon";
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1010  		reg = <0x0 0xfe1a8100 0x0 0x20>;
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1011  	};
e1152a526b16951 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-24  1012  
085be8875ca8a08 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2023-10-18  1013  	dfi: dfi@fe230000 {
085be8875ca8a08 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2023-10-18  1014  		compatible = "rockchip,rk3568-dfi";
085be8875ca8a08 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2023-10-18  1015  		reg = <0x00 0xfe230000 0x00 0x400>;
085be8875ca8a08 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2023-10-18  1016  		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
085be8875ca8a08 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2023-10-18  1017  		rockchip,pmu = <&pmugrf>;
085be8875ca8a08 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2023-10-18  1018  	};
085be8875ca8a08 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2023-10-18  1019  
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1020  	pcie2x1: pcie@fe260000 {
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1021  		compatible = "rockchip,rk3568-pcie";
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1022  		reg = <0x3 0xc0000000 0x0 0x00400000>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1023  		      <0x0 0xfe260000 0x0 0x00010000>,
568a67e742dfa90 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Andrew Powers-Holmes 2023-06-01  1024  		      <0x0 0xf4000000 0x0 0x00100000>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1025  		reg-names = "dbi", "apb", "config";
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1026  		interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1027  			     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1028  			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1029  			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1030  			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
3cee9c635f27d10 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2023-11-14  1031  		interrupt-names = "sys", "pmc", "msg", "legacy", "err";
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1032  		bus-range = <0x0 0xf>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1033  		clocks = <&cru ACLK_PCIE20_MST>, <&cru ACLK_PCIE20_SLV>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1034  			 <&cru ACLK_PCIE20_DBI>, <&cru PCLK_PCIE20>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1035  			 <&cru CLK_PCIE20_AUX_NDFT>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1036  		clock-names = "aclk_mst", "aclk_slv",
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1037  			      "aclk_dbi", "pclk", "aux";
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1038  		device_type = "pci";
a323e6b5737bb6e arch/arm64/boot/dts/rockchip/rk356x.dtsi      Jensen Huang         2023-01-13  1039  		#interrupt-cells = <1>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1040  		interrupt-map-mask = <0 0 0 7>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1041  		interrupt-map = <0 0 0 1 &pcie_intc 0>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1042  				<0 0 0 2 &pcie_intc 1>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1043  				<0 0 0 3 &pcie_intc 2>,
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1044  				<0 0 0 4 &pcie_intc 3>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1045  		linux,pci-domain = <0>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1046  		num-ib-windows = <6>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1047  		num-ob-windows = <2>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1048  		max-link-speed = <2>;
b956c9de91757c9 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dmitry Osipenko      2025-02-17  1049  		msi-map = <0x0 &its 0x0 0x1000>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1050  		num-lanes = <1>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1051  		phys = <&combphy2 PHY_TYPE_PCIE>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1052  		phy-names = "pcie-phy";
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1053  		power-domains = <&power RK3568_PD_PIPE>;
568a67e742dfa90 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Andrew Powers-Holmes 2023-06-01  1054  		ranges = <0x01000000 0x0 0xf4100000 0x0 0xf4100000 0x0 0x00100000>,
568a67e742dfa90 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Andrew Powers-Holmes 2023-06-01  1055  			 <0x02000000 0x0 0xf4200000 0x0 0xf4200000 0x0 0x01e00000>,
568a67e742dfa90 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Andrew Powers-Holmes 2023-06-01  1056  			 <0x03000000 0x0 0x40000000 0x3 0x00000000 0x0 0x40000000>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1057  		resets = <&cru SRST_PCIE20_POWERUP>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1058  		reset-names = "pipe";
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1059  		#address-cells = <3>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1060  		#size-cells = <2>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1061  		status = "disabled";
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1062  
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1063  		pcie_intc: legacy-interrupt-controller {
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1064  			#address-cells = <0>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1065  			#interrupt-cells = <1>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1066  			interrupt-controller;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1067  			interrupt-parent = <&gic>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1068  			interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1069  		};
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1070  	};
66b51ea7d70fcc2 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1071  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1072  	sdmmc0: mmc@fe2b0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1073  		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1074  		reg = <0x0 0xfe2b0000 0x0 0x4000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1075  		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1076  		clocks = <&cru HCLK_SDMMC0>, <&cru CLK_SDMMC0>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1077  			 <&cru SCLK_SDMMC0_DRV>, <&cru SCLK_SDMMC0_SAMPLE>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1078  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1079  		fifo-depth = <0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1080  		max-frequency = <150000000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1081  		resets = <&cru SRST_SDMMC0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1082  		reset-names = "reset";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1083  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1084  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1085  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1086  	sdmmc1: mmc@fe2c0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1087  		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1088  		reg = <0x0 0xfe2c0000 0x0 0x4000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1089  		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1090  		clocks = <&cru HCLK_SDMMC1>, <&cru CLK_SDMMC1>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1091  			 <&cru SCLK_SDMMC1_DRV>, <&cru SCLK_SDMMC1_SAMPLE>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1092  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1093  		fifo-depth = <0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1094  		max-frequency = <150000000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1095  		resets = <&cru SRST_SDMMC1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1096  		reset-names = "reset";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1097  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1098  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1099  
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1100  	sfc: spi@fe300000 {
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1101  		compatible = "rockchip,sfc";
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1102  		reg = <0x0 0xfe300000 0x0 0x4000>;
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1103  		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1104  		clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1105  		clock-names = "clk_sfc", "hclk_sfc";
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1106  		pinctrl-0 = <&fspi_pins>;
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1107  		pinctrl-names = "default";
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1108  		status = "disabled";
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1109  	};
13e0ee34f39c019 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2022-04-29  1110  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1111  	sdhci: mmc@fe310000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1112  		compatible = "rockchip,rk3568-dwcmshc";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1113  		reg = <0x0 0xfe310000 0x0 0x10000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1114  		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1115  		assigned-clocks = <&cru BCLK_EMMC>, <&cru TCLK_EMMC>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1116  		assigned-clock-rates = <200000000>, <24000000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1117  		clocks = <&cru CCLK_EMMC>, <&cru HCLK_EMMC>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1118  			 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1119  			 <&cru TCLK_EMMC>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1120  		clock-names = "core", "bus", "axi", "block", "timer";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1121  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1122  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1123  
5afdb98dcc55917 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dragan Simic         2024-12-02  1124  	/*
5afdb98dcc55917 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dragan Simic         2024-12-02  1125  	 * Testing showed that the HWRNG found in RK3566 produces unacceptably
5afdb98dcc55917 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dragan Simic         2024-12-02  1126  	 * low quality of random data, so the HWRNG isn't enabled for all RK356x
5afdb98dcc55917 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dragan Simic         2024-12-02  1127  	 * SoC variants despite its presence.
5afdb98dcc55917 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Dragan Simic         2024-12-02  1128  	 */
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1129  	rng: rng@fe388000 {
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1130  		compatible = "rockchip,rk3568-rng";
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1131  		reg = <0x0 0xfe388000 0x0 0x4000>;
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1132  		clocks = <&cru CLK_TRNG_NS>, <&cru HCLK_TRNG_NS>;
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1133  		clock-names = "core", "ahb";
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1134  		resets = <&cru SRST_TRNG_NS>;
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1135  		status = "disabled";
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1136  	};
afeccc4084963aa arch/arm64/boot/dts/rockchip/rk356x.dtsi      Aurelien Jarno       2024-07-30  1137  
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1138  	i2s0_8ch: i2s@fe400000 {
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1139  		compatible = "rockchip,rk3568-i2s-tdm";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1140  		reg = <0x0 0xfe400000 0x0 0x1000>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1141  		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1142  		assigned-clocks = <&cru CLK_I2S0_8CH_TX_SRC>, <&cru CLK_I2S0_8CH_RX_SRC>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1143  		assigned-clock-rates = <1188000000>, <1188000000>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1144  		clocks = <&cru MCLK_I2S0_8CH_TX>, <&cru MCLK_I2S0_8CH_RX>, <&cru HCLK_I2S0_8CH>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1145  		clock-names = "mclk_tx", "mclk_rx", "hclk";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1146  		dmas = <&dmac1 0>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1147  		dma-names = "tx";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1148  		resets = <&cru SRST_M_I2S0_8CH_TX>, <&cru SRST_M_I2S0_8CH_RX>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1149  		reset-names = "tx-m", "rx-m";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1150  		rockchip,grf = <&grf>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1151  		#sound-dai-cells = <0>;
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1152  		status = "disabled";
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1153  	};
697ee8546e241bd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2022-06-11  1154  
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1155  	i2s1_8ch: i2s@fe410000 {
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1156  		compatible = "rockchip,rk3568-i2s-tdm";
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1157  		reg = <0x0 0xfe410000 0x0 0x1000>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1158  		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1159  		assigned-clocks = <&cru CLK_I2S1_8CH_TX_SRC>, <&cru CLK_I2S1_8CH_RX_SRC>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1160  		assigned-clock-rates = <1188000000>, <1188000000>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1161  		clocks = <&cru MCLK_I2S1_8CH_TX>, <&cru MCLK_I2S1_8CH_RX>,
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1162  			 <&cru HCLK_I2S1_8CH>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1163  		clock-names = "mclk_tx", "mclk_rx", "hclk";
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1164  		dmas = <&dmac1 3>, <&dmac1 2>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1165  		dma-names = "rx", "tx";
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1166  		resets = <&cru SRST_M_I2S1_8CH_TX>, <&cru SRST_M_I2S1_8CH_RX>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1167  		reset-names = "tx-m", "rx-m";
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1168  		rockchip,grf = <&grf>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1169  		pinctrl-names = "default";
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1170  		pinctrl-0 = <&i2s1m0_sclktx &i2s1m0_sclkrx
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1171  			     &i2s1m0_lrcktx &i2s1m0_lrckrx
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1172  			     &i2s1m0_sdi0   &i2s1m0_sdi1
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1173  			     &i2s1m0_sdi2   &i2s1m0_sdi3
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1174  			     &i2s1m0_sdo0   &i2s1m0_sdo1
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1175  			     &i2s1m0_sdo2   &i2s1m0_sdo3>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1176  		#sound-dai-cells = <0>;
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1177  		status = "disabled";
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1178  	};
ef5c913570040df arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-10-16  1179  
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1180  	i2s2_2ch: i2s@fe420000 {
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1181  		compatible = "rockchip,rk3568-i2s-tdm";
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1182  		reg = <0x0 0xfe420000 0x0 0x1000>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1183  		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1184  		assigned-clocks = <&cru CLK_I2S2_2CH_SRC>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1185  		assigned-clock-rates = <1188000000>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1186  		clocks = <&cru MCLK_I2S2_2CH>, <&cru MCLK_I2S2_2CH>, <&cru HCLK_I2S2_2CH>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1187  		clock-names = "mclk_tx", "mclk_rx", "hclk";
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1188  		dmas = <&dmac1 4>, <&dmac1 5>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1189  		dma-names = "tx", "rx";
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1190  		resets = <&cru SRST_M_I2S2_2CH>;
0fc19ab75acde78 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2024-02-27  1191  		reset-names = "tx-m";
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1192  		rockchip,grf = <&grf>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1193  		pinctrl-names = "default";
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1194  		pinctrl-0 = <&i2s2m0_sclktx
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1195  				&i2s2m0_lrcktx
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1196  				&i2s2m0_sdi
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1197  				&i2s2m0_sdo>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1198  		#sound-dai-cells = <0>;
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1199  		status = "disabled";
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1200  	};
755f37010f3eac0 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Shengyu Qu           2022-10-30  1201  
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1202  	i2s3_2ch: i2s@fe430000 {
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1203  		compatible = "rockchip,rk3568-i2s-tdm";
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1204  		reg = <0x0 0xfe430000 0x0 0x1000>;
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1205  		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1206  		clocks = <&cru MCLK_I2S3_2CH_TX>, <&cru MCLK_I2S3_2CH_RX>,
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1207  			 <&cru HCLK_I2S3_2CH>;
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1208  		clock-names = "mclk_tx", "mclk_rx", "hclk";
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1209  		dmas = <&dmac1 6>, <&dmac1 7>;
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1210  		dma-names = "tx", "rx";
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1211  		resets = <&cru SRST_M_I2S3_2CH_TX>, <&cru SRST_M_I2S3_2CH_RX>;
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1212  		reset-names = "tx-m", "rx-m";
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1213  		rockchip,grf = <&grf>;
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1214  		#sound-dai-cells = <0>;
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1215  		status = "disabled";
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1216  	};
ad14de0638903b5 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-31  1217  
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1218  	pdm: pdm@fe440000 {
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1219  		compatible = "rockchip,rk3568-pdm";
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1220  		reg = <0x0 0xfe440000 0x0 0x1000>;
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1221  		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1222  		clocks = <&cru MCLK_PDM>, <&cru HCLK_PDM>;
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1223  		clock-names = "pdm_clk", "pdm_hclk";
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1224  		dmas = <&dmac1 9>;
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1225  		dma-names = "rx";
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1226  		pinctrl-0 = <&pdmm0_clk
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1227  			     &pdmm0_clk1
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1228  			     &pdmm0_sdi0
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1229  			     &pdmm0_sdi1
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1230  			     &pdmm0_sdi2
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1231  			     &pdmm0_sdi3>;
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1232  		pinctrl-names = "default";
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1233  		resets = <&cru SRST_M_PDM>;
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1234  		reset-names = "pdm-m";
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1235  		#sound-dai-cells = <0>;
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1236  		status = "disabled";
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1237  	};
79c5f0e52d29a68 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Samuel Holland       2022-01-29  1238  
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1239  	spdif: spdif@fe460000 {
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1240  		compatible = "rockchip,rk3568-spdif";
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1241  		reg = <0x0 0xfe460000 0x0 0x1000>;
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1242  		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1243  		clock-names = "mclk", "hclk";
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1244  		clocks = <&cru MCLK_SPDIF_8CH>, <&cru HCLK_SPDIF_8CH>;
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1245  		dmas = <&dmac1 1>;
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1246  		dma-names = "tx";
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1247  		pinctrl-names = "default";
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1248  		pinctrl-0 = <&spdifm0_tx>;
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1249  		#sound-dai-cells = <0>;
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1250  		status = "disabled";
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1251  	};
d4eade428d22f2a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Heiko Stuebner       2022-10-30  1252  
2ddd96aadbd0412 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-01-23  1253  	dmac0: dma-controller@fe530000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1254  		compatible = "arm,pl330", "arm,primecell";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1255  		reg = <0x0 0xfe530000 0x0 0x4000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1256  		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1257  			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1258  		arm,pl330-periph-burst;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1259  		clocks = <&cru ACLK_BUS>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1260  		clock-names = "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1261  		#dma-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1262  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1263  
2ddd96aadbd0412 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Frank Wunderlich     2022-01-23  1264  	dmac1: dma-controller@fe550000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1265  		compatible = "arm,pl330", "arm,primecell";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1266  		reg = <0x0 0xfe550000 0x0 0x4000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1267  		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1268  			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1269  		arm,pl330-periph-burst;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1270  		clocks = <&cru ACLK_BUS>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1271  		clock-names = "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1272  		#dma-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1273  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1274  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1275  	i2c1: i2c@fe5a0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1276  		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1277  		reg = <0x0 0xfe5a0000 0x0 0x1000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1278  		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1279  		clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1280  		clock-names = "i2c", "pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1281  		pinctrl-0 = <&i2c1_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1282  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1283  		#address-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1284  		#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1285  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1286  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1287  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1288  	i2c2: i2c@fe5b0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1289  		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1290  		reg = <0x0 0xfe5b0000 0x0 0x1000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1291  		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1292  		clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1293  		clock-names = "i2c", "pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1294  		pinctrl-0 = <&i2c2m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1295  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1296  		#address-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1297  		#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1298  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1299  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1300  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1301  	i2c3: i2c@fe5c0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1302  		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1303  		reg = <0x0 0xfe5c0000 0x0 0x1000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1304  		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1305  		clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1306  		clock-names = "i2c", "pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1307  		pinctrl-0 = <&i2c3m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1308  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1309  		#address-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1310  		#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1311  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1312  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1313  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1314  	i2c4: i2c@fe5d0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1315  		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1316  		reg = <0x0 0xfe5d0000 0x0 0x1000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1317  		interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1318  		clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1319  		clock-names = "i2c", "pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1320  		pinctrl-0 = <&i2c4m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1321  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1322  		#address-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1323  		#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1324  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1325  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1326  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1327  	i2c5: i2c@fe5e0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1328  		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1329  		reg = <0x0 0xfe5e0000 0x0 0x1000>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1330  		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1331  		clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1332  		clock-names = "i2c", "pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1333  		pinctrl-0 = <&i2c5m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1334  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1335  		#address-cells = <1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1336  		#size-cells = <0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1337  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1338  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1339  
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1340  	wdt: watchdog@fe600000 {
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1341  		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1342  		reg = <0x0 0xfe600000 0x0 0x100>;
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1343  		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1344  		clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1345  		clock-names = "tclk", "pclk";
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1346  	};
0edcfec3fafa1fe arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-06-22  1347  
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1348  	spi0: spi@fe610000 {
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1349  		compatible = "rockchip,rk3568-spi", "rockchip,rk3066-spi";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1350  		reg = <0x0 0xfe610000 0x0 0x1000>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1351  		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1352  		clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1353  		clock-names = "spiclk", "apb_pclk";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1354  		dmas = <&dmac0 20>, <&dmac0 21>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1355  		dma-names = "tx", "rx";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1356  		pinctrl-names = "default";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1357  		pinctrl-0 = <&spi0m0_cs0 &spi0m0_cs1 &spi0m0_pins>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1358  		#address-cells = <1>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1359  		#size-cells = <0>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1360  		status = "disabled";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1361  	};
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1362  
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1363  	spi1: spi@fe620000 {
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1364  		compatible = "rockchip,rk3568-spi", "rockchip,rk3066-spi";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1365  		reg = <0x0 0xfe620000 0x0 0x1000>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1366  		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1367  		clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1368  		clock-names = "spiclk", "apb_pclk";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1369  		dmas = <&dmac0 22>, <&dmac0 23>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1370  		dma-names = "tx", "rx";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1371  		pinctrl-names = "default";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1372  		pinctrl-0 = <&spi1m0_cs0 &spi1m0_cs1 &spi1m0_pins>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1373  		#address-cells = <1>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1374  		#size-cells = <0>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1375  		status = "disabled";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1376  	};
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1377  
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1378  	spi2: spi@fe630000 {
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1379  		compatible = "rockchip,rk3568-spi", "rockchip,rk3066-spi";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1380  		reg = <0x0 0xfe630000 0x0 0x1000>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1381  		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1382  		clocks = <&cru CLK_SPI2>, <&cru PCLK_SPI2>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1383  		clock-names = "spiclk", "apb_pclk";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1384  		dmas = <&dmac0 24>, <&dmac0 25>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1385  		dma-names = "tx", "rx";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1386  		pinctrl-names = "default";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1387  		pinctrl-0 = <&spi2m0_cs0 &spi2m0_cs1 &spi2m0_pins>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1388  		#address-cells = <1>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1389  		#size-cells = <0>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1390  		status = "disabled";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1391  	};
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1392  
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1393  	spi3: spi@fe640000 {
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1394  		compatible = "rockchip,rk3568-spi", "rockchip,rk3066-spi";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1395  		reg = <0x0 0xfe640000 0x0 0x1000>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1396  		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1397  		clocks = <&cru CLK_SPI3>, <&cru PCLK_SPI3>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1398  		clock-names = "spiclk", "apb_pclk";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1399  		dmas = <&dmac0 26>, <&dmac0 27>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1400  		dma-names = "tx", "rx";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1401  		pinctrl-names = "default";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1402  		pinctrl-0 = <&spi3m0_cs0 &spi3m0_cs1 &spi3m0_pins>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1403  		#address-cells = <1>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1404  		#size-cells = <0>;
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1405  		status = "disabled";
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1406  	};
aaa552d84580e92 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Nicolas Frattaroli   2021-11-27  1407  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1408  	uart1: serial@fe650000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1409  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1410  		reg = <0x0 0xfe650000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1411  		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1412  		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1413  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1414  		dmas = <&dmac0 2>, <&dmac0 3>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1415  		pinctrl-0 = <&uart1m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1416  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1417  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1418  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1419  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1420  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1421  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1422  	uart2: serial@fe660000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1423  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1424  		reg = <0x0 0xfe660000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1425  		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1426  		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1427  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1428  		dmas = <&dmac0 4>, <&dmac0 5>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1429  		pinctrl-0 = <&uart2m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1430  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1431  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1432  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1433  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1434  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1435  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1436  	uart3: serial@fe670000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1437  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1438  		reg = <0x0 0xfe670000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1439  		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1440  		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1441  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1442  		dmas = <&dmac0 6>, <&dmac0 7>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1443  		pinctrl-0 = <&uart3m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1444  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1445  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1446  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1447  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1448  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1449  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1450  	uart4: serial@fe680000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1451  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1452  		reg = <0x0 0xfe680000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1453  		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1454  		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1455  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1456  		dmas = <&dmac0 8>, <&dmac0 9>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1457  		pinctrl-0 = <&uart4m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1458  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1459  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1460  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1461  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1462  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1463  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1464  	uart5: serial@fe690000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1465  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1466  		reg = <0x0 0xfe690000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1467  		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1468  		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1469  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1470  		dmas = <&dmac0 10>, <&dmac0 11>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1471  		pinctrl-0 = <&uart5m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1472  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1473  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1474  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1475  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1476  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1477  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1478  	uart6: serial@fe6a0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1479  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1480  		reg = <0x0 0xfe6a0000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1481  		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1482  		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1483  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1484  		dmas = <&dmac0 12>, <&dmac0 13>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1485  		pinctrl-0 = <&uart6m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1486  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1487  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1488  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1489  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1490  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1491  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1492  	uart7: serial@fe6b0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1493  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1494  		reg = <0x0 0xfe6b0000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1495  		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1496  		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1497  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1498  		dmas = <&dmac0 14>, <&dmac0 15>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1499  		pinctrl-0 = <&uart7m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1500  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1501  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1502  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1503  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1504  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1505  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1506  	uart8: serial@fe6c0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1507  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1508  		reg = <0x0 0xfe6c0000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1509  		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1510  		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1511  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1512  		dmas = <&dmac0 16>, <&dmac0 17>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1513  		pinctrl-0 = <&uart8m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1514  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1515  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1516  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1517  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1518  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1519  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1520  	uart9: serial@fe6d0000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1521  		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1522  		reg = <0x0 0xfe6d0000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1523  		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1524  		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1525  		clock-names = "baudclk", "apb_pclk";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1526  		dmas = <&dmac0 18>, <&dmac0 19>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1527  		pinctrl-0 = <&uart9m0_xfer>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1528  		pinctrl-names = "default";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1529  		reg-io-width = <4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1530  		reg-shift = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1531  		status = "disabled";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1532  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1533  
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1534  	thermal_zones: thermal-zones {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1535  		cpu_thermal: cpu-thermal {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1536  			polling-delay-passive = <100>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1537  			polling-delay = <1000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1538  
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1539  			thermal-sensors = <&tsadc 0>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1540  
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1541  			trips {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1542  				cpu_alert0: cpu_alert0 {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1543  					temperature = <70000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1544  					hysteresis = <2000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1545  					type = "passive";
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1546  				};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1547  				cpu_alert1: cpu_alert1 {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1548  					temperature = <75000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1549  					hysteresis = <2000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1550  					type = "passive";
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1551  				};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1552  				cpu_crit: cpu_crit {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1553  					temperature = <95000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1554  					hysteresis = <2000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1555  					type = "critical";
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1556  				};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1557  			};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1558  
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1559  			cooling-maps {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1560  				map0 {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1561  					trip = <&cpu_alert0>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1562  					cooling-device =
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1563  						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1564  						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1565  						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1566  						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1567  				};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1568  			};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1569  		};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1570  
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1571  		gpu_thermal: gpu-thermal {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1572  			polling-delay-passive = <20>; /* milliseconds */
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1573  			polling-delay = <1000>; /* milliseconds */
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1574  
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1575  			thermal-sensors = <&tsadc 1>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1576  
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1577  			trips {
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1578  				gpu_threshold: gpu-threshold {
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1579  					temperature = <70000>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1580  					hysteresis = <2000>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1581  					type = "passive";
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1582  				};
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1583  				gpu_target: gpu-target {
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1584  					temperature = <75000>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1585  					hysteresis = <2000>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1586  					type = "passive";
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1587  				};
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1588  				gpu_crit: gpu-crit {
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1589  					temperature = <95000>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1590  					hysteresis = <2000>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1591  					type = "critical";
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1592  				};
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1593  			};
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1594  
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1595  			cooling-maps {
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1596  				map0 {
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1597  					trip = <&gpu_target>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1598  					cooling-device =
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1599  						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1600  				};
c0a7259fad2df72 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alex Bee             2022-02-09  1601  			};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1602  		};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1603  	};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1604  
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1605  	tsadc: tsadc@fe710000 {
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1606  		compatible = "rockchip,rk3568-tsadc";
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1607  		reg = <0x0 0xfe710000 0x0 0x100>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1608  		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1609  		assigned-clocks = <&cru CLK_TSADC_TSEN>, <&cru CLK_TSADC>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1610  		assigned-clock-rates = <17000000>, <700000>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1611  		clocks = <&cru CLK_TSADC>, <&cru PCLK_TSADC>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1612  		clock-names = "tsadc", "apb_pclk";
5c9e66c6b75a754 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Johan Jonker         2021-09-30  1613  		resets = <&cru SRST_P_TSADC>, <&cru SRST_TSADC>,
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1614  			 <&cru SRST_TSADCPHY>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1615  		rockchip,grf = <&grf>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1616  		rockchip,hw-tshut-temp = <95000>;
1c9034eb025330f arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alexander Shiyan     2024-07-09  1617  		pinctrl-names = "default", "sleep";
1c9034eb025330f arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alexander Shiyan     2024-07-09  1618  		pinctrl-0 = <&tsadc_shutorg>;
1c9034eb025330f arch/arm64/boot/dts/rockchip/rk356x.dtsi      Alexander Shiyan     2024-07-09  1619  		pinctrl-1 = <&tsadc_pin>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1620  		#thermal-sensor-cells = <1>;
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1621  		status = "disabled";
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1622  	};
1330875dc2a3742 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1623  
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1624  	saradc: saradc@fe720000 {
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1625  		compatible = "rockchip,rk3568-saradc", "rockchip,rk3399-saradc";
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1626  		reg = <0x0 0xfe720000 0x0 0x100>;
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1627  		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1628  		clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1629  		clock-names = "saradc", "apb_pclk";
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1630  		resets = <&cru SRST_P_SARADC>;
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1631  		reset-names = "saradc-apb";
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1632  		#io-channel-cells = <1>;
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1633  		status = "disabled";
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1634  	};
2076121eecc18fa arch/arm64/boot/dts/rockchip/rk3568.dtsi      Simon Xue            2021-07-05  1635  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1636  	pwm4: pwm@fe6e0000 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1637  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1638  		reg = <0x0 0xfe6e0000 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1639  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1640  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1641  		pinctrl-0 = <&pwm4_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1642  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1643  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1644  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1645  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1646  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1647  	pwm5: pwm@fe6e0010 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1648  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1649  		reg = <0x0 0xfe6e0010 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1650  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1651  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1652  		pinctrl-0 = <&pwm5_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1653  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1654  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1655  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1656  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1657  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1658  	pwm6: pwm@fe6e0020 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1659  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1660  		reg = <0x0 0xfe6e0020 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1661  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1662  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1663  		pinctrl-0 = <&pwm6_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1664  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1665  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1666  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1667  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1668  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1669  	pwm7: pwm@fe6e0030 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1670  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1671  		reg = <0x0 0xfe6e0030 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1672  		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1673  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1674  		pinctrl-0 = <&pwm7_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1675  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1676  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1677  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1678  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1679  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1680  	pwm8: pwm@fe6f0000 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1681  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1682  		reg = <0x0 0xfe6f0000 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1683  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1684  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1685  		pinctrl-0 = <&pwm8m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1686  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1687  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1688  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1689  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1690  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1691  	pwm9: pwm@fe6f0010 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1692  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1693  		reg = <0x0 0xfe6f0010 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1694  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1695  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1696  		pinctrl-0 = <&pwm9m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1697  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1698  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1699  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1700  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1701  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1702  	pwm10: pwm@fe6f0020 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1703  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1704  		reg = <0x0 0xfe6f0020 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1705  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1706  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1707  		pinctrl-0 = <&pwm10m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1708  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1709  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1710  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1711  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1712  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1713  	pwm11: pwm@fe6f0030 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1714  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1715  		reg = <0x0 0xfe6f0030 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1716  		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1717  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1718  		pinctrl-0 = <&pwm11m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1719  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1720  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1721  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1722  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1723  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1724  	pwm12: pwm@fe700000 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1725  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1726  		reg = <0x0 0xfe700000 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1727  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1728  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1729  		pinctrl-0 = <&pwm12m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1730  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1731  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1732  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1733  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1734  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1735  	pwm13: pwm@fe700010 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1736  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1737  		reg = <0x0 0xfe700010 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1738  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1739  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1740  		pinctrl-0 = <&pwm13m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1741  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1742  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1743  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1744  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1745  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1746  	pwm14: pwm@fe700020 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1747  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1748  		reg = <0x0 0xfe700020 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1749  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1750  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1751  		pinctrl-0 = <&pwm14m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1752  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1753  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1754  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1755  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1756  
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1757  	pwm15: pwm@fe700030 {
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1758  		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1759  		reg = <0x0 0xfe700030 0x0 0x10>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1760  		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1761  		clock-names = "pwm", "pclk";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1762  		pinctrl-0 = <&pwm15m0_pins>;
2e4dbcf7177e5dd arch/arm64/boot/dts/rockchip/rk356x.dtsi      Sascha Hauer         2021-12-08  1763  		pinctrl-names = "default";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1764  		#pwm-cells = <3>;
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1765  		status = "disabled";
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1766  	};
98419a39d1dc276 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Liang Chen           2021-07-26  1767  
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1768  	combphy1: phy@fe830000 {
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1769  		compatible = "rockchip,rk3568-naneng-combphy";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1770  		reg = <0x0 0xfe830000 0x0 0x100>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1771  		clocks = <&pmucru CLK_PCIEPHY1_REF>,
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1772  			 <&cru PCLK_PIPEPHY1>,
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1773  			 <&cru PCLK_PIPE>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1774  		clock-names = "ref", "apb", "pipe";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1775  		assigned-clocks = <&pmucru CLK_PCIEPHY1_REF>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1776  		assigned-clock-rates = <100000000>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1777  		resets = <&cru SRST_PIPEPHY1>;
8b9c12757f91915 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2024-11-22  1778  		reset-names = "phy";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1779  		rockchip,pipe-grf = <&pipegrf>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1780  		rockchip,pipe-phy-grf = <&pipe_phy_grf1>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1781  		#phy-cells = <1>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1782  		status = "disabled";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1783  	};
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1784  
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1785  	combphy2: phy@fe840000 {
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1786  		compatible = "rockchip,rk3568-naneng-combphy";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1787  		reg = <0x0 0xfe840000 0x0 0x100>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1788  		clocks = <&pmucru CLK_PCIEPHY2_REF>,
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1789  			 <&cru PCLK_PIPEPHY2>,
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1790  			 <&cru PCLK_PIPE>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1791  		clock-names = "ref", "apb", "pipe";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1792  		assigned-clocks = <&pmucru CLK_PCIEPHY2_REF>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1793  		assigned-clock-rates = <100000000>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1794  		resets = <&cru SRST_PIPEPHY2>;
8b9c12757f91915 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi Chukun Pan           2024-11-22  1795  		reset-names = "phy";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1796  		rockchip,pipe-grf = <&pipegrf>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1797  		rockchip,pipe-phy-grf = <&pipe_phy_grf2>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1798  		#phy-cells = <1>;
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1799  		status = "disabled";
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1800  	};
3cc8cd2d25954ed arch/arm64/boot/dts/rockchip/rk356x.dtsi      Yifeng Zhao          2022-02-08  1801  
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1802  	csi_dphy: phy@fe870000 {
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1803  		compatible = "rockchip,rk3568-csi-dphy";
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1804  		reg = <0x0 0xfe870000 0x0 0x10000>;
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1805  		clocks = <&cru PCLK_MIPICSIPHY>;
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1806  		clock-names = "pclk";
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1807  		#phy-cells = <0>;
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1808  		resets = <&cru SRST_P_MIPICSIPHY>;
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1809  		reset-names = "apb";
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1810  		rockchip,grf = <&grf>;
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1811  		status = "disabled";
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1812  	};
b6c228401b2565b arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-07-20  1813  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1814  	dsi_dphy0: mipi-dphy@fe850000 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1815  		compatible = "rockchip,rk3568-dsi-dphy";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1816  		reg = <0x0 0xfe850000 0x0 0x10000>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1817  		clock-names = "ref", "pclk";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1818  		clocks = <&pmucru CLK_MIPIDSIPHY0_REF>, <&cru PCLK_MIPIDSIPHY0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1819  		#phy-cells = <0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1820  		power-domains = <&power RK3568_PD_VO>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1821  		reset-names = "apb";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1822  		resets = <&cru SRST_P_MIPIDSIPHY0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1823  		status = "disabled";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1824  	};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1825  
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1826  	dsi_dphy1: mipi-dphy@fe860000 {
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1827  		compatible = "rockchip,rk3568-dsi-dphy";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1828  		reg = <0x0 0xfe860000 0x0 0x10000>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1829  		clock-names = "ref", "pclk";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1830  		clocks = <&pmucru CLK_MIPIDSIPHY1_REF>, <&cru PCLK_MIPIDSIPHY1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1831  		#phy-cells = <0>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1832  		power-domains = <&power RK3568_PD_VO>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1833  		reset-names = "apb";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1834  		resets = <&cru SRST_P_MIPIDSIPHY1>;
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1835  		status = "disabled";
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1836  	};
e18d9b093006d8a arch/arm64/boot/dts/rockchip/rk356x.dtsi      Chris Morgan         2022-09-19  1837  
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27  1838  	usb2phy0: usb2phy@fe8a0000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1839  		compatible = "rockchip,rk3568-usb2phy";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1840  		reg = <0x0 0xfe8a0000 0x0 0x10000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1841  		clocks = <&pmucru CLK_USBPHY0_REF>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1842  		clock-names = "phyclk";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1843  		clock-output-names = "clk_usbphy0_480m";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1844  		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1845  		rockchip,usbgrf = <&usb2phy0_grf>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1846  		#clock-cells = <0>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1847  		status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1848  
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27  1849  		usb2phy0_host: host-port {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1850  			#phy-cells = <0>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1851  			status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1852  		};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1853  
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27  1854  		usb2phy0_otg: otg-port {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1855  			#phy-cells = <0>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1856  			status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1857  		};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1858  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1859  
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27  1860  	usb2phy1: usb2phy@fe8b0000 {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1861  		compatible = "rockchip,rk3568-usb2phy";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1862  		reg = <0x0 0xfe8b0000 0x0 0x10000>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1863  		clocks = <&pmucru CLK_USBPHY1_REF>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1864  		clock-names = "phyclk";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1865  		clock-output-names = "clk_usbphy1_480m";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1866  		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1867  		rockchip,usbgrf = <&usb2phy1_grf>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1868  		#clock-cells = <0>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1869  		status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1870  
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27  1871  		usb2phy1_host: host-port {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1872  			#phy-cells = <0>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1873  			status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1874  		};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1875  
78f7186095db5a6 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Michael Riesch       2022-01-27  1876  		usb2phy1_otg: otg-port {
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1877  			#phy-cells = <0>;
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1878  			status = "disabled";
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1879  		};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1880  	};
91c4c3e06a256c9 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-12-15  1881  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1882  	pinctrl: pinctrl {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1883  		compatible = "rockchip,rk3568-pinctrl";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1884  		rockchip,grf = <&grf>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1885  		rockchip,pmu = <&pmugrf>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1886  		#address-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1887  		#size-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1888  		ranges;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1889  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1890  		gpio0: gpio@fdd60000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1891  			compatible = "rockchip,gpio-bank";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1892  			reg = <0x0 0xfdd60000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1893  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
3d9170c3ea221f4 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1894  			clocks = <&pmucru PCLK_GPIO0>, <&pmucru DBCLK_GPIO0>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1895  			gpio-controller;
6f5ab8fa33238fd arch/arm64/boot/dts/rockchip/rk356x.dtsi      John Clark           2023-04-13  1896  			gpio-ranges = <&pinctrl 0 0 32>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1897  			#gpio-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1898  			interrupt-controller;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1899  			#interrupt-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1900  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1901  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1902  		gpio1: gpio@fe740000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1903  			compatible = "rockchip,gpio-bank";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1904  			reg = <0x0 0xfe740000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1905  			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
3d9170c3ea221f4 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1906  			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1907  			gpio-controller;
6f5ab8fa33238fd arch/arm64/boot/dts/rockchip/rk356x.dtsi      John Clark           2023-04-13  1908  			gpio-ranges = <&pinctrl 0 32 32>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1909  			#gpio-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1910  			interrupt-controller;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1911  			#interrupt-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1912  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1913  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1914  		gpio2: gpio@fe750000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1915  			compatible = "rockchip,gpio-bank";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1916  			reg = <0x0 0xfe750000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1917  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
3d9170c3ea221f4 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1918  			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1919  			gpio-controller;
6f5ab8fa33238fd arch/arm64/boot/dts/rockchip/rk356x.dtsi      John Clark           2023-04-13  1920  			gpio-ranges = <&pinctrl 0 64 32>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1921  			#gpio-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1922  			interrupt-controller;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1923  			#interrupt-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1924  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1925  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1926  		gpio3: gpio@fe760000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1927  			compatible = "rockchip,gpio-bank";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1928  			reg = <0x0 0xfe760000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1929  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
3d9170c3ea221f4 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1930  			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1931  			gpio-controller;
6f5ab8fa33238fd arch/arm64/boot/dts/rockchip/rk356x.dtsi      John Clark           2023-04-13  1932  			gpio-ranges = <&pinctrl 0 96 32>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1933  			#gpio-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1934  			interrupt-controller;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1935  			#interrupt-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1936  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1937  
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1938  		gpio4: gpio@fe770000 {
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1939  			compatible = "rockchip,gpio-bank";
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1940  			reg = <0x0 0xfe770000 0x0 0x100>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1941  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
3d9170c3ea221f4 arch/arm64/boot/dts/rockchip/rk356x.dtsi      Peter Geis           2021-07-28  1942  			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1943  			gpio-controller;
6f5ab8fa33238fd arch/arm64/boot/dts/rockchip/rk356x.dtsi      John Clark           2023-04-13  1944  			gpio-ranges = <&pinctrl 0 128 32>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1945  			#gpio-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1946  			interrupt-controller;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1947  			#interrupt-cells = <2>;
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1948  		};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1949  	};
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1950  };
a3adc0b9071d880 arch/arm64/boot/dts/rockchip/rk3568.dtsi      Liang Chen           2021-06-22  1951  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
