Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BC49620
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434666; cv=none; b=CiTmxILP9H3vyV+VnJOFk89M5hGmBwB75gvnwCuI4qntWJsUSCkTuaHtuBcX9+GloxVIrASCfU0oTq+p0g1CqGrNH/NWjETpIg64g/wa1fC0iZHTpRH8xqRgd2Ci5xGYi2e0OmxRCPOc/v3ma3DKyhh810u2Aayny3VqwvZxRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434666; c=relaxed/simple;
	bh=nVmvmCzv2fpDOLtA4q/OwyW9GhaOeV0jcHosGBmEO/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XD3wvuSgnYFaqxEMrBfV4PV+oHb9xx8OZu3Cswz3YXmfz9AdP/MN6zUHp+5ywZ6a5df/VN/kcCgJ3yB5kXZF3lUpif00ePYQ478QHlzMzZHeu+M1Pz5jfZwoTaeza4vxfe2QYfkcaWOQ0adc7bxm2b7ka78iXmO5ZjcHRh5dxI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtYJukkR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtYJukkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779434665; x=1810970665;
  h=date:from:to:cc:subject:message-id;
  bh=nVmvmCzv2fpDOLtA4q/OwyW9GhaOeV0jcHosGBmEO/c=;
  b=JtYJukkRVcoD2eHcv8t9DNxrr/JIhfxiYz2zpcQmKxMeH9Ig9qRIr6IP
   od+WPVFikqG7kdeSwkdcVGtLp9SgBWNsdnHEqUDn7z2zUdZrPakrXX8va
   sI50N8dVyMGS1zna8PpYMb9E0EJHbXwALNh4n72Y5rHuvSILWpwBUNjry
   B0u5tPspOhVz2xjw/Su5gb2MuGdbqleBrhlEjVgpw5k1Ovl5yA3O9or3c
   f7LpIMntHtD5dtVXuUsWchtpD8YBIjqDV82xtfWJ03TSQ9yy0h0TlfM7o
   zBnZ8kKtBAj6pTa0A85PWziSxyI9IPZxv99YJ7aor9YsLxMPyUXAyTxDC
   Q==;
X-CSE-ConnectionGUID: pjz10zyUTrmuvZjtf2bPlA==
X-CSE-MsgGUID: CGCR6FzoSuW3nxWSc4EgjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91051765"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="91051765"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 00:24:24 -0700
X-CSE-ConnectionGUID: BfOfZW4USDyNMBhY7W3X0w==
X-CSE-MsgGUID: 4tlqrqWHRgGtVv9fVee+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="245829025"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2026 00:24:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQKF2-00000000BHB-1SUh;
	Fri, 22 May 2026 07:24:20 +0000
Date: Fri, 22 May 2026 09:23:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000
 (fsl,mpic): 'clock-frequency' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605220922.gBicrz5t-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: a241f1a1b338b714e4d7417f71af9a93a9bd3c92 dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema
date:   1 year ago
:::::: branch date: 12 months ago
:::::: commit date: 1 year ago
config: powerpc-randconfig-2052-20260521 (https://download.01.org/0day-ci/archive/20260522/202605220922.gBicrz5t-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220922.gBicrz5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a241f1a1b338 ("dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605220922.gBicrz5t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
