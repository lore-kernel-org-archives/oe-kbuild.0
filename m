Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3891448E0
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 05:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786859539; cv=none; b=XjNAAoGy7ITxs1Xxrvt4BoZk7lUvCPIydreLLAxRfbvTqRoYbIHuluTTXYi+Qs9/mJqLEriLyT88ZNRd6w3URtXob/SEUGpcpafzipa3dcKzQStigehliVmKQ/uGzLZZWct0Qauqxb/XTPo73yFlSXP+kL6KzZwGJTRyfompPzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786859539; c=relaxed/simple;
	bh=Wmx2sdpQe/CwBi1rXEROn4CxReuy1AhkPM/yr1Sa/iY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JVTOQTrbYu6A58pHgNS06cutR4Lc8RijZB+zM2ZkbVbDZQ6WizP8+MDQHjjUTu8ifTsdz+akQ8pCR126b/ofXeALjA8fv9tWP5FRYbMqs0Lvea9/GvLT7Vp5jqXzu3an69ZGkaY+ip0sBbNIkzd4h4kkrvt3qp7f8hehLZy+SjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSN02KVu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSN02KVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786859537; x=1818395537;
  h=date:from:to:cc:subject:message-id;
  bh=Wmx2sdpQe/CwBi1rXEROn4CxReuy1AhkPM/yr1Sa/iY=;
  b=mSN02KVu1iJKa3JeA5GHcUOLjBXy9hRpOcRxdHARnlgThbNzHfmamBgE
   JxxQWJvKdRAESylq5SzI4GfaxMy86CIVzN4NsohjEPAFNmp5M2tOoeBKX
   +7ycKjIx24Yk/4c6CUdPDIEB8ORknqlQuypl/AXLEmyvehz8oO4j21rBW
   60PfuZveeE1D6jHupwPifFydyTxBfvAs9lbIleFe/Kb9SDhcJVWo/eeeq
   q0zxLS68/3robBg/uOqDWIF1gDytqSsKmgotIl9oWlUCQiu+do6Y7yZ63
   3PfewBhX4T3aPULdI3HpyNtTNbEOPZcKkoUOe3OGeH2bmGQX27WwNQHE4
   g==;
X-CSE-ConnectionGUID: tiUx/1SoQVKfzwibb2SDdA==
X-CSE-MsgGUID: L0b6ziFJQAeA2km/4Q/Jsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="104753842"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="104753842"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:52:17 -0700
X-CSE-ConnectionGUID: hAfbvRGaT/CKlFi98U1mPw==
X-CSE-MsgGUID: IwisNHaQRgyl8cHMEtBpUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="263268223"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Aug 2026 22:52:15 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvTn3-000000006Yl-2oKu;
	Sun, 16 Aug 2026 05:52:13 +0000
Date: Sun, 16 Aug 2026 07:51:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: aes@0
 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202608160705.fPBhQfDA-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: d0544657a28aade89e981bebdc116c628d750332 dt-bindings: crypto: Convert ti,omap2-aes to DT schema
date:   1 year, 2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm-randconfig-2053-20260813 (https://download.01.org/0day-ci/archive/20260816/202608160705.fPBhQfDA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160705.fPBhQfDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d0544657a28a ("dt-bindings: crypto: Convert ti,omap2-aes to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160705.fPBhQfDA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: crossbar@4a002a48 (ti,irq-crossbar): ti,irqs-safe-map: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,dra7-dss']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dss@0 (ti,dra7-dss): syscon-pll-ctrl: b'\x00\x00\x00\x0e\x00\x00\x058' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,dra7-dispc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dispc@0 (ti,dra7-dispc): syscon-pol: b'\x00\x00\x00\x0e\x00\x00\x054' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,dra7-hdmi']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: aes@0 (ti,omap4-aes): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
