Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8232FE579
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047636; cv=none; b=LbyAAxIai1n7dwflWTEyijEHsKnT5GoG0WWUQSOwTP1DSfRzcvCWG3f8w8iWVYAO6MvibD3u2TlkItnBlaq6+di9cW7OgiXdCykTtzY76LQPb6QHytfGs1kTdJGxrC22/cKBPUSydAmVglkLzYEa271vtp9FEdibMkqsB8d2BLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047636; c=relaxed/simple;
	bh=Baxq2CQsMzPPVJPiv8QuTa21QhdrcwrcsXvQt6c+cyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sZU8+t8eGsZ3VFRcTlLREetiBMlewGx6bVszSIWi2O8kJmVzoidv5xaAvcxUfgTLWr2JcR3QmUzLMtmtThW2jizdzNTnpsESyP8lLaZqpHa86V3kP4QVym8HZI2wymObVWaS3ldwQBmp8DcxgfRyGjLK36vqsf/f5cttXlng2rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjHC77nb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjHC77nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778047635; x=1809583635;
  h=date:from:to:cc:subject:message-id;
  bh=Baxq2CQsMzPPVJPiv8QuTa21QhdrcwrcsXvQt6c+cyo=;
  b=PjHC77nbTAM+BX8Y6vU4JVj3bjCuCpn7mZ0nmYKnpJfryi8C+O2jnXzS
   t8nmnS8nuyyqJtjUYzwSEHTcPfWm89IFZVLJmPrvsqMVlv91YozvsIkkD
   Q64NlEgu+VwRHt/IIIRe7MSQZADHV0aRQ8FygYr8emBcV2o7vNjEIosJ2
   /9RaBKjnsEH7fSt4ykQATUpsoFsrMxC3m1Mrz2T8QvW6uc5AtYBdaXC1V
   sfrT+c9tAOfqCGBgGUdP9rMAf5hFZ778msc7MClPoO3OFG04b6At9ACmz
   6/xNdECyR5SlevJvGkAJJz5Kax3QTha5OJs6C2ekv4fMIENSjRruXSDvv
   A==;
X-CSE-ConnectionGUID: ghT32MAfQ2ut/l4HtorxtA==
X-CSE-MsgGUID: mbMyxoqgTKWWtGRFCPSYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="101609297"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="101609297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:07:13 -0700
X-CSE-ConnectionGUID: VnFeQkzaSYuaPJAYXXplkg==
X-CSE-MsgGUID: ThsnhEgORluuOBu5czWL4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="241012226"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2026 23:07:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKVPZ-000000006Rv-2Q7A;
	Wed, 06 May 2026 06:07:09 +0000
Date: Wed, 06 May 2026 08:06:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb:
 usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
Message-ID: <202605060701.buw7wcrU-lkp@intel.com>
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
TO: Alexandre MINETTE <contact@alex-min.fr>
CC: 0day robot <lkp@intel.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-MINETTE-via-B4-Relay/dt-bindings-arm-qcom-Add-Samsung-Galaxy-S4/20260503-092020
head:   5eea8ec897bc79e313f44f6f0d08c7f613989dbd
commit: 130405e7d7f70a6895bebbf783030b687e1fc138 ARM: dts: qcom: apq8064: Fix USB controller clocks
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20260503 (https://download.01.org/0day-ci/archive/20260506/202605060701.buw7wcrU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060701.buw7wcrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605060701.buw7wcrU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1136.21-1184.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1202.21-1256.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 295], [24, 297]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12530000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12530000 (qcom,ci-hdrc): clocks: [[17, 10], [24, 298], [24, 300]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
