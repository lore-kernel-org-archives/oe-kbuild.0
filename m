Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7B2F3C35
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757544258; cv=none; b=YkRVqpeem3TfZ4X9d1fkwBx5zETyG8FPFWrkloAXC96QW0LB7RGMfbhku/2hVLoU8T54df7FfIy8Tv+7REWrGe4lrkzogomwFrwTuknP0EYM35JyjZixg6CeEEaH4ZJqdMuCUvC1BvpGDK737xJsLtykskTYpo/Ycgi4xgef8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757544258; c=relaxed/simple;
	bh=i1lweVdK6y5ofmxqs7MfN6JX07ETLB+nzIgqLDtSqqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxHf/AS22OnJDy8L+4qZcIDZTmBnPrCzVeTYetVgzKiFeIdIiO04tYpJYbqtNv2fp9/iHwAqxXwDCC7Jpv0ghl6RPu5oCrFsDHocItJ1nND4WS5ktQfRHjM096O7MeAFGAwyPyYtAH4llkt8UB09RnJJhX8GRW4rTSERwT8sVxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uevf1dam; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uevf1dam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757544256; x=1789080256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1lweVdK6y5ofmxqs7MfN6JX07ETLB+nzIgqLDtSqqU=;
  b=Uevf1damMr9fTVT7+kyt6kFJ7os4qXPCY5z1WijC2ke5kX+OoTHugNYw
   Bbnn5yG0Gnqu/qGRWtYYFEcvlVkMbqpeRd6wXVwYXOUmL7z75uN/zTJsk
   sxyGIhCEdf+4vSZ8q2tANHOOfKwOyHF6P9f9lvPSVjwQrbSSvGP+O1IyY
   A0yamHpE6YIkQf4etVhOtZucyagqvlgIjtofFK5EeFiCdgvlgTkcTYg07
   1kFkfeuKB37UMWWfzNVx4vE0yfCIlbhAHqkX0FRRFNshntIo6IM2avGTb
   f1epJ3tcWhPE1RUvHmrg8+j79mWWHFfFcSApJCCql1S2VH9SKrFBkZM65
   g==;
X-CSE-ConnectionGUID: B03opRvHRU6nU1F1jgIUHg==
X-CSE-MsgGUID: FHQeewUVScmWmxirKJMyKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60013761"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="60013761"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 15:44:14 -0700
X-CSE-ConnectionGUID: 5N1lwH99T0GyLzejYacJCQ==
X-CSE-MsgGUID: Fx0Y4VISTHmTgxsMiCklVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173589980"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2025 15:44:13 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwTXu-0006LB-29;
	Wed, 10 Sep 2025 22:44:10 +0000
Date: Thu, 11 Sep 2025 06:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:x5h-upstream-2025-09-10 5/12]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720):
 Unevaluated properties are not allowed ('controller-0', 'controller-1' were
 unexpected)
Message-ID: <202509110638.mYkQyocE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>

tree:   https://github.com/morimoto/linux x5h-upstream-2025-09-10
head:   ea2c11195933acad22fb85797b61ec3e706362c5
commit: 67c04df51cea962b1cff2cc0e1e4c77373869c3e [5/12] arm64: renesas: Add R8A78000 Ironhide board code
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110638.mYkQyocE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110638.mYkQyocE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509110638.mYkQyocE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720): Unevaluated properties are not allowed ('controller-0', 'controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: controller-0 (cache): $nodename:0: 'controller-0' does not match 'cache'
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: controller-0 (cache): Unevaluated properties are not allowed ('$nodename', 'cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: controller-1 (cache): $nodename:0: 'controller-1' does not match 'cache'
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: controller-1 (cache): Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10000 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20000 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30000 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40000 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50000 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60000 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70000 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70100 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70200 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70300 (arm,cortex-a720): Unevaluated properties are not allowed ('cache-controller-0', 'cache-controller-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): cache-level: 1 is less than the minimum of 2
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('cache-level', 'cache-unified', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,rcar-gen5-scif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too long
   	['renesas,rcar-gen5-scif', 'renesas,scif'] is too short
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s72100']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r7s9210']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,rcar-gen5-scif' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
