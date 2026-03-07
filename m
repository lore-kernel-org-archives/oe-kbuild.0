Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5803C0C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772875871; cv=none; b=KZk6fnYCr48y/PONPfteJYH14HdR2prNyH74UTz8Jw0hZ1afV3dWUuWbdQJ5U4Qxpa+lzxjm1Go9jSKovp0n0QSAk50tXVzJJZXu5JgR7iZZWjjfDQ+2TDtdeVPpC/Yd+4VZLMkCeEqpF1fDdpsrKyWvU5zsQRjqUYDR5WzHlns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772875871; c=relaxed/simple;
	bh=E36cm2nK1VjmXY+qs6JHu5t5uj0XLnvFkUl4wDfyz58=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tj2egKLtHUhvBfSKv8tYkFJO8nCT6EPSVi4+pBvqxrjK2iUFK2ZI1PmPyuuR81UOt6OxAYvNe7iZWMa7VQwUV9QJbaMgqzS/xXXSL6reaXo4H0dVjl3TmEpmRjbuVUJaZCvXeUJxVmcpDREkAxfSyou0eea+hM6lfI3VaWwdSP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ixrmlzlo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ixrmlzlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772875869; x=1804411869;
  h=date:from:to:cc:subject:message-id;
  bh=E36cm2nK1VjmXY+qs6JHu5t5uj0XLnvFkUl4wDfyz58=;
  b=Ixrmlzlo+Nr4NGKssRZTAKe4ocEew5/abod0daYhjNYRcSKAsTOZFT28
   I7OYA9I4iN2w6rilEeVukZqLOCzXJug87Uzd9az2lUn6HzDj73DGPmMNF
   sKH0S2z35XHwjW283odWTt1UtSjrcCXS7sKm4HlQwriCRDmchJBJ00o32
   +UlBL2i68HdDO1MyMLH7YDOgQux8m5Uq+/4zVl48e6O+YOvHMDR6RlIk7
   IWJiRlDKFU3E1JYSIbTn/mVZr3H2PRKVJhMs78M2RSggWGZwgRlN9CMbv
   z1PhEUDYCaAYwRFGc/mDPGH8Ar1XKXXzURGtZCX57I/RvBSJSW3ajIMSx
   A==;
X-CSE-ConnectionGUID: iOMNwid4RvuQBSikd8tzdg==
X-CSE-MsgGUID: 05COoKAVRMOlsCTwF/QFfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84685391"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="84685391"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 01:31:08 -0800
X-CSE-ConnectionGUID: PCIxQfrBRViFC7PMTLfDqQ==
X-CSE-MsgGUID: 1Jv2idbXT3iMvCt0DGR45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="219362226"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2026 01:31:08 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyo01-000000002S1-0Mrf;
	Sat, 07 Mar 2026 09:31:05 +0000
Date: Sat, 07 Mar 2026 10:30:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/n1d/enablement 6/6]
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: spi@50005000
 (renesas,r9a06g032-spi): Unevaluated properties are not allowed
 ('power-domains', 'spi-max-frequency' were unexpected)
Message-ID: <202603071001.Bbxf5Rfk-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement
head:   342f608aac69e74b76cfbf3733c5153220f4e896
commit: 342f608aac69e74b76cfbf3733c5153220f4e896 [6/6] enable FRAM
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-2051-20260306 (https://download.01.org/0day-ci/archive/20260307/202603071001.Bbxf5Rfk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071001.Bbxf5Rfk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071001.Bbxf5Rfk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:168.4-170.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:168.4-170.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:168.4-170.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts:190.2-191.22: Warning (interrupt_map): /soc/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts:190.2-191.22: Warning (interrupt_map): /soc/interrupt-controller@51000480:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: spi@50005000 (renesas,r9a06g032-spi): Unevaluated properties are not allowed ('power-domains', 'spi-max-frequency' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
