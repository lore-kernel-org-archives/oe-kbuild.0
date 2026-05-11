Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C181D555
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 00:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778459037; cv=none; b=paTyfRSI7OjBdqnRK6hihU/JMNXWX8jGDNEnk/SYoEzp2NVwYBCUmFAst00YuhRHaH9S0jrI5GLhO8wNEvSskoRiRfpaqJzic5It8e4aLLzX2lqFfU/veDptjyw2zIdOrvKBXq6i+kKSyA0mSFdSqwzZM/Gref9wwRjgfxPuG4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778459037; c=relaxed/simple;
	bh=VR8GG+mXrZynnX6gw+yoL+WbCtr9s0xqXaLFoiJwP/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e/P3ssP81RRv+JA//wm1lBaSJFxkOo3JANW6CspVeFj9a+oF3fgfrMluT0N0CwOyU/n+qAgMUoAkq/y70hszM8TvvFZYz7QDzi2EyU4PWwOHGpBiNbzXj+Lr0V8+pozZ2gM9LXKtv6GtZqOY6Tbc8pIRPByNu1sCPs5rgKHDsEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+WLIUl0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+WLIUl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778459034; x=1809995034;
  h=date:from:to:cc:subject:message-id;
  bh=VR8GG+mXrZynnX6gw+yoL+WbCtr9s0xqXaLFoiJwP/I=;
  b=g+WLIUl0D5r7RZFvJgPdjTNF9q69vUJ4qRgqPt00Ijz+LR4P+jivmNR+
   pocvuRSE/DrejlTynpo7SM3DuJvOaqcz8WlJe7mUlgKxJdBoUJB+VTZy4
   /1rsLBnZ4neMn40oP2HB+GDo+juuViwbnFIi4SkueDH8WyKYg1v+7siSC
   UOlaQxO08HjHZ0uNzYldzVbG9mkHqG/9L5AZxIt62GSWUUKItPu0GpDri
   s/hVeOxQ6BOevimimPIUh7e40xz2nJ9iOzzDS7IuWSO1UAPdhy4OObifW
   tXG/MYtH95kMoVUlmvOMXxs4ahvwVTMF7N+u1c0fg0/UuH6m2wAydNwBi
   Q==;
X-CSE-ConnectionGUID: hWMVFkQ/R8+CcnRIH1BbJA==
X-CSE-MsgGUID: PDE5XVJ3SiGyyY1qMbC0PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79367337"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79367337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 17:23:53 -0700
X-CSE-ConnectionGUID: 6QrnG/skR3uqTZXp8TLoTg==
X-CSE-MsgGUID: pp+FbJ8FSs6KNr6PSxFHpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="237399409"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2026 17:23:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMER3-000000007r1-48pc;
	Mon, 11 May 2026 00:23:49 +0000
Date: Mon, 11 May 2026 02:23:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb:
 spi@801c0000 (renesas,r9a09g087-xspi): clock-names:1: 'axi' was expected
Message-ID: <202605110246.CIzzSGfa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g077-Add-xSPI-nodes/20260510-012430
head:   671bd851db7bcd62669c0da58386b0478b4243ea
commit: 6a0e97070838f15305c3163b9590a379f581d20e arm64: dts: renesas: r9a09g087: Add xSPI nodes
date:   31 hours ago
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2055-20260510 (https://download.01.org/0day-ci/archive/20260511/202605110246.CIzzSGfa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110246.CIzzSGfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605110246.CIzzSGfa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c0000 (renesas,r9a09g087-xspi): clock-names:1: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c0000 (renesas,r9a09g087-xspi): clock-names: ['ahb', 'spi'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c0000 (renesas,r9a09g087-xspi): clocks: [[3, 1, 4], [3, 0, 22]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c0000 (renesas,r9a09g087-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g087-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c0000 (renesas,r9a09g087-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c0000 (renesas,r9a09g087-xspi): resets: [[3, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): clock-names:1: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): clock-names: ['ahb', 'spi'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): clocks: [[3, 1, 5], [3, 0, 23]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g087-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): resets: [[3, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
