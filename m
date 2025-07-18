Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F037D515
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752800616; cv=none; b=I6+rWCNaluQCseAFLErCCV1unapKRiRyzKKXqf2UflTUQ/NCFfNtFXJcLJsFimvRa2i+XIqWR4UT5bHB5Hqf66O54kYbhWOsgI7ZcRQek6Oa6QQ+MUxIAcJhUxpvFI8WpSQLETH4tYZW4eR+074s+P1A/GgZ1QMCJi6lU0mUD9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752800616; c=relaxed/simple;
	bh=PtJZ19qHLI4XJbbb1L22dyWSb4oW8BADFErHLgOziWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YFarqNy51DhZWA2hQhE5X2FKt5xrN/xBKFCI8hKhD4OojjxpwcNLdmAVMN8oCFSoQHcb0HdpOpcPOclGvEBhlAAwwprVO7FKeFf8qDHgpOswkoBpYmqtvelHTSRnX2mSZN6t8K+9pOvRGhx/aoSxqSOxRnF0MV2cU+KoBNaspuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7eiGpPj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7eiGpPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752800614; x=1784336614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PtJZ19qHLI4XJbbb1L22dyWSb4oW8BADFErHLgOziWE=;
  b=M7eiGpPjHkU1qCwdduUZrLqrUqPMC2BpnQAE+EyG6O492LCifeu9jqbK
   /Ti6eFTtJf6nhnvVbVlBxDtlwMX4C/nQCKtSLj4mjU0X1cvk/ZU/T5uzN
   onaJHHxJwaLfmX7DORmh1jwvMPHW0lleitdcGeOLYHqF1ucLWeNDl8GW7
   gNsH8+yLP3cDnHuulk+RShYzdfKI3snegIDHdflVHmNMIUKQyXrCuQKi8
   bVhDhKWajGIudnMEaNreMTf34ftzvVyN63xJ7iQIL7h0J5uC9cEdnVnw7
   MA4Xi02NFhPMKoEG9lPRkz6Rg6rXG1D7JN2hYQcpMk40cxC6ki2XaK8r0
   w==;
X-CSE-ConnectionGUID: vLygtppGQ5u79YtL1xAFRg==
X-CSE-MsgGUID: YavEL5YKQn2gEDL1eYOyVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72544076"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72544076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:03:33 -0700
X-CSE-ConnectionGUID: rCPq4ZGTSamWWkPAgqnHEw==
X-CSE-MsgGUID: Z/sENuYxRcyC45TmWHD4zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="163569703"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 17 Jul 2025 18:03:33 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucZVa-0000oX-1L;
	Fri, 18 Jul 2025 01:03:30 +0000
Date: Fri, 18 Jul 2025 03:02:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:imx93-ethos-v2 1/49]
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram):
 '#size-cells' is a required property
Message-ID: <202507180325.OnZqDcaN-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-2052-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180325.OnZqDcaN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180325.OnZqDcaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507180325.OnZqDcaN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts:247.10-258.6: Warning (graph_child_address): /soc@0/bus@44000000/i2c@44340000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:430.10-441.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:463.10-474.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@51/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts:458.9-469.5: Warning (graph_child_address): /soc@0/bus@42000000/i2c@426b0000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
