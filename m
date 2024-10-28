Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C092C188CDC
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730157095; cv=none; b=r4WCOyuujBOCYuOnkSIz32tScvXSy/dBrKD7ZBLC2tr9avtO/aw7SWPoBAlu9fjQvk/W1vcAVRFzTSC01BKHryVi0+DVMLFZl7KrbQqp9HmZHdqgulAYnEiaa0Ig7gk0kkHVdtp5IqrxCNOs5BY9TfPBOKLltdkO3msC4+Yapmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730157095; c=relaxed/simple;
	bh=YXJHoubF9e3wLlwpuAPaTelVMunIHkCoSMqesjW49ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTYaJDT79ZYW++6XRWYFe1RnAlcApSAnqDgqQbWzIyHWnac8ERqsXIuF6KFgI5lsdqZ+TSKtZLKYgOswlTSSjLMpu70LNyGucxGRH278jc0uGcdDo0yrWMnx6SI3f1i04+oxza7NbhRco0LwPnCMpyaVVod3StAEU7OdPtB6X30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMx2yLHM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMx2yLHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730157092; x=1761693092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YXJHoubF9e3wLlwpuAPaTelVMunIHkCoSMqesjW49ms=;
  b=RMx2yLHM5HKQmZmv2tx76GKB/HUpZOOzikHtcc5b2r9PrXFebx9QgvwH
   uUalQTgbVqHwET8Ki1HZwoTVf9ugrpc/xRSfKiYOsTVDLCIxzxXmE9yPP
   eTF6wkxqKCej3YuFPTbTKJV4QsqLwa+lTP3vCBN9MxIlEh3wViA4wP3+8
   UC1GmYWHT8eTZWaEcrLRMrZoMFoz6Eip8N1gf3iSr0KCfngTQGfouDzmy
   s5HqJlQ7iZUeBf4xt/MXKy+noGezQOh13aGu0T8IWXc0f4zo7gR2/QIdl
   FffikwoDZ1La/FW98+I8EuoF1Hpfg6QvTFGTQBKMdAvqA7thbuWepicAK
   w==;
X-CSE-ConnectionGUID: KhuUzxKIR6aajszCY7xC/Q==
X-CSE-MsgGUID: JbPwlkQfSpSTwlWS9veoFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33472001"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33472001"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 16:11:31 -0700
X-CSE-ConnectionGUID: 1BLdqZvOTv6odAnAj0bV+A==
X-CSE-MsgGUID: Y2ecrZkLQ1ejCwkXkBBTsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="105109074"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 16:11:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5YtT-000czM-2B;
	Mon, 28 Oct 2024 23:11:27 +0000
Date: Tue, 29 Oct 2024 07:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] arm64: dts: imx8mp: add aristainetos3 board
 support
