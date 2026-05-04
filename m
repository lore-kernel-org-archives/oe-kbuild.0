Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E20618A6CF
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 18:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920345; cv=none; b=qWJtnsrwKR1H9aa4XlMe/LjVK/CuMzeBSXpWx6mMWVCKfwyfyXxo3pYi3RMLJHUdXhDfoV8g2AJH1KQScolhDPXTXZK88r8lPgDIoBgCGbB3ZbosWFg6IgkzEzhugFlqZYnoFQG710li2wC+CReBk0/cICoydr53ppBXErLWGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920345; c=relaxed/simple;
	bh=quEMFmbBP18z+siuMhF6lJkaC12s0WFQpnUwtSwU94s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bF0lwHF+J89wtfK6H37HMQiz9+e3ZAlyJQip8pN0IEn6EiG4w5mbbiOaxcYJvAsUI/1AICf3Rkdp4zdqTQU6Jw6dlh7XZ/pawbbSwl3xE7k2QSwIGVBNbFW/Jx/VZnxce+fhPzkjiVJl8jjJ73+hP4KyxihYd/Q9j5BCxNhCRyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4DhEw93; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4DhEw93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777920344; x=1809456344;
  h=date:from:to:cc:subject:message-id;
  bh=quEMFmbBP18z+siuMhF6lJkaC12s0WFQpnUwtSwU94s=;
  b=m4DhEw93EmANNhviF0ryz4p+H6g4PpPKnkIuU5+HWWGOggWL3SQf/Do/
   b9xS9p0D3YYnuEJ7sIBEDO5gaNslnF01xibmZE7GOO8wzmV8uVwQRv5BT
   1krjRWbDdKCZkBBfMb2hJcyO9PBlZR0TRSvLLNZ4z00ZiDhx6Qtsz1Ab+
   FY7GySJMFLI6USdI+LGzdAfmKajpWP20ybKnCZm9kPkwOYalM50QdwiI+
   IkiMKeGpmzjVZwBGz9+KBCxPjch8N1TIzzHtU6t2+CSlDPbe34G9jsYQp
   Z9XKb4Nl3V1GP/WrHANljz7u8nFmT4OUzXXY1+6WBmBgEK7I1rlTERa90
   A==;
X-CSE-ConnectionGUID: atBoxYcUQN+sYEuIjk6gUg==
X-CSE-MsgGUID: vZI+mRUbSS6eeG0wMjnX/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78489275"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78489275"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 11:45:43 -0700
X-CSE-ConnectionGUID: +jhVbUi7R7ugLTpj5aygfQ==
X-CSE-MsgGUID: TYqnpNgoT+OziG4GiKJXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="232929936"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 May 2026 11:45:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJyIV-000000005uz-26Sq;
	Mon, 04 May 2026 18:45:39 +0000
Date: Mon, 04 May 2026 20:45:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml:48: example 0:
 canonical form differs:
Message-ID: <202605042032.EtjqRuYT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml:48: example 0: canonical form differs:"
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
config: microblaze-randconfig-2051-20260430 (https://download.01.org/0day-ci/archive/20260504/202605042032.EtjqRuYT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042032.EtjqRuYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605042032.EtjqRuYT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/clock/lpc18xx-ccu.h>
   +
   soc {
   #address-cells = <1>;
   #size-cells = <1>;
   +
   adc@400e3000 {
--
   -                <&gpio 127 GPIO_ACTIVE_HIGH>;
   -  };
   +    embedded-controller@58 {
   +        compatible = "dell,wyse-ariel-ec", "ene,kb3930";
   +        reg = <0x58>;
   +        system-power-controller;
   +        off-gpios = <&gpio 126 GPIO_ACTIVE_HIGH>,
   +                    <&gpio 127 GPIO_ACTIVE_HIGH>;
   +    };
   };
>> Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml:84: example 0: label 'irqpin1' defined but never referenced
   Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml:87: example 0: label 'postmask0' defined but never referenced
   Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml:102: example 0: label 'dp0_in_vp2' defined but never referenced
   Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml:102: example 0: label 'dp0_out_con0' defined but never referenced
   Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml:102: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml (original)
   +++ Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml (canonical)
   @@ -6,43 +6,43 @@
   #include <dt-bindings/reset/rockchip,rk3588-cru.h>
--
   remoteproc {
   // ...
   -
   smd-edge {
   interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
   -
   mboxes = <&apcs 8>;
   qcom,smd-edge = <1>;
   };
>> Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml:92: example 0: label 'ov02c10' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml:92: example 0: label 'ov02c10_ep' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml:92: example 0: label 'ov02e10' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml:92: example 0: label 'ov02e10_ep' defined but never referenced
   Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml (original)
   +++ Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml (canonical)
   @@ -7,17 +7,13 @@
   ov02e10: camera@10 {
   compatible = "ovti,ov02e10";
   reg = <0x10>;
--
   -      };
   -      conf-rst {
   -        pins = "EMMC_RSTB";
   -        drive-strength = <4>;
   -        bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
   -      };
   -    };
   -
   -  };
   };
