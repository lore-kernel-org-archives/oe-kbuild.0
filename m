Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC9D1862
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777853439; cv=none; b=GLsGqzos86WIRpJNmW/5H6uybrMBwAONneUXk+FfDosqkZE3DdENi6SktVJCaUyEkRPR5F7yX6ThVj8jRFa+lqJhRS0uMRZWC+72TKuf9cCr4VOA809tSJDZLiJO6P/wOVgLMnMJGB0JTvaeevQkgfwtWLq3/ycE0uajRDF0nF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777853439; c=relaxed/simple;
	bh=k8kenD0Dg0SORSipcCDyW4TMkQdBBvyakO+dwBzmoKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jLL0giZ8gc/YQdvRZu2iVQ0+FQx6HUVz8dM3cvZg+/thAA16znhJQrDwDvw60zwk92ewIpOQqFnOfJGvo256TA0UVUSDiWkktEr+SPBs4M3yth18h0dbeX1lKLseOZcCkstcwp2o3zB/zeKlNlNsF1gt/zvpjL1Dgt+BSv9mq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UY4JWR5l; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UY4JWR5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777853429; x=1809389429;
  h=date:from:to:cc:subject:message-id;
  bh=k8kenD0Dg0SORSipcCDyW4TMkQdBBvyakO+dwBzmoKc=;
  b=UY4JWR5lBQUsIBt+E8RmTWaU6c3TIwnLRrQDjY/Uyhnxa86yGYaKwGEQ
   MsDNtf+tE4CeKUB8x7qZnHAkDegOpZRn46okYThY0/VLejoVCW9wMqL4E
   BPWMxLyRuYl80PQKUmp4KJPP8Bv3A6KSpy5AoddslC82px0n8xrNJnTQc
   Fu/4udnJa0RmfvgWOQOBha6FWhHDrBuMb3MLidQ60GZSvJ99lUFbYl6Tt
   klK0P9ww4nel9F2+VO4AX7r0zPsfAMeDDhFf467OaOj4cxWHgnODFMDhr
   oX8dF24QBbz9SXk9dBdG1TQjjToLVWj8Q9wohURi6YllmYqFzaBJdalfE
   A==;
X-CSE-ConnectionGUID: gSkOk+PqSvWGA8V6bcToqg==
X-CSE-MsgGUID: vim/oUKWRB+6XrVJzyUGVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77736318"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="77736318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 17:10:28 -0700
X-CSE-ConnectionGUID: J1oSEg1zTkuR0tubyv5TWA==
X-CSE-MsgGUID: 2LUVvz1JQnWvb4uF2zgErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="235433118"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2026 17:10:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJgtD-000000005fJ-3sHU;
	Mon, 04 May 2026 00:10:23 +0000
Date: Mon, 04 May 2026 02:09:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml:157:
 example 0: canonical form differs:
