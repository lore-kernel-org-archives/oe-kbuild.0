Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244687;
	b=ec+TE7vSNfLDrgBC6jIeUxc258PtcV1qjV1L3KKAgg0+GoYb/fMlVlOo4OFcyhpvlqOY
	 ILIr+jW/A67gKEynJGoQ6tYgvv92/r9hwusNRjZS46wyRvwMG3ti4V0FyltGy7Vrsyvll
	 YYOisYNBg0HtnHnw4I+OYWDDJcFSY4aibz+gDvgdvRHRegM2n4VYkTHQosdyYwGW8b1+8
	 EzeOSyMYaQZIEgzhAkXHd1Xt+mCj94AKgCLb/2hHBeIWrTYa594oWZc+hDRFqJ2ukD1i+
	 ahxM5KqR+2G0F+iNiwhY7TcVmsXnK5+4KnUro6Mgbi6krz9T440+u44CM24sqDBjsdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244687;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zA0y8wim55oPZs3LEX7QvDwWmK+188bgCKcM4MsuuYg=;
	b=xRp6yCALj06zWYNVkOf7LkZISKIuWBPDKW2W3WKjUmo/u9dbnBHU51nM/+yZuITM04Nd
	 E1jU+sOUZa9DHzUYOeIMZVHV1qJ4axB4eUZfd1CjF5KWtl+6z7a1UBN9J3OAfrjQFt02Z
	 NTxd2AX0Nhpx8vms9Iu0BJotWUlAfoMpOfOEnnm2QPGgthovzDNQY0d723o8J9Z7njTnR
	 r9W720xVFpaGiuTfGORD5xnFhsvfjLCoFzOGSA7ip+wsK5XZpiFgMvofaXHChvqr/Mg84
	 hgac50sm3BA2DU32Hw6FX1Y7TO97L5/9wThfXW92p6R0nMbzoJxnu7FwxXRPat+z+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cgohk52G;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EB2606EE84
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 17:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EB2606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cgohk52G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794244687; x=1825780687;
  h=date:from:to:cc:subject:message-id;
  bh=vA6fwBFqnS2Y6xl4OBiA2+tEviODVsgUED+XBSLvbz4=;
  b=cgohk52GAw2RlIBAMTRRGiZ67bgfkJFtbMlvCsEYL119V6I87LReheRR
   19jgMlhwR3jeSNUvyKxsCi2rllnp3i6q33pjr4hQ1mQ2ZICbkts7Q/MRc
   l2xHPt7cEpavkUNDSoa3ntnHbaJcOZTmejXf4OigyWBLer35pJy5yyD8+
   F4tByHwKoM/5DkABNj9GyWBekQ2ilXcN8KLeJl3PjDGSuhwWbt2yGe8V6
   CTDvOwB3GxB7u6lRK6ES6gG4gkIFSQB/3C4fayPEw5Va3htWDOmentEjA
   FmTn3tDnLLjgaumXiqD+6YXZFSHZn/oS5ZHfuyy/ggjEXhzYLtC/A/aYe
   A==;
X-CSE-ConnectionGUID: K48a8/GcQ3m1gwg8lRdnMw==
X-CSE-MsgGUID: 59E33sXSRDKseDGSU858UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2963708"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2963708"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:18:06 -0800
X-CSE-ConnectionGUID: YjgTuVRESWGozDVAbwALkw==
X-CSE-MsgGUID: ngAVh8jhRQiIIsLqF3e8RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9659073"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 09 Nov 2026 09:18:04 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQT0I-000000000Pr-440x;
	Mon, 09 Nov 2026 17:17:58 +0000
Date: Mon, 09 Nov 2026 18:17:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 23/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
Message-ID: <202611091813.KfRMEAC1-lkp@intel.com>
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
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611091813.KfRMEAC1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091813.KfRMEAC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611091813.KfRMEAC1-lkp@intel.com/

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
