Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4D3E5599
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777930205; cv=none; b=kI+T6AlvNwg4vjbC7uqHlmlgnG8GqndT/4FC8nHHw4wxMwj6NmgrjtT2yqcizKsyujgI6IllixARY5zPPiDiSVClrvmI7JGUul/owIw1QmbQ8ZpX16IiIbCgtaxKU02cz5s1DP8wB7y37Hf+fwpPJ1sKBeze73T96ejnik9grsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777930205; c=relaxed/simple;
	bh=8dKbm6qT0jp3Yl/sPSH7BZCvgKIRG+bpYe+xygUxVUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p+OI6l9+U6Ew/Fne570ZTcq8N16KSv08D10So2aVFTrjN9uZC+0X/nTlWijsfNejRCssExIIIuOicvzkHPLletfg+czTjKKARl7xt4DZVXKWZ1SbfEE5Zr+CbNf8bZfO0JkrlTY9FyHh0ueGXOuCeqNY7b+40hHCJxRBfQksZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4NOQCJG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4NOQCJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777930189; x=1809466189;
  h=date:from:to:cc:subject:message-id;
  bh=8dKbm6qT0jp3Yl/sPSH7BZCvgKIRG+bpYe+xygUxVUc=;
  b=B4NOQCJGo/F9S7wMta6nmtOEZbmLZzCyIOVGnr+WThod15sFWKaAXCcD
   ujuCzKNELqMJE27eERCNkwS7oWToR3P7UTd1PwRHL5ARZ8OToRXU13ZSk
   PGhPtqB79eDH2OocZkfyiTFa8Lo57CyPeMtKEaQIMbQYJIRAWGGetEXcD
   WEHeKjiXs7PF0i+T+RZuvtQSmAr6cYdgoJoQ7TFQYGM/cKiCdK/UvEfR6
   YaK1tdBaAeULdH8OHQ5ipZ3jPgj+s89vZ2Ngvyk0OPhbyZKdZ5p9rfQmD
   58HFrNm+C21Jw3QLCkhaIJidQnVv3ms4YgyTaUwgsn1Rf3fLxM9VOHJ9F
   w==;
X-CSE-ConnectionGUID: SeG7Uv89TVaTuUipVhatZA==
X-CSE-MsgGUID: zZ0W5CDST8yErSFCEM46Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89100247"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89100247"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 14:29:46 -0700
X-CSE-ConnectionGUID: GAC0CEnWRf6LYUIpIAGBMQ==
X-CSE-MsgGUID: Avd+zt7uSwWw2L3kbIakNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="265967070"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 May 2026 14:29:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK0rG-000000005yH-0qjq;
	Mon, 04 May 2026 21:29:42 +0000
Date: Mon, 04 May 2026 23:29:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml:235: example
 0: node name 'cpg_clocks' must use only [a-z0-9-]
Message-ID: <202605042351.f48kmaIh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml:235: example 0: node name 'cpg_clocks' must use only [a-z0-9-]"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Golle <daniel@makrotopia.org>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dt-bindings-misc-fsl-qoriq-mc-drop-trailing-whitespace/20260430-163453
head:   c553182e0670fe0fd68c50cf7dd3acf767475883
commit: 570758ea908d5c36820da86ff3265cea8b9f56f6 dt-bindings: wire example style check into dt_binding_check
date:   2 weeks ago
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-2051-20260430 (https://download.01.org/0day-ci/archive/20260504/202605042351.f48kmaIh-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042351.f48kmaIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605042351.f48kmaIh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   +    mmc-hs200-1_8v;
   +    mmc-ddr-1_8v;
   +    non-removable;
   +    no-sdio;
   +    no-sd;
   +    sprd,phy-delay-mmc-ddr52 = <0x3f 0x75 0x14 0x14>;
   +    sprd,phy-delay-mmc-hs200 = <0x0 0x8c 0x8c 0x8c>;
   +    sprd,phy-delay-mmc-hs400 = <0x44 0x7f 0x2e 0x2e>;
   +    sprd,phy-delay-mmc-hs400es = <0x3f 0x3f 0x2e 0x2e>;
   };
>> Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml:235: example 0: node name 'cpg_clocks' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml:235: example 0: label 'cpg_clocks' defined but never referenced
>> Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml:235: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml (original)
   +++ Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml (canonical)
   @@ -1,11 +1,12 @@
   #include <dt-bindings/clock/r8a7740-clock.h>
   +
   cpg_clocks: cpg_clocks@e6150000 {
   -        compatible = "renesas,r8a7740-cpg-clocks";
   -        reg = <0xe6150000 0x10000>;
   -        clocks = <&extal1_clk>, <&extal2_clk>, <&extalr_clk>;
   -        #clock-cells = <1>;
--
   reserved-memory@85fe0000 {
   +        compatible = "qcom,cmd-db";
   reg = <0x85fe0000 0x20000>;
   -        compatible = "qcom,cmd-db";
   no-map;
   };
   };
>> Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml:46: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml (canonical)
   @@ -1,16 +1,17 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
   +
   clock-controller@100000 {
   -  compatible = "qcom,sm8550-gcc";
   -  reg = <0x00100000 0x001f4200>;
   -  clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
   -           <&pcie0_phy>,
--
   +    pinctrl_usb_pwron: usb_pwron-pins {
   +        function = "usb_pwron";
   +        pins = "gpio13";
   +    };
   +
   +    pinctrl_wlan_wps_led: wlan_wps_led-pins {
   +        function = "wlan_wps_led";
   +        pins = "gpio12";
   +    };
   };
>> Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   nand-controller@43c30000 {
   compatible = "mxic,multi-itfc-v009-nand-controller";
   reg = <0x43c30000 0x10000>;
   Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml:48: example 0: label 'ad5696' defined but never referenced
   Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml:48: example 0: canonical form differs:
--
   nvmem-layout {
   compatible = "onie,tlv-layout";
>> Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml:94: example 0: label 'gpio' defined but never referenced
   Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml:79: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml (original)
   +++ Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml (canonical)
   @@ -1,12 +1,12 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   -  clock-frequency = <10>;
   -  timeout-sec = <8>;
   -  interrupts = <GIC_PPI 15 IRQ_TYPE_EDGE_RISING>;
   +    compatible = "qemu,vcpu-stall-detector";
   +    reg = <0x9030000 0x10000>;
   +    clock-frequency = <10>;
   +    timeout-sec = <8>;
   +    interrupts = <GIC_PPI 15 IRQ_TYPE_EDGE_RISING>;
   };
   Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml:51: example 0: label 'rng' defined but never referenced
>> Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml:68: example 0: label 'usb_hsphy' defined but never referenced
   Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml:68: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml (canonical)
   @@ -2,12 +2,10 @@
   compatible = "samsung,exynos2200-eusb2-phy";
   reg = <0x10ab0000 0x10000>;
   #phy-cells = <0>;
   -
   clocks = <&cmu_hsi0 7>,
   <&cmu_hsi0 5>,
--
   -  reg = <0x01680000 0x29080>;
   -  #interconnect-cells = <2>;
   -  clocks = <&gcc_prim_axi_clk>;
   -  qcom,bcm-voters = <&apps_bcm_voter>;
   +    compatible = "qcom,sar2130p-system-noc";
   +    reg = <0x01680000 0x29080>;
   +    #interconnect-cells = <2>;
   +    clocks = <&gcc_prim_axi_clk>;
   +    qcom,bcm-voters = <&apps_bcm_voter>;
   };
>> Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml (canonical)
   @@ -10,9 +10,9 @@
   };
--
   Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml:83: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml (original)
   +++ Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/clock/at91.h>
   +
   mmc@a0000000 {
   compatible = "atmel,sama5d2-sdhci";
   reg = <0xa0000000 0x300>;
>> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml:78: example 0: label 'nor_flash' defined but never referenced
>> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml:78: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml (original)
   +++ Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml (canonical)
   @@ -1,22 +1,22 @@
   #include <dt-bindings/clock/mt8173-clk.h>
--
   -  flash@0 {
   -    compatible = "spi-nand";
   -    reg = <0>;
   -  };
   +    flash@0 {
   +        compatible = "spi-nand";
   +        reg = <0>;
   +    };
   };
>> Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml (canonical)
   @@ -4,8 +4,8 @@
   #size-cells = <1>;
--
   +            #size-cells = <0>;
   +
   +            codec@1,0 {
   +                compatible = "slim217,1a0";
   +                reg = <1 0>;
   +            };
   };
   -      };
   };
   +};
>> Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml:42: example 0: label 'flash' defined but never referenced
   Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml:181: example 0: node name 'buck_vgpu' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml:181: example 0: node name 'ldo_vsram_gpu' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml:181: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml (canonical)
   @@ -10,7 +10,7 @@
   regulator-ramp-delay = <6250>;
   regulator-enable-ramp-delay = <200>;
   regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
   -                                   MT6397_BUCK_MODE_FORCE_PWM>;
