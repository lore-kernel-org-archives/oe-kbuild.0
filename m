Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098A518B0F
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 04:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768364395; cv=none; b=hDecfFF/Pbj4eaElxR8eegzRWrAOm8m84glbrGsRPKgwrDINTsLYpvd6KmmBIDyqFuLN0GeldyccL89ohiXiSHQ/DH3ytB9STnzEjNF9BJ3EHihxCLWMr9ClyVdr2IIuf1VedDj6x6OmPcfA63sdpzFNESRA/aNLq45qUA+Ctqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768364395; c=relaxed/simple;
	bh=S0pcfB+Z0/e3b9dmFQtUrD5uAkYcOQoEtdyA0vnUBBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XXTuxlxr0h7n6pT9h0zRua6wQoT60GjG1/BmZugnHN0dTY78twqTL+HuLAqHpw340yg+a11f34lIPJivX6kNyduTqnFyD2kkQT5SFIZQ45Y8t3X2TrQHuQwiFDGSu86COqsh11hrCBdLH+RpZj+bpuX+jZRurxC4ulBM8tJ1s3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+2PU8Jn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+2PU8Jn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768364394; x=1799900394;
  h=date:from:to:cc:subject:message-id;
  bh=S0pcfB+Z0/e3b9dmFQtUrD5uAkYcOQoEtdyA0vnUBBk=;
  b=Z+2PU8JnxYE5ZqPCj3MzBs9M5+biCBXW+I/Sq7ZScO4+2LWB0U0uaNAH
   /yz8W5QlkP60KpQHvBJtNUfE9Tgn6yale744cRcUSiaL5QvYDf2N1+Sy6
   BN9pK1vHFmGME8QozEHJUCH3/OL2SiZZgEI+v6OLVOGJK+j1rHzITP7ow
   DFrXxdgV/fWl6P8EWOAMZuFTwaj9KZPzyblG5/4cQjQ4apakAY4bPRcml
   7/ydti/aF4t958tHUhRFnq6d8pzfVY8SXVQo9vvLK2XNt3QLV2VJC/dfy
   atN0FU/uUe9jyKpC3ffcs9rHqhlleQZxs8AETGE4/3jGXwd1+1crLB7/U
   g==;
X-CSE-ConnectionGUID: VoFrvkinTTyAY9mb6Z+rvQ==
X-CSE-MsgGUID: MVOOCRX9RXWq4sM2XtZBcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69709872"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69709872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 20:19:53 -0800
X-CSE-ConnectionGUID: 2nVHdldgTeuEaw6hp6D6dw==
X-CSE-MsgGUID: MXbjJ+BmTG2myLgTuEkMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="205138274"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 20:19:52 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfsMI-000000001Ib-2GPe;
	Wed, 14 Jan 2026 04:19:50 +0000
Date: Wed, 14 Jan 2026 05:19:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 6/14]
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: pinctrl@40086000
 (nxp,lpc1850-scu): ssp-pins:ssp1_cs_cfg: Unevaluated properties are not
 allowed ('bias-disable', 'bias-pull-up' were unexpected)
Message-ID: <202601140518.FmGSi5Yd-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 1ed6a1e08e61d88da8aaee79dae0f5fdb1963218 [6/14] dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-2053-20260112 (https://download.01.org/0day-ci/archive/20260114/202601140518.FmGSi5Yd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140518.FmGSi5Yd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140518.FmGSi5Yd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml
>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: pinctrl@40086000 (nxp,lpc1850-scu): ssp-pins:ssp1_cs_cfg: Unevaluated properties are not allowed ('bias-disable', 'bias-pull-up' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml
--
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:274.9-277.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi:642.24-665.5: Warning (unique_unit_address_if_enabled): /soc/usb@110f8800: duplicate unit-address (also used in node /soc/phy@110f8800)
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: / (mikrotik,rb3011): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: pinmux@800000 (qcom,ipq8064-pinctrl): leds-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-down', 'drive-strength', 'function', 'output-low', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,ipq8064-pinctrl.yaml
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: pinmux@800000 (qcom,ipq8064-pinctrl): buttons-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,ipq8064-pinctrl.yaml
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: syscon@3000000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800 (qcom,ipq8064-dwc3): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800 (qcom,ipq8064-dwc3): 'interrupt-names' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
