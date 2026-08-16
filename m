Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048BA3E0092
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786878920; cv=none; b=qTJC6Ow5xUbZAEaR88p++BcCwhI2EzJqo5mba8VuUP7CsbqofTulsse7eIn2oRyqeedUHUv9u8BwByPnRoC9GAhZggcbigOmVmEakGccYrC0UuF00bIxeqqno1tuwcyLh2yse6eo5CuMqIviC2j0G+xDMwtmSye7+u9NecJ0Vcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786878920; c=relaxed/simple;
	bh=oefjsVAJrpBl0WxAC/QN3+yKC2TyisrcEWBE2Vf/C8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qOafp2vbu/iIZ6MKOWEDbmoF4efkX5a3NbrgEvGzP+HroKiY59azHvbc21/+giKB3bKG6iV6moK19JIGRQaT0rXjvAzAI67z7+X7HeQ39mnodl9EpFkPBskiI03lRGAKaLRkvv3dbWpLvLg6T++PVdhkqW+tB17CBr47CXBWb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPxOIKgA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPxOIKgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786878919; x=1818414919;
  h=date:from:to:cc:subject:message-id;
  bh=oefjsVAJrpBl0WxAC/QN3+yKC2TyisrcEWBE2Vf/C8s=;
  b=kPxOIKgAzD3lQuiU1AgRb9PJdwlAMjh4QAwvFTzJnvJVBWAQashhYN8l
   jKgfWHENbxxaMWrbyH1f8XZw3XmBrqqLR7QXvNLylXtOMoYEN4hTL73wR
   /uZhN2xM1nE+BqJoU3nb4DoNXXAeVlp+ji2y2kWRkruUE6+6MvKuONtZl
   lu1L0IfRTVbegZ5Q5Wz77FCkvMZIKZoTt0C2o7mftDqURSqOs9o+GSOtR
   X4C0k4UaFKx/Hd35RIsCqw5fPC2T1BLB3l4CMtGhj5LK4fPTujeEG4mE5
   plN5q/cum95z9wl6sQTjfc6SlZ99dHpahJ3Xc5Ii3iDFXYPv2Y0YO0kMy
   Q==;
X-CSE-ConnectionGUID: nY33QtVQQiSjJymIRYDZIg==
X-CSE-MsgGUID: /Hsd5WakRnKvMViZ3NGNaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="112924498"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="112924498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 04:15:18 -0700
X-CSE-ConnectionGUID: uG0BI7vjSkG536stTgGMdw==
X-CSE-MsgGUID: UWtDXseWRsKCvRG+Fg3iWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="266648943"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2026 04:15:17 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvYpf-000000006a5-1ybi;
	Sun, 16 Aug 2026 11:15:15 +0000
Date: Sun, 16 Aug 2026 13:15:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb:
 /soc/pcie@80000000: failed to match any schema with compatible:
 ['spacemit,k3-pcie']
Message-ID: <202608161309.2wycKfiK-lkp@intel.com>
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
TO: Inochi Amaoto <inochiama@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/riscv-dts-spacemit-k3-add-USB-controller-and-USB-phy-support/20260812-203140
head:   b6366af0c50a292c49c62e395c5e161a001eef83
commit: b6366af0c50a292c49c62e395c5e161a001eef83 riscv: dts: spacemit: k3: Add PCIe device node
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-2051-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161309.2wycKfiK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161309.2wycKfiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161309.2wycKfiK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80400000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80800000: failed to match any schema with compatible: ['spacemit,k3-pcie']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@80c00000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pcie@81000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/phy@81d00000: failed to match any schema with compatible: ['spacemit,k3-combo-phy']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@81d00000 (spacemit,k3-combo-phy): spacemit,apb-spare: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80400000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80800000: failed to match any schema with compatible: ['spacemit,k3-pcie']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@80c00000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pcie@81000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/phy@81d00000: failed to match any schema with compatible: ['spacemit,k3-combo-phy']
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: phy@81d00000 (spacemit,k3-combo-phy): spacemit,apb-spare: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80400000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80800000: failed to match any schema with compatible: ['spacemit,k3-pcie']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@80c00000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pcie@81000000: failed to match any schema with compatible: ['spacemit,k3-pcie']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/phy@81d00000: failed to match any schema with compatible: ['spacemit,k3-combo-phy']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@81d00000 (spacemit,k3-combo-phy): spacemit,apb-spare: b'\x00\x00\x00\x14' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
