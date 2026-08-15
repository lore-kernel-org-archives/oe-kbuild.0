Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202E33ADB3
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 23:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838114; cv=none; b=L8SpnJtdtAMIQywOL8daaZwNuYAhIUGxhJ2lFz8pEaDboUIet3lfQOaje7GO56Bn/GC/O1RtOCRn9J1ydJAEdWR+2V8YPpzKpiXYZb51A2GZVyADQQUVU8MKMIwb87HeXv3A0aIhtnssvr6z6WHQIL9NfshUpgNcuNlqZib8yvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838114; c=relaxed/simple;
	bh=sbqk10l8jphGZeStLEJmgtdO3B/evyXVFhyyPV93pQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k3RzYT/QZjMGeQLdwyweEFb14fuANOYQVSNvhSE+jPSY8KuL/SYvKgGriblzyFOfN8OaynnUbaZFX5dAFBUIBJ4mlkE9PkawvajU7YSNnegpBJEP579emZ1FPmczJIsdLRqi86/FyUYI51uCGIQRdEogYFnzVJPNlrEZYpHfcqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6dwsFSt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6dwsFSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786838110; x=1818374110;
  h=date:from:to:cc:subject:message-id;
  bh=sbqk10l8jphGZeStLEJmgtdO3B/evyXVFhyyPV93pQA=;
  b=Y6dwsFStuZP1y36B2VNlxCisDE/fdiX2bISBW2nUIt5Batv6fAB9YpSe
   BA+fOlKJrCVjq5OL22Y7yQHmofioY/aJctsygCDzjiX+CXY6BtPUeFk2n
   YtxOtA3LDbdgDV9L7x/Un2+UiL4F4KOArcW+KlRVCswRrM7tkd1Jhb27C
   jjwFoeRwJxDHUgMgv/dxvyK/CWFjuaLNWgMUbAiJ6sYJaRAqBKfifwl2j
   U9YEUSD1pdhgzoULTMNPsgfKmDiETas7uIEqNXEWaacotOE5ro4R38Q4+
   q9TVcMIWk3150G4pSyXQLwQnLEXHqWAmx/Cc9D1ohNDJOrNpbVzTn1767
   Q==;
X-CSE-ConnectionGUID: qvxtZ0eDRDijSoqgDYgGKQ==
X-CSE-MsgGUID: yHvAVqGxR02SYCn3wIuw6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98881572"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="98881572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 16:55:10 -0700
X-CSE-ConnectionGUID: Fp71jTuYSwiT1W2aHhN58w==
X-CSE-MsgGUID: R0EGRfVlTpScNysoHB7OFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="289367054"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2026 16:55:08 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvODS-000000006V1-21H9;
	Sat, 15 Aug 2026 23:55:06 +0000
Date: Sun, 16 Aug 2026 01:54:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608160142.A3NlrWqk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marek Vasut <marek.vasut@mailbox.org>
CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: 67934f248e64bdfb13f2a9091019a9d7d9b2980d arm64: dts: imx95: Describe Mali G310 GPU
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260816/202608160142.A3NlrWqk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160142.A3NlrWqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160142.A3NlrWqk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:55.18-58.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi:276.9-288.5: Warning (graph_child_address): /soc/bus@42000000/i2c@42530000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:535.19-558.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx95.dtsi:560.23-579.5: Warning (simple_bus_reg): /soc/funnel-sys: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
