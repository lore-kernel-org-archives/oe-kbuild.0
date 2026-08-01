Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AD527B34E
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Aug 2026 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785582885; cv=none; b=a/vzlU70IynEVtvQqQOyrUE4KBq0f/xcoEGJQgVS6WjTX0Xrm7x7MKKnyf2zBIgvKkwxHUMXHFdee/ApsTcN4NOlwYLWTGjiUVX/zzGuPAY3kNtVQ/NFsFRQytYt5IRSZaLT/dcnFZobeUD9f7Ncw5v1u0XtxK6r0+Q8MrVDpNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785582885; c=relaxed/simple;
	bh=nsoGDG+Md18r5Rfnz3uUAfxh7ZuFjPZuZvHyXfOGw6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZVelzM6t8Rr2cXvNYoU5VH4qQ35PLAiWODOlBUSO++gVu7FENfaTmHJ0NaRjE6L1ExHlsdk++gkAWFXJBsgOvL4YhkGk4WKfDQL7UI1LWzP/ycDiCQM9dconUbhWbzx9lvc9o9bOcXqPT9MxuntMVrcm3AGmOOFdQrTkrJp3hVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbWKItWp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbWKItWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785582883; x=1817118883;
  h=date:from:to:cc:subject:message-id;
  bh=nsoGDG+Md18r5Rfnz3uUAfxh7ZuFjPZuZvHyXfOGw6c=;
  b=EbWKItWpuOfhuEEWnMZnz5hqg5jwLrLDAtQzxj5FIPLcKL1lfXq2UQEC
   iXCR2iMegr4pcqfCvaQeEEtWsz57PRa4HcxhgnZlCAlluRgglwIh+j73i
   MbsjxAqFDcb+YTcvD55RhkPAdp6yYfIWbzIcGOrsf79cwGIWOWxW6zW/q
   0Ae1cGKUwDw3XnJG2Ue5la9EIWwy8dsJ6FUvqDkaDzXbQOZi4eBFC1mwE
   UjwqKaFtaWG8SHz/km6AUBV5H0lDSUhVxBeCXvp8X7TRedb5WSyhuk+A/
   wNjeXKNNPNyYz0Cdf/n/JFlFHO+Xc44fASaxy2wVjznZ1h2wgO3IzCbXm
   A==;
X-CSE-ConnectionGUID: doBa1tubQzWh5wwe+8SFCQ==
X-CSE-MsgGUID: LszNxcPZR8mwvFzTeZM/9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86145552"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86145552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 04:14:41 -0700
X-CSE-ConnectionGUID: ZGVci+ZmTnenKz07TdTn6A==
X-CSE-MsgGUID: /U7uyiTHS2C8xdqPuTer8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="259554326"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Aug 2026 04:14:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq7fq-000000003SU-35a2;
	Sat, 01 Aug 2026 11:14:38 +0000
Date: Sat, 01 Aug 2026 13:13:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb:
 /bus@0/ethernet@2490000: failed to match any schema with compatible:
 ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos',
 'snps,dwc-qos-ethernet-4.10']
Message-ID: <202608011323.51RrhEQB-lkp@intel.com>
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
TO: Jiqi Li <lijq9@lenovo.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiqi-Li/dt-bindings-arm-tegra-Add-lenovo-thinkedge-se70-compatible-string/20260731-184028
head:   1f6479a1e4d8b9405370c202e3b933904667a7d8
commit: 1f6479a1e4d8b9405370c202e3b933904667a7d8 arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
date:   24 hours ago
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2055-20260731 (https://download.01.org/0day-ci/archive/20260801/202608011323.51RrhEQB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011323.51RrhEQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608011323.51RrhEQB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: pmic@3c (maxim,max20024): regulators: 'in-sd4-supply', 'sd4' do not match any of the regexes: '^(sd[0-3]|ldo[0-8])$', '^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
