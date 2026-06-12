Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B03793CE
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252650; cv=none; b=dk4Tsvxw+NiBw+jNOWCsRAHeRR8uIUefbh15Q7/PMmS1XRBWFBhOKLA20ymyq4tAO6KdwjNXmyFHIcHXkX2ywq/+RINXF2rdGyP8y7KRb8Wypy5f7urkix8fqOyRm0GJ3SQkSsjvOsFimNE0jUm7QDQprjIod+HcGjlmWJUwN70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252650; c=relaxed/simple;
	bh=0A9mgxEVN1+ezlEupC3CGk+/UokeYa6Jf4jxAbaCUF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eTkUtZ+dTMuPSwT4IH9Zb2eg9UOnttbJH7fmHnivDHTI31yJAqzzFfkv9XnUa1L2HKOJn169+v2IhDJfW1F6qnebNqJekNmEN3j32u3QmH730TKXLd4TzwT7lLgZ74DyI1AVSbnBlyA7XlRKW1MAV7OLyxxYsmG8mMYLO4q4LWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2sc3DEp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2sc3DEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781252645; x=1812788645;
  h=date:from:to:cc:subject:message-id;
  bh=0A9mgxEVN1+ezlEupC3CGk+/UokeYa6Jf4jxAbaCUF8=;
  b=I2sc3DEpHr5epzRandEMfNYD9VQ0UEBUyjdE/GDqMGJ6NCcmqZurxhZ7
   /a8KiEVcWLh4gP3l5vZJD68N+WK9e0vTVSD0RhCGSPMe08rr1x5jaDXV8
   W3P5kqGGSHaGunhKZ6a/O4VKJMmBcz+QJ2Qyh2pfRIeN57OEvp6Q7tqLG
   KHVxLASaQDspNvjYdp+grRWwxoCsNKvg/a7SD1U8kVas28jPUXrv3GXjl
   WwGMg1VgPttXwQH5h11itAkOyrUypMqWN2kwFhGpfLLiqzoN2QDibauuf
   cs4LVq75o9sFXkbCWTLDdDdDrGWMaB9G8KVWGsojSPhCAXtjKE71R7p1N
   A==;
X-CSE-ConnectionGUID: 1Ca9J7KHQky0qjtFCsB1OQ==
X-CSE-MsgGUID: 8hpJawO1TG+2Qu3gzYayHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93190729"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="93190729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:24:05 -0700
X-CSE-ConnectionGUID: YISmeef1Qp6SLIUPYL51rg==
X-CSE-MsgGUID: sSvR8MFhTU+CIWmIqbIM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251050055"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2026 01:24:04 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXxBJ-000000004EP-42kO;
	Fri, 12 Jun 2026 08:24:01 +0000
Date: Fri, 12 Jun 2026 10:23:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:sunxi/dt-2 11/11]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000
 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71,
 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4],
 [0, 85, 4], [0, 140, 4]] is ...
Message-ID: <202606121034.bdDIdpsd-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Andre Przywara <andre.przywara@arm.com>
CC: "Chen-Yu Tsai" <wens@kernel.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sunxi/dt-2
head:   6b81aa0c8a4f038712fa549e4d44d8279eeb0440
commit: 6b81aa0c8a4f038712fa549e4d44d8279eeb0440 [11/11] arm64: dts: allwinner: a523: Add missing GPIO interrupt
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-2052-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121034.bdDIdpsd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121034.bdDIdpsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606121034.bdDIdpsd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:108.6-1104.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: /soc/adc@2009000: failed to match any schema with compatible: ['allwinner,sun55i-a523-gpadc']
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:108.6-1104.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: /soc/adc@2009000: failed to match any schema with compatible: ['allwinner,sun55i-a523-gpadc']
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:108.6-1104.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: /soc/adc@2009000: failed to match any schema with compatible: ['allwinner,sun55i-a523-gpadc']
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:108.6-1104.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: /soc/adc@2009000: failed to match any schema with compatible: ['allwinner,sun55i-a523-gpadc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
