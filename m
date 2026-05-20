Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21EB29DB64
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 01:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779239193; cv=none; b=gFWr019rqNf0vLIA0FW3JyyeFM1Y9wciCvHVLdz6x2DxZrNLAey76Pk86HPb5yYGRSxqxq/Gp5ZBeg4kHpo4SUyIUpxvsRMUXGWLVZVp3wPJXA3ZN3VJJCw/NvULW1BcGJWRVGXtchs3mCvXKeOfXBQLuT41QjfrMhIF/kKjNzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779239193; c=relaxed/simple;
	bh=la2Ody4sTgQItAKdwUUY4Y9G/7tDBilLHlnTAFqKVj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fqvk7ZJFh4EJzsEfHEgehqCzsZ70z30IoXQcx5YksnehGNAuzkKar/8H6RaqXxdGeRtYEB5KJ/wjm+gFIqqjmg0O2bqCH8fDuheSlzwkt2qT3pzOAYbaS7ypLT4G5mh+uzqUpWlmb2/iVgAuKQwmYW9VtndqASxcy71jhKM6eZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfbyB8gF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfbyB8gF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779239189; x=1810775189;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=la2Ody4sTgQItAKdwUUY4Y9G/7tDBilLHlnTAFqKVj0=;
  b=IfbyB8gFVPE6r+77MPRjRqVLgvo60A4oS3xjiqAzVQ+nYbaQ8CbLJdEm
   ylOgzwQ2Gj9fIwWGufTOdB9DZTf8upJVGW42ScMSC7nXiKXCCT8ckBSN1
   C0smX+86cbTBop0wGwIr4eG7M2p/CbrDS5dUdz1pRQ84NiX9g5vgZ1Jmf
   F7ZtaPxdl3NDN02BhnqTA/VbY5wTJyNevoAwBdxnefZYNN+dByaxnC1Cl
   4sf21sN/V6TVeaZA3QVcNqFlInjSXgWLqjxMOuIOemRK6m3zNzZZ1nccG
   HRG5nXvmHmTf4ismjhSzzgEVCMsPxJ4Mx1UfeljjzmghK7KfgG8zr3o+Q
   g==;
X-CSE-ConnectionGUID: JPnfr78LSX2D7czNx9kjJw==
X-CSE-MsgGUID: Fj8DwQwlQomu3bHMMEwNzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79856883"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79856883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 18:06:28 -0700
X-CSE-ConnectionGUID: YAuERv0rSgWQULPUESJOSQ==
X-CSE-MsgGUID: ZF71VGuAQuaGPlnck8Br5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239118974"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 19 May 2026 18:06:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPVOC-00000000AOP-3ckJ;
	Wed, 20 May 2026 01:06:24 +0000
Date: Wed, 20 May 2026 03:05:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pmic@2
 (qcom,pmi8998): 'vbus-reg@1100' does not match any of the regexes:
 '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$',
 '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@...
