Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED1B24E4C6
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137566; cv=none; b=QdL/a+Jd9L7o+s6XxuICaKC2STpxcCc05Zh3P7t5YtuNFJT29zOSTjlWWQS+PR22N/B2mlkGeoUPOM4zH4+C5am90iheoP1Uz95eUZVGHElclEcYYS19RgFIdr2tI4VvtYIssNdWjHw6HaneyanXgj1Fj3YYEs1LwsTei9DwDQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137566; c=relaxed/simple;
	bh=JwmV4k0RZRrg9B7G/YZoKLI2t8GMxWo/QgtKlVNPq3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kz4EK1pk2nMY9gp+ylCz6hN4ks5IJVdVR+m/AncHY0VLvaitC0ceXxpXPeD+e/3fv+xQeIKKqtw5ng9VBfn0Bifs7V42xVdRbsJumgjWXBeTO0v+xsvmfFmRfcK2N0D1rI11jxT82ocfkxhMxBmbbQ3KCHP5mhL8StuZtgawDJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ew6yAN01; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ew6yAN01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778137564; x=1809673564;
  h=date:from:to:cc:subject:message-id;
  bh=JwmV4k0RZRrg9B7G/YZoKLI2t8GMxWo/QgtKlVNPq3w=;
  b=Ew6yAN01flByNz6pyF4G46mz3lNuC9NB1vfdAOm/sPSpM3feTRASFyz7
   Zh7vcjFpahC8gRtDUMwZ6wC/zoSzLu9hmkMGIV+1kVT0zmzk1szYecsO7
   quFViMAqnTzfs5xVkAHSB2Z+8tOrQv6UBjGrfUlIWK2NP4mKB8aqcGIf0
   qW7wCFOSs6FW1gjaQyHTfDQcgYHEhZg4J8Xq3NY9iKrc/htQk2kqyVYkq
   qlWhaVWm5/4ws/rwPHiCzyL7IsnypQaLn+8/SJ+4wV6Yiej5XDzeeYd9U
   9waSVPxs8rEbQVUtns+CFAFURDJ53zL4E3I80Ro5h3fYf6mjaHuJ8ygN5
   Q==;
X-CSE-ConnectionGUID: /IYnIKCLTEaMhXf5/98XOQ==
X-CSE-MsgGUID: NRPu74kQRrWuDtQdgARxuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79263294"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79263294"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 00:06:02 -0700
X-CSE-ConnectionGUID: YfHPNISDS+i1qKN2J+h1Lw==
X-CSE-MsgGUID: Hod8OYodSl6RX+YTz2CWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233715011"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 00:05:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKsna-000000006mT-3PNg;
	Thu, 07 May 2026 07:05:30 +0000
Date: Thu, 07 May 2026 09:04:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml:75: example 0:
 label 'pse_pi0' defined but never referenced
Message-ID: <202605070826.3ncq06YE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml:75: example 0: label 'pse_pi0' defined but never referenced"
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
:::::: branch date: 7 days ago
:::::: commit date: 2 weeks ago
config: microblaze-randconfig-2051-20260430 (https://download.01.org/0day-ci/archive/20260507/202605070826.3ncq06YE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070826.3ncq06YE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605070826.3ncq06YE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   compatible = "adi,max98388";
   reg = <0x39>;
   #sound-dai-cells = <0>;
   +        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
   adi,vmon-slot-no = <0>;
   adi,imon-slot-no = <1>;
   adi,interleave-mode;
   -        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
   };
   };
>> Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml:75: example 0: label 'pse_pi0' defined but never referenced
   Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml:75: example 0: label 'pse_pi1' defined but never referenced
   Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml:75: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml (original)
   +++ Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml (canonical)
   @@ -1,53 +1,53 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   --- Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml (original)
   +++ Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml (canonical)
   @@ -4,6 +4,6 @@
   display@14003000 {
   compatible = "mediatek,mt8195-mdp3-stitch";
   reg = <0x14003000 0x1000>;
   +    clocks = <&vppsys0 CLK_VPP0_STITCH>;
   mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x3000 0x1000>;
   -    clocks = <&vppsys0 CLK_VPP0_STITCH>;
   };
>> Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml (canonical)
   @@ -1,14 +1,15 @@
   #include <dt-bindings/clock/qcom,gcc-sm8150.h>
   #include <dt-bindings/clock/qcom,rpmh.h>
   #include <dt-bindings/power/qcom-rpmpd.h>
   +
   clock-controller@ad00000 {
   -  compatible = "qcom,sm8150-camcc";
   -  reg = <0x0ad00000 0x10000>;
--
   jpgenc@1a030000 {
   compatible = "mediatek,mt8195-jpgenc-hw";
   Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml:29: example 0: label 'pruss2_ecap' defined but never referenced
>> Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml:49: example 0: label 'toacodec' defined but never referenced
   Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml:122: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml (original)
   +++ Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml (canonical)
   @@ -4,6 +4,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   camera@48 {
   compatible = "aptina,mt9v111";
--
   -  ethphy4: ethernet-phy@4 {
   -    reg = <4>;
   -  };
   +    ethphy4: ethernet-phy@4 {
   +        reg = <4>;
   +    };
   };
>> Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml:81: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml (original)
   +++ Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml (canonical)
   @@ -1,7 +1,6 @@
   serial {
   bluetooth {
   compatible = "qcom,wcn7850-bt";
   -
   max-speed = <3200000>;
   vddaon-supply = <&vreg_pmu_aon_0p59>;
   vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
--
   -  reg = <0x12010 0x4>, <0x12210 0x4>;
   -  clocks = <&tbg 0>, <&tbg 1>, <&tbg 2>, <&tbg 3>, <&xtalclk>;
   -  clock-names = "TBG-A-P", "TBG-B-P", "TBG-A-S", "TBG-B-S", "xtal";
   -  #clock-cells = <1>;
   +    compatible = "marvell,armada-3700-uart-clock";
   +    reg = <0x12010 0x4>, <0x12210 0x4>;
   +    clocks = <&tbg 0>, <&tbg 1>, <&tbg 2>, <&tbg 3>, <&xtalclk>;
   +    clock-names = "TBG-A-P", "TBG-B-P", "TBG-A-S", "TBG-B-S", "xtal";
   +    #clock-cells = <1>;
   };
>> Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml:202: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml (original)
   +++ Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   -codec@1,0{
   +
   +codec@1,0 {
   compatible = "slim217,250";
   reg = <1 0>;
   reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
--
   reg-io-width = <2>;
   smsc,irq-push-pull;
   smsc,force-internal-phy;
   -
   samsung,srom-page-mode;
   samsung,srom-timing = <9 12 1 9 1 1>;
   };
   Documentation/devicetree/bindings/clock/idt,versaclock5.yaml:155: example 0: node name 'OUT1' must use only [a-z0-9-]
   Documentation/devicetree/bindings/clock/idt,versaclock5.yaml:155: example 0: node name 'OUT4' must use only [a-z0-9-]
   Documentation/devicetree/bindings/clock/idt,versaclock5.yaml:155: example 0: label 'ref25' defined but never referenced
>> Documentation/devicetree/bindings/clock/idt,versaclock5.yaml:155: example 0: label 'vc5' defined but never referenced
   Documentation/devicetree/bindings/clock/idt,versaclock5.yaml:155: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/idt,versaclock5.yaml (original)
   +++ Documentation/devicetree/bindings/clock/idt,versaclock5.yaml (canonical)
   @@ -17,11 +17,9 @@
   compatible = "idt,5p49v5923";
   reg = <0x6a>;
   #clock-cells = <1>;
   -
   /* Connect XIN input to 25MHz reference */
   clocks = <&ref25m>;
--
   +        reg = <1>;
   +        label = "ads1298-1-ecg";
   +        avdd-supply = <&reg_iso_5v_a>;
   +        clocks = <&clk_ads1298>;
   +        interrupt-parent = <&gpio0>;
   +        interrupts = <78 IRQ_TYPE_EDGE_FALLING>;
   +        spi-max-frequency = <20000000>;
   +        spi-cpha;
   };
   };
>> Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml:93: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml (original)
   +++ Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml (canonical)
   @@ -3,9 +3,9 @@
   dma@21300 {
   compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
   reg = <0x21300 4>;
   +    ranges = <0 0x21100 0x200>;
   #address-cells = <1>;
   #size-cells = <1>;
   -    ranges = <0 0x21100 0x200>;
--
   -  };
   +    system-controller@d2003000 {
   +        compatible = "mobileye,eyeq6h-acc-olb", "syscon";
   +        reg = <0x0 0xd2003000 0x0 0x1000>;
   +        #reset-cells = <1>;
   +        #clock-cells = <1>;
   +        clocks = <&xtal>;
   +        clock-names = "ref";
   +    };
   };
>> Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml:150: example 0: label 'sgpio2' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml:150: example 0: label 'sgpio_in2' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml:150: example 0: label 'sgpio_out2' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml:150: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml (canonical)
   @@ -1,29 +1,32 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   sgpio2: gpio@1101059c {
   -  #address-cells = <1>;
--
   compatible = "aspeed,ast2600-udc";
   reg = <0x1e6a2000 0x300>;
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_buck1' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_buck2' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_buck3' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_buck4' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_buck5' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_buck6' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_buck7' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_ldo1' defined but never referenced
>> Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml:103: example 0: label 'car' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_ldo2' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_ldo3' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_ldo4' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: label 'reg_vsnvs' defined but never referenced
   Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml:95: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml (canonical)
   @@ -7,40 +7,12 @@
   reg = <0x08>;
--
   -    mdio {
   -        #address-cells = <1>;
   -        #size-cells = <0>;
   -        compatible = "snps,dwmac-mdio";
   -
   -        phy0: ethernet-phy@0 {
   -            reg = <0>;
   -        };
   -    };
   };
>> Documentation/devicetree/bindings/net/ti,dp83822.yaml:138: example 0: label 'ethphy0' defined but never referenced
   Documentation/devicetree/bindings/net/ti,dp83822.yaml:138: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/ti,dp83822.yaml (original)
   +++ Documentation/devicetree/bindings/net/ti,dp83822.yaml (canonical)
   @@ -1,16 +1,18 @@
   mdio0 {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  ethphy0: ethernet-phy@0 {
   -    reg = <0>;
   -    rx-internal-delay-ps = <1>;
--
   Documentation/devicetree/bindings/iio/light/ams,as73211.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/ams,as73211.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/ams,as73211.yaml (canonical)
   @@ -11,5 +11,6 @@
   pinctrl-0 = <&pinctrl_color_sensor>;
   interrupt-parent = <&gpio2>;
   interrupts = <19 IRQ_TYPE_EDGE_RISING>; /* READY */
   +                     };
   };
   };
>> Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml:50: example 0: label 'clks' defined but never referenced
   Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml (original)
   +++ Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml (canonical)
   @@ -1,5 +1,5 @@
   clock-controller {
   -  compatible = "starfive,jh7110-pll";
   -  clocks = <&osc>;
   -  #clock-cells = <1>;
   +    compatible = "starfive,jh7110-pll";
   +    clocks = <&osc>;
--
   -                regulator-state-standby {
   -                    regulator-on-in-suspend;
   -                };
   -
   -                regulator-state-mem {
   -                    regulator-off-in-suspend;
   +                    regulator-mode = <4>;
   };
   };
   };
>> Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml (original)
   +++ Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml (canonical)
   @@ -1,7 +1,7 @@
   spba-bus@30000000 {
   compatible = "fsl,spba-bus", "simple-bus";
   +    reg = <0x30000000 0x100000>;
   +    ranges;
   #address-cells = <1>;
   #size-cells = <1>;
   -    reg = <0x30000000 0x100000>;
--
>> Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml:44: example 0: label 'eth_phy_mux' defined but never referenced
   Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml:258: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml (original)
   +++ Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml (canonical)
   @@ -1,9 +1,9 @@
   crypto@300000 {
   compatible = "fsl,sec-v4.0";
   +    reg = <0x300000 0x10000>;
   +    ranges = <0 0x300000 0x10000>;
   #address-cells = <1>;
   #size-cells = <1>;
--
   --- Documentation/devicetree/bindings/sound/realtek,rt5514.yaml (original)
   +++ Documentation/devicetree/bindings/sound/realtek,rt5514.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   codec@57 {
   compatible = "realtek,rt5514";
   reg = <0x57>;
>> Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml:113: example 0: label 'imx290' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml:113: example 0: label 'imx290_ep' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml:113: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml (original)
   +++ Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml (canonical)
   @@ -7,19 +7,15 @@
   imx290: camera-sensor@1a {
   compatible = "sony,imx290lqr";
   reg = <0x1a>;
   -
   pinctrl-names = "default";
--
   regulators {
>> Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml (original)
   +++ Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml (canonical)
   @@ -1,9 +1,9 @@
   #include <dt-bindings/gpio/gpio.h>
--
   -  #interrupt-cells = <1>;
   -  interrupt-parent = <&cpu_intc>;
   -  interrupts = <2>, <3>;
   +    compatible = "brcm,bcm7038-l1-intc";
   +    reg = <0x1041a400 0x30>, <0x1041a600 0x30>;
   +    interrupt-controller;
   +    #interrupt-cells = <1>;
   +    interrupt-parent = <&cpu_intc>;
   +    interrupts = <2>, <3>;
   };
>> Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml:44: example 0: label 'modem_etm0_out_funnel_modem' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml:62: example 0: label 'lvds_ep' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml (original)
   +++ Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml (canonical)
   @@ -7,7 +7,6 @@
   bridge@0 {
   compatible = "toshiba,tc358764";
   reg = <0>;
   -
   reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
--
   +        vref-supply = <&vref_reg>;
   +        clocks = <&xtal>;
   +        microchip,device-addr = <0>;
   +    };
   };
   Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml:92: example 0: label 'gmsl0' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml:92: example 0: label 'max96712_out0' defined but never referenced
   Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml:44: example 0: label 'mc' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml:46: example 0: label 'videocc' defined but never referenced
   Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml:110: example 0: label 'CPU0' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml:362: example 0: label 'pinctrl_eth_default' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml:362: example 0: label 'pio' defined but never referenced
   Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml:362: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml (canonical)
   @@ -13,10 +13,15 @@
   #gpio-cells = <2>;
--
   -  port {
   -    panel_in: endpoint {
   -      remote-endpoint = <&lvds_encoder>;
   +    port {
   +        panel_in: endpoint {
   +            remote-endpoint = <&lvds_encoder>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml:113: example 1: label 'usbphy3' defined but never referenced
   Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml:63: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml (original)
   +++ Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml (canonical)
   @@ -3,9 +3,9 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml:66: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml (original)
   +++ Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml (canonical)
   @@ -2,9 +2,9 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   +        mdio-external {
   +            #address-cells = <1>;
   +            #size-cells = <0>;
   +
   +            phy1: phy@b {
   +                reg = <0xb>;
   +            };
   +        };
   };
   };
>> Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml:88: example 0: label 'camera_out' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml:88: example 0: label 'hi846' defined but never referenced
   Documentation/devicetree/bindings/phy/socionext,uniphier-usb3ss-phy.yaml:137: example 0: label 'usb_ssphy0' defined but never referenced
   Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml:105: example 0: label 'cpr_opp1' defined but never referenced
   Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml:105: example 0: label 'cpr_opp2' defined but never referenced
   Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml:105: example 0: label 'cpr_opp3' defined but never referenced
   Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml:105: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml (original)
   +++ Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml (canonical)
   @@ -7,10 +7,12 @@
   opp-level = <1>;
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
>> Documentation/devicetree/bindings/net/aeonsemi,as21xxx.yaml:88: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/aeonsemi,as21xxx.yaml (original)
   +++ Documentation/devicetree/bindings/net/aeonsemi,as21xxx.yaml (canonical)
   @@ -7,7 +7,6 @@
   ethernet-phy@1f {
   compatible = "ethernet-phy-id7500.9410",
   "ethernet-phy-ieee802.3-c45";
   -
   reg = <31>;
   firmware-name = "as21x1x_fw.bin";
--
   @@ -1,5 +1,5 @@
   clksel_gfx_fclk: clock@52c {
   -  compatible = "ti,clksel";
   -  reg = <0x25c 0x4>;
   -  #clock-cells = <2>;
   +    compatible = "ti,clksel";
   +    reg = <0x25c 0x4>;
   +    #clock-cells = <2>;
   };
   Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml:77: example 0: label 'ov9282' defined but never referenced
>> Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml:153: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml (original)
   +++ Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml (canonical)
   @@ -1,60 +1,60 @@
   spi {
   -        #address-cells = <1>;
   -        #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   +    power-domains = <&audiomix_pd>;
   +    mbox-names = "tx", "rx", "rxdb";
   +    mboxes = <&mu2 0 0>,
   +             <&mu2 1 0>,
   +             <&mu2 3 0>;
   +    memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
   +                    <&dsp_vdev0vring1>, <&dsp_reserved>;
   +    resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
   +    reset-names = "runstall";
   };
>> Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/spacemit,k1-syscon.h>
   +
   phy@c0c10000 {
   compatible = "spacemit,k1-pcie-phy";
   reg = <0xc0c10000 0x1000>;
   Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml (original)
--
   interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-names = "macirq";
   mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
   -        clocks = <&emac_0_clk>;
   +            clocks = <&emac_0_clk>;
   clock-names = "stmmaceth";
   phy-mode = "sgmii";
   +        altr,sysmgr-syscon = <&sysmgr 0x60 0>;
   };
   };
>> Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:198: example 1: label 'it6263_lvds_link1_dual' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:198: example 1: label 'it6263_lvds_link2_dual' defined but never referenced
   Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml:198: example 1: label 'it6263_out_dual' defined but never referenced
   Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml:41: example 0: label 'watchdog' defined but never referenced
   Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:85: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml (original)
   +++ Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml (canonical)
   @@ -7,9 +7,9 @@
   geniqup@9c0000 {
   compatible = "qcom,sa8255p-geni-se-qup";
   reg = <0 0x9c0000 0 0x6000>;
--
   master2 {
   -  iommus = <&dart2a 0>, <&dart2b 1>;
   +    iommus = <&dart2a 0>, <&dart2b 1>;
   };
   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml:105: example 0: label 'aoss_qmp' defined but never referenced
>> Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml:105: example 0: label 'cx_cdev' defined but never referenced
   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml:105: example 0: label 'mx_cdev' defined but never referenced
   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml:105: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml (original)
   +++ Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml (canonical)
   @@ -1,18 +1,17 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
   <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
   clock-names = "pclk", "wrap", "phy";
   -
   assigned-clocks = <&clks IMX7D_MIPI_CSI_ROOT_CLK>;
   assigned-clock-rates = <166000000>;
   -
   power-domains = <&pgc_mipi_phy>;
   phy-supply = <&reg_1p0d>;
   resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
>> Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml:190: example 1: label 'imx8mm_mipi_csi_in' defined but never referenced
   Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml:190: example 1: label 'imx8mm_mipi_csi_out' defined but never referenced
   Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml:190: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml (original)
   +++ Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml (canonical)
   @@ -6,16 +6,13 @@
   compatible = "fsl,imx8mm-mipi-csi2";
   reg = <0x32e30000 0x1000>;
   interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
   -
   clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
--
>> Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml:42: example 0: label 'battery' defined but never referenced
   Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml (original)
   +++ Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml (canonical)
   @@ -12,7 +12,6 @@
   compatible = "google,cros-ec-i2c-tunnel";
   #address-cells = <1>;
   #size-cells = <0>;
   -
   google,remote-bus = <0>;
--
   --- Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml (original)
   +++ Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml:96: example 0: label 'uart1_pins' defined but never referenced
>> Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml:68: example 0: label 'hdmi' defined but never referenced
   Documentation/devicetree/bindings/rng/silex-insight,ba431-rng.yaml:31: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/rng/silex-insight,ba431-rng.yaml (original)
   +++ Documentation/devicetree/bindings/rng/silex-insight,ba431-rng.yaml (canonical)
   @@ -1,4 +1,4 @@
   rng@42800000 {
   -  compatible = "silex-insight,ba431-rng";
   -  reg = <0x42800000 0x1000>;
   +    compatible = "silex-insight,ba431-rng";
   +    reg = <0x42800000 0x1000>;
   };
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
>> Documentation/devicetree/bindings/nvmem/imx-iim.yaml:50: example 0: label 'iim' defined but never referenced
   Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml:246: example 0: label 'dss' defined but never referenced
   Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml:246: example 0: label 'oldi_out0' defined but never referenced
   Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml:246: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml (original)
   +++ Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml (canonical)
   @@ -12,20 +12,23 @@
   <0x04a0a000 0x1000>, /* vp1 */
   <0x04a0b000 0x1000>, /* vp2 */
   <0x04a01000 0x1000>; /* common1 */
   -    reg-names = "common", "vidl1", "vid",
--
   -    };
   -
   -    conf-tx {
   -      pins = "PMC_MIO43";
   -      bias-disable;
   -      input-schmitt-disable;
   -    };
   -  };
   };
   Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml:44: example 0: label 'iic0' defined but never referenced
>> Documentation/devicetree/bindings/nvmem/snvs-lpgpr.yaml:34: example 0: label 'snvs_lpgpr' defined but never referenced
   Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:49: example 0: label 'usb3phy' defined but never referenced
>> Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml:59: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml (original)
   +++ Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml (canonical)
   @@ -1,15 +1,15 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
>> Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml (canonical)
   @@ -1,34 +1,32 @@
   i2cmux {
   -  compatible = "i2c-mux-pinctrl";
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -
   -  i2c-parent = <&i2c1>;
   -
--
   -                        <&cpu1intc 7>,
   -                        <&cpu2intc 7>,
   -                        <&cpu3intc 7>;
   +    compatible = "andestech,qilai-plmt", "andestech,plmt0";
   +    reg = <0x100000 0x100000>;
   +    interrupts-extended = <&cpu0intc 7>,
   +                          <&cpu1intc 7>,
   +                          <&cpu2intc 7>,
   +                          <&cpu3intc 7>;
   };
>> Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml:100: example 0: label 'tpda_qdss_0_in_tpdm_dcc' defined but never referenced
   Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top' defined but never referenced
   Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml:100: example 0: label 'tpda_qdss_out_funnel_in0' defined but never referenced
   Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_hdmi_in' defined but never referenced
   Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml:206: example 0: label 'tcon_top_hdmi_in_tcon_tv0' defined but never referenced
   Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml:100: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml (original)
   +++ Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml (canonical)
   @@ -1,27 +1,27 @@
   tpda@6004000 {
   -  compatible = "qcom,coresight-tpda", "arm,primecell";
--
   -    fpga-mgr {
   -      compatible = "intel,stratix10-soc-fpga-mgr";
   +        fpga-mgr {
   +            compatible = "intel,stratix10-soc-fpga-mgr";
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml (original)
   +++ Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml (canonical)
   @@ -6,8 +6,8 @@
--
   +    clock-names = "bi_tcxo",
   +                  "gcc_disp_gpll0_clk",
   +                  "dsi0_phy_pll_out_byteclk",
   +                  "dsi0_phy_pll_out_dsiclk",
   +                  "dp_phy_pll_link_clk",
   +                  "dp_phy_pll_vco_div_clk";
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    #power-domain-cells = <1>;
   };
>> Documentation/devicetree/bindings/thermal/qcom-lmh.yaml:76: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/qcom-lmh.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/qcom-lmh.yaml (canonical)
   @@ -1,13 +1,13 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>

vim +/pse_pi0 +75 Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml

f562202fedadac Kory Maincent (Dent Project  2024-04-17  67) 
f562202fedadac Kory Maincent (Dent Project  2024-04-17  68) required:
f562202fedadac Kory Maincent (Dent Project  2024-04-17  69)   - compatible
f562202fedadac Kory Maincent (Dent Project  2024-04-17  70)   - reg
82566eb4ea5188 Kory Maincent (Dent Project  2025-06-17  71)   - interrupts
f562202fedadac Kory Maincent (Dent Project  2024-04-17  72) 
f562202fedadac Kory Maincent (Dent Project  2024-04-17  73) examples:
f562202fedadac Kory Maincent (Dent Project  2024-04-17  74)   - |
82566eb4ea5188 Kory Maincent (Dent Project  2025-06-17 @75)     #include <dt-bindings/interrupt-controller/irq.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
