Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3011A38F9
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239206; cv=none; b=N0njP2+Op+8dpVA2o5Pf9fEsovMxhgJp8NAWa7ckgnKNKJdRRF+H51VSbjOWggr0TkM82yHylT8PoGO/WtA0Tu7WzZWE2Lc51amkLQMkrSgXe7walyAmChgC2vCEqkfnnD/TtroO+X9jtkizwRd4QrY46mQbqoQgjujE/1HGItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239206; c=relaxed/simple;
	bh=PYt5UrQkyi9cbUOHzyQvoYhozq+/TSq82YZ/T8vbbjM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=clYn8hlW+Q76XL+O3BZJ4LR/IaW200UTeYHhZdcovhf7zh09x1j559wfST6KMbBg7GgJ9eaeuY1fynFGm12LtWKl6mp0c4ms+vxEny0LqO9g/HjAa642j2R5H6JevkF+6mVdxD+2Gsp/he7/RgBQ4QJ2xH7hUzQwHuvdD3LemSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdFXNhmn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdFXNhmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781239204; x=1812775204;
  h=date:from:to:cc:subject:message-id;
  bh=PYt5UrQkyi9cbUOHzyQvoYhozq+/TSq82YZ/T8vbbjM=;
  b=HdFXNhmn2lAIIJN1D5y1ZLdvawsRIAxagr2atB3aIIyUT58S8emmzvGS
   Eq9ZuKWr+Olz3um/hJmMuReSMd5RzHfWnJuX+NzmA5Y5Ij8XWuk42pvlk
   8VUtNaTNi+8EtIPo0PrlDLYFMMYau0JY50eIY/3CGOc9IpL4IOIGDVzh/
   4XDIW3IVI+CFUH8YOKPJivdZxzaWa6QMPONxT/pMy1iaZqmFyNC5b8kK6
   z6jR0b+dutEszwVYmSiPuabFEs2gS+BODhOeVgwNksjrlVJYnecZHo/sd
   gCWUjwSChMQy0iXCwT8KKAW/4YJsYoRUQ+qexAbOoRyRj9e0SNtLcj6hS
   w==;
X-CSE-ConnectionGUID: fWmzgT0jRS6UZIujFLtevg==
X-CSE-MsgGUID: yfAQJ9JiQuqUq5eDq5rzhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82051713"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82051713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:40:04 -0700
X-CSE-ConnectionGUID: /70yzCIHQC2Aoc+TvMeHyg==
X-CSE-MsgGUID: h2IF5KUITqq3kMD8/9grRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="248604965"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2026 21:40:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtgW-000000004Cz-2bt6;
	Fri, 12 Jun 2026 04:40:00 +0000