--
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   gyro@0 {
   compatible = "adi,adxrs290";
   reg = <0>;
>> Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml:55: example 0: label 'clock' defined but never referenced
>> Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml:55: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml (original)
   +++ Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/exynos5250.h>
   +
   clock: clock-controller@10010000 {
   compatible = "samsung,exynos5250-clock";
   reg = <0x10010000 0x30000>;
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml:75: example 0: label 'wed0' defined but never referenced
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml:75: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml (original)
   +++ Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml (canonical)
   @@ -1,11 +1,13 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   soc {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   -  wed0: wed@1020a000 {
--
   +        compatible = "atmel,maxtouch";
   +        reg = <0x4a>;
   +        interrupt-parent = <&gpio>;
   +        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
   +        reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
   +        vdda-supply = <&ab8500_ldo_aux2_reg>;
   +        vdd-supply = <&ab8500_ldo_aux5_reg>;
   +        atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
   +    };
   };
>> Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml:74: example 0: label 'qspi' defined but never referenced
>> Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml:74: example 0: label 'soc' defined but never referenced
>> Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml:74: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml (original)
   +++ Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml (canonical)
   @@ -13,7 +13,7 @@
   interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
   clock-names = "iface", "core";
   clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
   -                     <&gcc GCC_QSPI_CORE_CLK>;
   +                 <&gcc GCC_QSPI_CORE_CLK>;
--
   +    compatible = "mediatek,mt8173-m4u";
   +    reg = <0x10205000 0x1000>;
   +    interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
   +    clocks = <&infracfg CLK_INFRA_M4U>;
   +    clock-names = "bclk";
   +    #iommu-cells = <1>;
   +    mediatek,infracfg = <&infracfg>;
   +    mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
   +                     <&larb3>, <&larb4>, <&larb5>;
   };
>> Documentation/devicetree/bindings/phy/marvell,armada-375-usb-cluster.yaml:36: example 0: label 'usbcluster' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml:48: example 0: label 'videocc' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml (canonical)
   @@ -1,15 +1,16 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
   #include <dt-bindings/power/qcom-rpmpd.h>
   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
   +
   videocc: clock-controller@abf0000 {
--
   -      spi-rx-bus-width = <2>;
   +        flash@0 {
   +            compatible = "spi-nand";
   +            reg = <0>;
   +            spi-tx-bus-width = <1>;
   +            spi-rx-bus-width = <2>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml (canonical)
   @@ -1,16 +1,17 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
   #include <dt-bindings/clock/qcom,qcs615-gcc.h>
   +
   clock-controller@af00000 {
   -  compatible = "qcom,qcs615-dispcc";
   -  reg = <0x0af00000 0x20000>;
   -  clocks = <&rpmhcc RPMH_CXO_CLK>,
--
   +++ Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml (canonical)
   @@ -1,7 +1,7 @@
   ocotp: efuse@8002c000 {
   compatible = "fsl,imx28-ocotp", "fsl,ocotp";
   +    reg = <0x8002c000 0x2000>;
   #address-cells = <1>;
   #size-cells = <1>;
   -    reg = <0x8002c000 0x2000>;
   clocks = <&clks 25>;
   };
>> Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml:188: example 0: label 'rtc' defined but never referenced
   Documentation/devicetree/bindings/iio/imu/bosch,bno055.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/bosch,bno055.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/bosch,bno055.yaml (canonical)
   @@ -1,8 +1,9 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   serial {
   -  imu {
   -    compatible = "bosch,bno055";
   -    reset-gpios = <&gpio0 54 GPIO_ACTIVE_LOW>;
--
   -        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
   -        resets = <&cpg 106>;
   +    compatible = "renesas,jpu-r8a7790", "renesas,rcar-gen2-jpu";
   +    reg = <0xfe980000 0x10300>;
   +    interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
   +    clocks = <&cpg CPG_MOD 106>;
   +    power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
   +    resets = <&cpg 106>;
   };
   Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml:40: example 0: label 'gcr' defined but never referenced
>> Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml (original)
   +++ Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml (canonical)
   @@ -1,11 +1,11 @@
   gcr: syscon@800000 {
   -  compatible = "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
   -  reg = <0x800000 0x1000>;
   +    compatible = "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
   +    reg = <0x800000 0x1000>;
--
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>,
   +                 <27 IRQ_TYPE_LEVEL_LOW>;
   };
>> Documentation/devicetree/bindings/power/supply/bq25890.yaml:104: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/supply/bq25890.yaml (original)
   +++ Documentation/devicetree/bindings/power/supply/bq25890.yaml (canonical)
   @@ -1,24 +1,22 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   +    compatible = "brcm,iproc-sba-v2";
   +    mboxes = <&raid_mbox 0 0x1 0xffff>,
   +             <&raid_mbox 1 0x1 0xffff>,
   +             <&raid_mbox 2 0x1 0xffff>,
   +             <&raid_mbox 3 0x1 0xffff>,
   +             <&raid_mbox 4 0x1 0xffff>,
   +             <&raid_mbox 5 0x1 0xffff>,
   +             <&raid_mbox 6 0x1 0xffff>,
   +             <&raid_mbox 7 0x1 0xffff>;
   };
>> Documentation/devicetree/bindings/mtd/ti,elm.yaml:68: example 0: label 'elm' defined but never referenced
   Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml:70: example 0: label 'wdma0' defined but never referenced
   Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml:105: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml (original)
   +++ Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml (canonical)
   @@ -11,11 +11,9 @@
   clock-names = "hdmi", "parent";
   resets = <&tegra_car 51>;
   reset-names = "hdmi";
   -
   hdmi-supply = <&vdd_5v0_hdmi>;
   pll-supply = <&vdd_hdmi_pll>;
   vdd-supply = <&vdd_3v3_hdmi>;
   -
   nvidia,ddc-i2c-bus = <&hdmi_ddc>;
   nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
   };
   Documentation/devicetree/bindings/sound/mscc,zl38060.yaml:58: example 0: label 'codec' defined but never referenced
>> Documentation/devicetree/bindings/sound/mscc,zl38060.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/mscc,zl38060.yaml (original)
   +++ Documentation/devicetree/bindings/sound/mscc,zl38060.yaml (canonical)
   @@ -1,14 +1,15 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
--
   clock-controller@d4282800 {
   -  compatible = "marvell,pxa1908-apmu", "syscon";
   -  reg = <0xd4282800 0x400>;
   -  #clock-cells = <1>;
   -  #power-domain-cells = <1>;
   +    compatible = "marvell,pxa1908-apmu", "syscon";
   +    reg = <0xd4282800 0x400>;
   +    #clock-cells = <1>;
   +    #power-domain-cells = <1>;
   };
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'BUCK1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'BUCK2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'BUCK3' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'BUCK4' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'BUCK5' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'BUCK6' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'BUCK7' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'LDO1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'LDO2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'LDO3' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'LDO4' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'LDO5' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'LDO6' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: node name 'LDO7' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'buck1' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'buck2' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'buck3' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'buck4' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'buck5' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'buck6' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'buck7' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'ldo1' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'ldo2' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'ldo3' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'ldo4' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'ldo5' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'ldo6' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'ldo7_reg' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: label 'pmic' defined but never referenced
   Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml:66: example 0: label 'deinterlace' defined but never referenced
   Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml (original)
   +++ Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml (canonical)
   @@ -8,13 +8,10 @@
   s3fwrn5@27 {
   compatible = "samsung,s3fwrn5-i2c";
   reg = <0x27>;
   -
   interrupt-parent = <&gpa1>;
--
   -
   -                regulator-state-standby {
   -                    regulator-on-in-suspend;
   -                };
   -
   -                regulator-state-mem {
   -                    regulator-off-in-suspend;
   +                    regulator-mode = <4>;
   };
   };
>> };Documentation/devicetree/bindings/sound/maxim,max9867.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/maxim,max9867.yaml (original)
   +++ Documentation/devicetree/bindings/sound/maxim,max9867.yaml (canonical)
   @@ -1,10 +1,11 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   codec@18 {
   compatible = "maxim,max9867";
   +        reg = <0x18>;
--
   -    vdd-io-supply = <&vreg>;
   -  };
   +    haptic-driver@34 {
   +        compatible = "cirrus,cs40l50";
   +        reg = <0x34>;
   +        interrupt-parent = <&gpio>;
   +        interrupts = <113 IRQ_TYPE_LEVEL_LOW>;
   +        reset-gpios = <&gpio 112 GPIO_ACTIVE_LOW>;
   +        vdd-io-supply = <&vreg>;
   +    };
>> };Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml:98: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml (canonical)
   @@ -1,24 +1,38 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/leds/common.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
--
   -      #address-cells = <1>;
   -      #size-cells = <0>;
   -
   -      logicvc_output: endpoint@0 {
   -        reg = <0>;
   -        remote-endpoint = <&panel_input>;
   -      };
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml:162: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/mtd-physmap.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/mtd-physmap.yaml (canonical)
   @@ -1,21 +1,20 @@
   -
   flash@ff000000 {
   compatible = "cfi-flash";
   reg = <0xff000000 0x01000000>;
   +    ranges = <0 0xff000000 0x01000000>;
   bank-width = <4>;
   device-width = <1>;
--
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:332: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (canonical)
   @@ -1,12 +1,11 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   thermal-sensor {
   compatible = "qcom,ipq8064-tsens";
   -
   nvmem-cells = <&tsens_calib>, <&tsens_calib_backup>;
   nvmem-cell-names = "calib", "calib_backup";
   interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-names = "uplow";
   -
   +    #thermal-sensor-cells = <1>;
   #qcom,sensors = <11>;
   -    #thermal-sensor-cells = <1>;
   };
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:346: example 1: label 'data' defined but never referenced
   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:346: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (canonical)
   @@ -1,17 +1,17 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   // Example 1 (new calibration data: for pre v1 IP):
   thermal-sensor@4a9000 {
   compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
   reg = <0x4a9000 0x1000>, /* TM */
--
   "s4_p1", "s4_p2",
   "s5_p1", "s5_p2";
   -
   interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-names = "uplow";
   -
   +    #thermal-sensor-cells = <1>;
   #qcom,sensors = <5>;
   -    #thermal-sensor-cells = <1>;
   };
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:376: example 2: label 'legacy' defined but never referenced
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:376: example 2: label 'tsens1' defined but never referenced
   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:376: example 2: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (canonical)
   @@ -1,16 +1,14 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   // Example 1 (legacy: for pre v1 IP):
   tsens1: thermal-sensor@4a9000 {
   compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
   reg = <0x4a9000 0x1000>, /* TM */
--
   +          nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
   nvmem-cell-names = "calib", "calib_sel";
   -
   interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-names = "uplow";
   -
   +    #thermal-sensor-cells = <1>;
   #qcom,sensors = <5>;
   -    #thermal-sensor-cells = <1>;
   };
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:394: example 3: label 'tsens2' defined but never referenced
   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:394: example 3: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (canonical)
   @@ -1,16 +1,14 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   // Example 2 (for any platform containing v1 of the TSENS IP):
   tsens2: thermal-sensor@4a9000 {
   compatible = "qcom,qcs404-tsens", "qcom,tsens-v1";
   reg = <0x004a9000 0x1000>, /* TM */
--
   -  gpio-controller;
   -  #gpio-cells = <2>;
   -  interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
   +    compatible = "hisilicon,ascend910-gpio";
   +    reg = <0x840d0000 0x1000>;
   +    ngpios = <32>;
   +    gpio-controller;
   +    #gpio-cells = <2>;
   +    interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
   };
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:412: example 4: label 'tsens3' defined but never referenced
   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:412: example 4: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (canonical)
   @@ -1,14 +1,13 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   // Example 3 (for any platform containing v2 of the TSENS IP):
   tsens3: thermal-sensor@c263000 {
   compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
   reg = <0xc263000 0x1ff>,
   <0xc222000 0x1ff>;
   -
   interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
   <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-names = "uplow", "critical";
   -
   +    #thermal-sensor-cells = <1>;
   #qcom,sensors = <13>;
   -    #thermal-sensor-cells = <1>;
   };
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:428: example 5: label 'tsens4' defined but never referenced
   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:428: example 5: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qcom-tsens.yaml (canonical)
   @@ -1,13 +1,12 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   // Example 4 (for any IPQ8074 based SoC-s):
   tsens4: thermal-sensor@4a9000 {
   compatible = "qcom,ipq8074-tsens";
   reg = <0x4a9000 0x1000>,
--
   -               <&scmi_clk KEEM_BAY_PSS_SD0>;
   -      arasan,soc-ctl-syscon = <&sd0_phy_syscon>;
   +    compatible = "intel,keembay-sdhci-5.1-sd";
   +    reg = <0x31000000 0x300>;
   +    interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
   +    clock-names = "clk_xin", "clk_ahb";
   +    clocks = <&scmi_clk KEEM_BAY_PSS_AUX_SD0>,
   +             <&scmi_clk KEEM_BAY_PSS_SD0>;
   +    arasan,soc-ctl-syscon = <&sd0_phy_syscon>;
   };
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: label 'clkout_clk' defined but never referenced
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: label 'prcc_kclk' defined but never referenced
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: label 'prcc_pclk' defined but never referenced
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: label 'prcc_reset' defined but never referenced
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: label 'prcmu_clk' defined but never referenced
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: label 'rtc_clk' defined but never referenced
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: label 'smp_twd_clk' defined but never referenced
>> Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml:144: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml (original)
   +++ Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml (canonical)
   @@ -1,35 +1,36 @@
   #include <dt-bindings/clock/ste-db8500-clkout.h>
   +
   clocks@8012 {
   -  compatible = "stericsson,u8500-clks";
   -  reg = <0x8012f000 0x1000>, <0x8011f000 0x1000>,
   -        <0x8000f000 0x1000>, <0xa03ff000 0x1000>,
   -        <0xa03cf000 0x1000>;
--
   flx0: flexcom@f8034000 {
   compatible = "atmel,sama5d2-flexcom";
   reg = <0xf8034000 0x200>;
   +    ranges = <0x0 0xf8034000 0x800>;
   clocks = <&flx0_clk>;
   #address-cells = <1>;
   #size-cells = <1>;
   -    ranges = <0x0 0xf8034000 0x800>;
   atmel,flexcom-mode = <2>;
   };
>> Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml (canonical)
   @@ -1,9 +1,9 @@
   clock-controller@300000 {
   -  compatible = "qcom,gcc-msm8994";
   -  reg = <0x00300000 0x90000>;
   -  clocks = <&xo_board>, <&sleep_clk>;
   -  clock-names = "xo", "sleep";
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
--
   -  };
   +    #address-cells = <1>;
   +    #size-cells = <0>;
   +
   +    pressure@40 {
   +        compatible = "sensirion,sdp500";
   +        reg = <0x40>;
   +        vdd-supply = <&foo>;
   +    };
   };
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml:266: example 1: label 'part1' defined but never referenced
   Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml:266: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml (original)
   +++ Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml (canonical)
   @@ -1,46 +1,46 @@
   interrupt-controller@2c010000 {
   -  compatible = "arm,gic-v3";
   -  #interrupt-cells = <4>;
   -  #address-cells = <1>;
   -  #size-cells = <1>;
   -  ranges;
--
   -
   -        vddio-pex-ctl-supply = <&vdd_1v8ao>;
   -        vpcie3v3-supply = <&vdd_3v3_pcie>;
   -        vpcie12v-supply = <&vdd_12v_pcie>;
   -
   -        phys = <&p2u_hsio_2>, <&p2u_hsio_3>, <&p2u_hsio_4>,
   -               <&p2u_hsio_5>;
   -        phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
   };
   };
>> Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml:48: example 0: label 'hbmc' defined but never referenced
>> Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml (canonical)
   @@ -8,7 +8,7 @@
   <0x5 0x00000000 0x1 0x0000000>;
   ranges = <0x0 0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
   <0x1 0x0 0x5 0x04000000 0x4000000>; /* CS1 - 64MB */
   -        clocks = <&k3_clks 102 0>;
   +                 clocks = <&k3_clks 102 0>;
   #address-cells = <2>;
   #size-cells = <1>;
--
   -                pinmux = <RZA2_PINMUX(PORT9, 0, 4)>, /* TxD4 */
   -                         <RZA2_PINMUX(PORT9, 1, 4)>; /* RxD4 */
   -        };
   +    /* Serial Console */
   +    scif4_pins: serial4 {
   +        pinmux = <RZA2_PINMUX(PORT9, 0, 4)>, /* TxD4 */
   +                 <RZA2_PINMUX(PORT9, 1, 4)>; /* RxD4 */
   +                 };
   +    };
   };
>> Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml:48: example 0: label 'kryocc' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml (canonical)
   @@ -2,7 +2,6 @@
   compatible = "qcom,msm8996-apcc";
   reg = <0x6400000 0x90000>;
   #clock-cells = <1>;
   -
   clocks = <&xo_board>, <&apcs_glb>;
   clock-names = "xo", "sys_apcs_aux";
--
   --- Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml (canonical)
   @@ -13,7 +13,6 @@
   compatible = "renesas,raa215300";
   reg = <0x12>, <0x6f>;
   reg-names = "main", "rtc";
   -
   clocks = <&x2>;
   clock-names = "xin";
   };
>> Documentation/devicetree/bindings/mtd/ingenic,nand.yaml:63: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/ingenic,nand.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/ingenic,nand.yaml (canonical)
   @@ -1,44 +1,38 @@
   #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
   +
   memory-controller@13410000 {
   compatible = "ingenic,jz4780-nemc";
   reg = <0x13410000 0x10000>;
   -    #address-cells = <2>;
   -    #size-cells = <1>;
--
   Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml (original)
   +++ Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml (canonical)
   @@ -1,4 +1,4 @@
   codec_analog: codec-analog@1f015c0 {
   -  compatible = "allwinner,sun8i-h3-codec-analog";
   -  reg = <0x01f015c0 0x4>;
   +    compatible = "allwinner,sun8i-h3-codec-analog";
   +    reg = <0x01f015c0 0x4>;
   };
>> Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml (original)
   +++ Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml (canonical)
   @@ -1,7 +1,7 @@
   dma-router@a0 {
   -  compatible = "renesas,rzn1-dmamux";
   -  reg = <0xa0 4>;
   -  #dma-cells = <6>;
   -  dma-masters = <&dma0 &dma1>;
   -  dma-requests = <32>;
   +    compatible = "renesas,rzn1-dmamux";
--
   };
   };
   -
   -        haptic {
   -            compatible = "maxim,max77705-haptic";
   -            haptic-supply = <&vib_regulator>;
   -            pwms = <&vib_pwm 0 50000>;
   -        };
   };
   };
>> Documentation/devicetree/bindings/phy/rockchip,rk3399-emmc-phy.yaml:57: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,rk3399-emmc-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,rk3399-emmc-phy.yaml (canonical)
   @@ -1,8 +1,8 @@
   phy@f780 {
   -  compatible = "rockchip,rk3399-emmc-phy";
   -  reg = <0xf780 0x20>;
   -  clocks = <&sdhci>;
   -  clock-names = "emmcclk";
   -  drive-impedance-ohm = <50>;
   -  #phy-cells = <0>;
--
   +        compatible = "microchip,lan8651", "microchip,lan8650";
   +        reg = <0>;
   +        pinctrl-names = "default";
   +        pinctrl-0 = <&eth0_pins>;
   +        interrupt-parent = <&gpio>;
   +        interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
   +        local-mac-address = [04 05 06 01 02 03];
   +        spi-max-frequency = <15000000>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml:87: example 0: label 'usbphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml:87: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml (canonical)
   @@ -3,10 +3,10 @@
   #include <dt-bindings/reset/sun4i-a10-ccu.h>
--
   uart3: serial@20a90000 {
   -  compatible = "rda,8810pl-uart";
   -  reg = <0x20a90000 0x1000>;
   -  interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
   -  clocks = <&uart_clk>;
   +    compatible = "rda,8810pl-uart";
   +    reg = <0x20a90000 0x1000>;
   +    interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
   +    clocks = <&uart_clk>;
   };
>> Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml:55: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml (original)
   +++ Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml (canonical)
   @@ -1,48 +1,54 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/usb/pd.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
--
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -7,7 +8,6 @@
   pmic@4b {
   compatible = "mps,mp2629";
   reg = <0x4b>;
   -
   interrupt-controller;
   interrupt-parent = <&gpio2>;
   #interrupt-cells = <2>;
>> Documentation/devicetree/bindings/phy/cdns,dphy.yaml:48: example 0: label 'dphy0' defined but never referenced
>> Documentation/devicetree/bindings/phy/cdns,dphy.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/cdns,dphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/cdns,dphy.yaml (canonical)
   @@ -1,6 +1,6 @@
   #include <dt-bindings/soc/ti,sci_pm_domain.h>
--
   +    enable-gpios = <&gpio0 23 0x4>;
   +    gpios = <&gpio0 24 0x4
   +            &gpio0 25 0x4>;
   +    states = <1800000 0x3>,
   +             <2200000 0x2>,
   +             <2600000 0x1>,
   +             <2900000 0x0>;
   +    startup-delay-us = <100000>;
   +    enable-active-high;
   };
>> Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml (canonical)
   @@ -1,14 +1,13 @@
   +};
   flash@fc000000 {
   compatible = "st,spear600-smi";
   +    reg = <0xfc000000 0x1000>;
   +    reg = <0xfc000000 0x1000>;
   #address-cells = <1>;
   #size-cells = <1>;
--
   -  #power-domain-cells = <1>;
   +    compatible = "qcom,sm4450-camcc";
   +    reg = <0x0ade0000 0x20000>;
   +    clocks = <&rpmhcc RPMH_CXO_CLK>,
   +             <&gcc GCC_CAMERA_AHB_CLK>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    #power-domain-cells = <1>;
   };
   Documentation/devicetree/bindings/mtd/mxicy,nand-ecc-engine.yaml:33: example 0: label 'spi_controller0' defined but never referenced
>> Documentation/devicetree/bindings/iio/adc/envelope-detector.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/envelope-detector.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/envelope-detector.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dpot: dpot@28 {
--
   +    adc {
   +    };
   +
   tsc {
   };
   -
   -    adc {
   -    };
   };
>> Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml:105: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml (canonical)
   @@ -1,13 +1,15 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  touchscreen@1c {
--
   gpio@0 {
   compatible = "cznic,moxtet-gpio";
   +            reg = <0>;
   gpio-controller;
   #gpio-cells = <2>;
   -            reg = <0>;
   };
   };
   };
>> Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml:133: example 0: label 'nfc' defined but never referenced
>> Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml:133: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml (canonical)
   @@ -1,31 +1,30 @@
   #include <dt-bindings/clock/rk3308-cru.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   nfc: nand-controller@ff4b0000 {
   -  compatible = "rockchip,rk3308-nfc",
   -               "rockchip,rv1108-nfc";
   -  reg = <0xff4b0000 0x4000>;
--
   +    dma-requests = <16>;
   +    dma-masters = <4>;
   +    #dma-cells = <3>;
   +    chan_allocation_order = <1>;
   +    chan_priority = <1>;
   +    block_size = <0xfff>;
   +    data-width = <8 8>;
   +    multi-block = <0 0 0 0 0 0 0 0>;
   +    snps,max-burst-len = <16 16 4 4 4 4 4 4>;
   };
>> Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:244: example 0: label 'xhci' defined but never referenced
>> Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:244: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml (original)
   +++ Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml (canonical)
   @@ -8,6 +8,7 @@
   compatible = "mediatek,mt8173-mtu3", "mediatek,mtu3";
   reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
   reg-names = "mac", "ippc";
   +    ranges;
   interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
   phys = <&phy_port0 PHY_TYPE_USB3>, <&phy_port1 PHY_TYPE_USB2>;
   power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
