Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33D31B114
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293143; cv=none; b=u1IWjMpMyk6JTxjsMiOF/ESN6oamjZ7yVF4rGx4HXyN1ym+3l+7q7bNy3Igvwh1LFu2UX4PsA4QkKqO9ZT02+rZ2NZ7aw6bfaHTZuKvMJZTaXWrtfa3ZycahDhrTvgtp3l/E0YQBbLJE2Gsk97iqaTlgxoh/XD/rFWVjmME57hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293143; c=relaxed/simple;
	bh=Ov7qwn3FIKN/TIlFNmY3Ns4wOvQ3J5avK+DKJyc/SiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DGSiTHplVSi+sPNTYmnP3jCwjyV4GH1uUvIFhrNW5zeAwv+OSunKkvH9ROKopcpO43eg9fk0NjJFTE0PPbHx8gQwUhvDawzwxKZ5N9pEbYQzjB9ShOg4QPCDuAegf0MDVQTQCJUfinEgHEq5n+uiMPKInQlhjppNUyDbrERVDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAR3ApsE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAR3ApsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779293140; x=1810829140;
  h=date:from:to:cc:subject:message-id;
  bh=Ov7qwn3FIKN/TIlFNmY3Ns4wOvQ3J5avK+DKJyc/SiE=;
  b=gAR3ApsE05CgdgXOdN5btxVaHq1KLFpR1aweTiolXFkiG8EUKTPm+1OS
   9mMxzyWg9HIowJPMIevNgRSR4p6w5sV9gfrQkhUd79VQ6FMaFN/KxqqGY
   x6etdXxrt2GLZI0wxIg4D0jtuzk9rqkqEhUFMFU6NZWKrhSt+N3428sNi
   /Y8jnB3HzE65QMJzptIfatoPQHpSODEkbqTZ5JikFlXT+yFGyzKr83PVI
   4iB8WVCStKIrFBlZBVV23WdKdUtEAFO0RK26fn6QzF3fx5iPFofCGqRer
   Oexqkjb3f2psCpLxzZD3sCWLKuv3Qpcf6fd/xGZznX6DZhW5nQoQVDHme
   Q==;
X-CSE-ConnectionGUID: GvNUakhgT+W+FCQQZRjb7A==
X-CSE-MsgGUID: y2d8N2FIRruzL2zlXZ/PoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84054669"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="84054669"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 09:05:40 -0700
X-CSE-ConnectionGUID: VpyXgCYgT9OxQ8k4XvHQzw==
X-CSE-MsgGUID: 8v36sBwHQbKYI+xMwNstLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="242035371"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2026 09:05:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPjQO-00000000Aaj-3vId;
	Wed, 20 May 2026 16:05:36 +0000
Date: Wed, 20 May 2026 18:04:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0
 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
Message-ID: <202605201807.ReavUbdJ-lkp@intel.com>
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
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tanmay-Kathpalia/dt-bindings-reset-altr-add-COMBOPHY_RESET-for-Agilex5/20260514-171032
head:   622e0667dd0c2dd40581a3ccfb6c36f7afb1da3e
commit: e8cde37a60c80c9a28c2a8daba9121f983fc7012 arm64: dts: agilex5: add Cadence SD6HC controller and SOCDK enablement
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201807.ReavUbdJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201807.ReavUbdJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605201807.ReavUbdJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: mmc@10808000 (altr,agilex5-sd6hc): Unevaluated properties are not allowed ('dma-coherent', 'fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:303.39-309.5: Warning (simple_bus_reg): /soc@0/regulator-fixed-3p3v: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:311.33-318.5: Warning (simple_bus_reg): /soc@0/regulator-1p8v: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-1p8v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: soc@0 (simple-bus): regulator-fixed-3p3v: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: regulator-1p8v (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