Message-ID: <202605040137.w2LP1Jm9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml:157: example 0: canonical form differs:"
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
date:   13 days ago
:::::: branch date: 4 days ago
:::::: commit date: 13 days ago
config: microblaze-randconfig-2052-20260430 (https://download.01.org/0day-ci/archive/20260504/202605040137.w2LP1Jm9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040137.w2LP1Jm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040137.w2LP1Jm9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   #include <dt-bindings/iio/adc/fsl-imx25-gcq.h>
   +
   soc {
   #address-cells = <1>;
   #size-cells = <1>;
   +
   adc@50030800 {
   compatible = "fsl,imx25-gcq";
   reg = <0x50030800 0x60>;
   Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml:101: example 0: label 'split0' defined but never referenced
>> Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml:157: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml (canonical)
   @@ -5,10 +5,10 @@
   #include <dt-bindings/reset/qcom,sdm845-aoss.h>
   #include <dt-bindings/reset/qcom,sdm845-pdc.h>
   #include <dt-bindings/mailbox/qcom-ipcc.h>
   +
   remoteproc@8a00000 {
   compatible = "qcom,sc7280-wpss-pil";
   reg = <0x08a00000 0x10000>;
--
   +                 <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
   +    clocks = <&rcc CK_BUS_HPDMA1>;
   +    #dma-cells = <3>;
   };
>> Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml:52: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml (canonical)
   @@ -1,14 +1,15 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
   #include <dt-bindings/power/qcom-rpmpd.h>
   +
   clock-controller@100000 {
   -  compatible = "qcom,gcc-sc8180x";
   -  reg = <0x00100000 0x1f0000>;
   -  clocks = <&rpmhcc RPMH_CXO_CLK>,
--
   @@ -1,5 +1,5 @@
   pdc_reset: reset-controller@b2e0000 {
   -  compatible = "qcom,sdm845-pdc-global";
   -  reg = <0xb2e0000 0x20000>;
   -  #reset-cells = <1>;
   +    compatible = "qcom,sdm845-pdc-global";
   +    reg = <0xb2e0000 0x20000>;
   +    #reset-cells = <1>;
   };
   Documentation/devicetree/bindings/sound/wlf,wm8524.yaml:35: example 0: label 'wm8524' defined but never referenced
>> Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml:65: example 0: label 'mmc0' defined but never referenced
   Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml:65: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml (original)
   +++ Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml (canonical)
   @@ -1,19 +1,17 @@
   #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
   #include <dt-bindings/dma/jz4780-dma.h>
   +
   mmc0: mmc@13450000 {
   -  compatible = "ingenic,jz4780-mmc";
   -  reg = <0x13450000 0x1000>;
--
   @@ -1,7 +1,9 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   audio-codec@34 {
   compatible = "awinic,aw88395";
   reg = <0x34>;
>> Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml:122: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml (canonical)
   @@ -7,9 +7,7 @@
   reg = <0>;
   spi-max-frequency = <1000000>;
   spi-cpha;
   -
   reset-gpios = <&gpio 22 0>;
   -
   adi,dc-dc-mode = <2>;
   adi,range-microvolt = <0 10000000>;
   adi,dc-dc-ilim-microamp = <200000>;
>> Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml:119: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml (original)
   +++ Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml (canonical)
   @@ -7,6 +7,7 @@
   display-hub@15200000 {
   compatible = "nvidia,tegra186-display";
   reg = <0x15200000 0x00040000>;
   +    ranges = <0x15200000 0x15200000 0x40000>;
   resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_MISC>,
   <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP0>,
   <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP1>,
--
   +            hback-porch = <1>;
   +            hfront-porch = <1>;
   +            vback-porch = <40>;
   +            vfront-porch = <1>;
   +            hsync-len = <45>;
   +            vsync-len = <1>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/spi/spi-mux.yaml:55: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/spi-mux.yaml (original)
   +++ Documentation/devicetree/bindings/spi/spi-mux.yaml (canonical)
   @@ -1,21 +1,21 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   mux: mux-controller {
   compatible = "gpio-mux";
   #mux-control-cells = <0>;
   -
   mux-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
--
   #include <dt-bindings/gpio/gpio.h>
   +
   dsi@a0351000 {
   reg = <0xa0351000 0x1000>;
   #address-cells = <1>;
   #size-cells = <0>;
   +
   panel@0 {
   compatible = "sony,acx424akp";
   reg = <0>;
>> Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml (canonical)
   @@ -13,7 +13,7 @@
   dac@0 {
   compatible = "lltc,ltc2632-l12";
   reg = <0>;    /* CS0 */
   -        spi-max-frequency = <1000000>;
   +              spi-max-frequency = <1000000>;
   vref-supply = <&vref>;
   };
   };
   Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml:69: example 0: label 'pinctrl_ether_rgmii' defined but never referenced
   Documentation/devicetree/bindings/power/reset/atmel,at91sam9260-shdwc.yaml:76: example 0: label 'shdwc' defined but never referenced
   Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml:39: example 0: label 'tv_connector_in' defined but never referenced
>> Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml:75: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml (canonical)
   @@ -1,20 +1,22 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  touchscreen@48 {
   -    compatible = "melfas,mms114";
--
   +    interrupts = <49>;
   +    clocks = <&rcc 0>;
   +    clock-names = "apb_pclk";
   +    resets = <&rcc 1>;
   +    cap-sd-highspeed;
   +    cap-mmc-highspeed;
   +    max-frequency = <120000000>;
   +    arm,primecell-periphid = <0x10153180>;
   };
   Documentation/devicetree/bindings/pci/mediatek-pcie.yaml:234: example 0: node name 'soc_1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/iio/dac/adi,ad5360.yaml:67: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5360.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5360.yaml (canonical)
   @@ -1,9 +1,10 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
   +        compatible = "adi,ad5371";
   reg = <0>;
--
>> Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml (canonical)
   @@ -8,10 +8,8 @@
   touchscreen@34 {
   compatible = "melfas,mip4_ts";
   reg = <0x34>;
   -
   interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
   ce-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
   -
--
   sdio0: mmc@92000 {
   -  compatible = "marvell,dove-sdhci";
   -  reg = <0x92000 0x100>;
   -  interrupts = <35>;
   -  clocks = <&gate_clk 9>;
   +    compatible = "marvell,dove-sdhci";
   +    reg = <0x92000 0x100>;
   +    interrupts = <35>;
   +    clocks = <&gate_clk 9>;
   };
>> Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml (canonical)
   @@ -1,9 +1,10 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
   +        compatible = "adi,ad5310r";
   reg = <0>;
--
   +    #address-cells = <1>;
   +    #size-cells = <0>;
   +
   +    proximity@70 {
   +        compatible = "maxbotix,mb1232";
   +        reg = <0x70>;
   +        interrupt-parent = <&gpio2>;
   +        interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/frequency/adi,admv1013.yaml:130: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/frequency/adi,admv1013.yaml (original)
   +++ Documentation/devicetree/bindings/iio/frequency/adi,admv1013.yaml (canonical)
   @@ -1,24 +1,25 @@
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  admv1013@0{
   -    compatible = "adi,admv1013";
   -    reg = <0>;
   -    spi-max-frequency = <1000000>;
--
   Documentation/devicetree/bindings/gpu/apple,agx.yaml:86: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpu/apple,agx.yaml (original)
   +++ Documentation/devicetree/bindings/gpu/apple,agx.yaml (canonical)
   @@ -9,6 +9,5 @@
   <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
   memory-region-names = "ttbs", "pagetables", "handoff",
   "hw-cal-a", "hw-cal-b", "globals";
   -
   apple,firmware-abi = <0 0 0>;
   };
>> Documentation/devicetree/bindings/iio/frequency/adi,admv4420.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/frequency/adi,admv4420.yaml (original)
   +++ Documentation/devicetree/bindings/iio/frequency/adi,admv4420.yaml (canonical)
   @@ -1,11 +1,12 @@
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  mixer@0 {
   -    compatible = "adi,admv4420";
   -    reg = <0>;
   -    spi-max-frequency = <1000000>;
--
   mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
   ti,mbox-tx = <1 0 0>;
>> Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml:122: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml (original)
   +++ Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml (canonical)
   @@ -4,6 +4,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   camera@48 {
   compatible = "aptina,mt9v111";
   reg = <0x48>;
--
   crypto@1d88000 {
   -  compatible = "qcom,sm8550-inline-crypto-engine",
   -               "qcom,inline-crypto-engine";
   -  reg = <0x01d88000 0x8000>;
   -  clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
   +    compatible = "qcom,sm8550-inline-crypto-engine",
   +                 "qcom,inline-crypto-engine";
   +    reg = <0x01d88000 0x8000>;
   +    clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
   };
>> Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml:116: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml (original)
   +++ Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml (canonical)
   @@ -4,6 +4,7 @@
   soc {
   #address-cells = <2>;
   #size-cells = <2>;
   +
   pcie@a0000000 {
   compatible = "xlnx,xdma-host-3.00";
   reg = <0x0 0xa0000000 0x0 0x10000000>;
--
   -  clock-names = "acodec_pclk";
   -  clocks = <&cru ACLK_VCODEC>;
   -  #sound-dai-cells = <0>;
   +    compatible = "rockchip,rk3036-codec";
   +    reg = <0x20030000 0x4000>;
   +    clock-names = "acodec_pclk";
   +    clocks = <&cru ACLK_VCODEC>;
   +    #sound-dai-cells = <0>;
   +    rockchip,grf = <&grf>;
   };
>> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml:293: example 0: label 'camss' defined but never referenced
   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml:293: example 0: label 'csiphy_ep0' defined but never referenced
   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml:293: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml (canonical)
   @@ -10,7 +10,6 @@
--
>> Documentation/devicetree/bindings/media/ti,cal.yaml:125: example 0: label 'cal' defined but never referenced
>> Documentation/devicetree/bindings/media/ti,cal.yaml:125: example 0: label 'csi2_0' defined but never referenced
>> Documentation/devicetree/bindings/media/ti,cal.yaml:125: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/ti,cal.yaml (original)
   +++ Documentation/devicetree/bindings/media/ti,cal.yaml (canonical)
   @@ -12,17 +12,18 @@
   ti,camerrx-control = <&scm_conf 0xE94>;
--
   --- Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml (original)
   +++ Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml (canonical)
   @@ -4,7 +4,6 @@
   compatible = "samsung,exynos990-cmu-hsi0";
   reg = <0x10a00000 0x8000>;
   #clock-cells = <1>;
   -
   clocks = <&oscclk>,
   <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
   <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
>> Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml:80: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml (canonical)
   @@ -1,15 +1,17 @@
   #include "dt-bindings/interrupt-controller/irq.h"
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   touchscreen@2a {
--
   @@ -1,7 +1,9 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c: i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   hub: usb-hub@2d {
   compatible = "microchip,usb5744";
   reg = <0x2d>;
>> Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml (canonical)
   @@ -10,10 +10,10 @@
   reg = <0x40>;
   interrupt-parent = <&pio>;
   interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
   -        pinctrl-names = "default";
   +                     pinctrl-names = "default";
   pinctrl-0 = <&ts_wake_pin_p66>;
   wake-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
--
   +++ Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml (canonical)
   @@ -1,6 +1,6 @@
   pericfg_ao: clock-controller@16640000 {
   compatible = "mediatek,mt8196-pericfg-ao", "syscon";
   reg = <0x16640000 0x1000>;
   +    #clock-cells = <1>;
   mediatek,hardware-voter = <&scp_hwv>;
   -    #clock-cells = <1>;
   };
   Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml:107: example 1: label 'pextp0cfg_ao' defined but never referenced
>> Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml:337: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml (original)
   +++ Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml (canonical)
   @@ -2,33 +2,26 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   -                       remote-endpoint = <&usb1_drd_sw>;
   -                   };
   +                    reg = <0>;
   +
   +                    typec1_dr_sw: endpoint {
   +                        remote-endpoint = <&usb1_drd_sw>;
   +                    };
   };
   };
   };
>> Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml (canonical)
   @@ -2,13 +2,13 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
--
   +                      touchscreen-fuzz-x = <4>;
   touchscreen-fuzz-y = <7>;
   touchscreen-fuzz-pressure = <2>;
   touchscreen-size-x = <4096>;
   touchscreen-size-y = <4096>;
   touchscreen-max-pressure = <2048>;
   -
   ti,x-plate-ohms = <280>;
   ti,esd-recovery-timeout-ms = <8000>;
   };
>> Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml:139: example 0: label 'nfc0' defined but never referenced
   Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml (original)
   +++ Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml (canonical)
   @@ -1,14 +1,14 @@
   / {
   +    compatible = "fsl,imx8mm-evk", "fsl,imx8mm";
   model = "FSL i.MX8MM EVK board";
   -    compatible = "fsl,imx8mm-evk", "fsl,imx8mm";
   #address-cells = <2>;
   #size-cells = <2>;
--
   +    compatible = "qcom,sc8180x-camcc";
   +    reg = <0x0ad00000 0x20000>;
   +    clocks = <&gcc GCC_CAMERA_AHB_CLK>,
   +             <&rpmhcc RPMH_CXO_CLK>,
   +             <&sleep_clk>;
   +    power-domains = <&rpmhpd SC8180X_MMCX>;
   +    required-opps = <&rpmhpd_opp_low_svs>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    #power-domain-cells = <1>;
>> };Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml:139: example 0: label 'smcc' defined but never referenced
>> Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml:139: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml (original)
   +++ Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml (canonical)
   @@ -1,18 +1,18 @@
   smcc: memory-controller@e000e000 {
   -  compatible = "arm,pl353-smc-r2p1", "arm,primecell";
   -  reg = <0xe000e000 0x0001000>;
   -  clock-names = "memclk", "apb_pclk";
   -  clocks = <&clkc 11>, <&clkc 44>;
   -  ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
   -            0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
--
   -  touchscreen-min-pressure = <50000>;
   -  io-channels = <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
   -  io-channel-names = "x", "z1", "z2", "y";
   -  touchscreen-x-plate-ohms = <800>;
   +    compatible = "resistive-adc-touch";
   +    touchscreen-min-pressure = <50000>;
   +    io-channels = <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
   +    io-channel-names = "x", "z1", "z2", "y";
   +    touchscreen-x-plate-ohms = <800>;
   };
>> Documentation/devicetree/bindings/sound/fsl,mqs.yaml:109: example 0: label 'mqs0' defined but never referenced
>> Documentation/devicetree/bindings/sound/fsl,mqs.yaml:109: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/fsl,mqs.yaml (original)
   +++ Documentation/devicetree/bindings/sound/fsl,mqs.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/imx6sx-clock.h>
   +
   mqs0: mqs {
   compatible = "fsl,imx6sx-mqs";
   gpr = <&gpr>;
>> Documentation/devicetree/bindings/sound/fsl,mqs.yaml:118: example 1: label 'mqs1' defined but never referenced
   Documentation/devicetree/bindings/sound/fsl,mqs.yaml:118: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/sound/fsl,mqs.yaml (original)
   +++ Documentation/devicetree/bindings/sound/fsl,mqs.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/firmware/imx/rsrc.h>
   +
   mqs1: mqs@59850000 {
   compatible = "fsl,imx8qm-mqs";
   reg = <0x59850000 0x10000>;
--
   Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml:141: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml (original)
   +++ Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml (canonical)
   @@ -13,6 +13,5 @@
   clock-names = "dsi", "lp", "parent";
   resets = <&bpmp TEGRA186_RESET_DSI>;
   reset-names = "dsi";
   -
   power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
   };
>> Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml:62: example 0: label 'cru' defined but never referenced
>> Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml (original)
   +++ Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml (canonical)
   @@ -1,6 +1,6 @@
   cru: clock-controller@fd7c0000 {
   -  compatible = "rockchip,rk3588-cru";
   -  reg = <0xfd7c0000 0x5c000>;
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
   +    compatible = "rockchip,rk3588-cru";
   +    reg = <0xfd7c0000 0x5c000>;
--
   -  sensor@4c {
   -    compatible = "ti,tmp401";
   -    reg = <0x4c>;
   -  };
   +    sensor@4c {
   +        compatible = "ti,tmp401";
   +        reg = <0x4c>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/frequency/adi,admfm2000.yaml:95: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/frequency/adi,admfm2000.yaml (original)
   +++ Documentation/devicetree/bindings/iio/frequency/adi,admfm2000.yaml (canonical)
   @@ -1,32 +1,30 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   converter {
   -  compatible = "adi,admfm2000";
   +    compatible = "adi,admfm2000";
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
>> Documentation/devicetree/bindings/serial/renesas,scif.yaml:262: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/renesas,scif.yaml (original)
   +++ Documentation/devicetree/bindings/serial/renesas,scif.yaml (canonical)
   @@ -1,6 +1,7 @@
   #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/power/r8a7791-sysc.h>
   +
   aliases {
   serial0 = &scif0;
   };
--
>> Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml:613: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml (original)
   +++ Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml (canonical)
   @@ -8,54 +8,29 @@
   interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
   resets = <&tegra_car 142>;
   reset-names = "padctl";
   -
   avdd-pll-utmip-supply = <&vdd_1v8>;
   avdd-pll-uerefe-supply = <&vdd_pex_1v05>;
   dvdd-pex-pll-supply = <&vdd_pex_1v05>;
--
   power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
   <&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
   power-domain-names = "xusb_host", "xusb_ss";
   -
   -    nvidia,xusb-padctl = <&xusb_padctl>;
   -
   phys = <&pad_lanes_usb2_0>;
   phy-names = "usb2-0";
   +    nvidia,xusb-padctl = <&xusb_padctl>;
   };
>> Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml (canonical)
   @@ -1,6 +1,6 @@
   hdmi-phy@3a0 {
   -  compatible = "amlogic,meson8-hdmi-tx-phy";
   -  reg = <0x3a0 0xc>;
   -  clocks = <&tmds_clock>;
   -  #phy-cells = <0>;
   +    compatible = "amlogic,meson8-hdmi-tx-phy";
   +    reg = <0x3a0 0xc>;
--
   +        compatible = "ti,tlv320aic3x";
   +        reg = <0>; /* CS number */
   +              #sound-dai-cells = <0>;
   +        AVDD-supply = <&regulator>;
   +        IOVDD-supply = <&regulator>;
   +        DRVDD-supply = <&regulator>;
   +        DVDD-supply = <&regulator>;
   +        ai3x-ocmv = <0>;
   +    };
   };
>> Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml:140: example 0: label 'port0' defined but never referenced
>> Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml:140: example 0: label 'port1' defined but never referenced
>> Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml:140: example 0: label 'switch' defined but never referenced
>> Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml:140: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml (original)
   +++ Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml (canonical)
   @@ -1,30 +1,32 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   switch: switch@e0000000 {
   -  compatible = "microchip,lan966x-switch";
   -  reg =  <0xe0000000 0x0100000>,
   -         <0xe2000000 0x0800000>;
   -  reg-names = "cpu", "gcb";
--
   +        usb-otg-vbus-regulator {
   +            regulator-name = "usb-otg-vbus";
   +            regulator-min-microvolt = <4850000>;
   +            regulator-max-microvolt = <5300000>;
   +            regulator-min-microamp = <500000>;
   +            regulator-max-microamp = <1200000>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml (original)
   +++ Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml (canonical)
   @@ -1,12 +1,12 @@
   phy@19820000 {
   -  compatible = "starfive,jh7110-dphy-rx";
   -  reg = <0x19820000 0x10000>;
   -  clocks = <&ispcrg 3>,
   -           <&ispcrg 4>,
   -           <&ispcrg 5>;
   -  clock-names = "cfg", "ref", "tx";
--
   +        svdd-supply = <&pp1800_prox>;
   +        #io-channel-cells = <1>;
   +        semtech,cs0-ground;
   +        semtech,combined-sensors = <1 2 3>;
   +        semtech,resolution = "fine";
   +        semtech,startup-sensor = <1>;
   +        semtech,proxraw-strength = <2>;
   +        semtech,avg-pos-strength = <64>;
   +    };
   };
>> Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml:70: example 0: label 'rtc' defined but never referenced
>> Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml (canonical)
   @@ -1,15 +1,15 @@
   soc {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   +    #address-cells = <2>;
   +    #size-cells = <2>;
--
   @@ -1,8 +1,8 @@
   pcie_ep: pcie-ep@66000000 {
   compatible = "socionext,uniphier-pro5-pcie-ep";
   -    reg-names = "dbi", "dbi2", "link", "addr_space";
   reg = <0x66000000 0x1000>, <0x66001000 0x1000>,
   <0x66010000 0x10000>, <0x67000000 0x400000>;
   +    reg-names = "dbi", "dbi2", "link", "addr_space";
   clock-names = "gio", "link";
   clocks = <&sys_clk 12>, <&sys_clk 24>;
   reset-names = "gio", "link";
>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml:189: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml (canonical)
   @@ -2,26 +2,20 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
--
   +        compatible = "adi,ad7280a";
   +        reg = <0>;
   +        spi-max-frequency = <700000>;
   +        interrupt-parent = <&gpio>;
   +        interrupts = <25 2>;
   +        adi,thermistor-termination;
   +        adi,acquisition-time-ns = <800>;
   +        adi,voltage-alert-last-chan = <5>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml (original)
   +++ Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml (canonical)
   @@ -1,17 +1,16 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   mux: mux-controller {
   -  compatible = "gpio-mux";
   -  #mux-control-cells = <0>;
   -
   -  mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
--
   -  io-channel-names = "parent";
   -
   -  mux-controls = <&mux>;
   -  channels = "sync", "in", "system-regulator";
   +    compatible = "io-channel-mux";
   +    io-channels = <&adc 0>;
   +    io-channel-names = "parent";
   +    mux-controls = <&mux>;
   +    channels = "sync", "in", "system-regulator";
   };
>> Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.yaml:88: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.yaml (original)
   +++ Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.yaml (canonical)
   @@ -17,15 +17,11 @@
   reg-names = "parf", "dbi", "elbi", "atu", "config";
   ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
   <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
   -
   bus-range = <0x00 0xff>;
   device_type = "pci";
   -        linux,pci-domain = <0>;
--
   trackpad@67 {
   +        compatible = "cypress,cyapa";
   reg = <0x67>;
   -        compatible = "cypress,cyapa";
   interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
   interrupt-parent = <&gpx1>;
   wakeup-source;
>> Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.yaml (canonical)
   @@ -1,7 +1,7 @@
   phy@40000000 {
   compatible = "brcm,sr-pcie-phy";
   reg = <0x40000000 0x800>;
   +    #phy-cells = <1>;
   brcm,sr-cdru = <&cdru>;
   brcm,sr-mhb = <&mhb>;
   -    #phy-cells = <1>;
--
   -  reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
   -  mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
   +    compatible = "rohm,bd28623";
   +    #sound-dai-cells = <0>;
   +    VCCA-supply = <&vcc_reg>;
   +    VCCP1-supply = <&vcc_reg>;
   +    VCCP2-supply = <&vcc_reg>;
   +    reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
   +    mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
   };
>> Documentation/devicetree/bindings/display/arm,malidp.yaml:102: example 0: label 'dp0_output' defined but never referenced
   Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml:68: example 0: label 'usart2' defined but never referenced
   Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml:68: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml (original)
   +++ Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml (canonical)
   @@ -1,7 +1,6 @@
   // In this example, the usart2 device refers to rifsc as its access
   // controller.
   // Access rights are verified before creating devices.
   -
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   +    apahb_gate: apahb-gate@0 {
   +        compatible = "sprd,sc9863a-apahb-gate";
   +        reg = <0x0 0x1020>;
   +        #clock-cells = <1>;
   +    };
   };
   Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml:75: example 0: tab character in DTS line:             <0x48 0x1f8 0x41c 0x1 0x0	0x49>,
   Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml:75: example 0: tab character in DTS line:             <0x4c 0x1fc 0x418 0x1 0x0	0x49>;
   Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml:75: example 0: label 'iomuxc' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml:75: example 0: label 'pinctrl_uart3' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml:238: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml (canonical)
   @@ -1,55 +1,49 @@
   #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
--
   soundwire@3230000 {
   +    reg = <0x03230000 0x2000>;
   #address-cells = <2>;
   #size-cells = <0>;
   -    reg = <0x03230000 0x2000>;
   +
   wcd938x_tx: codec@0,3 {
   compatible = "sdw20217010d00";
   reg = <0 3>;
>> Documentation/devicetree/bindings/phy/marvell,pxa1928-usb-phy.yaml:40: example 0: label 'usbphy' defined but never referenced
   Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml:67: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml (original)
   +++ Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml (canonical)
   @@ -18,15 +18,15 @@
   <&topckgen CLK_TOP_I2S2_M_SEL>,
   <&topckgen CLK_TOP_I2S3_M_SEL>,
   <&topckgen CLK_TOP_I2S3_B_SEL>;
   -     clock-names = "infra_sys_audio_clk",
   -                   "top_pdn_audio",
   -                   "top_pdn_aud_intbus",
--
   Documentation/devicetree/bindings/arm/arm,cci-400.yaml:113: example 0: label 'CPU0' defined but never referenced
>> Documentation/devicetree/bindings/iio/frequency/adi,adf4377.yaml:97: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/frequency/adi,adf4377.yaml (original)
   +++ Documentation/devicetree/bindings/iio/frequency/adi,adf4377.yaml (canonical)
   @@ -1,6 +1,7 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   frequency@0 {
   compatible = "adi,adf4377";
   reg = <0>;
--
   };
   };
   Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml:74: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml (original)
   +++ Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml (canonical)
   @@ -1,4 +1,3 @@
   -
   amx@702d3000 {
   compatible = "nvidia,tegra210-amx";
   reg = <0x702d3000 0x100>;
>> Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml:51: example 0: label 'grf' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml:51: example 0: label 'mipi_dphy_rx0' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml (canonical)
   @@ -1,4 +1,3 @@
   -
   /*
   * MIPI D-PHY RX0 use registers in "general register files", it
   * should be a child of the GRF.
   @@ -8,7 +7,6 @@
   *  ...
   * };
--
   +        interrupt-controller {
   +            #address-cells = <0>;
   +            #interrupt-cells = <1>;
   +            interrupt-controller;
   +            interrupt-parent = <&intc>;
   +            interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml:52: example 0: label 'cros_ec_codec' defined but never referenced
>> Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml:52: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml (original)
   +++ Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml (canonical)
   @@ -3,9 +3,11 @@
   reg = <0x52800000 0x100000>;
   no-map;
   };
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
--
   -                        event-touch {
   -                                linux,code = <SW_LID>;
   -                        };
   -                };
   +            event-prox {
   +                linux,code = <KEY_POWER>;
   +            };
   };
   +    };
   };
>> Documentation/devicetree/bindings/iio/humidity/st,hts221.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/humidity/st,hts221.yaml (original)
   +++ Documentation/devicetree/bindings/iio/humidity/st,hts221.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml:363: example 0: label 'mmc0_pins_default' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml:363: example 0: label 'pcie_pins' defined but never referenced
--
   --- Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml (original)
   +++ Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml (canonical)
   @@ -1,6 +1,7 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/input/input.h>
   #include <dt-bindings/leds/common.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/clock/qcom,milos-gcc.h>
   #include <dt-bindings/phy/phy-qcom-qmp.h>
   +
   clock-controller@af00000 {
   compatible = "qcom,milos-dispcc";
   reg = <0x0af00000 0x20000>;
   Documentation/devicetree/bindings/ufs/rockchip,rk3576-ufshc.yaml:76: example 0: label 'ufshc' defined but never referenced
--
   interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
   phys = <&ufsphy>;
   -
   clocks = <&infracfg_ao CLK_INFRA_UFS>;
   clock-names = "ufs";
   freq-table-hz = <0 0>;
   -
   vcc-supply = <&mt_pmic_vemc_ldo_reg>;
   };
   };
>> Documentation/devicetree/bindings/regulator/max8893.yaml:41: example 0: label 'back_7' defined but never referenced
>> Documentation/devicetree/bindings/regulator/max8893.yaml:41: example 0: label 'front_1_back_1' defined but never referenced
>> Documentation/devicetree/bindings/regulator/max8893.yaml:41: example 0: label 'front_3_back_4' defined but never referenced
>> Documentation/devicetree/bindings/regulator/max8893.yaml:41: example 0: label 'front_4_back_5' defined but never referenced
>> Documentation/devicetree/bindings/regulator/max8893.yaml:41: example 0: label 'front_5_back_6' defined but never referenced
>> Documentation/devicetree/bindings/regulator/max8893.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/max8893.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/max8893.yaml (canonical)
   @@ -1,47 +1,47 @@
   i2c {
   -        #address-cells = <1>;
   -        #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   -                        };
   -                };
   +            back_7: ldo5 {
   +                regulator-name = "cam_sensor_io_1v8";
   +                regulator-min-microvolt = <1800000>;
   +                regulator-max-microvolt = <1800000>;
   +            };
   };
   +    };
   };
>> Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml:61: example 0: label 'vpu' defined but never referenced
>> Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml (canonical)
   @@ -1,17 +1,14 @@
   #include <dt-bindings/clock/ingenic,jz4770-cgu.h>
--
   -
   -      port@1 {
   -        reg = <1>;
   -        bridge_out: endpoint {
   -          remote-endpoint = <&panel_in>;
   -        };
   -      };
   };
   -  };
   };
>> Documentation/devicetree/bindings/leds/ti.lm36922.yaml:84: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/ti.lm36922.yaml (original)
   +++ Documentation/devicetree/bindings/leds/ti.lm36922.yaml (canonical)
   @@ -10,7 +10,6 @@
   reg = <0x36>;
   #address-cells = <1>;
   #size-cells = <0>;
   -
   enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
   vled-supply = <&vbatt>;
   ti,ovp-microvolt = <29000000>;
--
   -  reg = <0x1fc0000 0x30000>;
   -  clocks = <&rpmhcc RPMH_CXO_CLK>;
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
   +    compatible = "qcom,sm8550-tcsr", "syscon";
   +    reg = <0x1fc0000 0x30000>;
   +    clocks = <&rpmhcc RPMH_CXO_CLK>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   };
>> Documentation/devicetree/bindings/leds/ams,as3668.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/ams,as3668.yaml (original)
   +++ Documentation/devicetree/bindings/leds/ams,as3668.yaml (canonical)
   @@ -1,25 +1,25 @@
   #include <dt-bindings/leds/common.h>
--
   -      interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
   -      clocks = <&clk26m>;
   -      clock-names = "kpd";
   +        compatible = "mediatek,mt6779-keypad";
   +        reg = <0 0x10010000 0 0x1000>;
   +        interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
   +        clocks = <&clk26m>;
   +        clock-names = "kpd";
   };
   };
>> Documentation/devicetree/bindings/leds/qcom,pm8058-led.yaml:44: example 0: label 'pm8058' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml (canonical)
   @@ -1,64 +1,73 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
   +
   regulator {
   -  compatible = "mediatek,mt6360-regulator";
   -  LDO_VIN3-supply = <&BUCK2>;
--
   -            reg = <0x3E001000 0x1000>;
   -            clocks = <&ref>;
   -            #clock-cells = <1>;
   +    clkcfg: clock-controller@3E001000 {
   +        compatible = "microchip,mpfs-clkcfg";
   +        reg = <0x3E001000 0x1000>;
   +        clocks = <&ref>;
   +        #clock-cells = <1>;
   };
   };
>> Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml:126: example 0: label 'pm8941_l20' defined but never referenced
>> Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml:126: example 0: label 'pm8941_s3' defined but never referenced
>> Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml:126: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml (canonical)
   @@ -1,6 +1,11 @@
   pm8941-regulators {
   compatible = "qcom,rpm-pm8941-regulators";
   vdd_l13_l20_l23_l24-supply = <&pm8941_boost>;
   +
   +    pm8941_l20: l20 {
   +        regulator-min-microvolt = <2950000>;
   +        regulator-max-microvolt = <2950000>;
--
   -        ldo2 {
   -         regulator-name = "ldo2";
   -         regulator-min-microvolt = <800000>;
   -         regulator-max-microvolt = <3975000>;
   -        };
   -     };
   -   };
   - };
   +    };
   +};
>> Documentation/devicetree/bindings/iio/pressure/sensirion,sdp500.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/sensirion,sdp500.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/sensirion,sdp500.yaml (canonical)
   @@ -1,9 +1,10 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  pressure@40 {
   -    compatible = "sensirion,sdp500";
   -    reg = <0x40>;
   -    vdd-supply = <&foo>;
--
   timer_clk: clock-controller@100000ac {
   -  compatible = "brcm,bcm63268-timer-clocks";
   -  reg = <0x100000ac 0x4>;
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
   +    compatible = "brcm,bcm63268-timer-clocks";
   +    reg = <0x100000ac 0x4>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   };
>> Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml:164: example 0: label 'green' defined but never referenced
>> Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml:164: example 0: label 'red' defined but never referenced
>> Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml:164: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml (original)
   +++ Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml (canonical)
   @@ -10,7 +10,6 @@
   reg = <0x65>;
   #address-cells = <1>;
   #size-cells = <0>;
   -
   shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
--
   -       regulator-min-microamp = <500000>;
   -       regulator-max-microamp = <3000000>;
   -   };
   +    usb-vbus-regulator@1100 {
   +        compatible = "qcom,pm8150b-vbus-reg";
   +        reg = <0x1100>;
   +        regulator-min-microamp = <500000>;
   +        regulator-max-microamp = <3000000>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/pressure/aosong,adp810.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/aosong,adp810.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/aosong,adp810.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pressure-sensor@25 {
   compatible = "aosong,adp810";
   reg = <0x25>;
--
   -      reg = <0x62>;
   +        compatible = "mps,mp8869";
   +        reg = <0x62>;
   +        regulator-name = "vcpu";
   +        regulator-min-microvolt = <800000>;
   +        regulator-max-microvolt = <1150000>;
   +        enable-gpios = <&porta 1 GPIO_ACTIVE_LOW>;
   +        mps,fb-voltage-divider = <80 240>;
   };
   };
>> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml:122: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml (canonical)
   @@ -1,15 +1,16 @@
   #include <dt-bindings/clock/imx7d-clock.h>
   +
   m4_reserved_sysmem1: cm4@80000000 {
   -  reg = <0x80000000 0x80000>;
   +    reg = <0x80000000 0x80000>;
   };
--
   +                  "dsi1_phy_pll_out_byteclk",
   +                  "dsi1_phy_pll_out_dsiclk",
   +                  "dp_phy_pll_link_clk",
   +                  "dp_phy_pll_vco_div_clk";
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    #power-domain-cells = <1>;
   +    power-domains = <&rpmhpd RPMHPD_MMCX>;
   +    required-opps = <&rpmhpd_opp_low_svs>;
   };
>> Documentation/devicetree/bindings/leds/ti,tca6507.yaml:86: example 0: label 'green' defined but never referenced
>> Documentation/devicetree/bindings/leds/ti,tca6507.yaml:86: example 0: label 'gta04' defined but never referenced
>> Documentation/devicetree/bindings/leds/ti,tca6507.yaml:86: example 0: label 'red' defined but never referenced
>> Documentation/devicetree/bindings/leds/ti,tca6507.yaml:86: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/ti,tca6507.yaml (original)
   +++ Documentation/devicetree/bindings/leds/ti,tca6507.yaml (canonical)
   @@ -1,4 +1,3 @@
   -
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/leds/common.h>
--
   key-wakeup {
   label = "GPIO Key WAKEUP";
   -        linux,code = <143>;
   interrupts-extended = <&intc 2 IRQ_TYPE_EDGE_FALLING>,
   <&intc_wakeup 0 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-names = "irq", "wakeup";
   wakeup-source;
   +        linux,code = <143>;
   };
   };
>> Documentation/devicetree/bindings/leds/ti,lp8860.yaml:66: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/ti,lp8860.yaml (original)
   +++ Documentation/devicetree/bindings/leds/ti,lp8860.yaml (canonical)
   @@ -7,9 +7,9 @@
--
   -  sram = <&ahb_sram_ao_arc>;
   -  amlogic,secbus2 = <&secbus2>;
   +    compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
   +    reg = <0x1c 0x8>, <0x38 0x8>;
   +    reg-names = "remap", "cpu";
   +    resets = <&media_cpu_reset>;
   +    clocks = <&media_cpu_clock>;
   +    sram = <&ahb_sram_ao_arc>;
   +    amlogic,secbus2 = <&secbus2>;
   };
>> Documentation/devicetree/bindings/leds/register-bit-led.yaml:61: example 0: label 'versatile' defined but never referenced
>> Documentation/devicetree/bindings/leds/register-bit-led.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/register-bit-led.yaml (original)
   +++ Documentation/devicetree/bindings/leds/register-bit-led.yaml (canonical)
   @@ -1,10 +1,9 @@
   -
   syscon@10000000 {
   compatible = "arm,realview-pb1176-syscon", "syscon", "simple-mfd";
   reg = <0x10000000 0x1000>;
   +    ranges = <0x0 0x10000000 0x1000>;
   #address-cells = <1>;
   #size-cells = <1>;
--
   +    reg = <0x40011000 0x400>;
   +    interrupts = <37>;
   +    clocks = <&rcc 0 164>;
   +    dmas = <&dma2 2 4 0x414 0x0>,
   +           <&dma2 7 4 0x414 0x0>;
   +    dma-names = "rx", "tx";
   +    rx-threshold = <4>;
   +    tx-threshold = <4>;
   +    rs485-rts-active-low;
   };
>> Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml:57: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/leds/leds-sgm3140.yaml:51: example 0: label 'sgm3140_flash' defined but never referenced
   Documentation/devicetree/bindings/leds/leds-sgm3140.yaml:51: example 0: canonical form differs:
--
   compatible = "qcom,q6apm-dais";
   iommus = <&apps_smmu 0x1801 0x0>;
   };
   -
   -        bedais {
   -            compatible = "qcom,q6apm-lpass-dais";
   -            #sound-dai-cells = <1>;
   -        };
   };
   };
>> Documentation/devicetree/bindings/leds/leds-lp50xx.yaml:102: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-lp50xx.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-lp50xx.yaml (canonical)
   @@ -13,32 +13,32 @@
   enable-gpios = <&gpio1 16>;
--
   -  interrupt-controller;
   -  reg = <0xfff11000 0x1000>,
   -        <0xfff10100 0x100>;
   +    compatible = "arm,cortex-a9-gic";
   +    reg = <0xfff11000 0x1000>,
   +          <0xfff10100 0x100>;
   +    #interrupt-cells = <3>;
   +    #address-cells = <1>;
   +    interrupt-controller;
   };
>> Documentation/devicetree/bindings/leds/leds-lgm.yaml:102: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-lgm.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-lgm.yaml (canonical)
   @@ -2,33 +2,33 @@
   #include <dt-bindings/leds/common.h>
--
   };
   Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/qcom,rpmcc.h>
   +
   clock-controller@1400000 {
   compatible = "qcom,gcc-qcm2290";
   reg = <0x01400000 0x1f0000>;
>> Documentation/devicetree/bindings/iio/pressure/meas,ms5611.yaml:51: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/meas,ms5611.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/meas,ms5611.yaml (canonical)
   @@ -1,6 +1,7 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pressure@0 {
   compatible = "meas,ms5611";
   reg = <0>;
--
   -                function = LED_FUNCTION_INDICATOR;
   -                color = <LED_COLOR_ID_GREEN>;
   -            };
   -            led-2 {
   -                rohm,led-compatible = "bd71828-ambled";
   -                function = LED_FUNCTION_CHARGING;
   -                color = <LED_COLOR_ID_AMBER>;
   };
   };
   };
>> Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml:130: example 0: label 'usbdp_phy0' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml:87: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml (canonical)
   @@ -1,14 +1,15 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
   +
   clock-controller@100000 {
   -  compatible = "qcom,gcc-sdm845";
   -  reg = <0x100000 0x1f0000>;
   -  clocks = <&rpmhcc RPMH_CXO_CLK>,
--
>> Documentation/devicetree/bindings/leds/leds-lp5860.yaml:77: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-lp5860.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-lp5860.yaml (canonical)
   @@ -11,24 +11,24 @@
   #size-cells = <0>;
--
   i2c-isp@12140000 {
   compatible = "samsung,exynos4212-i2c-isp";Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml:45: example 0: label 'ak4619_endpoint' defined but never referenced
>> Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml (original)
   +++ Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml (canonical)
   @@ -1,18 +1,18 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   codec@10 {
   compatible = "asahi-kasei,ak4619";
   reg = <0x10>;
--
>> Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml:130: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml (original)
   +++ Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml (canonical)
   @@ -2,22 +2,22 @@
   #include <dt-bindings/reset/rockchip,rk3588-cru.h>
--
   +++ Documentation/devicetree/bindings/interrupt-controller/loongson,cpu-interrupt-controller.yaml (canonical)
   @@ -1,5 +1,5 @@
   interrupt-controller {
   -  compatible = "loongson,cpu-interrupt-controller";
   -  #interrupt-cells = <1>;
   -  interrupt-controller;
   +    compatible = "loongson,cpu-interrupt-controller";
   +    #interrupt-cells = <1>;
   +    interrupt-controller;
   };
>> Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml (original)
   +++ Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml (canonical)
   @@ -5,7 +5,6 @@
   irled@0 {
   compatible = "ir-spi-led";
   reg = <0x0>;
   -
   duty-cycle = /bits/ 8 <60>;
   led-active-low;
   power-supply = <&irda_regulator>;
--
   opp-133333333 {
   opp-hz = /bits/ 64 <133333333>;
   };
   +
   opp-800000000 {
   opp-hz = /bits/ 64 <800000000>;
   };
>> Documentation/devicetree/bindings/leds/leds-bcm63138.yaml:79: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-bcm63138.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-bcm63138.yaml (canonical)
   @@ -3,10 +3,9 @@
   leds@ff800800 {
   compatible = "brcm,bcm4908-leds", "brcm,bcm63138-leds";
   reg = <0xff800800 0xdc>;
   -    brcm,serial-shift-bits = <16>;
   -
   #address-cells = <1>;
   #size-cells = <0>;
--
   led@0 {
   reg = <0x0>;
>> Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml:122: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -10,9 +11,8 @@
--
   reset-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
   interrupt-parent = <&gpio0>;
   interrupts = <30 IRQ_TYPE_EDGE_RISING>;
   -
   +        vdd-supply = <&vcc_3v3>;
   honeywell,pressure-triplet = "0015PA";
   honeywell,transfer-function = <1>;
   -        vdd-supply = <&vcc_3v3>;
   };
   };
>> Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml:71: example 0: label 'csi_ep' defined but never referenced
   Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml:71: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml (original)
   +++ Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml (canonical)
   @@ -1,23 +1,21 @@
   rp1 {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   +    #address-cells = <2>;
   +    #size-cells = <2>;
--
   #size-cells = <0>;
   Documentation/devicetree/bindings/tpm/google,cr50.yaml:53: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/tpm/google,cr50.yaml (original)
   +++ Documentation/devicetree/bindings/tpm/google,cr50.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/leds/leds-pwm.yaml:58: example 0: label 'omap4' defined but never referenced
>> Documentation/devicetree/bindings/leds/leds-pwm.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-pwm.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-pwm.yaml (canonical)
   @@ -1,4 +1,3 @@
   -
   #include <dt-bindings/leds/common.h>
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
>> Documentation/devicetree/bindings/leds/leds-rt4505.yaml:40: example 0: label 'rt4505_flash' defined but never referenced
>> Documentation/devicetree/bindings/leds/leds-rt4505.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-rt4505.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-rt4505.yaml (canonical)
   @@ -1,19 +1,19 @@
   #include <dt-bindings/leds/common.h>
--
   +        sound-dai = <&es8323>;
   +    };
   +
   cpu {
   sound-dai = <&i2s>;
   };
   -    codec {
   -         sound-dai = <&es8323>;
   -    };
   };
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: node name 'alarm_red' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: node name 'inet_green' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: node name 'power_green' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: node name 'ephy0_spd' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: node name 'ephy1_spd' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: node name 'ephy2_spd' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: node name 'ephy3_spd' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: label 'green' defined but never referenced
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: label 'red' defined but never referenced
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:121: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-bcm6328.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-bcm6328.yaml (canonical)
   @@ -1,9 +1,9 @@
   /* BCM6328 with 4 EPHY LEDs */
   led-controller@10000800 {
   compatible = "brcm,bcm6328-leds";
   +    reg = <0x10000800 0x24>;
   #address-cells = <1>;
   #size-cells = <0>;
   -    reg = <0x10000800 0x24>;
--
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'gphy0_spd0' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'gphy0_spd1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'inet_red' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'dsl_green' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'usb_green' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'wps_green' must use only [a-z0-9-]
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'inet_green' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'ephy0_act' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'ephy1_act' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'ephy2_act' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'gphy0_act' must use only [a-z0-9-]
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'ephy0_spd' must use only [a-z0-9-]
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'ephy1_spd' must use only [a-z0-9-]
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'ephy2_spd' must use only [a-z0-9-]
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: node name 'power_green' must use only [a-z0-9-]
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: label 'green' defined but never referenced
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: label 'red' defined but never referenced
   Documentation/devicetree/bindings/leds/leds-bcm6328.yaml:168: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-bcm6328.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-bcm6328.yaml (canonical)
   @@ -1,9 +1,9 @@
--
>> Documentation/devicetree/bindings/iio/pressure/rohm,bm1390.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/rohm,bm1390.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/rohm,bm1390.yaml (canonical)
   @@ -1,14 +1,14 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pressure-sensor@5d {
--
>> Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml:224: example 0: label 'u2phy0' defined but never referenced
   Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml:189: example 0: label 'remoteproc_mpss' defined but never referenced
   Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml:189: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml (original)
   +++ Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml (canonical)
   @@ -9,19 +9,15 @@
   compatible = "qcom,sc7180-mss-pil";
   reg = <0x04080000 0x10000>, <0x04180000 0x48>;
   reg-names = "qdsp6", "rmb";
   -
   iommus = <&apps_smmu 0x461 0x0>, <&apps_smmu 0x444 0x3>;
--
   -
   -    port@1 {
   -      reg = <1>;
   -
   -      lvds_dec_out: endpoint {
   -        remote-endpoint = <&rgb_panel_in>;
   -      };
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml:224: example 0: label 'u2phy0_host' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml:224: example 0: label 'u2phy0_otg' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml:224: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml (canonical)
   @@ -1,25 +1,26 @@
   #include <dt-bindings/clock/rk3399-cru.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   u2phy0: usb2phy@e450 {
   -  compatible = "rockchip,rk3399-usb2phy";
   -  reg = <0xe450 0x10>;
--
>> Documentation/devicetree/bindings/iio/frequency/adi,adrf6780.yaml:123: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/frequency/adi,adrf6780.yaml (original)
   +++ Documentation/devicetree/bindings/iio/frequency/adi,adrf6780.yaml (canonical)
   @@ -1,11 +1,12 @@
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  adrf6780@0 {
   -    compatible = "adi,adrf6780";
   -    reg = <0>;
   -    spi-max-frequency = <1000000>;
--
   port@1 {
   reg = <1>;
   +
   lvds_ep: endpoint {
   -                  remote-endpoint = <&panel_ep>;
   +                    remote-endpoint = <&panel_ep>;
   };
   };
   };
>> Documentation/devicetree/bindings/serial/st,asc.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/st,asc.yaml (original)
   +++ Documentation/devicetree/bindings/serial/st,asc.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/clock/stih407-clks.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   serial@9830000 {
   compatible = "st,asc";
   reg = <0x9830000 0x2c>;
>> Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml:140: example 1: label 'comphy0' defined but never referenced
>> Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml:140: example 1: label 'comphy1' defined but never referenced
>> Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml:140: example 1: label 'comphy2' defined but never referenced
   Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-pll5-clk.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-pll5-clk.yaml (original)
   +++ Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-pll5-clk.yaml (canonical)
   @@ -1,7 +1,7 @@
   clk@1c20020 {
   -    #clock-cells = <1>;
   compatible = "allwinner,sun4i-a10-pll5-clk";
   reg = <0x01c20020 0x4>;
   +    #clock-cells = <1>;
   clocks = <&osc24M>;
--
   <0x2>; /* TX_CHAN */
   -            ti,sci-rm-range-rchan = <0x4>, /* RX_HCHAN */
   +                                    ti,sci-rm-range-rchan = <0x4>, /* RX_HCHAN */
   <0x5>; /* RX_CHAN */
   -            ti,sci-rm-range-rflow = <0x6>; /* GP RFLOW */
   +                                    ti,sci-rm-range-rflow = <0x6>; /* GP RFLOW */
   +                                    };
   };
   };
   };
>> Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml:95: example 0: label 'wdt0' defined but never referenced
   Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml:95: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml (original)
   +++ Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml (canonical)
   @@ -1,6 +1,7 @@
   #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
   #include <dt-bindings/power/r8a7795-sysc.h>
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   wdt0: watchdog@e6020000 {
   compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
--
>> Documentation/devicetree/bindings/leds/nxp,pca953x.yaml:62: example 0: label 'green' defined but never referenced
>> Documentation/devicetree/bindings/leds/nxp,pca953x.yaml:62: example 0: label 'pca' defined but never referenced
>> Documentation/devicetree/bindings/leds/nxp,pca953x.yaml:62: example 0: label 'red' defined but never referenced
--
   #size-cells = <0>;
   +
   ak4643: codec@12 {
   compatible = "asahi-kasei,ak4643";
   +        reg = <0x12>;
   #sound-dai-cells = <0>;
   -        reg = <0x12>;
   #clock-cells = <0>;
   clocks = <&audio_clock>;
   clock-frequency = <12288000>;
>> Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml:196: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml (canonical)
   @@ -1,44 +1,41 @@
   #include <dt-bindings/leds/common.h>
--
   @@ -10,8 +10,8 @@
   <0x5506000 0x1000>;
   reg-names = "app", "dbics", "addr_space", "atu";
   power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
   -    ti,syscon-pcie-mode = <&scm_conf 0x4060>;
   max-link-speed = <2>;
   dma-coherent;
   interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
   +    ti,syscon-pcie-mode = <&scm_conf 0x4060>;
   };
>> Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml:158: example 0: label 'asrc' defined but never referenced
>> Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml:158: example 0: label 'asrc_endpoint' defined but never referenced
>> Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml:158: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml (original)
   +++ Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/clock/imx6qdl-clock.h>
   +
   asrc: asrc@2034000 {
   compatible = "fsl,imx53-asrc";
   reg = <0x02034000 0x4000>;
   @@ -12,10 +13,10 @@
--
   dmas = <&sdma 17 23 1>, <&sdma 18 23 1>, <&sdma 19 23 1>,
   <&sdma 20 23 1>, <&sdma 21 23 1>, <&sdma 22 23 1>;
   dma-names = "rxa", "rxb", "rxc",
   @@ -29,5 +30,5 @@
   asrc_endpoint: endpoint {
   remote-endpoint = <&fe00_ep>;
   };
   -   };
   +    };
   };
>> Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml:98: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml (original)
   +++ Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml (canonical)
   @@ -9,7 +9,6 @@
   reg = <0x30>;
   #address-cells = <1>;
   #size-cells = <0>;
   -
   vin-supply = <&pm8916_l17>;
   vio-supply = <&pm8916_l6>;
--
   +        reg = <0>;
   +        spi-max-frequency = <7000000>;
   +        #clock-cells = <0>;
   +        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
   +        interrupts = <2 IRQ_TYPE_EDGE_FALLING>, <3 IRQ_TYPE_EDGE_FALLING>, <4 IRQ_TYPE_EDGE_FALLING>;
   +        interrupt-names = "irq0", "irq1", "dready";
   +        interrupt-parent = <&gpio>;
   +        clocks = <&ext_clock_24576khz>;
   +        vdd-supply = <&vdd_reg>;
   +    };
>> };Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml:43: example 0: label 'dps' defined but never referenced
>> Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml (canonical)
   @@ -3,10 +3,10 @@
   #size-cells = <0>;
--
   led-sources = <1>;
   -            ti,brightness-resolution = <255>;
   ramp-up-us = <500>;
   ramp-down-us = <1000>;
   label = "white:second_backlight_cluster";
   +            ti,brightness-resolution = <255>;
   linux,default-trigger = "backlight";
   };
   };
   Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml:162: example 0: label 'icu' defined but never referenced
>> Documentation/devicetree/bindings/iio/pressure/bmp085.yaml:95: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/bmp085.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/bmp085.yaml (canonical)
   @@ -1,8 +1,10 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
--
   --- Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml (original)
   +++ Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml (canonical)
   @@ -11,6 +11,7 @@
   compatible = "reg-mux";
   #mux-control-cells = <1>;
   mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
   +                            };
   };
   };
   };
>> Documentation/devicetree/bindings/leds/leds-mt6360.yaml:90: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-mt6360.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-mt6360.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/leds/common.h>
   +
   led-controller {
   compatible = "mediatek,mt6360-led";
   #address-cells = <1>;
   @@ -11,25 +12,30 @@
   led-max-microamp = <24000>;
--
   battery: sbs-battery@b {
>> Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml:44: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml (original)
   +++ Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   backlight {
   compatible = "kinetic,ktd253";
   enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
>> Documentation/devicetree/bindings/iio/pressure/honeywell,abp2030pa.yaml:102: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/honeywell,abp2030pa.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/honeywell,abp2030pa.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -9,8 +10,7 @@
--
   eeprom@50 {
   compatible = "atmel,24c128";
>> Documentation/devicetree/bindings/iio/pressure/murata,zpa2326.yaml:55: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/murata,zpa2326.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/murata,zpa2326.yaml (canonical)
   @@ -1,6 +1,7 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pressure@0 {
   compatible = "murata,zpa2326";
   reg = <0>;
--
   @@ -3,8 +3,8 @@
   i2s@70080300 {
   compatible = "nvidia,tegra30-i2s";
   reg = <0x70080300 0x100>;
   -    nvidia,ahub-cif-ids = <4 4>;
   clocks = <&tegra_car TEGRA30_CLK_I2S0>;
   resets = <&tegra_car 30>;
   reset-names = "i2s";
   +    nvidia,ahub-cif-ids = <4 4>;
   };
>> Documentation/devicetree/bindings/iio/pressure/invensense,icp10100.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/invensense,icp10100.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/invensense,icp10100.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pressure@63 {
   compatible = "invensense,icp10101", "invensense,icp10100";
   reg = <0x63>;Documentation/devicetree/bindings/serial/samsung_uart.yaml:199: example 0: label 'uart0' defined but never referenced
--
>> Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml:96: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml (original)
   +++ Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml (canonical)
   @@ -1,22 +1,22 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
--
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   /* Parallel bus option */
   memory-controller {
   #address-cells = <2>;
   #size-cells = <1>;
   +
   ethernet@1,0 {
   compatible = "micrel,ks8851-mll";
   reg = <1 0x0 0x2>, <1 0x2 0x20000>;
>> Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml (original)
   +++ Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml (canonical)
   @@ -1,6 +1,5 @@
   backlight {
   compatible = "led-backlight";
   -
   leds = <&led1>, <&led2>;
   brightness-levels = <0 4 8 16 32 64 128 255>;
   default-brightness-level = <6>;
   Documentation/devicetree/bindings/serial/microchip,pic32mzda-uart.yaml:42: example 0: canonical form differs:
--
   port {
>> Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml:48: example 0: label 'dwi_bl' defined but never referenced
>> Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml (original)
   +++ Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml (canonical)
   @@ -1,10 +1,10 @@
   soc {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   +    #address-cells = <2>;
   +    #size-cells = <2>;
--
   --- Documentation/devicetree/bindings/net/fsl,enetc.yaml (original)
   +++ Documentation/devicetree/bindings/net/fsl,enetc.yaml (canonical)
   @@ -11,6 +11,7 @@
   mdio {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   phy@2 {
   reg = <0x2>;
   };
>> Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml:34: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml (original)
--
>> Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml:271: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml (original)
   +++ Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml (canonical)
   @@ -2,7 +2,6 @@
   compatible = "qcom,pm8941-wled";
   reg = <0xd800 0x100>;
   label = "backlight";
   -
   qcom,cs-out;
   qcom,current-limit = <20>;
   qcom,current-boost-limit = <805>;
--
   Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml:54: example 0: label 'xdmac' defined but never referenced
>> Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8974.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8974.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8974.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml:128: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml (original)
--
   +++ Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml (canonical)
   @@ -1,5 +1,5 @@
   power-manager@f9088000 {
   -  compatible = "qcom,kpss-acc-v2";
   -  reg = <0xf9088000 0x1000>,
   -        <0xf9008000 0x1000>;
   +    compatible = "qcom,kpss-acc-v2";
   +    reg = <0xf9088000 0x1000>,
   +          <0xf9008000 0x1000>;
   };
>> Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml:45: example 0: label 'mclk' defined but never referenced
   Documentation/devicetree/bindings/iio/adc/nxp,imx8qxp-adc.yaml:66: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/nxp,imx8qxp-adc.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/nxp,imx8qxp-adc.yaml (canonical)
   @@ -1,8 +1,10 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/firmware/imx/rsrc.h>
   +
   soc {
   #address-cells = <2>;
   #size-cells = <2>;
--
   +    rt6245@34 {
   +        compatible = "richtek,rt6245";
   +        reg = <0x34>;
   +        enable-gpios = <&gpio26 2 0>;
   +        regulator-name = "rt6245-regulator";
   +        regulator-min-microvolt = <437500>;
   +        regulator-max-microvolt = <1387500>;
   +        regulator-boot-on;
   +    };
   };
>> Documentation/devicetree/bindings/iio/dac/ti,dac082s085.yaml:54: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/ti,dac082s085.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/ti,dac082s085.yaml (canonical)
   @@ -5,6 +5,7 @@
   regulator-max-microvolt = <2500000>;
   regulator-always-on;
   };
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
--
   @@ -1,5 +1,5 @@
   ao-secure@140 {
   -      compatible = "amlogic,meson-gx-ao-secure", "syscon";
   -      reg = <0x140 0x140>;
   -      amlogic,has-chip-id;
   +    compatible = "amlogic,meson-gx-ao-secure", "syscon";
   +    reg = <0x140 0x140>;
   +    amlogic,has-chip-id;
   };
   Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml:80: example 0: label 'pm8550b_eusb2_repeater' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml:80: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml (canonical)
   @@ -1,13 +1,13 @@
   #include <dt-bindings/spmi/spmi.h>
--
   -    channel@6 {
   -      reg = <6>;
   -    };
   -
   -    channel@7 {
   -      reg = <7>;
   -      ti,mux = <4>;
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/iio/magnetometer/ti,tmag5273.yaml:63: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/ti,tmag5273.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/ti,tmag5273.yaml (canonical)
   @@ -6,7 +6,7 @@
   compatible = "ti,tmag5273";
   reg = <0x35>;
   #io-channel-cells = <1>;
   +        vcc-supply = <&vcc3v3>;
   ti,angle-measurement = "x-z";
   -        vcc-supply = <&vcc3v3>;
   };
--
   Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml (original)
   +++ Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml (canonical)
   @@ -1,4 +1,4 @@
   secbus2: system-controller@4000 {
   -  compatible = "amlogic,meson8-secbus2", "syscon";
   -  reg = <0x4000 0x2000>;
   +    compatible = "amlogic,meson8-secbus2", "syscon";
   +    reg = <0x4000 0x2000>;
   };
>> Documentation/devicetree/bindings/iio/magnetometer/allegromicro,als31300.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/allegromicro,als31300.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/allegromicro,als31300.yaml (canonical)
   @@ -1,9 +1,10 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  magnetometer@61 {
   -    compatible = "allegromicro,als31300-500";
   -    reg = <0x61>;
   -    vcc-supply = <&hall_vcc>;
--
   +    ethernet@4 {
   +        compatible = "fsl,qoriq-mc-dpmac";
   +        reg = <0x4>;
   +        phy-handle = <&mdio1_phy6>;
   +        phy-connection-type = "qsgmii";
   +        managed = "in-band-status";
   +        pcs-handle = <&pcs3_1>;
   +    };
   };
   Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml:54: example 0: label 'intc' defined but never referenced
>> Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.yaml:30: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml:37: example 0: label 'cpu0_0' defined but never referenced
   Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml:37: example 0: label 'cpu0_1' defined but never referenced
--
   +        ocv-capacity-table-1 = <4200000 100>, <4185000 95>, <4113000 90>;
   +        /* table for 10 degree Celsius */
   +        ocv-capacity-table-2 = <4250000 100>, <4200000 95>, <4185000 90>;
   +        resistance-temp-table = <20 100>, <10 90>, <0 80>, <(-10) 60>;
   +        operating-range-celsius = <(-30) 50>;
   +        ambient-celsius = <(-5) 50>;
   +        alert-celsius = <0 40>;
   +    };
   };
   Documentation/devicetree/bindings/arm/mstar/mstar,l3bridge.yaml:41: example 0: label 'l3bridge' defined but never referenced
>> Documentation/devicetree/bindings/regulator/regulator.yaml:297: example 0: label 'xyzreg' defined but never referenced
   Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml:47: example 0: label 'p2u_hsio_0' defined but never referenced
   Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml:195: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -18,7 +19,6 @@
   dvdd-supply = <&dvdd>;
   avdd-supply = <&avdd>;
   vref-supply = <&vref>;
   -
   adi,refin2-pins-enable;
   adi,rejection-60-Hz-enable;
   adi,buffer-enable;
>> Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml:223: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml (canonical)
--
   pmic {
   -  charger {
   -    compatible = "ti,tps65090-charger";
   -    ti,enable-low-current-chrg;
   -  };
   +    charger {
   +        compatible = "ti,tps65090-charger";
   +        ti,enable-low-current-chrg;
   +    };
   };
>> Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml:34: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml (original)
   +++ Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   backlight {
   compatible = "gpio-backlight";
   gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
   Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml (original)
--
   #size-cells = <0>;
   @@ -11,7 +12,7 @@
   clocks = <&cclk>;
   vref-p-supply = <&ldo4_reg>;
   spi-max-frequency = <5000000>;
   +        #io-channel-cells = <1>;
   ti,acquisition-time = <6>;
   -        #io-channel-cells = <1>;
   };
   };
>> Documentation/devicetree/bindings/regulator/regulator.yaml:297: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/regulator.yaml (canonical)
   @@ -1,10 +1,10 @@
   xyzreg: regulator {
   -  regulator-min-microvolt = <1000000>;
   -  regulator-max-microvolt = <2500000>;
   -  regulator-always-on;
   -  vin-supply = <&vin>;
   +    regulator-min-microvolt = <1000000>;
   +    regulator-max-microvolt = <2500000>;
--
   compatible = "microchip,mcp4651-104";
   reg = <0x28>;
   @@ -21,7 +23,6 @@
   compatible = "axentia,tse850-envelope-detector";
   io-channels = <&dac 0>;
   io-channel-names = "dac";
   -
   interrupt-parent = <&gpio>;
   interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
   interrupt-names = "comp";
>> Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas530.yaml:87: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas530.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas530.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c-0 {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml:145: example 0: label 'elpida_ECB240ABACN' defined but never referenced
--
   -                        };
   -                };
   +        port {
   +            mipi_camera_to_mipi_csi2: endpoint {
   +                remote-endpoint = <&mipi_csi2_in>;
   +                data-lanes = <1 2 3 4>;
   +            };
   };
   +    };
   };
>> Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml:383: example 0: label 'osc1' defined but never referenced
   Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml:383: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml (original)
   +++ Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml (canonical)
   @@ -1,14 +1,14 @@
   osc1: oscillator {
   +    compatible = "fixed-clock";
   #clock-cells = <0>;
   -    compatible = "fixed-clock";
   clock-frequency = <25000000>;
   };
--
   -
   -                map1 {
   -                    trip = <&cpu_alert2>;
   -                    cooling-device = <&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
   -                                     <&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
   -                };
   -            };
   };
   };
   };
>> Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml:82: example 0: label 'dphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml:82: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/imx8mq-clock.h>
   +
   dphy: dphy@30a0030 {
   compatible = "fsl,imx8mq-mipi-dphy";
   reg = <0x30a00300 0x100>;
   Documentation/devicetree/bindings/timer/st,nomadik-mtu.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/timer/st,nomadik-mtu.yaml (original)
--
   @@ -66,5 +74,9 @@
   dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0 0 1 1>;
   dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0 0 1 1>;
   };
   +
   +        cpu {
   +            sound-dai = <&audio_controller 18>;
   +        };
   };
   };
>> Documentation/devicetree/bindings/iio/magnetometer/silabs,si7210.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/silabs,si7210.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/silabs,si7210.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   magnetometer@30 {
--
   i2c@d4011000 {
   compatible = "mrvl,mmp-twsi";
   reg = <0xd4011000 0x1000>;
   interrupts = <7>;
   clocks = <&soc_clocks MMP2_CLK_TWSI1>;
   -    mrvl,i2c-fast-mode;
   #address-cells = <1>;
   #size-cells = <0>;
   +    mrvl,i2c-fast-mode;
   };
>> Documentation/devicetree/bindings/phy/st,stih407-usb2-phy.yaml:54: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/st,stih407-usb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/st,stih407-usb2-phy.yaml (canonical)
   @@ -1,9 +1,10 @@
   #include <dt-bindings/reset/stih407-resets.h>
   +
   usb-phy {
   compatible = "st,stih407-usb2-phy";
   #phy-cells = <0>;
   -    st,syscfg = <&syscfg_core 0x100 0xf4>;
   resets = <&softreset STIH407_PICOPHY_SOFTRESET>,
--
   ethphy1: ethernet-phy@1 {
   -            reg = <1>;
   -            realtek,clkout-disable;
   -            realtek,aldps-enable;
   +        reg = <1>;
   +        realtek,clkout-disable;
   +        realtek,aldps-enable;
   };
   };
>> Documentation/devicetree/bindings/iio/light/ams,as73211.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/ams,as73211.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/ams,as73211.yaml (canonical)
   @@ -11,5 +11,6 @@
   pinctrl-0 = <&pinctrl_color_sensor>;
   interrupt-parent = <&gpio2>;
   interrupts = <19 IRQ_TYPE_EDGE_RISING>; /* READY */
   +                     };
   };
   };Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml:46: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml (original)
--
   +    compatible = "intel,lgm-dma3";
   +    reg = <0xec800000 0x1000>;
   +    clocks = <&cgu0 71>;
   +    resets = <&rcu0 0x10 9>;
   +    #dma-cells = <3>;
   +    intel,dma-poll-cnt = <16>;
   +    intel,dma-byte-en;
   +    intel,dma-dburst-wr;
   };
   Documentation/devicetree/bindings/leds/leds-lp55xx.yaml:173: example 0: tab character in DTS line:         pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
>> Documentation/devicetree/bindings/leds/leds-lp55xx.yaml:173: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-lp55xx.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-lp55xx.yaml (canonical)
   @@ -6,13 +6,13 @@
   #size-cells = <0>;
--
   reg = <0x801c0000 0x1000>;Documentation/devicetree/bindings/arm/samsung/samsung-secure-firmware.yaml:30: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/samsung/samsung-secure-firmware.yaml (original)
   +++ Documentation/devicetree/bindings/arm/samsung/samsung-secure-firmware.yaml (canonical)
   @@ -1,4 +1,4 @@
   firmware@203f000 {
   -  compatible = "samsung,secure-firmware";
   -  reg = <0x0203f000 0x1000>;
   +    compatible = "samsung,secure-firmware";
   +    reg = <0x0203f000 0x1000>;
   };
>> Documentation/devicetree/bindings/phy/realtek,usb3phy.yaml:98: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/realtek,usb3phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/realtek,usb3phy.yaml (canonical)
   @@ -2,9 +2,7 @@
   compatible = "realtek,rtd1319d-usb3phy";
   reg = <0x13e10 0x4>;
   #phy-cells = <0>;
   -
   nvmem-cells = <&otp_usb_u3_tx_lfps_swing_trim>;
   nvmem-cell-names = "usb_u3_tx_lfps_swing_trim";
   -
--
   +             <&sleep_clk>,
   +             <&pcie20_phy0_pipe_clk>,
   +             <&pcie20_phy1_pipe_clk>,
   +             <&usb3_phy0_pipe_clk>,
   +             <&gephy_rx_clk>,
   +             <&gephy_tx_clk>,
   +             <&uniphy_rx_clk>,
   +             <&uniphy_tx_clk>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
>> };Documentation/devicetree/bindings/iio/light/ti,opt4001.yaml:55: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/ti,opt4001.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/ti,opt4001.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml:144: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml (original)
   +++ Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml (canonical)
--
   +                regulator-max-microamp = <10000000>;
   +                regulator-boot-on;
   +                regulator-initial-mode = <DA9121_BUCK_MODE_AUTO>;
   +                enable-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>;
   +                dlg,ripple-cancel = <DA9121_BUCK_RIPPLE_CANCEL_NONE>;
   +            };
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/iio/light/amstaos,tsl2591.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/amstaos,tsl2591.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/amstaos,tsl2591.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -7,5 +8,5 @@
   compatible = "amstaos,tsl2591";
--
   interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
   clocks = <&bpmp TEGRA186_CLK_EMC>;
   clock-names = "emc";
   -
   #interconnect-cells = <0>;
   -
   nvidia,bpmp = <&bpmp>;
   };
   };
   Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml:47: example 0: label 'i2c0' defined but never referenced
>> Documentation/devicetree/bindings/iio/light/rohm,bu27034anuc.yaml:34: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/rohm,bu27034anuc.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/rohm,bu27034anuc.yaml (canonical)
   @@ -1,10 +1,10 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   +        micdet-delay = <100>;
   +        gpio-cfg = <
   +                   0x0600 /* DMIC_LR, output */
   +                   0x0680 /* DMIC_DAT, input */
   +                   0x0000 /* GPIO, output, low */
   +                   0x0200 /* Interrupt, output */
   +                   0x01a0 /* BCLK, input, active high */
   +                   >;
   +    };
   };
>> Documentation/devicetree/bindings/iio/light/isl29018.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/isl29018.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/isl29018.yaml (canonical)
   @@ -1,13 +1,12 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   bus-range = <0x00 0xff>;
   interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
   msi-controller;
   msi-parent = <&pcie0>;
   -        ranges = <0x82000000 0 0xe8000000 0 0xe8000000 0 0x1000000>,
   -                <0x81000000 0 0xe9000000 0 0xe9000000 0 0x10000>;
   -
   #interrupt-cells = <1>;
   interrupt-map-mask = <0 0 0 7>;
   interrupt-map = <0 0 0 1 &pcie_intc 0>,
>> Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml (original)
   +++ Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml (canonical)
   @@ -1,4 +1,3 @@
   -
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/leds/common.h>
--
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
>> Documentation/devicetree/bindings/iio/light/st,uvis25.yaml:30: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/st,uvis25.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/st,uvis25.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/sound/maxim,max98520.yaml:28: example 0: label 'max98520' defined but never referenced
   Documentation/devicetree/bindings/sound/maxim,max98520.yaml:28: example 0: canonical form differs:
--
   -      interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
   +        compatible = "amazon,al-mc-edac";
   +        reg = <0x0 0xf0080000 0x0 0x00010000>;
   +        #address-cells = <2>;
   +        #size-cells = <2>;
   +        interrupt-parent = <&amazon_al_system_fabric>;
   +        interrupt-names = "ue";
   +        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
   };
   };
