Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274532;
	b=BThdEKUS+8mUl3uFBS6OiqddJTW6rLScxgxs0KcHUslmcreNlr/udPPfROD/pBAs/dzs
	 4CxB+Xd4CmyevUJY4bIA0ksgrHw/b73lj+0fR/XbtkcCqogDeqi/DxemT2Xyq+uhH5R86
	 Ataw53gSnRwUGTerDzDBC8DDtpc046wXy8jeUVQOQ1413OfK/CYHiZHXpIdU96AezYaJ2
	 A0NB+v7hepFxTM7k1YJWs8KaEtXIKvYC9dX5NrqqBPIE28y0p/TafCoeW/Wv4/OUQufXi
	 5LPwNj3KceeFkpH75uDXihcn/E4amTwCmi2+hzGrxLFAwhpxZx+sNyTbm2Kge28qQfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274532;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RPXC3Ep1WsuH/priYpS1BfcBF1li+JkRQEfgfjZqAuw=;
	b=aJDIMDPZhqxgccKzM6GPgLEfMOHyLHhE+piEYwGcoZkWB2IYADIVrxpEgeT43qwLwXIu
	 G0n1e3BFjQQkZMHMDx4BteRehlpitqGZ1alkHCCfiZN0vM2ybzxN5jZlUrftrXeF+XR/8
	 MhYDSFgfyiuN1LRixWvhiDtOu7Im5p4lTADKiQa4ugADVfmpxfnIUdbi3uprkGr2v05j/
	 1KSM5l2vEcwRvVOo4KmX+c54KC+/VAp70GV/u3nLcn3xet2SpL1LWB4pXYA9pvpXPYNik
	 90V9JngWhyLqxjBqMcBa3V9vtZ2jvL5mYAVNoqQQgZDJROo4ugNx8e21AzOMXkl0kDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="kY7tw/pC";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6361606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 01:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6361606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kY7tw/pC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794274532; x=1825810532;
  h=date:from:to:cc:subject:message-id;
  bh=2sSWetnXqLnqgaiTwAoMnUV+LIF4Ko8Vc1myztCFmGo=;
  b=kY7tw/pClOajxP0qEjDwERjvFpwlSWri2EnS3bnedopp2I8r3GV1quab
   xbnn2Zro+maNzqtos/oxEha6H9STQn635B7hWbH/XGWqpom1oeZ6ui0LS
   1y4GK1LGsFBy5PunxbajhoEdIjgD7QbwwTI8CDSn0nn8S5p9Y34n0tPbI
   ezpE6Ogxci1wHC1avrtzuTgj7JLEItUrEyyKY5YHeWHo6ofbciW8xYGVK
   vfbyEU3XgGPAJojo3wMRUwO9SQnpHiI6XAiHjq03DRsle7t9z2quftfGO
   Z4IeDJiREjpEk1XZVUy7/hFNqgpvbMmDX6WbYn4z1QVCmppCbY5HFMnp/
   Q==;
X-CSE-ConnectionGUID: TIGJgqa/S7WBJ6e8FXBs8w==
X-CSE-MsgGUID: jJgPOoVnQneKUynYYrNSQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3046843"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3046843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 17:35:31 -0800
X-CSE-ConnectionGUID: 9zVFly8uTpy4TroRJ+wXow==
X-CSE-MsgGUID: GN9W1K9rQnCcW2VZSTzKyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7876791"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2026 17:35:30 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQalj-00000000099-07iO;
	Tue, 10 Nov 2026 01:35:27 +0000
Date: Tue, 10 Nov 2026 02:34:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 24/36]
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed
 ('audio-routing', 'widgets' were unexpected)
Message-ID: <202611100226.ACLnBi3N-lkp@intel.com>
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
commit: c790c92683a4515ea55fcbdab4ba6e59551b6f21 [24/36] arm64: dts: allwinner: t527: orangepi-4a: Enable audio codec
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611100226.ACLnBi3N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100226.ACLnBi3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611100226.ACLnBi3N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1227.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed ('audio-routing', 'widgets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
