Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB72F5A36
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779247112; cv=none; b=hc5zeiqpMTiwehxuhB5jIkIlfF/LEQgYFWqPAjBqZIdqFnEM9JdmBzZUZ2qj6TtNO8KN9P8/cMx4XAoW2AICfzkIXz+BldDWCMuNCNoU3LiXVFlWR+U/NAUlUI2qV7rqFqSBPIne3t/ViW3l1zW2eHJMlkvSAJ5R9MSqE57VHHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779247112; c=relaxed/simple;
	bh=XAF1YEGD9pFWjRQNdFcjUehiyYaBmPPvs+jFjfseUnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzycN4CnB9ITRBrsov9GgMD56tnnmwKpjDvSnM9xJyVNcvJnVDaMjiNhUPOalbsSQRLC1OfegedlKdFa8ZWq5keqKgO2wMiNncmHkNqBwd3sihXZN8RYV42x8rRvzDphTBYMbawZHHBwvDJtLX9Smx6C/l4FhVdFTYe9VY5xwC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNhWW3yf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNhWW3yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779247110; x=1810783110;
  h=date:from:to:cc:subject:message-id;
  bh=XAF1YEGD9pFWjRQNdFcjUehiyYaBmPPvs+jFjfseUnY=;
  b=MNhWW3yfEDcQlI7CaFtzM+Pxvy3scsDpLndJ+N5gnF/yomFv6045giMu
   IuMyrtamO1pjmi6dKnnb8TStvQATH6qujnh19hFteHo1DEuhavYC0Z/WE
   S9ZqGunj7GL/n6N8SHAaTan9kC1W0PFQBrKZc98AI4o0iTbjooX3EFOAl
   uwvCPtK3iUb64PJ/zzRLDZEORXAk+5a/hVBLfMYqsL5OBMg1q1rtfM8BK
   ofGt+SIWyXjrA0YJfAj15Rvmp5HIh2N2KCHjH2d8pHsa5FI9mhPIrKNXi
   YnrVnm0emM6xZ/39KZXBGhwCjqPEVHVUgLJWjsvp8KhRyi8u0BSu7yfJ3
   A==;
X-CSE-ConnectionGUID: BDz3fGkUQgCDShP72nXzOQ==
X-CSE-MsgGUID: b41gnYyAReiCGlJ6DcbxOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79285614"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79285614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:18:30 -0700
X-CSE-ConnectionGUID: XzPsMDXHTMCEVk/xWhrX6w==
X-CSE-MsgGUID: mBOqyJNZTQeH11517h7qfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240044519"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2026 20:18:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPXRy-00000000APh-00Oj;
	Wed, 20 May 2026 03:18:26 +0000
Date: Wed, 20 May 2026 05:17:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb:
 pmic@2 (qcom,pmi8998): typec@1300: 'vdd-pdphy-supply' is a required property
Message-ID: <202605200537.e8MeSXrw-lkp@intel.com>
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
TO: taygoth <taygoth@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/taygoth/dt-bindings-regulator-qcom-usb-vbus-regulator-add-PMI8998/20260519-042837
head:   05f7faecd107d17be0a4d2c0a0f60cae26352cc6
commit: 1162604938495f27b2961046454258127f3c085f arm64: dts: qcom: sdm845-oneplus-common: enable USB Type-C role switching
date:   31 hours ago
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2055-20260519 (https://download.01.org/0day-ci/archive/20260520/202605200537.e8MeSXrw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200537.e8MeSXrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605200537.e8MeSXrw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi:75.37-82.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9d400000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:90.20-98.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8998): typec@1300: 'vdd-pdphy-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pmic@2 (qcom,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short
--
   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi:75.37-82.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9d400000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998): 'vbus-reg@1100' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998): typec@1300:interrupts: [[2, 19, 7, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998): typec@1300: 'vdd-pdphy-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998): typec@1300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmi8998-typec'] is too short
   	'qcom,pmi8998-typec' is not one of ['qcom,pmi632-typec', 'qcom,pm8150b-typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm6150-typec', 'qcom,pm7250b-typec']
   	'qcom,pmi8998-typec' is not one of ['qcom,pm4125-typec']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998): typec@1300:interrupt-names:0: 'or-rid-detect-change' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pmic@2 (qcom,pmi8998): typec@1300:interrupt-names: ['type-c-change'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