>> Documentation/devicetree/bindings/iio/light/maxim,max44009.yaml:32: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/maxim,max44009.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/maxim,max44009.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -6,7 +7,6 @@
   light-sensor@4a {
--
   -    eeprom@50 {
   -      compatible = "atmel,24c02";
   -      reg = <0x50>;
   +        eeprom@50 {
   +            compatible = "atmel,24c02";
   +            reg = <0x50>;
   +        };
   };
   -  };
>> };Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml:85: example 0: label 'tn_ag_in_tpdm_gcc' defined but never referenced
>> Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml:85: example 0: label 'tn_ag_out_funnel_in1' defined but never referenced
>> Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml:85: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml (original)
   +++ Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml (canonical)
   @@ -1,28 +1,27 @@
   -tn@109ab000  {
   -  compatible = "qcom,coresight-tnoc", "arm,primecell";
   -  reg = <0x109ab000 0x4200>;
   +tn@109ab000 {
   +    compatible = "qcom,coresight-tnoc", "arm,primecell";
   +    reg = <0x109ab000 0x4200>;
   +    clocks = <&aoss_qmp>;
--
   -                     "bsi",
   -                     "vbat";
   +    compatible = "nokia,n900-battery";
   +    io-channels = <&twl4030_madc 0>,
   +                  <&twl4030_madc 4>,
   +                  <&twl4030_madc 12>;
   +    io-channel-names = "temp",
   +                       "bsi",
   +                       "vbat";
   };
>> Documentation/devicetree/bindings/leds/nxp,pca963x.yaml:102: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/nxp,pca963x.yaml (original)
   +++ Documentation/devicetree/bindings/leds/nxp,pca963x.yaml (canonical)
   @@ -11,27 +11,27 @@
   #size-cells = <0>;
--
   +        clock-names = "aclk", "hclk", "npu", "pclk";
   +        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
   +        iommus = <&rknn_mmu_0>;
   +        npu-supply = <&vdd_npu_s0>;
   +        power-domains = <&power RK3588_PD_NPUTOP>;
   +        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
   +        reset-names = "srst_a", "srst_h";
   +        sram-supply = <&vdd_npu_mem_s0>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/light/ti,opt4060.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/ti,opt4060.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/ti,opt4060.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
--
   -
   -      ldo6 {
   -        regulator-name = "v1v8";
   -        regulator-min-microvolt = <1800000>;
   -        regulator-max-microvolt = <1800000>;
   -        regulator-over-current-protection;
   -      };
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml:76: example 0: label 'mpss' defined but never referenced
>> Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml:76: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml (original)
   +++ Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml (canonical)
   @@ -3,15 +3,12 @@
   mpss: remoteproc {
   bam-dmux {
   compatible = "qcom,bam-dmux";
   -
   interrupt-parent = <&modem_smsm>;
   interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
   interrupt-names = "pc", "pc-ack";
--
   -                required-opps = <&rpmhpd_opp_svs_l1>;
   -            };
   -
   -            opp-810000000 {
   -                opp-hz = /bits/ 64 <810000000>;
   -                required-opps = <&rpmhpd_opp_nom>;
   -            };
   -        };
   -    };
   };
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:186: example 0: label 'scpsys' defined but never referenced
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:186: example 0: label 'spm' defined but never referenced
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:186: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/mediatek,power-controller.yaml (original)
   +++ Documentation/devicetree/bindings/power/mediatek,power-controller.yaml (canonical)
   @@ -16,48 +16,55 @@
   #power-domain-cells = <1>;
