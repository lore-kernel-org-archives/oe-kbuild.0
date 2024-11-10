Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E278D2FA
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 04:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731213986; cv=none; b=MydoMGXGcnnj0G/evAq+Bofo88qcVgwINSeXLKRfac8q9DxUaQNvx3r/Ts3hPoigVsbY1xQo00cE2TUjJvJ4lVT+KCH3FozPFmDj4KI0rAY4M3eygGN/MoBQJVAIypu/bwk93suASosnOFbsV+fB9dTMaJre75SLrgz+Bq+/AUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731213986; c=relaxed/simple;
	bh=MNhNwU+7x5aJhNF4hTyavmgwx8PRlvUXdpOO3JtLcPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HiXporCJOfJK2sMNWiI9wguM9vUJlDjTG7E/Stu5VJQYO/4Wi0KTrrLgYwYAkOVAiAN8LsX2u6/g1lYrEsPVPby67QlA2I8J2IVYHMQtBv8dZavhvNmva1A26yK/YKF0lsSnxAqo1hM2o8UXzunqFPFBcGRtBEPmbNV+rffME38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miDPVxNf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miDPVxNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731213981; x=1762749981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MNhNwU+7x5aJhNF4hTyavmgwx8PRlvUXdpOO3JtLcPM=;
  b=miDPVxNffbmEylVEdnBq1VgFQMYTFYA9kpPRQ5WexFBwIJBImZ8Qh1ax
   tRY0P7d07VjkcEy7dKMM4KciEZo2n25EziszM7roUeHNqjK8ZGf0VZq03
   VKPvQ3gx5KzAWd9E404kukV4uJehoj2TAJ2JMKWdLKnG36L9VDO3mI40a
   iOOsmcmEQ5pO/9KaHM4aiJvYCTD5fFBkRHScBH8W1ZKQMW+X/Kow/30Tq
   KlkyPB7GPGmfExJuHWIzNNJfxKjU0AuwnWaJWzwJ/x9UC1JOH4zq6GCl0
   0mKRCnj8vSehwu5+vnEPr7ihu9D9FYACmvy2GiIFwOMEzaKap5FTIFP1q
   A==;
X-CSE-ConnectionGUID: Cv6XVZ2kQj6nmKIdREInVg==
X-CSE-MsgGUID: dPNxFGqcTBmPHQRChtk4eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="42452100"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="42452100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 20:46:20 -0800
X-CSE-ConnectionGUID: vBzMZNatQVe+k1uqmwd+tA==
X-CSE-MsgGUID: d4Nfm3gmTX+ezpSjX545Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86276767"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Nov 2024 20:46:18 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9zq3-000szu-1w;
	Sun, 10 Nov 2024 04:46:15 +0000
Date: Sun, 10 Nov 2024 12:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-partner_predev 81/81]
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000: 'power-domains' is
 a required property
