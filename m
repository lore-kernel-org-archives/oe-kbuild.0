Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E1204866
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752922650; cv=none; b=QbH04rJDrvhuRi6aukcyk6CybqsgvXkMzqlp7GhyjyxnNK+ituDIoJlNmqkSgWE4I6D8EJaFeqQyoSmROIjON0poJTzgEGZKYb2TGcTl9hjV/Z0onOM0BOVGQQgxEpppPIW0QBzBHlZIxZRGU/GrDpDraD0MUwLwWtMJ/GlccJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752922650; c=relaxed/simple;
	bh=6CRVX0jBsGrHno3v6Nh/B7J/ieOzj15mBVe7E3geEJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OHw6lg2g3avN0NvWfbBcN3x1xYwHW/w2A7WRpLBLobrieXmsbbZg1vMRyzehfo95DHS9NrfDEawzjbKzn0dUW8UxFkZ62/qU+o4GUIq/b8nS9YKKTvI+HlmQy5JkrKzJa5dfgsvWC/PHTG274HMMo7xu3E+37p6bqzsIrEAtRpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1uHOXVQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1uHOXVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752922649; x=1784458649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6CRVX0jBsGrHno3v6Nh/B7J/ieOzj15mBVe7E3geEJU=;
  b=C1uHOXVQWlKEM7Xhs0miAyi3wRDbsd3jv71lZcoB1616OvuRUdXofP4W
   VfHKRDhLUIzNamDkXjd2tijuzaFgnlGWg+z5X5E1sQqLrU0I/7Y/L3+zn
   t0f1kMJC3J7B9XQcgtSOxQPQtIJkgCjk1KSPqUYUKVEeqiyC4EmoeDm7D
   SAqlfgEBmpCKTiauIs5cjCFXdSZqicKnK2bVRXnY5otRQJ6BNXsdv3Zbq
   xNQjsKvEEF5cxt1zgF3KfwX1XXa3bF5Hk9fzZEI20EglAsWbOu2lOUUQ8
   phqmLAMFHwNlgUdlde0BNL/ipiFhWIBrAcCGnRpugEmzlTuu250b9aIJF
   w==;
X-CSE-ConnectionGUID: A9WJV9ztQPab9f3zekpSOQ==
X-CSE-MsgGUID: 3i8eU8heTNOFrAvcb+ByDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55324733"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="55324733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 03:57:28 -0700
X-CSE-ConnectionGUID: 2/95IleRR9KAo3BkI2ykUw==
X-CSE-MsgGUID: Qf6eYA6zRBuhMNEwuA/L5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="158970580"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 19 Jul 2025 03:57:27 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud5Ft-00014f-0c;
	Sat, 19 Jul 2025 10:57:25 +0000
Date: Sat, 19 Jul 2025 12:56:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:imx93-ethos-v2 1/49]
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram):
 '#address-cells' is a required property
Message-ID: <202507191235.RRPwmGPD-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   b81e8ee214f77950479c304b6ca560903de46c7c
commit: 1f35d31a5ed42adab761956e74307404cac1dedb [1/49] arm64: dts: imx93: Add Ethos-U65 NPU node
:::::: branch date: 4 days ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250719/202507191235.RRPwmGPD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191235.RRPwmGPD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507191235.RRPwmGPD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts:247.10-258.6: Warning (graph_child_address): /soc@0/bus@44000000/i2c@44340000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:430.10-441.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:463.10-474.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@51/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts:458.9-469.5: Warning (graph_child_address): /soc@0/bus@42000000/i2c@426b0000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
