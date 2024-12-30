Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F601A23B7
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735569538; cv=none; b=gR28/AFmo0LZhmr+O4KJmUMLUGa6zb1UkmNgrfx+FehWBJseG/2y0HruHEzIsu9hJDfezPcWHbDlJq/tDBkZZRRDn7meb/aCb+GfVA1Q5WIEWDL1R50u2hY4RVec2A9dCa/7TSGyVfpK1nyy7xLRHU47Oy1+V2djLwmIcVxyoGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735569538; c=relaxed/simple;
	bh=cuIGI931BGwQLQCLAQlmzVOnFWrnlDSNrwb/Ibln/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJMpfzOf+p9RSfePF9upoaQVGMYdv/GGTV/aIygTamlkcraLnKjAy3s6218aih5sVYnbVXo+4L3NMzpiKhnwaMAqsLRukrZUseb4bksFQkwjo5Z7b5b2vMEcouPd66fuBKd0L3qb6SeRU03xjWr8nv3ShFW6Ta7OCrgpBo+2e40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFWEpL3A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFWEpL3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735569535; x=1767105535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cuIGI931BGwQLQCLAQlmzVOnFWrnlDSNrwb/Ibln/Wc=;
  b=MFWEpL3AmVDbktOwHDU2kaKvzEGfu02n9RzOgcGa+SYjeYS/++/Ig/ui
   oFxUl64zTvrtkb3KE1Tklpc/FaNzaTalrO9gex0Of1yMFVxc7Hv81z3XF
   uewIK2b2m0HuRKJ66txZIyIoHbbkpDbgnH0Jd6RWz+sR6zJ429ckdR88o
   sjDh+y/iSHhcG26C08ahegF2Vevhc+5Z3VGG1PHjm6Kei/nZdvuLvupfz
   WHIDN6Yy5q5GqGIk3HtRPtAV5dBXQYlCGTqEXqn/TIDWLmuLPpFHjYMOJ
   M677O3Wr6Sl0VBlFoi2M7l70DWAAu22e7yASBEcPtyzUeP+j+G5LG6yOQ
   Q==;
X-CSE-ConnectionGUID: P3NHIu/qRauUgxR5LJeCOQ==
X-CSE-MsgGUID: hfU596NMQdmBnBr6oJMB7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="61227783"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="61227783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 06:38:54 -0800
X-CSE-ConnectionGUID: NwIlcohlTNurNlZsR3gtaw==
X-CSE-MsgGUID: D/f06a/oQXKbS8rGQBPKyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="105660994"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Dec 2024 06:38:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSGux-0005r2-1H;
	Mon, 30 Dec 2024 14:38:51 +0000
Date: Mon, 30 Dec 2024 22:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 877/877]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: compatible:
 ['google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3',
 'google,starmie', 'mediatek,mt8186'] is valid under each of {'items':
 [{'const': 'google,starmie-sku0'}, {'c...
Message-ID: <202412302233.1gTmV282-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: compatible: ['google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186'] is valid under each of {'items': [{'const': 'google,starmie-sku0'}, {'const': 'google,starmie-sku2'}, {'const': 'google,starmie-sku3'}, {'const': 'google,starmie'}, {'const': 'mediatek,mt8186'}], 'type': 'array', 'minItems': 5, 'maxItems': 5}, {'items': [{'const': 'google,starmie-sku0'}, {'const': 'google,starmie-sku2'}, {'const': 'google,starmie-sku3'}, {'const': 'google,starmie'}, {'const': 'mediatek,mt8186'}], 'type': 'array', 'minItems': 5, 'maxItems': 5}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   d8ee6b4ae3d261b5d5dfe13c527acea28c2724d8
commit: ced4a49483a6087209b917295e6542eb9df95c4f [877/877] FROMLIST: arm64: dts: mediatek: mt8186: Add Starmie device
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-052-20241230 (https://download.01.org/0day-ci/archive/20241230/202412302233.1gTmV282-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412302233.1gTmV282-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412302233.1gTmV282-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: compatible: ['google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186'] is valid under each of {'items': [{'const': 'google,starmie-sku0'}, {'const': 'google,starmie-sku2'}, {'const': 'google,starmie-sku3'}, {'const': 'google,starmie'}, {'const': 'mediatek,mt8186'}], 'type': 'array', 'minItems': 5, 'maxItems': 5}, {'items': [{'const': 'google,starmie-sku0'}, {'const': 'google,starmie-sku2'}, {'const': 'google,starmie-sku3'}, {'const': 'google,starmie'}, {'const': 'mediatek,mt8186'}], 'type': 'array', 'minItems': 5, 'maxItems': 5}
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /: compatible: ['google,starmie-sku1', 'google,starmie-sku4', 'google,starmie', 'mediatek,mt8186'] is valid under each of {'items': [{'const': 'google,starmie-sku1'}, {'const': 'google,starmie-sku4'}, {'const': 'google,starmie'}, {'const': 'mediatek,mt8186'}], 'type': 'array', 'minItems': 4, 'maxItems': 4}, {'items': [{'const': 'google,starmie-sku1'}, {'const': 'google,starmie-sku4'}, {'const': 'google,starmie'}, {'const': 'mediatek,mt8186'}], 'type': 'array', 'minItems': 4, 'maxItems': 4}
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
