Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5053B42D9
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 23:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908634; cv=none; b=dWA0IidF3vSy+dyfNMt5OUhM2TJfSqat8gqG3yUoqCGJavJEEHUVEoI6j4UHoQfcR/YBwgwYVgo9Uti5yBBMUAKUOq6oNr1DGUtUvMJF02WII62FVDLIkxdgyyBlXjDN+6IISsRPgnuzFBUTgnaye+J9Jc/JQ1KnkbIGROsODtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908634; c=relaxed/simple;
	bh=ZJwPKisWkVjgHegms93grg3u5wN3eJn+JtfguIUy+cs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WOZam5HpHtHy2eWpoJhzPGCzywXCIAou5N2m98sl7zy19MEHqPlp48dtTs7dSzIRyMlqQ/CmGEoQxeEJnuUmL7uEvgqvI2QLSEgH0L2D/s5v2ISlbEiXwB5omX94FCNagm+J2v/6e/ay9s/T/4dv0aaaY/OcDp9b4KmJGr7T2Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNqupr5P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNqupr5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788908633; x=1820444633;
  h=date:from:to:cc:subject:message-id;
  bh=ZJwPKisWkVjgHegms93grg3u5wN3eJn+JtfguIUy+cs=;
  b=CNqupr5Pa0lStBE1JWfCljMX7CcSf3Oc/Y3ziFJxB0Oa233l6klhaJ1U
   jc9y2yzFw6avWIlR3u6xeGFFChn8O/qD2YyTQoN2bUlJGSxND/VGqiAvK
   saG1ofM5KKIgpBuisYDuhAKjGeIJrQ1xPiMuwRVoQh2axqoRAwVSec8Xv
   3DrTC39LlstIQmfHHVPhFZymoAhYXkiOptz+gzszT/gQ3qUa3soqxmVfG
   utA8ulI80ZSZ3ifmiZVHYLBGfB9B8jvg7Wq6nksy5TI7sESb9ta0RILCb
   NrARPrBO5S/Xwpg3lBAE6amn4dZOiah63Op3IyCv5P3BXpjmiD+KNrAiK
   w==;
X-CSE-ConnectionGUID: amc6mnSoRmmhi9ATXkuc2g==
X-CSE-MsgGUID: SjBikilOREqwMcb4Eb9XRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89366152"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89366152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 16:03:52 -0700
X-CSE-ConnectionGUID: RFDqAQ4uQ3GdVk0+aoWBTw==
X-CSE-MsgGUID: ia8omGeNQBGF00VeaG8FGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="274919219"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2026 16:03:51 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x44qy-000000000ug-1Kj0;
	Tue, 08 Sep 2026 23:03:48 +0000
Date: Wed, 09 Sep 2026 01:02:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12]
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: soc (simple-bus):
 'adla@0xfe371000' does not match any of the regexes: '.*-names$',
 '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$',
 '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9...
Message-ID: <202609090040.NDuBDsvN-lkp@intel.com>
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
TO: Ronald Claveau <linux-kernel-dev@aliel.fr>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   3729dea89f4ad77930792d1afd34a3bac456c7a1
commit: 3729dea89f4ad77930792d1afd34a3bac456c7a1 [12/12] Temporary use Adla Legacy driver
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-2052-20260908 (https://download.01.org/0day-ci/archive/20260909/202609090040.NDuBDsvN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090040.NDuBDsvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609090040.NDuBDsvN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:317.34-583.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:317.34-583.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:871.25-899.6: Warning (simple_bus_reg): /soc/adla@0xfe371000: simple-bus unit address format error, expected "fe371000"
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: soc (simple-bus): 'adla@0xfe371000' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: /soc/adla@0xfe371000: failed to match any schema with compatible: ['amlogic,adla']
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: adla@0xfe371000 (amlogic,adla): dev_name: b'adla\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: adla@0xfe371000 (amlogic,adla): nn_hw_version: b'r2p0\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:317.34-583.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:317.34-583.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:871.25-899.6: Warning (simple_bus_reg): /soc/adla@0xfe371000: simple-bus unit address format error, expected "fe371000"
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: soc (simple-bus): adla@0xfe371000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: soc (simple-bus): 'adla@0xfe371000' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: /soc/adla@0xfe371000: failed to match any schema with compatible: ['amlogic,adla']
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: adla@0xfe371000 (amlogic,adla): dev_name: b'adla\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: adla@0xfe371000 (amlogic,adla): nn_hw_version: b'r2p0\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
