Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3702C944F
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 05:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746077518; cv=none; b=Tzn7VjSvheQwPov3p+h/amlg5823+6Dg2DAcoD7k1TPau2vbn2jb9h9CFTX6vYx+PaG54k6ztJyPWZ+Q22btsnHvWpOrZZZ/UR8xKpuNMRgOHFHxL+K4BmPJ53FRVUThwiaAK8mzFlSO7qqaJavCcw4HWjnOAorRby5v28bC2DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746077518; c=relaxed/simple;
	bh=NC5PDu6551RQ4Ru5QwfeZG+txBHHOQoONo1msLo+HSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODGS1DsGkXqEpCOuGFYnZNnT4dppd7cc7yQRw9svS7kM9AyDPvhBCSATolWS/42vCEAhb3murfnha3qA0zJkANomYMczWZqjY3jcfmgovaDtwA6kLuIBYlwPd02ZI8H7rl7VgPRrac3c0PeXtPJoQ+MFR047r8U8GxnKX7Qk+BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG9yx2n1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG9yx2n1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746077515; x=1777613515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NC5PDu6551RQ4Ru5QwfeZG+txBHHOQoONo1msLo+HSI=;
  b=VG9yx2n13HYF69Lv8TqIBq4KvbSvqYJ5MtYJqDgG0SEJkc44KnQkjfUy
   MesgZEc0k62cET1HotP3ryPiw2gixUe8Xd9uu9ZcnRllxnvc9OGdx6cIr
   ssuQU7AqiLkTjmBCTNLEh8XXW2BteQJ5bYAyoEmX954abLH6STyED10+w
   2RXVI6kL7YCDpObqpZlk9zF9iHK8Jw/iFRn5hmOk1XdQzKg4UeXxl+wsB
   kvyqg1fGuMKeR4ZeARA+UUiD5MwtOhGAA2b+LNV3jSB5IXvKEAjIMpwSE
   p/fl/JfxQ2H223GsLuQrvfbZkQg6WWqie6dRG+XS3ooXgkNeeHTWVpkZw
   A==;
X-CSE-ConnectionGUID: 9E3WNvW3S5+QF2UvXz+F1g==
X-CSE-MsgGUID: fFV35Do/TkO5da2irzaYcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47887044"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="47887044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 22:31:54 -0700
X-CSE-ConnectionGUID: i7D8kBOuTj65eO+lptCxcA==
X-CSE-MsgGUID: f4XG9ZlpSkCXdstCmwERIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="134251154"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 22:31:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAMWV-0003z3-0O;
	Thu, 01 May 2025 05:31:51 +0000
Date: Thu, 1 May 2025 13:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: sham@0 (ti,omap4-sham):
 'ti,hwmods' is a required property
Message-ID: <202505011344.6XVlNviI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Animesh Agarwal <animeshagarwal28@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6ea1680d0ac0e45157a819c41b46565f4616186
commit: a00dce05ba31fbea58ca64158e0601cdc99d8929 dt-bindings: crypto: ti,omap-sham: Convert to dtschema
date:   1 year, 1 month ago
:::::: branch date: 25 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250501/202505011344.6XVlNviI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011344.6XVlNviI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505011344.6XVlNviI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']
--
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']
--
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']
--
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
