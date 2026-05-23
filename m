Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B1B1E834B
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779551993; cv=none; b=PUctNZfLRAUTpkIdX/TZqHJ/2wvx6EplFTXzU+LfGYNm2YUeJfQnhC33vcJA54BiETB0eDpsLrE7NhDVCkkyTAajUzO8PumqkcSaFCxLsdT+S2jrj21ZsiGc13USBt5qyrd9A3j+4T5qlIn6JG1fS52frRsBdmbiPa76Nkt3CKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779551993; c=relaxed/simple;
	bh=LIr9uuv4FpeP8rCwEbU8Me5B7OC9FELEn2eBns5Ccog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jPtar8mJxPD+xoNJyvIyd+Iw8jOp/RGRhFzLtHSTnbfY2Gk6dlEMB4UwDowsSUrpdFIoXgJjQOF9pB0UEuRYAM9oIgnYddT7YuZoHh74Qwr2/gL6RLcdVT2Zqju15YJcRUCGG04lQBiflEd3V9zkOxmVOieH45zOkvx0bw2xCag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5DazbrF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5DazbrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779551992; x=1811087992;
  h=date:from:to:cc:subject:message-id;
  bh=LIr9uuv4FpeP8rCwEbU8Me5B7OC9FELEn2eBns5Ccog=;
  b=U5DazbrFedyFQkZLvtTZHOT2x+4llcepmvXjCfZavzJ0a0CQSMGo5HqA
   GUyh/L4p5JVy8IWJblM4jqiX9Z0IsmDEM9GkjV2DoxkMLQpqo7/YnIoz8
   +/64GyDhix93VxcNael8IUMs7n+clGEIORAk3AEJzyTtKdlhNiuNA7y1f
   gWqhTgJhy+wCG95TpMbXLHD0hi8+AsdfTotC5Fy8onYapq2lUMSmiyYfr
   kXMBZ79gXmgPnZHuSwdsSJDltLccPBKk8s7UzbHMId/r7e77/YK2tB6bu
   SMTnbQs5Fk1Ybz0IN4xL2o9Y2awqZzWx0ZpRqwGE3rmiF18B9RnshbgJP
   w==;
X-CSE-ConnectionGUID: lSijSzoFTXSk4GBFc8AT5w==
X-CSE-MsgGUID: eDVz/utAThG4QhrVCcdeYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="67974712"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67974712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 08:59:51 -0700
X-CSE-ConnectionGUID: EdgcSBUPRP2tJMC1D7N4jA==
X-CSE-MsgGUID: yfKu1QIqTCi1jtT+VYgWHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="236965867"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2026 08:59:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQolQ-00000000Bib-14Bu;
	Sat, 23 May 2026 15:59:48 +0000
Date: Sat, 23 May 2026 17:59:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb:
 thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605231722.6BIjwqII-lkp@intel.com>
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
TO: Mikhail Kalashnikov <iuncuim@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mikhail-Kalashnikov/dt-bindings-thermal-sun8i-Add-A523-THS0-1-controllers/20260515-061944
head:   fd2e043ee04669728bc62d45ac156ac82f6c5d29
commit: fd2e043ee04669728bc62d45ac156ac82f6c5d29 Allwinner: A523: add support for A523 THS0/1 controllers
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2055-20260522 (https://download.01.org/0day-ci/archive/20260523/202605231722.6BIjwqII-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231722.6BIjwqII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231722.6BIjwqII-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:116.6-1075.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:116.6-1075.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:116.6-1075.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:116.6-1075.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
