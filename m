Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CAD198E75
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 22:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742855135; cv=none; b=PJGg1upMHxkX6t22gWmNGz1YDijO2tWvBj2ALPwM9ymLuo/t6AGlWm2HZ+lFFuaq7eIv1L0s9/JxhqPB8Nn6+5H8fpVv4buxkCJQ1dIgGaPAB5kt+ekFEqgYrHQWEGkbp666IVUQ/GPhssWYM2YjTSpK8TZUAl34QluTnQxVL4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742855135; c=relaxed/simple;
	bh=3f5RoQmTiNSODNGUvrhpYlLiNPoumNkQFE0NjEPu1bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hug9Nww4FEaebIPRI5haxwlrFbIvxy7sQElIU574Dde8nEUuiKYInKuDIWYxW72GnQlR4+XoE9y5tlK6vINZhNMvULWJ9efSMGusgyB9J79ceMT7EJXc8V2CUxBRzFAPq+zSLllC4HCX1B9t7tGaUWyzNwwTGWCwUg+3NpScw18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDWYYkin; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDWYYkin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742855133; x=1774391133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3f5RoQmTiNSODNGUvrhpYlLiNPoumNkQFE0NjEPu1bc=;
  b=dDWYYkin/BbWiFJB1n/UElsWjZtscImGOSeTyYFpBoIOASu1HisWsaCs
   f094mnxvqkdgLVWePenWhZWYRkgpbxo3jkaXuLVYtMhif+2sar1+VGI55
   nyL0iTeuerTD+h0qHJiLH2DhUE+SLR40ztHyM7i7vHYU66JAfHA0VXFXi
   MLR5UTkHEDGO8SIVGfhq74FWUokO4Wov7g9Phh6FapO0Ju+WGaiU3RAVz
   9tjGWNH/GeyUpBfYfhwcO/MQXV5orRbualzyE2pHPmKEZFB27h7IqFc5n
   Vc25ZMeYpXS3rE3me1xEsDeNGLEiF337vDtzG+XeqioF6DRFd3Jq9zqN2
   Q==;
X-CSE-ConnectionGUID: lba/sHotQVOK4q5D3KWypw==
X-CSE-MsgGUID: OqYfvCzMQiyu8IgDmrXPyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44007114"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="44007114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 15:25:32 -0700
X-CSE-ConnectionGUID: jGr5XFtbRiSXL9ZYw8hvNg==
X-CSE-MsgGUID: 08wCtyTDSZq+pvQqYC3SAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="124352572"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2025 15:25:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twqEa-0003yU-2K;
	Mon, 24 Mar 2025 22:25:28 +0000
Date: Tue, 25 Mar 2025 06:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-24-2 1/12]
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: clock-names:
 ['core', 'ref'] is too short
Message-ID: <202503250651.SzwmMD4y-lkp@intel.com>
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
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-24-2
head:   5f601bd5077af7c023128274b4e3699332bce44d
commit: 9be20fffb687dabc4e237ac3488ceb8d3a597938 [1/12] dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
:::::: branch date: 18 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-052-20250324 (https://download.01.org/0day-ci/archive/20250325/202503250651.SzwmMD4y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250651.SzwmMD4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503250651.SzwmMD4y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1128.12-1138.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1157.12-1167.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1186.12-1196.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1215.12-1225.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1244.12-1254.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1273.12-1283.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1302.12-1312.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1331.12-1341.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1934.10-1944.6: Warning (graph_child_address): /soc/display@feb00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1961.12-1971.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: pcie@e65d8000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
