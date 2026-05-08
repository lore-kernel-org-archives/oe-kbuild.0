Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61B12CDBE
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245318; cv=none; b=PiByF09kOqRGnNlAVHJPJYMWS38Q3TZCBiXms8v3AVWV697nCIex1vJe/metk7+EF9Xl8tw1J57VZ/gl3uSGxWMs4U7GA53+OCdCSKbY/Guv0Iddpto0hmiXslx0jjMEs6Xwhw+7wCwQMcw+y2ncApghPnXQgy1oPTU17YokAhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245318; c=relaxed/simple;
	bh=e3Vf//8PRqoRLWD9OZcAt6oUmNrjBTL4t/FXLYIKNoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U1rR3ClrccpH594mCy89W5sXefxtVbLvR69X9zbxOE5JV0lL+04dX1ElKrXkkC31nqRIaIwNGxD5hI7S0LqynKz5oSzX19eC2QcPxSYOffoGQqHN8Z9q4HCmgnvXdPqSDxGi9naX5MCbWnIBt9TMr9jITBS/7BWa3zYt0ZV5H4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGroAA0g; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGroAA0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778245317; x=1809781317;
  h=date:from:to:cc:subject:message-id;
  bh=e3Vf//8PRqoRLWD9OZcAt6oUmNrjBTL4t/FXLYIKNoo=;
  b=ZGroAA0gVG95VNHtvsPw3lQwdlXlrFg971YrzCBmK1+1RV59Ml3hoJE5
   wE027QRtGgDnIxAeFSVqSdLjapBFv+a7Q+Utalngq49BTBXPYrsv7YPKj
   P/3tT3+Qjs2mgSLBiMtgou66T2FN6iJEoLFcc1AKAOtcpHosIxemTVpPb
   sJtI9P+771/BSblRnW8jIl32dSeWlJXl4GBxAvkH2gL/sbwfu44hJ+5jH
   vz17ZNUIUcjvj2Y4RTsyu3cL2x4ctkTE6WxMUCrFWPbQt/5MLaudPUuO6
   K6eABtUCH3p8t8pmx7hhkC3n2DbNriMDEliYqn2lxRJSLcoQF4Q5yRXMP
   A==;
X-CSE-ConnectionGUID: BxBZmmttT2yomaG787oQkQ==
X-CSE-MsgGUID: WtXHmc+FS+qGsE3C6sTXAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="101884431"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="101884431"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 06:01:57 -0700
X-CSE-ConnectionGUID: EHFNF049QBe5C+SNZUkEAg==
X-CSE-MsgGUID: +3N7LhBqS8aMiZdctTIN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="237005081"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2026 06:01:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLKq1-000000007Ab-03n9;
	Fri, 08 May 2026 13:01:53 +0000
Date: Fri, 08 May 2026 15:01:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:fileLjDUpB 6/17]
 arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680
 (marvell,armada-380-spi): Unevaluated properties are not allowed
 ('spi-max-frequency' was unexpected)
Message-ID: <202605081559.YcGyeMH9-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileLjDUpB
head:   951a6d8d41289b86a564ee5563ededa702b62b1b
commit: 7105fdd54a14bee49371b39374a61b3c967d74cb [6/17] spi: dt-bindings: Convert marvell,orion-spi to DT schema
:::::: branch date: 10 months ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260508/202605081559.YcGyeMH9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081559.YcGyeMH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081559.YcGyeMH9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
