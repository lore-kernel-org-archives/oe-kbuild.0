Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188017B505
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484743; cv=none; b=UCYgI2OmV0XPvoSToM2CUUnP8o8zpc8XwTwkKdPnc7arH8aXnGfWe2BWFsZknrU3dx4s359sJFLCHj/fHPiikCCKeDsBUuXQy0P9sloi/d7Cda1AL4C6ldQM43gj3+NX2/5Gf08zYPnkjH5qalqJYkgwmc1Zbr9r0FmqjiTn1a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484743; c=relaxed/simple;
	bh=5TzHh8wdO5JKZK0ktAGdtSAs7Zs+6v/+Uc3CiNLNcrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n+CmZdojYfAVawKOxE0ZeBWPUZn/3WMXTrsrhNeDP4kpEq7t7AyzaeM7CuLEmP1Edp57QS/vqsXXpbiyVb9Uz4qKmMv2wApKjt8fuME8WIQiEa/7FKbEEPUnhyIji8xNZOiio6wxKNowpGWdKPHd2Xw+S8tWahgrfGKQhYFhmho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOLUUhv5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOLUUhv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785484741; x=1817020741;
  h=date:from:to:cc:subject:message-id;
  bh=5TzHh8wdO5JKZK0ktAGdtSAs7Zs+6v/+Uc3CiNLNcrs=;
  b=fOLUUhv5fYUbmlKEe5q2w+Jc5uZhZxep+KDGyE72DCaV7+ETI5zzXU1Z
   o55FkAu0lrcazvUjOgYS+Dd7xMOGNlFMRlwC8bW+0kYwQ5NMJ99lxHurF
   yXXxvUjDu4hEWBjw6rvoRK/wr8YnpHkmSUzAq0BQx/evOhKx520R3pqWj
   EushKoiASy1V/pFwymcigWusAT05BBcocwfoKZy1BU90++MtSDOuz8ycI
   aoIH+WWu52ZfUhwc7xHHb6jI5izhtQGBA+BSxjbUmJrdGuzBrwcgcIH2D
   joabPsow21CCZHKHoLzaqtWob2b1lhqy0iF4D9mLZAOG0zfRp9iW9mBOU
   g==;
X-CSE-ConnectionGUID: P1lsFiyXQc6ZSSsfuPK9zw==
X-CSE-MsgGUID: yXQ8LdQLQGqOZYW+8IyK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86058997"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86058997"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 00:59:01 -0700
X-CSE-ConnectionGUID: HBDaBrmMQkmgcBw3eTqXVw==
X-CSE-MsgGUID: 7pIjLP/YROGml523OuFavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="298717093"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2026 00:58:59 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpi8v-000000002Za-1HwW;
	Fri, 31 Jul 2026 07:58:57 +0000
Date: Fri, 31 Jul 2026 09:58:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202607310921.kpyBL9KF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marc Olberding <molberding@nvidia.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: f28674fab34f07fff9612c3f390d3699bfe8ed90 ARM: dts: aspeed: Add NVIDIA MSX4 HPM
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-2051-20260729 (https://download.01.org/0day-ci/archive/20260731/202607310921.kpyBL9KF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310921.kpyBL9KF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607310921.kpyBL9KF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
