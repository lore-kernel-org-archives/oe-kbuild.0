Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F149F1384B9
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720469795; cv=none; b=lVNzxVeP8vmsGXd4+0Hi28L8Y5YmdN3EBREd+vQMKaas6oxLjoAeBUgsNjRhtOw4AOJ12DcqxRmaxJb4BwMICefnta4BfBze4T9EQrRYEvLfKFe/p2t3em3FqPQyzg+OwGo+1vDIeaZtPka98bWmJ58tCWWchCcI27E/MQR+ALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720469795; c=relaxed/simple;
	bh=L/VgXD7JbdSfE/Sxujz+HJofrb3xSDx1f0fPH4/0GEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcRz9FCsNaHfGfzsbZSFQnevvKV+0pEDvkjiWU/Ba7Nl5NejPpyISuCny9GQqsgsowJ/uUWGjaTTIEHv2q8x/v2t3nRot/U5VMv+MiLwg2jEgmQ/bxlsBLIe6no9Yz8hwJwP44lHTy74HwBESQ5tXQJJ0Ao8q3SsHk83HRdUJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe/IwrRx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe/IwrRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720469792; x=1752005792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/VgXD7JbdSfE/Sxujz+HJofrb3xSDx1f0fPH4/0GEw=;
  b=Qe/IwrRxAHp5sWZs12Sii9Jou5UdpUEAcYVfeBIL3aCO0pY+A+sWBgVu
   ewmGr15pilHvcT88MZWmcvi54rJAPMpBsnkXekKskdBRaRorflWSGKnED
   hGiN5R0A/9TXLFs6YyayoZ5aiWbf4i6+pFIre8ozaCOHS15Q+JJYPK0eV
   lIZ5yq4pouVTkNplM1kIEqljK6llHaLUpeI3kkV/GMm3v5fi1mygqXTJD
   b9EusmAzqZHOBBFLE5DMk05r3+ELqdXZaTTBiqMBH93FZMSCbb8p4mccF
   xSOYpLTvjz/WjNX5tTbVw+2nZM3UZIW+zdBmbPoRWzy4splR0xA4CoS2z
   w==;
X-CSE-ConnectionGUID: EB7/QVaiSouMSzdqx/UuNg==
X-CSE-MsgGUID: 3t2anS8cTiKoKnp0CWx7Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17797123"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="17797123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 13:16:29 -0700
X-CSE-ConnectionGUID: dU6PdsrlS+qe/MkA9GK6Nw==
X-CSE-MsgGUID: uFmAeTpDSeawcUyFg/Y4iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="47701194"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2024 13:16:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQume-000W0W-0P;
	Mon, 08 Jul 2024 20:16:24 +0000
Date: Tue, 9 Jul 2024 04:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.11 284/290]
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: pmic@1:
 vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407090445.btqvLEMH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Reidel <adrian@travitia.xyz>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   88bf3be9c327f2d78c65e7e4c10c677d4b36128a
commit: e3e169cd28d0ba80d25ad683e076b299a39e8526 [284/290] arm64: dts: qcom: pm6150: Add vibrator
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/archive/20240709/202407090445.btqvLEMH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090445.btqvLEMH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407090445.btqvLEMH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
--
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:1087.21-1105.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']
--
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3266.27-3337.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: domain-idle-states: cluster-sleep-2: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: pmic@1: vibrator@5300:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: vibrator@5300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm6150-vib', 'qcom,pmi632-vib'] is too long
   	'qcom,pm6150-vib' is not one of ['qcom,pm8058-vib', 'qcom,pm8916-vib', 'qcom,pm8921-vib', 'qcom,pmi632-vib']
   	'qcom,pm6150-vib' is not one of ['qcom,pm7250b-vib', 'qcom,pm7325b-vib', 'qcom,pm7550ba-vib']
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8xxx-vib.yaml#
>> arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: /soc@0/spmi@c440000/pmic@1/vibrator@5300: failed to match any schema with compatible: ['qcom,pm6150-vib', 'qcom,pmi632-vib']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
