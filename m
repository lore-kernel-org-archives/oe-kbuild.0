Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E50C1F2C45
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735322538; cv=none; b=n3LDMF8tVGFslLwnkEeN855qtr3/Z+Ly8MTP6j3iTBk4iVlKkTx3Dw/2SBDP9/x60FaE1z71pYlfsBAW6E2YzPAUGFW6PsjrptEgwFOYaNduacOkLl0AlJfl6qCo9+kH1mexI8iAnoOa+KsEmExiryAXAKt/Z4gWza/ZGTi3UhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735322538; c=relaxed/simple;
	bh=Kxq1oTzE2MejcbztO3rmnNoe17uAktN7Lm5CakwxWzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2F4WqM5JTACJyiZH8b+d++0BW89+ThHqRkQQIe/nWdFEyK4Kn3DW6fHxV5Y5524OVvnJdAgUpFTzLxKBXt0PDcfL7SXKSstF3QZiZmX4n9/nwDqjsZJ8pDTEM8uAN2HoJsoBufUFA095EGZfSsjzZQLPUdnwMgPeIYb16+loFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNUZzQMi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNUZzQMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735322536; x=1766858536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kxq1oTzE2MejcbztO3rmnNoe17uAktN7Lm5CakwxWzs=;
  b=BNUZzQMiGcfqZx4kptp0GS7WhDAEmrqb9ov1k+Rj7rtUJcKNYpVaoTtB
   R7PXnlgbpuwB1y41S+Jj1sFJA55VkHW46MCjucrFW8VHjCJlVoFrsmip0
   s16EoO9IMpH9v59pGPvAa1HjfZC6UGtkeOmx4c6aH0Whe7e5eDoJv1GyZ
   P7S/CU6Ue+juaciQVg+G77G+cF2Jc1rNxiqg9Ofn//jHY5hApVNj6SXpC
   odSIWnts8njQ4lzDR0fkNz5g/3O1fO204aAAEJ7bX2oFJe9fLxIRaDYmC
   M2kd+Fcs9T8K53nlxrmVSOtLefHw3xZMww9z0OJeCboSworW6LDAabM5C
   A==;
X-CSE-ConnectionGUID: ie8xnl7FR+yE6zBEWh07Mw==
X-CSE-MsgGUID: y6Ri29ecTxSaPdezzfFCsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35883248"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35883248"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 10:02:14 -0800
X-CSE-ConnectionGUID: uhRrY/qoTBGCkf/HVmWZoA==
X-CSE-MsgGUID: LTr+Tn/OSjyVoYcuiQeTVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131182050"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 10:02:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tREf5-0003Pu-0c;
	Fri, 27 Dec 2024 18:02:11 +0000
Date: Sat, 28 Dec 2024 02:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Message-ID: <202412280123.6wg7cZ4X-lkp@intel.com>
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
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-004-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280123.6wg7cZ4X-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280123.6wg7cZ4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412280123.6wg7cZ4X-lkp@intel.com/

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
