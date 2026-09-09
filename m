Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0155C1B8
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957949; cv=none; b=pL5W8VrKTmwOMvAJBlTJ8vSK4EBUGv46AtvTkX6D+dVZ81tgFktEFAuu1ti8GmTCX2uzKcaKaUQKXjGIyp3DwoCoL0t+PMuz6ffNWBsuZmnJXLwuPpUT+HWiRJ5oooYx9ho/bIgQWHsrgyDn7DKOi74/q0gi3mzjUsuA/ISq1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957949; c=relaxed/simple;
	bh=MjHzQ9a2cGzUedhRAK5jOStAYXU9BAS1uq4wBoExXMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B46RjgtjrD3eU6B8Qt0Hzleh9xRPIkdH2V+drCWqXSLUGrUPTXkQtdA+v3wDFeJwDwNLH6E71MI50pDs7LfH3URA1K6kOVtoPLslC9DKlS5Ja4GAWwJDsdfcrKuOA9JZrc5Z/uY/8oPVHlojjYWAe7UFd0tMRdEAx8CGjdbPvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMPm0/2f; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMPm0/2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788957945; x=1820493945;
  h=date:from:to:cc:subject:message-id;
  bh=MjHzQ9a2cGzUedhRAK5jOStAYXU9BAS1uq4wBoExXMM=;
  b=kMPm0/2f4ol3zpdfNk4bYkBa98pT3S1zjvb2F3lGUIGDzhCM1OfoSIBG
   4OUFFtOd2nCVnAvHOLIuaRe5DmLNZbPNNGw5dHmJBHeah2nW1QXyuqLLM
   UYjpJYEy0AnCIROioss8gJHm1uihhtkmWEtHspQ2lRWUkVFoJTB8pDTxS
   iPJ3wYdIesKNseMEkJ8tQGby2IpHeELwwOv7eS9bTM4h4YVNARCgld6zS
   zLOyyiHdhbKJeZ7hyKgCDS912rc9EpqSvsl1ZuJcHMMVDMeudMPlNidS/
   vQTUy6lhe2crYm8BTcsZX1vYZxlpy453GxEOTr1nw2EU0gtIMglFbmWJd
   g==;
X-CSE-ConnectionGUID: uVH6xlR3TseHkFSyI5654w==
X-CSE-MsgGUID: UuWfkF3pRNC00h4p0FDOig==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93250587"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93250587"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 05:45:42 -0700
X-CSE-ConnectionGUID: uItD52iPQne8ByJryRjXuw==
X-CSE-MsgGUID: /8NTKGkPRsqCfmbj6bWOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="269970385"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Sep 2026 05:45:41 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4HgI-000000006c8-2ibM;
	Wed, 09 Sep 2026 12:45:38 +0000
Date: Wed, 09 Sep 2026 14:44:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202609091418.vHdjUVYv-lkp@intel.com>
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
TO: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Prasanth-Kumar-Padarthi/dt-bindings-arm-aspeed-Add-ASRock-Rack-B650D4U/20260830-235035
head:   5ecc905d7e3cef66f0ec6b9c418ba7b39a8b94e1
commit: 5ecc905d7e3cef66f0ec6b9c418ba7b39a8b94e1 ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-2054-20260908 (https://download.01.org/0day-ci/archive/20260909/202609091418.vHdjUVYv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091418.vHdjUVYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609091418.vHdjUVYv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dtb: /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c-global', 'syscon']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
