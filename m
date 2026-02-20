Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06B2701C4
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771553520; cv=none; b=XTFxvtzqcCy7o9YY45qyhalzXAPJT3TZJGP1B1vxOxHeYB+v9yO6ED2HuIPAimbq7RwxOvfYUonusrVItITj4/Fr4xEDNylmVDDZYzT8XuKyN1WiMLfySHAYDZp7uDko/tDCmIgUbDuy5mjDGmBjfqucIrDWhqEnuGUd2h9gQ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771553520; c=relaxed/simple;
	bh=1knujgcQFpOvGaDYJgd+inv+hd1t9yY4anzYPGmqpW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHbbD7jv4aJAcDXvnoOAZty3DrWSxrKHCgHE4hQqCB+2Nl02TUrH/EzHDLKh8ra2h+u2zHCUY828GUGlIIlfT/N19DqQYasHowMEiScfCJ3HsvN5+4e/8FhcRP8g4cYeWAPKtHGL7arI64ZaG9nq4JIHOvU/nYUyy2CC7hUjfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUXoWlmC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUXoWlmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771553509; x=1803089509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1knujgcQFpOvGaDYJgd+inv+hd1t9yY4anzYPGmqpW0=;
  b=WUXoWlmCsj5g2IlX8UIDuWDjBTsh9q+2tGOICpxdICiTsDfwUZLQdmgH
   bBVryfrOqdZrnLzE5DMCcBxkG5/UmwFqGI4639JWfgYHrq34ZjwubiGIy
   vKQAWIefduG2hWwll5j65u8AP6zIES42va4KpM1E71WomVl9rOtOCjVyv
   fBAONI89q9KdO8eAyePNf+9hq3nH4TPuAiPYPrNTNBw+YrejHYHaNqXRS
   m6Ws2Cy7BN3qsGSltEp/s3jADIgTdXJslY6JBX0r9F3VzV24necConWTX
   Z92B5twXblWjbOWLAPG4finjef5v4K3megrzg+OKnsUmckzLKPfhFNghq
   g==;
X-CSE-ConnectionGUID: CJE9R2Y1TeW2fT3pRb7Uow==
X-CSE-MsgGUID: JUDZfNMHS/y6HgEVEdeFMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72693583"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72693583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 18:11:49 -0800
X-CSE-ConnectionGUID: Cg5kqyLmQqOaU3+5TQ66pA==
X-CSE-MsgGUID: xx2IU698SzuYXREASyt2jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="245302973"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 18:11:47 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtFzb-00000000473-3Axt;
	Fri, 20 Feb 2026 02:11:43 +0000
