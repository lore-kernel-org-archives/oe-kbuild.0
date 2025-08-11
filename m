Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150872550DD
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754914200; cv=none; b=I4/YrQis4BZ/rKTGXfs0eyINook6zaP0qsEAsq75ZvUklmRIVd6UvF1FLag2rK97UDdF5CiVdQaxgzY1j5//aEbmVCWFmUVS54MCGXF/eoBTmr4OFRVu+Cpu6IwQwmFDkZEs7mNuwVo1dvTWDN2b91iVWk++rZwswv+i2jFA8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754914200; c=relaxed/simple;
	bh=qfuSbZCrcvbTJhClVzDYa52bCYepJpFJQIfmw+kOssU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VIpto3AROQ9uxfiCqS2vPEVM40CBQjq9QA//RwXYPnzQKCspI3L33eN0LZu5IqLDfLMku7rx2AXWEJe/dvouDUOcJ+5p+PMjLmddiEh7aLUNm4uXHxGmuBebaLQNRsm7WX8tTleq2wfEeCw78UMxmlYXP8rHcN9DNlzuAUB39ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nea5E/su; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nea5E/su"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754914193; x=1786450193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfuSbZCrcvbTJhClVzDYa52bCYepJpFJQIfmw+kOssU=;
  b=Nea5E/sucfNzXaxlOfCN3se3KJiARVT2P0j9jlsjuE8j0UXGYOokZTVi
   QbDcezHwhWOdMtLoT9zr5299uj8jN+5nVfrbsEmjq8GuSmyzV46O3qSFQ
   okGmw1gJhJaA0YpGLeGNGNZJOJVutkog3SFmopGL7E6kRH0QRi2jjyEBA
   MVxv6HzGr2KS2DVhJNpVASUUSmTZtKD6iAVA6Y2RcEWpAEvVazwkDBMjn
   G8U1m8jQGl9ZZUFxGrMeJrLZH9FYanzn5XimI0FYncQ6dwCXU+ndnTcwW
   7ZePQ7HD+hgFYIzg3Uq8ZHDGTmqy07worBE0JPeijK++hrtZLr+bM338G
   g==;
X-CSE-ConnectionGUID: r+p/5f0tRyaP7YpyZtEc2g==
X-CSE-MsgGUID: nTSdAFQzRPanEhL2qc2ung==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="61009220"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="61009220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 05:09:53 -0700
X-CSE-ConnectionGUID: o1V8ZM2CSIiiurOOI2PwHA==
X-CSE-MsgGUID: XDfjNZK2THuY8G7QJLkh8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196896556"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 05:09:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulRLY-0005ps-0X;
	Mon, 11 Aug 2025 12:09:48 +0000
Date: Mon, 11 Aug 2025 20:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/9]
 arch/arm/boot/dts/microchip/sama5d3.dtsi:257.10-260.7: Warning
 (avoid_unnecessary_addr_size): /ahb/apb/isi@f0034000/port: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508111950.tUEL5vPC-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   18adc1b2661a506b233aa53c4fbe2243c7f4db20
commit: 2a52e4d89847745f8ab76265199a371ef5e7f93f [2/9] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm-randconfig-004-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111950.tUEL5vPC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111950.tUEL5vPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508111950.tUEL5vPC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/sama5d3.dtsi:257.10-260.7: Warning (avoid_unnecessary_addr_size): /ahb/apb/isi@f0034000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/microchip/sama5d3.dtsi:257.10-260.7: Warning (graph_child_address): /ahb/apb/isi@f0034000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
--
>> arch/arm/boot/dts/microchip/sama5d3.dtsi:257.10-260.7: Warning (avoid_unnecessary_addr_size): /ahb/apb/isi@f0034000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi:248.12-263.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/microchip/sama5d3.dtsi:257.10-260.7: Warning (graph_child_address): /ahb/apb/isi@f0034000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
--
   arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts:145.10-153.5: Warning (unit_address_vs_reg): /panel/port@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/microchip/sama5d4.dtsi:794.30-1445.6: Warning (simple_bus_reg): /ahb/apb/pinctrl@fc06a000: simple-bus unit address format error, expected "fc068000"
>> arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts:137.15-154.4: Warning (avoid_unnecessary_addr_size): /panel: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/microchip/sama5d4.dtsi:196.30-206.7: Warning (graph_child_address): /ahb/apb/hlcdc@f0000000/hlcdc-display-controller: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/microchip/sama5d4.dtsi:201.13-205.8: Warning (graph_child_address): /ahb/apb/hlcdc@f0000000/hlcdc-display-controller/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts:145.10-153.5: Warning (graph_child_address): /panel/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:41.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:42.9-46.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:130.9-155.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:41.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb.dts:51.39-58.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:41.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:43.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:310.24-326.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:301.46-308.5: Warning (simple_bus_reg): /soc/interrupt-controller@10120000: simple-bus unit address format error, expected "10121000"
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:310.24-326.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "10110000"
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:328.7-332.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:530.48-539.5: Warning (simple_bus_reg): /fpga/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
>> arch/arm/boot/dts/arm/arm-realview-pb1176.dts:140.9-165.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:42.9-49.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:663.46-672.5: Warning (simple_bus_reg): /soc/interrupt-controller@1e000000: simple-bus unit address format error, expected "1e001000"
>> arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:213.9-238.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "10102000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:86.21-89.5: Warning (simple_bus_reg): /soc/scu@1f000000: simple-bus unit address format error, expected "10100000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:91.29-96.5: Warning (simple_bus_reg): /soc/timer@1f000600: simple-bus unit address format error, expected "10100600"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:98.31-103.5: Warning (simple_bus_reg): /soc/watchdog@1f000620: simple-bus unit address format error, expected "10100620"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.12-113.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:42.9-46.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dts:63.23-79.4: Warning (unit_address_vs_reg): /cache-controller: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:130.9-155.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dts:81.20-84.4: Warning (unique_unit_address_if_enabled): /scu@1f000000: duplicate unit-address (also used in node /interrupt-controller@1f000000)
--
>> arch/arm/boot/dts/rockchip/rk3188.dtsi:125.18-128.5: Warning (avoid_unnecessary_addr_size): /vop@1010c000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/rockchip/rk3188.dtsi:125.18-128.5: Warning (graph_child_address): /vop@1010c000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:181.28-184.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi:87.12-104.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:242.46-252.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2x2-8@1f0: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2-8@1f0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1344.58-1354.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2ldo-8@210: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2-8@210)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1435.42-1445.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2-8@150: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2x2-8@150)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1680.53-1689.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-gpu-core-gclk-mux-24@1220: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-gpu-hyd-gclk-mux-26@1220)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:161.44-162.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:181.28-184.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:242.46-252.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2x2-8@1f0: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2-8@1f0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1344.58-1354.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2ldo-8@210: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2-8@210)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1435.42-1445.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2-8@150: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2x2-8@150)
--
   arch/arm/boot/dts/ti/omap/omap4-l4.dtsi:1220.30-1231.6: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a300000/segment@10000/target-module@e000/pinmux@40: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/omap4-l4.dtsi:670.30-681.6: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@100000/target-module@0/pinmux@40: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/omap4-var-om44customboard.dtsi:30.12-43.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:546.61-553.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/abe_dpll_bypass_clk_mux_ck@108: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/l4_wkup_clk_mux_ck@108)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:589.24-597.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_ck@1858: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_fclk@1858)
   arch/arm/boot/dts/ti/omap/omap446x-clocks.dtsi:8.28-16.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/div_ts_ck@1888: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/bandgap_ts_fclk@1888)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:886.47-893.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_gate_ck@310: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_mux_ck@310)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:886.47-893.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_gate_ck@310: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_ck@310)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:895.45-902.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_mux_ck@310: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_ck@310)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:921.47-928.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_gate_ck@314: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_mux_ck@314)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:921.47-928.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_gate_ck@314: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_ck@314)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:930.45-937.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_mux_ck@314: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_ck@314)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:956.47-963.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_gate_ck@318: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_mux_ck@318)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi:111.21-122.4: Warning (unique_unit_address_if_enabled): /connector@0: duplicate unit-address (also used in node /encoder@0)
   arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi:111.21-122.4: Warning (unique_unit_address_if_enabled): /connector@0: duplicate unit-address (also used in node /memory@0)
   arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi:124.23-151.4: Warning (unique_unit_address_if_enabled): /encoder@0: duplicate unit-address (also used in node /memory@0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:242.46-252.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2x2-8@1f0: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2-8@1f0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1344.58-1354.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2ldo-8@210: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2-8@210)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1435.42-1445.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2-8@150: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2x2-8@150)
--
   arch/arm/boot/dts/ti/omap/omap4-l4.dtsi:134.36-135.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm2@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/omap4-l4.dtsi:1220.30-1231.6: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a300000/segment@10000/target-module@e000/pinmux@40: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/omap4-l4.dtsi:670.30-681.6: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@100000/target-module@0/pinmux@40: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dts:28.12-40.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:546.61-553.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/abe_dpll_bypass_clk_mux_ck@108: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/l4_wkup_clk_mux_ck@108)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:589.24-597.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_ck@1858: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@6000/prm@0/clocks/usim_fclk@1858)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:886.47-893.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_gate_ck@310: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_mux_ck@310)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:886.47-893.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_gate_ck@310: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_ck@310)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:895.45-902.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_src_mux_ck@310: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk0_ck@310)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:921.47-928.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_gate_ck@314: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_mux_ck@314)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:921.47-928.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_gate_ck@314: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_ck@314)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:930.45-937.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_src_mux_ck@314: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk1_ck@314)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:956.47-963.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_gate_ck@318: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_mux_ck@318)
   arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi:956.47-963.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_src_gate_ck@318: duplicate unit-address (also used in node /ocp/interconnect@4a300000/segment@0/target-module@a000/scrm@0/clocks/auxclk2_ck@318)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi:111.21-122.4: Warning (unique_unit_address_if_enabled): /connector@0: duplicate unit-address (also used in node /encoder@0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:242.46-252.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2x2-8@1f0: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2-8@1f0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1344.58-1354.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2ldo-8@210: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2-8@210)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:181.28-184.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:242.46-252.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2x2-8@1f0: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2-8@1f0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1344.58-1354.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2ldo-8@210: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2-8@210)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1435.42-1445.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2-8@150: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2x2-8@150)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:161.44-162.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:181.28-184.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi:87.12-104.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:242.46-252.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2x2-8@1f0: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2-8@1f0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1344.58-1354.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2ldo-8@210: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2-8@210)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1435.42-1445.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2-8@150: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2x2-8@150)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1680.53-1689.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-gpu-core-gclk-mux-24@1220: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-gpu-hyd-gclk-mux-26@1220)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:161.44-162.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:181.28-184.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts:31.11-34.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /connector@0)
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts:31.11-34.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /encoder@0)
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts:143.25-153.4: Warning (unique_unit_address_if_enabled): /connector@0: duplicate unit-address (also used in node /encoder@0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
--
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:186.40-187.7: Warning (simple_bus_reg): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4288.24-4291.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:4293.36-4294.7: Warning (simple_bus_reg): /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/dra7-l4.dtsi:96.32-107.7: Warning (avoid_unnecessary_addr_size): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/pinmux@1400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/ti/omap/dra7.dtsi:364.39-370.5: Warning (avoid_unnecessary_addr_size): /ocp/padconf@4844a000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi:111.21-122.4: Warning (unique_unit_address_if_enabled): /connector@0: duplicate unit-address (also used in node /encoder@0)
   arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi:111.21-122.4: Warning (unique_unit_address_if_enabled): /connector@0: duplicate unit-address (also used in node /memory@0)
   arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi:124.23-151.4: Warning (unique_unit_address_if_enabled): /encoder@0: duplicate unit-address (also used in node /memory@0)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1749.43-1756.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1758.50-1765.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi:1767.44-1774.4: Warning (unique_unit_address_if_enabled): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
--
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:302.35-310.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer2@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:312.35-320.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer3@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:322.33-330.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clktimer15@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:332.29-340.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:342.29-350.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart1@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:352.29-360.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkaemif@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:362.27-370.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkusim@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:372.25-380.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clki2c@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:382.25-390.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkspi@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:392.27-400.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkgpio@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkkeymgr@2350000)
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi:157.4-160.30: Warning (interrupt_map): /soc@0/pcie@21020000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21020000/legacy-interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:312.35-320.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer3@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:322.33-330.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clktimer15@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:332.29-340.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:342.29-350.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart1@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:352.29-360.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkaemif@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:362.27-370.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkusim@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:372.25-380.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clki2c@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:382.25-390.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkspi@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:392.27-400.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkgpio@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:402.31-410.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkkeymgr@2350000: duplicate unit-address (also used in node /soc@0/clocks/clktsip@2350000)
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/ti/keystone/keystone-k2l-netcp.dtsi:8.20-106.3: Warning (unit_address_vs_reg): /soc@0/qmss@2a40000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2l-netcp.dtsi:23.9-33.5: Warning (unit_address_vs_reg): /soc@0/qmss@2a40000/qmgrs/qmgr0: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/ti/keystone/keystone-k2l-netcp.dtsi:108.24-125.3: Warning (unit_address_vs_reg): /soc@0/knav_dmas@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:8.8-438.3: Warning (simple_bus_reg): /soc@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/keystone/keystone.dtsi:298.24-345.5: Warning (simple_bus_reg): /soc@0/pcie@21800000: simple-bus unit address format error, expected "21801000"
   arch/arm/boot/dts/ti/keystone/keystone-k2l-netcp.dtsi:8.20-106.3: Warning (simple_bus_reg): /soc@0/qmss@2a40000: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2l-netcp.dtsi:108.24-125.3: Warning (simple_bus_reg): /soc@0/knav_dmas@0: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2l-netcp.dtsi:127.23-226.3: Warning (simple_bus_reg): /soc@0/netcp@26000000: simple-bus unit address format error, expected "2620110"
>> arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi:108.27-256.5: Warning (avoid_unnecessary_addr_size): /soc@0/pinmux@2620690: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:160.33-168.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkmodrst0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer0@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:160.33-168.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkmodrst0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer1@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:282.35-290.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer1@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:160.33-168.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkmodrst0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer2@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:282.35-290.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer2@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:292.35-300.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer1@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer2@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:160.33-168.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkmodrst0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:282.35-290.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:292.35-300.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer1@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:302.35-310.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkwdtimer2@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkwdtimer3@2350000)
--
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:322.33-330.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clktimer15@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:332.29-340.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart0@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:342.29-350.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart1@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:352.29-360.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkaemif@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:362.27-370.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkusim@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:372.25-380.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clki2c@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:382.25-390.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkspi@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:392.27-400.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkgpio@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-clocks.dtsi:402.31-410.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkkeymgr@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
   arch/arm/boot/dts/ti/keystone/keystone-k2l-clocks.dtsi:244.29-252.4: Warning (unique_unit_address_if_enabled): /soc@0/clocks/clkuart2@2350000: duplicate unit-address (also used in node /soc@0/clocks/clkuart3@2350000)
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/ti/keystone/keystone.dtsi:317.4-320.30: Warning (interrupt_map): /soc@0/pcie@21800000:interrupt-map: Missing property '#address-cells' in node /soc@0/pcie@21800000/legacy-interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:641.24-664.5: Warning (unique_unit_address_if_enabled): /soc/usb@110f8800: duplicate unit-address (also used in node /soc/phy@110f8800)
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:128.9-131.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:128.9-131.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:128.9-131.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts:12.16-15.5: Warning (unit_address_vs_reg): /soc/pci@40000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts:12.16-15.5: Warning (simple_bus_reg): /soc/pci@40000000: missing or empty reg/ranges property
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
--
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:553.28-565.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9924000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1956.28-2009.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2029.28-2082.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1253.26-1256.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1268.26-1271.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1288.26-1291.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1298.26-1301.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1323.26-1326.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1348.26-1351.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1368.40-1371.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
--
>> arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1956.28-2009.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2029.28-2082.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1253.26-1256.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1268.26-1271.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1288.26-1291.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1298.26-1301.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1323.26-1326.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1348.26-1351.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1368.40-1371.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
--
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1129.21-1177.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1195.21-1249.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
--
>> arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2029.28-2082.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1253.26-1256.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1268.26-1271.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1288.26-1291.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1298.26-1301.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1323.26-1326.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1348.26-1351.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1368.40-1371.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1378.40-1381.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
--
>> arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1956.28-2009.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2029.28-2082.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1253.26-1256.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1268.26-1271.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1288.26-1291.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1298.26-1301.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1323.26-1326.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1348.26-1351.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1368.40-1371.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1195.21-1249.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1353.4-1356.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
--
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1079.4-1082.29: Warning (interrupt_map): /soc/pcie@1b500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1140.4-1143.29: Warning (interrupt_map): /soc/pcie@1b700000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:1201.4-1204.29: Warning (interrupt_map): /soc/pcie@1b900000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@2000000, using 0 as fallback
--
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:662.28-673.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1208.28-1259.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:828.27-831.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:863.27-866.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1195.11-1205.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:662.28-673.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1208.28-1259.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:828.27-831.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:863.27-866.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1195.11-1205.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1956.28-2009.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2029.28-2082.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1253.26-1256.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1268.26-1271.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1288.26-1291.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1298.26-1301.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1323.26-1326.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1348.26-1351.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1368.40-1371.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
--
   arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
