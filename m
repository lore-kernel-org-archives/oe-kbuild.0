Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C103322425B
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387681; cv=none; b=h77hNiALi3Lan5HLeF9zBn5C2WyddyVTmz2TOnZ+U5PmhuMuBoZcqaM3Xw3RHlDqvVAKwf1zn2a380BpEIo4wp2Nx1aZ6TJU6viRTEblPa+47N3FLS/CcvtNvBsZQUmAjHmnL3H9i4Bx8b0JuAsR+t9kEpFRSlX3stz2SRoqCJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387681; c=relaxed/simple;
	bh=AGh0thWtO8rAPaYYAARi9PZ3QB3FjLGu2AlX+NX3n6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KRgNGT/tZHf5wWpTJ7uyovi8ifOVMsrx/Mv8QsJJmeo/HDDwkPjwqd8eB1rqWzLHrjT2UObhmtQgK37taEe4KNrBUiIBBiagk9xb+iP2rnGbjxcqNBNdUUhXnJLtWh8U+SvtLOKUXTvtdzibB+U9n6O9zHTfcuikKKdEpu3we0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RT+VUE16; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RT+VUE16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778387680; x=1809923680;
  h=date:from:to:cc:subject:message-id;
  bh=AGh0thWtO8rAPaYYAARi9PZ3QB3FjLGu2AlX+NX3n6c=;
  b=RT+VUE16RYoxX8oWSq2hUSb12wmWzhB5YIfAobSTyZZVi3vA9ujelrfU
   90nu5l9lQkySJs98ahTPpTXSh0nvLPiWKNKXvjnOW69ubK8KPpNk0zKZH
   NjvNKogB3PZdO8zML+5q6BACDKUqgxgzhmPv08COn0JXibKVpgHso4oa0
   e0oaBI7MndOM4UaIRDvamFXV9UFxQrDuwZ307oHCmtgxh7odRki6Rr1Ab
   5OH5IndYZ3KCDEYywZm2ETWqurpvanLXYLViwA0Gt8wOEa69ZI4y6n70w
   6uYKKwGkCw2VBFWti+GhIAGHznioiBjNhHhKPUJp6tkBbvPcTGv1EkzXK
   A==;
X-CSE-ConnectionGUID: iG62j9BGTbeGO4bbzBHvZA==
X-CSE-MsgGUID: 8bGYnAUHQ3egCORD9n8ZOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="96879455"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96879455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 21:34:38 -0700
X-CSE-ConnectionGUID: 8LXCz2UOQYaOcVDnKJ84Xw==
X-CSE-MsgGUID: jbf++bmGRWeBzpSGRfavTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="260600175"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2026 21:34:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLvsA-000000007dZ-37D6;
	Sun, 10 May 2026 04:34:34 +0000
Date: Sun, 10 May 2026 06:33:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 7/9]
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/dma-bus/spi@d401c000:
 failed to match any schema with compatible: ['spacemit,k1-spi']
Message-ID: <202605100657.BpKCuWfv-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Alex Elder <elder@riscstar.com>
CC: Yixun Lan <dlan@kernel.org>
CC: Guodong Xu <guodong@riscstar.com>

tree:   https://github.com/spacemit-com/linux dt-for-next
head:   f068b204555ad62d6a841a49feb4ea8c4f45b25c
commit: c580774185426ea316396b1dc3f1737a3ad3800a [7/9] riscv: dts: spacemit: define a SPI controller node
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-2051-20260510 (https://download.01.org/0day-ci/archive/20260510/202605100657.BpKCuWfv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100657.BpKCuWfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605100657.BpKCuWfv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
