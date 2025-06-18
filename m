Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7C27FD58
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248105; cv=none; b=Rjj6TcymTF1ggm5pHm4XNqivONi3WNVsM36gu6BMj+3eDbslwUyuRWNjnEQGResleKAtfiMEblJzx49MmNHHPdGVzmDgV3bTIqHs9d2w0j4WyFwRpY77XhdSfPnm8Knf8why/4BNcXch9euGAtz0yRa5SmXw/fkxSnwt8qi1lUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248105; c=relaxed/simple;
	bh=09/DbnuWZTnLZPw+CRsoPJROXjDDYP5AvJ02XTmL3xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h5EqSEAOtkjMsqXBP6f2zmDtLFKOD6te3vMplc4tKsae+zXTOZqej5zfNUUjmaYbsVJXMXGmZHKDxDyUzFBJXzxTXSQkPA+58v9h+LvuV6RCI5/imP8WkAv73nchKJ4mxbgTu1PL5JXkeOB74J/Tk3jvUydWkbdhORU2N1VL2o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBYRG3Q2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBYRG3Q2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750248101; x=1781784101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=09/DbnuWZTnLZPw+CRsoPJROXjDDYP5AvJ02XTmL3xM=;
  b=dBYRG3Q2UXDnmqd7eDpVhL8Qj5s4dsjMm8GEcFq3VDL3gzt0g7lJW6pc
   I/o/lbJ1/uI3czg037I/wzyIJEtMdnIxtX/nAPb6k8oHSskap9fGDahVv
   Eyx75Yx/ThHf/1mknJDfE4CUoFb0BAO8HEWN03vVeb/9oHCBtJ7gNK6iW
   Fla2ca3EVX9pvj+zVOO0LRDg5HQ8mO3OT8ehw/kdwwFz4WT/10lTbv6xL
   pPrGgrPadRS+9MwnS3TfPBqhMZbgoUtQGpphhEak9Iu5LCcdYjSyUdY0I
   4CsAKl0qE28FvXW4Uq+WNlo9BXDkcfI2OU1P1bRuMsbdb54NhuJkACGnG
   A==;
X-CSE-ConnectionGUID: 9RCOOVKjRMS2hSQVYFdASA==
X-CSE-MsgGUID: VtTlv8HBTx2om12f6CcbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63068133"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63068133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 05:01:40 -0700
X-CSE-ConnectionGUID: TTQzI617Tp6RtsCKVRxA+w==
X-CSE-MsgGUID: 75AJneNbRQKQT+M1QO/cag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="154909184"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jun 2025 05:01:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRrU0-000Jjw-1p;
	Wed, 18 Jun 2025 12:01:36 +0000
Date: Wed, 18 Jun 2025 20:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 23/23]
 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: rng@2070000
 (snps,dw-trng): 'resets' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202506181959.T7rAtMan-lkp@intel.com>
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
TO: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://github.com/sverdlin/linux snps-trng
head:   21e232768cb64142db24034d3dceffbc48c2447e
commit: 21e232768cb64142db24034d3dceffbc48c2447e [23/23] arm64: dts: sophgo: sg2000: Add reset control into TRNG node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250618/202506181959.T7rAtMan-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181959.T7rAtMan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506181959.T7rAtMan-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: rng@2070000 (snps,dw-trng): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/rng/snps,dw-trng.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/syscon@3000000: failed to match any schema with compatible: ['sophgo,cv1800b-top-syscon', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/syscon@3000000/phy@48: failed to match any schema with compatible: ['sophgo,cv1800b-usb2-phy']
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/syscon@3000000/dma-router@154: failed to match any schema with compatible: ['sophgo,cv1800b-dmamux']
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: dma-router@154 (sophgo,cv1800b-dmamux): dma-masters: 4 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
