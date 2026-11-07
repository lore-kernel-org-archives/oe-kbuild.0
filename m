Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794023199;
	b=hU+K5vVlFF1TU+6vRP54hJl1ixQ0iXkpcoM0FHmUgna9ufFOhTdk24CBaDEaNm+HC99Q
	 sksXU0sLMxYEJKYFG7/eoDavc/2AXSimI1jpLOMKj/8nmrzocy0jZJyP8oBISd5UnyyEZ
	 q0OmLEk1X7NdwTQ6nK1yvObVujXv+10UCtMxOpmRETyh+drdLZ1d3FXZ/L7ixX84MSTP7
	 OQWsV14wKny5FAQQR6V8Mu2CBF2asTWeygJQs/Gj2TLvEa1nfZjxJZ9CfueS4TPp/8lWM
	 DvMJeUZ5/3V1zgZaD3oqn6E8x9rpmkB3/VAO/gG2ec8eRyrozKYr2PlXnRbWy42Okww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023199;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=j8gLAlQ9az45lYiEPRPfZgPe7+f0CR8SZSV3tZPeEec=;
	b=FDr9ErgORBfEIk+E7nhoVN2mXM+984mXb9Ptb5OiXzm0iLKxSi40nZCG4P6V5VHBovn4
	 qbqOrYqv8y0ri1k7ptzm8PtERNWTwG3W6Skt3uJ0d/9f8hcfNQeH7RwIJbygJMbu5LAWY
	 8RpBKBqwPrM7BDPDRITwjZu9XI7vuGyvf8TkE7/aMxmOmmfM2NFE6XFhFPPd5fEtN36C5
	 pbw3GRWPecDUgWGNJu9opUBGKibMZ6lWEOVWe8ZiZ9iI/KCou5Dfma1c5icav5FsFgpE4
	 igftx8Fpm/FgDl7gOnverT1uUdaG1A1TyBQJ/cBfR0a0E+roX4Gv/KF85nUe67mqxwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=arYEro3X;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CEF606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 03:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=arYEro3X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794023198; x=1825559198;
  h=date:from:to:cc:subject:message-id;
  bh=bm57KUuQ7X1cXbwsmz/CFAsNjL/VIKJZeNYE96Eaf04=;
  b=arYEro3Xjio78NUuM7DOUl/rnrYVZlknwd2xEFFZqEug4nflf8+ElbnJ
   BFnIzh59JOpzgCoOKDVM3BJ8FyZkM4LvjqZsBjO/Ho2Dj+KFWm6XGrARb
   YWwuI1lF9CquMdhYMM6uBTfb1tGgal3gL8k6dIMtNiEn4GlnOUa8icLwD
   iCaRqb68OCi/ISTWdq22I4a1Ph6WRqvsgqt99RZrV0MGZglgQpQB6GfE0
   cPdkI5nGjDtIM9oo4PJJm5VtxIm3Ol46nmqsnLDzoM5ZplD858r9xSH9t
   ZadY5PaBfX8gHMzk2XdH9jtrQ4PJGKPp6J53DL653EMeM0BLiefpwj8Or
   g==;
X-CSE-ConnectionGUID: ZtpXJhZPQfKn0Z/u0yivfg==
X-CSE-MsgGUID: 17+pShm8TW23Z3htJI5R9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2851873"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2851873"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 19:46:38 -0800
X-CSE-ConnectionGUID: USXaJ8ZOS6aHnnORkXFBsQ==
X-CSE-MsgGUID: ePcEcbJ+Q9W8FLNMZbXQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7993518"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2026 19:46:36 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPXNx-00000000AWp-3nTI;
	Sat, 07 Nov 2026 03:46:33 +0000
Date: Sat, 07 Nov 2026 04:46:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jirislaby:devel 4006/4233]
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb: audio-codec@0 (wlf,wm5110):
 Unevaluated properties are not allowed ('wlf,ldoena-gpios', 'wlf,reset-gpios'
 were unexpected)
Message-ID: <202611070414.IY5Un3FN-lkp@intel.com>
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
TO: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   620eb83bf12d639093f7bf49dc68b2600b64a8d7
commit: 76ef3ed714ac178cda84ef39733d4f712e682081 [4006/4233] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611070414.IY5Un3FN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070414.IY5Un3FN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611070414.IY5Un3FN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb: audio-codec@0 (wlf,wm5110): Unevaluated properties are not allowed ('wlf,ldoena-gpios', 'wlf,reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/wlf,arizona.yaml
--
>> arch/arm64/boot/dts/exynos/exynos5433-tm2e.dtb: audio-codec@0 (wlf,wm5110): Unevaluated properties are not allowed ('wlf,ldoena-gpios', 'wlf,reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/wlf,arizona.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
