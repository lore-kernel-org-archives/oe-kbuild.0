Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456428504F
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Apr 2026 20:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802709; cv=none; b=GxtMG67othud0F41uLB6yeeZkbUefinuSSwPSQsauak6JLmxblZQDNvk1KZjbrY/D1jn4KJmN4GBU1eJ/mHsDv34XiwE1S9gL99xkBhr4uHoO5qajAcjoIumpVY9hGywHBfX7eMZefvsUwWqK6r7VgFMfUT3+i2f9kwBYlNAudU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802709; c=relaxed/simple;
	bh=BhPgB2cjyAH3mA6u+G5iZQ1nPjACjPGzXE30sgwIPCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J1LpQtzrmFwXMHY0c9StrBsCEzreIRFGTGOci7VJ0nRDBiNKzv+1h0BWzhYHjhv/jZc/ry53Ridxyfq/kj/sqIQ7iyqrtNiFbvVy2/NXUXNeE6sFjkt6NaqCWo8XIz5wKhA8zVkjsufC4OK/0tIVSOmStLZfZoQfAHDiUvI7dIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXJyawUw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXJyawUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776802707; x=1808338707;
  h=date:from:to:cc:subject:message-id;
  bh=BhPgB2cjyAH3mA6u+G5iZQ1nPjACjPGzXE30sgwIPCo=;
  b=ZXJyawUwYB2WgpoqTHN+qFjCLdYU+2tmnVX+Mj7/2zjk7xK1NXmxvYtV
   B3g0Ud3so/W549u6dXazZN8pwwUy0WReyTQOsHhC9lHLpwuxxwi/GvNNq
   wVRSspTCebT0UI7OYXPFF1cWkICjbwhnHTt8Qh2RFogZ5eEfPG1WjkMJ/
   DWoTKUi/F0OTvEKGLWc3//NvHAJIblZuBJTee0OSqG9KbG9Dyb5Ji2gl4
   QP6VMw+JnAUb4L080Axd80Ku1OlC8MEZjUMoJ/IA59cfYNpNdEWpjN7MG
   Zhd2MLX247JHnDkHH15b4LHKJ+OLbHI5x2x6hhCFqJFh4nRCE0OZbXfvc
   A==;
X-CSE-ConnectionGUID: KWl6GYJnQauH+D4CzjT1Ig==
X-CSE-MsgGUID: 7czZNZN8TYerzqSWtnTt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65286928"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="65286928"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 13:18:26 -0700
X-CSE-ConnectionGUID: LuNwen0FQ8CfO4eUT1JAKw==
X-CSE-MsgGUID: /de+GxsWQHqskl/F4cwqlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227798071"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Apr 2026 13:18:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFHY7-000000002dt-1xPI;
	Tue, 21 Apr 2026 20:18:23 +0000
Date: Tue, 21 Apr 2026 22:17:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_sdhc_v2 3/7]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: soc@0
 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
Message-ID: <202604212228.w0VVPUno-lkp@intel.com>
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
TO: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_sdhc_v2
head:   974099b9e02f16aac84a51eb58fa25523e9d2319
commit: 948f8caa7961bd6c2167b21e6c989e7aa6d5f2ba [3/7] arm64: dts: agilex5: add SD controller support
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2054-20260420 (https://download.01.org/0day-ci/archive/20260421/202604212228.w0VVPUno-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604212228.w0VVPUno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604212228.w0VVPUno-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'enclustra,mercury-aa1' was expected
   	'altr,socfpga-cyclone5' was expected
   	'enclustra,mercury-sa1' was expected
   	'enclustra,mercury-sa2' was expected
   	'altr,socfpga-stratix10' was expected
   	'intel,socfpga-agilex' was expected
   	'intel,socfpga-agilex3' was expected
   	'altr,socfpga' was expected
   	from schema $id: http://devicetree.org/schemas/arm/altera.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: /: failed to match any schema with compatible: ['intel,socfpga-agilex5-socdk-modular', 'intel,socfpga-agilex5']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: mmc0@10808000 (altr,agilex5-sd6hc): $nodename:0: 'mmc0@10808000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: mmc0@10808000 (altr,agilex5-sd6hc): clocks: [[7, 40], [7, 78]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dtb: mmc0@10808000 (altr,agilex5-sd6hc): resets: [[6, 39], [6, 38], [6, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
