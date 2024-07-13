Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C11B960
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 03:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720840624; cv=none; b=WnUlZEnkXdaU9WdLJjYMivki8VL16dE/6bXzIwjXJ9/JQrwH09z1Z/wY9ei+nQDIrAA4Vhrjx7p5/kdszXnrGCa5ye6KREsC2yvcF2a9tLUsyUi5OiF1u8a2+vTgoUZ3wbVHYqNrhob4+DLTKq0vI37aziZbkWGFAJVwqTzLwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720840624; c=relaxed/simple;
	bh=BntRHanpY4f3NbpVXNTOObIJOkrelWX0ehvifPKoOoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKjwa3LzbKPXqm4JuwnyYmhb6CUURmxl691pVifCAMhT6QA596RLdYbHVfqrElDAx/jVSyFFZMc0gdwi8iuVxa0rYPqQi+Sjhjm9YaHfwY/uczSPnXXjI83G6SuJx/Kfd2grwM33XGA98ndE4e5QnHLkDV1vDC2vF/F+Wrn8t5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3jREyBZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3jREyBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720840621; x=1752376621;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BntRHanpY4f3NbpVXNTOObIJOkrelWX0ehvifPKoOoE=;
  b=A3jREyBZVUwy5QZVQIgXLJYC5XEVDsf68TnuZFXKOEIpdxnYiJ1Oskv9
   eAG1/z0fnCSLwXh/bfCe+QoG51ietEzA/AwuQ5ZHl4bQAaVpOXFga6ta/
   ZavFRDWj76TBbLYP/9PUZ2cNZ5g1TPpkQcarkaf2Yj/MhNTMCfmO6LY16
   Fkh1uVCu8om6Cb8xXCS8/2gh7HzC672I6pUnpEWlxAW7Jna3AC/I81obC
   +yOEzyTJodUUTt67ml47AtqmbRagpUbE6hYFzgl7nRuiDcdlyybE16zrO
   7XPk9f1ox0p6+AOv+vv4cxtqycPr/BoAR1Q9TTUgrq93Kpjw0rEYOvpq1
   w==;
X-CSE-ConnectionGUID: mrjZYYblTdmuzdP40R1Qqg==
X-CSE-MsgGUID: gGuuYpntRd+2sCBLjNHJTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17913355"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="17913355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 20:17:01 -0700
X-CSE-ConnectionGUID: bfKr9xl4QFyPzS7qo11q0g==
X-CSE-MsgGUID: EHPTuryNQL6XKAXujo56yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="80182571"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jul 2024 20:17:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSTFp-000bbx-2g;
	Sat, 13 Jul 2024 03:16:57 +0000
Date: Sat, 13 Jul 2024 11:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
Message-ID: <202407131122.CR7WCwJn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
References: <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
TO: Nikita Travkin <nikita@trvn.ru>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Nikita Travkin <nikita@trvn.ru>
CC: "Adam Słaboń" <asaillen@protonmail.com>

Hi Nikita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3fe121b622825ff8cc995a1e6b026181c48188db]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikita-Travkin/dt-bindings-arm-qcom-Add-msm8916-39-based-Lenovo-devices/20240713-001903
base:   3fe121b622825ff8cc995a1e6b026181c48188db
patch link:    https://lore.kernel.org/r/20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd%40trvn.ru
patch subject: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131122.CR7WCwJn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131122.CR7WCwJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407131122.CR7WCwJn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
>> arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1271.27-1320.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:495.26-498.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:515.26-518.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:540.24-543.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:550.26-553.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:570.26-573.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
