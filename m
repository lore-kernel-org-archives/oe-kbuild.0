Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C66302767
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167782; cv=none; b=tKzEaYU/X4zYzmM/QB/5vKwrV5vhTp5fBAal1gIn1nzCUL9FjjwlsBOG+5fXCcSlZfxvx1Knj7y1LacUYS1bjiHISAWK43SHRT9IlSeTcXfMKtHq74IQ0Nx2jynBe+zFHQWadi1YACF05IyBNbgnqg2f1vo6J2snQwbkr/tvOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167782; c=relaxed/simple;
	bh=LeVUjq1FTClED6UxZAGz2AQQePE9GM4IpXcb9K483JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkwSfbNcvDYRIoJD/D9WPeJP1hdoy+e3KOv2ruDdTxowxjpqtn8JxLXM9Uli91Fx4J6S84vuNbQ1W3aau5DgnWabFf+3in0KtHBYKEXreL1G96MsRFOAoD2MWPGNeqVeZ71yRon+8mRZpcIPXoM8ZZlBOea9GyvbFX03YlBJQ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RX9mmi2T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RX9mmi2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764167780; x=1795703780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LeVUjq1FTClED6UxZAGz2AQQePE9GM4IpXcb9K483JM=;
  b=RX9mmi2Ti6gBL1rwV+ydAYpUMvZeIRsce18dYcHoU8boNNON3P5DP+wb
   LjFqZc1vk6a5QruQ6AbI3VrE50U14Pn9hBDNaMAMcfS6cLdPo633YqiEj
   oYqPUTaY6r3ZFc4GYZfoaBx+pDKv8GRHBZx3lj8wJDirgmMmYS9CsfVo3
   4DWPiqGrTqDHwMY80RQNZL1SN9sR1qrihQlLY5qxn4FeDcdWkRpnJh5zP
   zmVr7QyFTl3YSu1DaMhkSIkTILxtMLMgudmm54avLLZYffpvFqPpFKPV6
   CqXgDs1kZp+O/qxGd98c8jaW17AFLWCdlrGqhCTsKCrL59hDIr0w8a4Wp
   A==;
X-CSE-ConnectionGUID: tAPs6FNURq6Aj0X8oQ9E3w==
X-CSE-MsgGUID: 2D0mCQ4cTO647XVgjCQ0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53774393"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="53774393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 06:36:20 -0800
X-CSE-ConnectionGUID: EHbBHQuVSvavgqhT16/8xg==
X-CSE-MsgGUID: 7F8eLOurRDKAvl5ssfaiDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192747141"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 06:36:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOGcy-000000001F7-1JEc;
	Wed, 26 Nov 2025 14:36:16 +0000
Date: Wed, 26 Nov 2025 15:35:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC 4/8] arm64: dts: qcom: pm660: Add fuel gauge
Message-ID: <202511261513.e6m9xrwP-lkp@intel.com>
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
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-4-dd3791f61478@ixit.cz>
References: <20251124-pmi8998_fuel_gauge-v1-4-dd3791f61478@ixit.cz>
TO: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 422f3140bbcb657e1b86c484296972ab76f6d1ff]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/dt-bindings-power-supply-Add-schema-for-Qualcomm-pmi8998-fuel-gauge/20251125-055450
base:   422f3140bbcb657e1b86c484296972ab76f6d1ff
patch link:    https://lore.kernel.org/r/20251124-pmi8998_fuel_gauge-v1-4-dd3791f61478%40ixit.cz
patch subject: [PATCH RFC 4/8] arm64: dts: qcom: pm660: Add fuel gauge
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2053-20251125 (https://download.01.org/0day-ci/archive/20251126/202511261513.e6m9xrwP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261513.e6m9xrwP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511261513.e6m9xrwP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1779.26-1797.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1617.11-1627.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1617.11-1627.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1617.11-1627.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1617.11-1627.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1779.26-1797.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:229.9-238.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:1984.27-2039.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: pmic@0 (qcom,pm660): 'fuel-gauge@4000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
