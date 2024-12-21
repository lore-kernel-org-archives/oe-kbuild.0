Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFE31DD885
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734824402; cv=none; b=enUk633wm1PCDnMr66EKj5M35QHXMB5QeYN5BNULmvVQ55EZa25wXIQVwtX4QMceIiB5+YQmLeCLkWWXHYgzghk/uHpr2oef34Xh/EOMLll6ZXPZoopYAzJR1CgDLLJpMfV26sWX9k2XW2uM2mPhfq2BF3YtJsAcP6R8dIIa/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734824402; c=relaxed/simple;
	bh=2vXq6mR1d8hbzFzc3DTXk2yboJxWokOpjJhPVBP0paU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hjiofKBInCMw8Voc9yavkx0GXEgMVxrFIQf3cqKcQUaas7gdNDTNbdqo/K/UsQXSwWcBbvASavuj7IpvLxOLo+7LW5aJ0q2eNkQFdGqPzXdh+yE5N+tAzfL01sM6XdV856UukoQIxypo9aL25g/peW3ahBax6iJdCijZe9rkGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwJnyJ7h; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwJnyJ7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734824401; x=1766360401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2vXq6mR1d8hbzFzc3DTXk2yboJxWokOpjJhPVBP0paU=;
  b=CwJnyJ7hjfvziFNPCgjGKjAQ8QgDsw9ovflz2LAVBNrw6YwzkG2w65zA
   hmweqqfNfOWB1Zx8NHrBKvidwjswTqS385Lmumi/LLk2b5MtLOW2Rxvb5
   vi1GfY+2G+B22Xdv/FBVQ/7nWbuYlRbm7VuOnApwwaBXwZWT2I0arJ5S0
   JLMkrswuOJi7jzRYoVtb14iVq7NAq8kAkyuhatDgdO1HteGO+rKC9g9h/
   JqU+ku6H15vhKlDQnaY6p3qxhc85xb2Okr9j+W2p7zCmxpYZ2nSTEu0gN
   xKbntPCMV1H6tUWs1L0jYaZz4Zg6EGfSIlZCIlNrq0eE8us1wn1C3zKjs
   Q==;
X-CSE-ConnectionGUID: eXgAgJk9TvCSYk1bef28uQ==
X-CSE-MsgGUID: F+LhpHKKRhKOpjO8KfZ7mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35227784"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35227784"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 15:39:58 -0800
X-CSE-ConnectionGUID: DDu1lMlnQtuuPcasFOeD6g==
X-CSE-MsgGUID: 6FGqAGFkRX29OmgZdL/FUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122141125"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 15:39:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP94c-0002ZB-1I;
	Sat, 21 Dec 2024 23:39:54 +0000
Date: Sun, 22 Dec 2024 07:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
Message-ID: <202412220750.f7OWKRBf-lkp@intel.com>
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
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220750.f7OWKRBf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220750.f7OWKRBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220750.f7OWKRBf-lkp@intel.com/

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
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: funnel@10b04000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: funnel@10b04000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: soc@0: funnel_ete: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: soc@0: ete0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: ete0: 'qcom,skip-power-up' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel_ete: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@13810000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@13810000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10042000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10042000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10b04000: in-ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: funnel@10b04000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
