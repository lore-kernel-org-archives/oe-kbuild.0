Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767F388377
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888120; cv=none; b=mCNhud695yCY1PpHjC/BweU5kLt4GnTD5Cc0tdCbV42DRIKWKdsEOVq1/p5I6DKn3yN6yy0W0Z/XVfFNNFuaIMn2g4NdpRXskivFgJNl9+evhTDT3em6XSBuQZiJC2q9chnvCPP9Wx5Mtya+sB7o/471zSpM3LBvYKgTxxGUcgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888120; c=relaxed/simple;
	bh=tYwjYBlqNhdY6v+bf7VwBwAIZrckaP0CQCSmGWL2fjY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j2IlB6LWnf2Ujb0ZcKEYvnjye+3HKOVsIswG+rBI03/TFkvWBCyGGJIF+5S45hlYNGU4H3zsjdLAu4eTIbfVkEtTbUl0CmVsc7Xke+rw2m/Zm8UlAQLKicDo9yUM7OOQyJb6ufaxS/IG1kvAhMSbOLgBPmr2f7jIg5PgDyT8Wi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqpPkHCC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqpPkHCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777888115; x=1809424115;
  h=date:from:to:cc:subject:message-id;
  bh=tYwjYBlqNhdY6v+bf7VwBwAIZrckaP0CQCSmGWL2fjY=;
  b=aqpPkHCCq/p8xVVjCTdx6vk0WRDf6scldScm+d1U/JldsS7jS5NuZeIU
   4RdMXbydoUP+deDXjxFnKfnorw5VATrxaPDLa4oSpR0hG2PjXcO8RP4nW
   OIr6N6AOTVNHJ6J8twnNwPkjYiIHn0o3LvTnNV0Zh1N1wzRhvCexxzmlJ
   Y6n3MhYijX0pt3V92sWVoN5rTW6MLA5co0VWu9M2Z9i/BwSODN/qCI1Ij
   SAazZ6AR1fxzx2aspNumV0LYuyQ72/ZAagDvovFXufCqNQiTvuXSKHeQA
   BotoReEU1iOzkYMl/ypJTV13i5cucRna6sdi/MjhQ1VuuyW2BJomTDAjA
   A==;
X-CSE-ConnectionGUID: r5LcYC0KRPmIiR26K56Gpw==
X-CSE-MsgGUID: VCEqQXHkReiATg7BQbqlNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78674740"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78674740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 02:48:34 -0700
X-CSE-ConnectionGUID: u3VA9P0JRtCMT9BGJ4oDPA==
X-CSE-MsgGUID: uxqkTqVtT3WXQNwE0r3JXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="273597531"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 May 2026 02:48:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJpug-000000005o1-3KW7;
	Mon, 04 May 2026 09:48:30 +0000
Date: Mon, 04 May 2026 11:48:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml:74: example
 0: label 'mpu_crit' defined but never referenced
