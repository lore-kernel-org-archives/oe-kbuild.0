Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F437C114
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541737; cv=none; b=GyMy7Mi0kfJppb+grJ9i/OiqqmuUpGPNsSy2wZiGsuPlZ/h/jhjjaHzhtuwh4Cawg8wHH4h6PK18wKxmxO2+rNJDZ/Cpsddm5Zk1k5pgaaxl18DSYm9GsYNF2CtiAFX9AR/v6C2uRbkpOc4G8N5/jkU9KpCvKwmmfrJKHf9O54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541737; c=relaxed/simple;
	bh=PErzquAHa39RlNAmD9e4Rj/+FyctIGq60Djo1Wq3dUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bBgkrTno7PSFqJaC/hZuXuhUztpWvSjVFu7lSCBC/EgO9a3ZX1/qGITjBDEpXF2wss9ShXIOK8+4aFHK6gupoPKhi8d8U8DuWm2VqFEwi+feTvp+T4XcVYoJOhun0rNbn4m4mQt5nw7rXybiHmKSXqM7o3U0LBQjSAkYiYX4yB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNY1Eyzd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNY1Eyzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777541736; x=1809077736;
  h=date:from:to:cc:subject:message-id;
  bh=PErzquAHa39RlNAmD9e4Rj/+FyctIGq60Djo1Wq3dUw=;
  b=RNY1EyzdIno+EYWSeXVqFm6etmKH70bb1kIoC3RIzfq/EDITZpdzfJBY
   5iyUFZjcjR6fI/biXNH56CndKcXeC4mHUT4uNrJXjngaF5gVB9gbT6VQ8
   RZsutwoQKChvgxxWU5gaSGJJ8zMY+4iq43a0d8igsYNoZkTM6iqFwayyT
   K2VMJzYW9FiXeVe/fO4ir3obh/e4nEJWL2LDX4/pWmPNBTJzCvC5a5x6j
   x8YkG8EK3vqjyZN8tdVX7uTi2IOn5CtB320vv//E6CO2EAEIV8WoLfaFT
   sRsAaIFeDvxqoIHkXJNZliD+R1hMvqnncNoh5F7+ATTKVc5gOOEtT0uSu
   g==;
X-CSE-ConnectionGUID: ToevpUfnRjKifEmiECu78Q==
X-CSE-MsgGUID: JAPVXmqySF++o+O3eG3q1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101150446"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="101150446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 02:35:35 -0700
X-CSE-ConnectionGUID: c1s7AlSoS/y+eHyPvzwwjw==
X-CSE-MsgGUID: 3NJz2phVR1+GB1hzmlG5zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239524101"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2026 02:35:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wINnw-000000004n7-1A7D;
	Thu, 30 Apr 2026 09:35:32 +0000
Date: Thu, 30 Apr 2026 11:34:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb:
 pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1',
 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0...
Message-ID: <202604301153.IcSuYf8g-lkp@intel.com>
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
TO: Yao Zi <me@ziyao.cc>
CC: Manivannan Sadhasivam <mani@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e75a43c7cec459a07d91ed17de4de13ede2b7758
commit: d782e6e7aa798a2c28f30f984ea6dcdb63f51674 dt-bindings: PCI: loongson: Document msi-parent property
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-2051-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301153.IcSuYf8g-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301153.IcSuYf8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d782e6e7aa79 ("dt-bindings: PCI: loongson: Document msi-parent property")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604301153.IcSuYf8g-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
