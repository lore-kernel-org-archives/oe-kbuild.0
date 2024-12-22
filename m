Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF7816BE3A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734855645; cv=none; b=fQaqWpuQu5oSH3ecLPPCNUu79L7qHDDpCPzfzAV63hrO3IM5X0OP1X8/1s2umQFLPkusg6Uer+jZ8beo4w+QYtvlsblgC7QRAMmeDhzp8KnYmJoyreOxQMoTWX1ZO424coFOKdbdxFdXvzMHmTL+GSd65gJ2V3PITLkvjxaYp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734855645; c=relaxed/simple;
	bh=ufinCBcVuvunQdQwq3EIY6nVlzTpALrA4vE0nnThIUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqDam1ztC/9x8s4a4IQqeF5al5jN8d1yYB/arctiEO2Kqr2wGB4nsg4eBjpVEZe2STpRwwEtKmG0dZ4Sf4jF+OWAtqqoZDLYGYt9UDsZTdb9T4gTym00cix24iySx/eE22simDrSaaylT09q9yNauByKvBowASeBn1Q/Vdpod54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4Qsn5UJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4Qsn5UJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734855643; x=1766391643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufinCBcVuvunQdQwq3EIY6nVlzTpALrA4vE0nnThIUY=;
  b=d4Qsn5UJK3r4BKneXVvHwS65lRkr0erGt6IGsOuSDhWeCAmhsDzDV/ee
   VuqdDOV0M5QByr/UlQRNo/JMoxo3SjdAzrIrMXb+JVwqyZ6MnvQGuSuZV
   8yZUjVLgbY8aEClTI5zLv5DSwqEY4vnhVWdx0khYDbj6lL5VVdCm1y6+x
   pG1341OMbCQzL3S0w/sVld+gOhF0dGYwGqqTwvTKAZH+N7Wa4gw3fv9Dm
   igpwPP6lFpMBylryVFRbX+89YEVOG7KbISKIh9SMemL6XomlPtNLqyDh8
   C/8Nmtsmveu27PV1XnKrgvMVT3iHQlbP/AVix/XJqoDkdX9bj18Dd6AEN
   g==;
X-CSE-ConnectionGUID: bCyc49g9SL2VTOfnsUpiBg==
X-CSE-MsgGUID: O22guH8dTRetXHcnvmWhkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39288041"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39288041"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 00:20:40 -0800
X-CSE-ConnectionGUID: t/PobkqCT0u6gcXLclO5Pg==
X-CSE-MsgGUID: pOflOcySR9qSWOheDdb8eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136251283"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2024 00:20:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPHCX-0002nv-14;
	Sun, 22 Dec 2024 08:20:37 +0000
Date: Sun, 22 Dec 2024 16:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
Message-ID: <202412221635.ngzoFAm3-lkp@intel.com>
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
In-Reply-To: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
References: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
TO: Yuanfang Zhang <quic_yuanfang@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: kernel@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Yuanfang Zhang <quic_yuanfang@quicinc.com>

Hi Yuanfang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanfang-Zhang/arm64-dts-qcom-Add-coresight-node-for-SM8650/20241210-162552
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc%40quicinc.com
patch subject: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-052-20241221 (https://download.01.org/0day-ci/archive/20241222/202412221635.ngzoFAm3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221635.ngzoFAm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221635.ngzoFAm3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10b04000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10b04000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@10b04000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10b04000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
