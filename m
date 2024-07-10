Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FDA195FE6
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720638344; cv=none; b=OVYmU97oaoMaGIsqiWwgIdtpaM8I0xBzRZ8U4s2fPQjk36+jX4yvzQObYV31tQfe63zrIFOlZwIKy3UIyzyiimJy5iqn2ef+nbuqy/TbhfCBJxVjRGg1sXn5EtZ0puGB1Wrb2zjPBSFIY1LCa1WA67BK5LPybyBx6Gj23aDz2PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720638344; c=relaxed/simple;
	bh=/0ZXxgmtVoGfkuT5cfbNmfyoUN9Fuo6+AbtMrFypZgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQkpb48nn07e7ICHhc+AntJwSxY0GUMRzmBv/YNWGXrC5GXAzjq8KumkCIWX3I9+1totMIK77O+RIDponu87VbtlzxBo2mB5TaILoJuzA0IWYR8wuFSf9DyQtEUbgPTT3XCVVolZ2LfFc7eNUdVH4rnCf4HODVj8dCgeHeIdCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWVPAUjn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWVPAUjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720638342; x=1752174342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0ZXxgmtVoGfkuT5cfbNmfyoUN9Fuo6+AbtMrFypZgc=;
  b=NWVPAUjnSOZ8V1tlesJ4QscIWEIhBja+ixCfwFxMt1jawhO3bYrydU0n
   pXY43I5SV3YC08DI5WQDN/1dLchY56YJx0mmcM38yfUC54+axDz1UEEyI
   3y3NhZ8qFtZEHHNpLb+J4pqZNfisy7Z7HjRNBMCUls0UsU70GbAjgibNm
   L2UvxPgnGDEL673+ilmSG5tcox46kBo8A9EYIBJTRnb8VueS0tWo8p9Us
   xbXyQYjb6WefxkM4LXaEG/XE9Anlgy4X4r1qhkViGWLQqKNjyW5WcypHC
   2iaim4sLeBTig5PyU7qCVfnKiV6LTIW6AwTcNg/HCMPG3as5glevVLbhu
   w==;
X-CSE-ConnectionGUID: 6FianW5jQ+WcrKkH0pn9Bw==
X-CSE-MsgGUID: iViKwn1CTCKkUHxmvEuP8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29145152"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="29145152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:05:42 -0700
X-CSE-ConnectionGUID: niLd3t4WQx+KTiiqDooA+w==
X-CSE-MsgGUID: HkTou9XrS3i4kHuX2OEhUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="71541387"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jul 2024 12:05:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRcdH-000YBz-0u;
	Wed, 10 Jul 2024 19:05:39 +0000
Date: Thu, 11 Jul 2024 03:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-1.0.x-imx 2975/11740]
 arch/arc/boot/dts/hsdk.dtb: gpu@90000: compatible:0: 'vivante,gc' is not one
 of ['fsl,imx6q-gpu', 'fsl,imx8-gpu', 'fsl,imx8-gpu-ss', 'fsl,imx8mm-gpu',
 'fsl,imx8mn-gpu', 'fsl,imx8mp-gpu', 'fsl,imx8mq-gpu', 'fsl,imx8qm-gpu',
 'fsl,imx8qxp-gpu', 'fsl,ls1028a-...
Message-ID: <202407110230.pGGBC0z0-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   13ed4e83694299049a3d4449fdb61471292ef19b
commit: 8b209e8532a11e93f1cf1af2324b3b478d28820b [2975/11740] LF-2784-1 dt-bindings: gpu: add gpu compatible
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110230.pGGBC0z0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110230.pGGBC0z0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110230.pGGBC0z0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/hsdk.dtb: /soc/core-clk@0: failed to match any schema with compatible: ['snps,hsdk-core-pll-clock']
   arch/arc/boot/dts/hsdk.dtb: serial@5000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@60000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@40000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/hsdk.dtb: mmc@a000: Unevaluated properties are not allowed ('dma-coherent', 'num-slots' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/hsdk.dtb: /soc/gpio@14b0: failed to match any schema with compatible: ['snps,creg-gpio-hsdk']
>> arch/arc/boot/dts/hsdk.dtb: gpu@90000: compatible:0: 'vivante,gc' is not one of ['fsl,imx6q-gpu', 'fsl,imx8-gpu', 'fsl,imx8-gpu-ss', 'fsl,imx8mm-gpu', 'fsl,imx8mn-gpu', 'fsl,imx8mp-gpu', 'fsl,imx8mq-gpu', 'fsl,imx8qm-gpu', 'fsl,imx8qxp-gpu', 'fsl,ls1028a-gpu']
   	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
>> arch/arc/boot/dts/hsdk.dtb: gpu@90000: compatible: ['vivante,gc'] is too short
   	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
   arch/arc/boot/dts/hsdk.dtb: dmac@80000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#
   arch/arc/boot/dts/hsdk.dtb: dmac@80000: $nodename:0: 'dmac@80000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#
   arch/arc/boot/dts/hsdk.dtb: dmac@80000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