--
   xhci: usb@11270000 {
   compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
>> Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:283: example 1: label 'host0' defined but never referenced
   Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:283: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml (original)
   +++ Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml (canonical)
   @@ -5,6 +5,7 @@
   compatible = "mediatek,mt2712-mtu3", "mediatek,mtu3";
   reg = <0x112c1000 0x3000>, <0x112d0700 0x0100>;
   reg-names = "mac", "ippc";
   +    ranges;
   interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_LOW>;
   phys = <&u2port2 PHY_TYPE_USB2>;
--
   host0: usb@11270000 {
   compatible = "mediatek,mt2712-xhci", "mediatek,mtk-xhci";
>> Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:321: example 2: label 'host' defined but never referenced
>> Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:321: example 2: label 'usb_role_sw' defined but never referenced
   Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:321: example 2: canonical form differs:
   --- Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml (original)
   +++ Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml (canonical)
   @@ -2,18 +2,18 @@
   compatible = "mediatek,mt8183-mtu3", "mediatek,mtu3";
   reg = <0x11201000 0x2e00>, <0x11203e00 0x0100>;
   reg-names = "mac", "ippc";
   +    ranges;
   interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
   phys = <&u2port0 PHY_TYPE_USB2>;
--
   channel@0 {
   reg = <0x0>;
>> Documentation/devicetree/bindings/spi/omap-spi.yaml:103: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/omap-spi.yaml (original)
   +++ Documentation/devicetree/bindings/spi/omap-spi.yaml (canonical)
   @@ -3,13 +3,13 @@
   #include <dt-bindings/soc/ti,sci_pm_domain.h>
--
   +++ Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-mbus-clk.yaml (canonical)
   @@ -1,7 +1,7 @@
   clk@1c2015c {
   -    #clock-cells = <0>;
   compatible = "allwinner,sun8i-a23-mbus-clk";
   reg = <0x01c2015c 0x4>;
   +    #clock-cells = <0>;
   clocks = <&osc24M>, <&pll6 1>, <&pll5>;
   clock-output-names = "mbus";
   };
>> Documentation/devicetree/bindings/net/marvell,dfx-server.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/marvell,dfx-server.yaml (original)
   +++ Documentation/devicetree/bindings/net/marvell,dfx-server.yaml (canonical)
   @@ -1,5 +1,5 @@
   +#define MBUS_ID(target,attributes) (((target) << 24) | ((attributes) << 16))
--
   irqc0: interrupt-controller@e61c0000 {
   compatible = "renesas,irqc-r8a7790", "renesas,irqc";
   +    reg = <0xe61c0000 0x200>;
   #interrupt-cells = <2>;
   interrupt-controller;
   -    reg = <0xe61c0000 0x200>;
   interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
   <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
   <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>> Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml:152: example 0: label 'nand_controller' defined but never referenced
>> Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml:152: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   nand_controller: nand-controller@d0000 {
   compatible = "marvell,armada370-nand-controller";
   reg = <0xd0000 0x54>;
   @@ -12,10 +13,10 @@
   label = "main-storage";
--
   partition@0 {
   +                reg = <0x00000000 0x40000000>;
   label = "Rootfs";
   -                reg = <0x00000000 0x40000000>;
   };
   };
   };
>> Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml:185: example 1: label 'cp0_nand_controller' defined but never referenced
   Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml:185: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml (canonical)
   @@ -1,6 +1,6 @@
   cp0_nand_controller: nand-controller@720000 {
   compatible = "marvell,armada-8k-nand-controller",
   -            "marvell,armada370-nand-controller";
   +                 "marvell,armada370-nand-controller";
   reg = <0x720000 0x54>;
   #address-cells = <1>;
--
   /* The GPIO pin connect to 16 consecutive CUI bits */
   interrupts = <0 16>, <0 17>, <0 18>, <0 19>,
   -                    <0 20>, <0 21>, <0 22>, <0 23>,
   -                    <0 24>, <0 25>, <0 26>, <0 27>,
   -                    <0 28>, <0 29>, <0 30>, <0 31>;
   +                     <0 20>, <0 21>, <0 22>, <0 23>,
   +                     <0 24>, <0 25>, <0 26>, <0 27>,
   +                     <0 28>, <0 29>, <0 30>, <0 31>;
   };
   };
>> Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml (original)
   +++ Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml (canonical)
   @@ -7,11 +7,11 @@
   "LINPUT1", "AMIC",
   "RINPUT1", "AMIC";
--
   rpmhcc: clock-controller {
   -  compatible = "qcom,sdm845-rpmh-clk";
   -  clocks = <&xo_board>;
   -  clock-names = "xo";
   -  #clock-cells = <1>;
   +    compatible = "qcom,sdm845-rpmh-clk";
   +    clocks = <&xo_board>;
   +    clock-names = "xo";
   +    #clock-cells = <1>;
   };
>> Documentation/devicetree/bindings/phy/hisilicon,phy-hi3670-pcie.yaml:62: example 0: label 'pcie_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/hisilicon,phy-hi3670-pcie.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/hisilicon,phy-hi3670-pcie.yaml (original)
   +++ Documentation/devicetree/bindings/phy/hisilicon,phy-hi3670-pcie.yaml (canonical)
   @@ -1,21 +1,22 @@
   #include <dt-bindings/clock/hi3670-clock.h>
--
>> Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml:48: example 0: label 'bch' defined but never referenced
   Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml:117: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml (original)
   +++ Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml (canonical)
   @@ -3,18 +3,16 @@
   #size-cells = <2>;
--
   compatible = "galaxycore,gc08a3";
   reg = <0x31>;
   -
   clocks = <&gc08a3_clk>;
   -
   reset-gpios = <&pio 19 GPIO_ACTIVE_LOW>;
   -
   avdd-supply = <&gc08a3_avdd>;
   dovdd-supply = <&gc08a3_dovdd>;
   dvdd-supply = <&gc08a3_dvdd>;
>> Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml:108: example 0: label 'hdmi_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml:108: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml (canonical)
   @@ -1,12 +1,13 @@
   #include <dt-bindings/clock/mt8173-clk.h>
   +
   hdmi_phy: hdmi-phy@10209100 {
   compatible = "mediatek,mt8173-hdmi-phy";
   reg = <0x10209100 0x24>;
   clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
   clock-names = "pll_ref";
--
   +                          <&cpu2_intc 9>,
   +                          <&cpu3_intc 9>,
   +                          <&cpu4_intc 9>;
   +    #interrupt-cells = <0>;
   +    msi-controller;
   +    #msi-cells = <0>;
   +    riscv,num-ids = <127>;
   +    riscv,group-index-bits = <1>;
   +    riscv,group-index-shift = <24>;
   };
>> Documentation/devicetree/bindings/phy/marvell,mmp3-usb-phy.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/marvell,mmp3-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/marvell,mmp3-usb-phy.yaml (canonical)
   @@ -1,5 +1,5 @@
   usb-phy@d4207000 {
   -  compatible = "marvell,mmp3-usb-phy";
   -  reg = <0xd4207000 0x40>;
   -  #phy-cells = <0>;
   +    compatible = "marvell,mmp3-usb-phy";
   +    reg = <0xd4207000 0x40>;
   +    #phy-cells = <0>;
--
   #include <dt-bindings/clock/stm32mp1-clks.h>
   +
   crc@40023000 {
   -  compatible = "st,stm32f7-crc";
   -  reg = <0x40023000 0x400>;
   -  clocks = <&rcc 0 12>;
   +    compatible = "st,stm32f7-crc";
   +    reg = <0x40023000 0x400>;
   +    clocks = <&rcc 0 12>;
   };
>> Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml (canonical)
   @@ -7,7 +7,6 @@
   touchscreen@10 {
   compatible = "elan,ekth3500";
   reg = <0x10>;
   -
   interrupt-parent = <&gpio4>;
   interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
   wakeup-source;
--
   -
   -  interrupt-parent = <&cpuintc>;
   -  interrupts = <2>;
   +    compatible = "ralink,rt2880-intc";
   +    reg = <0x200 0x100>;
   +    interrupt-controller;
   +    #interrupt-cells = <1>;
   +    interrupt-parent = <&cpuintc>;
   +    interrupts = <2>;
   };
>> Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml:245: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml (canonical)
   @@ -5,10 +5,8 @@
   remoteproc@30000000 {
   compatible = "qcom,sm8550-adsp-pas";
   reg = <0x030000000 0x100>;
   -
   clocks = <&rpmhcc RPMH_CXO_CLK>;
   clock-names = "xo";
   -
--
   -  reg = <0x54001000 0x400>;
   -  interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
   -  clocks = <&rcc CRYP1>;
   -  resets = <&rcc CRYP1_R>;
   +    compatible = "st,stm32mp1-cryp";
   +    reg = <0x54001000 0x400>;
   +    interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
   +    clocks = <&rcc CRYP1>;
   +    resets = <&rcc CRYP1_R>;
   };
>> Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml:60: example 0: label 'panel_in' defined but never referenced
   Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml (original)
   +++ Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml (canonical)
   @@ -1,29 +1,30 @@
   #include <dt-bindings/gpio/gpio.h>
--
   };
   Documentation/devicetree/bindings/serial/brcm,bcm2835-aux-uart.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/brcm,bcm2835-aux-uart.yaml (original)
   +++ Documentation/devicetree/bindings/serial/brcm,bcm2835-aux-uart.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/bcm2835-aux.h>
   +
   serial@7e215040 {
   compatible = "brcm,bcm2835-aux-uart";
   reg = <0x7e215040 0x40>;
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK3' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK4' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK5' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK6' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK7' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'BUCK8' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'LDO1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'LDO2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'LDO3' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'LDO4' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'LDO5' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'LDO6' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: node name 'LDO7' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck1' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck2' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck3' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck4' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck5' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck6' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck7' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'buck8' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'ldo1' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'ldo2' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'ldo3' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'ldo4' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'ldo5' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'ldo6' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'ldo7_reg' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: label 'pmic' defined but never referenced
>> Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml:128: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml (canonical)
   @@ -4,6 +4,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pmic: pmic@4b {
   compatible = "rohm,bd71837";
   reg = <0x4b>;
--
   opp-microvolt-slow = <915000 900000 925000>, /* Supply vcc0 */
   <925000 910000 935000>; /* Supply vcc1 */
   -        opp-microvolt-fast = <975000 970000 985000>, /* Supply vcc0 */
   +                             opp-microvolt-fast = <975000 970000 985000>, /* Supply vcc0 */
   <965000 960000 975000>; /* Supply vcc1 */
   -        opp-microamp =  <70000>; /* Will be used for both slow/fast */
   +                             opp-microamp =  <70000>; /* Will be used for both slow/fast */
   +                             };
   };
   };
>> Documentation/devicetree/bindings/phy/marvell,berlin2-usb-phy.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/marvell,berlin2-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/marvell,berlin2-usb-phy.yaml (canonical)
   @@ -1,6 +1,6 @@
   usb-phy@f774000 {
   -  compatible = "marvell,berlin2-usb-phy";
   -  reg = <0xf774000 0x128>;
   -  #phy-cells = <0>;
   -  resets = <&chip 0x104 14>;
   +    compatible = "marvell,berlin2-usb-phy";
   +    reg = <0xf774000 0x128>;
--
   memory-controller {
   #address-cells = <2>;
   #size-cells = <1>;
   +
   ethernet@1,0 {
   compatible = "micrel,ks8851-mll";
   reg = <1 0x0 0x2>, <1 0x2 0x20000>;
   Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml:140: example 1: label 'comphy0' defined but never referenced
   Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml:140: example 1: label 'comphy1' defined but never referenced
   Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml:140: example 1: label 'comphy2' defined but never referenced
>> Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml:135: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml (canonical)
   @@ -7,35 +7,27 @@
   remoteproc@30000000 {
   compatible = "qcom,sa8775p-adsp-pas";
   reg = <0x30000000 0x100>;
   -
   interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
   <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
   <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
--
   -  };
   +    #address-cells = <3>;
   +    #size-cells = <2>;
   +
   +    wifi@0,0 {
   +        reg = <0x0000 0 0 0 0>;
   +        ieee80211-freq-limit = <2402000 2482000>,
   +                               <5170000 5250000>;
   +    };
   };
>> Documentation/devicetree/bindings/edac/dmc-520.yaml:56: example 0: label 'dmc0' defined but never referenced
   Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml:85: example 0: label 'crypto' defined but never referenced
   Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml (canonical)
   @@ -1,4 +1,4 @@
   regulator@162f000 {
   -  compatible = "qcom,sm8250-refgen-regulator";
   -  reg = <0x0162f000 0x84>;
   +    compatible = "qcom,sm8250-refgen-regulator";
   +    reg = <0x0162f000 0x84>;
   };
>> Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml:129: example 0: label 'i2c5_pins' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml:129: example 0: label 'padctrl0_apsys' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml:129: example 0: label 'padctrl1_apsys' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml:129: example 0: label 'uart0_pins' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml:129: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml (canonical)
   @@ -5,6 +5,16 @@
   thead,pad-group = <3>;
--
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -6,7 +7,6 @@
   light-sensor@4a {
   compatible = "maxim,max44009";
   reg = <0x4a>;
   -
   interrupt-parent = <&gpio1>;
   interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
   };
>> Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml:81: example 0: label 'v2m_led_gpios' defined but never referenced
>> Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml:81: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml (original)
   +++ Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml (canonical)
   @@ -1,9 +1,9 @@
   sysreg@0 {
   compatible = "arm,vexpress-sysreg";
   reg = <0x00000 0x1000>;
   +    ranges = <0 0 0x1000>;
   #address-cells = <1>;
   #size-cells = <1>;
   -    ranges = <0 0 0x1000>;
--
   de-active = <1>;
   pixelclk-active = <1>;
   };
   +
   +    port {
   +        lcd_in: endpoint {
   +            remote-endpoint = <&dpi_out>;
   +        };
   +    };
   };
>> Documentation/devicetree/bindings/serial/sifive-serial.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/sifive-serial.yaml (original)
   +++ Documentation/devicetree/bindings/serial/sifive-serial.yaml (canonical)
   @@ -1,8 +1,9 @@
   #include <dt-bindings/clock/sifive-fu540-prci.h>
   +
   serial@10010000 {
   compatible = "sifive,fu540-c000-uart", "sifive,uart0";
   +    reg = <0x10010000 0x1000>;
   interrupt-parent = <&plic0>;
   interrupts = <80>;
--
   };
   Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/qcom,rpmcc.h>
   +
   clock-controller@1400000 {
   compatible = "qcom,gcc-sm6115";
   reg = <0x01400000 0x1f0000>;
>> Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.yaml:82: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.yaml (original)
   +++ Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.yaml (canonical)
   @@ -1,17 +1,17 @@
   #include <dt-bindings/phy/phy-am654-serdes.h>
--
   -  dma-names = "tx", "rx";
   +    compatible = "atmel,at91sam9g46-aes";
   +    reg = <0xe1810000 0x100>;
   +    interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
   +    clocks = <&pmc PMC_TYPE_PERIPHERAL 27>;
   +    clock-names = "aes_clk";
   +    dmas = <&dma0 AT91_XDMAC_DT_PERID(1)>,
   +           <&dma0 AT91_XDMAC_DT_PERID(2)>;
   +    dma-names = "tx", "rx";
   };
>> Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml (original)
   +++ Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml (canonical)
   @@ -1,5 +1,5 @@
   clock-controller {
   -  compatible = "starfive,jh7110-pll";
   -  clocks = <&osc>;
   -  #clock-cells = <1>;
   +    compatible = "starfive,jh7110-pll";
   +    clocks = <&osc>;
   +    #clock-cells = <1>;
--
   +++ Documentation/devicetree/bindings/arm/arm,juno-fpga-apb-regs.yaml (canonical)
   @@ -11,7 +11,7 @@
   offset = <0x08>;
   mask = <0x01>;
   label = "vexpress:0";
   +        default-state = "on";
   linux,default-trigger = "heartbeat";
   -        default-state = "on";
   };
   };
>> Documentation/devicetree/bindings/phy/sunplus,sp7021-usb2-phy.yaml:63: example 0: label 'sp_uphy0' defined but never referenced
>> Documentation/devicetree/bindings/phy/sunplus,sp7021-usb2-phy.yaml:63: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/sunplus,sp7021-usb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/sunplus,sp7021-usb2-phy.yaml (canonical)
   @@ -1,11 +1,11 @@
   sp_uphy0: usb-phy@9c004a80 {
   -  compatible = "sunplus,sp7021-usb2-phy";
   -  reg = <0x9c004a80 0x80>, <0x9c000248 0x10>;
   -  reg-names = "phy", "moon4";
   -  clocks = <&clkc 0x3d>;
   -  resets = <&rstc 0x2d>;
   -  #phy-cells = <0>;
--
   +        vcc-amp2-supply = <&vcc_amp2>;
   +        vcc-env-supply = <&vcc_env>;
   +        vcc-bg-supply = <&vcc_bg>;
   +        vcc-bg2-supply = <&vcc_bg2>;
   +        vcc-mixer-supply = <&vcc_mixer>;
   +        vcc-quad-supply = <&vcc_quad>;
   +        adi,quad-se-mode = "diff";
   +        adi,detector-enable;
   +    };
   };
>> Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml:46: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml:221: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml (original)
--
   #address-cells = <1>;
   #size-cells = <0>;
   +
   port@0 {
   reg = <0>;
   +
   typec_con_ep: endpoint {
   remote-endpoint = <&usbotg_hs_ep>;
   };
   Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml:52: example 0: label 'panel_in' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml:66: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml (canonical)
   @@ -2,21 +2,21 @@
   #include <dt-bindings/reset/rockchip,rk3588-cru.h>
--
   +    #size-cells = <0>;
   +
   +    ide-port@0 {
   +        reg = <0>;
   +    };
   +
   +    ide-port@1 {
   +        reg = <1>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml:86: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml (canonical)
   @@ -4,10 +4,10 @@
   compatible = "motorola,mapphone-cpcap-usb-phy";
   #phy-cells = <0>;
   interrupts-extended = <
   -        &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
   -        &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
   -        &cpcap 48 1
   -    >;
--
   compatible = "adi,adv7482";
   reg = <0x70 0x71 0x72 0x73 0x74 0x75
   -               0x60 0x61 0x62 0x63 0x64 0x65>;
   +              0x60 0x61 0x62 0x63 0x64 0x65>;
   reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
   "infoframe", "cbus", "cec", "sdp", "txa", "txb";
   -
   interrupt-parent = <&gpio6>;
   interrupts = <30 IRQ_TYPE_LEVEL_LOW>, <31 IRQ_TYPE_LEVEL_LOW>;
   interrupt-names = "intrq1", "intrq2";
>> Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml:80: example 0: label 'pm8550b_eusb2_repeater' defined but never referenced
   Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml:80: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml (canonical)
   @@ -1,13 +1,13 @@
   #include <dt-bindings/spmi/spmi.h>
--
   +        reg = <0x44>;
   +        interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
   +        vdd-supply = <&vdd_regulator>;
   +        vio-supply = <&vio_regulator>;
   +        io-channels = <&adc_channel>;
   +        io-channel-names = "alsout";
   +        sharp,proximity-far-hysteresis = /bits/ 8 <0x2f>;
   +        sharp,proximity-close-hysteresis = /bits/ 8 <0x0f>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/microchip,lan966x-serdes.yaml:53: example 0: label 'serdes' defined but never referenced
>> Documentation/devicetree/bindings/phy/microchip,lan966x-serdes.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/microchip,lan966x-serdes.yaml (original)
   +++ Documentation/devicetree/bindings/phy/microchip,lan966x-serdes.yaml (canonical)
   @@ -1,5 +1,5 @@
   serdes: serdes@e2004010 {
   -  compatible = "microchip,lan966x-serdes";
   -  reg = <0xe202c000 0x9c>, <0xe2004010 0x4>;
   -  #phy-cells = <2>;
   +    compatible = "microchip,lan966x-serdes";
   +    reg = <0xe202c000 0x9c>, <0xe2004010 0x4>;
   +    #phy-cells = <2>;
--
   -      reg = <2>;
   -      diff-channels = <4 5>;
   -    };
   -
   -    channel@3 {
   -      reg = <3>;
   -      diff-channels = <6 7>;
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml:47: example 0: label 'p2u_hsio_0' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml (original)
   +++ Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml (canonical)
   @@ -2,6 +2,5 @@
   compatible = "nvidia,tegra194-p2u";
   reg = <0x03e10000 0x10000>;
   reg-names = "ctl";
   -
   #phy-cells = <0>;
   };
   Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml:174: example 0: canonical form differs:
--
   reg = <0x65>;
   regulator-name = "sy8106a-vdd";
   -        silergy,fixed-microvolt = <1200000>;
   regulator-min-microvolt = <1000000>;
   regulator-max-microvolt = <1400000>;
   regulator-boot-on;
   regulator-always-on;
   +        silergy,fixed-microvolt = <1200000>;
   };
   };
>> Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml:54: example 0: label 'tcu' defined but never referenced
   Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml:67: example 0: label 'mdp3_wdma' defined but never referenced
   Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml:67: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml (original)
   +++ Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml (canonical)
   @@ -4,12 +4,12 @@
   #include <dt-bindings/memory/mt8183-larb-port.h>
--
   +        vdd-supply = <&ldo_aux1_reg>;
   +        vcpin-supply = <&ldo_aux2_reg>;
   +        bootloader-key = /bits/ 8 <0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07>;
   +        touchscreen-size-x = <480>;
   +        touchscreen-size-y = <800>;
   +        active-interval-ms = <0>;
   +        touch-timeout-ms = <255>;
   +        lowpower-interval-ms = <10>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml:111: example 0: label 'csi_dphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml:111: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml (canonical)
   @@ -1,4 +1,3 @@
   -
   csi_dphy: phy@ff2f0000 {
   compatible = "rockchip,px30-csi-dphy";
   reg = <0xff2f0000 0x4000>;
   Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml:138: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml (canonical)
--
   power-domains = <&gcc PCIE_0_GDSC>;
   -
   resets = <&gcc GCC_PCIE_0_BCR>;
   reset-names = "pci";
   -
   perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
   wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
   +        linux,pci-domain = <0>;
   };
   };
>> Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml:66: example 0: label 'clk32k' defined but never referenced
   Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml:44: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml (canonical)
   @@ -1,40 +1,41 @@
   #include <dt-bindings/input/linux-event-codes.h>
   +
   i2c {
   -        #address-cells = <1>;
   -        #size-cells = <0>;
   +    #address-cells = <1>;
--
   <0x6000 0 0 1 &pic 16>, /* INT A on slot 12 is irq 16 */
   <0x6000 0 0 2 &pic 13>, /* INT B on slot 12 is irq 13 */
   <0x6000 0 0 3 &pic 14>, /* INT C on slot 12 is irq 14 */
   <0x6000 0 0 4 &pic 15>; /* INT D on slot 12 is irq 15 */
   +        };
   +    /* IDSEL 9 */
   +    /* IDSEL 10 */
   +    /* IDSEL 11 */
   +    /* IDSEL 12 */
   };
>> Documentation/devicetree/bindings/serial/cdns,uart.yaml:76: example 0: label 'uart0' defined but never referenced
>> Documentation/devicetree/bindings/serial/cdns,uart.yaml:76: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/cdns,uart.yaml (original)
   +++ Documentation/devicetree/bindings/serial/cdns,uart.yaml (canonical)
   @@ -1,7 +1,7 @@
   uart0: serial@e0000000 {
   compatible = "xlnx,xuartps", "cdns,uart-r1p8";
   +    reg = <0xe0000000 0x1000>;
   clocks = <&clkc 23>, <&clkc 40>;
   clock-names = "uart_clk", "pclk";
   -    reg = <0xe0000000 0x1000>;
   interrupts = <0 27 4>;
--
   -                                remote-endpoint = <&dsi0_out>;
   -                        };
   -                };
   +        port {
   +            panel_in: endpoint {
   +                remote-endpoint = <&dsi0_out>;
   +            };
   };
   +    };
   };
>> Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml:73: example 0: label 'anx7814' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml:73: example 0: label 'anx7814_in' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml:73: example 0: label 'anx7814_out' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml (original)
   +++ Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml (canonical)
   @@ -10,7 +10,7 @@
   reg = <0x38>;
   interrupt-parent = <&gpio0>;
   interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
   -        pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
--
   --- Documentation/devicetree/bindings/iio/adc/nxp,lpc3220-adc.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/nxp,lpc3220-adc.yaml (canonical)
   @@ -1,6 +1,7 @@
   soc {
   #address-cells = <1>;
   #size-cells = <1>;
   +
   adc@40048000 {
   compatible = "nxp,lpc3220-adc";
   reg = <0x40048000 0x1000>;
>> Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml:135: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml (canonical)
   @@ -2,51 +2,46 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
--
   interrupts = <34 IRQ_TYPE_LEVEL_HIGH 7>;
   dmas = <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
   -                   AT91_XDMAC_DT_PERID(36))>,
   +           AT91_XDMAC_DT_PERID(36))>,
   <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
   -                   AT91_XDMAC_DT_PERID(37))>;
   +           AT91_XDMAC_DT_PERID(37))>;
   dma-names = "tx", "rx";
   clocks = <&i2s_clk>, <&i2s_gclk>;
   clock-names = "pclk", "gclk";
>> Documentation/devicetree/bindings/iio/proximity/vishay,vcnl3020.yaml:54: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/vishay,vcnl3020.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/vishay,vcnl3020.yaml (canonical)
   @@ -1,11 +1,10 @@
   i2c {
   -
   #address-cells = <1>;
   #size-cells = <0>;
--
   +    rockchip,standby-idle-ns = <81920>;
   +    rockchip,ddr3_odt_dis_freq = <333000000>;
   +    rockchip,lpddr3_odt_dis_freq = <333000000>;
   +    rockchip,lpddr4_odt_dis_freq = <333000000>;
   +    rockchip,pd-idle-dis-freq-hz = <1000000000>;
   +    rockchip,sr-idle-dis-freq-hz = <1000000000>;
   +    rockchip,sr-mc-gate-idle-dis-freq-hz = <1000000000>;
   +    rockchip,srpd-lite-idle-dis-freq-hz = <0>;
   +    rockchip,standby-idle-dis-freq-hz = <928000000>;
   };
>> Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml:86: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml (canonical)
   @@ -19,10 +19,6 @@
   #address-cells = <2>;
   #size-cells = <2>;
--
   ti,sci = <&dmsc>;
   ti,sci-dev-id = <9>;
   ti,sci-proc-ids = <0x18 0xff>;
   -     };
   +    };
   +
   +    mailbox0_cluster0: mailbox-0 {
   +        #mbox-cells = <1>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml (canonical)
   @@ -1,9 +1,9 @@
   usb-phy@c0000000 {
   -  compatible = "amlogic,meson-gxbb-usb2-phy";
   -  reg = <0xc0000000 0x20>;
   -  resets = <&reset_usb_phy>;
   -  clocks = <&clk_usb_general>, <&reset_usb>;
   -  clock-names = "usb_general", "usb";
   -  phy-supply = <&usb_vbus>;
--
   port@2 {
   reg = <2>;
   +
   codec_endpoint: endpoint {
   remote-endpoint = <&i2s0_cpu_endpoint>;
   };
>> Documentation/devicetree/bindings/serial/renesas,scifb.yaml:94: example 0: label 'scifb' defined but never referenced
>> Documentation/devicetree/bindings/serial/renesas,scifb.yaml:94: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/renesas,scifb.yaml (original)
   +++ Documentation/devicetree/bindings/serial/renesas,scifb.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/clock/r8a7740-clock.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   scifb: serial@e6c30000 {
   compatible = "renesas,scifb-r8a7740", "renesas,scifb";
   reg = <0xe6c30000 0x100>;
   Documentation/devicetree/bindings/leds/leds-lp50xx.yaml:102: example 0: canonical form differs:
--
   -  #power-domain-cells = <1>;
   +    compatible = "qcom,qcs615-gpucc";
   +    reg = <0x5090000 0x9000>;
   +    clocks = <&rpmhcc RPMH_CXO_CLK>,
   +             <&gcc GPLL0>,
   +             <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    #power-domain-cells = <1>;
   };
>> Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml:142: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml (canonical)
   @@ -11,43 +11,33 @@
   compatible = "qcom,sc7280-adsp-pil";
   reg = <0x03000000 0x5000>,
   <0x0355b000 0x10>;
   -
   interrupts-extended = <&pdc 162 IRQ_TYPE_EDGE_RISING>,
   -            <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
   -            <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
--
   led@2 {
   -                 reg = <0x2>;
   -                 color = <LED_COLOR_ID_BLUE>;
   +                reg = <0x2>;
   +                color = <LED_COLOR_ID_BLUE>;
   };
   };
   };
>> Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml:129: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml (canonical)
   @@ -3,7 +3,6 @@
   #include <dt-bindings/reset/sun8i-h3-ccu.h>
--
   -        interrupt-controller;
   reg = <0x2 0x8e100000 0x0 0xc000>,
   <0x2 0x8e10c000 0x0 0x4>;
   reg-names = "core", "event";
   +        #interrupt-cells = <4>;
   +        interrupt-controller;
   };
   };
   Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml:171: example 0: label 'lpc' defined but never referenced
   Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml:171: example 0: label 'lpc_ctrl' defined but never referenced
>> Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml:100: example 0: label 'phy_con_ss' defined but never referenced
   Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml:171: example 0: label 'lpc_reset' defined but never referenced
   Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml:171: example 0: label 'lpc_snoop' defined but never referenced
>> Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml:100: example 0: label 'usb_con_sbu' defined but never referenced
>> Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml:100: example 0: label 'usb_con_ss' defined but never referenced
   Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml:171: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml (canonical)
   @@ -4,10 +4,9 @@
   lpc: lpc@1e789000 {
   compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
   reg = <0x1e789000 0x1000>;
   -
   +    ranges = <0x0 0x1e789000 0x1000>;
   #address-cells = <1>;
--
   reg = <0x90 0x8>;
   interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
   snoop-ports = <0x80>;
   };
   +
   +    lpc_reset: reset-controller@98 {
   +        compatible = "aspeed,ast2600-lpc-reset";
   +        reg = <0x98 0x4>;
   +        #reset-cells = <1>;
   +    };
>> };Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml:100: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml (original)
   +++ Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml (canonical)
   @@ -5,9 +5,7 @@
   typec-mux@32 {
   compatible = "onnn,nb7vpq904m";
   reg = <0x32>;
   -
   vcc-supply = <&vreg_l15b_1p8>;
   -
   retimer-switch;
--
   +    cpufreq@17d43000 {
   +        compatible = "qcom,sdm845-cpufreq-hw", "qcom,cpufreq-hw";
   +        reg = <0x17d43000 0x1400>, <0x17d45800 0x1400>;
   +        reg-names = "freq-domain0", "freq-domain1";
   +        clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
   +        clock-names = "xo", "alternate";
   +        #freq-domain-cells = <1>;
   +        #clock-cells = <1>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/socionext,uniphier-usb3ss-phy.yaml:137: example 0: label 'usb_ssphy0' defined but never referenced
   Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml:109: example 0: label 'iointc' defined but never referenced
   Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml:109: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml (original)
   +++ Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml (canonical)
   @@ -1,17 +1,14 @@
   iointc: interrupt-controller@3ff01400 {
   -  compatible = "loongson,liointc-1.0";
   -  reg = <0x3ff01400 0x64>;
   -
   -  interrupt-controller;
--
   +        mode-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>,
   +                     <&gpio3 23 GPIO_ACTIVE_LOW>;
   +        io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
   +                      <&cpcap_adc 2>, <&cpcap_adc 5>,
   +                      <&cpcap_adc 6>;
   +        io-channel-names = "battdetb", "battp",
   +                           "vbus", "chg_isense",
   +                           "batti";
   +    };
   };
>> Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml:40: example 0: label 'sys' defined but never referenced
   Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml (original)
   +++ Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml (canonical)
   @@ -1,4 +1,4 @@
   sys: system-controller@a3f03000 {
   -  compatible = "renesas,r9a09g011-sys";
   -  reg = <0xa3f03000 0x400>;
   +    compatible = "renesas,r9a09g011-sys";
   +    reg = <0xa3f03000 0x400>;
   };
--
   ethernet@0,0 {
>> Documentation/devicetree/bindings/memory-controllers/qca,ath79-ddr-controller.yaml:48: example 0: label 'ddr_ctrl' defined but never referenced
>> Documentation/devicetree/bindings/memory-controllers/qca,ath79-ddr-controller.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/memory-controllers/qca,ath79-ddr-controller.yaml (original)
   +++ Documentation/devicetree/bindings/memory-controllers/qca,ath79-ddr-controller.yaml (canonical)
   @@ -2,6 +2,5 @@
   compatible = "qca,ar9132-ddr-controller",
   "qca,ar7240-ddr-controller";
   reg = <0x18000000 0x100>;
   -
   #qca,ddr-wb-channel-cells = <1>;
   };
   Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml:74: example 0: label 'poeggd' defined but never referenced
--
   +                    &sai1m0_sdo0
   +                    &sai1m0_sdo1
   +                    &sai1m0_sdo2
   +                    &sai1m0_sdo3>;
   +        #sound-dai-cells = <0>;
   rockchip,sai-tx-route = <3 1 2 0>;
   -        #sound-dai-cells = <0>;
   };
   };
   Documentation/devicetree/bindings/cpufreq/mediatek,mt8196-cpufreq-hw.yaml:39: example 0: label 'cpu0' defined but never referenced
>> Documentation/devicetree/bindings/mfd/adi,adp5585.yaml:266: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/adi,adp5585.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/adi,adp5585.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/input/input.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -7,40 +8,31 @@
--
   -      };
   +    dwc3: usb@ff500000 {
   +        compatible = "snps,dwc3";
   +        reg = <0xff500000 0x100000>;
   +        interrupts = <30>;
   +        dr_mode = "host";
   +        snps,dis_u2_susphy_quirk;
   +        snps,quirk-frame-length-adjustment = <0x20>;
   +    };
   };
>> Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:152: example 0: label 'it6263_lvds_link1' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:152: example 0: label 'it6263_out' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:198: example 1: label 'it6263_lvds_link1_dual' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:198: example 1: label 'it6263_lvds_link2_dual' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:198: example 1: label 'it6263_out_dual' defined but never referenced
   Documentation/devicetree/bindings/serial/nxp,sc16is7xx.yaml:97: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/nxp,sc16is7xx.yaml (original)
   +++ Documentation/devicetree/bindings/serial/nxp,sc16is7xx.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/gpio/gpio.h>
--
   -            reg = <2>;
   -            endpoint {
   -              remote-endpoint = <&dp_aux>;
   -            };
   -          };
   };
   -      };
   };
   -  };
   };
>> Documentation/devicetree/bindings/phy/brcm,bcm63xx-usbh-phy.yaml:71: example 0: label 'usbh' defined but never referenced
>> Documentation/devicetree/bindings/phy/brcm,bcm63xx-usbh-phy.yaml:71: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/brcm,bcm63xx-usbh-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/brcm,bcm63xx-usbh-phy.yaml (canonical)
   @@ -1,8 +1,8 @@
   usbh: usb-phy@10001700 {
   -  compatible = "brcm,bcm6368-usbh-phy";
   -  reg = <0x10001700 0x38>;
   -  clocks = <&periph_clk 15>;
   -  clock-names = "usbh";
   -  resets = <&periph_rst 12>;
   -  #phy-cells = <1>;
--
   -    mac: ethernet@1 {
   -      compatible = "airoha,eth-mac";
   -      reg = <1>;
   +        mac: ethernet@1 {
   +            compatible = "airoha,eth-mac";
   +            reg = <1>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml:174: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml (original)
   +++ Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml (canonical)
   @@ -5,28 +5,24 @@
   reg = <0xae0 0x10>,
   <0xc00 0x200>;
   reg-names = "si_regs", "si_ram";
   -
   #address-cells = <1>;
   #size-cells = <0>;
--
   alarm_red@2 {
   reg = <2>;
>> Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml:183: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml (original)
   +++ Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml (canonical)
   @@ -3,20 +3,19 @@
   memory-controller@40005000 {
   compatible = "arm,pl172", "arm,primecell";
   reg = <0x40005000 0x1000>;
   +    ranges = <0 0 0x1c000000 0x1000000
   +             1 0 0x1d000000 0x1000000
   +             2 0 0x1e000000 0x1000000
   +             3 0 0x1f000000 0x1000000>;
--
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   maxadc: adc@0 {
   compatible = "maxim,max1027";
   reg = <0>;
>> Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml:97: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml (original)
   +++ Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml (canonical)
   @@ -3,16 +3,16 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   -      };
   +    out-ports {
   +        port {
   +            tpda_qdss_out_funnel_in0: endpoint {
   +                remote-endpoint = <&funnel_in0_in_tpda_qdss>;
   +            };
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/spi/socionext,synquacer-spi.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/socionext,synquacer-spi.yaml (original)
   +++ Documentation/devicetree/bindings/spi/socionext,synquacer-spi.yaml (canonical)
   @@ -4,8 +4,8 @@
   compatible = "socionext,synquacer-spi";
   reg = <0xff110000 0x1000>;
   interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
   -           <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
   -           <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
   +                 <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
--
   };
   Documentation/devicetree/bindings/usb/nxp,isp1760.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/nxp,isp1760.yaml (original)
   +++ Documentation/devicetree/bindings/usb/nxp,isp1760.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   usb@40200000 {
   compatible = "nxp,usb-isp1763";
   reg = <0x40200000 0x100000>;
>> Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/nxp,lpc3220-scb.yaml (canonical)
   @@ -1,9 +1,9 @@
   syscon@400040000 {
   compatible = "nxp,lpc3220-scb", "syscon", "simple-mfd";
   reg = <0x40004000 0x1000>;
   +    ranges = <0 0x40004000 0x1000>;
   #address-cells = <1>;
   #size-cells = <1>;
   -    ranges = <0 0x40004000 0x1000>;
--
   +            };
   +
   +            ethphy3: ethernet-phy@3 {
   +                reg = <3>;
   +                interrupt-parent = <&switch_intc2>;
   +                interrupts = <3>;
   +            };
   };
   +    };
   };
>> Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml:73: example 0: label 'panel_in_0' defined but never referenced
>> Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml:73: example 0: label 'panel_in_1' defined but never referenced
>> Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml (original)
   +++ Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml (canonical)
   @@ -7,7 +7,6 @@
   panel@0 {
   compatible = "xiaomi,elish-csot-nt36523", "novatek,nt36523";
   reg = <0>;
   -
   vddio-supply = <&vreg_l14a_1p88>;
   reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
   backlight = <&backlight>;
--
   @@ -32,9 +37,4 @@
   #phy-cells = <0>;
   };
   };
   -
   -    clock-controller {
   -        compatible = "socionext,uniphier-pro4-sg-clock";
   -        #clock-cells = <1>;
   -    };
   };
>> Documentation/devicetree/bindings/phy/qcom,sata-phy.yaml:45: example 0: label 'sata_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,sata-phy.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,sata-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,sata-phy.yaml (canonical)
   @@ -1,10 +1,9 @@
   #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
   +
   sata_phy: sata-phy@1b400000 {
   compatible = "qcom,ipq806x-sata-phy";
   reg = <0x1b400000 0x200>;
   -
   clocks = <&gcc SATA_PHY_CFG_CLK>;
--
   +    reg = <0x132a0000 0x20>, /* AUX */
   +          <0x132b0000 0x4000>, /* TCSM0 */
   +          <0x132c0000 0xc000>, /* TCSM1 */
   +          <0x132f0000 0x7000>; /* SRAM */
   +          reg-names = "aux", "tcsm0", "tcsm1", "sram";
   +    clocks = <&cgu JZ4770_CLK_AUX>, <&cgu JZ4770_CLK_VPU>;
   +    clock-names = "aux", "vpu";
   +    interrupt-parent = <&cpuintc>;
   +    interrupts = <3>;
   };
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy0_spd_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy1_spd_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy2_spd_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy3_spd_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy0_act_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy1_act_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy2_act_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'ephy3_act_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'serial_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'serial_led_data-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'serial_led_clk-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'inet_act_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'inet_fail_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'dsl_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'post_fail_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'wlan_wps_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'usb_pwron-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'usb_device_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: node name 'usb_active-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_dsl_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy0_act_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy0_spd_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy1_act_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy1_spd_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy2_act_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy2_spd_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy3_act_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ephy3_spd_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_inet_act_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_inet_fail_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_post_fail_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_serial_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_serial_led_clk' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_serial_led_data' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_usb_active' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_usb_device_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_usb_pwron' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: label 'pinctrl_wlan_wps_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml (canonical)
   @@ -1,114 +1,113 @@
   syscon@10000080 {
   -  #address-cells = <1>;
   -  #size-cells = <1>;
   -  compatible = "brcm,bcm6318-gpio-sysctl", "syscon", "simple-mfd";
   -  reg = <0x10000080 0x80>;
   -  ranges = <0 0x10000080 0x80>;
   +    compatible = "brcm,bcm6318-gpio-sysctl", "syscon", "simple-mfd";
--
>> Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml:73: example 0: label 'usb2_phy_prim' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/clock/qcom,gcc-qcs404.h>
   #include <dt-bindings/clock/qcom,rpmcc.h>
   +
   usb2_phy_prim: phy@7a000 {
   compatible = "qcom,usb-hs-28nm-femtophy";
   reg = <0x0007a000 0x200>;
   Documentation/devicetree/bindings/regulator/richtek,rt5759-regulator.yaml:62: example 0: canonical form differs:
--
   compatible = "microchip,pic32mzda-uart";
   reg = <0x1f822000 0x50>;
   interrupts = <112 IRQ_TYPE_LEVEL_HIGH>,
   -                <113 IRQ_TYPE_LEVEL_HIGH>,
   -                <114 IRQ_TYPE_LEVEL_HIGH>;
   +                 <113 IRQ_TYPE_LEVEL_HIGH>,
   +                 <114 IRQ_TYPE_LEVEL_HIGH>;
   clocks = <&rootclk PB2CLK>;
   cts-gpios = <&gpio1 15 0>;
   };
>> Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml:64: example 0: label 'mt6360_charger' defined but never referenced
>> Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml:64: example 0: label 'otg_vbus_regulator' defined but never referenced
>> Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml (canonical)
   @@ -2,6 +2,7 @@
   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
   #include <dt-bindings/leds/common.h>
   #include <dt-bindings/usb/pd.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
--
   panel@0 {
   compatible = "raydium,rm67191";
>> Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml:99: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml (canonical)
   @@ -1,16 +1,13 @@
   phy@aec2a00 {
   -  compatible = "qcom,sc8180x-edp-phy";
   -  reg = <0x0aec2a00 0x1c0>,
   -        <0x0aec2200 0xa0>,
   -        <0x0aec2600 0xa0>,
   -        <0x0aec2000 0x19c>;
   -
--
   +                       <&mpss_master_stats>,
   +                       <&adsp_master_stats>,
   +                       <&cdsp_master_stats>,
   +                       <&tz_master_stats>;
   +    qcom,master-names = "APSS",
   +                        "MPSS",
   +                        "ADSP",
   +                        "CDSP",
   +                        "TZ";
   };
>> Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml:77: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml (canonical)
   @@ -1,9 +1,9 @@
   remoteproc@1c {
   -  compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
   -  reg = <0x1c 0x8>, <0x38 0x8>;
   -  reg-names = "remap", "cpu";
   -  resets = <&media_cpu_reset>;
   -  clocks = <&media_cpu_clock>;
   -  sram = <&ahb_sram_ao_arc>;
--
   +
   endpoint {
   remote-endpoint = <&dvi_in>;
   };
   };
   -
   };
   };
   };
   Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml:37: example 0: label 'pwm' defined but never referenced
>> Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml (original)
   +++ Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml (canonical)
   @@ -1,5 +1,5 @@
   power-manager@f9088000 {
   -  compatible = "qcom,kpss-acc-v2";
   -  reg = <0xf9088000 0x1000>,
   -        <0xf9008000 0x1000>;
   +    compatible = "qcom,kpss-acc-v2";
   +    reg = <0xf9088000 0x1000>,
   +          <0xf9008000 0x1000>;
--
   -    panel_in_lvds: endpoint {
   -      remote-endpoint = <&ltdc_out_lvds>;
   +    port {
   +        panel_in_lvds: endpoint {
   +            remote-endpoint = <&ltdc_out_lvds>;
   +        };
   };
   -  };
   };
   Documentation/devicetree/bindings/gpio/sprd,gpio-eic.yaml:108: example 0: label 'eic_debounce' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml:79: example 0: label 'dsi0_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml:79: example 0: label 'dsi1_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml:79: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml (original)
   +++ Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml (canonical)
   @@ -7,36 +7,28 @@
   compatible = "qcom,sm8650-mdss";
   reg = <0x0ae00000 0x1000>;
   reg-names = "mdss";
   -
   +    ranges;
   interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
   <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
--
   reg = <0x0 0xfc000000 0x0 0x01000000>,
   <0x0 0x80000000 0x0 0x40000000>;
   reg-names = "reg", "mem";
   -        cdns,max-outbound-regions = <16>;
   max-functions = /bits/ 8 <8>;
   phys = <&pcie_phy0>;
   phy-names = "pcie-phy";
   +        cdns,max-outbound-regions = <16>;
   };
   };
>> Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml:38: example 0: label 'apu' defined but never referenced
   Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.yaml:102: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.yaml (original)
   +++ Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.yaml (canonical)
   @@ -1,93 +1,103 @@
   #include <dt-bindings/gpio/gpio.h>
--
   +    codec {
   +        mclk-fs = <512>;
   +        prefix = "pcm3168a";
   +        sound-dai = <&pcm3168a 1>;
   +    };
   +
   +    sndcpu2: cpu {
   +        sound-dai = <&rcar_sound 5>;
   +    };
   +};
>> Documentation/devicetree/bindings/input/gpio-keys.yaml:153: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/gpio-keys.yaml (original)
   +++ Documentation/devicetree/bindings/input/gpio-keys.yaml (canonical)
   @@ -4,24 +4,24 @@
   compatible = "gpio-keys";
   autorepeat;
--
   };
   Documentation/devicetree/bindings/iio/adc/ti,ads7138.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/ti,ads7138.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/ti,ads7138.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml:212: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml (original)
   +++ Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml (canonical)
   @@ -2,9 +2,9 @@
--
   ethernet-port@2 {
   reg = <2>;
   label = "lan1";
   phy-handle = <&swphy1>;
   phy-mode = "rgmii-id";
   };
   +
   ethernet-port@3 {
   reg = <3>;
   ethernet = <&fec1>;
>> Documentation/devicetree/bindings/phy/marvell,armada-380-comphy.yaml:67: example 0: label 'comphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/marvell,armada-380-comphy.yaml:67: example 0: label 'cpm_comphy0' defined but never referenced
>> Documentation/devicetree/bindings/phy/marvell,armada-380-comphy.yaml:67: example 0: label 'cpm_comphy1' defined but never referenced
   Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml:40: example 0: label 'mdio0' defined but never referenced
   Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml (original)
   +++ Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml (canonical)
   @@ -1,12 +1,10 @@
   #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
--
   glink-edge {
   interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
   label = "modem";
   +        mboxes = <&apss_shared 12>;
   qcom,remote-pid = <1>;
   -        mboxes = <&apss_shared 12>;
   };
   };
>> Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml:53: example 0: label 'emmc_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml:53: example 0: label 'sysconf' defined but never referenced
>> Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml (canonical)
   @@ -1,13 +1,13 @@
   sysconf: chiptop@e0200000 {
   -  compatible = "intel,lgm-syscon", "syscon";
   -  reg = <0xe0200000 0x100>;
   -  #address-cells = <1>;
   -  #size-cells = <1>;
   +    compatible = "intel,lgm-syscon", "syscon";
   +    reg = <0xe0200000 0x100>;
--
   regulators {
   -          vcm_reg: vcm-output {
   -            regulator-name = "ad7768-1-vcm";
   -          };
   +            vcm_reg: vcm-output {
   +                regulator-name = "ad7768-1-vcm";
   +            };
   };
   };
   };
>> Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml:211: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml (original)
   +++ Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml (canonical)
   @@ -16,7 +16,7 @@
   vusb33-supply = <&mt6397_vusb_reg>;
   vbus-supply = <&usb_p1_vbus>;
   imod-interval-ns = <10000>;
   -    mediatek,syscon-wakeup = <&pericfg 0x400 1>;
   wakeup-source;
   usb3-lpm-capable;
   +    mediatek,syscon-wakeup = <&pericfg 0x400 1>;
--
   -             ak4619_endpoint: endpoint {
   -                   remote-endpoint = <&rsnd_endpoint>;
   -              };
   +            ak4619_endpoint: endpoint {
   +                remote-endpoint = <&rsnd_endpoint>;
   +            };
   };
   };
   };
   Documentation/devicetree/bindings/pwm/pwm.yaml:31: example 0: label 'pwm' defined but never referenced
>> Documentation/devicetree/bindings/phy/allwinner,sun5i-a13-usb-phy.yaml:78: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/allwinner,sun5i-a13-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/allwinner,sun5i-a13-usb-phy.yaml (canonical)
   @@ -3,16 +3,16 @@
   #include <dt-bindings/reset/sun5i-ccu.h>
--
   -    device_type = "cpu";
   -    compatible = "arm,arm926ej-s";
   -    reg = <0x0>;
   -  };
   +    cpu@0 {
   +        compatible = "arm,arm926ej-s";
   +        reg = <0x0>;
   +        device_type = "cpu";
   +    };
   };
>> Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml (canonical)
   @@ -1,27 +1,25 @@
   hdmi-phy@9a0600 {
   -  compatible = "qcom,hdmi-phy-8996";
   -  reg = <0x009a0600 0x1c4>,
   -        <0x009a0a00 0x124>,
   -        <0x009a0c00 0x124>,
   -        <0x009a0e00 0x124>,
   -        <0x009a1000 0x124>,
--
   -    interrupt-parent = <&gpio1>;
   -    interrupts = <16 2>;
   -  };
   +    atlas@66 {
   +        compatible = "atlas,orp-sm";
   +        reg = <0x66>;
   +        interrupt-parent = <&gpio1>;
   +        interrupts = <16 2>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/bcm-ns-usb2-phy.yaml (canonical)
   @@ -1,9 +1,10 @@
   #include <dt-bindings/clock/bcm-nsp.h>
   +
   phy@1800c164 {
   compatible = "brcm,ns-usb2-phy";
   reg = <0x1800c164 0x4>;
   -    brcm,syscon-clkset = <&clkset>;
   clocks = <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
--
   +                    <0 0 0 4 &ioapic1 30 1>;
   +    resets = <&rcu0 0x50 0>;
   +    clocks = <&cgu0 120>;
   +    phys = <&cb0phy0>;
   +    phy-names = "pcie";
   +    reset-assert-ms = <500>;
   +    reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
   +    num-lanes = <2>;
   +    linux,pci-domain = <0>;
   };
>> Documentation/devicetree/bindings/phy/phy-cadence-sierra.yaml:136: example 0: label 'pcie0_phy0' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-cadence-sierra.yaml:136: example 0: label 'pcie0_phy1' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-cadence-sierra.yaml:136: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-cadence-sierra.yaml (original)
   +++ Documentation/devicetree/bindings/phy/phy-cadence-sierra.yaml (canonical)
   @@ -13,18 +13,20 @@
   clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div";
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pcie0_phy0: phy@0 {
   reg = <0>;
   resets = <&phyrst 2>;
--
   +        };
   };
   -
   -    /* group node defining 2 I2C pins */
   -    i2c6-pins {
   -      pins = "uart1_cts", "uart1_rts";
   -      function = "i2c";
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml:51: example 0: label 'iommu' defined but never referenced
   Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml (original)
   +++ Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml (canonical)
   @@ -1,6 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   -
   #include <dt-bindings/clock/sun50i-h6-ccu.h>
   #include <dt-bindings/reset/sun50i-h6-ccu.h>
--
   +    clock-names = "nvdec";
   +    resets = <&bpmp TEGRA186_RESET_NVDEC>;
   +    reset-names = "nvdec";
   +    power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
   +    interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
   +                    <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD1 &emc>,
   +                    <&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
   +    interconnect-names = "dma-mem", "read-1", "write";
   +    iommus = <&smmu TEGRA186_SID_NVDEC>;
   };
>> Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml:90: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml (original)
   +++ Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml (canonical)
   @@ -1,10 +1,10 @@
   #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
--
>> Documentation/devicetree/bindings/gpio/faraday,ftgpio010.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpio/faraday,ftgpio010.yaml (original)
   +++ Documentation/devicetree/bindings/gpio/faraday,ftgpio010.yaml (canonical)
   @@ -1,10 +1,11 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   gpio@4d000000 {
   -  compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
   -  reg = <0x4d000000 0x100>;
   -  interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
   -  gpio-controller;
--
   +        compatible = "adi,adxl380";
   +        reg = <0>;
   +        spi-max-frequency = <8000000>;
   +        vddio-supply = <&vddio>;
   +        vsupply-supply = <&vsupply>;
   +        interrupt-parent = <&gpio>;
   +        interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
   +        interrupt-names = "INT0";
   +    };
   };
>> Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml:49: example 0: label 'panel_in' defined but never referenced
   Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml (original)
   +++ Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml (canonical)
   @@ -11,5 +11,5 @@
   sbs,poll-retry-count = <10>;
   sbs,battery-detect-gpios = <&gpio 122 GPIO_ACTIVE_HIGH>;
   sbs,disable-charger-broadcasts;
   -   };
   +    };
   };
--
   +        "DMIC L1", "Internal Mic 1",
   +        "DMIC R1", "Internal Mic 1",
   +        "DMIC L2", "Internal Mic 2",
   +        "DMIC R2", "Internal Mic 2",
   +        "Speaker", "PDM1L",
   +        "Speaker", "PDM1R";
   +    nvidia,i2s-controller = <&tegra_i2s1>;
   +    nvidia,audio-codec = <&rt5677>;
   +    nvidia,hp-det-gpios = <&gpio 143 0>;
   };
>> Documentation/devicetree/bindings/phy/mscc,vsc7514-serdes.yaml:53: example 0: label 'serdes' defined but never referenced
>> Documentation/devicetree/bindings/phy/mscc,vsc7514-serdes.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mscc,vsc7514-serdes.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mscc,vsc7514-serdes.yaml (canonical)
   @@ -1,4 +1,4 @@
   serdes: serdes {
   -  compatible = "mscc,vsc7514-serdes";
   -  #phy-cells = <2>;
   +    compatible = "mscc,vsc7514-serdes";
   +    #phy-cells = <2>;
   };
   Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml:65: example 0: canonical form differs:
