Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA3422540
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 19:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190775; cv=none; b=EXwUKAR6MTb7Y7jPtR8ThJ8o6tDMpryyIVYe+3MTunx/vHhk+KX3+ccn5irPhlZerWHk3+XccZoqwIouzHUyLlEmK2SJrFfpkgK0heNu34AS5UsALQjlZT8s5hkynqDcTsS/LI9Jx32NWf31ZY2x0ubN+PZvwW9GAMFti418/dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190775; c=relaxed/simple;
	bh=61nRG4gbVwS/gAq6tNE/bcOIbiklnj6j6akVJDGRAlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uHWtdhuASW+IQ4Y07ypZCjUdFVTw8YzY/5ZJtBsw0ZZkm54UqBS+L/0+Espoduijx72dyUs6/mQ4I6f+Oq064ppBUR9dEM1G+LxZqbhSqq8xS8rJmzvHZE5j31uMMHTaCYvM96ifhxjLfk9K5XgvEVCs0M5zxNwIa+JusAdOqaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/d11fiA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/d11fiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790190773; x=1821726773;
  h=date:from:to:cc:subject:message-id;
  bh=61nRG4gbVwS/gAq6tNE/bcOIbiklnj6j6akVJDGRAlA=;
  b=l/d11fiAtS1WxH6vKvtZy73EViZxO6gSPiptQ49nnKSctc/ORuqfRx3O
   m6iIq/m3vdIOdJSY6jelz7WHvOgNu5xE3dK3kwYfvK7/cHj9pb4H3dyPW
   gcl0mBBPa2Ye54+yOOiiBc5dCZFems6aiRKO8PrJzgSB0RPa98v6sk3Uk
   Ge6n0mJVP+/Hdap/16J8cBkly6AY39xdkJOW3iTZaJfySJ4YpLbtGReOY
   iRCnwiqNqTZWqzZaoSGN76Xk8qDqHuw0Wdf7dEGQggXx/qSFdS6q3cNsM
   h5sb4Jt1Nw+LicBZIAT4iBBQQoTE3McqJ4KvbsIPsrC0MODsmS0Ga2CBD
   Q==;
X-CSE-ConnectionGUID: cNtRNv78RPijCUmyUZzDhw==
X-CSE-MsgGUID: C76TlNZFQwWOu2SxDOIeHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91033900"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91033900"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 12:12:52 -0700
X-CSE-ConnectionGUID: Lb+qhxR9TVGqSsJV9BpLMQ==
X-CSE-MsgGUID: dkAjWxedSCurEZCndf52UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="278468176"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2026 12:12:51 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9SOf-000000000md-20v2;
	Wed, 23 Sep 2026 19:12:49 +0000
Date: Wed, 23 Sep 2026 21:11:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dtb:
 mmc@50020000 (fsl,imx50-esdhc): Unevaluated properties are not allowed
 ('min-frequency' was unexpected)
Message-ID: <202609232155.cvMXKkEL-lkp@intel.com>
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
TO: Andrii Salivon <andrijsalivon@plajta.eu>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrii-Salivon/dt-bindings-arm-fsl-add-Amazon-Kindle-4-Yoshi/20260920-212137
head:   895440f80bafa467b9c65ac0d6ed72dda4f43e34
commit: 895440f80bafa467b9c65ac0d6ed72dda4f43e34 ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2402-20260923 (https://download.01.org/0day-ci/archive/20260923/202609232155.cvMXKkEL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232155.cvMXKkEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609232155.cvMXKkEL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dtb: mmc@50020000 (fsl,imx50-esdhc): Unevaluated properties are not allowed ('min-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl-imx-esdhc.yaml
>> arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dtb: mmc@50020000 (fsl,imx50-esdhc): min-frequency: b'\x00\x06\x1a\x80' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
