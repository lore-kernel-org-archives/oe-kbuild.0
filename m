Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9D2F855
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 01:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731894827; cv=none; b=jrqqHHCf9m1fzMFk8cNb7pUtMROvu4q3A2QDO7uqf8ULvGDCBCzHIwq9THVkGspsm7PSVlHng3yPRkmWcFnrYYkbH2FYkZz7xpHiTpv9g5Qvo+q/b56C96hTQkdJDhc+UTZQ33sujpxuSdlpdQNVHOTWEtFnhv4yj1GPx0W1Cnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731894827; c=relaxed/simple;
	bh=H6ZB/ADlLUU+x7sZ8a9GKVq71CVLJ+/VYgSOQuU8TKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLEznDeTvJwPZKo02uabVI0Urebzv9ynsiFHk0RKyTuSVH8wiLC6+4590mOLSlq0M9aEjLxbnEWmeyY52KFAsg5HXmOpqQsSS/EUK0ty6G2lI6IGZKA/KmQC0nUEYQUaESFN36ZiDCuihIqGAyCzlqzuWPjFn7IRPMDIeEaejT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djRAY3gJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djRAY3gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731894825; x=1763430825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6ZB/ADlLUU+x7sZ8a9GKVq71CVLJ+/VYgSOQuU8TKU=;
  b=djRAY3gJkvzahokZ3NEc0xPkpQ+aCquccjNAzJ0LjEhngoq2d67b87CE
   LnMRRad6EX6sEMoI6OKMnOTlcVs5dQ4eOdt/DuOyyjkfZs4s4xlIgbaBd
   jmTBkqfL9ws3hTzjqcinJkWBdLcG+ezm5QpY3C+vox6X1Uy3qV+Ijf0S1
   cxG0qc2Hxa3jAis0Wj3NbUPTNl9wLMK1WTuJKs7zhtBv3PdQwuaDF0iDv
   KlNZKTty2unz6Ijq+1QuL4giXEOp64y2DrKyMjSSbpI49+Nxra68n8b00
   22Y0ggxrEuegwvX1c/QIZUm4quj8v2x7PbPd78NT+CfMHCNbVOlK8O4sE
   A==;
X-CSE-ConnectionGUID: NBmZ5qJQRt25Gu9ICMhLNQ==
X-CSE-MsgGUID: boTQIPCpQ6+SEGovOu2puA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49362903"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="49362903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:53:42 -0800
X-CSE-ConnectionGUID: zz2eMvsxSU63aKqIW5a2KA==
X-CSE-MsgGUID: vzg4zs5PTImBzeXj0KwY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120025906"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2024 17:53:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqxP-0002CT-1D;
	Mon, 18 Nov 2024 01:53:39 +0000
Date: Mon, 18 Nov 2024 09:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: freescale: Remove unused and undocumented
 "cooling-(min|max)-state" properties
Message-ID: <202411180925.URdzXqPu-lkp@intel.com>
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
In-Reply-To: <20241115193504.3619533-1-robh@kernel.org>
References: <20241115193504.3619533-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.12]
[cannot apply to shawnguo/for-next next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-freescale-Remove-unused-and-undocumented-cooling-min-max-state-properties/20241117-000213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241115193504.3619533-1-robh%40kernel.org
patch subject: [PATCH] arm64: dts: freescale: Remove unused and undocumented "cooling-(min|max)-state" properties
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180925.URdzXqPu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180925.URdzXqPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411180925.URdzXqPu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fan-temperature-ctrlr@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/pcie@3400000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/pcie@3500000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/pcie@3600000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/pcie@3700000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/pcie@3800000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/pcie@3900000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: msi-parent:0: [51, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fan-temperature-ctrlr@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/pcie@3400000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/pcie@3500000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/pcie@3600000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/pcie@3700000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/pcie@3800000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/pcie@3900000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: msi-parent:0: [51, 0] is too long
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
