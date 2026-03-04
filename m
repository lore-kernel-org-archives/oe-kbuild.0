Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8993B2F60B2
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 02:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772592448; cv=none; b=sDcLqhW+5+g4v5gm0jGGpSVGlXiKB2zhEdfubhPuzpLaD49Du/og3IfpGhK1fqMvui6Qc+FMMdV2hPL4lqwJ3CQn0nR6GacX7V9YbDRZre5iKMz0i5RJQGe5bQ2RF9FUIH0IaPbWPO6MqaSgJpPBqAOHXboihHuBfvVXNg7CU4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772592448; c=relaxed/simple;
	bh=Asj5DfG2BbtQWic1wjX4xa8wRWnQ2UV38/vqe402oTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HEIbuHoN5/HMv+9ab8hD4rNbt0i3wdgVQpKOQJG8V9DxPUPTMIFL73CDf6cJQchJAjWGhGBUI74V2AvEZEcCsg5bvBJlebbJMwa71NwmFuQp6EBh8StOb3zD/hsJ3MeHvRdFQmgSJiArMcpQyst84vNSwqj0YQoEbIlbSsWKVM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeNC1wkP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeNC1wkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772592446; x=1804128446;
  h=date:from:to:cc:subject:message-id;
  bh=Asj5DfG2BbtQWic1wjX4xa8wRWnQ2UV38/vqe402oTw=;
  b=GeNC1wkPs3KcePmd4K7sbTwm2MVw3Mzq60TIGfcdm7gRdmBUB1DZdLMz
   Nva8dJJdadEM6XKiXrG182+Mo7UEhBY11/kn9zPDqcnARQoDfKHxaddD6
   vflUyR4Ess9KrYlhng/MQjw9h6JA8EdVcTIZkFEEXfeHsC1IiRsl/T/8l
   Rh2KAZz4QqJX69ihZ4lnaaZRCueq/+uOuvH7lZx5rw5y0xKfYA2VBjElX
   foXQaisEsGWhSmBHhjBji2K+wYL1Bb2Mv31Hyy+z3Oo1vJ4BHmswI7H2q
   0YNMmAVNV4pqKy3VNgWC0UKaF9iMNPKo47JSBT8D0soU0ShXcIuR+7Mp6
   Q==;
X-CSE-ConnectionGUID: mrSKQpTfTseZhr2M+JQZtw==
X-CSE-MsgGUID: B1gNmf6VTliLYAVMBvxYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84737334"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="84737334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 18:47:25 -0800
X-CSE-ConnectionGUID: Z6m2WVYNROqa5Y5jLP+93g==
X-CSE-MsgGUID: biemfw9TSByNaxrkRNcgSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="218157261"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 03 Mar 2026 18:47:24 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxcGg-000000001bJ-0b5c;
	Wed, 04 Mar 2026 02:47:22 +0000
Date: Wed, 04 Mar 2026 03:46:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bluetooth-next:master 15/84]
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: bluetooth
 (qcom,qca6174-bt): Unevaluated properties are not allowed
 ('interrupt-parent', 'interrupts' were unexpected)
Message-ID: <202603040353.Mnk4ru8f-lkp@intel.com>
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
CC: linux-bluetooth@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   50003ce2085a7f7dacf2426065d1a69c84b5b963
commit: 68f3769ce01631eb6710b811e2dc5d767b76c5b6 [15/84] dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
:::::: branch date: 30 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-2051-20260301 (https://download.01.org/0day-ci/archive/20260304/202603040353.Mnk4ru8f-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040353.Mnk4ru8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603040353.Mnk4ru8f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,am33xx-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: bluetooth (qcom,qca6174-bt): Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,qca2066-bt.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
