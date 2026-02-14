Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA64C16EB42
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 03:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771040158; cv=none; b=bYTbaKtJkQCiRLk5oPWUbYpZni4YQCNdT8K//DztekSKki+r6UydC4w1NoqJUfh3W46nz+JGiYudTQUTUbJG1DPWJG/K/LtMhE1j8MkWgFIZzvxrgn6j8KA4UQV5+SOExy7Mlwc4yqCv7Hw/ltb640SkLU8GmrlfyQDBc2ghMlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771040158; c=relaxed/simple;
	bh=oif+GCu71XimgVAYvTGVZd25g5bfDsZT9ntqx5PMis8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dYinydOWruutpgZSbS/W752B02RauhLT5ESnVpRJEq/vHNl12AxrmExypDM2pU/IXVxOxsuDAFF98r3MjdcI6N9uxVKLYtfhZP/UQqiLieEGp2QH6a7AMVHONhxPvG7JbW9AITEHkPFW2+HFVwCUyDkEZ+Vwg1HEyloUom7KXyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmoGFmHf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmoGFmHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771040156; x=1802576156;
  h=date:from:to:cc:subject:message-id;
  bh=oif+GCu71XimgVAYvTGVZd25g5bfDsZT9ntqx5PMis8=;
  b=ZmoGFmHfOo3A0NCXvjv/qNrPx+q1R/GYXyViL9bmGVC26htDrWT3qj5e
   xCeI4eewKCqro/t8KDpN04MChex3Ta3cysQUVS35dS7hN4ia/C/nx2iH0
   Mq3rcoDLnguPug+Bxh1uU0nqcMB0zkJHdEDzKfYVik/HPlKg54ygLMJkp
   KKYFdxEXGKUJml9v3kpL97u6Pc/K69YLxnr6wVzLn9QW9AmH0YlqqB98v
   /yrhEgOBH3ZvoGbBqX/xfd/6eshviGldLjmuUKkxfQfnc29zKVQsq/1yS
   3HvO6IfC7EIsnSyFP3Ks/uv1LfgqdauOkCoyqfyQvc46R5nbTVH1nMjWT
   A==;
X-CSE-ConnectionGUID: 6igSa1M5TpWbz7MjdD1Gqw==
X-CSE-MsgGUID: QpqZBl0RTm+IGfkFVh4fBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72293950"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72293950"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 19:35:55 -0800
X-CSE-ConnectionGUID: V68Pva/4SDy6h8dvvB6a6Q==
X-CSE-MsgGUID: e0RpoHtfQjOreJPIzarbfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212488169"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2026 19:35:54 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr6Rj-000000001k9-3Eyo;
	Sat, 14 Feb 2026 03:35:51 +0000
Date: Sat, 14 Feb 2026 04:35:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 1/25]
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: lcdc@0 (ti,am33xx-tilcdc):
 port:endpoint@0: 'reg' is a required property
Message-ID: <202602140407.oEtFkGEG-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   e8bd92c4a0d2ee0fe8ee2b33c94dcffb3a39749b
commit: e88bb45cf742177a18d63d306be345a294b4c1db [1/25] dt-bindings: display: tilcdc: Convert to DT schema
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-2053-20260212 (https://download.01.org/0day-ci/archive/20260214/202602140407.oEtFkGEG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140407.oEtFkGEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602140407.oEtFkGEG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: lcdc@0 (ti,am33xx-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: lcdc@0 (ti,am33xx-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: lcdc@0 (ti,am33xx-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@48000000/segment@200000/target-module@0/mpu@0: failed to match any schema with compatible: ['ti,omap3-mpu']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@48000000/segment@300000/target-module@0/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@48000000/segment@300000/target-module@2000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@48000000/segment@300000/target-module@4000/epwmss@0: failed to match any schema with compatible: ['ti,am33xx-pwmss']
>> arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: lcdc@0 (ti,am33xx-tilcdc): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@47c00000: failed to match any schema with compatible: ['ti,am33xx-l4-fw', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,am33xx-l4-fast', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