>> Documentation/devicetree/bindings/spi/spi-gpio.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/spi-gpio.yaml (original)
   +++ Documentation/devicetree/bindings/spi/spi-gpio.yaml (canonical)
   @@ -1,13 +1,11 @@
   spi {
   -  compatible = "spi-gpio";
   -  #address-cells = <0x1>;
   -  #size-cells = <0x0>;
   -
   -  sck-gpios = <&gpio 95 0>;
   -  miso-gpios = <&gpio 98 0>;
--
   };
   Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml (original)
   +++ Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/marvell,mmp2.h>
   +
   usb@d4208000 {
   compatible = "marvell,pxau2o-ehci";
   reg = <0xd4208000 0x200>;
>> Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml:67: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml (original)
   +++ Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   mmc@1b010000 {
   compatible = "socionext,milbeaut-m10v-sdhci-3.0";
   reg = <0x1b010000 0x10000>;
   Documentation/devicetree/bindings/soc/cirrus/cirrus,ep9301-syscon.yaml:83: example 0: label 'spi_default_pins' defined but never referenced
   Documentation/devicetree/bindings/soc/cirrus/cirrus,ep9301-syscon.yaml:83: example 0: canonical form differs:
--
   Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml (original)
   +++ Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml (canonical)
   @@ -9,5 +9,5 @@
   reg = <0x60>;
   Vdd-supply = <&vmmc2>;
   power-gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
   -   };
   +    };
   };
>> Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pru0' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pru1' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pruss' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pruss_cfg' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pruss_iepclk_mux' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pruss_intc' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pruss_mdio' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pruss_mem' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: label 'pruss_mii_rt' defined but never referenced
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml:384: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml (original)
--
   Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml:62: example 0: tab character in DTS line:     vref-external = <2500>;	/* 2.5V VRef */
   Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml:62: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml (original)
   +++ Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml (canonical)
   @@ -5,4 +5,5 @@
   interrupts = <6>;
   sampling-frequency = <5000000>;
   vref-external = <2500>;	/* 2.5V VRef */
   +                    };
   };
>> Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.yaml:43: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/partitions/linksys,ns-partitions.yaml (canonical)
   @@ -4,14 +4,14 @@
   #size-cells = <1>;
--
   +++ Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-mod0-clk.yaml (canonical)
   @@ -1,7 +1,7 @@
   clk@8001454 {
   -    #clock-cells = <0>;
   compatible = "allwinner,sun4i-a10-mod0-clk";
   reg = <0x08001454 0x4>;
   +    #clock-cells = <0>;
   clocks = <&osc32k>, <&osc24M>;
   clock-output-names = "r_ir";
   };
>> Documentation/devicetree/bindings/display/sitronix,st7571.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/sitronix,st7571.yaml (original)
   +++ Documentation/devicetree/bindings/display/sitronix,st7571.yaml (canonical)
   @@ -1,51 +1,51 @@
   #include <dt-bindings/gpio/gpio.h>
--
   -  k3_reset: reset-controller {
   -    compatible = "ti,sci-reset";
   -    #reset-cells = <2>;
   -  };
   +    k3_reset: reset-controller {
   +        compatible = "ti,sci-reset";
   +        #reset-cells = <2>;
   +    };
   };
