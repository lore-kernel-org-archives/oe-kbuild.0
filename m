Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232773DC4CE
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900899; cv=none; b=R9LbEQvU44S9p2Qqht9Qo6OdZdJQt6ISUa8TV6D5lrjvSpuhU8UEvB4b9LKs8uyD7FX2x8yW9iqv6pcYcXtc9hSheUtKZhwjOUFivA35hX1jJmXDuxO9SPmgILtuq+G5HQXoz/yc+Pgov66EYKqxcW7Ag5UwH1J+MkP4BwGIqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900899; c=relaxed/simple;
	bh=PKEUPtX+2+xKjnuQSy0p8d65BbxzC8VYkJpQQmK0dSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dv3r2togcWS+nzMrJIGo3jrVUb7JG1BnS+qe1+RER2nZpcoBYWVP7fVCdVf/lGGKAG4zn4TP+X6n3cwZ5fF5RKMfLVPjrJ1FxL0BmnHVAEUspXue99Vf7O4POf8opsy2gT9b3baQX1enYWCkfP+rC5pj9sLUAMQ20K9L1Gx1ejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MU3psiGT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MU3psiGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777900897; x=1809436897;
  h=date:from:to:cc:subject:message-id;
  bh=PKEUPtX+2+xKjnuQSy0p8d65BbxzC8VYkJpQQmK0dSQ=;
  b=MU3psiGTYZdMD9Ls9Hi9YSp5l29NKLWFwvqaYKUElCt6KTnxvjEJlPvA
   B7pDP4k1MKYKdAxn+nZD+0zzWoRBZdIm50Muvd5NBm8MvLXka8PDhJ0uI
   NrChxGDOTUGbPPJQ8kRw9RuikYUJKpbJ2tczCA/Sc/5vG5ziFAKDlXBeK
   ElmcvebwQa/39B2xV6KS5T/oQyro3otOKlvC0Bz2w9YTFmQ3dhvvOSMV2
   LJA8y9upaJG6y1kwGxianirxsOAFKyyNDcFeTxzCXeGtyknP2QURSVvmd
   Dp6zYLgy2QrxwpTqlB/+W39Ey05t/4RboeTAVlm4ICsOtoEqwaw8ohvb7
   w==;
X-CSE-ConnectionGUID: tJqoHhc2TtW1UE+lm5wV6A==
X-CSE-MsgGUID: dAf7dqSESX6lJKmvEe74Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82604641"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="82604641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 06:21:36 -0700
X-CSE-ConnectionGUID: u1OOMHRnRa+knCdLwztzqA==
X-CSE-MsgGUID: tCBKy6vjS0aknsw7j8DMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="230925252"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 May 2026 06:21:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJtEr-000000005q1-2tg6;
	Mon, 04 May 2026 13:21:33 +0000
Date: Mon, 04 May 2026 15:21:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71:
 example 0: node name 'REG1' must use only [a-z0-9-]
Message-ID: <202605041502.v68RabmY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG1' must use only [a-z0-9-]"
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
config: mips-randconfig-2052-20260430 (https://download.01.org/0day-ci/archive/20260504/202605041502.v68RabmY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041502.v68RabmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605041502.v68RabmY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   hdmi-phy@3a0 {
   -  compatible = "amlogic,meson8b-hdmi-tx-phy", "amlogic,meson8-hdmi-tx-phy";
   -  reg = <0x3a0 0xc>;
   -  clocks = <&tmds_clock>;
   -  #phy-cells = <0>;
   +    compatible = "amlogic,meson8b-hdmi-tx-phy", "amlogic,meson8-hdmi-tx-phy";
   +    reg = <0x3a0 0xc>;
   +    clocks = <&tmds_clock>;
   +    #phy-cells = <0>;
   };
>> Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG1' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG2' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG3' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG4' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG5' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG6' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG7' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG8' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG9' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG10' must use only [a-z0-9-]
   Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml:71: example 0: node name 'REG11' must use only [a-z0-9-]
--
   otp-1 {
   compatible = "factory-otp";
>> Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml:69: example 0: label 'wcd9390_usbss_codec' defined but never referenced
   Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml:69: example 0: label 'wcd9390_usbss_sbu' defined but never referenced
   Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml:69: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml (original)
   +++ Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml (canonical)
   @@ -5,9 +5,7 @@
   typec-mux@42 {
   compatible = "qcom,wcd9390-usbss";
   reg = <0x42>;
   -
   vdd-supply = <&vreg_bob>;
--
   -      reg-names = "pmif", "spmimst";
   -      interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>;
   -      interrupt-names = "rcs";
   -      interrupt-controller;
   -      #interrupt-cells = <3>;
   -      clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
   -      clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
   -    };
   -  };
   };
>> Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml:113: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml (original)
   +++ Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/irq.h>
   +
   i2c {
   #address-cells = <1>;
   #size-cells = <0>;
   Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml:51: example 0: label 'lpass_audiocc' defined but never referenced
   Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml:51: example 0: canonical form differs:
--
   +        reg = <0x50>;
   +        enable-gpios = <&gpio26 1 GPIO_ACTIVE_HIGH>;
   +        regulator-name = "richtek,rt5739-buck";
   +        regulator-min-microvolt = <300000>;
   +        regulator-max-microvolt = <1300000>;
   +        regulator-allowed-modes = <0 1>;
   +        regulator-boot-on;
   +        richtek,vsel-active-high;
   +    };
   };
>> Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'crmu_thermal' defined but never referenced
   Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost0_thermal' defined but never referenced
   Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost1_thermal' defined but never referenced
   Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost2_thermal' defined but never referenced
   Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'ihost3_thermal' defined but never referenced
   Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: label 'nitro_thermal' defined but never referenced
   Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml:41: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml (original)
   +++ Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml (canonical)
   @@ -1,81 +1,92 @@
   tmon: thermal-sensor@0 {

vim +/REG1 +71 Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml

413ec72963fc29 Paul Cercueil 2022-12-14  63  
413ec72963fc29 Paul Cercueil 2022-12-14  64  required:
413ec72963fc29 Paul Cercueil 2022-12-14  65    - reg
413ec72963fc29 Paul Cercueil 2022-12-14  66    - compatible
413ec72963fc29 Paul Cercueil 2022-12-14  67    - regulators
413ec72963fc29 Paul Cercueil 2022-12-14  68  
413ec72963fc29 Paul Cercueil 2022-12-14  69  examples:
413ec72963fc29 Paul Cercueil 2022-12-14  70    - |
413ec72963fc29 Paul Cercueil 2022-12-14 @71      i2c {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