--
   charger {
   -  compatible = "lltc,lt3651-charger";
   -  lltc,acpr-gpios = <&gpio0 68 GPIO_ACTIVE_LOW>;
   -  lltc,fault-gpios = <&gpio0 64 GPIO_ACTIVE_LOW>;
   -  lltc,chrg-gpios = <&gpio0 63 GPIO_ACTIVE_LOW>;
   +    compatible = "lltc,lt3651-charger";
   +    lltc,acpr-gpios = <&gpio0 68 GPIO_ACTIVE_LOW>;
   +    lltc,fault-gpios = <&gpio0 64 GPIO_ACTIVE_LOW>;
   +    lltc,chrg-gpios = <&gpio0 63 GPIO_ACTIVE_LOW>;
   };
>> Documentation/devicetree/bindings/iio/light/adux1020.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/adux1020.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/adux1020.yaml (canonical)
   @@ -1,14 +1,13 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   +    firmware-name = "imx/dsp/hifi4.bin";
   +    power-domains = <&audiomix_pd>;
   +    mbox-names = "tx", "rx", "rxdb";
   +    mboxes = <&mu2 0 0>,
   +             <&mu2 1 0>,
   +             <&mu2 3 0>;
   +    memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
   +                    <&dsp_vdev0vring1>, <&dsp_reserved>;
   +    resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
   +    reset-names = "runstall";
>> };Documentation/devicetree/bindings/leds/silergy,sy7802.yaml:78: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/silergy,sy7802.yaml (original)
   +++ Documentation/devicetree/bindings/leds/silergy,sy7802.yaml (canonical)
   @@ -10,7 +10,6 @@
   reg = <0x53>;
   #address-cells = <1>;
   #size-cells = <0>;
   -
   enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
--
   -  interrupts = <42>, <43>, <44>, <45>;
   -  #pwm-cells = <3>;
   +pwm: pwm@10020000 {
   +    compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
   +    reg = <0x10020000 0x1000>;
   +    clocks = <&tlclk>;
   +    interrupt-parent = <&plic>;
   +    interrupts = <42>, <43>, <44>, <45>;
   +    #pwm-cells = <3>;
   };
>> Documentation/devicetree/bindings/leds/leds-consumer.yaml:41: example 0: label 'v4l2_node' defined but never referenced
>> Documentation/devicetree/bindings/leds/leds-consumer.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-consumer.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-consumer.yaml (canonical)
   @@ -13,13 +13,12 @@
   };
--
   @@ -19,7 +18,6 @@
   nand-on-flash-bbt;
   nand-ecc-strength = <1>;
   nand-ecc-step-size = <512>;
   -
   #address-cells = <1>;
   #size-cells = <1>;
   };
>> Documentation/devicetree/bindings/arm/arm,scu.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/arm,scu.yaml (original)
   +++ Documentation/devicetree/bindings/arm/arm,scu.yaml (canonical)
   @@ -1,4 +1,4 @@
   scu@a0410000 {
   -        compatible = "arm,cortex-a9-scu";
   -        reg = <0xa0410000 0x100>;
   +    compatible = "arm,cortex-a9-scu";
   +    reg = <0xa0410000 0x100>;
   };
   Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml:107: example 0: label 'ov772x' defined but never referenced
   Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml:34: example 0: label 'pwm' defined but never referenced
>> Documentation/devicetree/bindings/iio/light/amstaos,tsl2563.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/amstaos,tsl2563.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/amstaos,tsl2563.yaml (canonical)
   @@ -1,11 +1,10 @@
   i2c {
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   -  light-sensor@29 {
   -    compatible = "amstaos,tsl2563";
   -    reg = <0x29>;
   -    amstaos,cover-comp-gain = <16>;
   -  };
   +    light-sensor@29 {
   +        compatible = "amstaos,tsl2563";
   +        reg = <0x29>;
   +        amstaos,cover-comp-gain = <16>;
   +    };
>> };Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml (original)
   +++ Documentation/devicetree/bindings/leds/kinetic,ktd2692.yaml (canonical)
   @@ -2,16 +2,16 @@
   #include <dt-bindings/leds/common.h>
--
   +                  "dsi0_phy_pll_out_dsiclk",
   +                  "dsi1_phy_pll_out_dsiclk",
   +                  "dp_phy_pll_link_clk",
   +                  "dp_phy_pll_vco_div_clk",
   +                  "cfg_ahb_clk",
   +                  "gcc_disp_gpll0_div_clk_src";
   +    required-opps = <&rpmhpd_opp_ret>;
   +    power-domains = <&rpmpd SM6125_VDDCX>;
   +    #clock-cells = <1>;
   +    #power-domain-cells = <1>;
>> };Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml:59: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml (original)
   +++ Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml (canonical)
   @@ -8,9 +8,9 @@
   function = LED_FUNCTION_INDICATOR;
   max-brightness = <65535>;
--
   -    resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
   -  };
   +    rng@fe378000 {
   +        compatible = "rockchip,rk3588-rng";
   +        reg = <0x0 0xfe378000 0x0 0x200>;
   +        interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
   +        clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
   +        resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/dac/adi,ad5592r.yaml:117: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5592r.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5592r.yaml (canonical)
   @@ -1,18 +1,17 @@
   #include <dt-bindings/iio/adi,ad5592r.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
--
   -                    reg = <0x0 0x400000>;
   };
   +
   android@400000 {
   +                    reg = <0x400000 0x12c00000>;
   label = "android";
   -                    reg = <0x400000 0x12c00000>;
   };
   };
   };
>> Documentation/devicetree/bindings/sound/amlogic,t9015.yaml:59: example 0: label 'acodec' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml:67: example 0: label 'camera_out' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml:67: example 0: label 'ov5647' defined but never referenced
   Documentation/devicetree/bindings/pwm/nxp,mc33xs2410.yaml:90: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pwm/nxp,mc33xs2410.yaml (original)
   +++ Documentation/devicetree/bindings/pwm/nxp,mc33xs2410.yaml (canonical)
   @@ -1,29 +1,30 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
--
   clock-frequency = <33333333>;
   interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
   interrupt-map = </* IDSEL */
   -                     0xe000 0 0 1 &mpic 2 1
   -                     0xe000 0 0 2 &mpic 3 1>;
   +                    0xe000 0 0 1 &mpic 2 1
   +                    0xe000 0 0 2 &mpic 3 1>;
   interrupts-extended = <&mpic 24 2>;
   bus-range = <0 0>;
   fsl,pci-agent-force-enum;
>> Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml (canonical)
   @@ -8,10 +8,8 @@
   compatible = "liteon,ltr559";
   reg = <0x23>;
   proximity-near-level = <75>;
   -
   vdd-supply = <&pm8916_l17>;
   vddio-supply = <&pm8916_l6>;
   -
--
   -  port {
   -    panel_in_edp: endpoint {
   -      remote-endpoint = <&edp_out_panel>;
   +    port {
   +        panel_in_edp: endpoint {
   +            remote-endpoint = <&edp_out_panel>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/clock/ti,cdce925.yaml:85: example 0: node name 'PLL2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/clock/ti,cdce925.yaml:85: example 0: label 'cdce925' defined but never referenced
>> Documentation/devicetree/bindings/clock/ti,cdce925.yaml:85: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/ti,cdce925.yaml (original)
   +++ Documentation/devicetree/bindings/clock/ti,cdce925.yaml (canonical)
   @@ -10,6 +10,7 @@
   xtal-load-pf = <5>;
   vdd-supply = <&reg_1v8>;
   vddout-supply = <&reg_3v3>;
   +
   /* PLL options to get SSC 1% centered */
   PLL2 {
   spread-spectrum = <4>;
--
>> Documentation/devicetree/bindings/clock/google,gs101-clock.yaml:210: example 0: label 'cmu_top' defined but never referenced
   Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml:131: example 0: label 'ipmmu_mx' defined but never referenced
   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml:113: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml (original)
   +++ Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml (canonical)
   @@ -3,20 +3,20 @@
--
   -          channel@1 {
   -              reg = <0x1>;
   -              maxim,rsense-val-micro-ohms = <10000>;
   -         };
   +        channel@1 {
   +            reg = <0x1>;
   +            maxim,rsense-val-micro-ohms = <10000>;
   +        };
   };
   };
>> Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml:94: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml (canonical)
   @@ -5,9 +5,9 @@
   #size-cells = <0>;
--
   phys = <&serdes0_pcie_link>;
   phy-names = "pcie-phy";
   -        ranges = <0x01000000 0x0 0x10001000  0x00 0x10001000  0x0 0x0010000>,
   -                 <0x02000000 0x0 0x10011000  0x00 0x10011000  0x0 0x7fef000>;
   dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
   +        ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x4070>;
   };
   };
   Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml:52: example 0: label 'panel_in' defined but never referenced
   Documentation/devicetree/bindings/mtd/mxicy,nand-ecc-engine.yaml:33: example 0: label 'spi_controller0' defined but never referenced
>> Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml:243: example 0: label 'ds90ub960_0_csi_out' defined but never referenced
>> Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml:243: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml (original)
   +++ Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml (canonical)
   @@ -1,198 +1,186 @@
   #include <dt-bindings/gpio/gpio.h>
--
   "top_audio_mux1_sel",
   "top_audio_mux2_sel",
   @@ -86,7 +86,6 @@
   "audio_a1sys_pd",
   "audio_a2sys_pd",
   "audio_mrgif_pd";
   -
   assigned-clocks = <&topckgen CLK_TOP_AUD_MUX1_SEL>,
   <&topckgen CLK_TOP_AUD_MUX2_SEL>,
   <&topckgen CLK_TOP_AUD_MUX1_DIV>,
>> Documentation/devicetree/bindings/iio/dac/adi,ad7293.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad7293.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad7293.yaml (canonical)
   @@ -1,12 +1,13 @@
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  ad7293@0 {
   -    compatible = "adi,ad7293";
   -    reg = <0>;
   -    spi-max-frequency = <1000000>;
--
   -  compatible = "microchip,corepwm-rtl-v4";
   -  microchip,sync-update-mask = /bits/ 32 <0>;
   -  clocks = <&clkcfg 30>;
   -  reg = <0x41000000 0xF0>;
   -  #pwm-cells = <2>;
   +    compatible = "microchip,corepwm-rtl-v4";
   +    reg = <0x41000000 0xF0>;
   +    clocks = <&clkcfg 30>;
   +    #pwm-cells = <2>;
   +    microchip,sync-update-mask = /bits/ 32 <0>;
>> };Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/qcom,rpmcc.h>
   +
   clock-controller@1400000 {
   compatible = "qcom,gcc-sm6115";
   reg = <0x01400000 0x1f0000>;
   Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml:85: example 0: label 'car' defined but never referenced
--
   -  #io-channel-cells = <1>;
   +    compatible = "renesas,r9a06g032-adc", "renesas,rzn1-adc";
   +    reg = <0x40065000 0x200>;
   +    clocks = <&sysctrl R9A06G032_HCLK_ADC>, <&sysctrl R9A06G032_CLK_ADC>;
   +    clock-names = "pclk", "adc";
   +    power-domains = <&sysctrl>;
   +    adc1-avdd-supply = <&adc1_avdd>;
   +    adc1-vref-supply = <&adc1_vref>;
   +    #io-channel-cells = <1>;
   };
>> Documentation/devicetree/bindings/sound/fsl,micfil.yaml:82: example 0: label 'micfil' defined but never referenced
   Documentation/devicetree/bindings/iio/light/noa1305.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/noa1305.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/noa1305.yaml (canonical)
   @@ -1,10 +1,9 @@
   i2c {
   -
   #address-cells = <1>;
   #size-cells = <0>;
--
   reg = <0x10215000 0x1000>;
   Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml:66: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml:35: example 0: label 'wed_pcie' defined but never referenced
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml (original)
   +++ Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml (canonical)
   @@ -1,9 +1,10 @@
   soc {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   -  wed_pcie: wed-pcie@10003000 {
   -    compatible = "mediatek,mt7986-wed-pcie",
   -                 "syscon";
   -    reg = <0 0x10003000 0 0x10>;
--
   --- Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml (canonical)
   @@ -1,5 +1,5 @@
   // Legacy binding example. SD modulator configured as an IIO channel provider
   ads1201_1: adc {
   -  compatible = "sd-modulator";
   -  #io-channel-cells = <0>;
   +    compatible = "sd-modulator";
   +    #io-channel-cells = <0>;
   };
>> Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml:68: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml (canonical)
   @@ -1,18 +1,18 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
>> Documentation/devicetree/bindings/phy/mediatek,mt7988-xfi-tphy.yaml:63: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,mt7988-xfi-tphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,mt7988-xfi-tphy.yaml (canonical)
   @@ -1,16 +1,17 @@
   #include <dt-bindings/clock/mediatek,mt7988-clk.h>
   +
   soc {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   +    #address-cells = <2>;
   +    #size-cells = <2>;
--
   -    spi-cpha;
   -    cmd-gpios = <&gpio 155 GPIO_ACTIVE_HIGH>;
   -  };
   +    slave {
   +        compatible = "olpc,xo1.75-ec";
   +        spi-cpha;
   +        cmd-gpios = <&gpio 155 GPIO_ACTIVE_HIGH>;
   +    };
   };
   Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml:68: example 0: label 'usb_hsphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml:68: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml (canonical)
   @@ -2,12 +2,10 @@
   compatible = "samsung,exynos2200-eusb2-phy";
   reg = <0x10ab0000 0x10000>;
   #phy-cells = <0>;
   -
   clocks = <&cmu_hsi0 7>,
   <&cmu_hsi0 5>,
   <&cmu_hsi0 8>;
--
   +        ranges;
   device_type = "pci";
   -        reg = <0x0 0x0 0x0 0x0 0x0>;
   bus-range = <0x01 0xff>;
   -
   #address-cells = <3>;
   #size-cells = <2>;
   -        ranges;
   };
   };
>> Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml:83: example 0: label 'og01a1b_ep' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml:76: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml (original)
   +++ Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml (canonical)
   @@ -20,7 +20,6 @@
   endpoint {
   remote-endpoint = <&lvds0_out>;
   };
   -
   };