>> Documentation/devicetree/bindings/mtd/denali,nand.yaml:138: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mtd/denali,nand.yaml (original)
   +++ Documentation/devicetree/bindings/mtd/denali,nand.yaml (canonical)
   @@ -1,7 +1,7 @@
   nand-controller@ff900000 {
   compatible = "altr,socfpga-denali-nand";
   +    reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
   reg-names = "nand_data", "denali_reg";
   -    reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
   interrupts = <0 144 4>;
   clock-names = "nand", "nand_x", "ecc";
--
   +        backlight = <&ktd259>;
   +
   +        port {
   +            panel_in: endpoint {
   +                remote-endpoint = <&display_out>;
   +            };
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml:48: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml (canonical)
   @@ -1,18 +1,19 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
   +
   clock-controller@100000 {
   -  compatible = "qcom,qcs8300-gcc";
   -  reg = <0x00100000 0xc7018>;
   -  clocks = <&rpmhcc RPMH_CXO_CLK>,
   -           <&sleep_clk>,
--
   +        <0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
   +        <1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
   +        <2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
   +        <3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
   +        <4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
   +        <5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
   +        <6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
   +        <7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
   +    interrupt-map-mask = <7 0>;
   };
>> Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml:162: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml (original)
   +++ Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml (canonical)
   @@ -5,22 +5,15 @@
   edac@78800000 {
   compatible = "apm,xgene-edac";
   reg = <0x0 0x78800000 0x0 0x100>;
   +        ranges;
   #address-cells = <2>;
   #size-cells = <2>;
   -        ranges;
--
   };
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: node name 'ebi_cs-pins' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: node name 'serial_led-pins' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: node name 'legacy_led-pins' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: node name 'spi_cs-pins' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: node name 'pwm_syn_clk-pins' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: node name 'sys_irq-pins' must use only [a-z0-9-]
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_ebi_cs' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_led' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_legacy_led' defined but never referenced
>> Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_pwm_syn_clk' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_serial_led' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_spi_cs_23' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_sys_irq' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_uart1' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: label 'pinctrl_utopia' defined but never referenced
   Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml:64: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml (original)
   +++ Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml (canonical)
   @@ -1,67 +1,66 @@
   syscon@fffe0080 {
--
   +++ Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.yaml (canonical)
   @@ -1,7 +1,7 @@
   msi-controller@300000 {
   compatible = "marvell,odmi-controller";
   +    reg = <0x300000 0x4000>, <0x304000 0x4000>, <0x308000 0x4000>, <0x30C000 0x4000>;
   msi-controller;
   marvell,odmi-frames = <4>;
   -    reg = <0x300000 0x4000>, <0x304000 0x4000>, <0x308000 0x4000>, <0x30C000 0x4000>;
   marvell,spi-base = <128>, <136>, <144>, <152>;
   };
>> Documentation/devicetree/bindings/pwm/pwm-sifive.yaml:65: example 0: label 'pwm' defined but never referenced
   Documentation/devicetree/bindings/pwm/pwm-sifive.yaml:65: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pwm/pwm-sifive.yaml (original)
   +++ Documentation/devicetree/bindings/pwm/pwm-sifive.yaml (canonical)
   @@ -1,8 +1,8 @@
   -pwm:  pwm@10020000 {
   -  compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
   -  reg = <0x10020000 0x1000>;
   -  clocks = <&tlclk>;
   -  interrupt-parent = <&plic>;
   -  interrupts = <42>, <43>, <44>, <45>;
--
   +        rt4505_flash: led {
   +            function = LED_FUNCTION_FLASH;
   +            color = <LED_COLOR_ID_WHITE>;
   +            led-max-microamp = <375000>;
   +            flash-max-microamp = <1500000>;
   +            flash-max-timeout-us = <800000>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/serial/pl011.yaml:120: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/serial/pl011.yaml (original)
   +++ Documentation/devicetree/bindings/serial/pl011.yaml (canonical)
   @@ -1,9 +1,9 @@
   serial@80120000 {
   -  compatible = "arm,pl011", "arm,primecell";
   -  reg = <0x80120000 0x1000>;
   -  interrupts = <0 11 4>;
   -  dmas = <&dma 13 0 0x2>, <&dma 13 0 0x0>;
   -  dma-names = "rx", "tx";
   -  clocks = <&foo_clk>, <&bar_clk>;
--
   +++ Documentation/devicetree/bindings/net/socionext,synquacer-netsec.yaml (canonical)
   @@ -14,6 +14,7 @@
   mdio {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   phy1: ethernet-phy@1 {
   compatible = "ethernet-phy-ieee802.3-c22";
   reg = <1>;
   Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml:32: example 0: label 'rst' defined but never referenced
>> Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-soc-glue.yaml:75: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-soc-glue.yaml (original)
   +++ Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-soc-glue.yaml (canonical)
   @@ -2,6 +2,11 @@
   compatible = "socionext,uniphier-pro4-soc-glue",
   "simple-mfd", "syscon";
   reg = <0x5f800000 0x2000>;
   +
   +    clock-controller {
   +        compatible = "socionext,uniphier-pro4-sg-clock";
   +        #clock-cells = <1>;
--
   -            };
   -
   -            opp-810000000 {
   -                opp-hz = /bits/ 64 <810000000>;
   -                required-opps = <&rpmhpd_opp_nom>;
   -            };
   -        };
   -    };
   };
   Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml:114: example 0: label 'ufs' defined but never referenced
>> Documentation/devicetree/bindings/regulator/nxp,pf5300.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/nxp,pf5300.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/nxp,pf5300.yaml (canonical)
   @@ -5,7 +5,6 @@
   regulator@28 {
   compatible = "nxp,pf5302", "nxp,pf5300";
   reg = <0x28>;
   -
   regulator-always-on;
   regulator-boot-on;
   regulator-max-microvolt = <1200000>;
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
>> Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml:132: example 0: label 'iic0' defined but never referenced
   Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml:87: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml (original)
   +++ Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml (canonical)
   @@ -2,10 +2,12 @@
   compatible = "mediatek,mt8189-nau8825";
   model = "mt8189_rt9123_8825";
   mediatek,platform = <&afe>;
   +
   dai-link-0 {
   link-name = "I2SOUT1_BE";
--
   };
   Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml (original)
   +++ Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml (canonical)
   @@ -1,4 +1,4 @@
   -dma@10a2000{
   +dma@10a2000 {
   compatible = "qcom,sm8150-dcc", "qcom,dcc";
   reg = <0x010a2000 0x1000>,
   <0x010ad000 0x2000>;
>> Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml:82: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml (original)
   +++ Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml (canonical)
   @@ -1,16 +1,16 @@
   gpio@d4019000 {
   -  compatible = "spacemit,k1-gpio";
   -  reg = <0xd4019000 0x800>;
   -  clocks = <&ccu 9>, <&ccu 61>;
   -  clock-names = "core", "bus";
   -  gpio-controller;
   -  #gpio-cells = <3>;
--
   -  /* Data cells */
   -  thermal_calib: calib@10 {
   -    reg = <0x10 0x2>;
   -  };
   +    /* Data cells */
   +    thermal_calib: calib@10 {
   +        reg = <0x10 0x2>;
   +    };
   };
>> Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml:87: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml (canonical)
   @@ -9,7 +9,6 @@
   video-codec@aa00000 {
   compatible = "qcom,sm8750-iris";
   reg = <0x0aa00000 0xf0000>;
   -
   clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
   <&videocc_mvs0c_clk>,
   <&videocc_mvs0_clk>,
--
>> Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml:105: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml (canonical)
   @@ -1,4 +1,6 @@
   +};
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   pinctrl@f100000 {
   compatible = "qcom,sm8350-tlmm";
   reg = <0x0f100000 0x300000>;
   @@ -8,23 +10,21 @@
--
   uart4: serial@60100 {
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
   };
   };
   @@ -36,6 +36,7 @@
   compatible = "samsung,s5c73m3";
   reg = <0>;
   spi-max-frequency = <50000000>;
   +
   controller-data {
   samsung,spi-feedback-delay = <2>;
   };
>> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml:246: example 0: label 'dss' defined but never referenced
   Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml:246: example 0: label 'oldi_out0' defined but never referenced
   Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml:246: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml (original)
   +++ Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml (canonical)
   @@ -12,20 +12,23 @@
   <0x04a0a000 0x1000>, /* vp1 */
   <0x04a0b000 0x1000>, /* vp2 */
   <0x04a01000 0x1000>; /* common1 */
   -    reg-names = "common", "vidl1", "vid",
   -            "ovr1", "ovr2", "vp1", "vp2", "common1";
--
   -        };
   -
   -        cs-pins {
   -            pins = "gpio8";
   -            function = "gpio";
   -            drive-strength = <2>;
   -            bias-disable;
   -        };
   -    };
   };
>> Documentation/devicetree/bindings/display/renesas,du.yaml:898: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/renesas,du.yaml (original)
   +++ Documentation/devicetree/bindings/display/renesas,du.yaml (canonical)
   @@ -15,7 +15,6 @@
   clock-names = "du.0", "du.1", "du.2", "du.3";
   resets = <&cpg 724>, <&cpg 722>;
   reset-names = "du.0", "du.2";
   -
   renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
   renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
--
   --- Documentation/devicetree/bindings/net/airoha,an7583-mdio.yaml (original)
   +++ Documentation/devicetree/bindings/net/airoha,an7583-mdio.yaml (canonical)
   @@ -5,7 +5,6 @@
   mdio-bus@c8 {
   compatible = "airoha,an7583-mdio";
   reg = <0xc8>;
   -
   clocks = <&scu>;
   resets = <&scu>;
   };
>> Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml:29: example 0: label 'versal_fpga' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml (canonical)
   @@ -1,11 +1,12 @@
   #include <dt-bindings/clock/qcom,gcc-sc7280.h>
   #include <dt-bindings/clock/qcom,lpass-sc7280.h>
   +
   clock-controller@3000000 {
   -  compatible = "qcom,sc7280-lpasscc";
   -  reg = <0x03000000 0x40>, <0x03c04000 0x4>;
--
   reg-names = "dsi_phy",
   "dsi_phy_lane",
   "dsi_pll";
   -
   #clock-cells = <1>;
   #phy-cells = <0>;
   -
   clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
   <&rpmcc RPM_SMD_XO_CLK_SRC>;
   clock-names = "iface", "ref";
>> Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml:34: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml (canonical)
   @@ -2,12 +2,11 @@
   #include <dt-bindings/clock/qcom,qcs615-gcc.h>
--
   +        reg = <0x2b>;
   +        #sound-dai-cells = <0>;
   +        reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
   +        clocks = <&clkc 551>, <&clkc 552>, <&clkc 553>, <&clkc 554>;
   +        clock-names = "wck", "bck", "scl", "mclk";
   +    };
   +};
   Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml:70: example 0: label 'adap' defined but never referenced
   Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml:70: example 0: label 'c3_adap_in' defined but never referenced
   Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml:70: example 0: label 'c3_adap_out' defined but never referenced
>> Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml (original)
   +++ Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml (canonical)
   @@ -25,6 +25,7 @@
--
   };
   };
   +
   port@1 {
   /* Source port */
   reg = <1>;
   +
   csiss_out: endpoint {
   remote-endpoint = <&vproc_in>;
   };
>> Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml:47: example 0: label 'tohdmitx' defined but never referenced
   Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml:81: example 0: label 'pcie0_phy' defined but never referenced
   Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml:81: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml (canonical)
   @@ -1,13 +1,13 @@
   pcie0_phy: phy@106800 {
   compatible = "lantiq,vrx200-pcie-phy";
   reg = <0x106800 0x100>;
   -    lantiq,rcu = <&rcu0>;
   -    lantiq,rcu-endian-offset = <0x4c>;
--
   -            temperature-mode = "thermal-diode";
   -        };
   -
   -        channel@3 { /* RTD3 */
   -            reg = <3>;
   -            sensor-type = "temperature";
   -        };
   };
   };
   Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml:92: example 0: label 'ccorr0' defined but never referenced
>> Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml:67: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml (original)
   +++ Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml (canonical)
   @@ -7,13 +7,10 @@
   system-controller@2a {
   compatible = "cznic,turris-omnia-mcu";
   reg = <0x2a>;
   -
   interrupt-parent = <&gpio1>;
   interrupts = <11 IRQ_TYPE_NONE>;
   -

vim +48 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml

75440ae305b69d Jonathan Cameron 2020-09-09  45  
75440ae305b69d Jonathan Cameron 2020-09-09  46  examples:
75440ae305b69d Jonathan Cameron 2020-09-09  47    - |
75440ae305b69d Jonathan Cameron 2020-09-09 @48      #include <dt-bindings/clock/lpc18xx-ccu.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