Message-ID: <202605200244.kNVuAbvu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: taygoth <taygoth@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/taygoth/dt-bindings-=
regulator-qcom-usb-vbus-regulator-add-PMI8998/20260519-042837
head:   05f7faecd107d17be0a4d2c0a0f60cae26352cc6
commit: dcd123811a0d50bd739d681bd11e3715bbec597f arm64: dts: qcom: pmi8998:=
 add USB Type-C and VBUS regulator nodes
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-2055-20260519 (https://download.01.org/0day-ci/arc=
hive/20260520/202605200244.kNVuAbvu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260520/202605200244.kNVuAbvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605200244.kNVuAbvu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pmic@2 (qcom,pmi8998): =
'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-=
f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', =
'^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$',=
 '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9=
]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^u=
sb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f=
]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pmic@2 (qcom,pmi8998): =
typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pmic@2 (qcom,pmi8998): =
typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pmic@2 (qcom,pmi8998): =
typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pmic@2 (qcom,pmi8998): =
typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pmic@2 (qcom,pmi8998): =
typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pmic@2 (qcom,pmi8998): 'vbus-r=
eg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', =
'^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^batte=
ry@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps=
@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '=
^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-dete=
ct@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', '=
gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pmic@2 (qcom,pmi8998): typec@1=
300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pmic@2 (qcom,pmi8998): typec@1=
300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pmic@2 (qcom,pmi8998): typec@1=
300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pmic@2 (qcom,pmi8998): typec@1=
300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pmic@2 (qcom,pmi8998): typec@1=
300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@2 (qcom,=
pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|le=
ds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-=
9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0=
-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pi=
nctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-=
f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrat=
or@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@2 (qcom,pmi8=
998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@=
[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f=
]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-=
f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctr=
l-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$=
', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[=
0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:90.20-98.5: Warning (avoid_unneces=
sary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells=
/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" prop=
erty
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pinctrl@=
3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional=
 failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do=
 not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pin=
ctrl.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pmic@2 (=
qcom,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wl=
ed|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-code=
c@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controll=
er@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$',=
 '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[=
0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^v=
ibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was exp=
ected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:90.20-98.5: Warning (avoid_unneces=
sary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells=
/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" prop=
erty
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pinctrl@=
3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional=
 failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do=
 not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pin=
ctrl.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pmic@2 (=
qcom,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wl=
ed|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-code=
c@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controll=
er@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$',=
 '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[=
0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^v=
ibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was exp=
ected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pmic@2 (=
qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:90.20-98.5: Warning (avoid_unneces=
sary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells=
/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" prop=
erty
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pinctrl=
@3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditiona=
l failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do=
 not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pin=
ctrl.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pmic@2 =
(qcom,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(w=
led|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-cod=
ec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-control=
ler@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$'=
, '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@=
[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^=
vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must=
 be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@2 (qcom,pmi8998)=
: 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9=
a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$'=
, '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$=
', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0=
-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '=
^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a=
-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4785.27-4840.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pmic@2 (qcom,pmi8998): 'vbus=
-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$'=
, '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^bat=
tery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mp=
ps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$',=
 '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-de=
tect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$',=
 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pmic@2 (qcom,pmi8998): typec=
@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pmic@2 (qcom,pmi8998): typec=
@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pmic@2 (qcom,pmi8998): typec=
@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pmic@2 (qcom,pmi8998): typec=
@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pmic@2 (qcom,pmi8998): typec=
@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4785.27-4840.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dtb: pmic@2 (qcom,pmi8=
998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@=
[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f=
]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-=
f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctr=
l-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$=
', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[=
0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-google-blueline.dtb: pmic@2 (qcom,pmi899=
8): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0=
-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+=
$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]=
+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-=
[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$',=
 '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-=
9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-blueline.dtb: pmic@2 (qcom,pmi899=
8): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-blueline.dtb: pmic@2 (qcom,pmi899=
8): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-blueline.dtb: pmic@2 (qcom,pmi899=
8): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-blueline.dtb: pmic@2 (qcom,pmi899=
8): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-google-blueline.dtb: pmic@2 (qcom,pmi899=
8): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: panel@0 (lg,sw49410-lh609=
qh1): compatible:0: 'lg,sw49410-lh609qh1' is not one of ['ampire,am-1280800=
n3tzqw-t00h', 'ampire,am-480272h3tmqw-t01h', 'ampire,am-800480l1tmqw-t00h',=
 'ampire,am800480r3tmqwa1h', 'ampire,am800600p5tmqw-tb8h', 'auo,b101aw03', =
'auo,b101xtn01', 'auo,b116xw03', 'auo,g070vvn01', 'auo,g101evn010', 'auo,g1=
04sn02', 'auo,g104stn01', 'auo,g121ean01', 'auo,g156xtn01', 'auo,p238han01'=
, 'auo,p320hvn03', 'avic,tm070ddh03', 'boe,av101hdt-a10', 'boe,bp082wx1-100=
', 'boe,bp101wx1-100', 'boe,ev121wxm-n10-1850', 'boe,hv070wsa-100', 'cct,cm=
t430b19n00', 'cdtech,s043wq26h-ct7', 'cdtech,s070pws19hp-fc21', 'cdtech,s07=
0swv29hg-dc44', 'cdtech,s070wv95-ct16', 'chefree,ch101olhlwh-002', 'chunghw=
a,claa101wa01a', 'chunghwa,claa101wb01', 'chunghwa,claa101wb03', 'dataimage=
,fg040346dsswbg04', 'dataimage,fg1001l0dsswmg01', 'dataimage,scf0700c48ggu1=
8', 'dlc,dlc1010gig', 'edt,et035012dm6', 'edt,et057023udba', 'edt,et057090d=
hu', 'edt,et070080dh6', 'edt,etm0350g0dh6', 'edt,etm043080dh6gp', 'edt,etm0=
430g0dh6', 'edt,etm070080bdh6', 'edt,etm070080dh6', 'edt,etm070080edh6', 'e=
dt,etm0700g0bdh6', 'edt,etm0700g0dh6', 'edt,etm0700g0edh6', 'edt,etml0700y5=
dha', 'edt,etml1010g3dra', 'edt,etmv570g2dhu', 'eink,vb3300-kca', 'evervisi=
on,vgg644804', 'evervision,vgg804821', 'foxlink,fl500wvr00-a0t', 'frida,frd=
350h54004', 'giantplus,gpg48273qs5', 'giantplus,gpm940b0', 'hannstar,hsd070=
pww1', 'hannstar,hsd100pxn1', 'hannstar,hsd156juw2', 'hit,tx23d38vm0caa', '=
innolux,at043tn24', 'innolux,at070tn92', 'innolux,g070ace-l01', 'innolux,g0=
70ace-lh3', 'innolux,g070y2-l01', 'innolux,g070y2-t02', 'innolux,g101ice-l0=
1', 'innolux,g121i1-l01', 'innolux,g121x1-l03', 'innolux,g121xce-l01', 'inn=
olux,g150xge-l05', 'innolux,n133hse-ea1', 'innolux,n156bge-l21', 'innolux,z=
j070na-01p', 'jutouch,jt070tm041', 'jutouch,jt101tm023', 'koe,tx14d24vm1bpa=
', 'koe,tx31d200vm0baa', 'kyo,tcg070wvlq', 'kyo,tcg121xglp', 'lemaker,bl035=
-rgb-002', 'lg,lb070wv8', 'lg,sw49410', 'logictechno,lt161010-2nhc', 'logic=
techno,lt161010-2nhr', 'logictechno,lt170410-2whc', 'logictechno,lttd800480=
070-l2rt', 'logictechno,lttd800480070-l6wh-rt', 'microchip,ac69t88a', 'mits=
ubishi,aa070mc01-ca1', 'mitsubishi,aa084xe01', 'multi-inno,mi0700a2t-30', '=
multi-inno,mi0700s4t-6', 'multi-inno,mi0800ft-9', 'multi-inno,mi1010ait-1cp=
', 'multi-inno,mi1010z1t-1cp11', 'nec,nl12880bc20-05', 'nec,nl4827hc19-05b'=
, 'netron-dy,e231732', 'newhaven,nhd-4.3-480272ef-atxl', 'nlt,nl12880bc20-s=
pwg-24', 'nlt,nl13676bc25-03f', 'nvd,9128', 'okaya,rs800480t-7x0gp', 'olime=
x,lcd-olinuxino-43-ts', 'olimex,lcd-olinuxino-5-cts', 'ontat,kd50g21-40nt-a=
1', 'ontat,yx700wv03', 'ortustech,com37h3m05dtc', 'ortustech,com37h3m99dtc'=
, 'ortustech,com43h4m85ulc', 'osddisplays,osd070t1718-19ts', 'osddisplays,o=
sd101t2045-53ts', 'powertip,ph128800t004-zza01', 'powertip,ph128800t006-zhc=
01', 'powertip,ph800480t013-idf02', 'powertip,ph800480t032-zhc19', 'primevi=
ew,pm070wl4', 'qiaodian,qd43003c0-40', 'qishenglong,gopher2b-lcd', 'raystar=
,rff500f-awh-dnn', 'rocktech,rk101ii01d-ct', 'rocktech,rk070er9427', 'rockt=
ech,rk043fn48h', 'samsung,ltl101al01', 'samsung,ltl106al01', 'samsung,ltn10=
1nt05', 'satoz,sat050at40h12r2', 'sharp,lq035q7db03', 'sharp,lq070y3dg3b', =
'sharp,lq101k1ly04', 'sharp,ls020b1dd01d', 'shelly,sca07010-bfn-lnn', 'star=
ry,kr070pe2t', 'startek,kd070wvfpa', 'team-source-display,tst043015cmhx', '=
tianma,p0700wxf1mbaa', 'tianma,tm050rdh03', 'tianma,tm070jdhg30', 'tianma,t=
m070jdhg34-00', 'tianma,tm070jvhg33', 'tianma,tm070rvhg71', 'topland,tian-g=
07017-01', 'toshiba,lt089ac29000', 'tpk,f07a-0102', 'tpk,f10a-0102', 'urt,u=
msh-8596md-t', 'urt,umsh-8596md-1t', 'urt,umsh-8596md-7t', 'urt,umsh-8596md=
-11t', 'urt,umsh-8596md-19t', 'urt,umsh-8596md-20t', 'vivax,tpc9150-panel',=
 'vxt,vl050-8048nt-c01', 'waveshare,13.3inch-panel', 'waveshare,7.0inch-c-p=
anel', 'winstar,wf35ltiacd', 'yes-optoelectronics,ytc700tlag-05-201c']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simp=
le.yaml
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: panel@0 (lg,sw49410-lh609=
qh1): compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simp=
le.yaml
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: panel@0 (lg,sw49410-lh609=
qh1): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simp=
le.yaml
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: panel@0 (lg,sw49410-lh609=
qh1): Unevaluated properties are not allowed ('reg', 'vsn-supply', 'vsp-sup=
ply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simp=
le.yaml
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/display-subsystem@=
ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['=
lg,sw49410-lh609qh1', 'lg,sw49410']
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pmic@2 (qcom,pmi8998): 'v=
bus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]=
+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^=
battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '=
^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+=
$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb=
-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+=
$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pmic@2 (qcom,pmi8998): ty=
pec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pmic@2 (qcom,pmi8998): ty=
pec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pmic@2 (qcom,pmi8998): ty=
pec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pmic@2 (qcom,pmi8998): ty=
pec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pmic@2 (qcom,pmi8998): ty=
pec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4785.27-4840.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:90.20-98.5: Warning (avoid_unneces=
sary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells=
/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" prop=
erty
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pmic@2 (qcom,pmi8998): 'vb=
us-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+=
$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^b=
attery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^=
mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$=
', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-=
detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$=
', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pmic@2 (qcom,pmi8998): typ=
ec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pmic@2 (qcom,pmi8998): typ=
ec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pmic@2 (qcom,pmi8998): typ=
ec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pmic@2 (qcom,pmi8998): typ=
ec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pmic@2 (qcom,pmi8998): typ=
ec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pmic@2 (qcom,pmi8998): 'vbus-re=
g@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '=
^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^batter=
y@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@=
[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^=
rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detec=
t@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'g=
pio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pmic@2 (qcom,pmi8998): typec@13=
00:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pmic@2 (qcom,pmi8998): typec@13=
00:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pmic@2 (qcom,pmi8998): typec@13=
00:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pmic@2 (qcom,pmi8998): typec@13=
00:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pmic@2 (qcom,pmi8998): typec@13=
00:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi:75.37-82.5: Warning =
(unit_address_vs_reg): /chosen/framebuffer@9d400000: node has a unit name, =
but no reg or ranges property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:90.20-98.5: Warning (avoid_unneces=
sary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells=
/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" prop=
erty
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8=
998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@=
[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f=
]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-=
f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctr=
l-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$=
', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[=
0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8=
998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi:75.37-82.5: Warning =
(unit_address_vs_reg): /chosen/framebuffer@9d400000: node has a unit name, =
but no reg or ranges property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998=
): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-=
9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$=
', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+=
$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[=
0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', =
'^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9=
a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: touchscreen@=
2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pmic@2 (qcom=
,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|l=
eds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0=
-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[=
0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^p=
inctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a=
-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibra=
tor@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pmic@2 (qcom=
,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pmic@2 (qcom=
,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must be f=
ixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pmic@2 (qcom=
,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pmic@2 (qcom=
,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pmic@2 (qcom=
,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1562.21-1582.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/geniqup@8c0000/i2c@894000: unnecessary #address-=
cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges"=
 property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pmic@2 (q=
com,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wle=
d|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec=
@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controlle=
r@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', =
'^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0=
-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vi=
brator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pmic@2 (q=
com,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pmic@2 (q=
com,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must b=
e fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pmic@2 (q=
com,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pmic@2 (q=
com,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pmic@2 (q=
com,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: touchscreen=
@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pmic@2 (qco=
m,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|=
leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[=
0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@=
[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^=
pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9=
a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibr=
ator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must be =
fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expect=
ed
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pmic@2 (qcom,=
pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|le=
ds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-=
9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0=
-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pi=
nctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-=
f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrat=
or@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pmic@2 (qcom,=
pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pmic@2 (qco=
m,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|=
leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[=
0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@=
[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^=
pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9=
a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibr=
ator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must be =
fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expect=
ed
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pmic@2 (qco=
m,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:472.25-493.4: Warning=
 (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae9400=
0/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ra=
nges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/display-subsy=
stem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatibl=
e: ['jdi,fhd-nt35596s']
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pmic@2 (qcom,pmi8998=
): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-=
9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$=
', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+=
$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[=
0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', =
'^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9=
a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pmic@2 (qcom,pmi8998=
): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:90.20-98.5: Warning (avoid_unneces=
sary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells=
/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" prop=
erty
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_uni=
t_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicat=
e unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@=
1eb)
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pmic@2 (qcom,pmi8998)=
: 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9=
a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$'=
, '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$=
', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0=
-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '=
^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a=
-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pmic@2 (qcom,pmi8998)=
: typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pmic@2 =
(qcom,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(w=
led|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-cod=
ec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-control=
ler@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$'=
, '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@=
[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^=
vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must=
 be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-=
typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pmic@2 =
(qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