--
   led@0 {
>> Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml:62: example 0: label 'rtc' defined but never referenced
   Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml:63: example 0: label 'charger' defined but never referenced
   Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml:63: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml (original)
   +++ Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   charger: battery-charger@68 {
   compatible = "lltc,ltc4162-l";
   reg = <0x68>;
>> Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml:57: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml (original)
   +++ Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml (canonical)
   @@ -2,13 +2,13 @@
   #include <dt-bindings/interrupt-controller/mips-gic.h>
--
>> Documentation/devicetree/bindings/hwmon/pmbus/mps,mp2975.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/hwmon/pmbus/mps,mp2975.yaml (original)
   +++ Documentation/devicetree/bindings/hwmon/pmbus/mps,mp2975.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -6,7 +7,6 @@
   regulator@58 {
--
   --- Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml (canonical)
   @@ -1,6 +1,7 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   accel@0 {
   compatible = "bosch,bma222";
   reg = <0>;
>> Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml:84: example 0: label 'dsi0_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml:84: example 0: label 'dsi1_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml:84: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml (original)
   +++ Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml (canonical)
   @@ -5,38 +5,33 @@
   #include <dt-bindings/power/qcom-rpmpd.h>
--
   ethernet@1 {
   compatible = "usb955,9ff";
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: node name 'rcar_sound,dvc' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: node name 'rcar_sound,mix' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: node name 'rcar_sound,ctu' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: node name 'rcar_sound,src' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: node name 'rcar_sound,ssiu' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: node name 'rcar_sound,ssi' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: node name 'rcar_sound,dai' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu00' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu01' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu02' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu03' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu10' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu11' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu12' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ctu13' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'mix0' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'mix1' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'rcar_sound' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ssiu00' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: label 'ssiu01' defined but never referenced
>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:376: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/renesas,rsnd.yaml (original)
   +++ Documentation/devicetree/bindings/sound/renesas,rsnd.yaml (canonical)
   @@ -1,16 +1,16 @@
   #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/power/r8a7790-sysc.h>
   +
   rcar_sound: sound@ec500000 {
   -    #sound-dai-cells = <1>;
   compatible = "renesas,rcar_sound-r8a7790", "renesas,rcar_sound-gen2";
--
>> Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml:86: example 0: label 'mipi_dsi_in' defined but never referenced
   Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml:86: example 0: label 'mipi_dsi_panel_port' defined but never referenced
   Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml:86: example 0: label 'mipi_dsi_venc_port' defined but never referenced
   Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml:86: example 0: label 'mipi_out_panel' defined but never referenced
   Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml:86: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml (original)
   +++ Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml (canonical)
   @@ -1,33 +1,33 @@
   dsi@6000 {
   -      compatible = "amlogic,meson-g12a-dw-mipi-dsi";
   -      reg = <0x6000 0x400>;
--
   Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml (canonical)
   @@ -1,4 +1,4 @@
   rtc@a8 {
   -  compatible = "amlogic,meson-vrtc";
   -  reg = <0x000a8 0x4>;
   +    compatible = "amlogic,meson-vrtc";
   +    reg = <0x000a8 0x4>;
   };
>> Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml (original)
   +++ Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml (canonical)
   @@ -3,6 +3,7 @@
   dsi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   panel@0 {
   compatible = "feixin,k101-im2ba02";
   reg = <0>;
--
   compatible = "boe,th101mb31ig002-28a";
   reg = <0>;
   @@ -11,6 +12,7 @@
   reset-gpios = <&gpio 55 GPIO_ACTIVE_LOW>;
   rotation = <90>;
   power-supply = <&vcc_3v3>;
   +
   port {
   panel_in_dsi: endpoint {
   remote-endpoint = <&dsi_out_con>;
>> Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml (original)
--
   --- Documentation/devicetree/bindings/sound/nvidia,tegra20-das.yaml (original)
   +++ Documentation/devicetree/bindings/sound/nvidia,tegra20-das.yaml (canonical)
   @@ -1,6 +1,7 @@
   bus {
   #address-cells = <1>;
   #size-cells = <1>;
   +
   das@70000c00 {
   compatible = "nvidia,tegra20-das";
   reg = <0x70000c00 0x80>;
>> Documentation/devicetree/bindings/clock/imx1-clock.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/imx1-clock.yaml (original)
   +++ Documentation/devicetree/bindings/clock/imx1-clock.yaml (canonical)
   @@ -1,7 +1,7 @@
   #include <dt-bindings/clock/imx1-clock.h>
--
   --- Documentation/devicetree/bindings/timer/renesas,tmu.yaml (original)
   +++ Documentation/devicetree/bindings/timer/renesas,tmu.yaml (canonical)
   @@ -1,6 +1,7 @@
   #include <dt-bindings/clock/r8a7779-clock.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/power/r8a7779-sysc.h>
   +
   tmu0: timer@ffd80000 {
   compatible = "renesas,tmu-r8a7779", "renesas,tmu";
   reg = <0xffd80000 0x30>;
>> Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml (original)
   +++ Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/display/sitronix,st7735r.yaml:55: example 0: canonical form differs:
--
>> Documentation/devicetree/bindings/power/supply/richtek,rt9471.yaml:52: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/supply/richtek,rt9471.yaml (original)
   +++ Documentation/devicetree/bindings/power/supply/richtek,rt9471.yaml (canonical)
   @@ -1,22 +1,23 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
--
   -
   #clock-cells = <1>;
   #phy-cells = <0>;
   -
   vcca-supply = <&vcca_reg>;
   vddio-supply = <&vddio_reg>;
   -
   clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
   <&rpmhcc RPMH_CXO_CLK>;
   clock-names = "iface", "ref";
>> Documentation/devicetree/bindings/power/supply/bq256xx.yaml:97: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/supply/bq256xx.yaml (original)
   +++ Documentation/devicetree/bindings/power/supply/bq256xx.yaml (canonical)
   @@ -1,29 +1,27 @@
   -bat: battery {
   -  compatible = "simple-battery";
   -  constant-charge-current-max-microamp = <2040000>;
   -  constant-charge-voltage-max-microvolt = <4352000>;
   -  precharge-current-microamp = <180000>;
   -  charge-term-current-microamp = <180000>;
   -};
--
   Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.yaml (original)
   +++ Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.yaml (canonical)
   @@ -1,5 +1,5 @@
   iomcu_rst_controller {
   compatible = "hisilicon,hi3660-reset";
   +    #reset-cells = <2>;
   hisilicon,rst-syscon = <&iomcu>;
   -    #reset-cells = <2>;
   };
>> Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml:101: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml (original)
   +++ Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml (canonical)
   @@ -16,10 +16,10 @@
   #size-cells = <0x0>;
--
   -            codec-1 {
   -                    sound-dai = <&codec1>;
   -            };
   +        codec-1 {
   +            sound-dai = <&codec1>;
   +        };
   };
   };
>> Documentation/devicetree/bindings/timestamp/hte-consumer.yaml:36: example 0: node name 'hte_tegra_consumer' must use only [a-z0-9-]
   Documentation/devicetree/bindings/timestamp/hte-consumer.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/timestamp/hte-consumer.yaml (original)
   +++ Documentation/devicetree/bindings/timestamp/hte-consumer.yaml (canonical)
   @@ -1,4 +1,4 @@
   hte_tegra_consumer {
   -          timestamps = <&tegra_hte_aon 0x9>, <&tegra_hte_lic 0x19>;
   -          timestamp-names = "hte-gpio", "hte-i2c";
   +    timestamps = <&tegra_hte_aon 0x9>, <&tegra_hte_lic 0x19>;
   +    timestamp-names = "hte-gpio", "hte-i2c";
   };
--
   -    reg = <0x4000 0x1000>;
   -    interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
   -  };
   +    /* mdp_0: */
   +    iommu-ctx@4000 {
   +        compatible = "qcom,msm-iommu-v1-ns";
   +        reg = <0x4000 0x1000>;
   +        interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
   +    };
   };
>> Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml:80: example 0: label 'dsi0_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml:80: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml (original)
   +++ Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml (canonical)
   @@ -5,30 +5,27 @@
   #include <dt-bindings/power/qcom-rpmpd.h>
--
   +    mediatek,platform = <&afe>;
   +
   dai-link-0 {
   link-name = "ETDM3_OUT_BE";
   dai-format = "i2s";
   mediatek,clk-provider = "cpu";
   +
   codec {
   sound-dai = <&hdmi0>;
   };
>> Documentation/devicetree/bindings/phy/cdns,dphy-rx.yaml:35: example 0: label 'dphy0' defined but never referenced
   Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml:123: example 0: label 'tegra_hte_aon' defined but never referenced
   Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml:123: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml (original)
   +++ Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml (canonical)
   @@ -1,7 +1,7 @@
   tegra_hte_aon: timestamp@c1e0000 {
   -          compatible = "nvidia,tegra194-gte-aon";
   -          reg = <0xc1e0000 0x10000>;
   -          interrupts = <0 13 0x4>;
   -          nvidia,int-threshold = <1>;
--
   pinctrl-0 = <&can0_pins>;
   spi-max-frequency = <10000000>;
   -        bosch,mram-cfg = <0x0 0 0 16 0 0 1 1>;
   interrupt-parent = <&gpio1>;
   interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
   reset-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
   wakeup-source;
   +        bosch,mram-cfg = <0x0 0 0 16 0 0 1 1>;
   };
   };
>> Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml:50: example 0: label 'rtc' defined but never referenced
   Documentation/devicetree/bindings/pci/qcom,pcie-ipq4019.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pci/qcom,pcie-ipq4019.yaml (original)
   +++ Documentation/devicetree/bindings/pci/qcom,pcie-ipq4019.yaml (canonical)
   @@ -11,21 +11,17 @@
   reg-names = "dbi", "elbi", "parf", "config";
   ranges = <0x81000000 0x0 0x00000000 0x40200000 0x0 0x00100000>,
   <0x82000000 0x0 0x40300000 0x40300000 0x0 0x00d00000>;
   -
   device_type = "pci";
   -    linux,pci-domain = <0>;
--
   @@ -1,7 +1,7 @@
   rng@24000 {
   compatible = "ti,keystone-rng";
   -    ti,syscon-sa-cfg = <&sa_config>;
   +    reg = <0x24000 0x1000>;
   clocks = <&clksa>;
   clock-names = "fck";
   -    reg = <0x24000 0x1000>;
   +    ti,syscon-sa-cfg = <&sa_config>;
   };
>> Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml:38: example 0: label 'usb_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml (canonical)
   @@ -3,6 +3,6 @@
   usb_phy: usb-phy {
   compatible = "nuvoton,ma35d1-usb2-phy";
   clocks = <&clk USBD_GATE>;
   +    #phy-cells = <0>;
   nuvoton,sys = <&sys>;
   -    #phy-cells = <0>;
   };
>> Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml:124: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml (original)
   +++ Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml (canonical)
   @@ -1,9 +1,10 @@
   #include <dt-bindings/clock/pxa-clock.h>
   +
   gpio@40e00000 {
   compatible = "intel,pxa3xx-gpio";
   +    reg = <0x40e00000 0x10000>;
   #address-cells = <1>;
   #size-cells = <1>;
--
   ctu_can_fd_0: can@43c30000 {
   -  compatible = "ctu,ctucanfd";
   -  interrupts = <0 30 4>;
   -  clocks = <&clkc 15>;
   -  reg = <0x43c30000 0x10000>;
   +    compatible = "ctu,ctucanfd";
   +    reg = <0x43c30000 0x10000>;
   +    interrupts = <0 30 4>;
   +    clocks = <&clkc 15>;
   };
>> Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml:72: example 0: label 'dphy0' defined but never referenced
   Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml:132: example 1: label 'gpio' defined but never referenced
   Documentation/devicetree/bindings/rng/arm-cctrng.yaml:47: example 0: label 'arm_cctrng' defined but never referenced
   Documentation/devicetree/bindings/rng/arm-cctrng.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rng/arm-cctrng.yaml (original)
   +++ Documentation/devicetree/bindings/rng/arm-cctrng.yaml (canonical)
   @@ -1,6 +1,6 @@
   arm_cctrng: rng@60000000 {
   compatible = "arm,cryptocell-713-trng";
   +    reg = <0x60000000 0x10000>;
   interrupts = <0 29 4>;
--
   -            ranges;
   -        };
   +        device_type = "pci";
   +        #address-cells = <3>;
   +        #size-cells = <2>;
   +        #interrupt-cells = <1>;
   +        interrupt-map-mask = <0 0 0 0>;
   +        interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
   };
   };
>> Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml:68: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml (original)
   +++ Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml (canonical)
   @@ -1,88 +1,88 @@
   gpio@80840000 {
   -  compatible = "cirrus,ep9301-gpio";
   -  reg = <0x80840000 0x04>,
   -        <0x80840010 0x04>,
   -        <0x80840090 0x1c>;
   -  reg-names = "data", "dir", "intr";
   -  gpio-controller;
--
   ports {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   port@0 {
   reg = <0>;
   +
   dsi_in: endpoint {
   remote-endpoint = <&dpu_out>;
   };
>> Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml (canonical)
   @@ -1,8 +1,8 @@
   phy@11e80000 {
   compatible = "mediatek,mt8195-pcie-phy";
   -    #phy-cells = <0>;
   reg = <0x11e80000 0x10000>;
   reg-names = "sif";
   +    #phy-cells = <0>;
   nvmem-cells = <&pciephy_glb_intr>,
--
   trips {
   mpu0_crit: mpu0_crit {
   temperature = <125000>; /* milliCelsius */
   -            hysteresis = <2000>; /* milliCelsius */
   -            type = "critical";
   +                          hysteresis = <2000>; /* milliCelsius */
   +                          type = "critical";
   };
   };
   };
>> Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml (canonical)
   @@ -3,15 +3,15 @@
   phy@ff7c0000 {
   compatible = "rockchip,rk3399-typec-phy";
   reg = <0xff7c0000 0x40000>;
   -    rockchip,grf = <&grf>;
   extcon = <&fusb0>;
   clocks = <&cru SCLK_UPHY0_TCPDCORE>,
   -       <&cru SCLK_UPHY0_TCPDPHY_REF>;
--
   -            reg = <0x6 0x2>;
   -            bits = <7 2>;
   -        };
   -
   -        speed_bin: speed-bin@c{
   -            reg = <0xc 0x1>;
   -            bits = <2 3>;
   -        };
   };
   };
>> Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml:48: example 0: label 'hs_phy_0' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml (canonical)
   @@ -1,9 +1,9 @@
   #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
--
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   gpio@2300000 {
   compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
   reg = <0x2300000 0x10000>;
   Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml:85: example 0: label 'cec_AO' defined but never referenced
   Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml:43: example 0: label 'efuse' defined but never referenced
   Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml:43: example 0: label 'eth_mac' defined but never referenced
   Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml:43: example 0: label 'sn' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml:241: example 0: label 'usbphyc' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml:241: example 0: label 'usbphyc_port0' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml:241: example 0: label 'usbphyc_port1' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml:241: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml (original)
   +++ Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/clock/stm32mp1-clks.h>
   #include <dt-bindings/reset/stm32mp1-resets.h>
   +
   usbphyc: usbphyc@5a006000 {
   compatible = "st,stm32mp1-usbphyc";
   reg = <0x5a006000 0x1000>;
   @@ -23,6 +24,7 @@
   st,tune-squelch-level = <3>;
   st,tune-hs-rx-offset = <2>;
   st,no-lsfs-sc;
   +
   connector {
   compatible = "usb-a-connector";
   vbus-supply = <&vbus_sw>;
>> Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml:45: example 0: label 'cpu_alert1' defined but never referenced
>> Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml:45: example 0: label 'cpu_crit' defined but never referenced
>> Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml:45: example 0: label 'cpu_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/clock/stm32mp1-clks.h>
   +
   dts: thermal@50028000 {
   compatible = "st,stm32-thermal";
   reg = <0x50028000 0x100>;
   @@ -13,8 +14,11 @@
--
   +    reg-names = "gpio", "pwm";
   +    ngpios = <17>;
   +    gpio-controller;
   +    #gpio-cells = <2>;
   +    #pwm-cells = <2>;
   +    interrupt-controller;
   +    #interrupt-cells = <2>;
   +    interrupts = <87>, <88>, <89>;
   +    clocks = <&coreclk 0>;
   };
>> Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml:103: example 0: label 'venus' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml (canonical)
   @@ -1,10 +1,10 @@
   iomuxc: pinctrl@30330000 {
   -  compatible = "fsl,imx7d-iomuxc";
   -  reg = <0x30330000 0x10000>;
   +    compatible = "fsl,imx7d-iomuxc";
   +    reg = <0x30330000 0x10000>;
--
   -
   clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
   clock-names = "cfg_ahb";
   -
   #phy-cells = <0>;
   -
   resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
   -
   vdd-supply = <&regulator_fixed_5p0>;
   };
>> Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml:180: example 0: label 'cru' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml:180: example 0: label 'cru_csi_in' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml:180: example 0: label 'cru_parallel_in' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml:180: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml (original)
   +++ Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml (canonical)
   @@ -22,9 +22,9 @@
   #size-cells = <0>;
--
>> Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml:124: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   tlmm: pinctrl@fd510000 {
   compatible = "qcom,msm8974-pinctrl";
   reg = <0xfd510000 0x4000>;
   @@ -8,6 +9,17 @@
   interrupt-controller;
--
   -    hstx-trim-primary@1eb {
   -      reg = <0x1eb 0x1>;
   -      bits = <1 4>;
   +        hstx-trim-primary@1eb {
   +            reg = <0x1eb 0x1>;
   +            bits = <1 4>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml:60: example 0: label 'ufsphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/mt8183-clk.h>
   +
   ufsphy: ufs-phy@11fa0000 {
   compatible = "mediatek,mt8183-ufsphy";
   reg = <0x11fa0000 0xc000>;
   Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml:68: example 0: label 'venus' defined but never referenced
   Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml:68: example 0: canonical form differs:
--
   -    arm,trig-in-types = <GEN_HALTREQ GEN_RESTARTREQ>;
   -    arm,trig-conn-name = "g_counter";
   -  };
   +    trig-conns@2 {
   +        reg = <2>;
   +        arm,trig-in-sigs = <1 6>;
   +        arm,trig-in-types = <GEN_HALTREQ GEN_RESTARTREQ>;
   +        arm,trig-conn-name = "g_counter";
   +    };
   };
>> Documentation/devicetree/bindings/phy/mediatek,tphy.yaml:291: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,tphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,tphy.yaml (canonical)
   @@ -2,6 +2,7 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/phy/phy.h>
   +
   usb@11271000 {
   compatible = "mediatek,mt8173-mtu3", "mediatek,mtu3";
   reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
--
>> Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml:139: example 0: label 'csiphy1_ep' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml:139: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml (canonical)
   @@ -3,7 +3,6 @@
--
   ports {
   Documentation/devicetree/bindings/nvmem/apple,efuses.yaml:40: example 0: label 'ecid' defined but never referenced
>> Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:49: example 0: label 'usb3phy' defined but never referenced
   Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml:211: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml (original)
   +++ Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml (canonical)
   @@ -8,7 +8,6 @@
   reset-names = "i2c";
   dmas = <&apbdma 16>, <&apbdma 16>;
   dma-names = "rx", "tx";
   -
   #address-cells = <1>;
   #size-cells = <0>;
--
   reg = <0x00500000 0x400000>,
   Documentation/devicetree/bindings/iio/proximity/rfdigital,rfd77402.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/rfdigital,rfd77402.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/rfdigital,rfd77402.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml:32: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml (canonical)
   @@ -1,4 +1,4 @@
   proximity {
   -  compatible = "google,cros-ec-mkbp-proximity";
   -  label = "proximity-wifi-lte";
   +    compatible = "google,cros-ec-mkbp-proximity";
   +    label = "proximity-wifi-lte";
   };
   Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml:142: example 0: label 'vcodec_dec' defined but never referenced
--
   i2s0-bus-pins {
   samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
   "gpz0-4", "gpz0-5", "gpz0-6";
   @@ -23,6 +22,5 @@
   samsung,pin-pud = <0>;
   samsung,pin-drv = <0>;
   };
   -
   // ...
   };
>> Documentation/devicetree/bindings/iio/proximity/tyhx,hx9023s.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/tyhx,hx9023s.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/tyhx,hx9023s.yaml (canonical)
   @@ -1,36 +1,41 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  proximity@2a {
   -    compatible = "tyhx,hx9023s";
--
   Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml:119: example 0: label 'serial_default' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml:119: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   tlmm: pinctrl@1000000 {
   compatible = "qcom,msm8953-pinctrl";
   reg = <0x01000000 0x300000>;
>> Documentation/devicetree/bindings/iio/proximity/st,vl53l0x.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/st,vl53l0x.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/st,vl53l0x.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/media/rockchip-isp1.yaml:196: example 0: label 'i2c7' defined but never referenced
   Documentation/devicetree/bindings/media/rockchip-isp1.yaml:196: example 0: label 'isp0' defined but never referenced
   Documentation/devicetree/bindings/media/rockchip-isp1.yaml:196: example 0: label 'parent0' defined but never referenced
--
   i2c@3100 {
   +    compatible = "fsl,mpc8544-i2c", "fsl-i2c";
   +    reg = <0x3100 0x100>;
   #address-cells = <1>;
   #size-cells = <0>;
   -    compatible = "fsl,mpc8544-i2c", "fsl-i2c";
   -    reg = <0x3100 0x100>;
   interrupts = <43 2>;
   interrupt-parent = <&mpic>;
   clock-frequency = <400000>;
>> Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml:81: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   proximity {
   compatible = "devantech,srf04";
   trig-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
   Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml:521: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml (original)
--
   reg = <0x400e8000 0x4000>;
   +
   pinctrl_lpuart1: lpuart1grp {
   fsl,pins =
   -          <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
   -          <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
   +            <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
   +            <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
   };
   };
>> Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml:201: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml (original)
   +++ Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml (canonical)
   @@ -1,59 +1,59 @@
   #include <dt-bindings/soc/ti,sci_pm_domain.h>
--
   -    compatible = "ti,tps65217-charger";
   -    interrupts = <0>, <1>;
   -    interrupt-names = "USB", "AC";
   -  };
   +    charger {
   +        compatible = "ti,tps65217-charger";
   +        interrupts = <0>, <1>;
   +        interrupt-names = "USB", "AC";
   +    };
   };
>> Documentation/devicetree/bindings/thermal/brcm,ns-thermal.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/brcm,ns-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/brcm,ns-thermal.yaml (canonical)
   @@ -11,6 +11,9 @@
   coefficients = <(-556) 418000>;
   thermal-sensors = <&thermal>;
--
   uart_pins: uart-pins {
   pins = "GPIO_6", "GPIO_7";
   function = "uart";
   };
   -
   -    uart2_pins: uart2-pins {
   -        pins = "GPIO_12", "GPIO_13";
   -        function = "uart2";
   -    };
   };
>> Documentation/devicetree/bindings/phy/microchip,sparx5-serdes.yaml:108: example 0: label 'serdes' defined but never referenced
>> Documentation/devicetree/bindings/phy/microchip,sparx5-serdes.yaml:108: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/microchip,sparx5-serdes.yaml (original)
   +++ Documentation/devicetree/bindings/phy/microchip,sparx5-serdes.yaml (canonical)
   @@ -1,6 +1,6 @@
   serdes: serdes@10808000 {
   -  compatible = "microchip,sparx5-serdes";
   -  #phy-cells = <1>;
   -  clocks = <&sys_clk>;
   -  reg = <0x10808000 0x5d0000>;
   +    compatible = "microchip,sparx5-serdes";
   +    reg = <0x10808000 0x5d0000>;
--
   +                remote-endpoint = <&vin6csi20>;
   +            };
   +
   +            csi20vin7: endpoint@7 {
   +                reg = <7>;
   +                remote-endpoint = <&vin7csi20>;
   +            };
   };
   +    };
   };
>> Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml (canonical)
   @@ -1,10 +1,10 @@
   #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
--
   +    compatible = "aspeed,ast2500-cf-fsi-master";
   +    clock-gpios = <&gpio 0>;
   +    data-gpios = <&gpio 1>;
   +    enable-gpios = <&gpio 2>;
   +    trans-gpios = <&gpio 3>;
   +    mux-gpios = <&gpio 4>;
   +    memory-region = <&coldfire_memory>;
   +    aspeed,cvic = <&cvic>;
   +    aspeed,sram = <&sram>;
   };
>> Documentation/devicetree/bindings/phy/socionext,uniphier-usb3hs-phy.yaml:152: example 0: label 'usb_hsphy0' defined but never referenced
   Documentation/devicetree/bindings/rtc/nxp,pcf2123.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/nxp,pcf2123.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/nxp,pcf2123.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml:43: example 0: label 'reset' defined but never referenced
   Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml:43: example 0: canonical form differs:
--
   pins = "gpio53", "gpio54", "gpio55";
   function = "qup15";
   };
   -
   -        cs-pins {
   -            pins = "gpio56";
   -            function = "gpio";
   -        };
   };
   };
>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml:272: example 0: label 'cci_i2c1' defined but never referenced
   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml:272: example 0: label 'ov7251_ep' defined but never referenced
   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml:272: example 0: label 'ov8856_ep' defined but never referenced
   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml:272: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml (original)
   +++ Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml (canonical)
   @@ -3,14 +3,12 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   -        scl-pins {
   -            pins = "gpio20";
   -            function = "blsp_i2c_scl_a2";
   -        };
   };
   };
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: tab character in DTS line:             <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: tab character in DTS line:             <0x240 0x4A8 0x000 0x0 0x0	0x140>;
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: label 'iomuxc' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: label 'pinctrl_uart2' defined but never referenced
>> Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml:122: example 0: label 'i2c0' defined but never referenced
   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml:122: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml (original)
   +++ Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml (canonical)
   @@ -2,15 +2,14 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   +    };
   };
   Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml (original)
   +++ Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   video-codec@580d0000 {
   compatible = "st,stm32mp25-vdec";
>> reg = <0x580d0000 0x3c8>;Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml:149: example 0: label 'pvt' defined but never referenced
   Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml:149: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml (original)
   +++ Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml (canonical)
   @@ -5,12 +5,12 @@
   <0xe0680200 0x200>,
   <0xe0680400 0xc00>;
   reg-names = "common", "ts", "pd", "vm";
   -    intel,vm-map = [03 01 04 ff ff];
   clocks = <&osc0>;
   resets = <&rcu0 0x40 7>;
--
   reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
   clocks = <&clk_vpu>, <&clk_vapb>;
   clock-names = "vpu", "vapb";
   -    };
   -
   -    phy {
   -        compatible = "amlogic,axg-mipi-pcie-analog-phy";
   -        #phy-cells = <0>;
   +        amlogic,ao-sysctrl = <&sysctrl_AO>;
   };
>> };Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml:104: example 0: label 'pcie30phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml:104: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml (canonical)
   @@ -1,13 +1,14 @@
   #include <dt-bindings/clock/rk3568-cru.h>
   +
   pcie30phy: phy@fe8c0000 {
   -  compatible = "rockchip,rk3568-pcie3-phy";
   -  reg = <0xfe8c0000 0x20000>;
   -  #phy-cells = <0>;
   -  clocks = <&pmucru CLK_PCIE30PHY_REF_M>,
--
   --- Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml (original)
   +++ Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml (canonical)
   @@ -12,6 +12,6 @@
   resets = <&tegra_car 125>, /* hda */
   <&tegra_car 128>, /* hda2hdmi */
   <&tegra_car 111>; /* hda2codec_2x */
   -    reset-names = "hda", "hda2hdmi", "hda2codec_2x";
   +             reset-names = "hda", "hda2hdmi", "hda2codec_2x";
   nvidia,model = "jetson-tk1-hda";
   };
>> Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml:73: example 0: label 'usb0_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml (original)
   +++ Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml (canonical)
   @@ -1,8 +1,8 @@
   usb0_phy: phy@4100000 {
   -  compatible = "ti,am654-usb2", "ti,omap-usb2";
   -  reg = <0x4100000 0x54>;
   -  syscon-phy-power = <&scm_conf 0x4000>;
   -  clocks = <&k3_clks 151 0>, <&k3_clks 151 1>;
   -  clock-names = "wkupclk", "refclk";
   -  #phy-cells = <0>;
--
   -  interrupts = <7>, <8>, <9>, <10>, <11>;
   -  clocks = <&lx_clk>;
   +    compatible = "realtek,rtl9302-timer", "realtek,otto-timer";
   +    reg = <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
   +          <0x3230 0x10>, <0x3240 0x10>;
   +    interrupt-parent = <&intc>;
   +    interrupts = <7>, <8>, <9>, <10>, <11>;
   +    clocks = <&lx_clk>;
   };
   Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml:91: example 0: label 'cif_in' defined but never referenced
>> Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/clock/r9a06g032-sysctrl.h>
   +
   rtc@40006000 {
   compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
   reg = <0x40006000 0x1000>;
   Documentation/devicetree/bindings/reset/ti,sci-reset.yaml:47: example 0: label 'k3_reset' defined but never referenced
--
   -
   -  interrupt-parent = <&cpuintc>;
   -  interrupts = <3>;
   +    compatible = "loongson,ls2k0500-eiointc";
   +    reg = <0x1fe10000 0x10000>;
   +    interrupt-controller;
   +    #interrupt-cells = <1>;
   +    interrupt-parent = <&cpuintc>;
   +    interrupts = <3>;
   };
>> Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml:83: example 0: node name 'cp0_usb3_0' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml:83: example 0: node name 'cp0_usb3_1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml:83: example 0: label 'cp0_utmi' defined but never referenced
>> Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml:83: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/marvell,armada-cp110-utmi-phy.yaml (canonical)
   @@ -1,33 +1,33 @@
   cp0_utmi: utmi@580000 {
   -  compatible = "marvell,cp110-utmi-phy";
   -  reg = <0x580000 0x2000>;
   -  marvell,system-controller = <&cp0_syscon0>;
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    compatible = "marvell,cp110-utmi-phy";
--
   +++ Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-osc-clk.yaml (canonical)
   @@ -1,7 +1,7 @@
   osc24M: clk@1c20050 {
   -    #clock-cells = <0>;
   compatible = "allwinner,sun4i-a10-osc-clk";
   reg = <0x01c20050 0x4>;
   +    #clock-cells = <0>;
   clock-frequency = <24000000>;
   clock-output-names = "osc24M";
   };
>> Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml:151: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml (canonical)
   @@ -1,25 +1,24 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
   compatible = "adi,ltc2664";
   reg = <0>;
--
>> Documentation/devicetree/bindings/phy/allwinner,sun8i-r40-usb-phy.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/allwinner,sun8i-r40-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/allwinner,sun8i-r40-usb-phy.yaml (canonical)
   @@ -3,7 +3,6 @@
   #include <dt-bindings/reset/sun8i-r40-ccu.h>
--
   +        compatible = "everest,es8326";
   +        reg = <0x19>;
   +        clocks = <&clks 10>;
   +        clock-names = "mclk";
   +        #sound-dai-cells = <0>;
   +        everest,jack-pol = [0e];
   +        everest,interrupt-src = [08];
   +        everest,interrupt-clk = [00];
   +    };
   };
>> Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml:176: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml (canonical)
   @@ -1,27 +1,29 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  proximity@28 {
   -    compatible = "semtech,sx9324";
--
   Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml:163: example 0: label 'tsadc' defined but never referenced
   Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml:139: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml (original)
   +++ Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/watchdog/aspeed-wdt.h>
   +
   watchdog@1e785040 {
   compatible = "aspeed,ast2600-wdt";
   reg = <0x1e785040 0x40>;
>> Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml (canonical)
   @@ -2,10 +2,10 @@
   #include <dt-bindings/power/r8a77980-sysc.h>
--
   -        #clock-cells = <1>;
   -        #power-domain-cells = <0>;
   +    compatible = "renesas,r9a06g032-sysctrl";
   +    reg = <0x4000c000 0x1000>;
   +    clocks = <&ext_mclk>, <&ext_rtc_clk>, <&ext_jtag_clk>,
   +             <&ext_rgmii_ref>;
   +    clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
   +    #clock-cells = <1>;
   +    #power-domain-cells = <0>;
   };
>> Documentation/devicetree/bindings/power/power-domain.yaml:78: example 0: label 'power' defined but never referenced
>> Documentation/devicetree/bindings/power/power-domain.yaml:78: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/power-domain.yaml (original)
   +++ Documentation/devicetree/bindings/power/power-domain.yaml (canonical)
   @@ -3,6 +3,5 @@
   reg = <0x12340000 0x1000>;
   #power-domain-cells = <1>;
   };
   -
   // The node above defines a power controller that is a PM domain provider and
   // expects one cell as its phandle argument.
>> Documentation/devicetree/bindings/power/power-domain.yaml:88: example 1: label 'child2' defined but never referenced
>> Documentation/devicetree/bindings/power/power-domain.yaml:88: example 1: label 'controllers' defined but never referenced
   Documentation/devicetree/bindings/power/power-domain.yaml:88: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/power/power-domain.yaml (original)
   +++ Documentation/devicetree/bindings/power/power-domain.yaml (canonical)
   @@ -10,7 +10,6 @@
   power-domains = <&parent2 0>;
   #power-domain-cells = <1>;
   };
   -
   // The nodes above define two power controllers: 'parent' and 'child'.
   // Domains created by the 'child' power controller are subdomains of '0' power
--
   mbox_ipu: mbox-ipu {
   ti,mbox-tx = <0 0 0>;
   ti,mbox-rx = <1 0 0>;
   };
   -    mbox_dsp: mbox-dsp {
   -        ti,mbox-tx = <3 0 0>;
   -        ti,mbox-rx = <2 0 0>;
   -    };
   };
   Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml:264: example 1: label 'mbox_wkupm3' defined but never referenced
