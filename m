Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747F973443
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720119545; cv=none; b=rEPmoFz4jXAJJkVVdXFtj69Juyda7LynxxTtyivbX5oCDZK9I8DyaIl/0PVML7BIHexK7e4pRpZ+WGpXcQjw3hsFtPgNBVRqeSegN/oW6/tEXyBXR2IMFeXuLMg8VPguWuESUlrfyIqPyTvVhD3ivDe5VQAmvOkzdttvc1mvP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720119545; c=relaxed/simple;
	bh=38w2KCgukCAFhHcticMoiJtKAHxE95YcbCGjMAZ3JnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcpFb/1EkXRoCCztqh8E4yUcd8xb0wzcgiuDj7T9bJ1s9y26DA8WbDzA+5R86fWNrXLvwEOzzMg2poJM8vKwD7vvcet6lx4ZM5KPBKXvsuvAgpiq+kBwflxycvDfP+uW+v82dvtYzrs/QbY1KcmF9QKkfhSfbPZIlZGHZkjz+G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGGXLthT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGGXLthT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720119544; x=1751655544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=38w2KCgukCAFhHcticMoiJtKAHxE95YcbCGjMAZ3JnE=;
  b=HGGXLthToetCyDlKI93EHXPR3IEcB/ZaW8T2B7miIZPrdy8rfLRoD9Nm
   CIL7wSEvgHU5u1DYaBKmbxvuwAe1/6HiB2NdwiMYmMzpT/DFtpcHOGwzg
   JQLmD8Qe0UWpvi+NWC/vAJmsr7ca8zMPVafy3ic/KUgRFE2N5hp7/UJfp
   RjI775Wv04dK6a91fC/P3CTW1AWzoY5zcZT2SkDVut5D2onbehFJSbkEK
   klWv7qwyPVHT8C8e9awB0W95O+NfiZwKtscjw/lekCLXW1SkPornvCMgq
   FGJM/HJGkvXtBdfjxO+d64nQuRaunbVo5j/ZnQ0djf8RMAEOIxT5kOQv0
   g==;
X-CSE-ConnectionGUID: vyIjOIA5RBOmkuGuVpkvDQ==
X-CSE-MsgGUID: PkKPfSd4Si2rVYjcLj1A/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17133271"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17133271"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 11:59:03 -0700
X-CSE-ConnectionGUID: 7LDkIaNzQ5ujyNPKJRCbwQ==
X-CSE-MsgGUID: NDzI8PueS8eZtyFYfvBNIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51530729"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2024 11:59:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPRfX-000RLs-1B;
	Thu, 04 Jul 2024 18:58:59 +0000
Date: Fri, 5 Jul 2024 02:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 5/8] arm64: dts: imx8qm-mek: add cm4 remote-proc and
 related memory region
Message-ID: <202407050229.EMi5WNZ4-lkp@intel.com>
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
In-Reply-To: <20240701-imx8qm-dts-usb-v4-5-03cdbc8c44b6@nxp.com>
References: <20240701-imx8qm-dts-usb-v4-5-03cdbc8c44b6@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-imx8-add-basic-lvds0-and-lvds1-subsystem/20240702-000741
base:   9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd
patch link:    https://lore.kernel.org/r/20240701-imx8qm-dts-usb-v4-5-03cdbc8c44b6%40nxp.com
patch subject: [PATCH v4 5/8] arm64: dts: imx8qm-mek: add cm4 remote-proc and related memory region
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240705/202407050229.EMi5WNZ4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050229.EMi5WNZ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050229.EMi5WNZ4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@5b000000/nand-controller@5b812000: failed to match any schema with compatible: ['fsl,imx8qxp-gpmi-nand']
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: imx8qm-cm4-0: power-domains: [[15, 278], [15, 297]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: imx8qm-cm4-1: power-domains: [[15, 298], [15, 317]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