Date: Fri, 20 Feb 2026 03:11:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property
Message-ID: <202602200330.drBI6rOP-lkp@intel.com>
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
In-Reply-To: <20260217173457.18628-2-akhilrajeev@nvidia.com>
References: <20260217173457.18628-2-akhilrajeev@nvidia.com>
TO: Akhil R <akhilrajeev@nvidia.com>
TO: dmaengine@vger.kernel.org
TO: linux-tegra@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: vkoul@kernel.org
CC: Frank.Li@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: thierry.reding@gmail.com
CC: jonathanh@nvidia.com
CC: p.zabel@pengutronix.de
CC: Akhil R <akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next tegra/for-next linus/master v6.16-rc1 next-20260218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-dma-nvidia-tegra186-gpc-dma-Add-iommu-map-property/20260218-014114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260217173457.18628-2-akhilrajeev%40nvidia.com
patch subject: [PATCH 1/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add iommu-map property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20260218 (https://download.01.org/0day-ci/archive/20260220/202602200330.drBI6rOP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200330.drBI6rOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602200330.drBI6rOP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:476.25-485.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1, 768, 109, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1, 768, 109, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8103.dtsi:476.25-485.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:487.26-491.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 109, 1, 1, 512, 110, 1, 1, 768, 111, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 109, 1, 1, 512, 110, 1, 1, 768, 111, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8103.dtsi:476.25-485.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1, 768, 109, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1, 768, 109, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8103.dtsi:476.25-485.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1, 768, 109, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1, 768, 109, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8103.dtsi:476.25-485.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 107, 1, 1, 512, 108, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 70, 1, 1, 512, 71, 1, 1, 768, 72, 1, 1, 1024, 73, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 86, 1, 1, 512, 87, 1, 1, 768, 88, 1, 1, 1024, 89, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: pcie@590000000 (apple,t6000-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: pcie@590000000 (apple,t6000-pcie): iommu-map:0: [256, 86, 1, 1, 512, 87, 1, 1, 768, 88, 1, 1, 1024, 89, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 72, 1, 1, 512, 73, 1, 1, 768, 74, 1, 1, 1024, 75, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 90, 1, 1, 512, 91, 1, 1, 768, 92, 1, 1, 1024, 93, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: pcie@580000000 (apple,t6020-pcie): iommu-map:0: [256, 90, 1, 1, 512, 91, 1, 1, 768, 92, 1, 1, 1024, 93, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 107, 0, 1, 512, 108, 1, 1, 768, 109, 2, 1, 1024, 110, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 107, 0, 1, 512, 108, 1, 1, 768, 109, 2, 1, 1024, 110, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 107, 0, 1, 512, 108, 1, 1, 768, 109, 2, 1, 1024, 110, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 107, 0, 1, 512, 108, 1, 1, 768, 109, 2, 1, 1024, 110, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 107, 0, 1, 512, 108, 1, 1, 768, 109, 2, 1, 1024, 110, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 107, 0, 1, 512, 108, 1, 1, 768, 109, 2, 1, 1024, 110, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:502.26-506.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 109, 0, 1, 512, 110, 1, 1, 768, 111, 2, 1, 1024, 112, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0', 'pci@3,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: pcie@690000000 (apple,t8112-pcie): iommu-map:0: [256, 109, 0, 1, 512, 110, 1, 1, 768, 111, 2, 1, 1024, 112, 3, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 16, 1, 256, 80, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges', 'supports-clkreq', 'vpcie3v3aux-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 16, 1, 256, 80, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 24, 1, 256, 80, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 24, 1, 256, 80, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 80, 32, 1, 16, 80, 33, 1, 32, 80, 34, 1, 64, 80, 35, 1, 80, 80, 37, 1, 96, 80, 38, 1, 128, 80, 36, 1, 192, 80, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 80, 32, 1, 16, 80, 33, 1, 32, 80, 34, 1, 64, 80, 35, 1, 80, 80, 37, 1, 96, 80, 38, 1, 128, 80, 36, 1, 192, 80, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 80, 32, 1, 16, 80, 33, 1, 32, 80, 34, 1, 64, 80, 35, 1, 80, 80, 37, 1, 96, 80, 38, 1, 128, 80, 36, 1, 192, 80, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 16, 1, 256, 85, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges', 'supports-clkreq', 'vpcie3v3aux-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 16, 1, 256, 85, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 24, 1, 256, 85, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-viewport', 'ranges', 'vpcie3v3aux-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 24, 1, 256, 85, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:55.18-58.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 86, 16, 1, 256, 86, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges', 'supports-clkreq', 'vpcie3v3aux-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 86, 16, 1, 256, 86, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 86, 24, 1, 256, 86, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c380000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-viewport', 'ranges', 'vpcie3v3aux-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 86, 24, 1, 256, 86, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 86, 32, 1, 16, 86, 33, 1, 32, 86, 34, 1, 64, 86, 35, 1, 128, 86, 36, 1, 144, 86, 37, 1, 160, 86, 38, 1, 192, 86, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 86, 32, 1, 16, 86, 33, 1, 32, 86, 34, 1, 64, 86, 35, 1, 128, 86, 36, 1, 144, 86, 37, 1, 160, 86, 38, 1, 192, 86, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 86, 32, 1, 16, 86, 33, 1, 32, 86, 34, 1, 64, 86, 35, 1, 128, 86, 36, 1, 144, 86, 37, 1, 160, 86, 38, 1, 192, 86, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 94, 16, 1, 256, 94, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 94, 16, 1, 256, 94, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 94, 24, 1, 256, 94, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4c380000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-viewport', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 94, 24, 1, 256, 94, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 94, 32, 1, 16, 94, 33, 1, 32, 94, 34, 1, 64, 94, 35, 1, 128, 94, 36, 1, 144, 94, 37, 1, 160, 94, 38, 1, 192, 94, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 94, 32, 1, 16, 94, 33, 1, 32, 94, 34, 1, 64, 94, 35, 1, 128, 94, 36, 1, 144, 94, 37, 1, 160, 94, 38, 1, 192, 94, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 94, 32, 1, 16, 94, 33, 1, 32, 94, 34, 1, 64, 94, 35, 1, 128, 94, 36, 1, 144, 94, 37, 1, 160, 94, 38, 1, 192, 94, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi:288.9-300.5: Warning (graph_child_address): /soc/bus@42000000/i2c@42530000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 78, 16, 1, 256, 78, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 78, 16, 1, 256, 78, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 78, 24, 1, 256, 78, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-viewport', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 78, 24, 1, 256, 78, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 78, 32, 1, 16, 78, 33, 1, 32, 78, 34, 1, 64, 78, 35, 1, 128, 78, 36, 1, 144, 78, 37, 1, 160, 78, 38, 1, 192, 78, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 78, 32, 1, 16, 78, 33, 1, 32, 78, 34, 1, 64, 78, 35, 1, 128, 78, 36, 1, 144, 78, 37, 1, 160, 78, 38, 1, 192, 78, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 78, 32, 1, 16, 78, 33, 1, 32, 78, 34, 1, 64, 78, 35, 1, 128, 78, 36, 1, 144, 78, 37, 1, 160, 78, 38, 1, 192, 78, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 74, 16, 1, 256, 74, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 74, 16, 1, 256, 74, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 74, 24, 1, 256, 74, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4c380000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-viewport', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 74, 24, 1, 256, 74, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 74, 32, 1, 16, 74, 33, 1, 32, 74, 34, 1, 64, 74, 35, 1, 128, 74, 36, 1, 144, 74, 37, 1, 160, 74, 38, 1, 192, 74, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 74, 32, 1, 16, 74, 33, 1, 32, 74, 34, 1, 64, 74, 35, 1, 128, 74, 36, 1, 144, 74, 37, 1, 160, 74, 38, 1, 192, 74, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 74, 32, 1, 16, 74, 33, 1, 32, 74, 34, 1, 64, 74, 35, 1, 128, 74, 36, 1, 144, 74, 37, 1, 160, 74, 38, 1, 192, 74, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 67, 16, 1, 256, 67, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 67, 16, 1, 256, 67, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 67, 24, 1, 256, 67, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-viewport', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 67, 24, 1, 256, 67, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 67, 32, 1, 16, 67, 33, 1, 32, 67, 34, 1, 64, 67, 35, 1, 128, 67, 36, 1, 144, 67, 37, 1, 160, 67, 38, 1, 192, 67, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 67, 32, 1, 16, 67, 33, 1, 32, 67, 34, 1, 64, 67, 35, 1, 128, 67, 36, 1, 144, 67, 37, 1, 160, 67, 38, 1, 192, 67, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 67, 32, 1, 16, 67, 33, 1, 32, 67, 34, 1, 64, 67, 35, 1, 128, 67, 36, 1, 144, 67, 37, 1, 160, 67, 38, 1, 192, 67, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 16, 1, 256, 80, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 16, 1, 256, 80, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 24, 1, 256, 80, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 80, 24, 1, 256, 80, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 80, 32, 1, 16, 80, 33, 1, 32, 80, 34, 1, 64, 80, 35, 1, 80, 80, 37, 1, 96, 80, 38, 1, 128, 80, 36, 1, 192, 80, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 80, 32, 1, 16, 80, 33, 1, 32, 80, 34, 1, 64, 80, 35, 1, 80, 80, 37, 1, 96, 80, 38, 1, 128, 80, 36, 1, 192, 80, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 80, 32, 1, 16, 80, 33, 1, 32, 80, 34, 1, 64, 80, 35, 1, 80, 80, 37, 1, 96, 80, 38, 1, 128, 80, 36, 1, 192, 80, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 16, 1, 256, 85, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 16, 1, 256, 85, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 24, 1, 256, 85, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4c380000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-viewport', 'ranges', 'vpcie3v3aux-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 24, 1, 256, 85, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 16, 1, 256, 85, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4c300000 (fsl,imx95-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'linux,pci-domain', 'msi-map', 'num-viewport', 'ranges', 'supports-clkreq', 'vpcie3v3aux-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4c300000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 16, 1, 256, 85, 17, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 24, 1, 256, 85, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4c380000 (fsl,imx95-pcie): iommu-map:0: [0, 85, 24, 1, 256, 85, 25, 7] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000:iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: system-controller@4cde0000 (nxp,imx95-netc-blk-ctrl): pcie@4ca00000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,netc-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'ethernet@0,0', 'ethernet@10,0', 'ethernet@18,0', 'ethernet@8,0', 'msi-map' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: pcie@4ca00000 (pci-host-ecam-generic): iommu-map:0: [0, 85, 32, 1, 16, 85, 33, 1, 32, 85, 34, 1, 64, 85, 35, 1, 128, 85, 36, 1, 144, 85, 37, 1, 160, 85, 38, 1, 192, 85, 39, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 37, 1152, 32, 256, 37, 1184, 32, 512, 37, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 37, 1152, 32, 256, 37, 1184, 32, 512, 37, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts:158.10-187.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 45, 1152, 32, 256, 45, 1184, 32, 512, 45, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 45, 1152, 32, 256, 45, 1184, 32, 512, 45, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pinctrl (marvell,armada-8k-cpm-pinctrl): 'copper-eth-phy-reset' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 48, 1152, 32, 256, 48, 1184, 32, 512, 48, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pcie@f2600000 (marvell,armada8k-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'num-lanes', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 48, 1152, 32, 256, 48, 1184, 32, 512, 48, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
--
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 34, 1152, 32, 256, 34, 1184, 32, 512, 34, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: pcie@f2600000 (marvell,armada8k-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'num-lanes', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 34, 1152, 32, 256, 34, 1184, 32, 512, 34, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp0-usb3-0-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp1-usb3-0-phy (usb-nop-xceiv): '#phy-cells' is a required property
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 38, 1152, 32, 256, 38, 1184, 32, 512, 38, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: pcie@f2600000 (marvell,armada8k-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'num-lanes', 'num-viewport', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 38, 1152, 32, 256, 38, 1184, 32, 512, 38, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
--
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 36, 1152, 32, 256, 36, 1184, 32, 512, 36, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: pcie@f2600000 (marvell,armada8k-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'num-lanes', 'num-viewport', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 36, 1152, 32, 256, 36, 1184, 32, 512, 36, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
--
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: thermal-zones: ap-cpu1-thermal:cooling-maps: 'fan-map' does not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 42, 1152, 32, 256, 42, 1184, 32, 512, 42, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: pcie@f2600000 (marvell,armada8k-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'num-lanes', 'num-viewport', 'ranges', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 42, 1152, 32, 256, 42, 1184, 32, 512, 42, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@500000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@510000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 60, 1152, 32, 256, 60, 1184, 32, 512, 60, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: pcie@f2600000 (marvell,armada8k-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'num-lanes', 'num-viewport', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 60, 1152, 32, 256, 60, 1184, 32, 512, 60, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 60, 1152, 32, 256, 60, 1184, 32, 512, 60, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: pcie@f2600000 (marvell,armada8k-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'iommu-map-mask', 'num-lanes', 'num-viewport', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: pcie@f2600000 (marvell,armada8k-pcie): iommu-map:0: [0, 60, 1152, 32, 256, 60, 1184, 32, 512, 60, 1216, 32] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
--
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: host1x@13e00000 (nvidia,tegra186-host1x): iommu-map:0: [0, 6, 56, 1, 1, 6, 57, 1, 2, 6, 58, 1, 3, 6, 59, 1, 4, 6, 60, 1, 5, 6, 61, 1, 6, 6, 62, 1, 7, 6, 63, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
--
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: host1x@13e00000 (nvidia,tegra186-host1x): iommu-map:0: [0, 6, 56, 1, 1, 6, 57, 1, 2, 6, 58, 1, 3, 6, 59, 1, 4, 6, 60, 1, 5, 6, 61, 1, 6, 6, 62, 1, 7, 6, 63, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts:2148.12-2159.8: Warning (graph_child_address): /bus@0/i2c@c240000/typec@8/connector@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvidia,tegra194-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvidia,tegra194-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: host1x@13e00000 (nvidia,tegra194-host1x): iommu-map:0: [0, 8, 56, 1, 1, 8, 57, 1, 2, 8, 58, 1, 3, 8, 59, 1, 4, 8, 60, 1, 5, 8, 61, 1, 6, 8, 62, 1, 7, 8, 63, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['maxim,max20024']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: host1x@13e00000 (nvidia,tegra194-host1x): iommu-map:0: [0, 8, 56, 1, 1, 8, 57, 1, 2, 8, 58, 1, 3, 8, 59, 1, 4, 8, 60, 1, 5, 8, 61, 1, 6, 8, 62, 1, 7, 8, 63, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['maxim,max20024']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: host1x@13e00000 (nvidia,tegra234-host1x): iommu-map:0: [0, 4, 53, 1, 1, 4, 54, 1, 2, 4, 55, 1, 3, 4, 56, 1, 4, 4, 57, 1, 5, 4, 58, 1, 6, 4, 59, 1, 7, 4, 60, 1, 8, 238, 53, 1, 9, 238, 54, 1, 10, 238, 55, 1, 11, 238, 56, 1, 12, 238, 57, 1, 13, 238, 58, 1, 14, 238, 59, 1, 15, 238, 60, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): phy-mode: ['10gbase-r'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: host1x@13e00000 (nvidia,tegra234-host1x): iommu-map:0: [0, 4, 53, 1, 1, 4, 54, 1, 2, 4, 55, 1, 3, 4, 56, 1, 4, 4, 57, 1, 5, 4, 58, 1, 6, 4, 59, 1, 7, 4, 60, 1, 8, 243, 53, 1, 9, 243, 54, 1, 10, 243, 55, 1, 11, 243, 56, 1, 12, 243, 57, 1, 13, 243, 58, 1, 14, 243, 59, 1, 15, 243, 60, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: host1x@13e00000 (nvidia,tegra234-host1x): iommu-map:0: [0, 4, 53, 1, 1, 4, 54, 1, 2, 4, 55, 1, 3, 4, 56, 1, 4, 4, 57, 1, 5, 4, 58, 1, 6, 4, 59, 1, 7, 4, 60, 1, 8, 243, 53, 1, 9, 243, 54, 1, 10, 243, 55, 1, 11, 243, 56, 1, 12, 243, 57, 1, 13, 243, 58, 1, 14, 243, 59, 1, 15, 243, 60, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: host1x@13e00000 (nvidia,tegra234-host1x): iommu-map:0: [0, 4, 53, 1, 1, 4, 54, 1, 2, 4, 55, 1, 3, 4, 56, 1, 4, 4, 57, 1, 5, 4, 58, 1, 6, 4, 59, 1, 7, 4, 60, 1, 8, 240, 53, 1, 9, 240, 54, 1, 10, 240, 55, 1, 11, 240, 56, 1, 12, 240, 57, 1, 13, 240, 58, 1, 14, 240, 59, 1, 15, 240, 60, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sar2130p.dtsi:2219.27-2294.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sar2130p.dtsi:2315.27-2371.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c00000 (qcom,sar2130p-pcie): iommu-map:0: [0, 32, 7168, 1, 256, 32, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c00000 (qcom,sar2130p-pcie): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c00000 (qcom,sar2130p-pcie): iommu-map:0: [0, 32, 7168, 1, 256, 32, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c08000 (qcom,sar2130p-pcie): iommu-map:0: [0, 32, 7680, 1, 256, 32, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c08000 (qcom,sar2130p-pcie): iommu-map:0: [0, 32, 7680, 1, 256, 32, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4880.28-4943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4964.28-5018.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 0, 1, 256, 321, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 0, 1, 256, 321, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 128, 1, 256, 321, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: pcie@1c10000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 128, 1, 256, 321, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7168, 1, 256, 68, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7168, 1, 256, 68, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7296, 1, 256, 68, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7296, 1, 256, 68, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c00000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/talos.dtsi:3890.27-3953.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pcie@1c08000 (qcom,pcie-qcs615): iommu-map:0: [0, 54, 1024, 1, 256, 54, 1025, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pcie@1c08000 (qcom,pcie-qcs615): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'max-link-speed', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pcie@1c08000 (qcom,pcie-qcs615): iommu-map:0: [0, 54, 1024, 1, 256, 54, 1025, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: pcie@1c00000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[385, 386]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[385, 386]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3964.27-4019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c08000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4880.28-4943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4964.28-5018.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 0, 1, 256, 338, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 0, 1, 256, 338, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 128, 1, 256, 338, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 128, 1, 256, 338, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4880.28-4943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4964.28-5018.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 0, 1, 256, 338, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 0, 1, 256, 338, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 128, 1, 256, 338, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 338, 128, 1, 256, 338, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c08000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c10000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3970.27-4044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4065.27-4120.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c00000 (qcom,pcie-sm8150): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4880.28-4943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4964.28-5018.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 0, 1, 256, 339, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 0, 1, 256, 339, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 128, 1, 256, 339, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 128, 1, 256, 339, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4880.28-4943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4964.28-5018.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 0, 1, 256, 339, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 0, 1, 256, 339, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 128, 1, 256, 339, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 339, 128, 1, 256, 339, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c00000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7552, 1, 256, 45, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c00000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7552, 1, 256, 45, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c08000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7680, 1, 256, 45, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c08000 (qcom,pcie-sc8180x): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c08000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7680, 1, 256, 45, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c10000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c10000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c18000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7424, 1, 256, 45, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: pcie@1c18000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7424, 1, 256, 45, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c00000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7552, 1, 256, 45, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c00000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7552, 1, 256, 45, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c08000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7680, 1, 256, 45, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c08000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7680, 1, 256, 45, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c10000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c10000 (qcom,pcie-sc8180x): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c10000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c18000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7424, 1, 256, 45, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: pcie@1c18000 (qcom,pcie-sc8180x): iommu-map:0: [0, 45, 7424, 1, 256, 45, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4727.27-4782.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pcie@1c00000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pcie@1c08000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4727.27-4782.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 51, 7184, 1, 256, 51, 7185, 1, 512, 51, 7186, 1, 768, 51, 7187, 1, 1024, 51, 7188, 1, 1280, 51, 7189, 1, 1536, 51, 7190, 1, 1792, 51, 7191, 1, 2048, 51, 7192, 1, 2304, 51, 7193, 1, 2560, 51, 7194, 1, 2816, 51, 7195, 1, 3072, 51, 7196, 1, 3328, 51, 7197, 1, 3584, 51, 7198, 1, 3840, 51, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 51, 7184, 1, 256, 51, 7185, 1, 512, 51, 7186, 1, 768, 51, 7187, 1, 1024, 51, 7188, 1, 1280, 51, 7189, 1, 1536, 51, 7190, 1, 1792, 51, 7191, 1, 2048, 51, 7192, 1, 2304, 51, 7193, 1, 2560, 51, 7194, 1, 2816, 51, 7195, 1, 3072, 51, 7196, 1, 3328, 51, 7197, 1, 3584, 51, 7198, 1, 3840, 51, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 51, 7168, 1, 256, 51, 7169, 1, 512, 51, 7170, 1, 768, 51, 7171, 1, 1024, 51, 7172, 1, 1280, 51, 7173, 1, 1536, 51, 7174, 1, 1792, 51, 7175, 1, 2048, 51, 7176, 1, 2304, 51, 7177, 1, 2560, 51, 7178, 1, 2816, 51, 7179, 1, 3072, 51, 7180, 1, 3328, 51, 7181, 1, 3584, 51, 7182, 1, 3840, 51, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 51, 7168, 1, 256, 51, 7169, 1, 512, 51, 7170, 1, 768, 51, 7171, 1, 1024, 51, 7172, 1, 1280, 51, 7173, 1, 1536, 51, 7174, 1, 1792, 51, 7175, 1, 2048, 51, 7176, 1, 2304, 51, 7177, 1, 2560, 51, 7178, 1, 2816, 51, 7179, 1, 3072, 51, 7180, 1, 3328, 51, 7181, 1, 3584, 51, 7182, 1, 3840, 51, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4727.27-4782.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pcie@1c00000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pcie@1c08000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): compatible:0: 'samsung,sofef00' is not one of ['samsung,sofef00-ams601nt22', 'samsung,sofef00-ams628nw01']
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): compatible: ['samsung,sofef00'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 52, 7184, 1, 256, 52, 7185, 1, 512, 52, 7186, 1, 768, 52, 7187, 1, 1024, 52, 7188, 1, 1280, 52, 7189, 1, 1536, 52, 7190, 1, 1792, 52, 7191, 1, 2048, 52, 7192, 1, 2304, 52, 7193, 1, 2560, 52, 7194, 1, 2816, 52, 7195, 1, 3072, 52, 7196, 1, 3328, 52, 7197, 1, 3584, 52, 7198, 1, 3840, 52, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 52, 7184, 1, 256, 52, 7185, 1, 512, 52, 7186, 1, 768, 52, 7187, 1, 1024, 52, 7188, 1, 1280, 52, 7189, 1, 1536, 52, 7190, 1, 1792, 52, 7191, 1, 2048, 52, 7192, 1, 2304, 52, 7193, 1, 2560, 52, 7194, 1, 2816, 52, 7195, 1, 3072, 52, 7196, 1, 3328, 52, 7197, 1, 3584, 52, 7198, 1, 3840, 52, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 52, 7168, 1, 256, 52, 7169, 1, 512, 52, 7170, 1, 768, 52, 7171, 1, 1024, 52, 7172, 1, 1280, 52, 7173, 1, 1536, 52, 7174, 1, 1792, 52, 7175, 1, 2048, 52, 7176, 1, 2304, 52, 7177, 1, 2560, 52, 7178, 1, 2816, 52, 7179, 1, 3072, 52, 7180, 1, 3328, 52, 7181, 1, 3584, 52, 7182, 1, 3840, 52, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 52, 7168, 1, 256, 52, 7169, 1, 512, 52, 7170, 1, 768, 52, 7171, 1, 1024, 52, 7172, 1, 1280, 52, 7173, 1, 1536, 52, 7174, 1, 1792, 52, 7175, 1, 2048, 52, 7176, 1, 2304, 52, 7177, 1, 2560, 52, 7178, 1, 2816, 52, 7179, 1, 3072, 52, 7180, 1, 3328, 52, 7181, 1, 3584, 52, 7182, 1, 3840, 52, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: touchscreen@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1562.21-1582.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@894000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: touchscreen@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:470.25-491.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['jdi,fhd-nt35596s']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4727.27-4782.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4727.27-4782.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4727.27-4782.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7168, 1, 256, 68, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7168, 1, 256, 68, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7296, 1, 256, 68, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 68, 7296, 1, 256, 68, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3970.27-4044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4065.27-4120.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3970.27-4044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4065.27-4120.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3970.27-4044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4065.27-4120.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7552, 1, 256, 43, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 43, 7680, 1, 256, 43, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3970.27-4044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4065.27-4120.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7552, 1, 256, 44, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7552, 1, 256, 44, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7680, 1, 256, 44, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7680, 1, 256, 44, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3970.27-4044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4065.27-4120.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7552, 1, 256, 44, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7552, 1, 256, 44, 7553, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7680, 1, 256, 44, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: pcie@1c08000 (qcom,pcie-sm8150): iommu-map:0: [0, 44, 7680, 1, 256, 44, 7681, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7168, 1, 256, 50, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7168, 1, 256, 50, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7296, 1, 256, 50, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7296, 1, 256, 50, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7424, 1, 256, 50, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c10000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7424, 1, 256, 50, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7168, 1, 256, 50, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7168, 1, 256, 50, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7296, 1, 256, 50, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7296, 1, 256, 50, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7424, 1, 256, 50, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c10000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 50, 7424, 1, 256, 50, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:739.9-750.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:739.9-750.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4851.27-4926.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7168, 1, 256, 45, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8350): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7168, 1, 256, 45, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8350): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7168, 1, 256, 45, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7168, 1, 256, 45, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7168, 1, 256, 45, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7168, 1, 256, 45, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 45, 7296, 1, 256, 45, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7168, 1, 256, 46, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7168, 1, 256, 46, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7296, 1, 256, 46, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7296, 1, 256, 46, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7168, 1, 256, 46, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7168, 1, 256, 46, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7296, 1, 256, 46, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: pcie@1c08000 (qcom,pcie-sm8350): iommu-map:0: [0, 46, 7296, 1, 256, 46, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3533.27-3606.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3627.27-3681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'max-link-speed', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3533.27-3606.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3627.27-3681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3533.27-3606.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3627.27-3681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3533.27-3606.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3627.27-3681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'max-link-speed', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3533.27-3606.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3627.27-3681.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'max-link-speed', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 65, 7168, 1, 256, 65, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: pcie@1c08000 (qcom,pcie-sm8450-pcie1): iommu-map:0: [0, 65, 7296, 1, 256, 65, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3869.27-3943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3964.27-4019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3964.27-4019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3964.27-4019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with compatible: ['samsung,s5k3m5']
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3869.27-3943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3964.27-4019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3869.27-3943.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3964.27-4019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5086.22-5177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5511.27-5586.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5608.27-5664.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8650): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8650): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5086.22-5177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5608.27-5664.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8650): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8650): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5086.22-5177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5608.27-5664.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8650): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8750): iommu-map:0: [0, 36, 5120, 1, 256, 36, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8750): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'power-domains', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8750): iommu-map:0: [0, 36, 5120, 1, 256, 36, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8750): iommu-map:0: [0, 36, 5120, 1, 256, 36, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pcie@1c00000 (qcom,pcie-sm8750): iommu-map:0: [0, 36, 5120, 1, 256, 36, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 0, 1, 256, 321, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 0, 1, 256, 321, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 128, 1, 256, 321, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: pcie@1c10000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 128, 1, 256, 321, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 0, 1, 256, 321, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 0, 1, 256, 321, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 128, 1, 256, 321, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: pcie@1c10000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-16gts', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: pcie@1c10000 (qcom,pcie-sa8775p): iommu-map:0: [0, 321, 128, 1, 256, 321, 129, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[385, 386]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[385, 386]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7168, 1, 256, 66, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 66, 7296, 1, 256, 66, 7297, 1, 520, 66, 7300, 1, 528, 66, 7301, 1, 536, 66, 7302, 1, 768, 66, 7303, 1, 1024, 66, 7304, 1, 1280, 66, 7305, 1, 1281, 66, 7312, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[385, 386]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[385, 386]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
--
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7296, 1, 256, 49, 7297, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c10000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: pcie@1c10000 (qcom,pcie-sm8250): iommu-map:0: [0, 49, 7424, 1, 256, 49, 7425, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7184, 1, 256, 49, 7185, 1, 512, 49, 7186, 1, 768, 49, 7187, 1, 1024, 49, 7188, 1, 1280, 49, 7189, 1, 1536, 49, 7190, 1, 1792, 49, 7191, 1, 2048, 49, 7192, 1, 2304, 49, 7193, 1, 2560, 49, 7194, 1, 2816, 49, 7195, 1, 3072, 49, 7196, 1, 3328, 49, 7197, 1, 3584, 49, 7198, 1, 3840, 49, 7199, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sdm845): iommu-map:0: [0, 49, 7168, 1, 256, 49, 7169, 1, 512, 49, 7170, 1, 768, 49, 7171, 1, 1024, 49, 7172, 1, 1280, 49, 7173, 1, 1536, 49, 7174, 1, 1792, 49, 7175, 1, 2048, 49, 7176, 1, 2304, 49, 7177, 1, 2560, 49, 7178, 1, 2816, 49, 7179, 1, 3072, 49, 7180, 1, 3328, 49, 7181, 1, 3584, 49, 7182, 1, 3840, 49, 7183, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
--
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5120, 1, 256, 53, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: pcie@1c08000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: pcie@1c08000 (qcom,pcie-sm8550): iommu-map:0: [0, 53, 5248, 1, 256, 53, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with compatible: ['samsung,s5k3m5']
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c00000 (qcom,pcie-sm8650): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c00000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5120, 1, 256, 75, 5121, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c08000 (qcom,pcie-sm8650): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c08000 (qcom,pcie-sm8650): iommu-map:0: [0, 75, 5248, 1, 256, 75, 5249, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
