Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29853E638D
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272804; cv=none; b=iUTOJO4r0tgqIh3oQeRn0F9zX8c/dpKonfVHvmtoI9QjhIFI9mWGZuN6h+pHRk1iOa28IyhJEZoDcSVz7bUu8XvhbxOmddgfvtp9VaRM48JuN1nqj6zre+cO2cmYjLOFa1OnHgVOjZMxaAiaJlNhHYTHLY/h0J1PFvHpSO7boAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272804; c=relaxed/simple;
	bh=hbiL9toCztpsrBYGrJ/Vt7QHwokfAj9Q3jEySXCoDLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ln1tpOm3YvmYrg46wnpFID1owxHBTuSQNRGeKTwH5XYiJniDQTQ5f0nfmf9/81yM6elNSkiwSdz31wz6BbQ4zBZjKTrdCT4H5g2T/EsMGghNj4t12mkuyqL4z/EafJZqr6vwt2jEcGTRTlMzdcC4RnphWv8nBvEc+vj8YNZ7MMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVU42b0e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVU42b0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778272802; x=1809808802;
  h=date:from:to:cc:subject:message-id;
  bh=hbiL9toCztpsrBYGrJ/Vt7QHwokfAj9Q3jEySXCoDLI=;
  b=HVU42b0e+RStTEF06CKbTKc43CjUUrm4/SmlH5xusoNheFfVWNFyMzWF
   nJ4xxNF9t1wPlGaL9skQ+HDkuGosMitymNHYGf7Yex2J+IHtGs3SYMPsF
   MxRPBMmNo3TaPyllR108xNLr05FYfY2ewby5HTFWADTu8Nul1jXAXEMqz
   PR8UoT0nq10IjahFtmbUXO4MOgdu6WDcW3/jkO5WZYfrauFeGZ2dtO76l
   /i6HWs4G/Ly47sqPVbvrtAH6kT8L+bgpYLla8ypMVyYBBO+Xk7lr3rAc6
   wfMJcFORsO3QeQMU+qkoxDWBPBusspZpnbhrdPB+GTNiispyg7kg25w5r
   g==;
X-CSE-ConnectionGUID: YVy7dsJPTSqXN7a/CTjVHg==
X-CSE-MsgGUID: 57dkMPMlR9qfNLxIQNr7aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78975424"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="78975424"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 13:40:01 -0700
X-CSE-ConnectionGUID: +tOlfCgRRvqvwrzGdw3EDA==
X-CSE-MsgGUID: TLQTgquoQMmSYe3oGWshlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="238661220"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2026 13:40:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLRzK-000000007Gf-0lvF;
	Fri, 08 May 2026 20:39:58 +0000
Date: Fri, 08 May 2026 22:39:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb:
 typec-portc@22 (fcs,fusb302): 'connector' is a required property
Message-ID: <202605082254.eaLTfO8t-lkp@intel.com>
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
TO: Peter Robinson <pbrobinson@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81d6f7807536a0436dfada07e9292e3702d2bed4
commit: e14491aaa6ff598bbe9d462e44c01ac65754f445 arm64: dts: rockchip: add overlay for RockPro64 screen
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260508/202605082254.eaLTfO8t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082254.eaLTfO8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e14491aaa6ff ("arm64: dts: rockchip: add overlay for RockPro64 screen")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605082254.eaLTfO8t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