Date: Fri, 12 Jun 2026 06:40:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/marvell/dove-cubox.dtb: cpu@0
 (marvell,pj4a): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202606120655.r6Hmkwb8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 0220405d7e09955195164292d3938a0bcbdd6924 dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2053-20260610 (https://download.01.org/0day-ci/archive/20260612/202606120655.r6Hmkwb8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120655.r6Hmkwb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0220405d7e09 ("dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606120655.r6Hmkwb8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove-cubox.dtb: / (solidrun,cubox): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/marvell/dove-cubox.dtb: cpu@0 (marvell,pj4a): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pj4a', 'marvell,sheeva-v7'] is too long
   	'marvell,pj4a' is not one of ['qcom,kryo', 'qcom,oryon']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/marvell/dove-cubox.dtb: /gpu-subsystem: failed to match any schema with compatible: ['marvell,dove-gpu-subsystem']
   arch/arm/boot/dts/marvell/dove-cubox.dtb: mbus (marvell,dove-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576], [8388608, 4026662912, 0, 16777216], [4294959104, 50397184, 0, 2048], [4294963200, 218103808, 0, 2048]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-cubox.dtb: mbus (marvell,dove-mbus): pcie:ranges: [[2181038080, 0, 262144, 4026597376, 262144, 0, 8192], [2181038080, 0, 524288, 4026597376, 524288, 0, 8192], [2181038080, 1, 0, 82313216, 0, 1, 0], [2164260864, 1, 0, 81788928, 0, 1, 0], [2181038080, 2, 0, 149422080, 0, 1, 0], [2164260864, 2, 0, 148897792, 0, 1, 0]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-cubox.dtb: mbus (marvell,dove-mbus): $nodename:0: 'mbus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: / (solidrun,cubox-es): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/marvell/dove-cubox-es.dtb: cpu@0 (marvell,pj4a): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pj4a', 'marvell,sheeva-v7'] is too long
   	'marvell,pj4a' is not one of ['qcom,kryo', 'qcom,oryon']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: /gpu-subsystem: failed to match any schema with compatible: ['marvell,dove-gpu-subsystem']
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: mbus (marvell,dove-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576], [8388608, 4026662912, 0, 16777216], [4294959104, 50397184, 0, 2048], [4294963200, 218103808, 0, 2048]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: mbus (marvell,dove-mbus): pcie:ranges: [[2181038080, 0, 262144, 4026597376, 262144, 0, 8192], [2181038080, 0, 524288, 4026597376, 524288, 0, 8192], [2181038080, 1, 0, 82313216, 0, 1, 0], [2164260864, 1, 0, 81788928, 0, 1, 0], [2181038080, 2, 0, 149422080, 0, 1, 0], [2164260864, 2, 0, 148897792, 0, 1, 0]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-cubox-es.dtb: mbus (marvell,dove-mbus): $nodename:0: 'mbus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: / (globalscale,d2plug): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/marvell/dove-d2plug.dtb: cpu@0 (marvell,pj4a): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pj4a', 'marvell,sheeva-v7'] is too long
   	'marvell,pj4a' is not one of ['qcom,kryo', 'qcom,oryon']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: /gpu-subsystem: failed to match any schema with compatible: ['marvell,dove-gpu-subsystem']
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: mbus (marvell,dove-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576], [8388608, 4026662912, 0, 16777216], [4294959104, 50397184, 0, 2048], [4294963200, 218103808, 0, 2048]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: mbus (marvell,dove-mbus): pcie:ranges: [[2181038080, 0, 262144, 4026597376, 262144, 0, 8192], [2181038080, 0, 524288, 4026597376, 524288, 0, 8192], [2181038080, 1, 0, 82313216, 0, 1, 0], [2164260864, 1, 0, 81788928, 0, 1, 0], [2181038080, 2, 0, 149422080, 0, 1, 0], [2164260864, 2, 0, 148897792, 0, 1, 0]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-d2plug.dtb: mbus (marvell,dove-mbus): $nodename:0: 'mbus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: / (globalscale,d3plug): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/marvell/dove-d3plug.dtb: cpu@0 (marvell,pj4a): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pj4a', 'marvell,sheeva-v7'] is too long
   	'marvell,pj4a' is not one of ['qcom,kryo', 'qcom,oryon']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: /gpu-subsystem: failed to match any schema with compatible: ['marvell,dove-gpu-subsystem']
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: mbus (marvell,dove-mbus): pcie:ranges: [[2181038080, 0, 262144, 4026597376, 262144, 0, 8192], [2181038080, 0, 524288, 4026597376, 524288, 0, 8192], [2181038080, 1, 0, 82313216, 0, 1, 0], [2164260864, 1, 0, 81788928, 0, 1, 0], [2181038080, 2, 0, 149422080, 0, 1, 0], [2164260864, 2, 0, 148897792, 0, 1, 0]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: mbus (marvell,dove-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576], [8388608, 4026662912, 0, 16777216], [4294959104, 50397184, 0, 2048], [4294963200, 218103808, 0, 2048]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-d3plug.dtb: mbus (marvell,dove-mbus): $nodename:0: 'mbus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: / (marvell,dove-db): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/marvell/dove-dove-db.dtb: cpu@0 (marvell,pj4a): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pj4a', 'marvell,sheeva-v7'] is too long
   	'marvell,pj4a' is not one of ['qcom,kryo', 'qcom,oryon']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: /gpu-subsystem: failed to match any schema with compatible: ['marvell,dove-gpu-subsystem']
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: mbus (marvell,dove-mbus): pcie:ranges: [[2181038080, 0, 262144, 4026597376, 262144, 0, 8192], [2181038080, 0, 524288, 4026597376, 524288, 0, 8192], [2181038080, 1, 0, 82313216, 0, 1, 0], [2164260864, 1, 0, 81788928, 0, 1, 0], [2181038080, 2, 0, 149422080, 0, 1, 0], [2164260864, 2, 0, 148897792, 0, 1, 0]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: mbus (marvell,dove-mbus): internal-regs:ranges: [[0, 4026597376, 0, 1048576], [8388608, 4026662912, 0, 16777216], [4294959104, 50397184, 0, 2048], [4294963200, 218103808, 0, 2048]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/marvell/dove-dove-db.dtb: mbus (marvell,dove-mbus): $nodename:0: 'mbus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:128.5-131.31: Warning (interrupt_map): /mbus/pcie/pcie@1:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@1/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove.dtsi:157.5-160.31: Warning (interrupt_map): /mbus/pcie/pcie@2:interrupt-map: Missing property '#address-cells' in node /mbus/pcie/pcie@2/interrupt-controller, using 0 as fallback
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: / (compulab,sbc-a510): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: cpu@0 (marvell,pj4a): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pj4a', 'marvell,sheeva-v7'] is too long
   	'marvell,pj4a' is not one of ['qcom,kryo', 'qcom,oryon']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: /gpu-subsystem: failed to match any schema with compatible: ['marvell,dove-gpu-subsystem']
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: video@39 (ti,tfp410): 'powerdown-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,tfp410.yaml
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: video@39 (ti,tfp410): 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,tfp410.yaml
   arch/arm/boot/dts/marvell/dove-sbc-a510.dtb: mbus (marvell,dove-mbus): pcie:ranges: [[2181038080, 0, 262144, 4026597376, 262144, 0, 8192], [2181038080, 0, 524288, 4026597376, 524288, 0, 8192], [2181038080, 1, 0, 82313216, 0, 1, 0], [2164260864, 1, 0, 81788928, 0, 1, 0], [2181038080, 2, 0, 149422080, 0, 1, 0], [2164260864, 2, 0, 148897792, 0, 1, 0]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
