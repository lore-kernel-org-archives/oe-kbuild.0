Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2372E2DC2
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946175; cv=none; b=KtcTf3Piwnm4na3pl0RvCTo1JeUTw9d6AW+BV3FWXPt8rbZ9fQxbdZTnaH8Wf5mDZmKnNmVToT9hCYCoTeZx68oizI6ssF0wfhzC1xBi9TEpnLM3sgJo487nIyE/OpclN5b/U71bWVumV9zWBDEuHSUEdfMe2uh08IXV5SX7MnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946175; c=relaxed/simple;
	bh=u6La4fPhxdRvHQrycGmUwhZBGEy5ZTBtMzcso4yrqWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=by+jO1ES5A/Yj4OgSJla0V5baMnl0yjcAk7pOORvEdu1O8Q8K1riqlIS/DvUcN42Ze72Tn6gus8IpqpPZbT/rSbfBM7/VLD1mzZ/LIVOkBCWB6Il9zPq1HQzdXW45Yl5jx6v9Ducih1z3Gt7kN02kdcd2TCXV4DQf8SywN/+Zas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLcbfVRl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLcbfVRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754946171; x=1786482171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6La4fPhxdRvHQrycGmUwhZBGEy5ZTBtMzcso4yrqWc=;
  b=bLcbfVRl/wgg55EJNJMB0VTQUFoQRv6ZQ6Jf62tpE8/+wN8EJEiL2Vt8
   MO3TeTcTRuwNzDpf/lj67v2t7FDet9Tdopmei8Y9qvBZdWpY4qXhj+/DK
   K0SCbcTeMlThLqSO/OZcTYFw0+pmw54AAdQwe3qolabExIWIT2Tu7N9EQ
   9HtRCl8bl0/1pntyDA+R6cugDtIEsgwDSXzd/kGv7RaB976LAzBoRkYIl
   C2sTda2BMKy/J8a1AqNnvCNpvZFihLapVDUJzc7ZJFa1DV2J27Tn5pY5W
   iH8mbjdueUX4xcTWtr/BmCd83jv5T1Fykm7f93oAIZYrU2BYg9hpYIbF9
   g==;
X-CSE-ConnectionGUID: Aq0FkFD+SuC1sqSLMMQARg==
X-CSE-MsgGUID: f9zkqPOHTkadgurIeMwGyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68579861"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68579861"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:02:50 -0700
X-CSE-ConnectionGUID: w9oKvfFiTkKnyvJ+YVCIJA==
X-CSE-MsgGUID: wu9QXhR5QviS/JXQ3qkBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166010564"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 14:02:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZf0-0006Do-0L;
	Mon, 11 Aug 2025 21:02:33 +0000
Date: Tue, 12 Aug 2025 05:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 520/801]
 arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@41100
 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
Message-ID: <202508120417.ElYXHeD3-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 7ee87ca83a902fd3a37a40a9813974fc620c63d3 [520/801] dt-bindings: powerpc: Convert fsl/fsl,mpic-global-timer to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250812/202508120417.ElYXHeD3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120417.ElYXHeD3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508120417.ElYXHeD3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e2000 (fsl,p5040-rcpm): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t4240-serdes']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t4240-serdes']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
