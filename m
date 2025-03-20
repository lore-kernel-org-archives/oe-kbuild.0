Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B4822576E
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742492192; cv=none; b=El1jHXehsPn9yWzgo9dKfxoARU8Cs2GqC5XgOSdJyJxgfOl1yagM21BL6vzoDV47Rbv/ehM+uBo5wL/ezEMLIbbVOp9bZWNek4ZqsytkflmkJVQgwTbr+SnSEBl6QRgx7nj/YhOCPmDwc3QC58oM9d2/oEyADK/k8AKKd5EcNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742492192; c=relaxed/simple;
	bh=waBVhbpad5UEPWHH88buySw4fCr2UtJKm3qtVJFXsGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IP6EnLtA0nD73JcYMg5zOWwSYue5Hpnrk9N7HNCVl5FGp3GZhXiafgQ6VwhpfkRHSCiuqUetQni392j26xIjlprxyAZDZjqATKXU/5viC95VAx4cyUTcS++xbpcmOcjBmBDHzGRIBdeTduuC8gze0sGiqK1s1UHRJ0QTSr+GERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b26FNJ/P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b26FNJ/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742492191; x=1774028191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=waBVhbpad5UEPWHH88buySw4fCr2UtJKm3qtVJFXsGI=;
  b=b26FNJ/PBJHPqdrU+rTZm/TI4m1u+D7fwcNX+62/OqOsHQbk14KApXTA
   v2VDQlKrfN092Z1//fQs9oWR7wQn3cTgFYMlDw06A0IXRgPNV2zlzf2TZ
   CxDPJESOO1SKMXBKc94PwHr46cdTv68/jsr1KgWMWNnc/PBC+rc+/W1qo
   n1YsVho2DXmgf/WrBXVqjSRIfCu5UybT59AJiYc/yHptSV0ZTbQT4KQ6V
   VqRKu1gbzie1ly64bu+Qde0Uer4UkcG6EY0mBHuKWWEkZo6c49t/kcgX0
   EjHy5U//BsJ52tJ3Zf3SgpxcgsbQyf7MllHxhGrLIuJy5jQoSOaS2bSQG
   A==;
X-CSE-ConnectionGUID: AlszHaBJS4u8vYkyUV1Yjg==
X-CSE-MsgGUID: Ozy5P0KxSiuSApfncX44HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="53960059"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="53960059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 10:36:30 -0700
X-CSE-ConnectionGUID: pgQQ6pB9QJaViVsSbge1gg==
X-CSE-MsgGUID: 7U67yDuqTCmY9eUMQpvCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123187999"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 10:36:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvJoc-0000dZ-2G;
	Thu, 20 Mar 2025 17:36:23 +0000
Date: Fri, 21 Mar 2025 01:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-18-2 11/11]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: spi@e6ea0000:
 Unevaluated properties are not allowed ('port' was unexpected)
Message-ID: <202503210145.AZaAAysQ-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-18-2
head:   920e565f45c3b4a2065fdab49586b975b90f1712
commit: 920e565f45c3b4a2065fdab49586b975b90f1712 [11/11] arm64: dts: renesas: sparrow hawk: Add MSIOF Sound support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250319 (https://download.01.org/0day-ci/archive/20250321/202503210145.AZaAAysQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210145.AZaAAysQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503210145.AZaAAysQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: spi@e6ea0000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: sound@ec5a0000: clock-names: ['ssiu.0', 'ssi.0', 'clkin', 'adg'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: sound@ec5a0000: clock-names:3: 'adg' is not one of ['ssi.0', 'ssiu.0', 'clkin']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi: Unevaluated properties are not allowed ('gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