Message-ID: <202410290612.2LOTNBd2-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241028082332.21672-3-hs@denx.de>
References: <20241028082332.21672-3-hs@denx.de>
TO: Heiko Schocher <hs@denx.de>
TO: linux-kernel@vger.kernel.org
CC: Heiko Schocher <hs@denx.de>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-mem-ctrl/for-next krzk-dt/for-next linus/master v6.12-rc5 next-20241028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Schocher/dt-bindings-arm-fsl-Add-ABB-SoM-and-carrier/20241028-162629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241028082332.21672-3-hs%40denx.de
patch subject: [PATCH v1 2/2] arm64: dts: imx8mp: add aristainetos3 board support
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290612.2LOTNBd2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290612.2LOTNBd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410290612.2LOTNBd2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:59.3-13: Warning (reg_format): /fragment@4/__overlay__/spi@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:68.3-13: Warning (reg_format): /fragment@5/__overlay__/spi@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:93.3-16: Warning (reg_format): /fragment@8/__overlay__/tlc59108@40:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:138.3-16: Warning (reg_format): /fragment@8/__overlay__/rtc@68:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:57.19-61.4: Warning (avoid_default_addr_size): /fragment@4/__overlay__/spi@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:57.19-61.4: Warning (avoid_default_addr_size): /fragment@4/__overlay__/spi@0: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:66.19-70.4: Warning (avoid_default_addr_size): /fragment@5/__overlay__/spi@0: Relying on default #address-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:66.19-70.4: Warning (avoid_default_addr_size): /fragment@5/__overlay__/spi@0: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:89.14-134.4: Warning (avoid_default_addr_size): /fragment@8/__overlay__/tlc59108@40: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:89.14-134.4: Warning (avoid_default_addr_size): /fragment@8/__overlay__/tlc59108@40: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:136.15-139.4: Warning (avoid_default_addr_size): /fragment@8/__overlay__/rtc@68: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi:136.15-139.4: Warning (avoid_default_addr_size): /fragment@8/__overlay__/rtc@68: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtbo: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:45.3-13: Warning (reg_format): /fragment@2/__overlay__/spi@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:51.3-13: Warning (reg_format): /fragment@2/__overlay__/spi@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:59.3-13: Warning (reg_format): /fragment@3/__overlay__/spi@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:71.3-16: Warning (reg_format): /fragment@5/__overlay__/eeprom@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:78.3-16: Warning (reg_format): /fragment@6/__overlay__/gpio@20:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:101.3-16: Warning (reg_format): /fragment@6/__overlay__/rtc@68:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:43.19-47.4: Warning (avoid_default_addr_size): /fragment@2/__overlay__/spi@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:43.19-47.4: Warning (avoid_default_addr_size): /fragment@2/__overlay__/spi@0: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:49.19-53.4: Warning (avoid_default_addr_size): /fragment@2/__overlay__/spi@1: Relying on default #address-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:49.19-53.4: Warning (avoid_default_addr_size): /fragment@2/__overlay__/spi@1: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:57.19-61.4: Warning (avoid_default_addr_size): /fragment@3/__overlay__/spi@0: Relying on default #address-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:57.19-61.4: Warning (avoid_default_addr_size): /fragment@3/__overlay__/spi@0: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:69.12-72.4: Warning (avoid_default_addr_size): /fragment@5/__overlay__/eeprom@57: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:69.12-72.4: Warning (avoid_default_addr_size): /fragment@5/__overlay__/eeprom@57: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:76.26-97.4: Warning (avoid_default_addr_size): /fragment@6/__overlay__/gpio@20: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:76.26-97.4: Warning (avoid_default_addr_size): /fragment@6/__overlay__/gpio@20: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:99.9-102.4: Warning (avoid_default_addr_size): /fragment@6/__overlay__/rtc@68: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi:99.9-102.4: Warning (avoid_default_addr_size): /fragment@6/__overlay__/rtc@68: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtbo: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:11.3-13: Warning (reg_format): /fragment@0/__overlay__/spi@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:19.3-13: Warning (reg_format): /fragment@1/__overlay__/spi@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:50.3-16: Warning (reg_format): /fragment@2/__overlay__/i2c2_gpioext0@3e:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:10.17-14.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spi@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:10.17-14.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spi@0: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:18.17-22.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/spi@0: Relying on default #address-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:18.17-22.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/spi@0: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:27.26-58.4: Warning (avoid_default_addr_size): /fragment@2/__overlay__/i2c2_gpioext0@3e: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi:27.26-58.4: Warning (avoid_default_addr_size): /fragment@2/__overlay__/i2c2_gpioext0@3e: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtbo: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi:50.31-59.5: Warning (simple_bus_reg): /fixed-regulators/regulator-enet: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi:44.19-60.4: Warning (avoid_unnecessary_addr_size): /fixed-regulators: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi:527.14-540.4: Warning (interrupt_provider): /soc@0/bus@30800000/i2c@30ae0000/tpm@2e: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi:703.7-711.4: Warning (graph_child_address): /soc@0/usb@32f10100/usb@38100000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi:30.9-41.5: Warning (graph_child_address): /connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +59 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi

