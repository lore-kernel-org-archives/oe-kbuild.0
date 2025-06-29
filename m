Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306A864A8F
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751182382; cv=none; b=DjEQEEOBhtVef7Lc0wtsMLDCHV5MQbkTSRHAjc9IxA6mrGPlfr5uWVqnlqRFeeZFTrcCSsENCzhbGA2ZE+lwZYLVwGBqC7BwUPI5rMzbenwnyhpz+gE+J90Dis679nL/MKMxA0IOiGkC9yLEr49zdmbB5ka+u6PJzG9eyF2bisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751182382; c=relaxed/simple;
	bh=ggEGe9t/F5JW+GBf6KjbXogemk1I+mfPe3etnE0HQgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwvcunm25Q3xxlGwkiDNSJtilkVGXneY1OXlbaOG3+XsNSjHBLfLSXPdIBTnE6K/N05shHYvXT9riLxkjBA+2lj3xitUOqU0qnOKF5Dp6qhP8xERM3VDCMIfOuwSsDgaMqcSiC68BrK4M5axG+aeadR5BoaI43InRAkwWIAZJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgR9WS3V; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgR9WS3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751182380; x=1782718380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggEGe9t/F5JW+GBf6KjbXogemk1I+mfPe3etnE0HQgM=;
  b=AgR9WS3V4KmpN18Vpxin2IrGU11NDdwlc46x9OHHZ/9S6yUt8kTjPuxD
   MlHktFMaIa1je74xlFFSP3MHOB4aJsic4iTXPwO7bdzS30kmMWBLySmbi
   5CvMP+vdS2t7rBb2Y9b9ev+1/WTw3+N+VuIRn45s+Adex25BkzwWDfxVK
   Yj2m5S0f31NoW0A4zpgd47o7RtFsaPshRgJPzF891ei6lYUiO4q6jliZw
   lej8EsXxqSAfnW3WYqfr7Y6UqePvpa9I0zlaiUmjdTvOT2em4u8zgyofz
   6B16wZM9odCr4NvRsHwIAFj2TsVM9ZMviUZalKQcLLw9Vv5jadckJYWLH
   g==;
X-CSE-ConnectionGUID: xIg3WH66RqObWSk2xjkF8Q==
X-CSE-MsgGUID: IiDgKjoxRF2Wa3POp5+eFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57235947"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="57235947"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 00:32:59 -0700
X-CSE-ConnectionGUID: KV6T77QWQRKbYzRvu/1Lbg==
X-CSE-MsgGUID: 4lAVYD8WRkWgk4fdAoZu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="184201221"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2025 00:32:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVmX1-000Xku-2l;
	Sun, 29 Jun 2025 07:32:55 +0000
Date: Sun, 29 Jun 2025 15:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:imx93-ethos-v2 1/3]
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram):
 '#address-cells' is a required property
Message-ID: <202506291525.y3Um0b5P-lkp@intel.com>
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
head:   e9ec6ae1b117158f2361317ce2bac44bc9731d77
commit: 1f35d31a5ed42adab761956e74307404cac1dedb [1/3] arm64: dts: imx93: Add Ethos-U65 NPU node
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250629/202506291525.y3Um0b5P-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291525.y3Um0b5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506291525.y3Um0b5P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts:247.10-258.6: Warning (graph_child_address): /soc@0/bus@44000000/i2c@44340000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:430.10-441.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:463.10-474.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@51/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts:458.9-469.5: Warning (graph_child_address): /soc@0/bus@42000000/i2c@426b0000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']
--
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
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
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
