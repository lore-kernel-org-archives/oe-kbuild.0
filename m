Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2D1E495
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283178; cv=none; b=m3zWEvXDG9NFs+kKMQT319eb+0UWoATj7NydenvsSXDRYI1B4ZvFjFUi0P5Sfwy5theieI1Kd3nMwdVP6oPOWcT+yfC9OHsX5m+XHMcDEMJM2gp9pa09wWH83zwFTUrcZ2LEDiKg5ULxcO19z12ofNHobvo63f/3rAsyZxAWJs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283178; c=relaxed/simple;
	bh=sqdi0Tmiizx8AOh9mT558yDJ19A2jwS1opUr4I3tZiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dy+UTRahbF4xtrLTI2/gD+hfQjIgDTRAgDXkEdO9WalM/3BlTYD/GG156vi3jUZakiWQd+8izRf+9/7wRwC8jXuhqBPkza1mLuJzc6CUQzMkT+ZqABFowanzjPo9oduWWv2UJLJxbqTeYaMQTDLh+lEma647Vq6ee78Y+NcsY1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOYlOLNp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOYlOLNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735283176; x=1766819176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqdi0Tmiizx8AOh9mT558yDJ19A2jwS1opUr4I3tZiQ=;
  b=AOYlOLNpi+Pza6bw/DjaVzgCtVFnrHQ+00Y3BpU8BCjbH2N6ARmq9b3V
   fgTj0x0bzt23cCEj9jEzonyQnBax9osws2uc8MUN2HsIs+xx9ZYwEGcXi
   MfipFkG4Zsz5JZ3kpohd2TZYMBt00qgbPDlx0vPFTU0nFqC9jbAmmqiAa
   3vsEUYA1K+/KeykqAIKuj8NcJrHxRohoNP6900PSbxb2A3Fi9v86JwB/q
   g81sKTDeLxofmaAqoaMMmEevG5i1XA6OwH0oUHgvEPLn/8AcgEttdDhwg
   saWHQmqghHUUBd9DwFMjT3ekLC567iqqP5/VYyGMib8KVcHw/xPRcq/7k
   Q==;
X-CSE-ConnectionGUID: EGosx+huSwu+sCsol/k6PA==
X-CSE-MsgGUID: TuAJZPdiSZWCBxVTYJBYzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="34999620"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="34999620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 23:06:16 -0800
X-CSE-ConnectionGUID: qDB2hWpjRYmzBH8kqGu/Kg==
X-CSE-MsgGUID: n8A8POHBRgmYgi26EHlmJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123365322"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Dec 2024 23:06:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR4QG-00032w-2s;
	Fri, 27 Dec 2024 07:06:12 +0000
Date: Fri, 27 Dec 2024 15:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Message-ID: <202412271441.Mt4c7rFL-lkp@intel.com>
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
In-Reply-To: <20241227-bigtreetech-cb2-v3-2-91c556adcffe@gmail.com>
References: <20241227-bigtreetech-cb2-v3-2-91c556adcffe@gmail.com>
TO: Ivan Sergeev <ivan8215145640@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Ivan Sergeev <ivan8215145640@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4bbf9020becbfd8fc2c3da790855b7042fad455b]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Sergeev/dt-bindings-arm-rockchip-Add-BigTreeTech-CB2-and-Pi2/20241227-111114
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241227-bigtreetech-cb2-v3-2-91c556adcffe%40gmail.com
patch subject: [PATCH v3 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-randconfig-004-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271441.Mt4c7rFL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271441.Mt4c7rFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412271441.Mt4c7rFL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:821.3-15: Warning (reg_format): /mmc@fe2c0000/sdio-wifi@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: Warning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on default #address-cells value
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: Warning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:821.3-15: Warning (reg_format): /mmc@fe2c0000/sdio-wifi@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: Warning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on default #address-cells value
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: Warning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

vim +821 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi

9644ec4bcae76c Ivan Sergeev 2024-12-27  803  
9644ec4bcae76c Ivan Sergeev 2024-12-27  804  &sdmmc1 {
9644ec4bcae76c Ivan Sergeev 2024-12-27  805  	max-frequency = <150000000>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  806  	bus-width = <4>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  807  	disable-wp;
9644ec4bcae76c Ivan Sergeev 2024-12-27  808  	cap-sd-highspeed;
9644ec4bcae76c Ivan Sergeev 2024-12-27  809  	cap-sdio-irq;
9644ec4bcae76c Ivan Sergeev 2024-12-27  810  	keep-power-in-suspend;
9644ec4bcae76c Ivan Sergeev 2024-12-27  811  	mmc-pwrseq = <&sdio_pwrseq>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  812  	non-removable;
9644ec4bcae76c Ivan Sergeev 2024-12-27  813  	pinctrl-names = "default";
9644ec4bcae76c Ivan Sergeev 2024-12-27  814  	pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_cmd &sdmmc1_clk>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  815  	sd-uhs-sdr104;
9644ec4bcae76c Ivan Sergeev 2024-12-27  816  	status = "okay";
9644ec4bcae76c Ivan Sergeev 2024-12-27  817  	rockchip,default-sample-phase = <90>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  818  
9644ec4bcae76c Ivan Sergeev 2024-12-27 @819  	sdio-wifi@1 {
9644ec4bcae76c Ivan Sergeev 2024-12-27  820  		compatible = "brcm,bcm4329-fmac";
9644ec4bcae76c Ivan Sergeev 2024-12-27 @821  		reg = <0x1>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  822  		interrupt-parent = <&gpio2>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  823  		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  824  		interrupt-names = "host-wake";
9644ec4bcae76c Ivan Sergeev 2024-12-27  825  		pinctrl-names = "default";
9644ec4bcae76c Ivan Sergeev 2024-12-27  826  		pinctrl-0 = <&wifi_host_wake>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  827  		brcm,drive-strength = <10>;
9644ec4bcae76c Ivan Sergeev 2024-12-27  828  	};
9644ec4bcae76c Ivan Sergeev 2024-12-27  829  };
9644ec4bcae76c Ivan Sergeev 2024-12-27  830  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
