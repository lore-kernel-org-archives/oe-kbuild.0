Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849598;
	b=mY4mYY+P6WMbm1mHXQXihHShoKrsCfNpUZ4gVCjQtHVsuDyXOWysvD0tVWi19WAx4YjJ
	 WklQJhDZsoy52k09xlHOEkuoT2nZ1SL4WckBro8ZQaWIdxR9uJFXocobF/zlQRs+l3oxV
	 8ncv0FgMJhZcZE3IIm5lR2+vDM9jBYHYxFIpnhdE+4zWAo55LxNITYxoELXL9vjysDeHz
	 2CaOGZCkOYqdCpVIeDnE+6DQE7dTanR728OZdiQvritVV9jbU3iTEAt0kbat3JW+PayvT
	 tmkkCAEcbu8lgpOd13FbUOUFmDn4HERL4ZAsNCNsQ+v7PB/NuwgtXt+2JjfeI/OmPUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849598;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2vM6r/+//CsEcR2vVNivI5I3MD3fN7i5gVrkglfQwjU=;
	b=PRvE1fBt8KP8J/dGJ7RF0oAg2ATurHCesvQcaT+SVo932sPF4osxNXJcDwQGBxS9vPoy
	 5FZoqAsFja2N/RwGz4rKHmKm2gDEEoEUt/n6cK5lOcSOPmYT8kAxrfmDj9MASkSiCXGyN
	 TPAHYpEBud3x5892AA44KBy0KG/V3UaRAff+80p7/jkfsHHyDc3UAExMC+/Cgio6+sszh
	 ohzv2VYnuFW7czcfpfdahSNOnMSF1nD2t06uCru7si8tbwhS9EtV6YNcqmm9Tdot4OLza
	 79m2dwrJ1ZeeOzzDVaoVPU6tOBy6ePPJ3DJ+9hqwl/GLf2RwbOcSRga5NcYlZb++eYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfqb0dlv;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E2606A328
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 03:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 229E2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfqb0dlv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793849598; x=1825385598;
  h=date:from:to:cc:subject:message-id;
  bh=x+mV7bJw78X07Z/UbHnb0KPSqkhm6X4R9rpo4IahmI0=;
  b=lfqb0dlv6Uz9vxaDmbK+3yn8d0c6HRYTk1WlH8JNedzmnYc5gLM65W01
   Y0MspGLhtuhWhr2wJQVhzgEYQalbNvpqHoD+APySA5ATGJdjCyOFs0vLr
   ocAKpCLBbU6PZKsxFnQbFlH9YW4hFGS0tWejF6UVzXPDnyiUDN/GJv1ro
   5yDc7xZn0f0Nwf62vMp8hILddFzIZ3w3VmstX2urWh8/VYMoCoHg7cGyY
   +JX+U1Vkt+APuIEB5kudst1NUbALhNcFYEAVilpVoDecnGdGeKzXbvs6l
   25qC+5SDTwoSvbhbfgR8LpdYxywHnVt6itR9Cc4i0bepWD4uzVoiH2rEE
   A==;
X-CSE-ConnectionGUID: DkpWXiZvR9Grr+rcbAuFDA==
X-CSE-MsgGUID: BMYx89pIQDy+N2bIQBeQDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2511817"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2511817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:33:17 -0800
X-CSE-ConnectionGUID: 21LGYsLcRCaf3ZVLXlw1Cg==
X-CSE-MsgGUID: 1WeV0ygBSEWKPouZxFKdww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6958604"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2026 19:33:17 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOoDy-000000009U3-2Ulg;
	Thu, 05 Nov 2026 03:33:14 +0000
Date: Thu, 05 Nov 2026 04:32:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611050442.7XgVDgZP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mikhail Kalashnikov <iuncuim@gmail.com>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc
commit: 836aa9a16eef4207c85cc11171fb74b28bdccaeb [14/36] Allwinner: A523: add support for A523 THS0/1 controllers
:::::: branch date: 6 months ago
:::::: commit date: 6 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261105/202611050442.7XgVDgZP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050442.7XgVDgZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611050442.7XgVDgZP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
