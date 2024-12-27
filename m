Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86011F8684
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735328192; cv=none; b=k6ijMk3iFZky887l3vx/pkyRBSqm5qlOmV4AVoeQNaYJuRvjX9om9SdNoML6qsbwcNoFrU4Uj9LBkoE0hGomaI7hdnfU3dLbKyHMRoszyl29NTqprdwaglrYfgHBM3YLULv4NV13fiJIK6P8lUjUnlTpXB5Gu7lawoe++R7EXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735328192; c=relaxed/simple;
	bh=UB5Gh5ZXaVpIwS3P2Jik6BplH8MadjzfJHeqvAqphFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwY8HuTCqZoy67ofXhliCTtzyIVkqvaDrwriC34/bXYiy7UfRPA3daoREHxGVYdTYHybtojlAUoHPvbaPG1LI4Em5zsAK82IL/loUiBxC4ztZ2dgdCk6WI+WlQZ9ppCbUHRHkcdI+THMtV2CwjDCmhidy2/feAiBm4jD6/lRUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFYXjgoe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFYXjgoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735328189; x=1766864189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UB5Gh5ZXaVpIwS3P2Jik6BplH8MadjzfJHeqvAqphFo=;
  b=ZFYXjgoeRO9z4nHD7ygJvOsrO5aB15Uk/sAr3ozXUb0FtwuZ0fVDVV6H
   psIJPmLQsYfKtcSyjwdpbYqeax21h0yRnOIRcMkpx9eTuHurfkQxsjoUF
   BGekf6ylCm7WHTwZpXueTz52VzpW7SDKmBXGULd4c5bZf0XpNWzIFXuTy
   FMLefAJ9/S/KrsJhRDckL6rtTe9EkA1efJexHg58PRntVnzLtO2jxF8hz
   rwmAb6Fhy6oCn1RuTiR/JU/UGF9KLLYSiTs2RCi+Nq7XMJP9RgvHtyKEH
   ZfG+n2rz58fAiLiOkgYH+Ge0J1/E4S7DsYEfJ6cMyWHwnz50ozkoX7vrR
   Q==;
X-CSE-ConnectionGUID: 2FI5TGQLRRCGqpvn9D/12w==
X-CSE-MsgGUID: zKi7V0/SRU+5kv1qVtIKew==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="23320367"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="23320367"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 11:36:29 -0800
X-CSE-ConnectionGUID: 3NC4w/+LQM6ao8+KayTVVQ==
X-CSE-MsgGUID: 3JIFzsalS6qUzX+jmKZjAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100703486"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 11:36:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRG8H-0003XG-2K;
	Fri, 27 Dec 2024 19:36:25 +0000
Date: Sat, 28 Dec 2024 03:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 41/123]
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: pmic@3:
 led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of
 ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led',
 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flas...
Message-ID: <202412280356.smOF9WX9-lkp@intel.com>
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
TO: Richard Acayan <mailingradian@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 9b2955bae7025190c8d15983b37554da96e43e21 [41/123] arm64: dts: qcom: pm660l: add flash leds
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280356.smOF9WX9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280356.smOF9WX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412280356.smOF9WX9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@4080000: memory-region: [[45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
   arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: dma-controller@c144000: 'clocks' is a dependency of 'clock-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: dma-controller@c184000: 'clocks' is a dependency of 'clock-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1765.26-1783.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1603.11-1613.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: remoteproc@4080000: memory-region: [[45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb: usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1603.11-1613.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: remoteproc@4080000: memory-region: [[45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb: usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1603.11-1613.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: remoteproc@4080000: memory-region: [[45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb: usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1603.11-1613.7: Warning (graph_child_address): /soc@0/display-subsystem@c900000/display-controller@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: remoteproc@4080000: memory-region: [[45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb: usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1765.26-1783.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: remoteproc@4080000: memory-region: [[45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
>> arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
   arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb: usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@4080000: memory-region: [[45], [46]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: /soc@0/spmi@800f000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']
   arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: phy@c012000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:1570.27-1622.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: /soc@0/spmi@c440000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
