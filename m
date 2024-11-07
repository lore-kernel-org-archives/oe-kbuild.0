Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748101CC16C
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730967186; cv=none; b=tCWfhqVVfLER2YC1hdpfXfIBg5zVyHGLCXRVq47fwUnZEIrXKs8aTbVUDZ50Z0rRZARTwH2NFA7fGMIpfxs4F0AwR/OtMuGK8oGoQvMGzV/6nDJW63T+RJmHoBBIFOFl8Q4wGzJ+wuLWULaOt9fcNOQ0nCJ3efcJSlAG629aN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730967186; c=relaxed/simple;
	bh=DONjZCB1Ma7gYAObfMFSulXtMeYS6gNHYJpoSaNz9ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i39yert8y3ReWeMRDoMrhxFXXVo5sPCTfB7aWUsYhLBimhN88yCN0iMRyqK6JfotS2u5ZRryfjja32ysXNcOaIRlLDOlletVgW8Ot0TB9v7z0gMVHim7CKnN/TkaWGwyjgVND5DRkF6tK4BdFrHe0Nmb1hkBVjus4RrkOxS3YVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a49FyqiS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a49FyqiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730967185; x=1762503185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DONjZCB1Ma7gYAObfMFSulXtMeYS6gNHYJpoSaNz9ng=;
  b=a49FyqiS0SM3YxdQPdUk+IpCUbjyM6wVe++PgxgEEe2wtiFRX4keEEAI
   ItvFRur15Cg92vQy0i6ZxAmMwibj5j9nHzpLPPhWrryY9ehsA0Ce93OMn
   L+0dXhS8NGLRHqQQOqOlzoIHrOy+6iNt4zWJjj4AHrxu5/09JDR3d0fPD
   fm6s44GY9mCnuswxRBnASy8G7osDPHUpj6mxkwdrHeiPd9BaGdoQgP26r
   2JJ6mkonV18RmprUuv0mqRd7jhTOoSFsbaVUVFiBFm/pMDwdVk3VX22Z2
   8zCEnYGw7/dL+vkrMOgD1XD25arVQvIAWVIHGLhgUdSaHDBRTcpR4Ootn
   w==;
X-CSE-ConnectionGUID: Urbr5zOTR5Ct686KdQpUdA==
X-CSE-MsgGUID: G6EuWyJBQWutHzCz4B2bSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48258497"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48258497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:13:04 -0800
X-CSE-ConnectionGUID: eodoc+sRQCm1Ma1+9LAQtg==
X-CSE-MsgGUID: xYX76wbfRiWHV0/IBU4/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84536542"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 00:13:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8xdU-000pzH-1i;
	Thu, 07 Nov 2024 08:13:00 +0000
Date: Thu, 7 Nov 2024 16:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [at91:at91-dt 13/13]
 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb:
 /apb/interrupt-controller@fffff100: failed to match any schema with
 compatible: ['microchip,sam9x7-aic']
Message-ID: <202411071643.4UAWOm4d-lkp@intel.com>
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
TO: Varshini Rajendran <varshini.rajendran@microchip.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-dt
head:   371a47c9a58a13e339fce2a3118c9ee6a8422258
commit: 371a47c9a58a13e339fce2a3118c9ee6a8422258 [13/13] ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071643.4UAWOm4d-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071643.4UAWOm4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071643.4UAWOm4d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f8008000: failed to match any schema with compatible: ['microchip,sam9x7-tcb', 'atmel,sama5d2-tcb', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/matrix@ffffde00: failed to match any schema with compatible: ['microchip,sam9x7-matrix', 'atmel,at91sam9x5-matrix', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/matrix@ffffde00: failed to match any schema with compatible: ['microchip,sam9x7-matrix', 'atmel,at91sam9x5-matrix', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/mpddrc@ffffe800: failed to match any schema with compatible: ['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/mpddrc@ffffe800: failed to match any schema with compatible: ['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/interrupt-controller@fffff100: failed to match any schema with compatible: ['microchip,sam9x7-aic']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: reset-controller@fffffe00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x7-rstc', 'microchip,sam9x60-rstc'] is too long
   	'microchip,sam9x7-rstc' is not one of ['atmel,at91sam9260-rstc', 'atmel,at91sam9g45-rstc', 'atmel,sama5d3-rstc', 'microchip,sam9x60-rstc', 'microchip,sama7g5-rstc']
   	'atmel,sama5d3-rstc' was expected
   	'atmel,at91sam9g45-rstc' was expected
   	from schema $id: http://devicetree.org/schemas/reset/atmel,at91sam9260-reset.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/reset-controller@fffffe00: failed to match any schema with compatible: ['microchip,sam9x7-rstc', 'microchip,sam9x60-rstc']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: poweroff@fffffe10: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x7-shdwc', 'microchip,sam9x60-shdwc'] is too long
   	'microchip,sama7g5-shdwc' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