Message-ID: <202411101244.GhTP6ndO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: dc5cb63592bd8c1de1fc6647ac7da44deacc9e4c [81/81] dt-bindings: phy: migrate QMP UFS PHY bindings to qcom,sc8280xp-qmp-ufs-phy.yaml
:::::: branch date: 11 days ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241110/202411101244.GhTP6ndO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101244.GhTP6ndO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411101244.GhTP6ndO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: pmic@3: wled@d800:interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: pmic@3: wled@d800:interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: wled@d800: interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: wled@d800: interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: wled@d800: interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@627000: '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: remoteproc@2080000: clocks: [[30, 222], [30, 223], [30, 157], [20], [30, 229], [30, 224], [30, 225], [4, 2], [4, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: funnel@3023000: 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: pmic@3: wled@d800:interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: pmic@3: wled@d800:interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: wled@d800: interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: wled@d800: interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: wled@d800: interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: phy@627000: '#address-cells', '#size-cells', 'phy@627400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: remoteproc@2080000: clocks: [[24, 222], [24, 223], [24, 157], [16], [24, 229], [24, 224], [24, 225], [25, 2], [25, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: funnel@3023000: 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: syscon@9a10000: compatible: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: pmic@3: wled@d800:interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: pmic@3: wled@d800:interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: wled@d800: interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: wled@d800: interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: wled@d800: interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: phy@627000: '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@1c00000: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@1c00000: 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@2080000: clocks: [[24, 222], [24, 223], [24, 157], [20], [24, 229], [24, 224], [24, 225], [3, 2], [3, 8]] is too short
--
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: pmic@3: wled@d800:interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: pmic@3: wled@d800:interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: wled@d800: interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: wled@d800: interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: wled@d800: interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: phy@627000: '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@1c00000: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@1c00000: 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@2080000: clocks: [[24, 222], [24, 223], [24, 157], [20], [24, 229], [24, 224], [24, 225], [3, 2], [3, 8]] is too short
--
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: pmic@3: wled@d800: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800: interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800: interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800: interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@627000: '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: remoteproc@1c00000: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: remoteproc@2080000: clocks: [[31, 222], [31, 223], [31, 157], [21], [31, 229], [31, 224], [31, 225], [2, 2], [2, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: funnel@3023000: 'in-ports' is a required property
--
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: pmic@3: wled@d800: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800: interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800: interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800: interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@627000: '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: remoteproc@1c00000: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: remoteproc@2080000: clocks: [[30, 222], [30, 223], [30, 157], [20], [30, 229], [30, 224], [30, 225], [2, 2], [2, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: funnel@3023000: 'in-ports' is a required property
--
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: pmic@3: wled@d800:interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: pmic@3: wled@d800:interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: wled@d800: interrupt-names:0: 'ovp' was expected
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: wled@d800: interrupts: [[3, 216, 2, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: wled@d800: interrupt-names: ['short'] is too short
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@627000: '#address-cells', '#size-cells', 'phy@627400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: remoteproc@1c00000: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: remoteproc@2080000: clocks: [[31, 222], [31, 223], [31, 157], [21], [31, 229], [31, 224], [31, 225], [3, 2], [3, 8]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: funnel@3023000: 'in-ports' is a required property
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: pci@1c00000: iommu-map: [[256, 31, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc-rev2'] is too short
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: pci@1c00000: iommu-map: [[256, 34, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: etm@7c40000: 'out-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: etm@7c40000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: etm@7d40000: 'out-ports' is a required property
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: pci@1c00000: iommu-map: [[256, 31, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc-rev2'] is too short
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: pci@1c00000: iommu-map: [[256, 31, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc-rev2'] is too short
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pci@1c00000: iommu-map: [[256, 34, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: etm@7c40000: 'out-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: etm@7c40000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: etm@7d40000: 'out-ports' is a required property
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pci@1c00000: iommu-map: [[256, 35, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc-rev2'] is too short
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pci@1c00000: iommu-map: [[256, 35, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc-rev2'] is too short
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pci@1c00000: iommu-map: [[256, 34, 5248, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: phy@1da7000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: phy@1da7000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: phy@1da7000: '#address-cells', '#size-cells', 'phy@1da7400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc-rev2'] is too short
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unnecessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: dma-controller@1dc4000: iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unnecessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: dma-controller@1dc4000: iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   	['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too short
   	'tbu' was expected
   	'ddrss_sf_tbu' was expected
   	[[42, 68], [42, 64], [42, 66], [42, 67], [42, 69], [42, 70], [42, 235], [42, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: ufshc@1d84000: compatible:0: 'qcom,sc8180x-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/ufshc@1d84000: failed to match any schema with compatible: ['qcom,sc8180x-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy-wrapper@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy-wrapper@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy-wrapper@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/interconnect@1e00000: failed to match any schema with compatible: ['qcom,sc8180x-ipa-virt']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: gpu@2c00000: '#stream-id-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: gpu@2c00000: #stream-id-cells: 16 is greater than the maximum of 8
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: iommu@2ca0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8180x-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	'qcom,sc8180x-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sc8180x-smmu-500' is not one of ['qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500']
--
   	['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too short
   	'tbu' was expected
   	'ddrss_sf_tbu' was expected
   	[[42, 68], [42, 64], [42, 66], [42, 67], [42, 69], [42, 70], [42, 235], [42, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: ufshc@1d84000: compatible:0: 'qcom,sc8180x-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/ufshc@1d84000: failed to match any schema with compatible: ['qcom,sc8180x-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy-wrapper@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy-wrapper@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy-wrapper@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/interconnect@1e00000: failed to match any schema with compatible: ['qcom,sc8180x-ipa-virt']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: gpu@2c00000: '#stream-id-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: gpu@2c00000: #stream-id-cells: 16 is greater than the maximum of 8
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: iommu@2ca0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8180x-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	'qcom,sc8180x-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sc8180x-smmu-500' is not one of ['qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4692.27-4743.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: /soc@0/geniqup@8c0000/spi@894000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: pci@1c00000: iommu-map: [[0, 43, 7184, 1], [256, 43, 7185, 1], [512, 43, 7186, 1], [768, 43, 7187, 1], [1024, 43, 7188, 1], [1280, 43, 7189, 1], [1536, 43, 7190, 1], [1792, 43, 7191, 1], [2048, 43, 7192, 1], [2304, 43, 7193, 1], [2560, 43, 7194, 1], [2816, 43, 7195, 1], [3072, 43, 7196, 1], [3328, 43, 7197, 1], [3584, 43, 7198, 1], [3840, 43, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: pci@1c08000: iommu-map: [[0, 43, 7168, 1], [256, 43, 7169, 1], [512, 43, 7170, 1], [768, 43, 7171, 1], [1024, 43, 7172, 1], [1280, 43, 7173, 1], [1536, 43, 7174, 1], [1792, 43, 7175, 1], [2048, 43, 7176, 1], [2304, 43, 7177, 1], [2560, 43, 7178, 1], [2816, 43, 7179, 1], [3072, 43, 7180, 1], [3328, 43, 7181, 1], [3584, 43, 7182, 1], [3840, 43, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4692.27-4743.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: /soc@0/geniqup@8c0000/spi@894000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: pci@1c00000: iommu-map: [[0, 43, 7184, 1], [256, 43, 7185, 1], [512, 43, 7186, 1], [768, 43, 7187, 1], [1024, 43, 7188, 1], [1280, 43, 7189, 1], [1536, 43, 7190, 1], [1792, 43, 7191, 1], [2048, 43, 7192, 1], [2304, 43, 7193, 1], [2560, 43, 7194, 1], [2816, 43, 7195, 1], [3072, 43, 7196, 1], [3328, 43, 7197, 1], [3584, 43, 7198, 1], [3840, 43, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: pci@1c08000: iommu-map: [[0, 43, 7168, 1], [256, 43, 7169, 1], [512, 43, 7170, 1], [768, 43, 7171, 1], [1024, 43, 7172, 1], [1280, 43, 7173, 1], [1536, 43, 7174, 1], [1792, 43, 7175, 1], [2048, 43, 7176, 1], [2304, 43, 7177, 1], [2560, 43, 7178, 1], [2816, 43, 7179, 1], [3072, 43, 7180, 1], [3328, 43, 7181, 1], [3584, 43, 7182, 1], [3840, 43, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4692.27-4743.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: /soc@0/geniqup@8c0000/spi@894000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: pci@1c00000: iommu-map: [[0, 43, 7184, 1], [256, 43, 7185, 1], [512, 43, 7186, 1], [768, 43, 7187, 1], [1024, 43, 7188, 1], [1280, 43, 7189, 1], [1536, 43, 7190, 1], [1792, 43, 7191, 1], [2048, 43, 7192, 1], [2304, 43, 7193, 1], [2560, 43, 7194, 1], [2816, 43, 7195, 1], [3072, 43, 7196, 1], [3328, 43, 7197, 1], [3584, 43, 7198, 1], [3840, 43, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: pci@1c08000: iommu-map: [[0, 43, 7168, 1], [256, 43, 7169, 1], [512, 43, 7170, 1], [768, 43, 7171, 1], [1024, 43, 7172, 1], [1280, 43, 7173, 1], [1536, 43, 7174, 1], [1792, 43, 7175, 1], [2048, 43, 7176, 1], [2304, 43, 7177, 1], [2560, 43, 7178, 1], [2816, 43, 7179, 1], [3072, 43, 7180, 1], [3328, 43, 7181, 1], [3584, 43, 7182, 1], [3840, 43, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pci@1c00000: Unevaluated properties are not allowed ('enable-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pci@1c00000: Unevaluated properties are not allowed ('enable-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: remoteproc-adsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pci@1c00000: iommu-map: [[0, 51, 7184, 1], [256, 51, 7185, 1], [512, 51, 7186, 1], [768, 51, 7187, 1], [1024, 51, 7188, 1], [1280, 51, 7189, 1], [1536, 51, 7190, 1], [1792, 51, 7191, 1], [2048, 51, 7192, 1], [2304, 51, 7193, 1], [2560, 51, 7194, 1], [2816, 51, 7195, 1], [3072, 51, 7196, 1], [3328, 51, 7197, 1], [3584, 51, 7198, 1], [3840, 51, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pci@1c08000: iommu-map: [[0, 51, 7168, 1], [256, 51, 7169, 1], [512, 51, 7170, 1], [768, 51, 7171, 1], [1024, 51, 7172, 1], [1280, 51, 7173, 1], [1536, 51, 7174, 1], [1792, 51, 7175, 1], [2048, 51, 7176, 1], [2304, 51, 7177, 1], [2560, 51, 7178, 1], [2816, 51, 7179, 1], [3072, 51, 7180, 1], [3328, 51, 7181, 1], [3584, 51, 7182, 1], [3840, 51, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: remoteproc-adsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: remoteproc-adsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/geniqup@8c0000/i2c@890000/max98927@3a: failed to match any schema with compatible: ['maxim,max98927']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/geniqup@ac0000/i2c@a90000/synaptics-rmi4-i2c@20: failed to match any schema with compatible: ['syna,rmi4-i2c']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6dsp-lpass-ports.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: /soc@0/geniqup@ac0000/i2c@a90000/synaptics-rmi4-i2c@20: failed to match any schema with compatible: ['syna,rmi4-i2c']
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4620.27-4671.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4692.27-4743.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: remoteproc-adsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: remoteproc-adsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1218.44-1221.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/geniqup@ac0000/i2c@a98000/touchscreen@20: failed to match any schema with compatible: ['syna,rmi4-i2c']
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/geniqup@8c0000/i2c@894000/touchscreen@38: failed to match any schema with compatible: ['focaltech,fts8719']
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: bridge@2c: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: remoteproc-adsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: remoteproc-cdsp: Unevaluated properties are not allowed ('firmware-name' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pci@1c00000: iommu-map: [[0, 49, 7184, 1], [256, 49, 7185, 1], [512, 49, 7186, 1], [768, 49, 7187, 1], [1024, 49, 7188, 1], [1280, 49, 7189, 1], [1536, 49, 7190, 1], [1792, 49, 7191, 1], [2048, 49, 7192, 1], [2304, 49, 7193, 1], [2560, 49, 7194, 1], [2816, 49, 7195, 1], [3072, 49, 7196, 1], [3328, 49, 7197, 1], [3584, 49, 7198, 1], [3840, 49, 7199, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pci@1c08000: iommu-map: [[0, 49, 7168, 1], [256, 49, 7169, 1], [512, 49, 7170, 1], [768, 49, 7171, 1], [1024, 49, 7172, 1], [1280, 49, 7173, 1], [1536, 49, 7174, 1], [1792, 49, 7175, 1], [2048, 49, 7176, 1], [2304, 49, 7177, 1], [2560, 49, 7178, 1], [2816, 49, 7179, 1], [3072, 49, 7180, 1], [3328, 49, 7181, 1], [3584, 49, 7182, 1], [3840, 49, 7183, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: dma-controller@1b04000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: dma-controller@1b04000: iommus: [[42, 146, 0], [42, 148, 17], [42, 150, 17], [42, 152, 1], [42, 159, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: /soc@0/dma-controller@1b04000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: ufs@4804000: compatible:0: 'qcom,sm6115-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: ufs@4804000: Unevaluated properties are not allowed ('compatible', 'reg-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: /soc@0/ufs@4804000: failed to match any schema with compatible: ['qcom,sm6115-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: phy@4807000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: phy@4807000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: phy@4807000: '#address-cells', '#size-cells', 'phy@4807400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: mailbox@f111000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm6115-apcs-hmss-global', 'qcom,msm8994-apcs-kpss-global'] is too long
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,qcs404-apcs-apps-global', 'qcom,sdx55-apcs-gcc']
--
   	'qcom,spmi-adc5' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-iadc']
   	'qcom,spmi-adc5' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-rradc']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: adc@3100: 'die-temp@6', 'ref-gnd@0', 'vcoin@85', 'vph-pwr@83', 'vref-1p25@1', 'xo-therm@4c' do not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: ufs@4804000: compatible:0: 'qcom,sm6115-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: ufs@4804000: Unevaluated properties are not allowed ('compatible', 'reg-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: /soc@0/ufs@4804000: failed to match any schema with compatible: ['qcom,sm6115-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: phy@4807000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: phy@4807000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: phy@4807000: '#address-cells', '#size-cells', 'phy@4807400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: mailbox@f111000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm6115-apcs-hmss-global', 'qcom,msm8994-apcs-kpss-global'] is too long
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,qcs404-apcs-apps-global', 'qcom,sdx55-apcs-gcc']
--
   	'qcom,spmi-adc5' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-iadc']
   	'qcom,spmi-adc5' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-rradc']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: adc@3100: 'die-temp@6', 'ref-gnd@0', 'vcoin@85', 'vph-pwr@83', 'vref-1p25@1', 'xo-therm@4c' do not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: ufs@4804000: compatible:0: 'qcom,sm6115-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: ufs@4804000: Unevaluated properties are not allowed ('compatible', 'reg-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: /soc@0/ufs@4804000: failed to match any schema with compatible: ['qcom,sm6115-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: phy@4807000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: phy@4807000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: phy@4807000: '#address-cells', '#size-cells', 'phy@4807400', 'ranges', 'vddp-ref-clk-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: mailbox@f111000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm6115-apcs-hmss-global', 'qcom,msm8994-apcs-kpss-global'] is too long
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,sm6115-apcs-hmss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,qcs404-apcs-apps-global', 'qcom,sdx55-apcs-gcc']
--
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: /soc@0/geniqup@8c0000/serial@884000/bluetooth: failed to match any schema with compatible: ['qcom,wcn3988-bt']
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: haptics@5a: awinic,boost-debug: b'0\xeb\xd4' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: haptics@5a: awinic,tset: b'\x12' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: haptics@5a: awinic,r-spare: b'h' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: /soc@0/geniqup@9c0000/i2c@990000/haptics@5a: failed to match any schema with compatible: ['awinic,aw8695']
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: ufs@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: pmic@4: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@0', 'adc-chan@1', 'adc-chan@6', 'adc-chan@83' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@0', 'adc-chan@1', 'adc-chan@6', 'adc-chan@83', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@0', 'adc-chan@1', 'adc-chan@6', 'adc-chan@83' do not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc5'] is too short
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unnecessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: dma-controller@1dc4000: iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unnecessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: dma-controller@1dc4000: iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: ramoops@ffc00000: Unevaluated properties are not allowed ('msg-size' was unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: /soc@0/geniqup@ac0000/i2c@a94000/touchscreen@48: failed to match any schema with compatible: ['samsung,s6sy761']
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: dma-controller@1dc4000: iommus: [[48, 1426, 0], [48, 1432, 0], [48, 1433, 0], [48, 1439, 0], [48, 1414, 17], [48, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4282.27-4353.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: ramoops@ffc00000: Unevaluated properties are not allowed ('msg-size' was unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: /soc@0/geniqup@ac0000/i2c@a94000/touchscreen@48: failed to match any schema with compatible: ['samsung,s6sy761']
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: dma-controller@1dc4000: iommus: [[48, 1426, 0], [48, 1432, 0], [48, 1433, 0], [48, 1439, 0], [48, 1414, 17], [48, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unnecessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: dma-controller@1dc4000: iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3171.14-3179.6: Warning (avoid_unnecessary_addr_size): /soc@0/funnel@6c2d000/out-ports: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4374.27-4426.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:125.9-140.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2823.14-2833.6: Warning (graph_child_address): /soc@0/tpda@6004000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2870.13-2880.6: Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3083.13-3093.6: Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8250.dtsi:3438.13-3448.6: Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: dma-controller@1dc4000: iommus: [[47, 1426, 0], [47, 1432, 0], [47, 1433, 0], [47, 1439, 0], [47, 1414, 17], [47, 1430, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: etf@6b05000: in-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350-hdk.dts:353.9-364.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a94000/typec-mux@42/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: typec-mux@42: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: typec-mux@42: 'ports', 'svid' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: typec-mux@42: svid: b'\xff\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1c06000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2582.27-2659.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2680.27-2757.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2545.11-2555.7: Warning (graph_child_address): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2582.27-2659.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2680.27-2757.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2545.11-2555.7: Warning (graph_child_address): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
--
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: /soc@0/spmi@c400000/pmic@7: failed to match any schema with compatible: ['qcom,pm8450', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000: clocks: [[49, 151], [49, 10], [49, 150], [49, 166], [42, 0], [49, 164], [49, 160], [49, 162], [49, 154]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000: clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000: reg: [[0, 30949376, 0, 12288], [0, 30965760, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: dma-controller@1dc4000: iommus: [[48, 1412, 17], [48, 1416, 0], [48, 1432, 5], [48, 1434, 0], [48, 1439, 0]] is too long
--
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: /soc@0/spmi@c400000/pmic@7: failed to match any schema with compatible: ['qcom,pm8450', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000: clocks: [[49, 151], [49, 10], [49, 150], [49, 166], [42, 0], [49, 164], [49, 160], [49, 162], [49, 154]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000: clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000: reg: [[0, 30949376, 0, 12288], [0, 30965760, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1d87000: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1d87000: '#address-cells', '#size-cells', 'phy@1d87400', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: dma-controller@1dc4000: compatible:0: 'qcom,bam-v1.7.4' is not one of ['qcom,bam-v1.3.0', 'qcom,bam-v1.4.0', 'qcom,bam-v1.7.0']
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: dma-controller@1dc4000: iommus: [[48, 1412, 17], [48, 1416, 0], [48, 1432, 5], [48, 1434, 0], [48, 1439, 0]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