>> Documentation/devicetree/bindings/power/power-domain.yaml:106: example 2: label 'child3' defined but never referenced
   Documentation/devicetree/bindings/power/power-domain.yaml:106: example 2: canonical form differs:
   --- Documentation/devicetree/bindings/power/power-domain.yaml (original)
   +++ Documentation/devicetree/bindings/power/power-domain.yaml (canonical)
   @@ -14,17 +14,17 @@
   };
--
   -            };
   +        isc_0: endpoint {
   +            remote-endpoint = <&ov7740_0>;
   +            hsync-active = <1>;
   +            vsync-active = <0>;
   +            pclk-sample = <1>;
   +            bus-width = <8>;
   +        };
   };
   };
>> Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml:74: example 0: label 'spi1' defined but never referenced
>> Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml:74: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml (original)
   +++ Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml (canonical)
   @@ -16,6 +16,6 @@
   compatible = "mmc-spi-slot";
   reg = <0>;
   gpios = <&pioC 4 GPIO_ACTIVE_HIGH>;    /* CD */
   -        spi-max-frequency = <25000000>;
   +                spi-max-frequency = <25000000>;
   };
   };
--
   -  interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
   -  resets = <&rst 0>;
   +    compatible = "sophgo,sg2044-spifmc-nor";
   +    reg = <0x1000000 0x4000000>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
   +    clocks = <&clk 0>;
   +    interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
   +    resets = <&rst 0>;
   };
>> Documentation/devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml (canonical)
   @@ -1,9 +1,9 @@
   phy@46000 {
   -      compatible = "amlogic,g12a-usb3-pcie-phy";
   -      reg = <0x46000 0x2000>;
   -      clocks = <&ref_clk>;
   -      clock-names = "ref_clk";
   -      resets = <&phy_reset>;
   -      reset-names = "phy";
--
   -    interrupts = <17 IRQ_TYPE_EDGE_BOTH>;
   -  };
   +    temperature-sensor@48 {
   +        compatible = "ams,as6200";
   +        reg = <0x48>;
   +        vs-supply = <&vs>;
   +        interrupt-parent = <&gpio1>;
   +        interrupts = <17 IRQ_TYPE_EDGE_BOTH>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml (canonical)
   @@ -1,11 +1,13 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  proximity@70 {
   -    compatible = "maxbotix,mb1232";
--
   "Headset Stereophone", "HPR",
   "Headset Stereophone", "HPL",
   "DMICDAT", "Digital Mic";
   -
   nvidia,i2s-controller = <&i2s>;
   nvidia,audio-codec = <&codec>;
   -
   -    clocks = <&clk 112>, <&clk 113>, <&clk 93>;
   -    clock-names = "pll_a", "pll_a_out0", "mclk";
   };
>> Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml (canonical)
   @@ -6,24 +6,24 @@
   io-channels = <&ads1015 1>;
   io-channel-names = "sensor-channel";
   temperature-lookup-table = <
   -          (-40000) 2578
   -          (-39000) 2577
   -          (-38000) 2576
   -          (-37000) 2575
--
   @@ -1,8 +1,8 @@
   interrupt-controller@14000000 {
   compatible = "arm,versatile-fpga-irq";
   +    reg = <0x14000000 0x100>;
   #interrupt-cells = <1>;
   interrupt-controller;
   -    reg = <0x14000000 0x100>;
   clear-mask = <0xffffffff>;
   valid-mask = <0x003fffff>;
   };
>> Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml:105: example 0: label 'csi0' defined but never referenced
>> Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml:105: example 0: label 'csi_from_ov5640' defined but never referenced
>> Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml:105: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml (original)
   +++ Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml (canonical)
   @@ -15,9 +15,10 @@
   remote-endpoint = <&ov5640_to_csi>;
   bus-width = <8>;
   hsync-active = <1>; /* Active high */
   -            vsync-active = <0>; /* Active low */
   -            data-active = <1>;  /* Active high */
   -            pclk-sample = <1>;  /* Rising */
   +                           vsync-active = <0>; /* Active low */
--
   interconnect@fc380000 {
   +    compatible = "qcom,msm8974-bimc";
   reg = <0xfc380000 0x6a000>;
   -    compatible = "qcom,msm8974-bimc";
   #interconnect-cells = <1>;
   clock-names = "bus", "bus_a";
   clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
>> Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml:48: example 0: label 'spi0' defined but never referenced
   Documentation/devicetree/bindings/media/renesas,imr.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/renesas,imr.yaml (original)
   +++ Documentation/devicetree/bindings/media/renesas,imr.yaml (canonical)
   @@ -3,10 +3,10 @@
   #include <dt-bindings/power/r8a7795-sysc.h>
--
   interconnect@16e0000 {
   +    compatible = "qcom,sc7280-aggre1-noc";
   reg = <0x016e0000 0x1c080>;
   -    compatible = "qcom,sc7280-aggre1-noc";
   #interconnect-cells = <2>;
   -    qcom,bcm-voters = <&apps_bcm_voter>;
   clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
   <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
   +    qcom,bcm-voters = <&apps_bcm_voter>;
   };
>> Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml (canonical)
   @@ -1,8 +1,8 @@
   phy@48 {
   -  compatible = "sophgo,cv1800b-usb2-phy";
   -  reg = <0x48 0x4>;
   -  #phy-cells = <0>;
   -  clocks = <&clk 93>, <&clk 94>, <&clk 95>;
   -  clock-names = "app", "stb", "lpm";
   -  resets = <&rst 58>;
--
   -               <APPLE_PINMUX(151, 1)>,
   -               <APPLE_PINMUX(32, 1)>;
   +        pcie_pins: pcie-pins {
   +            pinmux = <APPLE_PINMUX(150, 1)>,
   +                     <APPLE_PINMUX(151, 1)>,
   +                     <APPLE_PINMUX(32, 1)>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/spi/realtek,rtl-spi.yaml:36: example 0: label 'spi' defined but never referenced
   Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml:58: example 0: label 'gpio0' defined but never referenced
   Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml (original)
   +++ Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   gpio0: gpio@e0050000 {
   compatible = "renesas,em-gio";
   reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
>> Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml (canonical)
   @@ -1,11 +1,11 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
   +
   clock-controller@100000 {
   compatible = "qcom,gcc-sdm660";
   reg = <0x00100000 0x94000>;
   #clock-cells = <1>;
   #reset-cells = <1>;
--
   };
   +
   sysi {
   compatible = "current-sense-shunt";
   io-channels = <&tiadc 0>;
   #io-channel-cells = <0>;
   -
   /* Divide the voltage by 3300000/1000000 (or 3.3) for the current. */
   shunt-resistor-micro-ohms = <3300000>;
   };
>> Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-display-clk.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-display-clk.yaml (original)
   +++ Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-display-clk.yaml (canonical)
   @@ -1,8 +1,8 @@
   clk@1c20104 {
   +    compatible = "allwinner,sun4i-a10-display-clk";
   +    reg = <0x01c20104 0x4>;
   #clock-cells = <0>;
   #reset-cells = <0>;
   -    compatible = "allwinner,sun4i-a10-display-clk";
   -    reg = <0x01c20104 0x4>;
--
   Documentation/devicetree/bindings/perf/arm,cmn.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/perf/arm,cmn.yaml (original)
   +++ Documentation/devicetree/bindings/perf/arm,cmn.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   pmu@50000000 {
   compatible = "arm,cmn-600";
   reg = <0x50000000 0x4000000>;
>> Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/spacemit,k1-syscon.h>
   +
   phy@c0b10000 {
   compatible = "spacemit,k1-combo-phy";
   reg = <0xc0b10000 0x1000>;
   @@ -18,6 +19,6 @@
   "dbi",
--
   +
   +    audio-codec@2b {
   +        compatible = "neofidelity,ntp8835";
   +        reg = <0x2b>;
   +        #sound-dai-cells = <0>;
   +        reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
   +        clocks = <&clkc 551>, <&clkc 552>, <&clkc 553>, <&clkc 554>;
   +        clock-names = "wck", "bck", "scl", "mclk";
   +    };
   +};
>> Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml (canonical)
   @@ -1,8 +1,8 @@
   #include <dt-bindings/clock/mediatek,mtmips-sysc.h>
--
   --- Documentation/devicetree/bindings/power/supply/sbs,sbs-charger.yaml (original)
   +++ Documentation/devicetree/bindings/power/supply/sbs,sbs-charger.yaml (canonical)
   @@ -9,5 +9,5 @@
   reg = <0x9>;
   interrupt-parent = <&gpio6>;
   interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
   -   };
   +    };
   };
   Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml:63: example 0: label 'topckgen' defined but never referenced
>> Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml (original)
   +++ Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi@9c002d80 {
   compatible = "sunplus,sp7021-spi";
   reg = <0x9c002d80 0x80>, <0x9c002e00 0x80>;
   Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml:76: example 0: label 'watchdog' defined but never referenced
   Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml:76: example 0: canonical form differs:
--
   -
   clocks = <&lxbus_clock>;
   timeout-sec = <20>;
   -
   interrupt-parent = <&rtlintc>;
   interrupt-names = "phase1", "phase2";
   interrupts = <19>, <18>;
   +    realtek,reset-mode = "soc";
   };
   Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml:131: example 0: label 'ipmmu_mx' defined but never referenced
>> Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml:112: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml (canonical)
   @@ -1,20 +1,22 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  proximity@28 {
   -    compatible = "semtech,sx9310";
--
   +    compatible = "qcom,ipq5332-gcc";
   +    reg = <0x01800000 0x80000>;
   +    clocks = <&xo_board>,
   +             <&sleep_clk>,
   +             <&pcie_2lane_phy_pipe_clk>,
   +             <&pcie_2lane_phy_pipe_clk_x1>,
   +             <&usb_pcie_wrapper_pipe_clk>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   };
>> Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml:86: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/mt8173-clk.h>
   +
   dsi-phy@10215000 {
   compatible = "mediatek,mt8173-mipi-tx";
   reg = <0x10215000 0x1000>;
   Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml (original)
--
   +            compatible = "xlnx,zynqmp-power";
   +            interrupt-parent = <&gic>;
   +            interrupts = <0 35 4>;
   +            mboxes = <&ipi_mailbox_pmu1 0>,
   +                     <&ipi_mailbox_pmu1 1>;
   +            mbox-names = "tx", "rx";
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml:81: example 0: label 'pcie0_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml:81: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml (canonical)
   @@ -1,13 +1,13 @@
   pcie0_phy: phy@106800 {
   compatible = "lantiq,vrx200-pcie-phy";
   reg = <0x106800 0x100>;
   -    lantiq,rcu = <&rcu0>;
   -    lantiq,rcu-endian-offset = <0x4c>;
   -    lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
   -    big-endian;
--
   };
   Documentation/devicetree/bindings/mmc/ti,da830-mmc.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mmc/ti,da830-mmc.yaml (original)
   +++ Documentation/devicetree/bindings/mmc/ti,da830-mmc.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   mmc@1c40000 {
   compatible = "ti,da830-mmc";
   reg = <0x40000 0x1000>;
>> Documentation/devicetree/bindings/spi/renesas,hspi.yaml:47: example 0: label 'hspi0' defined but never referenced
   Documentation/devicetree/bindings/iio/adc/adi,ad7779.yaml:118: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/adi,ad7779.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/adi,ad7779.yaml (canonical)
   @@ -1,17 +1,18 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;

vim +/cpg_clocks +235 Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml

d9563c972c167e Geert Uytterhoeven 2020-05-18  232  
d9563c972c167e Geert Uytterhoeven 2020-05-18  233  examples:
d9563c972c167e Geert Uytterhoeven 2020-05-18  234    - |
d9563c972c167e Geert Uytterhoeven 2020-05-18 @235      #include <dt-bindings/clock/r8a7740-clock.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