Message-ID: <202605041127.jQmj7k95-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml:74: example 0: label 'mpu_crit' defined but never referenced"
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
config: mips-randconfig-2052-20260430 (https://download.01.org/0day-ci/archive/20260504/202605041127.jQmj7k95-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041127.jQmj7k95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605041127.jQmj7k95-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/spi/realtek,rtl-spi.yaml:36: example 0: label 'spi' defined but never referenced
   Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml (original)
   +++ Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi@9c002d80 {
   compatible = "sunplus,sp7021-spi";
   reg = <0x9c002d80 0x80>, <0x9c002e00 0x80>;
>> Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml:74: example 0: label 'mpu_crit' defined but never referenced
>> Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml:74: example 0: label 'mpu_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml:74: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/soc/ti,sci_pm_domain.h>
   +
   wkup_vtm0: thermal-sensor@42040000 {
   compatible = "ti,j721e-vtm";
   reg = <0x42040000 0x350>,
   @@ -10,14 +11,14 @@
--
   Documentation/devicetree/bindings/iio/temperature/microchip,mcp9600.yaml:106: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/temperature/microchip,mcp9600.yaml (original)
   +++ Documentation/devicetree/bindings/iio/temperature/microchip,mcp9600.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml:70: example 0: label 'wdma0' defined but never referenced
>> Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml:52: example 0: label 'vepu' defined but never referenced
   Documentation/devicetree/bindings/iio/temperature/maxim,max31855k.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/temperature/maxim,max31855k.yaml (original)
   +++ Documentation/devicetree/bindings/iio/temperature/maxim,max31855k.yaml (canonical)
   @@ -7,6 +7,7 @@
   reg = <0>;
   spi-max-frequency = <4300000>;
   };
   +
   temp-sensor@1 {
   compatible = "maxim,max6675";
--
   +++ Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml (canonical)
   @@ -1,5 +1,5 @@
   pdc_reset: reset-controller@b2e0000 {
   -  compatible = "qcom,sdm845-pdc-global";
   -  reg = <0xb2e0000 0x20000>;
   -  #reset-cells = <1>;
   +    compatible = "qcom,sdm845-pdc-global";
   +    reg = <0xb2e0000 0x20000>;
   +    #reset-cells = <1>;
   };
>> Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml:56: example 0: label 'cru' defined but never referenced
>> Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml (original)
   +++ Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml (canonical)
   @@ -1,7 +1,7 @@
   cru: clock-controller@ff490000 {
   -  compatible = "rockchip,rv1126-cru";
   -  reg = <0xff490000 0x1000>;
   -  rockchip,grf = <&grf>;
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
   +    compatible = "rockchip,rv1126-cru";
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
>> Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml:69: example 0: label 'csi' defined but never referenced
   Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml:87: example 0: label 'catu_in_port' defined but never referenced
   Documentation/devicetree/bindings/iio/pressure/aosong,adp810.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/pressure/aosong,adp810.yaml (original)
   +++ Documentation/devicetree/bindings/iio/pressure/aosong,adp810.yaml (canonical)
   @@ -1,6 +1,7 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   pressure-sensor@25 {
--
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
>> Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml:104: example 0: label 'csi1' defined but never referenced
>> Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml:104: example 0: label 'csi1_ep' defined but never referenced
>> Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml:104: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml (original)
   +++ Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml (canonical)
   @@ -20,18 +20,19 @@
--
>> Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml:69: example 0: label 'csi_from_csi_mux' defined but never referenced
>> Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml (original)
   +++ Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml (canonical)
   @@ -3,15 +3,15 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
   compatible = "samsung,s5k6a3";
   reg = <0x10>;
   -
   clocks = <&camera 1>;
   assigned-clocks = <&camera 1>;
   assigned-clock-rates = <24000000>;
   -
   clock-names = "extclk";
   gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
   afvdd-supply = <&ldo19_reg>;
>> Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml (original)
   +++ Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml (canonical)
   @@ -1,6 +1,6 @@
   clock-controller@ff100000 {
   -  compatible = "rockchip,rk3562-cru";
   -  reg = <0xff100000 0x40000>;
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
   +    compatible = "rockchip,rk3562-cru";
   +    reg = <0xff100000 0x40000>;
--
   +            #power-domain-cells = <0>;
   +        };
   };
   -
   -    power-domain@MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY {
   -      reg = <MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
   -      #power-domain-cells = <0>;
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml:58: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml (canonical)
   @@ -1,9 +1,9 @@
   #include <dt-bindings/clock/qcom,rpmh.h>
--
   Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml:52: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml (original)
   +++ Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   sata@18000 {
   compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
   reg = <0x18000 0x1000>;
>> Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.yaml:35: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.yaml (original)
   +++ Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.yaml (canonical)
   @@ -1,6 +1,6 @@
   mailbox@7e00b880 {
   -  compatible = "brcm,bcm2835-mbox";
   -  reg = <0x7e00b880 0x40>;
   -  interrupts = <0 1>;
   -  #mbox-cells = <0>;
   +    compatible = "brcm,bcm2835-mbox";
   +    reg = <0x7e00b880 0x40>;
--
   pcie@0 {
   reg = <0x0 0x0 0x0 0x0 0x0>;
   +            ranges;
   #address-cells = <3>;
   #size-cells = <2>;
   -            ranges;
   -
   device_type = "pci";
   phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
>> };Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml:286: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml (original)
   +++ Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml (canonical)
   @@ -2,47 +2,53 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   --- Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml (original)
   +++ Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml (canonical)
   @@ -11,6 +11,7 @@
   pwms = <&hwmon 0 50000>;
   tach-ch = /bits/ 8 <0x00>;
   };
   +
   fan-1 {
   pwms = <&hwmon 1 50000>;
   tach-ch = /bits/ 8 <0x01>;
>> Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml:66: example 0: label 'msgbox' defined but never referenced
   Documentation/devicetree/bindings/interconnect/qcom,qdu1000-rpmh.yaml:57: example 0: label 'clk_virt' defined but never referenced
   Documentation/devicetree/bindings/interconnect/qcom,qdu1000-rpmh.yaml:57: example 0: label 'system_noc' defined but never referenced
   Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml:54: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml (original)
   +++ Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml (canonical)
   @@ -1,12 +1,13 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/clock/stm32mp1-clks.h>
   #include <dt-bindings/reset/stm32mp1-resets.h>
   +
--
   -  codec@48 {
   -      compatible = "cirrus,cs4270";
   -      reg = <0x48>;
   -  };
   +    codec@48 {
   +        compatible = "cirrus,cs4270";
   +        reg = <0x48>;
   +    };
   };
>> Documentation/devicetree/bindings/phy/fsl,imx8-pcie-phy.yaml:85: example 0: label 'pcie_phy' defined but never referenced
>> Documentation/devicetree/bindings/phy/fsl,imx8-pcie-phy.yaml:85: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/fsl,imx8-pcie-phy.yaml (original)
   +++ Documentation/devicetree/bindings/phy/fsl,imx8-pcie-phy.yaml (canonical)
   @@ -3,15 +3,15 @@
   #include <dt-bindings/reset/imx8mq-reset.h>
--
   +
   +            /* Port 5, unconnected */
   +            port@5 {
   +                reg = <5>;
   +            };
   };
   -      }; /* End of link@1 */
   };
   -  };
   };
>> Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml:71: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml (original)
   +++ Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml (canonical)
   @@ -1,19 +1,21 @@
   #include <dt-bindings/clock/thead,th1520-clk-ap.h>
   +
   soc {
   -  #address-cells = <2>;
   -  #size-cells = <2>;
   -  mailbox@ffffc38000 {
   -    compatible = "thead,th1520-mbox";
--
   +    compatible = "qcom,sc7280-lpassaoncc";
   +    reg = <0x3380000 0x30000>;
   +    clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>,
   +             <&lpasscore LPASS_CORE_CC_CORE_CLK>;
   +    clock-names = "bi_tcxo", "bi_tcxo_ao","iface";
   +    #clock-cells = <1>;
   +    #power-domain-cells = <1>;
   +    qcom,adsp-pil-mode;
   };
   Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml:44: example 0: label 'lcd_in' defined but never referenced
>> Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml:67: example 0: label 'gce' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml:57: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml (canonical)
   @@ -1,18 +1,19 @@
   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
   #include <dt-bindings/clock/qcom,rpmh.h>
   #include <dt-bindings/power/qcom,rpmhpd.h>
   +
   clock-controller@ade0000 {
   -  compatible = "qcom,x1e80100-camcc";
--
   +    compatible = "qcom,sdm845-videocc";
   +    reg = <0x0ab00000 0x10000>;
   +    clocks = <&rpmhcc RPMH_CXO_CLK>;
   +    clock-names = "bi_tcxo";
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    #power-domain-cells = <1>;
   +    power-domains = <&rpmhpd RPMHPD_MMCX>;
   +    required-opps = <&rpmhpd_opp_low_svs>;
   };
>> Documentation/devicetree/bindings/clock/intel,agilex.yaml:40: example 0: label 'clkmgr' defined but never referenced
>> Documentation/devicetree/bindings/clock/intel,agilex.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/intel,agilex.yaml (original)
   +++ Documentation/devicetree/bindings/clock/intel,agilex.yaml (canonical)
   @@ -1,6 +1,6 @@
   clkmgr: clock-controller@ffd10000 {
   -  compatible = "intel,agilex-clkmgr";
   -  reg = <0xffd10000 0x1000>;
   -  clocks = <&osc1>;
   -  #clock-cells = <1>;
   +    compatible = "intel,agilex-clkmgr";
   +    reg = <0xffd10000 0x1000>;
--
   -
   -      charger@75 {
   -        reg = <0x75>;
   -      };
   +        charger@75 {
   +            reg = <0x75>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml:65: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml (canonical)
   @@ -1,21 +1,22 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   mdio {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   main_gpio_intr: interrupt-controller0 {
   compatible = "ti,sci-intr";
   -    ti,intr-trigger-type = <1>;
   interrupt-controller;
   interrupt-parent = <&gic500>;
   #interrupt-cells = <1>;
   +    ti,intr-trigger-type = <1>;
   ti,sci = <&dmsc>;
   ti,sci-dev-id = <131>;
   ti,interrupt-ranges = <0 360 32>;
>> Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml:94: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml (canonical)
   @@ -1,114 +1,134 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
>> Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml:42: example 0: label 'cros_ec' defined but never referenced
>> Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml:42: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml (original)
   +++ Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml (canonical)
   @@ -1,25 +1,24 @@
   spi {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   -
   -                rohm,initial-voltage-microvolt = <3000000>;
   regulator-ov-error-microvolt = <18000>;
   regulator-uv-error-microvolt = <18000>;
   regulator-temp-protection-kelvin = <1>;
   regulator-temp-warn-kelvin = <1>;
   +                rohm,initial-voltage-microvolt = <3000000>;
   };
   };
   };
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'serial_led-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'serial_led_clk-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'serial_led_data-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'hsspi_cs4-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'hsspi_cs5-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'hsspi_cs6-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'hsspi_cs7-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'adsl_spi-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'adsl_spi_miso-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'adsl_spi_mosi-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'vreq_clk-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'pcie_clkreq_b-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'robosw_led_clk-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'robosw_led_data-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'gpio35_alt-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'vdsl_phy_override_0-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'vdsl_phy_override_1-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'vdsl_phy_override_2-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'vdsl_phy_override_3-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'dsl_gpio8-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: node name 'dsl_gpio9-pins' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_adsl_spi' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_adsl_spi_miso' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_adsl_spi_mosi' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_dectpd' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_dsl_gpio8' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_dsl_gpio9' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_gpio35_alt' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_hsspi_cs4' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_hsspi_cs5' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_hsspi_cs6' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_hsspi_cs7' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_nand' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_pcie_clkreq_b' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_robosw_led_clk' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_robosw_led_data' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_serial_led' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_serial_led_clk' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_serial_led_data' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_vdsl_phy_override_0' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_vdsl_phy_override_1' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_vdsl_phy_override_2' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_vdsl_phy_override_3' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: label 'pinctrl_vreq_clk' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml (canonical)
   @@ -1,113 +1,113 @@
   pinctrl@10 {
   -  compatible = "brcm,bcm63268-pinctrl";
   -  reg = <0x10 0x4>, <0x18 0x8>, <0x38 0x4>;
   +    compatible = "brcm,bcm63268-pinctrl";
   +    reg = <0x10 0x4>, <0x18 0x8>, <0x38 0x4>;
--
   +    compatible = "fsl,fman-memac";
   +    reg = <0xe8000 0x1000>;
   +    cell-index = <4>;
   +    ptp-timer = <&ptp_timer0>;
   +    pcs-handle = <&pcsphy4>, <&qsgmiib_pcs1>;
   +    pcs-handle-names = "sgmii", "qsgmii";
   +    phys = <&serdes1 1>;
   +    phy-names = "serdes";
   +    fsl,fman-ports = <&fman0_rx_0x0c &fman0_tx_0x2c>;
   };
>> Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml (canonical)
   @@ -3,17 +3,17 @@
   #include <dt-bindings/interrupt-controller/irq.h>
--
>> Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml:94: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml (canonical)
   @@ -1,6 +1,7 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/clock/imx6ul-clock.h>
   #include <dt-bindings/gpio/gpio.h>
   +
   touchscreen@2040000 {
   compatible = "fsl,imx6ul-tsc";
   reg = <0x02040000 0x4000>, <0x0219c000 0x4000>;
--
   +    reg = <0x2010000 0x1000>;
   cache-block-size = <64>;
   cache-level = <2>;
   cache-sets = <1024>;
   cache-size = <2097152>;
   cache-unified;
   -    reg = <0x2010000 0x1000>;
   interrupt-parent = <&plic0>;
   interrupts = <1>,
   <2>,
>> Documentation/devicetree/bindings/input/touchscreen/rohm,bu21013.yaml:75: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/rohm,bu21013.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/rohm,bu21013.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -7,13 +8,11 @@
--
   rtc@51 {
   compatible = "nxp,pcf8563";
>> Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml:108: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml (original)
   +++ Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml (original)
--
   ethernet-ports {
   #address-cells = <1>;
>> Documentation/devicetree/bindings/leds/ams,as3645a.yaml:102: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/leds/ams,as3645a.yaml (original)
   +++ Documentation/devicetree/bindings/leds/ams,as3645a.yaml (canonical)
   @@ -1,22 +1,22 @@
   #include <dt-bindings/leds/common.h>
--
   ethernet-ports {
   #address-cells = <1>;
>> Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml:70: example 0: label 'camera0_0' defined but never referenced
>> Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml:70: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml (original)
   +++ Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml (canonical)
   @@ -3,22 +3,23 @@
   #include <dt-bindings/power/marvell,mmp2.h>
--
   remote-endpoint = <&display_out>;
   };
   };
   };
   -    display@1{
   +
   +    display@1 {
   compatible = "adafruit,yx240qv29", "ilitek,ili9341";
   reg = <1>;
   spi-max-frequency = <10000000>;
>> Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml:138: example 0: label 'i2s0' defined but never referenced
>> Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml:138: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml (original)
   +++ Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml (canonical)
   @@ -1,7 +1,7 @@
   i2s0: i2s@1c22400 {
   -    #sound-dai-cells = <0>;
   compatible = "allwinner,sun4i-a10-i2s";
   reg = <0x01c22400 0x400>;
   +    #sound-dai-cells = <0>;
   interrupts = <0 16 4>;
   clocks = <&apb0_gates 3>, <&i2s0_clk>;
--
   bus-range = <0x00 0xff>;
   device_type = "pci";
   -        ranges = <0x01000000 0 0x00000000 0 0xfe000000 0 0x00400000>,
   -                 <0x02000000 0 0x30000000 0 0x30000000 0 0x10000000>;
   dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
   #interrupt-cells = <1>;
   interrupt-map-mask = <0 0 0 7>;
   Documentation/devicetree/bindings/net/nxp,tja11xx.yaml:103: example 0: label 'tja1101_phy0' defined but never referenced
   Documentation/devicetree/bindings/net/nxp,tja11xx.yaml:114: example 1: label 'tja1102_phy0' defined but never referenced
   Documentation/devicetree/bindings/net/nxp,tja11xx.yaml:114: example 1: label 'tja1102_phy1' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,vsp1.yaml:120: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/media/renesas,vsp1.yaml (original)
   +++ Documentation/devicetree/bindings/media/renesas,vsp1.yaml (canonical)
   @@ -9,6 +9,5 @@
   clocks = <&cpg CPG_MOD 624>;
   power-domains = <&sysc R8A7795_PD_A3VP>;
   resets = <&cpg 624>;
   -
   renesas,fcp = <&fcpvb1>;
   };
   Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml:35: example 0: canonical form differs:
--
   opp-1100000000 {
   opp-hz = /bits/ 64 <1100000000>;
   opp-microvolt = <1000000 980000 1010000>;
   opp-microamp = <80000>;
   clock-latency-ns = <310000>;
   };
   +
   opp-1200000000 {
   opp-hz = /bits/ 64 <1200000000>;
   opp-microvolt = <1025000>;Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG3' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG4' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG5' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG6' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG7' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG8' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG9' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG10' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG11' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG12' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml (canonical)
   @@ -1,97 +1,96 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   led@0 {
   reg = <0x0>;
>> Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml:194: example 0: label 'csiphy_ep0' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml:194: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml (canonical)
   @@ -8,7 +8,6 @@
--
>> Documentation/devicetree/bindings/media/rockchip,vdec.yaml:143: example 0: label 'vdec' defined but never referenced
   Documentation/devicetree/bindings/dma/ti/k3-udma.yaml:154: example 0: node name 'cbass_main' must use only [a-z0-9-]
   Documentation/devicetree/bindings/dma/ti/k3-udma.yaml:154: example 0: label 'cbass_main_navss' defined but never referenced
   Documentation/devicetree/bindings/dma/ti/k3-udma.yaml:154: example 0: label 'main_udmap' defined but never referenced
   Documentation/devicetree/bindings/dma/ti/k3-udma.yaml:154: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/dma/ti/k3-udma.yaml (original)
   +++ Documentation/devicetree/bindings/dma/ti/k3-udma.yaml (canonical)
   @@ -4,12 +4,11 @@
--
>> Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml:136: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml (canonical)
   @@ -1,21 +1,21 @@
   pinctrl@51600080 {
   -  compatible = "eswin,eic7700-pinctrl";
   -  reg = <0x51600080 0x1fff80>;
   -  vrgmii-supply = <&vcc_1v8>;
   +    compatible = "eswin,eic7700-pinctrl";
   +    reg = <0x51600080 0x1fff80>;
   +    vrgmii-supply = <&vcc_1v8>;
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
>> Documentation/devicetree/bindings/phy/motorola,mapphone-mdm6600.yaml:65: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/motorola,mapphone-mdm6600.yaml (original)
   +++ Documentation/devicetree/bindings/phy/motorola,mapphone-mdm6600.yaml (canonical)
   @@ -5,13 +5,13 @@
   enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
   power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
   reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
   +    #phy-cells = <0>;
   motorola,mode-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>,
   <&gpio5 21 GPIO_ACTIVE_HIGH>;
   motorola,cmd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>,
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
>> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:569: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml (canonical)
   @@ -2,27 +2,26 @@
--
   pcie_intc_0: interrupt-controller {
>> Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml:182: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml (canonical)
   @@ -11,7 +11,6 @@
--
   +    power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
   +    clocks = <&mmsys CLK_MM_MDP_WDMA0>;
   +    iommus = <&iommu>;
   +    mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
   +    mediatek,gce-events = <CMDQ_EVENT_MDP_WDMA0_SOF>,
   +                          <CMDQ_EVENT_MDP_WDMA0_EOF>;
   };
   Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml:87: example 0: label 'dsi0_out' defined but never referenced
   Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml:87: example 0: label 'dsi1_out' defined but never referenced
   Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml:33: example 0: label 'xlnx_vcu' defined but never referenced
>> Documentation/devicetree/bindings/usb/microchip,usb5744.yaml:79: example 0: label 'i2c' defined but never referenced
>> Documentation/devicetree/bindings/usb/microchip,usb5744.yaml:79: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/microchip,usb5744.yaml (original)
   +++ Documentation/devicetree/bindings/usb/microchip,usb5744.yaml (canonical)
   @@ -1,7 +1,9 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c: i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   hub: usb-hub@2d {
--
   -
   -      anx6345_out: port@1 {
   -        reg = <1>;
   -        anx6345_out_panel: endpoint {
   -          remote-endpoint = <&panel_in_edp>;
   -        };
   -      };
   };
   -  };
   };
>> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml:39: example 0: label 'typec1_dr_sw' defined but never referenced
>> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml:39: example 0: label 'usb_con' defined but never referenced
>> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml (original)
   +++ Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   #include <dt-bindings/usb/pd.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -25,10 +26,11 @@
--
   -               compatible = "calxeda,hb-combophy";
   -               #phy-cells = <1>;
   -               reg = <0xfff5d000 0x1000>;
   -               phydev = <31>;
   -           };
   +    compatible = "calxeda,hb-combophy";
   +    reg = <0xfff5d000 0x1000>;
   +    #phy-cells = <1>;
   +    phydev = <31>;
   +};
>> Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml:38: example 0: label 'q6sstopcc' defined but never referenced
>> Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml (canonical)
   @@ -1,6 +1,6 @@
   q6sstopcc: clock-controller@7500000 {
   -  compatible = "qcom,qcs404-q6sstopcc";
   -  reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
   -  clocks = <&gcc 141>;
   -  #clock-cells = <1>;
   +    compatible = "qcom,qcs404-q6sstopcc";
   +    reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
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
>> Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml:425: example 0: label 'l1' defined but never referenced
>> Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml:425: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml (canonical)
   @@ -1,14 +1,14 @@
   regulators {
   -  compatible = "qcom,pm8941-regulators";
   -  vdd_l1_l3-supply = <&s1>;
   +    compatible = "qcom,pm8941-regulators";
   +    vdd_l1_l3-supply = <&s1>;
--
   reset-controller@0 {
   compatible = "socionext,uniphier-ld20-usb3-reset";
>> Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml:77: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml:93: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml (original)
--
   port@1 {
   reg = <1>;
   +
   tfp410_out: endpoint {
   remote-endpoint = <&dvi_connector_in>;
   };
>> Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml:44: example 0: label 'udc' defined but never referenced
>> Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml:44: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml (original)
   +++ Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/aspeed-clock.h>
   +
   udc: usb@1e6a2000 {
   compatible = "aspeed,ast2600-udc";
   reg = <0x1e6a2000 0x300>;
   Documentation/devicetree/bindings/power/supply/microchip,ucs1002.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/supply/microchip,ucs1002.yaml (original)
--
   sensor@0 {
>> Documentation/devicetree/bindings/regulator/maxim,max20086.yaml:76: example 0: node name 'OUT1' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/maxim,max20086.yaml:76: example 0: node name 'OUT2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/maxim,max20086.yaml:76: example 0: node name 'OUT3' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/maxim,max20086.yaml:76: example 0: node name 'OUT4' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/maxim,max20086.yaml:76: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/maxim,max20086.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/maxim,max20086.yaml (canonical)
   @@ -7,22 +7,23 @@
   regulator@28 {
   compatible = "maxim,max20087";
   reg = <0x28>;
   -
   in-supply = <&reg_12v0>;
   vdd-supply = <&reg_3v3>;
   -
--
>> Documentation/devicetree/bindings/regulator/max8660.yaml:37: example 0: node name 'regulator-V3' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/max8660.yaml:37: example 0: node name 'regulator-V4' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/max8660.yaml:37: example 0: node name 'regulator-V5' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/max8660.yaml:37: example 0: node name 'regulator-V6' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/max8660.yaml:37: example 0: node name 'regulator-V7' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/max8660.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/max8660.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/max8660.yaml (canonical)
   @@ -1,36 +1,36 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
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
   reg = <0>;Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'crmu_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost0_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost1_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost2_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost3_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'nitro_thermal' defined but never referenced
>> Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml (canonical)
   @@ -1,81 +1,92 @@
   tmon: thermal-sensor@0 {
   compatible = "brcm,sr-thermal";
   reg = <0x0 0x40>;
   +    #thermal-sensor-cells = <1>;
   brcm,tmon-mask = <0x3f>;
   -    #thermal-sensor-cells = <1>;
   };
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
   reg = <0xc8010000 0x1000>;Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml:69: example 0: label 'wcd9390_usbss_codec' defined but never referenced
>> Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml:69: example 0: label 'wcd9390_usbss_sbu' defined but never referenced
>> Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml (original)
   +++ Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml (canonical)
   @@ -5,9 +5,7 @@
   typec-mux@42 {
   compatible = "qcom,wcd9390-usbss";
   reg = <0x42>;
   -
   vdd-supply = <&vreg_bob>;
   -
   mode-switch;
--
   port@1 {
   reg = <1>;
   +
   pvi_to_hdmi_tx: endpoint {
   remote-endpoint = <&hdmi_tx_from_pvi>;
   };
>> Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml:242: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml (canonical)
   @@ -6,7 +6,7 @@
   compatible = "nvidia,tegra124-soctherm";
   reg = <0x700e2000 0x600>, /* SOC_THERM reg_base */
   <0x60006000 0x400>; /* CAR reg_base */
   -    reg-names = "soctherm-reg", "car-reg";
   +          reg-names = "soctherm-reg", "car-reg";
   interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
   <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
--
   +            #cooling-cells = <2>;
   nvidia,priority = <80>;
   nvidia,cpu-throt-level = <TEGRA_SOCTHERM_THROT_LEVEL_MED>;
   -
   -            #cooling-cells = <2>;
   };
   -
   /*
   * If these two devices are triggered in same time, the HW throttle
   * arbiter will select the highest priority as the final throttle
>> Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml:360: example 2: label 'cpu_shutdown_trip' defined but never referenced
   Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml:360: example 2: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml (canonical)
   @@ -2,8 +2,14 @@
   cpu-thermal {
   polling-delay-passive = <1000>;
   polling-delay = <1000>;
   +        thermal-sensors = <&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
--
   -
   -    lsw {
   +        lsw {
   regulator-name = "rtmv20,lsw";
   regulator-min-microamp = <0>;
   regulator-max-microamp = <6000000>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml (canonical)
   @@ -1,9 +1,10 @@
   #include <dt-bindings/clock/stm32mp1-clks.h>
   +
   vrefbuf@50025000 {
   -  compatible = "st,stm32-vrefbuf";
   -  reg = <0x50025000 0x8>;
   -  regulator-min-microvolt = <1500000>;
   -  regulator-max-microvolt = <2500000>;
--
   wifi {
   compatible = "qcom,wcnss-wlan";
   -
   interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
   <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
   interrupt-names = "tx", "rx";
   -
   qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
   qcom,smem-state-names = "tx-enable", "tx-rings-empty";
   };
>> Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:182: example 0: label 'camss' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:182: example 0: label 'csiphy_ep0' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:182: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml (canonical)
   @@ -11,7 +11,6 @@
--
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vrf18_ldo_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vrfck_1_ldo_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vrfck_ldo_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vs1_buck_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vs2_buck_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vsim1_ldo_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vsim2_ldo_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vsram_md_ldo_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vsram_others_ldo_reg' defined but never referenced
   Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml:105: example 0: label 'mt6359_vsram_others_sshub_ldo' defined but never referenced
>> Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml:59: example 0: label 'dma2d' defined but never referenced
>> Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml:59: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml (original)
   +++ Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/clock/stm32fx-clock.h>
   #include <dt-bindings/mfd/stm32f4-rcc.h>
   +
   dma2d: dma2d@4002b000 {
   compatible = "st,stm32-dma2d";
   reg = <0x4002b000 0xc00>;
   Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml:105: example 0: canonical form differs:
--
>> Documentation/devicetree/bindings/regulator/maxim,max77826.yaml:51: example 0: node name 'LDO2' must use only [a-z0-9-]
>> Documentation/devicetree/bindings/regulator/maxim,max77826.yaml:51: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/maxim,max77826.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/maxim,max77826.yaml (canonical)
   @@ -12,5 +12,5 @@
   regulator-max-microvolt = <3587500>;
   };
   };
   -   };
   - };
   +    };
   +};
--
   @@ -10,6 +10,7 @@
   spi-cpol;
   #io-channel-cells = <1>;
   };
   +
   adc@1 {
   compatible = "microchip,mcp3002";
   reg = <1>;
   Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml:60: example 0: label 'c3_isp_in' defined but never referenced
   Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml:60: example 0: label 'isp' defined but never referenced
>> Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml (original)
   +++ Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml (canonical)
   @@ -1,11 +1,12 @@
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   -  regulator@45 {
   -    compatible = "raspberrypi,touchscreen-panel-regulator-v2";
   -    reg = <0x45>;
   -    gpio-controller;
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
>> Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml:72: example 0: label 'dsi0_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml:72: example 0: label 'dsi1_out' defined but never referenced
>> Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml:72: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml (original)
   +++ Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml (canonical)
   @@ -7,22 +7,18 @@
   compatible = "qcom,msm8998-mdss";
   reg = <0x0c900000 0x1000>;
   reg-names = "mdss";
   -
   +    ranges;
   clocks = <&mmcc MDSS_AHB_CLK>,
   <&mmcc MDSS_AXI_CLK>,
--
   +++ Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml (canonical)
   @@ -7,7 +7,7 @@
   interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH>;
   clocks = <&clks 1>, <&clks 2>;
   clock-names = "ipg", "per";
   -    fsl,stop-mode = <&gpr 0x34 28>;
   termination-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
   termination-ohms = <120>;
   +    fsl,stop-mode = <&gpr 0x34 28>;
   };
>> Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml:181: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml (original)
   +++ Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml (canonical)
   @@ -8,24 +8,18 @@
   <0x700d8000 0x1000>,
   <0x700d9000 0x1000>;
   reg-names = "base", "fpci", "ipfs";
   -
   interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
   -
   clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
--
   +    resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
   +             <&gcc GCC_PCIE_0_PIPE_ARES>;
   +    reset-names = "phy", "pipe";
   +    vdda-vp-supply = <&vreg_l3_1p05>;
   +    vdda-vph-supply = <&vreg_l5_1p8>;
   +    clock-output-names = "pcie_0_pipe_clk";
   +    #clock-cells = <0>;
   +    #phy-cells = <0>;
   };
   Documentation/devicetree/bindings/nvmem/rmem.yaml:41: example 0: label 'blconfig' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml:245: example 0: label 'camss' defined but never referenced
   Documentation/devicetree/bindings/display/renesas,du.yaml:898: example 0: canonical form differs:
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
>> Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml:245: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml (canonical)
   @@ -3,158 +3,149 @@
   #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
--
   +    #power-domain-cells = <1>;
   };Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml (original)
   +++ Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/clock/stm32mp1-clks.h>
   +
   syscfg: syscon@50020000 {
   compatible = "st,stm32mp157-syscfg", "syscon";
   reg = <0x50020000 0x400>;
>> Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml:92: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml (canonical)
   @@ -1,4 +1,6 @@
   +};
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -17,13 +19,13 @@
--
   };Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml:37: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml (original)
   +++ Documentation/devicetree/bindings/iio/health/ti,afe4404.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
>> Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml:47: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml (original)
   +++ Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml (canonical)
   @@ -5,8 +5,8 @@
   heart-rate@57 {
   compatible = "maxim,max30100";
   reg = <0x57>;
   -        maxim,led-current-microamp = <24000 50000>;
   interrupt-parent = <&gpio1>;
   interrupts = <16 2>;
   +        maxim,led-current-microamp = <24000 50000>;
--
   +
   +        fan-1 {
   +            pwms = <&pwm 2 44444 0>;
   +        };
   };
   -
   -    fan-1 {
   -      pwms = <&pwm 2 44444 0>;
   -    };
   -  };
>> };Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml:178: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml (canonical)
   @@ -11,7 +11,6 @@
--
   pins = "gpio19";
   function = "blsp_i2c_sda_a2";
   };
   -
   -        scl-pins {
   -            pins = "gpio20";
   -            function = "blsp_i2c_scl_a2";
   -        };
   };
   };
>> Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: tab character in DTS line:             <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
>> Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: tab character in DTS line:             <0x240 0x4A8 0x000 0x0 0x0	0x140>;
>> Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: label 'iomuxc' defined but never referenced
>> Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml:79: example 0: label 'pinctrl_uart2' defined but never referenced
   Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml:99: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml (original)
   +++ Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml (canonical)
   @@ -10,10 +10,10 @@
   phy-names = "usb-phy";
   vbus-supply = <&reg_usb0_vbus>;
   itc-setting = <0x4>; /* 4 micro-frames */
   -     /* Incremental burst of unspecified length */
   -    ahb-burst-config = <0x0>;
   +                  ahb-burst-config = <0x0>;
--
>> Documentation/devicetree/bindings/usb/ingenic,musb.yaml:61: example 0: label 'udc' defined but never referenced
>> Documentation/devicetree/bindings/usb/ingenic,musb.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/ingenic,musb.yaml (original)
   +++ Documentation/devicetree/bindings/usb/ingenic,musb.yaml (canonical)
   @@ -1,19 +1,17 @@
   #include <dt-bindings/clock/ingenic,jz4740-cgu.h>
   +
   usb_phy: usb-phy {
   -  compatible = "usb-nop-xceiv";
   -  #phy-cells = <0>;
   +    compatible = "usb-nop-xceiv";
   +    #phy-cells = <0>;
--
   Documentation/devicetree/bindings/media/cnm,wave521c.yaml:55: example 0: label 'vpu' defined but never referenced
>> Documentation/devicetree/bindings/iio/imu/invensense,icm45600.yaml:72: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/invensense,icm45600.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/invensense,icm45600.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml:73: example 0: label 'deu0' defined but never referenced
--
   usb@0 {
   compatible = "cdns,usb3";
>> Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml:78: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml (original)
   +++ Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml (canonical)
   @@ -2,17 +2,17 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   +                 <GIC_SPI 757 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 756 IRQ_TYPE_LEVEL_HIGH>,
   +                 <GIC_SPI 755 IRQ_TYPE_LEVEL_HIGH>;
   +    interrupt-names = "all", "smi", "hse", "pme", "xhc";
   +    clocks = <&cpg CPG_MOD 0xaf>;
   +    power-domains = <&cpg>;
   +    resets = <&cpg 0xaa>;
   +    phys = <&usb3_phy>, <&usb3_phy>;
   +    phy-names = "usb2-phy", "usb3-phy";
   };
>> Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml:53: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml (original)
   +++ Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/gpio/gpio.h>
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/usb/ti,tusb1046.yaml:32: example 0: canonical form differs:
--
   +    clocks = <&bpmp TEGRA186_CLK_NVENC>;
   +    clock-names = "nvenc";
   +    resets = <&bpmp TEGRA186_RESET_NVENC>;
   +    reset-names = "nvenc";
   +    power-domains = <&bpmp TEGRA186_POWER_DOMAIN_MPE>;
   +    interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVENCSRD &emc>,
   +                    <&mc TEGRA186_MEMORY_CLIENT_NVENCSWR &emc>;
   +    interconnect-names = "dma-mem", "write";
   +    iommus = <&smmu TEGRA186_SID_NVENC>;
   };
>> Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml:65: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml (canonical)
   @@ -1,5 +1,6 @@
   // Example for I2C
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml:104: example 0: label 'sensor1_crit' defined but never referenced
--
>> Documentation/devicetree/bindings/media/arm,mali-c55.yaml:69: example 0: label 'isp_in' defined but never referenced
>> Documentation/devicetree/bindings/media/arm,mali-c55.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/arm,mali-c55.yaml (original)
   +++ Documentation/devicetree/bindings/media/arm,mali-c55.yaml (canonical)
   @@ -1,17 +1,17 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
--
   -                     <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
   +                  iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
   +                  <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
   +                  <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
   +                  <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA1>,
   +                  <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET1>,
   +                  <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
   interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
   clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGDEC>;
   clock-names = "jpgdec";
>> Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml:50: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -6,7 +7,6 @@
   fxos8700@1e {
--
   reg = <2>;
   adi,mode = <CH_MODE_DAC_AND_ADC>;
   adi,off-state = <CH_OFFSTATE_PULLDOWN>;
   };
   +
   channel@6 {
   reg = <6>;
   adi,mode = <CH_MODE_GPIO>;
   Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml:48: example 0: label 'spi0' defined but never referenced
   Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml:112: example 0: label 'de' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml:96: example 0: label 'venus' defined but never referenced
>> Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml:96: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml (original)
   +++ Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml (canonical)
   @@ -7,7 +7,6 @@
   compatible = "qcom,sc7280-venus";
   reg = <0x0aa00000 0xd0600>;
   interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
   -
   clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
   <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
   <&videocc VIDEO_CC_VENUS_AHB_CLK>,
--
   Documentation/devicetree/bindings/timer/cdns,ttc.yaml:66: example 1: label 'pwm' defined but never referenced
   Documentation/devicetree/bindings/clock/pwm-clock.yaml:38: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/pwm-clock.yaml (original)
   +++ Documentation/devicetree/bindings/clock/pwm-clock.yaml (canonical)
   @@ -4,4 +4,5 @@
   clock-frequency = <25000000>;
   clock-output-names = "mipi_mclk";
   pwms = <&pwm2 0 40>; /* 1 / 40 ns = 25 MHz */
   +           };
   };
>> Documentation/devicetree/bindings/power/rockchip-io-domain.yaml:403: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/power/rockchip-io-domain.yaml (original)
   +++ Documentation/devicetree/bindings/power/rockchip-io-domain.yaml (canonical)
   @@ -1,12 +1,12 @@
   io-domains {
   -  compatible = "rockchip,rk3288-io-voltage-domain";
   -  audio-supply = <&vcc18_codec>;
   -  bb-supply = <&vcc33_io>;
   -  dvp-supply = <&vcc_18>;
   -  flash0-supply = <&vcc18_flashio>;
   -  gpio1830-supply = <&vcc33_io>;
--
   +++ Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-cpu-clk.yaml (canonical)
   @@ -1,7 +1,7 @@
   cpu@1c20054 {
   -    #clock-cells = <0>;
   compatible = "allwinner,sun4i-a10-cpu-clk";
   reg = <0x01c20054 0x4>;
   +    #clock-cells = <0>;
   clocks = <&osc32k>, <&osc24M>, <&pll1>, <&dummy>;
   clock-output-names = "cpu";
   };
>> Documentation/devicetree/bindings/media/renesas,imr.yaml:56: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/renesas,imr.yaml (original)
   +++ Documentation/devicetree/bindings/media/renesas,imr.yaml (canonical)
   @@ -3,10 +3,10 @@
   #include <dt-bindings/power/r8a7795-sysc.h>
--
   };
   };
   Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml (original)
   +++ Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml (canonical)
   @@ -1,4 +1,3 @@
   -
   system-management@40460000 {
   compatible = "nuvoton,ma35d1-reset", "syscon";
   reg = <0x40460000 0x200>;
>> Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml:60: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml (original)
   +++ Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml (canonical)
   @@ -1,7 +1,7 @@
   clock-controller@300000 {
   -  compatible = "qcom,gcc-msm8916";
   -  #clock-cells = <1>;
   -  #reset-cells = <1>;
   -  #power-domain-cells = <1>;
   -  reg = <0x300000 0x90000>;
   +    compatible = "qcom,gcc-msm8916";
--
   +++ Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml (canonical)
   @@ -1,5 +1,5 @@
   mailbox@7e00b840 {
   -  compatible = "brcm,bcm2835-vchiq";
   -  reg = <0x7e00b840 0xf>;
   -  interrupts = <0 2>;
   +    compatible = "brcm,bcm2835-vchiq";
   +    reg = <0x7e00b840 0xf>;
   +    interrupts = <0 2>;
   };
>> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml:172: example 0: label 'csiss_in' defined but never referenced
>> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml:172: example 0: label 'csiss_out' defined but never referenced
>> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml:172: example 0: label 'xcsi2rxss_1' defined but never referenced
>> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml:172: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml (original)
   +++ Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml (canonical)
   @@ -1,17 +1,18 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   xcsi2rxss_1: csi2rx@a0020000 {
   compatible = "xlnx,mipi-csi2-rx-subsystem-5.0";
   reg = <0xa0020000 0x10000>;
   interrupt-parent = <&gic>;
   interrupts = <0 95 4>;
--
   -    fan-0 {
   -      #cooling-cells = <2>;
   -      cooling-levels = <0 64 89 128 166 204 221 238>;
   +        fan-0 {
   +            #cooling-cells = <2>;
   +            cooling-levels = <0 64 89 128 166 204 221 238>;
   +        };
   };
   -  };
   };
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1' defined but never referenced
   Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml:90: example 0: label 'dsc0' defined but never referenced
   Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml:117: example 0: label 'ltc2688' defined but never referenced
   Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml:117: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ltc2688.yaml (canonical)
   @@ -1,17 +1,16 @@
   -
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
--
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1csi41' defined but never referenced
   Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml:93: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml (original)
   +++ Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml (canonical)
   @@ -8,6 +8,7 @@
   resets = <&cpg R9A07G044_USB_PRESETN>;
   power-domains = <&cpg>;
   #reset-cells = <1>;
   +
   regulator-vbus {
   regulator-name = "vbus";
   };
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin08' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin09' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin10' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin11' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin12' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin13' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin14' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: label 'isp1vin15' defined but never referenced
>> Documentation/devicetree/bindings/media/renesas,isp.yaml:156: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/media/renesas,isp.yaml (original)
   +++ Documentation/devicetree/bindings/media/renesas,isp.yaml (canonical)
   @@ -3,89 +3,96 @@
   #include <dt-bindings/power/r8a779a0-sysc.h>
--
   --- Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml (original)
   +++ Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml (canonical)
   @@ -1,5 +1,5 @@
   syscon@20002000 {
   -  compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
   -  reg = <0x20002000 0x1000>;
   -  #reset-cells = <1>;
   +    compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
   +    reg = <0x20002000 0x1000>;
   +    #reset-cells = <1>;
>> };Documentation/devicetree/bindings/clock/ingenic,cgu.yaml:109: example 0: label 'otg_phy' defined but never referenced
   Documentation/devicetree/bindings/clock/ingenic,cgu.yaml:109: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/ingenic,cgu.yaml (original)
   +++ Documentation/devicetree/bindings/clock/ingenic,cgu.yaml (canonical)
   @@ -1,24 +1,20 @@
   #include <dt-bindings/clock/ingenic,jz4770-cgu.h>
   +
   cgu: clock-controller@10000000 {
   -  compatible = "ingenic,jz4770-cgu", "simple-mfd";
   -  reg = <0x10000000 0x100>;
   -  #address-cells = <1>;
--
   +        link-name = "I2S3";
   +        dai-format = "i2s";
   +        mediatek,clk-provider = "cpu";
   +
   +        codec {
   +            sound-dai = <&it6505dptx>, <&rt1019p>;
   +        };
   };
   };
   Documentation/devicetree/bindings/display/renesas,cmm.yaml:57: example 0: label 'cmm0' defined but never referenced
>> Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml:61: example 0: label 'sensor_crit' defined but never referenced
>> Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml:61: example 0: label 'target' defined but never referenced
>> Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml:61: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml (canonical)
   @@ -23,6 +23,7 @@
   hysteresis = <1000>;
   type = "critical";
   };
   +
   target: trip-point {
   temperature = <100000>;
   hysteresis = <1000>;

vim +/mpu_crit +74 Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml

031c2952d1588d Keerthy 2022-05-17  71  
031c2952d1588d Keerthy 2022-05-17  72  examples:
031c2952d1588d Keerthy 2022-05-17  73    - |
031c2952d1588d Keerthy 2022-05-17 @74      #include <dt-bindings/soc/ti,sci_pm_domain.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
