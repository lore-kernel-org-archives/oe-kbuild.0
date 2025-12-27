Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291C23BD1F
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766849863; cv=none; b=CO+GIwTW5CXXyedgJVgwyi1UvjdCcB/yj7qHG0GRlDYqSjkC84l0I4qkclOIKudp56rBzYPLHAL34ud0/exM+qOCJ/OFekospXW902wJgbFYh0HA0JeBxnD2yJDNYEZWWJkde5y8cOambJT1wbjLxBESMIKbhALsET6RK25BKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766849863; c=relaxed/simple;
	bh=4GCNt4Hy7Zd03U2UJkNS2GkBVNwEFII1mHIm/g2nLkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXJUYvh2rkCSEnCtke2us0oDrNDfcshux3tGaY0vwvv3ubYvpcn3JIGr2APooqNBYBN1J+2DUn3zXtGQppGafGnvKFAa/9LUi8k4f+R/81Z+bcdciCSASkxINHU8I2YwFLTf1oTXGXr58LK768wahc4o7Wjak2HNn/HY27J3zwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuKTGH5T; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuKTGH5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766849862; x=1798385862;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4GCNt4Hy7Zd03U2UJkNS2GkBVNwEFII1mHIm/g2nLkY=;
  b=iuKTGH5T9uyfqaEhitTe/0g4gmRHyCKg54NvoZRSoAu0UxALapJWXSGJ
   K00PJh33u+2Rs6XoSr/qnCUsRP++nqbqsuAmK3C0K0CXU1Q9jLd50730Z
   9cqJGQjCC+DnYhHGzrwQGZSR/p/cB/VknhbUvhNWRePmPPkCM5jnldHRc
   ekyn0qOkRztr1pVHHgwKPx6EMkDxF6L4CHUPms6zYEmbZ9/dfDwg9nVoe
   hBauBwegZUHbkcEtUjngaFGWE0whf1qYAfL4b5n9GYCMaABBOWFTO75BE
   zv3Abp//qiVNnqQHKF8Y8Y641Ou6WnKFh5o2y4640BVq2CVslL3fNOpB0
   g==;
X-CSE-ConnectionGUID: Gjekha/fRIuSQ2yLudBgzw==
X-CSE-MsgGUID: aGZbdsOhQyiwtoURwcBl0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79270197"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79270197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:37:41 -0800
X-CSE-ConnectionGUID: JUbXowSjS8CyFIiIRs7DgA==
X-CSE-MsgGUID: LXHQJWG3R3GgjYXeHO0EvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200589246"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2025 07:37:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZWMM-000000007Dw-09d5;
	Sat, 27 Dec 2025 15:37:38 +0000
Date: Sat, 27 Dec 2025 16:36:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/clk 3/5]
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb:
 clock-controller@10010000 (google,gs101-cmu-misc): 'samsung,sysreg' is a
 required property
Message-ID: <202512271619.2yfg8VA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Griffin <peter.griffin@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: "André Draszik" <andre.draszik@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/clk
head:   eaf9206bf3d68f792ecd5e6f488eab1fb5afe900
commit: 2e8e9a2492edbbef54de6ab1c5bf1578ffef4c8c [3/5] dt-bindings: clock: google,gs101-clock: add samsung,sysreg property as required
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251227/202512271619.2yfg8VA4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271619.2yfg8VA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512271619.2yfg8VA4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@10010000 (google,gs101-cmu-misc): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@10800000 (google,gs101-cmu-peric0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@10c00000 (google,gs101-cmu-peric1): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@11000000 (google,gs101-cmu-hsi0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@14400000 (google,gs101-cmu-hsi2): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@17400000 (google,gs101-cmu-apm): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
--
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@10010000 (google,gs101-cmu-misc): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@10800000 (google,gs101-cmu-peric0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@10c00000 (google,gs101-cmu-peric1): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@11000000 (google,gs101-cmu-hsi0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@14400000 (google,gs101-cmu-hsi2): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@17400000 (google,gs101-cmu-apm): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
