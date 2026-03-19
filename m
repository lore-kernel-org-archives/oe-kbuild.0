Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80CD374746
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 22:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773960447; cv=none; b=OwoUCMn5cjbaw1tiUvAhYFrKKYbu1N4ZamO3fQcxRn9OvuYqf9ZXEGmSMJttUZfdb6yi6+hTDCEU9HkiTzbMk65Uf0bHpYeMVNsCR9CBdEpvk7tEYi0rzVgJkXNXACQTFsDiIqakiUR91rsviLFoyRxnlBsF2qOXExWfPx9+q8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773960447; c=relaxed/simple;
	bh=z/Y50TO0hR2jfhh5lukjkUgmc4+mL04cTtsEhHwAzGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nmRhgAVPqECXgn6pY/d8QdenbepXGPqW8vZLKp6vSnxj9pk1jLqZ5ZPw/I3wWVNm4FtRtYlpF2g5SKDmDsuQ4oRrKCdDmoXIDBWEv8x2WKulDtv1cImQi9AjTADZlP1yJ7Xpme/SYn4RBLuQDwqVo58SmlKmQM/qfqSqsymgK5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8fp/L8d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8fp/L8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773960445; x=1805496445;
  h=date:from:to:cc:subject:message-id;
  bh=z/Y50TO0hR2jfhh5lukjkUgmc4+mL04cTtsEhHwAzGA=;
  b=N8fp/L8dfxe5omtvEipDK0GMC6F6kHt1K/xkNjVqRkTHpv2Fo3FdOxaQ
   g8GDZo/GUqzeSTxVrIfYA+sjcDs6IdhnQAKfZ+JxvWWZD4eADKQ4q0Rik
   XNJGEG2kxufVopy+rv9B+mPVqktB2jEei5FHo0K4281weY8+slydsK7EX
   FirdVApHYqmutMIrQYspJyyzi5VEYjhzoeCqHbOoI4mr3QOoG4DYEeMN6
   pr29uen8vw7JmqXLXgQlpyaKLydQTjnC4lEHvbgJyaVUMQOGtC9zera9R
   OOQxMvGAM9rp1AfXHKOqTkpEM1VSsrgZXjIUFGUGR8dKoKRyANS1fEBD2
   A==;
X-CSE-ConnectionGUID: 7GKFDhiwR6SScPsgIrUOqQ==
X-CSE-MsgGUID: FwqtYVi9Rd2nqBtzV81P1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92428600"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92428600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 15:47:25 -0700
X-CSE-ConnectionGUID: xdoc6bvERryH3yB26fEpdw==
X-CSE-MsgGUID: gj/A7yrTRiSg7XciMo5chQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228046432"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2026 15:47:24 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3M9B-000000004uT-40qC;
	Thu, 19 Mar 2026 22:47:21 +0000
Date: Thu, 19 Mar 2026 23:47:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0
 (lg,ld070wx3-sl01): 'power-supply' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202603192355.Usv3tmQh-lkp@intel.com>
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
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
commit: 88a18859791e7217c6ddf849bbf62484b9250bd2 dt-bindings: display: panel: properly document LG LD070WX3 panel
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260318 (https://download.01.org/0day-ci/archive/20260319/202603192355.Usv3tmQh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603192355.Usv3tmQh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603192355.Usv3tmQh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:764.15-774.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01): 'power-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01): 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
