Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4814367F3A
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 22:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007073; cv=none; b=bWmC0dGzEFvMkTeRD4QE9VYVUiaO14cWnb4SuqgGmxjsmFczo3nEnh5kd2pPb78uzwR7XOwjml1eZAkeD13O7UIYkz3bbhxo8akPlIqixauqBf1Tsolpjnc2rTYfkAajvtHXz8o+Lryt6EN8T6AE4kos8QfHchq34bchCDwh/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007073; c=relaxed/simple;
	bh=6lA+C0n88NV96DxiZboH0Z1MhszyguW0m0Nf/KrQgac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ewZkua4k7klEINZmrp5/Um3vPvKu/Y+CuoxmUCoAwlQUF4slpaJv+TxIsH5ieKIZA1LWemQ9rBGmiBtH5e7SqwWb1tOxDkqoQHXmgLCuRIgSKANYdGzC9pXYS0MpEMkOUEZLxhNaEgMQ4uS7Fj925aB6BJ9Hw3OT1gDRbz+sQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZIbVnI2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZIbVnI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780007071; x=1811543071;
  h=date:from:to:cc:subject:message-id;
  bh=6lA+C0n88NV96DxiZboH0Z1MhszyguW0m0Nf/KrQgac=;
  b=BZIbVnI2bkBSrXhX8BO9zWhO6MuWaZXl98J7UIr7b8TArBuGIpKo+wGI
   GeHpTbLsMbqw8loIeCgqq430eI0VgnEA32Qy0XOeCdMLMCoQFJZaiL6uu
   +5ZYBRXAwPTxyxC/9rDRfOqnqQ6Uq91XCE95TqPeu8HYXNPSGVyrO0otg
   PtrxPm1r4gtwVzkE7nejs3Ycq0aYfdCpkaY93jvOWmlBvRQDRoIDm11Fk
   cBPHK+3kDycvnQpYsMjFptcN5BHmrzM4AJ1Rv40VIT9Jg6w2JPPqdZyTx
   r7FqHrHwOa3GwUDMpMjSUDZNBzZtiHWXk3twk429JX3J9h46RY6cuFtL9
   g==;
X-CSE-ConnectionGUID: yzkDwIj8TVmQs2becm6Tfg==
X-CSE-MsgGUID: GFKo2YvjS+G2vVPGXLndeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98273699"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="98273699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 15:24:29 -0700
X-CSE-ConnectionGUID: wsolwfUORJSLFspv2/mJJw==
X-CSE-MsgGUID: 8tPkgaKLSIqZ76GJElk4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242522179"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2026 15:24:28 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSj9O-000000000kB-02Lm;
	Thu, 28 May 2026 22:24:26 +0000
Date: Fri, 29 May 2026 00:24:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/glymur-crd.dtb: pmic@1
 (qcom,pmh0101): gpio@8800: 'qcom,rpmh' is a required property
Message-ID: <202605290048.0PmO45KN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fenglin-Wu/soc-qcom-rpmh-Allow-non-child-devices-to-issue-write-commands/20260527-172755
head:   bf01e9995b270846c5eecf23e3f38522e09e8216
commit: e27f406a52ececea4b96830d7539c50a1354db68 dt-bindings: pinctrl: qcom,pmic-gpio: Add level-shifter function
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260529/202605290048.0PmO45KN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290048.0PmO45KN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605290048.0PmO45KN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[70, 341], [58, 0], [70, 343], [70, 344], [42, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'clkref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[70, 346], [58, 0], [70, 348], [70, 349], [42, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml
--
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml
--
   arch/arm64/boot/dts/qcom/kaanapali.dtsi:3287.27-3374.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@9800000/dsi@9ac0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml
--
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[56, 341], [44, 0], [56, 343], [56, 344], [29, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'clkref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[56, 346], [44, 0], [56, 348], [56, 349], [29, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: pmic@1 (qcom,pmh0101): gpio@8800: 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,rpmh' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: gpio@8800 (qcom,pmh0101-gpio): 'qcom,pmic-id' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
