Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759115;
	b=OGhgKoSsPWLfU1GiK2eNdubpRU2qG1d85fO49l32erJ/ZOjFV5y4EhGfcS3SOmB8La6c
	 WKFStZX4ZnKuluGtarhZ29uZppd1caV8l8T+K6fFNpFAYceZNHTyUhDi++qvDVwv3qROl
	 WGwRISJ390vLeLsu7CvYHmB1sB7vuumXaURSEfz06S3wR12clRil2XV62R5/pFkCs3jnu
	 B+6nUg3YaoYHKw1WGJRmi5IBRstGPg3OX5WrP3jKV0vMi/PCeckZYEGFBlcq5lKiDzsb5
	 6m5aMqVjeE0EUeFv239xQemskt8MTWJsAvb23tUwYQLkeF0+cSJqed5Dj6aJx3lJfew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=J+2PCZAHWlntDFoqr8TYVhRXDZZeOdXt01oYa+yoCP0=;
	b=lKCMoVcn/3dgSJ3D4xdinxe/Sb9Un4dXT8RKKvHjd/BUBzVpoH078jqFPoBlD4tWv5D2
	 A1yH0eYon5PQ7pvw45Oj+RIMteC5zB7VU54MueGc1WhbJn9oo6ljX5YbNQN3ZmbLJs4xk
	 ZwvMC0f5g2IiLfegbx5r2LKLKVaDWrMF5sZP3AaiW1Esc/iWe2ZgQmeO7XPA6P8ulc3ta
	 O6FIoTPZxqJpO5LE13QA7q9e87l5bZMD+b8NlKvel6bIncHTjBk5CJ73FKTyIDGnSUO25
	 KqZDs+m0RnYW1HGxZQHX7TOaw5pM3pozJTakdFuhx9T24viDhIzv//7/BEZjLUF2y2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wr5eVCA4;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67761606A31B
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 02:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67761606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wr5eVCA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793759115; x=1825295115;
  h=date:from:to:cc:subject:message-id;
  bh=xmmcLySnSFs4xkzlzGIfJ9Ahao9lCX76XEqxFVPcG20=;
  b=Wr5eVCA4fy/I51acOmKH2jziPd0aZRu23vwvDl0ORB609fA5aoY3e+Pg
   GvBsA0Lq5NHMAGp4AndRDCmjJF175s0OyT1pxPG1M+v7vOdCD/+vSDx7r
   jjfAmfvtyI7hz4boz3pg+xbkcNT23TCevwk1TwIKmT+snL4tZ0S+3il3U
   46+R5FokRvcPIpjKYQKyfD8AlealB6+SSN3FksywSVKfGngn4G4EO1SCk
   QDSV77fV8S09bL/dnbJqcZDyq7envfqkYx9PeXVA8K60L0sye580sa/Sr
   kg+PpoRWzsl3VCz7IKcGm09lMKJPgFSNkYO3dxxNCrTPdwD0Tqh5mWOo9
   Q==;
X-CSE-ConnectionGUID: sEfwZ/G3SoGs7JBhDJc5xg==
X-CSE-MsgGUID: t0hQ7wF1SEO/Dhe+Vvcp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2382053"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2382053"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 18:25:15 -0800
X-CSE-ConnectionGUID: /KMdyp4xTFWZWnf49aSj9A==
X-CSE-MsgGUID: Gy31eWNsRJ25pPLQ2lPO/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8363171"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 03 Nov 2026 18:25:13 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOQgZ-0000000093X-1E8T;
	Wed, 04 Nov 2026 02:25:11 +0000
Date: Wed, 04 Nov 2026 03:24:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 23/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
Message-ID: <202611040340.BacBClHp-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: 6755898ee7c90fe59112bfdfaa83760abb765b0c [23/36] arm64: dts: allwinner: a523: Add audio codec
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261104/202611040340.BacBClHp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040340.BacBClHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611040340.BacBClHp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