2402f8365a1bcb Heiko Schocher 2024-10-28   51  
2402f8365a1bcb Heiko Schocher 2024-10-28   52  &ecspi1{
2402f8365a1bcb Heiko Schocher 2024-10-28   53  	fsl,spi-num-chipselects = <1>;
2402f8365a1bcb Heiko Schocher 2024-10-28   54  	pinctrl-0 = <&pinctrl_ecspi1>;
2402f8365a1bcb Heiko Schocher 2024-10-28   55  	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
2402f8365a1bcb Heiko Schocher 2024-10-28   56  
2402f8365a1bcb Heiko Schocher 2024-10-28  @57  	spidev1_0: spi@0 {
2402f8365a1bcb Heiko Schocher 2024-10-28   58  		compatible = "rohm,dh2228fv";
2402f8365a1bcb Heiko Schocher 2024-10-28  @59  		reg = <0>;
2402f8365a1bcb Heiko Schocher 2024-10-28   60  		spi-max-frequency = <54000000>;
2402f8365a1bcb Heiko Schocher 2024-10-28   61  	};
2402f8365a1bcb Heiko Schocher 2024-10-28   62  
2402f8365a1bcb Heiko Schocher 2024-10-28   63  };
2402f8365a1bcb Heiko Schocher 2024-10-28   64  
2402f8365a1bcb Heiko Schocher 2024-10-28   65  &ecspi2 {
2402f8365a1bcb Heiko Schocher 2024-10-28   66  	spidev2_0: spi@0 {
2402f8365a1bcb Heiko Schocher 2024-10-28   67  		compatible = "rohm,dh2228fv";
2402f8365a1bcb Heiko Schocher 2024-10-28   68  		reg = <0>;
2402f8365a1bcb Heiko Schocher 2024-10-28   69  		spi-max-frequency = <54000000>;
2402f8365a1bcb Heiko Schocher 2024-10-28   70  	};
2402f8365a1bcb Heiko Schocher 2024-10-28   71  };
2402f8365a1bcb Heiko Schocher 2024-10-28   72  
2402f8365a1bcb Heiko Schocher 2024-10-28   73  &gpio1 {
2402f8365a1bcb Heiko Schocher 2024-10-28   74  	gpio-line-names =
2402f8365a1bcb Heiko Schocher 2024-10-28   75  		"", "", "", "", "", "", "", "power",
2402f8365a1bcb Heiko Schocher 2024-10-28   76  		"", "", "", "", "", "", "", "",
2402f8365a1bcb Heiko Schocher 2024-10-28   77  		"", "", "", "", "", "", "", "",
2402f8365a1bcb Heiko Schocher 2024-10-28   78  		"", "", "", "", "", "", "", "";
2402f8365a1bcb Heiko Schocher 2024-10-28   79  };
2402f8365a1bcb Heiko Schocher 2024-10-28   80  
2402f8365a1bcb Heiko Schocher 2024-10-28   81  &gpio6 {
2402f8365a1bcb Heiko Schocher 2024-10-28   82  	gpio-line-names =
2402f8365a1bcb Heiko Schocher 2024-10-28   83  		"relay0", "relay1", "relay2",
2402f8365a1bcb Heiko Schocher 2024-10-28   84  		"heater", "fan", "spare",
2402f8365a1bcb Heiko Schocher 2024-10-28   85  		"clear", "fault";
2402f8365a1bcb Heiko Schocher 2024-10-28   86  };
2402f8365a1bcb Heiko Schocher 2024-10-28   87  
2402f8365a1bcb Heiko Schocher 2024-10-28   88  &i2c2 {
2402f8365a1bcb Heiko Schocher 2024-10-28  @89  	tlc59108@40 {
2402f8365a1bcb Heiko Schocher 2024-10-28   90  		#address-cells = <1>;
2402f8365a1bcb Heiko Schocher 2024-10-28   91  		#size-cells = <0>;
2402f8365a1bcb Heiko Schocher 2024-10-28   92  		compatible = "ti,tlc59108";
2402f8365a1bcb Heiko Schocher 2024-10-28  @93  		reg = <0x40>;
2402f8365a1bcb Heiko Schocher 2024-10-28   94  
2402f8365a1bcb Heiko Schocher 2024-10-28   95  		system_red@0 {
2402f8365a1bcb Heiko Schocher 2024-10-28   96  			label = "system:red";
2402f8365a1bcb Heiko Schocher 2024-10-28   97  			reg = <0x0>;
2402f8365a1bcb Heiko Schocher 2024-10-28   98  		};
2402f8365a1bcb Heiko Schocher 2024-10-28   99  
2402f8365a1bcb Heiko Schocher 2024-10-28  100  		system_green@1 {
2402f8365a1bcb Heiko Schocher 2024-10-28  101  			label = "system:green";
2402f8365a1bcb Heiko Schocher 2024-10-28  102  			reg = <0x1>;
2402f8365a1bcb Heiko Schocher 2024-10-28  103  		};
2402f8365a1bcb Heiko Schocher 2024-10-28  104  
2402f8365a1bcb Heiko Schocher 2024-10-28  105  		hydrogen_green@2 {
2402f8365a1bcb Heiko Schocher 2024-10-28  106  			label = "hydrogen:green";
2402f8365a1bcb Heiko Schocher 2024-10-28  107  			reg = <0x2>;
2402f8365a1bcb Heiko Schocher 2024-10-28  108  		};
2402f8365a1bcb Heiko Schocher 2024-10-28  109  
2402f8365a1bcb Heiko Schocher 2024-10-28  110  		hydrogen_red@3 {
2402f8365a1bcb Heiko Schocher 2024-10-28  111  			label = "hydrogen:red";
2402f8365a1bcb Heiko Schocher 2024-10-28  112  			reg = <0x3>;
2402f8365a1bcb Heiko Schocher 2024-10-28  113  		};
2402f8365a1bcb Heiko Schocher 2024-10-28  114  
2402f8365a1bcb Heiko Schocher 2024-10-28  115  		hydrogen_blue@4 {
2402f8365a1bcb Heiko Schocher 2024-10-28  116  			label = "hydrogen:blue";
2402f8365a1bcb Heiko Schocher 2024-10-28  117  			reg = <0x4>;
2402f8365a1bcb Heiko Schocher 2024-10-28  118  		};
2402f8365a1bcb Heiko Schocher 2024-10-28  119  
2402f8365a1bcb Heiko Schocher 2024-10-28  120  		moisture_red@5 {
2402f8365a1bcb Heiko Schocher 2024-10-28  121  			label = "moisture:red";
2402f8365a1bcb Heiko Schocher 2024-10-28  122  			reg = <0x5>;
2402f8365a1bcb Heiko Schocher 2024-10-28  123  		};
2402f8365a1bcb Heiko Schocher 2024-10-28  124  
2402f8365a1bcb Heiko Schocher 2024-10-28  125  		moisture_green@6 {
2402f8365a1bcb Heiko Schocher 2024-10-28  126  			label = "moisture:green";
2402f8365a1bcb Heiko Schocher 2024-10-28  127  			reg = <0x6>;
2402f8365a1bcb Heiko Schocher 2024-10-28  128  		};
2402f8365a1bcb Heiko Schocher 2024-10-28  129  
2402f8365a1bcb Heiko Schocher 2024-10-28  130  		moisture_blue@7 {
2402f8365a1bcb Heiko Schocher 2024-10-28  131  			label = "moisture:blue";
2402f8365a1bcb Heiko Schocher 2024-10-28  132  			reg = <0x7>;
2402f8365a1bcb Heiko Schocher 2024-10-28  133  		};
2402f8365a1bcb Heiko Schocher 2024-10-28  134  	};
2402f8365a1bcb Heiko Schocher 2024-10-28  135  
2402f8365a1bcb Heiko Schocher 2024-10-28 @136  	rtc1: rtc@68 {
2402f8365a1bcb Heiko Schocher 2024-10-28  137  		compatible = "dallas,ds1339";
2402f8365a1bcb Heiko Schocher 2024-10-28 @138  		reg = <0x68>;
2402f8365a1bcb Heiko Schocher 2024-10-28  139  	};
2402f8365a1bcb Heiko Schocher 2024-10-28  140  };
2402f8365a1bcb Heiko Schocher 2024-10-28  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