--
   -  clock-names = "ref_clk";
   -  syscon = <&slcr>;
   +    compatible = "xlnx,zynq-devcfg-1.0";
   +    reg = <0xf8007000 0x100>;
   +    interrupts = <0 8 4>;
   +    clocks = <&clkc 12>;
   +    clock-names = "ref_clk";
   +    syscon = <&slcr>;
   };
   Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml:188: example 0: label 'rtc' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/adi,ad8460.yaml:129: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad8460.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad8460.yaml (canonical)
   @@ -8,16 +8,12 @@
   compatible = "adi,ad8460";
   reg = <0>;
   spi-max-frequency = <8000000>;
   -
   dmas = <&tx_dma 0>;
   dma-names = "tx";
   -
--
   -  };
   +    adc@0 {
   +        compatible = "adi,max14001", "adi,max14002";
   +        reg = <0>;
   +        spi-max-frequency = <5000000>;
   +        spi-lsb-first;
   +        vdd-supply = <&vdd>;
   +        vddl-supply = <&vddl>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/light/ti,opt3001.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/ti,opt3001.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/ti,opt3001.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml:95: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml (original)
--
   -                    full-duplex;
   -                    pause;
   -                };
   +            fixed-link {
   +                speed = <1000>;
   +                full-duplex;
   +                pause;
   };
   };
   };
>> Documentation/devicetree/bindings/phy/allwinner,sun50i-h6-usb-phy.yaml:83: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/allwinner,sun50i-h6-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/allwinner,sun50i-h6-usb-phy.yaml (canonical)
   @@ -3,7 +3,6 @@
   #include <dt-bindings/reset/sun50i-h6-ccu.h>
--
   --- Documentation/devicetree/bindings/pci/amazon,al-alpine-v3-pcie.yaml (original)
   +++ Documentation/devicetree/bindings/pci/amazon,al-alpine-v3-pcie.yaml (canonical)
   @@ -18,6 +18,6 @@
   interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-map-mask = <0x00 0 0 7>;
   interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>; /* INTa */
   -        ranges = <0x02000000 0x0 0xc0010000 0x0 0xc0010000 0x0 0x07ff0000>;
   +                        ranges = <0x02000000 0x0 0xc0010000 0x0 0xc0010000 0x0 0x07ff0000>;
   };
   };
>> Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml:84: example 0: label 'sensor_out' defined but never referenced
>> Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml:84: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml (original)
   +++ Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml (canonical)
   @@ -7,11 +7,8 @@
   sensor@37 {
   compatible =  "galaxycore,gc05a2";
   reg = <0x37>;
   -
   clocks = <&gc05a2_clk>;
   -
   reset-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
--
   interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
   -
   bus-range = <0 0>;
   #address-cells = <3>;
   #size-cells = <2>;
   #interrupt-cells = <1>;
   -    ranges = <0x02000000 0 0xee080000 0xee080000 0 0x00010000>;
   dma-ranges = <0x42000000 0 0x40000000 0x40000000 0 0x40000000>;
   interrupt-map-mask = <0xf800 0 0 0x7>;
   interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
>> Documentation/devicetree/bindings/iio/light/rohm,bh1745.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/rohm,bh1745.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/rohm,bh1745.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/pwm/sunplus,sp7021-pwm.yaml:37: example 0: label 'pwm' defined but never referenced
   Documentation/devicetree/bindings/pwm/sunplus,sp7021-pwm.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pwm/sunplus,sp7021-pwm.yaml (original)
--
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -6,7 +7,6 @@
   adc@0 {
   compatible = "adi,ad7780";
   reg = <0>;
   -
   avdd-supply = <&vdd_supply>;
   powerdown-gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
   adi,gain-gpios = <&gpio1  5 GPIO_ACTIVE_LOW>;
>> Documentation/devicetree/bindings/phy/apple,atcphy.yaml:169: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/apple,atcphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/apple,atcphy.yaml (canonical)
   @@ -1,54 +1,52 @@
   phy@83000000 {
   -  compatible = "apple,t8103-atcphy";
   -  reg = <0x83000000 0x4c000>,
   -        <0x83050000 0x8000>,
   -        <0x80000000 0x4000>,
   -        <0x82a90000 0x4000>,
   -        <0x82a84000 0x4000>;
--
   ts: touchscreen {
>> Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml:148: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml (canonical)
   @@ -1,12 +1,13 @@
   #include <dt-bindings/mfd/stm32f4-rcc.h>
   #include <dt-bindings/clock/stm32fx-clock.h>
   +
   rtc@40002800 {
   -  compatible = "st,stm32-rtc";
   -  reg = <0x40002800 0x400>;
   -  clocks = <&rcc 1 CLK_RTC>;
--
   -            };
   -
   -            rt5033_charger: charger {
   -                compatible = "richtek,rt5033-charger";
   -                monitored-battery = <&battery>;
   -                richtek,usb-connector = <&usb_con>;
   };
   };
   };
   Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml:154: example 0: label 'adv7482_ain7' defined but never referenced
>> Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml:154: example 0: label 'adv7482_hdmi' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml:154: example 0: label 'adv7482_txa' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml:154: example 0: label 'adv7482_txb' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml:154: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml (original)
   +++ Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml (canonical)
   @@ -7,10 +7,9 @@
   video-receiver@70 {
   compatible = "adi,adv7482";
   reg = <0x70 0x71 0x72 0x73 0x74 0x75
   -               0x60 0x61 0x62 0x63 0x64 0x65>;
--
>> Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml (canonical)
   @@ -1,13 +1,14 @@
   #include <dt-bindings/clock/qcom,gcc-sc7180.h>
   #include <dt-bindings/clock/qcom,rpmh.h>
   +
   clock-controller@ad00000 {
   -  compatible = "qcom,sc7180-camcc";
   -  reg = <0x0ad00000 0x10000>;
   -  clocks = <&rpmhcc RPMH_CXO_CLK>,
--
   timer@80810000 {
   -  compatible = "cirrus,ep9301-timer";
   -  reg = <0x80810000 0x100>;
   -  interrupt-parent = <&vic1>;
   -  interrupts = <19>;
   +    compatible = "cirrus,ep9301-timer";
   +    reg = <0x80810000 0x100>;
   +    interrupt-parent = <&vic1>;
   +    interrupts = <19>;
   };
>> Documentation/devicetree/bindings/iio/afe/temperature-sense-rtd.yaml:92: example 0: label 'pt1000_1' defined but never referenced
>> Documentation/devicetree/bindings/iio/afe/temperature-sense-rtd.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/afe/temperature-sense-rtd.yaml (original)
   +++ Documentation/devicetree/bindings/iio/afe/temperature-sense-rtd.yaml (canonical)
   @@ -2,8 +2,7 @@
   compatible = "temperature-sense-rtd";
   #io-channel-cells = <0>;
   io-channels = <&temp_adc1 0>;
   -
   excitation-current-microamp = <1000>; /* i = U/R = 5 / 5000 */
   -    alpha-ppm-per-celsius = <3908>;
   +                                  alpha-ppm-per-celsius = <3908>;
--
   @@ -166,10 +166,5 @@
   reg = <4>;
   };
   };
   -
   -        i2c-mux {
   -            #address-cells = <1>;
   -            #size-cells = <0>;
   -        };
   };
>> };Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml:91: example 0: label 'pcie0_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml:91: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml (canonical)
   @@ -3,17 +3,12 @@
   pcie0_phy: phy@4b0000 {
   compatible = "qcom,ipq5332-uniphy-pcie-phy";
   reg = <0x004b0000 0x800>;
   -
   clocks = <&gcc GCC_PCIE3X1_0_PIPE_CLK>,
   <&gcc GCC_PCIE3X1_PHY_AHB_CLK>;
   -
--
   energy {
>> Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml:59: example 0: label 'csi0_rx' defined but never referenced
>> Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml:59: example 0: label 'csi1_rx' defined but never referenced
>> Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml:59: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml (canonical)
   @@ -1,20 +1,21 @@
   #include <dt-bindings/phy/phy.h>
   +
   soc {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   +    #address-cells = <2>;
   +    #size-cells = <2>;
--
   -                     &pdmm0_sdi0_sleep
   -                     &pdmm0_sdi1_sleep
   -                     &pdmm0_sdi2_sleep
   -                     &pdmm0_sdi3_sleep>;
   +                    &pdmm0_sdi0_sleep
   +                    &pdmm0_sdi1_sleep
   +                    &pdmm0_sdi2_sleep
   +                    &pdmm0_sdi3_sleep>;
   };
   };
>> Documentation/devicetree/bindings/clock/silabs,si5351.yaml:201: example 0: label 'with' defined but never referenced
>> Documentation/devicetree/bindings/clock/silabs,si5351.yaml:201: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/silabs,si5351.yaml (original)
   +++ Documentation/devicetree/bindings/clock/silabs,si5351.yaml (canonical)
   @@ -1,65 +1,62 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -
   -  clock-generator@60 {
   -    compatible = "silabs,si5351a-msop";
   -    reg = <0x60>;
--
   +++ Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml (canonical)
   @@ -1,5 +1,5 @@
   audio-codec@300a100 {
   -  compatible = "sophgo,cv1800b-sound-adc";
   -  reg = <0x0300a100 0x100>;
   -  #sound-dai-cells = <0>;
   +    compatible = "sophgo,cv1800b-sound-adc";
   +    reg = <0x0300a100 0x100>;
   +    #sound-dai-cells = <0>;
   };
>> Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml (original)
   +++ Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml (canonical)
   @@ -2,7 +2,6 @@
   compatible = "current-sense-amplifier";
   #io-channel-cells = <0>;
   io-channels = <&tiadc 0>;
   -
   sense-resistor-micro-ohms = <20000>;
   sense-gain-mult = <50>;
   };
--
   reg = <0x033c0000 0x20000>,
   <0x03550000 0x10000>;
   -
   clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
   <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
   clock-names = "core", "audio";
   -
   gpio-controller;
   #gpio-cells = <2>;
   gpio-ranges = <&lpass_tlmm 0 0 15>;
>> Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml:66: example 0: label 'ss_phy_0' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml:66: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml (canonical)
   @@ -1,9 +1,9 @@
   #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
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
>> Documentation/devicetree/bindings/phy/rockchip,rk3288-dp-phy.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,rk3288-dp-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,rk3288-dp-phy.yaml (canonical)
   @@ -1,7 +1,8 @@
   #include <dt-bindings/clock/rk3288-cru.h>
   +
   edp-phy {
   -  compatible = "rockchip,rk3288-dp-phy";
   -  clocks = <&cru SCLK_EDP_24M>;
   -  clock-names = "24m";
   -  #phy-cells = <0>;
--
>> Documentation/devicetree/bindings/rtc/isil,isl1208.yaml:92: example 0: label 'rtc_twi' defined but never referenced
   Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml:58: example 0: label 'pvnn_main_cpu0' defined but never referenced
   Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml (original)
   +++ Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
--
   #size-cells = <0>;
   @@ -7,7 +8,6 @@
   pmic@4b {
   compatible = "mps,mp2629";
   reg = <0x4b>;
   -
   interrupt-controller;
   interrupt-parent = <&gpio2>;
   #interrupt-cells = <2>;
   Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml:70: example 0: label 'lan9374' defined but never referenced
>> Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml:88: example 0: label 'stm_out_port' defined but never referenced
   Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml:85: example 0: label 'c3_mipi_csi_in' defined but never referenced
   Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml:85: example 0: label 'c3_mipi_csi_out' defined but never referenced
   Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml:85: example 0: label 'csi' defined but never referenced
   Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml:85: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml (original)
   +++ Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml (canonical)
   @@ -25,6 +25,7 @@
--
   +                 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
   +                 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
   +                 <&topckgen CLK_TOP_MAINPLL_D4>;
   +        clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
   +        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
   +        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
   +        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
   +        mediatek,scp = <&scp>;
   };
   };
>> Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml:339: example 0: label 'cmu_peri' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml:111: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml (canonical)
   @@ -6,7 +6,7 @@
   uart2-pins-cfg {
   pinmux = <0x503>, /* uart2 txd */
   <0x603>; /* uart2 rxd */
   -            slew-rate = <0>;
   +                     slew-rate = <0>;
   drive-strength = <4>;
--
   reg-names = "dsi_phy",
   "dsi_phy_lane",
   "dsi_pll";
   -
   #clock-cells = <1>;
   #phy-cells = <0>;
   -
   clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>, <&rpmhcc RPMH_CXO_CLK>;
   clock-names = "iface", "ref";
   };
>> Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml:91: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml (canonical)
   @@ -3,7 +3,6 @@
   #include <dt-bindings/reset/sun50i-a64-ccu.h>
--
   +          <0x0aec2200 0xa0>,
   +          <0x0aec2600 0xa0>,
   +          <0x0aec2000 0x19c>;
   +    clocks = <&dispcc 0>, <&dispcc 1>;
   +    clock-names = "aux", "cfg_ahb";
   +    #clock-cells = <1>;
   +    #phy-cells = <0>;
   +    vdda-phy-supply = <&vdd_a_edp_0_1p2>;
   +    vdda-pll-supply = <&vdd_a_edp_0_0p9>;
   };
>> Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml (canonical)
   @@ -1,11 +1,11 @@
   phy@ff640000 {
   -        compatible = "amlogic,axg-mipi-dphy";
   -        reg = <0xff640000 0x100>;
   -        clocks = <&clk_mipi_dsi_phy>;
   -        clock-names = "pclk";
   -        resets = <&reset_phy>;
   -        reset-names = "phy";
--
   -  resets = <&rst 100>;
   -
   -  #thermal-sensor-cells = <1>;
   +    compatible = "nvidia,tegra30-tsensor";
   +    reg = <0x70014000 0x500>;
   +    interrupts = <0 102 4>;
   +    clocks = <&clk 100>;
   +    resets = <&rst 100>;
   +    #thermal-sensor-cells = <1>;
   };
>> Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml:44: example 0: label 'pcie_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml:44: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml (canonical)
   @@ -1,7 +1,7 @@
   pcie_phy: pcie-phy@15680000 {
   compatible = "samsung,exynos5433-pcie-phy";
   reg = <0x15680000 0x1000>;
   +    #phy-cells = <0>;
   samsung,pmu-syscon = <&pmu_system_controller>;
   samsung,fsys-sysreg = <&syscon_fsys>;
   -    #phy-cells = <0>;
--
   ports {
   Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml:69: example 0: node name 'BUCK' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml (original)
   +++ Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   potentiometer@0 {
--
   +        interrupt-parent = <&gic>;
   +        interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
   +                     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
   +                     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
   +                     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
   +        interrupt-names = "host", "peripheral", "otg", "wakeup";
   +        phys = <&usb3_phy>;
   +        phy-names = "cdns3,usb3-phy";
   +    };
   };
>> Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml (original)
   +++ Documentation/devicetree/bindings/iio/potentiometer/max5432.yaml (canonical)
   @@ -1,8 +1,9 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  max5434@28 {
   -    compatible = "maxim,max5434";
   -    reg = <0x28>;
   -  };
--
   -
   -    pcie_pins: pcie-pins {
   -      mux {
   -        function = "pcie";
   -        groups = "pcie_clk", "pcie_wake", "pcie_pereset";
   -      };
   -    };
   -
   -  };
   };
>> Documentation/devicetree/bindings/iio/potentiometer/adi,ad5272.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/potentiometer/adi,ad5272.yaml (original)
   +++ Documentation/devicetree/bindings/iio/potentiometer/adi,ad5272.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/usb/realtek,rtd-type-c.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/realtek,rtd-type-c.yaml (original)
   +++ Documentation/devicetree/bindings/usb/realtek,rtd-type-c.yaml (canonical)