--
   arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:128.9-131.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback
--
   arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   scripts/dtc/include-prefixes/arm64/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
>> arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:343.4-346.30: Warning (interrupt_map): /soc/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@17800000, using 0 as fallback
--
   arch/arm/boot/dts/axis/artpec6.dtsi:229.9-387.4: Warning (unit_address_vs_reg): /amba@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/axis/artpec6-devboard.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/axis/artpec6.dtsi:72.26-75.4: Warning (unique_unit_address_if_enabled): /syscon@f8000000: duplicate unit-address (also used in node /clkctrl@f8000000)
>> arch/arm/boot/dts/axis/artpec6.dtsi:181.3-184.29: Warning (interrupt_map): /pcie@f8050000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@faf01000, using 0 as fallback
>> arch/arm/boot/dts/axis/artpec6.dtsi:181.3-184.29: Warning (interrupt_map): /pcie@f8050000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@faf01000, using 0 as fallback
>> arch/arm/boot/dts/axis/artpec6.dtsi:181.3-184.29: Warning (interrupt_map): /pcie@f8050000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@faf01000, using 0 as fallback
>> arch/arm/boot/dts/axis/artpec6.dtsi:181.3-184.29: Warning (interrupt_map): /pcie@f8050000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@faf01000, using 0 as fallback
--
>> arch/arm/boot/dts/allwinner/sun8i-a33.dtsi:257.20-276.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1ca0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:267.19-283.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:267.19-283.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:140.24-148.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/serial@12100: duplicate unit-address (also used in node /soc/internal-regs/poweroff@12100)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/dove.dtsi:79.7-819.4: Warning (unit_address_vs_reg): /mbus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (unit_address_vs_reg): /mbus/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (unit_address_vs_reg): /mbus/internal-regs: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove-cubox.dts:10.9-13.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (simple_bus_reg): /mbus/pcie: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (simple_bus_reg): /mbus/internal-regs: simple-bus unit address format error, expected "f001000000000000"
   arch/arm/boot/dts/marvell/dove.dtsi:458.13-472.7: Warning (simple_bus_reg): /mbus/internal-regs/power-management@d0000/domains: missing or empty reg/ranges property
   arch/arm/boot/dts/marvell/dove.dtsi:251.27-254.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/mbus-ctrl@20000: duplicate unit-address (also used in node /mbus/internal-regs/system-ctrl@20000)
   arch/arm/boot/dts/marvell/dove.dtsi:277.23-283.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/timer@20300: duplicate unit-address (also used in node /mbus/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:267.19-283.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/mmp2.dtsi:505.22-514.5: Warning (unit_address_vs_reg): /soc/clocks: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/mmp2.dtsi:31.16-34.5: Warning (simple_bus_reg): /soc/l2-cache: missing or empty reg/ranges property
   arch/arm/boot/dts/marvell/mmp2.dtsi:62.44-70.6: Warning (simple_bus_reg): /soc/axi@d4200000/interrupt-controller@d4282150: simple-bus unit address format error, expected "150"
   arch/arm/boot/dts/marvell/mmp2.dtsi:72.44-81.6: Warning (simple_bus_reg): /soc/axi@d4200000/interrupt-controller@d4282154: simple-bus unit address format error, expected "154"
   arch/arm/boot/dts/marvell/mmp2.dtsi:83.44-91.6: Warning (simple_bus_reg): /soc/axi@d4200000/interrupt-controller@d4282180: simple-bus unit address format error, expected "180"
   arch/arm/boot/dts/marvell/mmp2.dtsi:93.45-101.6: Warning (simple_bus_reg): /soc/axi@d4200000/interrupt-controller@d4282158: simple-bus unit address format error, expected "158"
   arch/arm/boot/dts/marvell/mmp2.dtsi:103.45-111.6: Warning (simple_bus_reg): /soc/axi@d4200000/interrupt-controller@d428215c: simple-bus unit address format error, expected "15c"
   arch/arm/boot/dts/marvell/mmp2.dtsi:113.45-121.6: Warning (simple_bus_reg): /soc/axi@d4200000/interrupt-controller@d4282160: simple-bus unit address format error, expected "160"
   arch/arm/boot/dts/marvell/mmp2.dtsi:123.45-131.6: Warning (simple_bus_reg): /soc/axi@d4200000/interrupt-controller@d4282188: simple-bus unit address format error, expected "188"
   arch/arm/boot/dts/marvell/mmp2.dtsi:505.22-514.5: Warning (simple_bus_reg): /soc/clocks: simple-bus unit address format error, expected "d4050000"
>> arch/arm/boot/dts/marvell/mmp2.dtsi:475.23-483.6: Warning (avoid_unnecessary_addr_size): /soc/apb@d4000000/spi@d4037000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/dove.dtsi:79.7-819.4: Warning (unit_address_vs_reg): /mbus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (unit_address_vs_reg): /mbus/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (unit_address_vs_reg): /mbus/internal-regs: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove-dove-db.dts:10.9-13.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (simple_bus_reg): /mbus/pcie: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (simple_bus_reg): /mbus/internal-regs: simple-bus unit address format error, expected "f001000000000000"
   arch/arm/boot/dts/marvell/dove.dtsi:458.13-472.7: Warning (simple_bus_reg): /mbus/internal-regs/power-management@d0000/domains: missing or empty reg/ranges property
   arch/arm/boot/dts/marvell/dove.dtsi:251.27-254.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/mbus-ctrl@20000: duplicate unit-address (also used in node /mbus/internal-regs/system-ctrl@20000)
   arch/arm/boot/dts/marvell/dove.dtsi:277.23-283.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/timer@20300: duplicate unit-address (also used in node /mbus/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/dove.dtsi:79.7-819.4: Warning (unit_address_vs_reg): /mbus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (unit_address_vs_reg): /mbus/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (unit_address_vs_reg): /mbus/internal-regs: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove-d2plug.dts:10.9-13.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (simple_bus_reg): /mbus/pcie: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (simple_bus_reg): /mbus/internal-regs: simple-bus unit address format error, expected "f001000000000000"
   arch/arm/boot/dts/marvell/dove.dtsi:458.13-472.7: Warning (simple_bus_reg): /mbus/internal-regs/power-management@d0000/domains: missing or empty reg/ranges property
   arch/arm/boot/dts/marvell/dove.dtsi:251.27-254.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/mbus-ctrl@20000: duplicate unit-address (also used in node /mbus/internal-regs/system-ctrl@20000)
   arch/arm/boot/dts/marvell/dove.dtsi:277.23-283.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/timer@20300: duplicate unit-address (also used in node /mbus/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:267.19-283.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (unit_address_vs_reg): /mbus/internal-regs: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove-cm-a510.dtsi:93.9-96.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (simple_bus_reg): /mbus/pcie: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (simple_bus_reg): /mbus/internal-regs: simple-bus unit address format error, expected "f001000000000000"
   arch/arm/boot/dts/marvell/dove.dtsi:458.13-472.7: Warning (simple_bus_reg): /mbus/internal-regs/power-management@d0000/domains: missing or empty reg/ranges property
   arch/arm/boot/dts/marvell/dove.dtsi:251.27-254.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/mbus-ctrl@20000: duplicate unit-address (also used in node /mbus/internal-regs/system-ctrl@20000)
   arch/arm/boot/dts/marvell/dove.dtsi:277.23-283.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/timer@20300: duplicate unit-address (also used in node /mbus/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:267.19-283.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (unit_address_vs_reg): /mbus/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (unit_address_vs_reg): /mbus/internal-regs: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove-d3plug.dts:10.9-13.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/dove.dtsi:93.14-167.5: Warning (simple_bus_reg): /mbus/pcie: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/dove.dtsi:169.17-818.5: Warning (simple_bus_reg): /mbus/internal-regs: simple-bus unit address format error, expected "f001000000000000"
   arch/arm/boot/dts/marvell/dove.dtsi:458.13-472.7: Warning (simple_bus_reg): /mbus/internal-regs/power-management@d0000/domains: missing or empty reg/ranges property
   arch/arm/boot/dts/marvell/dove.dtsi:251.27-254.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/mbus-ctrl@20000: duplicate unit-address (also used in node /mbus/internal-regs/system-ctrl@20000)
   arch/arm/boot/dts/marvell/dove.dtsi:277.23-283.6: Warning (unique_unit_address_if_enabled): /mbus/internal-regs/timer@20300: duplicate unit-address (also used in node /mbus/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:267.19-283.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:285.19-301.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-370.dtsi:33.11-36.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "1e0000000000000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:38.24-112.5: Warning (simple_bus_reg): /soc/pcie@82000000: simple-bus unit address format error, expected "f001000000040000"
   arch/arm/boot/dts/marvell/armada-370.dtsi:261.24-280.5: Warning (simple_bus_reg): /soc/sa-sram: simple-bus unit address format error, expected "901000000000000"
   arch/arm/boot/dts/marvell/armada-370-xp.dtsi:180.23-183.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
>> arch/arm/boot/dts/marvell/armada-370.dtsi:70.5-73.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@1,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/armada-370.dtsi:98.5-101.31: Warning (interrupt_map): /soc/pcie@82000000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /soc/pcie@82000000/pcie@2,0/interrupt-controller, using 0 as fallback
--
   arch/arm/boot/dts/renesas/r7s72100.dtsi:39.11-44.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts:32.17-72.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/renesas/r7s72100.dtsi:445.26-450.5: Warning (unique_unit_address_if_enabled): /soc/watchdog@fcfe0000: duplicate unit-address (also used in node /soc/cpg_clocks@fcfe0000)
--
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
--
   arch/arm/boot/dts/renesas/r7s72100.dtsi:39.11-44.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/renesas/r7s72100.dtsi:445.26-450.5: Warning (unique_unit_address_if_enabled): /soc/watchdog@fcfe0000: duplicate unit-address (also used in node /soc/cpg_clocks@fcfe0000)
--
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
>> arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts:105.19-134.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
--
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:157.18-164.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:324.18-331.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:86.19-103.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm/boot/dts/st/spear13xx.dtsi:209.7-337.5: Warning (unit_address_vs_reg): /ahb/apb: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/st/spear1310-evb.dts:153.13-159.6: Warning (unit_address_vs_reg): /ahb/gpio_keys/button@1: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/st/spear13xx.dtsi:161.7-166.5: Warning (simple_bus_reg): /ahb/pcm: missing or empty reg/ranges property
   arch/arm/boot/dts/st/spear13xx.dtsi:209.7-337.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "50000000"
   arch/arm/boot/dts/st/spear1310-evb.dts:148.13-160.5: Warning (simple_bus_reg): /ahb/gpio_keys: missing or empty reg/ranges property
>> arch/arm/boot/dts/st/spear1310-evb.dts:348.16-378.7: Warning (avoid_unnecessary_addr_size): /ahb/apb/spi@e0100000/stmpe610@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/st/spear1310-evb.dts:148.13-160.5: Warning (avoid_unnecessary_addr_size): /ahb/gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/st/spear1310.dtsi:14.25-24.5: Warning (unique_unit_address_if_enabled): /ahb/spics@e0700000: duplicate unit-address (also used in node /ahb/pinmux@e0700000)
--
   arch/arm/boot/dts/st/spear13xx.dtsi:161.7-166.5: Warning (simple_bus_reg): /ahb/pcm: missing or empty reg/ranges property
   arch/arm/boot/dts/st/spear13xx.dtsi:209.7-337.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "50000000"
   arch/arm/boot/dts/st/spear1340-evb.dts:278.22-280.6: Warning (simple_bus_reg): /ahb/apb/i2s-play@b2400000: missing or empty reg/ranges property
   arch/arm/boot/dts/st/spear1340-evb.dts:282.21-284.6: Warning (simple_bus_reg): /ahb/apb/i2s-rec@b2000000: missing or empty reg/ranges property
   arch/arm/boot/dts/st/spear1340-evb.dts:210.13-222.5: Warning (simple_bus_reg): /ahb/gpio_keys: missing or empty reg/ranges property
   arch/arm/boot/dts/st/spear1340-evb.dts:236.21-239.5: Warning (simple_bus_reg): /ahb/dir-hifi: missing or empty reg/ranges property
   arch/arm/boot/dts/st/spear1340-evb.dts:249.22-252.5: Warning (simple_bus_reg): /ahb/dit-hifi: missing or empty reg/ranges property
   arch/arm/boot/dts/st/spear1340-evb.dts:254.9-263.5: Warning (simple_bus_reg): /ahb/sound: missing or empty reg/ranges property
>> arch/arm/boot/dts/st/spear1340-evb.dts:457.16-487.7: Warning (avoid_unnecessary_addr_size): /ahb/apb/spi@e0100000/stmpe610@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/st/spear1340-evb.dts:315.17-329.7: Warning (avoid_unnecessary_addr_size): /ahb/apb/i2c@b4000000/stmpe801@41: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/st/spear1340-evb.dts:210.13-222.5: Warning (avoid_unnecessary_addr_size): /ahb/gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

vim +257 arch/arm/boot/dts/microchip/sama5d3.dtsi

655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   16  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   17  / {
abe60a3a7afb40 arch/arm/boot/dts/sama5d3.dtsi           Rob Herring                      2019-01-09   18  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/sama5d3.dtsi           Rob Herring                      2019-01-09   19  	#size-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   20  	model = "Atmel SAMA5D3 family SoC";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   21  	compatible = "atmel,sama5d3", "atmel,sama5";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   22  	interrupt-parent = <&aic>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   23  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   24  	aliases {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   25  		serial0 = &dbgu;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   26  		serial1 = &usart0;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   27  		serial2 = &usart1;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   28  		serial3 = &usart2;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   29  		serial4 = &usart3;
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27   30  		serial5 = &uart0;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   31  		gpio0 = &pioA;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   32  		gpio1 = &pioB;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   33  		gpio2 = &pioC;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   34  		gpio3 = &pioD;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   35  		gpio4 = &pioE;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   36  		tcb0 = &tcb0;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   37  		i2c0 = &i2c0;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   38  		i2c1 = &i2c1;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   39  		i2c2 = &i2c2;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   40  		ssc0 = &ssc0;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   41  		ssc1 = &ssc1;
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19   42  		pwm0 = &pwm0;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   43  	};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   44  	cpus {
8b2efa896cc618 arch/arm/boot/dts/sama5d3.dtsi           Arnd Bergmann                    2013-06-10   45  		#address-cells = <1>;
8b2efa896cc618 arch/arm/boot/dts/sama5d3.dtsi           Arnd Bergmann                    2013-06-10   46  		#size-cells = <0>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   47  		cpu@0 {
e757a6ee3e6fc1 arch/arm/boot/dts/sama5d3.dtsi           Lorenzo Pieralisi                2013-04-18   48  			device_type = "cpu";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   49  			compatible = "arm,cortex-a5";
e757a6ee3e6fc1 arch/arm/boot/dts/sama5d3.dtsi           Lorenzo Pieralisi                2013-04-18   50  			reg = <0x0>;
31a820245903f7 arch/arm/boot/dts/microchip/sama5d3.dtsi Mihai Sain                       2025-06-25   51  			d-cache-size = <0x8000>;	// L1, 32 KB
31a820245903f7 arch/arm/boot/dts/microchip/sama5d3.dtsi Mihai Sain                       2025-06-25   52  			i-cache-size = <0x8000>;	// L1, 32 KB
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   53  		};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   54  	};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   55  
d9da9778201bd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2013-08-05   56  	pmu {
d9da9778201bd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2013-08-05   57  		compatible = "arm,cortex-a5-pmu";
d9da9778201bd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2013-08-05   58  		interrupts = <46 IRQ_TYPE_LEVEL_HIGH 0>;
d9da9778201bd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2013-08-05   59  	};
d9da9778201bd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2013-08-05   60  
996710a8956e43 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-08-31   61  	memory@20000000 {
abe60a3a7afb40 arch/arm/boot/dts/sama5d3.dtsi           Rob Herring                      2019-01-09   62  		device_type = "memory";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   63  		reg = <0x20000000 0x8000000>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   64  	};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   65  
334394c0d853c5 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2014-06-17   66  	clocks {
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   67  		slow_xtal: slow_xtal {
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   68  			compatible = "fixed-clock";
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   69  			#clock-cells = <0>;
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   70  			clock-frequency = <0>;
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   71  		};
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   72  
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   73  		main_xtal: main_xtal {
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   74  			compatible = "fixed-clock";
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   75  			#clock-cells = <0>;
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   76  			clock-frequency = <0>;
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   77  		};
4753219dd3df5c arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2014-04-22   78  
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18   79  		adc_op_clk: adc_op_clk {
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18   80  			compatible = "fixed-clock";
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18   81  			#clock-cells = <0>;
cb3651d7be2885 arch/arm/boot/dts/sama5d3.dtsi           Josh Wu                          2015-01-28   82  			clock-frequency = <1000000>;
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18   83  		};
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18   84  	};
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18   85  
8dccafaa281aa1 arch/arm/boot/dts/sama5d3.dtsi           Rob Herring                      2017-10-13   86  	sram: sram@300000 {
f04660e48b201b arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2015-01-13   87  		compatible = "mmio-sram";
f04660e48b201b arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2015-01-13   88  		reg = <0x00300000 0x20000>;
cd6228b782ae16 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-08-31   89  		#address-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-08-31   90  		#size-cells = <1>;
cd6228b782ae16 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-08-31   91  		ranges = <0 0x00300000 0x20000>;
f04660e48b201b arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2015-01-13   92  	};
f04660e48b201b arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2015-01-13   93  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   94  	ahb {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   95  		compatible = "simple-bus";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   96  		#address-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   97  		#size-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   98  		ranges;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22   99  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  100  		apb {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  101  			compatible = "simple-bus";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  102  			#address-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  103  			#size-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  104  			ranges;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  105  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  106  			mmc0: mmc@f0000000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  107  				compatible = "atmel,hsmci";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  108  				reg = <0xf0000000 0x600>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  109  				interrupts = <21 IRQ_TYPE_LEVEL_HIGH 0>;
d4ae89c8ae2c30 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-05-30  110  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(0)>;
05c1bc97c1421d arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-04-16  111  				dma-names = "rxtx";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  112  				pinctrl-names = "default";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  113  				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinctrl_mmc0_dat4_7>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  114  				status = "disabled";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  115  				#address-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  116  				#size-cells = <0>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  117  				clocks = <&pmc PMC_TYPE_PERIPHERAL 21>;
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18  118  				clock-names = "mci_clk";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  119  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  120  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  121  			spi0: spi@f0004000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  122  				#address-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  123  				#size-cells = <0>;
b7ef678e42affc arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-06-24  124  				compatible = "atmel,at91rm9200-spi";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  125  				reg = <0xf0004000 0x100>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  126  				interrupts = <24 IRQ_TYPE_LEVEL_HIGH 3>;
e543a73a7e69bc arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-06-24  127  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(1)>,
e543a73a7e69bc arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-06-24  128  				       <&dma0 2 AT91_DMA_CFG_PER_ID(2)>;
e543a73a7e69bc arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-06-24  129  				dma-names = "tx", "rx";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  130  				pinctrl-names = "default";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  131  				pinctrl-0 = <&pinctrl_spi0>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  132  				clocks = <&pmc PMC_TYPE_PERIPHERAL 24>;
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18  133  				clock-names = "spi_clk";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  134  				status = "disabled";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  135  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  136  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  137  			ssc0: ssc@f0008000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  138  				compatible = "atmel,at91sam9g45-ssc";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  139  				reg = <0xf0008000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  140  				interrupts = <38 IRQ_TYPE_LEVEL_HIGH 4>;
58962b7494c0fc arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2014-03-17  141  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(13)>,
58962b7494c0fc arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2014-03-17  142  				       <&dma0 2 AT91_DMA_CFG_PER_ID(14)>;
58962b7494c0fc arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2014-03-17  143  				dma-names = "tx", "rx";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  144  				pinctrl-names = "default";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  145  				pinctrl-0 = <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  146  				clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18  147  				clock-names = "pclk";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  148  				status = "disabled";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  149  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  150  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  151  			tcb0: timer@f0010000 {
a4799758f4033f arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2016-06-07  152  				compatible = "atmel,at91sam9x5-tcb", "simple-mfd", "syscon";
a4799758f4033f arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2016-06-07  153  				#address-cells = <1>;
a4799758f4033f arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2016-06-07  154  				#size-cells = <0>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  155  				reg = <0xf0010000 0x100>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  156  				interrupts = <26 IRQ_TYPE_LEVEL_HIGH 0>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  157  				clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&clk32k>;
288fb7ff8eed8a arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2015-07-29  158  				clock-names = "t0_clk", "slow_clk";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  159  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  160  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  161  			i2c0: i2c@f0014000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  162  				compatible = "atmel,at91sam9x5-i2c";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  163  				reg = <0xf0014000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  164  				interrupts = <18 IRQ_TYPE_LEVEL_HIGH 6>;
d4ae89c8ae2c30 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-05-30  165  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(7)>,
d4ae89c8ae2c30 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-05-30  166  				       <&dma0 2 AT91_DMA_CFG_PER_ID(8)>;
d9a63a45180ec0 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-04-16  167  				dma-names = "tx", "rx";
a4bd8da893a375 arch/arm/boot/dts/sama5d3.dtsi           Kamel Bouhara                    2020-02-25  168  				pinctrl-names = "default", "gpio";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  169  				pinctrl-0 = <&pinctrl_i2c0>;
a4bd8da893a375 arch/arm/boot/dts/sama5d3.dtsi           Kamel Bouhara                    2020-02-25  170  				pinctrl-1 = <&pinctrl_i2c0_gpio>;
a4bd8da893a375 arch/arm/boot/dts/sama5d3.dtsi           Kamel Bouhara                    2020-02-25  171  				sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
c5a28380257327 arch/arm/boot/dts/sama5d3.dtsi           Codrin Ciubotariu                2020-05-15  172  				scl-gpios = <&pioA 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  173  				#address-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  174  				#size-cells = <0>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  175  				clocks = <&pmc PMC_TYPE_PERIPHERAL 18>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  176  				status = "disabled";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  177  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  178  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  179  			i2c1: i2c@f0018000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  180  				compatible = "atmel,at91sam9x5-i2c";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  181  				reg = <0xf0018000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  182  				interrupts = <19 IRQ_TYPE_LEVEL_HIGH 6>;
d4ae89c8ae2c30 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-05-30  183  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(9)>,
d4ae89c8ae2c30 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-05-30  184  				       <&dma0 2 AT91_DMA_CFG_PER_ID(10)>;
d9a63a45180ec0 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-04-16  185  				dma-names = "tx", "rx";
a4bd8da893a375 arch/arm/boot/dts/sama5d3.dtsi           Kamel Bouhara                    2020-02-25  186  				pinctrl-names = "default", "gpio";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  187  				pinctrl-0 = <&pinctrl_i2c1>;
a4bd8da893a375 arch/arm/boot/dts/sama5d3.dtsi           Kamel Bouhara                    2020-02-25  188  				pinctrl-1 = <&pinctrl_i2c1_gpio>;
a4bd8da893a375 arch/arm/boot/dts/sama5d3.dtsi           Kamel Bouhara                    2020-02-25  189  				sda-gpios = <&pioC 26 GPIO_ACTIVE_HIGH>;
c5a28380257327 arch/arm/boot/dts/sama5d3.dtsi           Codrin Ciubotariu                2020-05-15  190  				scl-gpios = <&pioC 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  191  				#address-cells = <1>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  192  				#size-cells = <0>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  193  				clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  194  				status = "disabled";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  195  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  196  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  197  			usart0: serial@f001c000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  198  				compatible = "atmel,at91sam9260-usart";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  199  				reg = <0xf001c000 0x100>;
f9e1d0767fde8c arch/arm/boot/dts/sama5d3.dtsi           Sergiu Moga                      2022-09-13  200  				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  201  				interrupts = <12 IRQ_TYPE_LEVEL_HIGH 5>;
d24cd78399a362 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2014-08-12  202  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(3)>,
d24cd78399a362 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2014-08-12  203  				       <&dma0 2 (AT91_DMA_CFG_PER_ID(4) | AT91_DMA_CFG_FIFOCFG_ASAP)>;
d24cd78399a362 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2014-08-12  204  				dma-names = "tx", "rx";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  205  				pinctrl-names = "default";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  206  				pinctrl-0 = <&pinctrl_usart0>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  207  				clocks = <&pmc PMC_TYPE_PERIPHERAL 12>;
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18  208  				clock-names = "usart";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  209  				status = "disabled";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  210  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  211  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  212  			usart1: serial@f0020000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  213  				compatible = "atmel,at91sam9260-usart";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  214  				reg = <0xf0020000 0x100>;
f9e1d0767fde8c arch/arm/boot/dts/sama5d3.dtsi           Sergiu Moga                      2022-09-13  215  				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  216  				interrupts = <13 IRQ_TYPE_LEVEL_HIGH 5>;
d24cd78399a362 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2014-08-12  217  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(5)>,
d24cd78399a362 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2014-08-12  218  				       <&dma0 2 (AT91_DMA_CFG_PER_ID(6) | AT91_DMA_CFG_FIFOCFG_ASAP)>;
d24cd78399a362 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2014-08-12  219  				dma-names = "tx", "rx";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  220  				pinctrl-names = "default";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  221  				pinctrl-0 = <&pinctrl_usart1>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  222  				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
d2e8190b7916ed arch/arm/boot/dts/sama5d3.dtsi           Boris Brezillon                  2013-10-18  223  				clock-names = "usart";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  224  				status = "disabled";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  225  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  226  
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  227  			uart0: serial@f0024000 {
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  228  				compatible = "atmel,at91sam9260-usart";
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  229  				reg = <0xf0024000 0x100>;
f9e1d0767fde8c arch/arm/boot/dts/sama5d3.dtsi           Sergiu Moga                      2022-09-13  230  				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  231  				interrupts = <16 IRQ_TYPE_LEVEL_HIGH 5>;
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  232  				pinctrl-names = "default";
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  233  				pinctrl-0 = <&pinctrl_uart0>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  234  				clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  235  				clock-names = "usart";
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  236  				status = "disabled";
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  237  			};
f1ea096c78db03 arch/arm/boot/dts/sama5d3.dtsi           Nicolas Ferre                    2013-11-27  238  
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19  239  			pwm0: pwm@f002c000 {
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19  240  				compatible = "atmel,sama5d3-pwm";
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19  241  				reg = <0xf002c000 0x300>;
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19  242  				interrupts = <28 IRQ_TYPE_LEVEL_HIGH 4>;
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19  243  				#pwm-cells = <3>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  244  				clocks = <&pmc PMC_TYPE_PERIPHERAL 28>;
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19  245  				status = "disabled";
f3ab052786e98b arch/arm/boot/dts/sama5d3.dtsi           Bo Shen                          2013-12-19  246  			};
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  247  
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  248  			isi: isi@f0034000 {
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  249  				compatible = "atmel,at91sam9g45-isi";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  250  				reg = <0xf0034000 0x4000>;
5e8b3bc392180c arch/arm/boot/dts/sama5d3.dtsi           Jean-Christophe PLAGNIOL-VILLARD 2013-04-24  251  				interrupts = <37 IRQ_TYPE_LEVEL_HIGH 5>;
4dd32e6d24932b arch/arm/boot/dts/sama5d3.dtsi           Josh Wu                          2015-01-14  252  				pinctrl-names = "default";
4dd32e6d24932b arch/arm/boot/dts/sama5d3.dtsi           Josh Wu                          2015-01-14  253  				pinctrl-0 = <&pinctrl_isi_data_0_7>;
7ed609b0020fd1 arch/arm/boot/dts/sama5d3.dtsi           Alexandre Belloni                2020-01-10  254  				clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
b00122f6e1d449 arch/arm/boot/dts/sama5d3.dtsi           Josh Wu                          2015-01-04  255  				clock-names = "isi_clk";
655ff266998ae4 arch/arm/boot/dts/sama5d3.dtsi           Ludovic Desroches                2013-03-22  256  				status = "disabled";
4dd32e6d24932b arch/arm/boot/dts/sama5d3.dtsi           Josh Wu                          2015-01-14 @257  				port {

:::::: The code at line 257 was first introduced by commit
:::::: 4dd32e6d24932b0b0327d3a8ce526a56446e9b98 ARM: at91: dts: sama5d3: add ov2640 camera sensor support

:::::: TO: Josh Wu <josh.wu@atmel.com>
:::::: CC: Nicolas Ferre <nicolas.ferre@atmel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
