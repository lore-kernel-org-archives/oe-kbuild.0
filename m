Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085202;
	b=hEwcTyqxigsGuLFuDGwg5TpfpKNjZwoHPJX5RNEsBda2H3XcZGk1hKmyM5xBWwEg6t84
	 Fb/JL1MlpguCkCVqGm/WEoF/gIoPPYco02bKlrw1Cf+LUZtOiIrj1F9Cin4ddSGv8zD9h
	 FyzzP4R0G38+vnd5Gb9g4RNH2+UYoauNKNPmPp61QoPtz8B6B0lUFiDfsMRayGLKOsJ5S
	 am1mSBZuYwM6qC94wbZR6IZ52p4LFwJnOMwuPLzHuHxMtQOmG5xGemKqWKfRL741NBfN/
	 yJXFzPBYUyyJEVRxsizl9RBImYEDrlWCBuSYM5sE4LwjljduUNc+N9gNKOgK7Ge7z2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085202;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9mB6bst0ea6Em6K38/KG9ykB/uxXe8ZiRroI/Ywde8M=;
	b=PWvwgmLBB3ilbWLjINHatZu/wDxixOIPu34tVaaWgt6f4MSqzf+0sG/ERUASlvhIs1US
	 Xy/Ng4B7IMcsGvVqpeYX5drXJa/Ll5ka1KTAk6hjNzpYEoMvAyHuJ1CHAGlp5SWsD9Ag0
	 bYobKD1golknyqwON6B/pLsSOswHFPLLtCOkSXjXL91OXl+L7QzeU2DX39vLsxdBs6RU/
	 r2yw6eXKkxloMC+nAkjDhajsyTIDt+BwarXUb52I5xRk8Sy4v9/C3Q4jR3G3VT92/wWwk
	 GD7Nd7s8UHdSthV+I7kNzYvsNf6/xwF9up/lrw8YKwgYVVNoXyib//p+2Fmdbvl7UhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lsu6s6Rg;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3250606A32C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 20:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3250606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lsu6s6Rg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794085200; x=1825621200;
  h=date:from:to:cc:subject:message-id;
  bh=AiPQk0axld9C1qXOdj7SeKRY+PZOkr3Ua6YZUlEjzZU=;
  b=Lsu6s6Rgjo43SIeZ0k4PNYFfS0qnEjKc6FEAjg6WADGeDpJdscXO9FTU
   VKSoveEANFXcv0S/rtel7zyqdrxp9xksZAMG7hKWVCjJIDqMM2ZEC4MmC
   SgvHmJfPdtntNGli3pJeMZdOuRQkBnD2+pClXDPH5i8ART9bRb1XN/SCo
   7qJlyrI3QYajE0T03DjSyPnBVI02sZpwhQpbZnxKYza5se4pVwnTB3fdT
   u56zusJyB+UgVu9EyVszVr6RmgwZY85xK1P8c85qmV9O17nnpkA/maJcX
   pB2GncjRZsr+8Ieyb5O3iDDZMhXe0fP1C3EJEXQLbpQR6R+iGuPFO766T
   Q==;
X-CSE-ConnectionGUID: 36AZ9Ib/TC+sSFuj/ULfkA==
X-CSE-MsgGUID: 42X/TSqRTCKciqa+uHpeNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2860744"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2860744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 12:59:59 -0800
X-CSE-ConnectionGUID: nr2kDml7RlCz8iabsJw+Pg==
X-CSE-MsgGUID: t3YtSOhTS0+RoZ+p86NOYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="8122952"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2026 12:59:59 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPnW0-00000000Amx-0dGx;
	Sat, 07 Nov 2026 20:59:56 +0000
Date: Sat, 07 Nov 2026 21:59:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 24/36]
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: codec@7110000
 (allwinner,sun55i-a523-codec): Unevaluated properties are not allowed
 ('audio-routing', 'widgets' were unexpected)
Message-ID: <202611072157.aoKaL0js-lkp@intel.com>
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
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611072157.aoKaL0js-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072157.aoKaL0js-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611072157.aoKaL0js-lkp@intel.com/

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
