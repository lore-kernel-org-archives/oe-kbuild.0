Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743EB4653A
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 19:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723060525; cv=none; b=oEyTzn/p1FhOllhAdwzRFtSn5ChlEQ7qCHsoni64GQohEIUSi97RXj/W59eGzRJTOt1wXoT83Sl/RD+wx7ICLn/aQEUD1g6klX2G7/dM+AjWgitUDgkp7tMuORnOYu/BvztkXfn+WdzZUSVsgR/GeKRmqwzvYLWP35GtWUmFmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723060525; c=relaxed/simple;
	bh=MVWRQQDL5wDbHzzFP3KL19S5cSY7eY/ZCDmffpkvJBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T33Au8kHDGp8FqlgF4jgXgHqE7fTvKA6zaiYbUEXSQBHeuQ8YDvonkoV1StAQvjRCxGyLocq3lqgwaC9zderJxqeQ3ZHaxP82xrjv88TjF73AunhMBh1l+FwSHuWXvHNYCO87/I89XAzs/mv+Yyet2mgTQX6nk+/Sq/kgoybAXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAvFKyfz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAvFKyfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723060524; x=1754596524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MVWRQQDL5wDbHzzFP3KL19S5cSY7eY/ZCDmffpkvJBM=;
  b=dAvFKyfzieNI5lgqP6a89Ak4wcaSzG6qJstA4Tf7f3DBP6VRa96LEUHt
   tF99Sx8aj6NniJq58s7ESLJhaUX53DOmc0DX+TBIxRCltTiOpSM8KeGrp
   FwcxcU5QJp52W9+3NRGLaEzBCKyPG03YwPoQsIZOBlvgLOhkoVfKAOPgS
   yh1LDVURCTG7uSBmZEmyDEkkTvP49dl98EXkkH2IcBBMEdvtfp4ZxekYz
   uThVimssVlceKx+N6wXGVMrh9cKIiqZocrYslkzA1iUYyhxkdP5ANnjLE
   Ubbn0m6gHLGE8OuJje+xEEXWvnNRnjrgECmrObx0tBt+RhaHrERw0TQl/
   g==;
X-CSE-ConnectionGUID: izVv+rdCSAWoQqganbKfwQ==
X-CSE-MsgGUID: pjqoDrNBTpmcinwzJZqpdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21326060"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="21326060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 12:55:23 -0700
X-CSE-ConnectionGUID: P2XKnl/uTRmXQyQbsgwvRg==
X-CSE-MsgGUID: CURo80q7Tiixr8j6sQ5V3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="56647727"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2024 12:55:21 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbmkh-0005fw-14;
	Wed, 07 Aug 2024 19:55:19 +0000
Date: Thu, 8 Aug 2024 03:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add qcom,inst-id for remote etm
Message-ID: <202408080356.MozxNecy-lkp@intel.com>
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
In-Reply-To: <20240807071054.12742-2-quic_jinlmao@quicinc.com>
References: <20240807071054.12742-2-quic_jinlmao@quicinc.com>
TO: Mao Jinlong <quic_jinlmao@quicinc.com>
TO: Suzuki K Poulose <suzuki.poulose@arm.com>
TO: Mike Leach <mike.leach@linaro.org>
TO: James Clark <james.clark@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>
CC: linux-kernel@vger.kernel.org
CC: coresight@lists.linaro.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Mao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-qcom-inst-id-for-remote-etm/20240807-151315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240807071054.12742-2-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 1/2] dt-bindings: arm: Add qcom,inst-id for remote etm
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240808/202408080356.MozxNecy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080356.MozxNecy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408080356.MozxNecy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: pmic@2: mpps@a000:mpp2-userled4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[4] is not of type 'integer'
   	[4] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: mpps@a000: mpp2-userled4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[4] is not of type 'integer'
   	[4] is not one of [1, 2, 3, 4]
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: remoteproc@1c00000: 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: remoteproc@1c00000: 'px-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3251.27-3266.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@7577000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: panel@0: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: panel@0: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: pmic@3: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: wled@d800: 'label' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1051.26-1100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1119.26-1168.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1216.11-1226.7: Warning (graph_child_address): /soc@0/display-subsystem@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: etm: 'qcom,inst-id' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
