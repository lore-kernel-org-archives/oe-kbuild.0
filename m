Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793470839;
	b=C65JNoC+/bInfobBNIHrk3S+L+uV6fYArDZLgZdVEpBQJLh4OVvGBJ0fWx2G5kzgefgC
	 1mdgckKVhe+nOMcKK1WAvMkFjzKuWaUdYC1F7cMOPNmLJnRHs0Nv/U3m+43PUu4XZxzO8
	 vraaxVktzR+vSX6moHEYelB/AeS3jwcY39f57nvvuTyR6HL0YZkIvrc61fidyN4S2tM+i
	 FZ+7zAfQWv3ng6g4N+YutmlsXb5RbUuLAcv7i7aKR33RR8QkHUAT7FhDJGMC6rCOr7AE+
	 QyBpLqTyo4kko2OfiZJrO7I8W19o/1VJTuKKc3jvl4pGLXEfnR2hnTGgFGk083K5VkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470839;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MRL5juPaOjrVrjPGzRN1VK7HXkthHbfW7EkoW2ktBcw=;
	b=WTyfjNWUaj79J/++T9OqFl1Kf+0+InkwQz8r2Ls5a+cxAjYBteet+2eeKIB0ujXriDVN
	 34Dzwn+6OaSGRcDoO/+4WLswLQAb0CvGrArLCZsK+n54Pcfi6m4SLY/r2WoIPKFHAVcwu
	 INDH2p8O4Yd0MVQuGpYu4N1KJGPPukagMc3MQ7/OJCcFnIYrUpqvdiw7Wg6I2NXd7csr3
	 qbjGSgzErYCCRGDTKAtOuyG7YDWa8iKHsq5bOoSQpvZGPQ0HY1GG1B/UeqTYm17jTbtk9
	 V12CbJlsaqRa9TURmyPBa9C/6uJ7yokYPLIcHLuBHhljG80YLUuo2D3g3tAYYSM8baA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cDN7DbpL;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB2606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 18:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFCB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cDN7DbpL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793470838; x=1825006838;
  h=date:from:to:cc:subject:message-id;
  bh=FhdSrRDc/ZRqh7g5bPvLxVhY678lvfEalmWRPGD3oRI=;
  b=cDN7DbpLabYqi6TPGJb0bHc7pBG+XiNkkgeBtzLYlBDTT3fzL7kv0GkE
   KUHKp46E0/I+fXJhjrOqTw5drdJsUUOPZunXVFMBpta5GNpqDAIYNIRSa
   09rGtMQsnSa5D4eZYK6YJiWIFdloQVqFYOHgtKB95qiXAIYYnndIigi5e
   UERDXmwt/24L1n6JiPcmj8ereMZh43WshWgQ4niSk1JWl1RpnTyRdRekC
   m8aNNjUwxmxNwQH9GPpH9KwX6Kus6qnQoJtRAvllsA65dtXwyZ8FKwu7C
   MJPs4HGZcC0ws5mc6SnbDYoJmCORtnjTzz4QBsCdy4dcIMxp+3+6443IL
   w==;
X-CSE-ConnectionGUID: r8OrP2CWTmydys2D+oOu9Q==
X-CSE-MsgGUID: cuMABkYtT/musaKroMwUlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2221450"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2221450"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 11:20:38 -0700
X-CSE-ConnectionGUID: qo+Sy+iXRBaCkdL2HoP4AQ==
X-CSE-MsgGUID: vOPKat3rSl+MAouBiXEVog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5670255"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2026 11:20:37 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNDgw-00000000651-1gyF;
	Sat, 31 Oct 2026 18:20:34 +0000
Date: Sat, 31 Oct 2026 19:20:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 23/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
Message-ID: <202610311921.OHGbvpsn-lkp@intel.com>
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
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261031/202610311921.OHGbvpsn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311921.OHGbvpsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610311921.OHGbvpsn-lkp@intel.com/

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
