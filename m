Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168181;
	b=Y8qehtjrdYjQAyESmnRGRBquor2bsVnILbvxZj8hAWhp3XyErdYAKY7hMTg6YYjqHKvw
	 THXnD5uDZGNTkg+heoJuLOhCCBx2UBUvkgGVkeQCsWhWvO9CXYTALMvhtnIGSCrAVfOC5
	 ddiP+8RAemDDURy+Mw71Te6wIHmWfc/Sx2NSb8rSyt9Don8INMpfCqpSuv+8j8PPPs1JJ
	 mYcTkDBQisyvC/c63MJ+VmEqAWOzMAm4r8JQ1hiPNPoEucJVEKHJ/4GGO1/RcjKQwypaD
	 /X08DKdx4XQDD27GtqRCzzWhkrzWJ/j73sGZVIUVk6H91xNexSRJ+dT+uOi58LdPZNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168181;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xVMh8qjJF9k87znfA+5zr0/uYTUZVGS14RNcAcYsL/c=;
	b=HUku1OdrjrrvWDjOdVbK+au6uo2aIZgBmSRWl6RLXykAj4+AGqd0T5M5A3WTCqLiJidV
	 1eCsA7/xVxsBrx5VUgnOdNYYrIOlr/kX47Sc+wwgfiORz1bkpRac0GezHUsNwjlL1qbp4
	 mybHa98GQ4QMBkcaAHTQitdVkZ0fx1VYpLe7M0crjr442CL5AHfwY7iCFe6BgtMVIraL/
	 X7gmkOhrPeRVa2MjIu0Yv4I6kWcD+xJrMwm7traSwjLiwC8XUZ2v8kp206I9f3d1a/CWj
	 TdbJ1nsZu9hRAxsVlUUOn/hxQWyNHh2sUk4J7+k0MIeTvQG5LHjKsNjgkQIIbY921Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LT4jQJks;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B06D606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 20:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B06D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LT4jQJks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794168181; x=1825704181;
  h=date:from:to:cc:subject:message-id;
  bh=Hg+BPttf3wqKdqna4+BlHABlQigDEk/lHPcgbdqjZr4=;
  b=LT4jQJksrkrRsQuprtV2V/f+LH2fSucZV232bXqoWbBmFvLaRhGbTtA7
   tQDLi9SQM5Dyp+4m17Wqg2IRUNj11ywak6gAuN8mDdL9DPFLM85gmbZ7V
   B3hiwzEiR9qJeYztkWSnpfxNRTZLS1d3Gmnw7mAEljNzIw+P5vVPIB+rl
   h0fSo2bg6qo0LXS+kLPhnveB98TrI+S2T1QVAHfGJXMVuTmpiEXVy3nyo
   Nzfeph68kC1/E1QgFaFSSBpvjk9vEl1sJrcd4dfVe8X7mmwePWZGc1LTF
   1/luZaxVntXbMoXzvS6gMCSP5YcG3UPd6eDN05ycAScGFEeYVHKOtZmAh
   g==;
X-CSE-ConnectionGUID: zjg8fzicThaCatjhhh5mRQ==
X-CSE-MsgGUID: IB89RTJmS3y0wQGtfC1kgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2905355"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2905355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 12:03:00 -0800
X-CSE-ConnectionGUID: Krrhq6FGQjaOpP1OgGq9Lg==
X-CSE-MsgGUID: gr5wkDMZS/e2eMV6cVysqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7840654"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2026 12:02:59 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ96P-00000000Bhf-0jMt;
	Sun, 08 Nov 2026 20:02:57 +0000
Date: Sun, 08 Nov 2026 21:02:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 23/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
Message-ID: <202611082015.gmERvmJn-lkp@intel.com>
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
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611082015.gmERvmJn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611082015.gmERvmJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611082015.gmERvmJn-lkp@intel.com/

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
