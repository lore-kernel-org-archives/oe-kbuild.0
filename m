Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C340DFCE
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 03:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777863812; cv=none; b=KObMN9EQKOYeFPNkfmSfJYeG+GQxHoZJ29U/FiX5zeTYSh6lufuIb1lglshF4Q7Dr2TynHzMpT/WssfnV5Lufh1BuLLsdxERB9Zbr8qEaG2AhnnDrMKDsA0LayHEbjWCm2XR4sulKLpv/UqJlFZ6s/gSIGJCkex2RVXSGwUaJZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777863812; c=relaxed/simple;
	bh=vnp+yaQ9tBtJvSz3a08OE2WVD3U2mu/67BklEaAKftE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dcNtrjt1+Tw3onpwDOBQ+6z4F59y7KJSzqYI2cLjEZsYzcQeEijdfclJQOyRvfyO04ICZdpwfOv49gj1pBG9SkOlVC2vOhCbSrQSjE90POUTDHzIxk9ZDUoGx+uwiTbbUt0OBB8uqf4r8+e2nYQiS3cXa83S/sdMkU3zSqxdYlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlIIvWZq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlIIvWZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777863809; x=1809399809;
  h=date:from:to:cc:subject:message-id;
  bh=vnp+yaQ9tBtJvSz3a08OE2WVD3U2mu/67BklEaAKftE=;
  b=PlIIvWZqW65cBPqaqgBVukyUm+Zm6og7x05QIw2/g3CjqPp4S5nGXRl6
   C+ph/zVfEniz1YQmwxcFnemugU/wPG4WdR+d/IgjypAWjtWq3oQq7sfKX
   aO/62DubfAFsSM0xo7j9O6f6jxZ1TViktNHUrEGiETJijhYmm9bkfGHqw
   uuouNzPcHfdyD9SP7yWO7kSYhkyKhgk6YiW8t82WxrcCN9WrYHaO2XCOm
   /6ZxrccMrCt5Z/Io9nyqKXi+DC5ANARgbuL6711SVSridp2QR4ZDHY//a
   ROrg363cXx5XEDGkaJGVbtpFBCGpgO7LRcBjgTkP3I7kVKgYEixmUzRsL
   A==;
X-CSE-ConnectionGUID: nWCcf+PNTxGEXG89AcAIig==
X-CSE-MsgGUID: fo7ArRtwSK+JMbuSythuug==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89412597"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="89412597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 20:03:28 -0700
X-CSE-ConnectionGUID: 3UcmUOizTNi+E9Q2Ys+vhg==
X-CSE-MsgGUID: npGZ4LJMSkyjnehcgAF/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="235275919"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2026 20:03:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJjaf-000000005gv-1Rcj;
	Mon, 04 May 2026 03:03:25 +0000
Date: Mon, 04 May 2026 05:03:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml:73:
 example 0: canonical form differs:
Message-ID: <202605040516.9RX5U15h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml:73: example 0: canonical form differs:"
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
config: microblaze-randconfig-2052-20260430 (https://download.01.org/0day-ci/archive/20260504/202605040516.9RX5U15h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040516.9RX5U15h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040516.9RX5U15h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml:73: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml (original)
   +++ Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml (canonical)
   @@ -1,5 +1,6 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   @@ -20,5 +21,6 @@
--
   Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml:268: example 0: label 'mcu_r5f0' defined but never referenced
>> Documentation/devicetree/bindings/iio/light/bh1750.yaml:39: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/light/bh1750.yaml (original)
   +++ Documentation/devicetree/bindings/iio/light/bh1750.yaml (canonical)
   @@ -1,11 +1,12 @@
   #include <dt-bindings/gpio/gpio.h>
   +
   i2c {
   -  #address-cells = <1>;
   -  #size-cells = <0>;
   +    #address-cells = <1>;
   +    #size-cells = <0>;
--
   +
   ldo5: LDO5 {
   regulator-name = "ldo5";
   regulator-min-microvolt = <800000>;
   regulator-max-microvolt = <3300000>;
   };
   +
   ldo6: LDO6 {
   regulator-name = "ldo6";
   regulator-min-microvolt = <900000>;
>> Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml:174: example 0: label 'cpsw_port1' defined but never referenced
   Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml:174: example 0: label 'cpsw_port2' defined but never referenced
   Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml:174: example 0: label 'davinci_mdio_sw' defined but never referenced
   Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml:174: example 0: label 'mac_sw' defined but never referenced
   Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml:174: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml (original)
   +++ Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml (canonical)
   @@ -11,58 +11,57 @@
   #address-cells = <1>;
   #size-cells = <1>;
   syscon = <&scm_conf>;
--
   -                       "250m", "270m";
   +    compatible = "mediatek,mt7621-sysc", "syscon";
   +    reg = <0x0 0x100>;
   +    #clock-cells = <1>;
   +    #reset-cells = <1>;
   +    clock-output-names = "xtal", "cpu", "bus",
   +                         "50m", "125m", "150m",
   +                         "250m", "270m";
   +    ralink,memctl = <&memc>;
   };
>> Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml:45: example 0: label 'ak4619_endpoint' defined but never referenced
   Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml:45: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml (original)
   +++ Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml (canonical)
   @@ -1,18 +1,18 @@
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   +
   codec@10 {
   compatible = "asahi-kasei,ak4619";
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
>> Documentation/devicetree/bindings/phy/phy-common-props.yaml:148: example 0: label 'phy' defined but never referenced
   Documentation/devicetree/bindings/phy/phy-common-props.yaml:148: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/phy/phy-common-props.yaml (original)
   +++ Documentation/devicetree/bindings/phy/phy-common-props.yaml (canonical)
   @@ -1,10 +1,10 @@
   #include <dt-bindings/phy/phy.h>
--
   -
   -      port@1 {
   -        reg = <1>;
   -        bridge_in: endpoint {
   -          remote-endpoint = <&dp_out>;
   -        };
   -      };
   };
   -  };
   };
>> Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml:104: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   pinctrl@f100000 {
   compatible = "qcom,sm8450-tlmm";
   reg = <0x0f100000 0x300000>;
   Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml:49: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml (original)
--
   +++ Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml (canonical)
   @@ -5,7 +5,7 @@
   power-monitor@40 {
   compatible = "lltc,ltc4286";
   reg = <0x40>;
   +        shunt-resistor-micro-ohms = <300>;
   adi,vrange-low-enable;
   -        shunt-resistor-micro-ohms = <300>;
   };
   };
>> Documentation/devicetree/bindings/rtc/ti,bq32000.yaml:40: example 0: label 'bq32000' defined but never referenced
   Documentation/devicetree/bindings/iio/dac/adi,ad5421.yaml:40: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/dac/adi,ad5421.yaml (original)
   +++ Documentation/devicetree/bindings/iio/dac/adi,ad5421.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   spi {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml:67: example 0: label 'gce' defined but never referenced

vim +73 Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml

5be478f9c24fbd Rob Herring       2020-10-02  70  
7e000fbff7a0a4 Jonathan Albrieux 2020-05-28  71  examples:
7e000fbff7a0a4 Jonathan Albrieux 2020-05-28  72    - |
7e000fbff7a0a4 Jonathan Albrieux 2020-05-28 @73      #include <dt-bindings/interrupt-controller/irq.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
