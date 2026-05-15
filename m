Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4E137BE63
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 03:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778816289; cv=none; b=BKP7Llg6KLT5/vLtrNoR3+r1GFfEGYbKesvaOJUo3/eLDFw3yfcXOxex161Bufw+5RoE+GA6dpKgHHeB+WlXkV6pjnRqtPUykxQr+EhiBm73UdWq7lbtUUzm6COQVP2jVCVZ1lpmbhT/lC2mxo+aEbEHQ3LeFcPfPa96tkNM7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778816289; c=relaxed/simple;
	bh=cdBUtjw67wSD7DwEmzvIYNQUUi++sVZTYZi4mz1xsus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mc//+8rny2fBy76OlbO7RV85wzS4P8ID0TiqK9k0+KHeOPSAR+e/oMGgfee+CxR331fGsm6dSxU+mMH4pZ7ZMm9Ufd0nDIBw87+ZoiCrsZIQKsaGYO/A6d2eZPCH0AtNGpqSfpLqHQ6kouJrHhsq+dKGMfRhfd3e13XBFV/kFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTb5Rfpr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTb5Rfpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778816288; x=1810352288;
  h=date:from:to:cc:subject:message-id;
  bh=cdBUtjw67wSD7DwEmzvIYNQUUi++sVZTYZi4mz1xsus=;
  b=HTb5RfprN4xoOhshxTMpGjKoLA5Ns2/kjbshRb/p+93Pbg+i1G5Cq/wy
   JC7txbyI60J5cqF+C1RdKYt8Npx8uW6Dj+eeEq3Y5ZmnQVZ7I2PujsGad
   jpIIkRZpjywCS58NCgXVi4wXOVpdFyeXFUh9m5m0hzYG9xKQUQJk94+TR
   TMHAAdYm52hSvpe1ovrAK40+bWMmy4j4bsOEATFjEh8lpgelzStkRwetm
   RTTALCVW5fFIEas8a3JbodrKjDW5iOSmTrh4PFEHGzYWJQpm5H/0hj/ck
   C1dAHDbH37tj9TjEOU6Dzi8hQcyIz848gAoxOWDFLSNhhc8mEy9arC9QU
   g==;
X-CSE-ConnectionGUID: 1zmmFfRwTm2t8woxnWS3Ng==
X-CSE-MsgGUID: tXGDHENDSQmuwGYFXrHI9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79484396"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79484396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 20:38:07 -0700
X-CSE-ConnectionGUID: jadsTLnXTxiY2mPJUvSiLw==
X-CSE-MsgGUID: OkkHNsyETvSof7vZMj3NDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="234312941"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2026 20:38:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNjND-000000008w9-3CZs;
	Fri, 15 May 2026 03:38:03 +0000
Date: Fri, 15 May 2026 05:37:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb:
 dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not
 allowed ('iommus' was unexpected)
Message-ID: <202605150523.k7oGRmTQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Antoine Gouby <antoine.gouby@toradex.com>
CC: 0day robot <lkp@intel.com>
CC: Franz Schnyder <franz.schnyder@toradex.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Franz-Schnyder/dt-bindings-arm-fsl-add-Aquila-iMX95/20260513-164612
head:   05bee2706cbcd660c976dc3f538807f83d843d8a
commit: 05bee2706cbcd660c976dc3f538807f83d843d8a arm64: dts: freescale: imx95-aquila: Add Clover carrier board
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150523.k7oGRmTQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150523.k7oGRmTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150523.k7oGRmTQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