--
   --- Documentation/devicetree/bindings/regulator/dlg,da9211.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/dlg,da9211.yaml (canonical)
   @@ -18,6 +18,7 @@
   regulator-max-microamp = <5000000>;
   enable-gpios = <&gpio 27 0>;
   };
   +
   BUCKB {
   regulator-name = "VBUCKB";
   regulator-min-microvolt = < 300000>;
>> Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml:57: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml (original)
   +++ Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml (canonical)
   @@ -7,7 +7,6 @@
   reg = <0x05e01000 0x8f000>,
   <0x05eb0000 0x2008>;
   reg-names = "mdp", "vbif";
   -
   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
   <&dispcc DISP_CC_MDSS_AHB_CLK>,
   <&dispcc DISP_CC_MDSS_MDP_CLK>,
--
>> Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml:159: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml (canonical)
   @@ -6,10 +6,10 @@
   <0xf0471940 0x6c0>;
   #phy-cells = <1>;
   dr_mode = "host";
   +    clocks = <&usb20>, <&usb30>;
   +    clock-names = "sw_usb", "sw_usb3";
   brcm,ioc = <1>;
   brcm,ipp = <1>;
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
>> Documentation/devicetree/bindings/iio/potentiometer/microchip,mcp4531.yaml:107: example 0: label 'dpot' defined but never referenced
>> Documentation/devicetree/bindings/iio/potentiometer/microchip,mcp4531.yaml:107: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/potentiometer/microchip,mcp4531.yaml (original)
   +++ Documentation/devicetree/bindings/iio/potentiometer/microchip,mcp4531.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dpot: dpot@28 {
   compatible = "microchip,mcp4651-104";
   reg = <0x28>;
--
   pcie_intc_0: interrupt-controller {
>> Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml:110: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml (original)
   +++ Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml (canonical)
   @@ -35,7 +35,6 @@
   interconnect-names = "dma-mem", "write";
   iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
   power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEA>;
   -
   phy-handle = <&mgbe0_phy>;
   phy-mode = "usxgmii";
--
   +++ Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml (canonical)
   @@ -11,7 +11,7 @@
   reset-names = "stmmaceth";
   rx-fifo-depth = <256>;
   tx-fifo-depth = <256>;
   +    phy-mode = "rgmii-id";
   snps,pbl = <4>;
   snps,force_thresh_dma_mode;
   -    phy-mode = "rgmii-id";
   };
>> Documentation/devicetree/bindings/clock/allwinner,sun6i-a31-pll6-clk.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/allwinner,sun6i-a31-pll6-clk.yaml (original)
   +++ Documentation/devicetree/bindings/clock/allwinner,sun6i-a31-pll6-clk.yaml (canonical)
   @@ -1,7 +1,7 @@
   clk@1c20028 {
   -    #clock-cells = <1>;
   compatible = "allwinner,sun6i-a31-pll6-clk";
   reg = <0x01c20028 0x4>;
   +    #clock-cells = <1>;
   clocks = <&osc24M>;
   clock-output-names = "pll6", "pll6x2";
--
   "hf_0";
   -
   iommus = <&apps_smmu 0x3400 0x20>;
   -
   power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
   power-domain-names = "top";
   -
   vdda-phy-supply = <&vreg_l4a_0p88>;
   vdda-pll-supply = <&vreg_l1c_1p2>;
   Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml:41: example 0: label 'lpass_audiocc' defined but never referenced
>> Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/net/sff,sfp.yaml:91: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/sff,sfp.yaml (original)
   +++ Documentation/devicetree/bindings/net/sff,sfp.yaml (canonical)
--
   -  #reset-cells = <1>;
   -  #power-domain-cells = <1>;
   +    compatible = "qcom,gcc-sm8450";
   +    reg = <0x00100000 0x001f4200>;
   +    clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
   +    clock-names = "bi_tcxo", "sleep_clk";
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    #power-domain-cells = <1>;
   };
>> Documentation/devicetree/bindings/phy/mediatek,mt7628-usbphy.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,mt7628-usbphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,mt7628-usbphy.yaml (canonical)
   @@ -1,9 +1,9 @@
   phy@10120000 {
   -  compatible = "mediatek,mt7628-usbphy";
   -  reg = <0x10120000 0x1000>;
   -  #phy-cells = <0>;
   -  ralink,sysctl = <&sysc>;
   -  resets = <&rstctrl 22>,
   -           <&rstctrl 25>;
--
   -         clocks = <&firmware_clocks 7>;
   -         iommus = <&iommu2>;
   +    isp@880000 {
   +        compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
   +        reg = <0x10 0x00880000 0x0 0x4000>;
   +        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
   +        clocks = <&firmware_clocks 7>;
   +        iommus = <&iommu2>;
   };
   };
>> Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:47: example 0: label 'usb2_utmi_host_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml (canonical)
   @@ -1,11 +1,11 @@
   usb2_utmi_host_phy: phy@5f000 {
   -  compatible = "marvell,a3700-utmi-host-phy";
   -  reg = <0x5f000 0x800>;
   -  marvell,usb-misc-reg = <&usb2_syscon>;
   -  #phy-cells = <0>;
   +    compatible = "marvell,a3700-utmi-host-phy";
   +    reg = <0x5f000 0x800>;
--
>> Documentation/devicetree/bindings/iio/accel/adi,adxl380.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl380.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adxl380.yaml (canonical)
   @@ -1,16 +1,16 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   -      compatible = "silergy,sy8824c";
   -      regulator-min-microvolt = <800000>;
   -      regulator-max-microvolt = <1150000>;
   -      reg = <0x60>;
   +        compatible = "silergy,sy8824c";
   +        reg = <0x60>;
   +        regulator-min-microvolt = <800000>;
   +        regulator-max-microvolt = <1150000>;
   };
   };
>> Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml (canonical)
   @@ -1,4 +1,5 @@
   # include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml:60: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml (original)
--
   -            opp-level = <2>;
   -            qcom,opp-fuse-level = <2>;
   -        };
   -        cpr_opp3: opp3 {
   -            opp-level = <3>;
   -            qcom,opp-fuse-level = <3>;
   -        };
   -    };
   };
   Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml:52: example 0: label 'pai_to_hdmi_tx' defined but never referenced
>> Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml:65: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml:81: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml (original)
--
   -
   clocks = <&gcc GCC_PCIE_2_PIPE_CLK>;
   resets = <&gcc GCC_PCIE_2_PHY_BCR>;
   -
   #clock-cells = <0>;
   clock-output-names = "pcie_2_pipe_clk_src";
   -
   #phy-cells = <0>;
   };
   };
>> Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml:55: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml (canonical)
   @@ -1,13 +1,15 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  accelerometer@14 {
   -    compatible = "bosch,bma400";
--
   fetchdecode@56180820 {
   compatible = "fsl,imx8qxp-dc-fetchdecode";
>> Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml:151: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml (original)
   +++ Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml (canonical)
   @@ -15,6 +15,7 @@
   clock-names = "refclk";
   #address-cells = <1>;
   #size-cells = <0>;
   +
   phy@0 {
   reg = <0>;
   resets = <&phyrst 1>, <&phyrst 2>,
--
   Documentation/devicetree/bindings/phy/mscc,vsc7514-serdes.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mscc,vsc7514-serdes.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mscc,vsc7514-serdes.yaml (canonical)
   @@ -1,4 +1,4 @@
   serdes: serdes {
   -  compatible = "mscc,vsc7514-serdes";
   -  #phy-cells = <2>;
   +    compatible = "mscc,vsc7514-serdes";
   +    #phy-cells = <2>;
   };
>> Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml:63: example 0: label 'dsi_dphy' defined but never referenced
   Documentation/devicetree/bindings/usb/ti,am62-usb.yaml:78: example 0: label 'usbss1' defined but never referenced
   Documentation/devicetree/bindings/usb/ti,am62-usb.yaml:78: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/ti,am62-usb.yaml (original)
   +++ Documentation/devicetree/bindings/usb/ti,am62-usb.yaml (canonical)
   @@ -3,28 +3,28 @@
   #include <dt-bindings/gpio/gpio.h>
--
   -    eeprom@57{
   +    eeprom@57 {
   compatible = "atmel,24c01";
   reg = <0x57 0x0 0x10>;
   pagesize = <0x8>;
>> Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml:83: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml (canonical)
   @@ -2,28 +2,23 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
--
   gpio@10060000 {
   compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
   +    reg = <0x10060000 0x1000>;
   interrupt-parent = <&plic>;
   interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
   <17>, <18>, <19>, <20>, <21>, <22>;
   -    reg = <0x10060000 0x1000>;
   clocks = <&tlclk FU540_PRCI_CLK_TLCLK>;
   gpio-controller;
   #gpio-cells = <2>;Documentation/devicetree/bindings/phy/phy-common-props.yaml:148: example 0: label 'phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/phy-common-props.yaml:148: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-common-props.yaml (original)
   +++ Documentation/devicetree/bindings/phy/phy-common-props.yaml (canonical)
   @@ -1,10 +1,10 @@
   #include <dt-bindings/phy/phy.h>
--
   usb2_vbus-supply = <&reg_usb2_vbus>;
   Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml (original)
   +++ Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml (canonical)
   @@ -8,6 +8,5 @@
   clock-names = "axi", "i3c";
   #address-cells = <3>;
   #size-cells = <0>;
   -
   /* I3C and I2C devices */
>> };Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml:239: example 0: label 'camss' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml:239: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml (canonical)
   @@ -3,146 +3,137 @@
   #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
--
   -  vdda-supply = <&reg_2v8>;
   -
   -  ports {
   -    #address-cells = <1>;
   -    #size-cells = <0>;
   -  };
   +    ports {
   +        #address-cells = <1>;
   +        #size-cells = <0>;
   +    };
>> };Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-tx.yaml:59: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-tx.yaml (original)
   +++ Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-tx.yaml (canonical)
   @@ -1,10 +1,10 @@
   phy@295e0000 {
   -  compatible = "starfive,jh7110-dphy-tx";
   -  reg = <0x295e0000 0x10000>;
   -  clocks = <&voutcrg 14>;
   -  clock-names = "txesc";
   -  resets = <&syscrg 10>;
   -  reset-names = "sys";
--
   ldo2-supply = <&buck2_reg>;
   ldo3-supply = <&vcc_3v3_sys>;
   ldo4-supply = <&vcc_3v3_sys>;
   -
   pinctrl-0 = <&pmic_irq_pins_default>;
   -
   interrupt-parent = <&gic500>;
   interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
   ti,power-button;
   Documentation/devicetree/bindings/net/mdio-mux-mmioreg.yaml:48: example 0: label 'phy_xgmii_slot1' defined but never referenced
>> Documentation/devicetree/bindings/usb/nxp,isp1760.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/nxp,isp1760.yaml (original)
   +++ Documentation/devicetree/bindings/usb/nxp,isp1760.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   usb@40200000 {
   compatible = "nxp,usb-isp1763";
   reg = <0x40200000 0x100000>;Documentation/devicetree/bindings/net/mdio-mux-mmioreg.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/mdio-mux-mmioreg.yaml (original)
   +++ Documentation/devicetree/bindings/net/mdio-mux-mmioreg.yaml (canonical)
--
   +                           <1 0>,                 /* TS 26 */
   +                           <5 FSL_CPM_TSA_SCC3>;  /* TS 27..31 */
   +                           fsl,rx-ts-routes = <2 0>,             /* TS 0..1 */
   +                           <24 FSL_CPM_TSA_SCC4>, /* 2..25 */
   +                           <1 0>,                 /* TS 26 */
   +                           <5 FSL_CPM_TSA_SCC3>;  /* TS 27..31 */
   +                           };
   };
   };
   Documentation/devicetree/bindings/gpio/cdns,gpio.yaml:69: example 0: label 'gpio0' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml:189: example 0: label 'hsusb_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml:189: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml (canonical)
   @@ -1,17 +1,15 @@
   #include <dt-bindings/clock/qcom,gcc-msm8996.h>
   +
   hsusb_phy: phy@7411000 {
   compatible = "qcom,msm8996-qusb2-phy";
   reg = <0x7411000 0x180>;
   #phy-cells = <0>;
   -
--
   constframe@56180960 {
   compatible = "fsl,imx8qxp-dc-constframe";
>> Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml (canonical)
   @@ -1,4 +1,5 @@
   # include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml:68: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml (original)
--
   compatible = "silvaco,i3c-master-v1";
   +    reg = <0xa0000000 0x1000>;
   clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
   clock-names = "pclk", "fast_clk", "slow_clk";
   interrupt-parent = <&gic>;
   interrupts = <0 89 4>;
   -    reg = <0xa0000000 0x1000>;
   #address-cells = <3>;
   #size-cells = <0>;
   };
>> Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml:288: example 0: label 'pcie_ep' defined but never referenced
   Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml:288: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml (original)
   +++ Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml (canonical)
   @@ -13,19 +13,15 @@
   <0x01c03000 0x3000>;
   reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
   "mmio";
   -
   clocks = <&gcc GCC_PCIE_AUX_CLK>,
   -         <&gcc GCC_PCIE_CFG_AHB_CLK>,
--
   +        reg = <0x57 0x0 (I2C_FM | I2C_FILTER)>;
   +        pagesize = <0x8>;
   +    };
   +
   +    /* I3C device with a static I2C address and assigned address. */
   +    thermal_sensor: sensor@68,39200144004 {
   +        reg = <0x68 0x392 0x144004>;
   +        assigned-address = <0xa>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/accel/kionix,kx022a.yaml:57: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/kionix,kx022a.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/kionix,kx022a.yaml (canonical)
   @@ -1,15 +1,15 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   accel@1f {
--
   -                  remote-endpoint = <&mipi_in_panel>;
   -              };
   -          };
   -      };
   +            mipi_out_panel: endpoint {
   +                remote-endpoint = <&mipi_in_panel>;
   +            };
   +        };
   +    };
   };
>> Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml:76: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml (original)
--
   +    cache-controller@15000000 {
   +        compatible = "starfive,jh8100-starlink-cache", "cache";
   +        reg = <0x0 0x15000000 0x0 0x278>;
   +        cache-block-size = <64>;
   +        cache-level = <3>;
   +        cache-sets = <8192>;
   +        cache-size = <0x400000>;
   +        cache-unified;
   +    };
   };
>> Documentation/devicetree/bindings/phy/intel,combo-phy.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/intel,combo-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/intel,combo-phy.yaml (canonical)
   @@ -1,11 +1,12 @@
   #include <dt-bindings/phy/phy.h>
   +
   combophy@d0a00000 {
   compatible = "intel,combophy-lgm", "intel,combo-phy";
   -    clocks = <&cgu0 1>;
   -    #phy-cells = <1>;
   reg = <0xd0a00000 0x40000>,
--
   +        #size-cells = <2>;
   +        device_type = "pci";
   +        resets = <&syscon ASPEED_RESET_PCIE_RC_O>;
   +        reset-names = "perst";
   +        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
   +        pinctrl-names = "default";
   +        pinctrl-0 = <&pinctrl_pcierc1_default>;
   +        phys = <&pcie_phy1>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml:82: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   accelerometer@8 {
--
>> Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml:101: example 0: label 'ufs_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml:101: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml (canonical)
   @@ -4,7 +4,6 @@
   compatible = "samsung,exynos7-ufs-phy";
   reg = <0x15571800 0x240>;
   reg-names = "phy-pma";
   -    samsung,pmu-syscon = <&pmu_system_controller>;
   #phy-cells = <0>;
   clocks = <&clock_fsys1 SCLK_COMBO_PHY_EMBEDDED_26M>,
   <&clock_fsys1 PHYCLK_UFS20_RX1_SYMBOL_USER>,
--
   -      function = "pwm_syn_clk";
   -      groups = "pwm_syn_clk_grp";
   -    };
   -
   -    pinctrl_sys_irq: sys_irq-pins {
   -      function = "sys_irq";
   -      groups = "sys_irq_grp";
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml:125: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml (original)
   +++ Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml (canonical)
   @@ -1,50 +1,49 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   pci@50000000 {
   -  compatible = "cortina,gemini-pci", "faraday,ftpci100";
   -  reg = <0x50000000 0x100>;
   -  device_type = "pci";
   -  #address-cells = <3>;
--
   +        reg = <0x1>;
   +        pwms = <&pwm 4 3000>;
   +        reset-gpios = <&gpio2 7>;
   +        dc-gpios = <&gpio2 8>;
   +        spi-max-frequency = <10000000>;
   +        solomon,com-lrremap;
   +        solomon,com-invdir;
   +        solomon,com-offset = <32>;
   +        solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
   +    };
>> };Documentation/devicetree/bindings/iio/accel/adi,adxl367.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl367.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adxl367.yaml (canonical)
   @@ -1,13 +1,13 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   -    interrupts = <25 IRQ_TYPE_EDGE_RISING>;
   -  };
   +    accelerometer@0 {
   +        compatible = "adi,adxl367";
   +        reg = <0>;
   +        spi-max-frequency = <1000000>;
   +        interrupt-parent = <&gpio>;
   +        interrupts = <25 IRQ_TYPE_EDGE_RISING>;
   +    };
   };
>> Documentation/devicetree/bindings/cache/l2c2x0.yaml:230: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/cache/l2c2x0.yaml (original)
   +++ Documentation/devicetree/bindings/cache/l2c2x0.yaml (canonical)
   @@ -1,10 +1,10 @@
   cache-controller@fff12000 {
   compatible = "arm,pl310-cache";
   reg = <0xfff12000 0x1000>;
   +    cache-unified;
   +    cache-level = <2>;
   +    interrupts = <45>;
   arm,data-latency = <1 1 1>;
   arm,tag-latency = <2 2 2>;
   arm,filter-ranges = <0x80000000 0x8000000>;
   -    cache-unified;
   -    cache-level = <2>;
   -    interrupts = <45>;
   };
>> Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml:53: example 0: label 'serdes_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
   +
   serdes_phy: phy@8901000 {
   compatible = "qcom,sa8775p-dwmac-sgmii-phy";
   reg = <0x08901000 0xe10>;
--
   @@ -3,6 +3,6 @@
   usb_phy: usb-phy {
   compatible = "nuvoton,ma35d1-usb2-phy";
   clocks = <&clk USBD_GATE>;
   +    #phy-cells = <0>;
   nuvoton,sys = <&sys>;
   -    #phy-cells = <0>;
   };
   Documentation/devicetree/bindings/cache/socionext,uniphier-system-cache.yaml:78: example 1: label 'l2' defined but never referenced
   Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml:69: example 0: label 'dfr_adp_out_mipi' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml:70: example 0: label 'usb_1_hsphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml (canonical)
   @@ -1,14 +1,10 @@
   usb_1_hsphy: phy@88e3000 {
   compatible = "qcom,sm8750-m31-eusb2-phy";
   reg = <0x88e3000 0x29c>;
   -
   clocks = <&tcsrcc_usb2_clkref_en>;
   clock-names = "ref";
   -
--
   +++ Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml (canonical)
   @@ -4,7 +4,6 @@
   compatible = "samsung,exynosautov920-cmu-peric0";
   reg = <0x10800000 0x8000>;
   #clock-cells = <1>;
   -
   clocks = <&xtcxo>,
   <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
   <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
   Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml:68: example 0: label 'hdmi' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml:100: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml (canonical)
   @@ -2,20 +2,20 @@
   #include <dt-bindings/reset/rockchip,rk3588-cru.h>
--
>> Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml:72: example 0: label 'usb_1_hsphy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml:72: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml (canonical)
   @@ -6,12 +6,9 @@
   compatible = "qcom,sm8550-snps-eusb2-phy";
   reg = <0x88e3000 0x154>;
   #phy-cells = <0>;
   -
   clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
   clock-names = "ref";
   -
--
   +        reg = <0xa0353000 0x1000>;
   +        vana-supply = <&ab8500_ldo_ana_reg>;
   +        /* This DSI port only has the Low Power / Energy Save clock */
   +        clocks = <&prcmu_clk PRCMU_DSI2ESCCLK>;
   +        clock-names = "lp";
   +        #address-cells = <1>;
   +        #size-cells = <0>;
   +    };
   };
   Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml:72: example 0: label 'dphy0' defined but never referenced
>> Documentation/devicetree/bindings/iio/accel/bosch,bmi088.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/bosch,bmi088.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/bosch,bmi088.yaml (canonical)
   @@ -1,13 +1,15 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  bmi088-accel@1 {
   -    compatible = "bosch,bmi088-accel";
--
>> Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml (canonical)
   @@ -1,17 +1,15 @@
   #include <dt-bindings/clock/qcom,gcc-qcs404.h>
   +
   phy@7786000 {
   -  compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
   -  reg = <0x07786000 0xb8>;
   -
   -  clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
--
   -
   -  cpu = <&CPU1>;
   -  arm,cs-dev-assoc = <&etm1>;
   +    compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
   +                 "arm,primecell";
   +    reg = <0x859000 0x1000>;
   +    clocks = <&soc_smc50mhz>;
   +    clock-names = "apb_pclk";
   +    cpu = <&CPU1>;
   +    arm,cs-dev-assoc = <&etm1>;
>> };Documentation/devicetree/bindings/cache/sifive,ccache0.yaml:203: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/cache/sifive,ccache0.yaml (original)
   +++ Documentation/devicetree/bindings/cache/sifive,ccache0.yaml (canonical)
   @@ -1,11 +1,11 @@
   cache-controller@2010000 {
   compatible = "sifive,fu540-c000-ccache", "cache";
   +    reg = <0x2010000 0x1000>;
   cache-block-size = <64>;
   cache-level = <2>;
   cache-sets = <1024>;
   cache-size = <2097152>;
--
   };
   Documentation/devicetree/bindings/net/intel,ixp46x-ptp-timer.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/intel,ixp46x-ptp-timer.yaml (original)
   +++ Documentation/devicetree/bindings/net/intel,ixp46x-ptp-timer.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   ptp-timer@c8010000 {
   compatible = "intel,ixp46x-ptp-timer";
   reg = <0xc8010000 0x1000>;
>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml:172: example 0: label 'ufs_mem_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml:172: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml (canonical)
   @@ -4,19 +4,13 @@
   ufs_mem_phy: phy@1d87000 {
   compatible = "qcom,sc8280xp-qmp-ufs-phy";
   reg = <0x01d87000 0x1000>;
   -
   clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
   <&gcc GCC_UFS_REF_CLKREF_CLK>;
   -
--
   +
   +    /*    A         B     */
   +    dbgu {
   +        dbgu-0 {
   +            atmel,pins =
   +                <AT91_PIOB 14 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
   +                AT91_PIOB 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;
   +        };
   +    };
   };
>> Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml:76: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml (original)
--
   -  interrupt-controller;
   -  #interrupt-cells = <2>;
   +    compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
   +    reg = <0x4d000000 0x100>;
   +    interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
   +    gpio-controller;
   +    #gpio-cells = <2>;
   +    interrupt-controller;
   +    #interrupt-cells = <2>;
   };
>> Documentation/devicetree/bindings/iio/accel/murata,sca3300.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/murata,sca3300.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/murata,sca3300.yaml (canonical)
   @@ -1,6 +1,7 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   accelerometer@0 {
   compatible = "murata,sca3300";
   reg = <0x0>;
--
   -  reg = <0x110f8800 0x30>;
   -  clocks = <&gcc USB30_0_UTMI_CLK>;
   -  clock-names = "ref";
   -  #phy-cells = <0>;
   +    compatible = "qcom,ipq806x-usb-phy-hs";
   +    reg = <0x110f8800 0x30>;
   +    clocks = <&gcc USB30_0_UTMI_CLK>;
   +    clock-names = "ref";
   +    #phy-cells = <0>;
   };
>> Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml:87: example 0: label 'dsi0_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml:87: example 0: label 'dsi1_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml:87: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml (original)
   +++ Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml (canonical)
   @@ -9,38 +9,31 @@
   compatible = "qcom,sc8180x-mdss";
   reg = <0x0ae00000 0x1000>;
   reg-names = "mdss";
   -
   +    ranges;
   interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
   <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>,
--
   -      bias-disable;
   +    cec_ao_a_h_pins: cec_ao_a_h {
   +        mux {
   +            groups = "cec_ao_a_h";
   +            function = "cec_ao_a_h";
   +            bias-disable;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/iio/accel/bosch,bma220.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/bosch,bma220.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/bosch,bma220.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/media/nxp,dw100.yaml:57: example 0: label 'dewarp' defined but never referenced
>> Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml (original)
   +++ Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml:99: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml (original)
   +++ Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml (canonical)
--
   +                    <0x1000 0 0 3 &sic 29>,
   +                    <0x1000 0 0 4 &sic 30>,
   +                    <0x0800 0 0 1 &sic 30>,
   +                    <0x0800 0 0 2 &sic 27>,
   +                    <0x0800 0 0 3 &sic 28>,
   +                    <0x0800 0 0 4 &sic 29>,
   +                    <0x0000 0 0 1 &sic 29>,
   +                    <0x0000 0 0 2 &sic 30>,
   +                    <0x0000 0 0 3 &sic 27>,
   +                    <0x0000 0 0 4 &sic 28>;
>> };Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml:83: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml (canonical)
   @@ -1,8 +1,8 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   msmgpio: pinctrl@fd510000 {
   compatible = "qcom,msm8226-pinctrl";
   reg = <0xfd510000 0x4000>;
   -
   gpio-controller;
--
   Documentation/devicetree/bindings/mfd/ti,tps65086.yaml:97: example 0: label 'pmic' defined but never referenced
   Documentation/devicetree/bindings/mfd/ti,tps65086.yaml:97: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/ti,tps65086.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/ti,tps65086.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/cache/qcom,llcc.yaml:346: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/cache/qcom,llcc.yaml (original)
   +++ Documentation/devicetree/bindings/cache/qcom,llcc.yaml (canonical)
   @@ -7,10 +7,10 @@
   system-cache-controller@1100000 {
   compatible = "qcom,sdm845-llcc";
   reg = <0 0x01100000 0 0x50000>, <0 0x01180000 0 0x50000>,
   -            <0 0x01200000 0 0x50000>, <0 0x01280000 0 0x50000>,
   -            <0 0x01300000 0 0x50000>;
   +              <0 0x01200000 0 0x50000>, <0 0x01280000 0 0x50000>,
   +              <0 0x01300000 0 0x50000>;
   reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
   -            "llcc3_base", "llcc_broadcast_base";
   +                    "llcc3_base", "llcc_broadcast_base";
   interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
   };
   };
>> Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml (canonical)
   @@ -1,14 +1,11 @@
   #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
   +
   usb-phy@7b000 {
   compatible = "qcom,ipq5332-usb-hsphy";
   reg = <0x0007b000 0x12c>;
   -
   clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
--
   #size-cells = <2>;
   @@ -21,7 +23,7 @@
   msi-parent = <&pcie0>;
   msi-controller;
   bus-range = <0x00 0x7f>;
   -        ranges = <0x03000000 0x0 0x78000000 0x0 0x78000000 0x0 0x04000000>;
   +
   pcie_intc0: interrupt-controller {
   #address-cells = <0>;
   #interrupt-cells = <1>;
>> Documentation/devicetree/bindings/phy/socionext,uniphier-ahci-phy.yaml:124: example 0: label 'ahci_phy' defined but never referenced
   Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml:60: example 0: label 'ufsphy' defined but never referenced
   Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/mt8183-clk.h>
   +
   ufsphy: ufs-phy@11fa0000 {
   compatible = "mediatek,mt8183-ufsphy";
   reg = <0x11fa0000 0xc000>;
--
   -            reg = <0 0xa88000 0 0x7000>;
   -            interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
   -            clock-names = "se";
   -            clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
   -            pinctrl-names = "default", "sleep";
   -            pinctrl-0 = <&qup_1_uart_3_active>;
   -            pinctrl-1 = <&qup_1_uart_3_sleep>;
   -        };
   };
   };
>> Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml (canonical)
   @@ -1,9 +1,9 @@
   phy@36000 {
   -      compatible = "amlogic,g12a-usb2-phy";
   -      reg = <0x36000 0x2000>;
   -      clocks = <&xtal>;
   -      clock-names = "xtal";
   -      resets = <&phy_reset>;
   -      reset-names = "phy";
--
   iommus = <&apps_smmu 0x740 0>;
   +            phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
   +            phy-names = "usb2-phy", "usb3-phy";
   snps,dis_u2_susphy_quirk;
   snps,dis_enblslpm_quirk;
   -            phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
   -            phy-names = "usb2-phy", "usb3-phy";
   };
   };
   };
>> Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml:296: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml (canonical)
   @@ -6,6 +6,6 @@
   #phy-cells = <1>;
   clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
   clock-names = "phy", "ref";
   +    vbus-supply = <&usb300_vbus_reg>;
   samsung,pmu-syscon = <&pmu_system_controller>;
   -    vbus-supply = <&usb300_vbus_reg>;
   };
--
   u2port0: usb-phy@11290800 {
   reg = <0x11290800 0x100>;
>> Documentation/devicetree/bindings/phy/allwinner,sun50i-h6-usb3-phy.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/allwinner,sun50i-h6-usb3-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/allwinner,sun50i-h6-usb3-phy.yaml (canonical)
   @@ -1,9 +1,10 @@
   #include <dt-bindings/clock/sun50i-h6-ccu.h>
   #include <dt-bindings/reset/sun50i-h6-ccu.h>
   +
   phy@5210000 {
   -      compatible = "allwinner,sun50i-h6-usb3-phy";
   -      reg = <0x5210000 0x10000>;
   -      clocks = <&ccu CLK_USB_PHY1>;
--
   +            };
   +
   +            vdd_sd: SWITCH_REG {
   +                regulator-name = "vdd_sd";
   +                regulator-always-on;
   +                regulator-boot-on;
   +
   regulator-state-mem {
   regulator-off-in-suspend;
   };
>> Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml:95: example 0: label 'phy' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: tab character in DTS line:             <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: tab character in DTS line:             <0x240 0x4A8 0x000 0x0 0x0	0x140>;
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: label 'iomuxc' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: label 'pinctrl_uart2' defined but never referenced
   Documentation/devicetree/bindings/net/rockchip-dwmac.yaml:166: example 0: label 'gmac' defined but never referenced
   Documentation/devicetree/bindings/net/rockchip-dwmac.yaml:166: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/rockchip-dwmac.yaml (original)
   +++ Documentation/devicetree/bindings/net/rockchip-dwmac.yaml (canonical)
   @@ -16,8 +16,7 @@
   "aclk_mac", "pclk_mac";
--
   -            status = "disabled";
   -        };
   -
   -        hsic-1 {
   -            status = "disabled";
   -        };
   -
   usb3-0 {
   nvidia,usb2-companion = <2>;
   };
>> Documentation/devicetree/bindings/phy/rockchip,rk3228-hdmi-phy.yaml:86: example 0: label 'hdmi_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/rockchip,rk3228-hdmi-phy.yaml:86: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/rockchip,rk3228-hdmi-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/rockchip,rk3228-hdmi-phy.yaml (canonical)
   @@ -1,12 +1,11 @@
   +#include <dt-bindings/clock/rk3228-cru.h>
--
   tempmon {
   compatible = "fsl,imx6sx-tempmon";
   interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
   -        fsl,tempmon = <&anatop>;
   nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
   nvmem-cell-names = "calib", "temp_grade";
   clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
   #thermal-sensor-cells = <0>;
   +        fsl,tempmon = <&anatop>;
   };
>> };Documentation/devicetree/bindings/phy/socionext,uniphier-pcie-phy.yaml:96: example 0: label 'pcie_phy' defined but never referenced
   Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml:81: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml (original)
   +++ Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml (canonical)
   @@ -3,34 +3,29 @@
   #include <dt-bindings/mfd/qcom-rpm.h>
--
   -  resets = <&gcc USB2_HSPHY_POR_ARES>,
   -           <&gcc USB2_HSPHY_S_ARES>;
   -  reset-names = "por_rst", "srif_rst";
   +    compatible = "qcom,usb-hs-ipq4019-phy";
   +    reg = <0xa8000 0x40>;
   +    #phy-cells = <0>;
   +    resets = <&gcc USB2_HSPHY_POR_ARES>,
   +             <&gcc USB2_HSPHY_S_ARES>;
   +    reset-names = "por_rst", "srif_rst";
   };
>> Documentation/devicetree/bindings/phy/fsl,imx8qm-lvds-phy.yaml:55: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/fsl,imx8qm-lvds-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/fsl,imx8qm-lvds-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/firmware/imx/rsrc.h>
   +
   phy {
   compatible = "fsl,imx8qm-lvds-phy";
   #phy-cells = <1>;
   Documentation/devicetree/bindings/gpio/sprd,gpio.yaml:59: example 0: label 'ap_gpio' defined but never referenced
   Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml:125: example 0: label 'wcnss_smp2p_in' defined but never referenced
--
   -        &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
   -        &cpcap 48 1
   -    >;
   +                          &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
   +                          &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
   +                          &cpcap 48 1
   +                          >;
   interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
   "sessvld", "sessend", "se1", "dm", "dp";
   io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
>> Documentation/devicetree/bindings/spi/socionext,f-ospi.yaml:44: example 0: label 'ospi0' defined but never referenced
   Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml:134: example 0: label 'ccu' defined but never referenced
   Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml:144: example 1: label 'r_ccu' defined but never referenced
   Documentation/devicetree/bindings/thermal/brcm,ns-thermal.yaml:36: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/brcm,ns-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/brcm,ns-thermal.yaml (canonical)
   @@ -11,6 +11,9 @@
   coefficients = <(-556) 418000>;
   thermal-sensors = <&thermal>;
--
   Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml:44: example 0: label 'rtc' defined but never referenced
   Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml:44: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   rtc: rtc@44a00000 {
   compatible = "epson,rtc7301dg";
   reg = <0x44a00000 0x10000>;
>> Documentation/devicetree/bindings/phy/intel,keembay-phy-usb.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/intel,keembay-phy-usb.yaml (original)
   +++ Documentation/devicetree/bindings/phy/intel,keembay-phy-usb.yaml (canonical)
   @@ -1,7 +1,7 @@
   usb-phy@20400000 {
   -      compatible = "intel,keembay-usb-phy";
   -      reg = <0x20400000 0x1c>,
   -            <0x20480000 0xd0>;
   -      reg-names = "cpr-apb-base", "slv-apb-base";
   -      #phy-cells = <0>;
   +    compatible = "intel,keembay-usb-phy";
--
   -
   +        spi-max-frequency = <25000000>;
   maxim,modesel-gpios = <&gpio2 23>;
   maxim,fault-gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
   maxim,db0-gpios = <&gpio2 25>;
   maxim,db1-gpios = <&gpio2 26>;
   -
   -        spi-max-frequency = <25000000>;
   };
   };
>> Documentation/devicetree/bindings/iio/proximity/awinic,aw96103.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/proximity/awinic,aw96103.yaml (original)
   +++ Documentation/devicetree/bindings/iio/proximity/awinic,aw96103.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   proximity@12 {
--
   -  interrupt-parent = <&gic>;
   -  reg = <0x1f2032d0 0x30>;
   -  mstar,irqs-map-range = <0 63>;
   +    compatible = "mstar,mst-intc";
   +    reg = <0x1f2032d0 0x30>;
   +    interrupt-controller;
   +    #interrupt-cells = <3>;
   +    interrupt-parent = <&gic>;
   +    mstar,irqs-map-range = <0 63>;
   };
>> Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml:113: example 0: label 'hdmi_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml:113: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml (canonical)
   @@ -1,13 +1,13 @@
   hdmi_phy: phy@4a00400 {
   -  compatible = "qcom,hdmi-phy-8960";
   -  reg-names = "hdmi_phy",
   -              "hdmi_pll";
   -  reg = <0x4a00400 0x60>,
   -        <0x4a00500 0x100>;
   -  #clock-cells = <0>;
--
   +            bias-disable;
   nuvoton,pins = <11 0 2>,
   <11 1 2>,
   <11 2 2>,
   <11 3 2>;
   -            power-source = <1>;
   -            bias-disable;
   };
   };
   };
>> Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'DCDC_REG1' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'DCDC_REG2' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'DCDC_REG3' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'DCDC_REG4' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'LDO_REG1' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'LDO_REG2' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'LDO_REG3' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'LDO_REG4' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'LDO_REG5' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'LDO_REG6' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml:126: example 0: node name 'LDO_REG7' must use only [a-z0-9-]
--
   channel@1 {Documentation/devicetree/bindings/rtc/ti,bq32000.yaml:40: example 0: label 'bq32000' defined but never referenced
>> Documentation/devicetree/bindings/rtc/ti,bq32000.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rtc/ti,bq32000.yaml (original)
   +++ Documentation/devicetree/bindings/rtc/ti,bq32000.yaml (canonical)
   @@ -1,10 +1,10 @@
   i2c {
   -        #address-cells = <1>;
   -        #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
>> Documentation/devicetree/bindings/iio/dac/adi,ad5766.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5766.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5766.yaml (canonical)
   @@ -4,8 +4,8 @@
--
   --- Documentation/devicetree/bindings/rng/arm-cctrng.yaml (original)
   +++ Documentation/devicetree/bindings/rng/arm-cctrng.yaml (canonical)
   @@ -1,6 +1,6 @@
   arm_cctrng: rng@60000000 {
   compatible = "arm,cryptocell-713-trng";
   +    reg = <0x60000000 0x10000>;
   interrupts = <0 29 4>;
   -    reg = <0x60000000 0x10000>;
   arm,rosc-ratio = <5000 1000 500 0>;
   };
>> Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml:107: example 0: label 'qup_uart21_default' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml:107: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   tlmm: pinctrl@f100000 {
   compatible = "qcom,glymur-tlmm";
   reg = <0x0f100000 0xf00000>;
   @@ -10,19 +11,20 @@
   gpio-ranges = <&tlmm 0 0 249>;
--
   +    reg = <0x54090000 0x400>;
   +    clocks = <&rcc HDP>;
   +    pinctrl-names = "default";
   +    pinctrl-0 = <&hdp2_gpo>;
   +
   +    hdp2_gpo: hdp2-pins {
   +        function = "gpoval2";
   +        pins = "HDP2";
   +    };
   };
>> Documentation/devicetree/bindings/media/cdns,csi2rx.yaml:144: example 0: label 'csi2rx_in_sensor' defined but never referenced
   Documentation/devicetree/bindings/media/cdns,csi2rx.yaml:144: example 0: label 'csi2rx_out_grabber0' defined but never referenced
   Documentation/devicetree/bindings/media/cdns,csi2rx.yaml:144: example 0: label 'csi2rx_out_grabber1' defined but never referenced
   Documentation/devicetree/bindings/media/cdns,csi2rx.yaml:144: example 0: label 'csi2rx_out_grabber2' defined but never referenced
   Documentation/devicetree/bindings/media/cdns,csi2rx.yaml:144: example 0: label 'csi2rx_out_grabber3' defined but never referenced
   Documentation/devicetree/bindings/media/cdns,csi2rx.yaml:144: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/cdns,csi2rx.yaml (original)
   +++ Documentation/devicetree/bindings/media/cdns,csi2rx.yaml (canonical)
   @@ -17,49 +17,49 @@
   phy-names = "dphy";
--
   -  pinctrl_gpio_lpsr: gpio1-grp {
   -      fsl,pins =
   -        <0x0008 0x0038 0x0000 0x0 0x0	0x59>,
   -        <0x000C 0x003C 0x0000 0x0 0x0	0x59>;
   +    pinctrl_gpio_lpsr: gpio1-grp {
   +        fsl,pins =
   +            <0x0008 0x0038 0x0000 0x0 0x0	0x59>,
   +            <0x000C 0x003C 0x0000 0x0 0x0	0x59>;
   };
   };
>> Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml:109: example 0: label 'tlmm' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml:109: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   tlmm: pinctrl@1000000 {
   compatible = "qcom,mdm9607-tlmm";
   reg = <0x01000000 0x300000>;
   Documentation/devicetree/bindings/pinctrl/actions,s700-pinctrl.yaml:177: example 0: canonical form differs:
--
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
>> Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml:71: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml (original)
   +++ Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   /*
   * The system voltage is circa 12V, but divided down with a 22/222
   * voltage divider (R = 200 Ohms, Rout = 22 Ohms) and fed to an ADC.
   @@ -6,6 +7,7 @@
   spi {
--
   -    compatible = "mps,mpm82504";
   -    reg = <0x30>;
   -    mps,vout-fb-divider-ratio-permille = <600>;
   -  };
   +    pmic@30 {
   +        compatible = "mps,mpm82504";
   +        reg = <0x30>;
   +        mps,vout-fb-divider-ratio-permille = <600>;
   +    };
   };
>> Documentation/devicetree/bindings/iio/dac/adi,ad5064.yaml:236: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5064.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5064.yaml (canonical)
   @@ -1,9 +1,10 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
   +        compatible = "adi,ad5625";
   reg = <0>;
--
   +    gpio@40000000 {
   +        compatible = "xlnx,xps-gpio-1.00.a";
   +        reg = <0x40000000 0x10000>;
   +        gpio-controller;
   +        #gpio-cells = <2>;
   +        clocks = <&clk>;
   +    };
   };
   Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml:48: example 0: label 'adsp_mailbox0' defined but never referenced
   Documentation/devicetree/bindings/fpga/fpga-region.yaml:319: example 1: label 'contains' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml (canonical)
   @@ -1,11 +1,11 @@
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   -    reg = <0>;
   -    spi-max-frequency = <5000000>;
   -    vref-supply = <&vref_reg>;
   -  };
   +    dac@0 {
   +        compatible = "lltc,ltc1660";
   +        reg = <0>;
   +        spi-max-frequency = <5000000>;
   +        vref-supply = <&vref_reg>;
   +    };
>> };Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml:135: example 0: label 'usbphy1' defined but never referenced
--
   Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml:63: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml (canonical)
   @@ -1,5 +1,6 @@
   // Example for I2C
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_hdmi_in' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_hdmi_in_tcon_tv0' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_hdmi_in_tcon_tv1' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_hdmi_out' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_hdmi_out_hdmi' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer0_in' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer0_in_mixer0' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer0_out' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer0_out_tcon_lcd0' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer0_out_tcon_lcd1' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer0_out_tcon_tv0' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer0_out_tcon_tv1' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer1_in' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer1_in_mixer1' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer1_out' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer1_out_tcon_lcd0' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer1_out_tcon_lcd1' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer1_out_tcon_tv0' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_mixer1_out_tcon_tv1' defined but never referenced
>> Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml (original)
   +++ Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml (canonical)
   @@ -1,122 +1,121 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   -
   #include <dt-bindings/clock/sun8i-r40-ccu.h>
   #include <dt-bindings/reset/sun8i-r40-ccu.h>
--
   -                  &gpio1 17 GPIO_ACTIVE_HIGH>;
   +                 &gpio1 16 GPIO_ACTIVE_HIGH
   +                 &gpio1 17 GPIO_ACTIVE_HIGH>;
   data-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH
   -                  &gpio1 13 GPIO_ACTIVE_HIGH
   -                  &gpio1 14 GPIO_ACTIVE_HIGH>;
   +                 &gpio1 13 GPIO_ACTIVE_HIGH
   +                 &gpio1 14 GPIO_ACTIVE_HIGH>;
   enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
   };
>> Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml:96: example 0: label 'ad950' defined but never referenced
>> Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml:96: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml (original)
   +++ Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml (canonical)
   @@ -2,8 +2,8 @@
   compatible = "temperature-transducer";
   #io-channel-cells = <0>;
   io-channels = <&temp_adc 3>;
   -
   sense-offset-millicelsius = <(-273150)>; /* Kelvin to degrees Celsius */
   -    sense-resistor-ohms = <8060>;
   +                                sense-resistor-ohms = <8060>;
   alpha-ppm-per-celsius = <1>; /* 1 uA/K */
   +                            };
   };
>> Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml:106: example 1: label 'znq_tmp' defined but never referenced
   Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml:106: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml (original)
   +++ Documentation/devicetree/bindings/iio/afe/temperature-transducer.yaml (canonical)
   @@ -2,7 +2,7 @@
   compatible = "temperature-transducer";
   #io-channel-cells = <0>;
   io-channels = <&temp_adc 2>;
   -
   sense-offset-millicelsius = <(-273150)>; /* Kelvin to degrees Celsius */
   -    alpha-ppm-per-celsius = <4000>; /* 4 mV/K */
--
   -              };
   -          };
   -      };
   -  };
   +            tcon_top_hdmi_out_hdmi: endpoint {
   +                remote-endpoint = <&hdmi_in_tcon_top>;
   +            };
   +        };
   +    };
   +};
>> Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml (canonical)
   @@ -1,10 +1,12 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
--
   -  vco-offset = <0x00>;
   -  clocks = <&sysclk>;
   -  clock-output-names = "IM-PD1-VCO1";
   +    compatible = "arm,impd1-vco1";
   +    #clock-cells = <0>;
   +    lock-offset = <0x08>;
   +    vco-offset = <0x00>;
   +    clocks = <&sysclk>;
   +    clock-output-names = "IM-PD1-VCO1";
   };
>> Documentation/devicetree/bindings/iio/afe/current-sense-shunt.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/afe/current-sense-shunt.yaml (original)
   +++ Documentation/devicetree/bindings/iio/afe/current-sense-shunt.yaml (canonical)
   @@ -1,26 +1,25 @@
   +};
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   tiadc: adc@48 {
   compatible = "ti,ads1015";
--
   -  reg = <0xd000000 0x4000>;
   -  interrupt-controller;
   -  #interrupt-cells = <2>;
   -  riscv,num-sources = <63>;
   +    compatible = "qemu,aplic", "riscv,aplic";
   +    reg = <0xd000000 0x4000>;
   +    msi-parent = <&imsic_slevel>;
   +    interrupt-controller;
   +    #interrupt-cells = <2>;
   +    riscv,num-sources = <63>;
>> };Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml:224: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml (canonical)
   @@ -1,18 +1,22 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   ad3552r@0 {
   compatible = "adi,ad3552r";
   reg = <0>;
--
>> Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml:80: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml (canonical)
   @@ -2,6 +2,7 @@
   compatible = "fsl,qoriq-tmu";
   reg = <0xf0000 0x1000>;
   interrupts = <18 2 0 0>;
   +    #thermal-sensor-cells = <1>;
   fsl,tmu-range = <0x000a0000 0x00090026 0x0008004a 0x0001006a>;
   fsl,tmu-calibration = <0x00000000 0x00000025>,
   <0x00000001 0x00000028>,
--
   ps_aop_filter: power-controller@4000 {
   compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
>> Documentation/devicetree/bindings/iio/dac/maxim,ds4424.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/maxim,ds4424.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/maxim,ds4424.yaml (canonical)
   @@ -5,6 +5,6 @@
   dac@10 {
   compatible = "maxim,ds4424";
   reg = <0x10>; /* When A0, A1 pins are ground */
   -        vcc-supply = <&vcc_3v3>;
   +              vcc-supply = <&vcc_3v3>;
   };
   };
--
   DCVDD-supply = <&reg_audio>;
   DBVDD-supply = <&reg_audio>;
   AVDD-supply = <&reg_audio>;
   SPKVDD1-supply = <&reg_audio>;
   SPKVDD2-supply = <&reg_audio>;
   +        wlf,hp-cfg = <3 2 3>;
   +        wlf,gpio-cfg = <1 3>;
   +        wlf,shared-lrclk;
   };
   };
>> Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml:144: example 0: label 'cpg' defined but never referenced
>> Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml:144: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml (original)
   +++ Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml (canonical)
   @@ -1,9 +1,9 @@
   cpg: clock-controller@e6150000 {
   -        compatible = "renesas,r8a7795-cpg-mssr";
   -        reg = <0xe6150000 0x1000>;
   -        clocks = <&extal_clk>, <&extalr_clk>;
   -        clock-names = "extal", "extalr";
   -        #clock-cells = <2>;
   -        #power-domain-cells = <0>;
--
   -  slot@1 {
   -    reg = <1>;
   -    bus-width = <4>;
   -  };
   +    slot@1 {
   +        reg = <1>;
   +        bus-width = <4>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml:32: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml (canonical)
   @@ -1,10 +1,10 @@
   mdio {
   -   #address-cells = <1>;
   -   #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   -      reg = <0x0>;
   -      #phy-cells = <0>;
   -   };
   +    pci-phy@0 {
   +        compatible = "brcm,ns2-pcie-phy";
   +        reg = <0x0>;
   +        #phy-cells = <0>;
   +    };
   };
   Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml:51: example 0: node name 'tad_pmu' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml:90: example 0: label 'dac' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml:90: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml (canonical)
   @@ -1,23 +1,24 @@
   // Example on stm32mp157c
   #include <dt-bindings/clock/stm32mp1-clks.h>
   +
   dac: dac@40017000 {
   -  compatible = "st,stm32h7-dac-core";
   -  reg = <0x40017000 0x400>;
   -  clocks = <&rcc DAC12>;
--
   Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml:94: example 0: label 'gpio' defined but never referenced
   Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml (original)
   +++ Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   watchdog {
   compatible = "linux,wdt-gpio";
   gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
>> Documentation/devicetree/bindings/iio/gyroscope/bosch,bmg160.yaml:46: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/gyroscope/bosch,bmg160.yaml (original)
   +++ Documentation/devicetree/bindings/iio/gyroscope/bosch,bmg160.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   gyroscope@69 {
--
   -    rockchip,grf = <&grf>;
   clock-names = "mclk_tx", "mclk_rx", "hclk";
   clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
   <&cru SCLK_I2S2_8CH_RX_OUT>,
   @@ -11,4 +10,5 @@
   reset-names = "codec";
   resets = <&cru SRST_ACODEC_P>;
   #sound-dai-cells = <0>;
   +    rockchip,grf = <&grf>;
   };
>> Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml:51: example 0: label 'lpass_audiocc' defined but never referenced
>> Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
   +
   lpass_audiocc: clock-controller@32a9000 {
   compatible = "qcom,sc8280xp-lpassaudiocc";
   reg = <0x032a9000 0x1000>;
>> Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml:60: example 1: label 'lpasscc' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml:60: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
   +
   lpasscc: clock-controller@33e0000 {
   compatible = "qcom,sc8280xp-lpasscc";
   reg = <0x033e0000 0x12000>;
   Documentation/devicetree/bindings/power/supply/richtek,rt9756.yaml:60: example 0: canonical form differs:
--
   -           <&gcc GPLL0>;
   -  #clock-cells = <1>;
   -  #interconnect-cells = <1>;
   +    compatible = "qcom,ipq5424-apss-clk";
   +    reg = <0x0fa80000 0x20000>;
   +    clocks = <&xo_board>,
   +             <&gcc GPLL0>;
   +    #clock-cells = <1>;
   +    #interconnect-cells = <1>;
   };
>> Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml:68: example 0: label 'ispcrg' defined but never referenced
   Documentation/devicetree/bindings/spi/spi-sifive.yaml:75: example 0: label 'spi' defined but never referenced
   Documentation/devicetree/bindings/spi/spi-sifive.yaml:75: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/spi-sifive.yaml (original)
   +++ Documentation/devicetree/bindings/spi/spi-sifive.yaml (canonical)
   @@ -1,11 +1,11 @@
   spi: spi@10040000 {
   -  compatible = "sifive,fu540-c000-spi", "sifive,spi0";
   -  reg = <0x10040000 0x1000>, <0x20000000 0x10000000>;
   -  interrupt-parent = <&plic>;
   -  interrupts = <51>;
--
   Documentation/devicetree/bindings/timer/brcm,bcmbca-timer.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/timer/brcm,bcmbca-timer.yaml (original)
   +++ Documentation/devicetree/bindings/timer/brcm,bcmbca-timer.yaml (canonical)
   @@ -1,4 +1,4 @@
   timer@fffe0200 {
   -  compatible = "brcm,bcm6345-timer";
   -  reg = <0xfffe0200 0x1c>;
   +    compatible = "brcm,bcm6345-timer";
   +    reg = <0xfffe0200 0x1c>;
   };
>> Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml (original)
   +++ Documentation/devicetree/bindings/iio/gyroscope/invensense,itg3200.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   gyroscope@68 {
--
   compatible = "mediatek,mt8183-wdt";
   reg = <0 0x10007000 0 0x100>;
   interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
   -        mediatek,disable-extrst;
   timeout-sec = <10>;
   #reset-cells = <1>;
   +        mediatek,disable-extrst;
   };
   };
   Documentation/devicetree/bindings/display/renesas,cmm.yaml:57: example 0: label 'cmm0' defined but never referenced
>> Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml (original)
   +++ Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   gyroscope@68 {
--
   irq0_intc: interrupt-controller@f0406800 {
   compatible = "brcm,bcm7120-l2-intc";
   +    reg = <0xf0406800 0x8>;
   interrupt-parent = <&intc>;
   #interrupt-cells = <1>;
   -    reg = <0xf0406800 0x8>;
   interrupt-controller;
   interrupts = <0x0 0x42 0x0>, <0x0 0x40 0x0>;
   brcm,int-map-mask = <0xeb8>, <0x140>;
   Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml:144: example 1: label 'irq1_intc' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml:117: example 0: label 'ltc2688' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml:117: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml (canonical)
   @@ -1,17 +1,16 @@
   -
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   ltc2688: ltc2688@0 {
   compatible = "adi,ltc2688";
--
>> Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-soc-glue.yaml:75: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-soc-glue.yaml (original)
--
   clock-controller@20000000 {
   -  compatible = "rockchip,rv1126b-cru";
   -  reg = <0x20000000 0xc0000>;
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
   +    compatible = "rockchip,rv1126b-cru";
   +    reg = <0x20000000 0xc0000>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   };
>> Documentation/devicetree/bindings/iio/chemical/ams,ccs811.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/ams,ccs811.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/ams,ccs811.yaml (canonical)
   @@ -1,12 +1,13 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   reset-controller@0 {
   compatible = "socionext,uniphier-ld20-usb3-reset";
>> Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml:99: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml (canonical)
   @@ -1,18 +1,18 @@
   otg: usb-controller {
   -  #reset-cells = <1>;
   +    #reset-cells = <1>;
--
   +            reset-names = "phy", "por";
   +            v3p3-supply = <&pm8941_l24>;
   +            v1p8-supply = <&pm8941_l6>;
   +            extcon = <&smbb>;
   +            qcom,init-seq = /bits/ 8 <0x1 0x63>;
   +        };
   };
   -  };
   };
   Documentation/devicetree/bindings/media/arm,mali-c55.yaml:69: example 0: label 'isp_in' defined but never referenced
>> Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml (canonical)
   @@ -1,11 +1,11 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
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
>> Documentation/devicetree/bindings/iio/gyroscope/adi,adxrs290.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/gyroscope/adi,adxrs290.yaml (original)
   +++ Documentation/devicetree/bindings/iio/gyroscope/adi,adxrs290.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   gyro@0 {
--
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
>> Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml:54: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml (canonical)
   @@ -1,9 +1,10 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
   +        compatible = "adi,ad5390-5";
   reg = <0>;
--
   port@1 {
   reg = <1>;
   +
   hdmi_to_mhl: endpoint {
   remote-endpoint = <&mhl_to_hdmi>;
   };
>> Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml:52: example 0: label 'fhctl' defined but never referenced
>> Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml:52: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml (original)
   +++ Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/mt8186-clk.h>
   +
   fhctl: fhctl@1000ce00 {
   compatible = "mediatek,mt8186-fhctl";
   reg = <0x1000ce00 0x200>;
   Documentation/devicetree/bindings/net/mdio-mux-multiplexer.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/mdio-mux-multiplexer.yaml (original)
--
   @@ -1,7 +1,9 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   ak5558: codec@10 {
   compatible = "asahi-kasei,ak5558";
   reg = <0x10>;
>> Documentation/devicetree/bindings/ata/fsl,imx-pata.yaml:37: example 0: label 'pata' defined but never referenced
   Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml:123: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml (original)
   +++ Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml (canonical)
   @@ -1,13 +1,16 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
--
   cpu_scp_lpri: scp-sram-section@0 {
   compatible = "arm,scp-shmem";
   Documentation/devicetree/bindings/firmware/arm,scpi.yaml:237: example 1: label 'scpi_sensors1' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml:78: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-ahci-glue.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-ahci-glue.yaml (original)
--
   efuse@100 {
   compatible = "socionext,uniphier-efuse";
>> Documentation/devicetree/bindings/iio/chemical/senseair,sunrise.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/senseair,sunrise.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/senseair,sunrise.yaml (canonical)
   @@ -1,9 +1,9 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   reg = <0x7e215080 0x40>;
   Documentation/devicetree/bindings/iio/dac/adi,ad5421.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5421.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5421.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml (canonical)
   @@ -1,6 +1,6 @@
   serial {
   -  air-pollution-sensor {
   -    compatible = "plantower,pms7003";
   -    vcc-supply = <&reg_vcc5v0>;
   -  };
   +    air-pollution-sensor {
   +        compatible = "plantower,pms7003";
--
   +           <&agcp_dma 5 5>, <&agcp_dma 6 6>,
   +           <&agcp_dma 7 7>, <&agcp_dma 8 8>,
   +           <&agcp_dma 9 9>, <&agcp_dma 10 10>;
   +    dma-names = "normal_p_l", "normal_p_r",
   +                "normal_c_l", "normal_c_r",
   +                "voice_c", "fast_p",
   +                "loop_c", "loop_p",
   +                "voip_c", "voip_p";
   };
   Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml:35: example 0: label 'soc_ctrl0' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/adi,ad5624r.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5624r.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5624r.yaml (canonical)
   @@ -1,9 +1,10 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
   +        compatible = "adi,ad5624r3";
   reg = <0>;
--
   -  mode-recovery = <BOOT_RECOVERY>;
   -  mode-bootloader = <BOOT_FASTBOOT>;
   -  mode-loader = <BOOT_BL_DOWNLOAD>;
   +    compatible = "syscon-reboot-mode";
   +    offset = <0x40>;
   +    mode-normal = <BOOT_NORMAL>;
   +    mode-recovery = <BOOT_RECOVERY>;
   +    mode-bootloader = <BOOT_FASTBOOT>;
   +    mode-loader = <BOOT_BL_DOWNLOAD>;
   };
>> Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml (original)
   +++ Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml (canonical)
   @@ -1,24 +1,24 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/clock/stm32mp1-clks.h>
   #include <dt-bindings/reset/stm32mp1-resets.h>
   +
   spi@58003000 {
   -  compatible = "st,stm32f469-qspi";
   -  reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
--
   --- Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml (original)
   +++ Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml (canonical)
   @@ -9,7 +9,6 @@
   reg = <0x10050000 0x800>;
   clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
   clock-names = "fin_pll", "mct";
   -
   interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
   <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
   <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
>> Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.yaml:66: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.yaml (original)
   +++ Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.yaml (canonical)
   @@ -7,15 +7,14 @@
   gyroscope@20 {
   compatible = "nxp,fxas21002c";
   reg = <0x20>;
   -
   vdd-supply = <&reg_peri_3p15v>;
   vddio-supply = <&reg_peri_3p15v>;
   -
--
   @@ -1,7 +1,7 @@
   interrupt-controller@fed20204 {
   compatible = "marvell,orion-intc";
   +    reg = <0xfed20204 0x04>,
   +          <0xfed20214 0x04>;
   interrupt-controller;
   #interrupt-cells = <1>;
   -    reg = <0xfed20204 0x04>,
   -          <0xfed20214 0x04>;
   };
>> Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.yaml:55: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.yaml (canonical)
   @@ -1,8 +1,8 @@
   phy@66000960 {
   -    #phy-cells = <0>;
   compatible = "brcm,ns2-drd-phy";
   reg = <0x66000960 0x24>, <0x67012800 0x4>, <0x6501d148 0x4>, <0x664d0700 0x4>;
   reg-names = "icfg", "rst-ctrl", "crmu-ctrl", "usb2-strap";
   +    #phy-cells = <0>;
   id-gpios = <&gpio_g 30 0>;
--
   };
   Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml (original)
   +++ Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   video-codec@580d0000 {
   compatible = "st,stm32mp25-vdec";
   reg = <0x580d0000 0x3c8>;
>> Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml:54: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml (canonical)
   @@ -1,21 +1,22 @@
   #include <dt-bindings/clock/qcom,sm7150-gcc.h>
   #include <dt-bindings/clock/qcom,rpmh.h>
   #include <dt-bindings/power/qcom,rpmhpd.h>
   +
   clock-controller@af00000 {
   -  compatible = "qcom,sm7150-dispcc";
   -  reg = <0x0af00000 0x200000>;
--
>> Documentation/devicetree/bindings/iio/dac/ti,dac7311.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/ti,dac7311.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/ti,dac7311.yaml (canonical)
   @@ -5,7 +5,7 @@
   dac@0 {
   compatible = "ti,dac7311";
   reg = <0>; /* CS0 */
   -        spi-max-frequency = <1000000>;
   +              spi-max-frequency = <1000000>;
   vref-supply = <&vdd_supply>;
   };
--
   port@3 {
   reg = <3>;
>> Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml:44: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml (canonical)
   @@ -1,13 +1,14 @@
   # include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   cpu_optee_lpri0: optee-sram-section@0 {
   compatible = "arm,scmi-shmem";
>> Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml:131: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml (canonical)
   @@ -1,24 +1,23 @@
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   dac@0 {
   compatible = "adi,ltc2672";
   reg = <0>;
--
   };Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml:64: example 0: label 'spi0' defined but never referenced
   Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml (original)
   +++ Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
   +
   rstc: rstc@f0801000 {
   compatible = "nuvoton,npcm750-reset";
   reg = <0xf0801000 0x70>;
>> Documentation/devicetree/bindings/eeprom/at24.yaml:224: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/eeprom/at24.yaml (original)
   +++ Documentation/devicetree/bindings/eeprom/at24.yaml (canonical)
   @@ -1,12 +1,12 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   --- Documentation/devicetree/bindings/sound/fsl,ssi.yaml (original)
   +++ Documentation/devicetree/bindings/sound/fsl,ssi.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/clock/imx6qdl-clock.h>
   +
   ssi@2028000 {
   compatible = "fsl,imx6q-ssi", "fsl,imx51-ssi";
   reg = <0x02028000 0x4000>;
   Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml:103: example 0: label 'shdwc' defined but never referenced
>> Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml:79: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml (canonical)
   @@ -4,19 +4,15 @@
   phy@84000 {
   compatible = "qcom,ipq6018-qmp-pcie-phy";
   reg = <0x00084000 0x1000>;
   -
   clocks = <&gcc GCC_PCIE0_AUX_CLK>,
   <&gcc GCC_PCIE0_AHB_CLK>,
   <&gcc GCC_PCIE0_PIPE_CLK>;
--
>> Documentation/devicetree/bindings/iio/chemical/sciosense,ens160.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/sciosense,ens160.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/sciosense,ens160.yaml (canonical)
   @@ -1,12 +1,13 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   snps,rd_osr_lmt = <2>;
   Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml (original)
   +++ Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   spi@50000 {
   compatible = "amlogic,a4-spisg";
   reg = <0x50000 0x38>;
>> Documentation/devicetree/bindings/iio/chemical/winsen,mhz19b.yaml:27: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/winsen,mhz19b.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/winsen,mhz19b.yaml (canonical)
   @@ -1,6 +1,6 @@
   serial {
   -  co2-sensor {
   -    compatible = "winsen,mhz19b";
   -    vin-supply = <&vdd>;
   -  };
   +    co2-sensor {
   +        compatible = "winsen,mhz19b";
--
   port@6 {
   reg = <6>;
   +
   endpoint {
   remote-endpoint = <&mdss0_dp2_in>;
   };
>> Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml:30: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml (original)
   +++ Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml (canonical)
   @@ -1,9 +1,9 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   +++ Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml (canonical)
   @@ -1,5 +1,5 @@
   serial {
   -  air-pollution-sensor {
   -    compatible = "sensirion,sps30";
   -  };
   +    air-pollution-sensor {
   +        compatible = "sensirion,sps30";
   +    };
   };
>> Documentation/devicetree/bindings/ptp/ptp-idt82p33.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/ptp/ptp-idt82p33.yaml (original)
   +++ Documentation/devicetree/bindings/ptp/ptp-idt82p33.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   phc@51 {
   compatible = "idt,82p33810";
   reg = <0x51>;
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
>> Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml:48: example 0: label 'ad5696' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml (canonical)
   @@ -1,10 +1,10 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   --- Documentation/devicetree/bindings/sound/realtek,rt1019.yaml (original)
   +++ Documentation/devicetree/bindings/sound/realtek,rt1019.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   rt1019: codec@28 {
   compatible = "realtek,rt1019";
   reg = <0x28>;
>> Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml:72: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml (canonical)
   @@ -3,7 +3,6 @@
   phy@1c18000 {
   compatible = "qcom,msm8998-qmp-pcie-phy";
   reg = <0x01c06000 0x1000>;
   -
   clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
   <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
   <&gcc GCC_PCIE_CLKREF_CLK>,
--
   clocks = <&pmu 32>, <&pmu 36>;
   clock-names = "phy", "pdi";
   resets = <&reset0 12 24>, <&reset0 22 22>;
   reset-names = "phy", "pcie";
   #phy-cells = <1>;
   +    lantiq,rcu = <&rcu0>;
   +    lantiq,rcu-endian-offset = <0x4c>;
   +    lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
   +                                 big-endian;
   };
>> Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml:84: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml (original)
   +++ Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml (canonical)
   @@ -1,20 +1,21 @@
   #include <dt-bindings/clock/marvell,mmp2.h>
--
   port@1 {
   reg = <1>;
   +
   c3_adap_out: endpoint {
   remote-endpoint = <&c3_isp_in>;
   };
>> Documentation/devicetree/bindings/iio/dac/adi,ad9739a.yaml:77: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad9739a.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad9739a.yaml (canonical)
   @@ -5,11 +5,8 @@
   dac@0 {
   compatible = "adi,ad9739a";
   reg = <0>;
   -
   clocks = <&dac_clk>;
   -
   io-backends = <&iio_backend>;
--
   linux,code = <KEY_ENTER>;
   -        press-threshold-microvolt = <500000>;
   +    };
   +
   +    button-up {
   +        label = "Volume Up";
   +        press-threshold-microvolt = <1500000>;
   +        linux,code = <KEY_VOLUMEUP>;
   };
   };
>> Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml (canonical)
   @@ -1,11 +1,12 @@
   #include <dt-bindings/clock/qcom,gcc-sc7280.h>
   #include <dt-bindings/clock/qcom,lpass-sc7280.h>
   +
   clock-controller@3000000 {
   -  compatible = "qcom,sc7280-lpasscc";
   -  reg = <0x03000000 0x40>, <0x03c04000 0x4>;
   -  reg-names = "qdsp6ss", "top_cc";
--
   pinctrl-0 = <&pinctrl_sdhci1>;
   pinctrl-1 = <&pinctrl_sdhci1_uhs>;
   resets = <&sys MA35D1_RESET_SDH1>;
   -        nuvoton,sys = <&sys>;
   vqmmc-supply = <&sdhci1_vqmmc_regulator>;
   bus-width = <8>;
   max-frequency = <200000000>;
   +        nuvoton,sys = <&sys>;
   };
   };
>> Documentation/devicetree/bindings/iio/dac/nxp,lpc1850-dac.yaml:45: example 0: label 'dac' defined but never referenced
>> Documentation/devicetree/bindings/iio/dac/nxp,lpc1850-dac.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/nxp,lpc1850-dac.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/nxp,lpc1850-dac.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/clock/lpc18xx-ccu.h>
   +
   soc {
   #address-cells = <1>;
   #size-cells = <1>;
   +
   dac: dac@400e1000 {
--
>> Documentation/devicetree/bindings/iio/frequency/adi,admv1014.yaml:122: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/frequency/adi,admv1014.yaml (original)
   +++ Documentation/devicetree/bindings/iio/frequency/adi,admv1014.yaml (canonical)
   @@ -1,23 +1,24 @@
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  converter@0 {
   -    compatible = "adi,admv1014";
   -    reg = <0>;
   -    spi-max-frequency = <1000000>;
--
   -  };
   +    #address-cells = <2>;
   +    #size-cells = <2>;
   +
   +    rst: reset-controller@ffef528000 {
   +        compatible = "thead,th1520-reset";
   +        reg = <0xff 0xef528000 0x0 0x1000>;
   +        #reset-cells = <1>;
   +    };
   };
>> Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml (original)
   +++ Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml (canonical)
   @@ -1,9 +1,9 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;

vim +157 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml

2630504894e8de Rakesh Pillai 2022-02-01  154  
2630504894e8de Rakesh Pillai 2022-02-01  155  examples:
2630504894e8de Rakesh Pillai 2022-02-01  156    - |
2630504894e8de Rakesh Pillai 2022-02-01 @157      #include <dt-bindings/interrupt-controller/arm-gic.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
