Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542780;
	b=C8bhULAU9dQhZjJTWoM0pXPMbywG7EHZAqOg8bHCMHteYmcrG3wNr36TQvRMYvmGqbGW
	 AE8sCjqRcEYIN4gGxHIlIZj7Uu5R1V+0MD+JRRqfIYYAuqBcFR7YqcjDJsykEMECF/0+u
	 T+ua7U87PpM5Xn+Q6JUATn2BYFTKPzO0ecjgkyyKpPXDE0EaVh27M1dX2Fi7f/FN/Doun
	 cj/v9Fp7SMr410Vglom+aSz4Wsern9yBfi7xbNqyn39He4kMiGMYOGG67jFdA4AN0iALm
	 pHeT5dQdGFk4kILiKRxuuN7pTjjgPGtf5+L5Tt6UYMvq4c5E5xDsDqSro65TZQsojUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542780;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=29aarW9+J3Kdu86d2Fd98EzZRj4UDVxNxye9qBz0RHs=;
	b=mh8snwgcGjh3oGQPvS2wvBSPIthRR4bxz1HKrAMbvh9MT4kbVbR70ANLnuhbXlf2GDra
	 XCX2Fo9Zzw+0BkKOfM1BmLvQS3OPRmz4uAMvyAF+Sc1jyE8PofSVf8ZtLheO3uDN89czv
	 /sZz2563dZCi6dP/0YTlg66OJHqBYzRseaQPRsR0obNx1a/GnpSatXSwTQs4yuxFB8vqI
	 jTO5XjT8z89OHrji/rrliGK/Y3DOd3sHCgJnchlplFw1B2ROcBVf2nJnrdEiE0Ye8Hphf
	 izMrS9ywgiyvS+YiaWyyN8WrGzLQ6GTbCVY04aOEI6TN58abMAuopunQZ/zR8nnjwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F7VWErez;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B1D606A324
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 14:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B1D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F7VWErez
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793542778; x=1825078778;
  h=date:from:to:cc:subject:message-id;
  bh=01Ce5V4uO8TiNF/BV70A/8SUb0U8v8CuzgtmbzYH3Nw=;
  b=F7VWErezmA58BFIQ3CbZA634ciVoAMKeaSjVNqTXD9I3rbWlH+XF4DMU
   l+CCOaGSod68/vgVjfkhvdlrduQebSoQ6yjiZHZsDJySC1x88x2avAWQB
   m9RCvz3tFS+992TslL6VZXaFNVgnRuKolkRq+6zwdYXCLMkArAjLyI8a1
   DDWKjYyYPE/d9gDWB+XVoeLh5Tvyw2aNebqFY7oalhqfgD4X4kibfEntk
   LI0PjtrP0HSLzp4tv8r4+ildJEqrBEPN6rfLXp5goNdrFVH9WaXFtKvgw
   vWTNZef9H+IGj0aZh6+8+vrz9Uysrul39SSbdYZdikbkAD0lOkjph+dUc
   Q==;
X-CSE-ConnectionGUID: Fi0iM39PTYKRy5yUGw5IBQ==
X-CSE-MsgGUID: Sgo3jJbYTwyreaNa+4O+0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2129427"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2129427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 06:19:37 -0800
X-CSE-ConnectionGUID: 53374hUtTECpRIhKWB9x8g==
X-CSE-MsgGUID: d/2tRS7cT4qM9avsgzEU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5982605"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2026 06:19:35 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNWPF-000000007tt-3dT4;
	Sun, 01 Nov 2026 14:19:33 +0000
Date: Sun, 01 Nov 2026 15:19:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611011518.M9iTcaq0-lkp@intel.com>
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
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: 836aa9a16eef4207c85cc11171fb74b28bdccaeb [14/36] Allwinner: A523: add support for A523 THS0/1 controllers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261101/202611011518.M9iTcaq0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611011518.M9iTcaq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611011518.M9iTcaq0-lkp@intel.com/

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
