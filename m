Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BA71509BD
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735482440; cv=none; b=dzddVsc7P390VoTcbq8IdWEXokipAx+4Xe8sniN/uSuCUExBc+pUFRDwnpB3gDsp59hjM6lCnFRUOgESUkUE3FTeBlvPtXYu4OZ9VMvtkfai5rZ/jwXCujxPN23/JfAO9+l7oRXBeb6MIKsL8Pz5IiqfYJZYx+Vxh5V1fv6xymo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735482440; c=relaxed/simple;
	bh=Tp/bMzQkcymIhPZQhEAiNj1QejkaUXbsbRUzzdZ5cJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=keSqzHcYoem1voSwMekzpvh9gBi2XtlQp0PQTWhsV5lG+PMu4yI6I1uMz73sy8VttlQMp1DABdUKrjKzT50vOgp8cD9MepK6KDbx1/5FQHZI8dRk0IVZVouJOQ6Da8jty163i/UPa7Wgc33tttdk/GnEGkjAFIVqBwoQR4yili8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ni2NTw6y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ni2NTw6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735482438; x=1767018438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tp/bMzQkcymIhPZQhEAiNj1QejkaUXbsbRUzzdZ5cJk=;
  b=ni2NTw6yMYbQjzFQ7oQvspluSyEn/yuYM7OiRAqSEWvmWuraZG8fTvY5
   p9Mj/iclNhKJbRfXvQdBNoMqhPVz9z9fVALUmZIE+PM6n27mS4gpztEsF
   yE4L33SeJR+CLnmdYgxMHosbHWKwSvRPCm6KxLRF485MfHKyeQH16p4KS
   o8/piT0eg3cxQeLnR6WZle/jNm+b4cNzyvh+Uto4fDI7pSjL7YsNwJNuE
   UnDK39xvJyjMM9YuEhqlWkOq5yCwZEt4Q+D5BVAUxuWTOrGt6+J9V26Xr
   arEZYDngpHpl9n8yKnvPnz7uooBaDI6zt8c3Fkjd6IHAd6W8p7msPQ5Kk
   Q==;
X-CSE-ConnectionGUID: Hm2H10DpRWyq+uNblRKTrg==
X-CSE-MsgGUID: wKfD6rsKTC+6Mo1YrCImQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35910350"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35910350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 06:27:18 -0800
X-CSE-ConnectionGUID: WDQngb7QQSOnyNz7er1hkQ==
X-CSE-MsgGUID: tHLzvuRvTEuF5tEohjOxpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="105544523"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Dec 2024 06:27:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRuGB-0004i4-04;
	Sun, 29 Dec 2024 14:27:15 +0000
Date: Sun, 29 Dec 2024 22:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 21/21]
 arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error:
 dt-bindings/clock/samsung,exynos990.h: No such file or directory
Message-ID: <202412292250.WVuRaE8b-lkp@intel.com>
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
TO: Igor Belwon <igor.belwon@mentallysanemainliners.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   f21231ac28f44cd5daf50bc8fdae381f451b46c9
commit: f21231ac28f44cd5daf50bc8fdae381f451b46c9 [21/21] arm64: dts: exynos990: Add clock management unit nodes
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-randconfig-002-20241229 (https://download.01.org/0day-ci/archive/20241229/202412292250.WVuRaE8b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412292250.WVuRaE8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412292250.WVuRaE8b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi:9,
                    from arch/arm64/boot/dts/exynos/exynos990-x1s.dts:9:
>> arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos990.h: No such file or directory
       8 | #include <dt-bindings/clock/samsung,exynos990.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi:9,
>>                  from arch/arm64/boot/dts/exynos/exynos990-x1s.dts:9:
   arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos990.h: No such file or directory
       8 | #include <dt-bindings/clock/samsung,exynos990.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

vim +8 arch/arm64/boot/dts/exynos/exynos990.dtsi

f21231ac28f44cd Igor Belwon 2024-12-24  @8  #include <dt-bindings/clock/samsung,exynos990.h>
1e5f14efd65caf1 Igor Belwon 2024-10-16   9  #include <dt-bindings/interrupt-controller/arm-gic.h>
1e5f14efd65caf1 Igor Belwon 2024-10-16  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
