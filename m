Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57A1DACA8
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728071562; cv=none; b=GuZ3iHwyVt2m9bV6DDYXf2l3AIW2duJkBsY8yyTTZhWnoNzsUO858HcJZ/CT3a5ZliysxbV7rOJYo0p42g3W+IG/ehCyKyp/CdfQeDfQOiUE5kwKXDWZMIs/5VRubQnPUa5WziFVtW0Pwc7JVklepiUWj7fGaiGDyq4yFiG82U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728071562; c=relaxed/simple;
	bh=J0AUrxIhIPgWhc3HLskAWyqfOROt3iVD0UeGVMeHE4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPYh+QQsRtUr/844G79LMnJdg9xYG/yUjtTl3uK0hp9otUX71LfEEjxyTg/oRbt6k6ZH/mrWtHSNYy70J/x0lQrwLuGXtru8AAJbogklsrM/yz/4eUiAQ5tahdEiDl08Sbb8TYjJ7sMXTZrx/bQUlvY/NfPaJLshdCGAAIwCMmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlnucBfW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlnucBfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728071560; x=1759607560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0AUrxIhIPgWhc3HLskAWyqfOROt3iVD0UeGVMeHE4I=;
  b=IlnucBfWnZDtCG6WGyJ3ZNPNAfN24F+j85Oex/CNtRH6U8Y6L+PmxDP5
   KM2OONHDVvr9rtlTG22FAxJ3v12/VY4UxTMNV/zQ+spDQrIFACOY0MO6m
   7WLqMWN0z+e81bTQ4kCSODqVvGOA9xxZ8o9tM7KqP5JR5+Hsup85Sb23/
   /A70enG2BF2StAMDDZ5S+/fHscohaJP8GYnaloQLZD6BdOE4CJqvykZf+
   VUEK4KhjOY5tcFJkxh683/bpgptaIYMR64TAtTZeOrxmw1V8HK0D0FdXv
   XNbeImU16CjVapbV4GkMW0lt7Uk2I+QTTZ7UVDUyYPevAnCTnrdH4/V22
   A==;
X-CSE-ConnectionGUID: AFLyabOnTPeBSJmWaX08Og==
X-CSE-MsgGUID: CZ/WaP7sQJWZReZtaEqN5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27451803"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27451803"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 12:52:39 -0700
X-CSE-ConnectionGUID: A/mTDvxvRXC5Xvz12uifVQ==
X-CSE-MsgGUID: +TNna5vcTceRHCNzCk4foA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="74810906"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2024 12:52:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swoLs-00028g-0i;
	Fri, 04 Oct 2024 19:52:36 +0000
Date: Sat, 5 Oct 2024 03:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: 'model'
 is a required property
Message-ID: <202410050307.YdAqBqCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   360c1f1f24c6ab1dfe422a81a90cc07f53f378c1
commit: d89a415ff8d5e0aad4963f2d8ebb0f9e8110b7fa MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-051-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050307.YdAqBqCn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050307.YdAqBqCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410050307.YdAqBqCn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: memory@200000: 'compatible' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: failed to match any schema with compatible: ['loongson,loongson64-2core-2k1000']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: cpu@0: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /memory@200000: failed to match any schema with compatible: ['memory']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,0:interrupts:0: [12, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,0:interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,1:interrupts:0: [14, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,1:interrupts: [[14, 8], [15, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ehci@4,1:interrupts:0: [18, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ohci@4,2:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: sata@8,0:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@9,0:interrupts:0: [0, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@a,0:interrupts:0: [1, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@b,0:interrupts:0: [2, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@c,0:interrupts:0: [3, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@d,0:interrupts:0: [4, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@e,0:interrupts:0: [5, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'ehci@4,1', 'gmac@3,0', 'gmac@3,1', 'ohci@4,2', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'sata@8,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,0:interrupts:0: [12, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,0:interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,1:interrupts:0: [14, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: gmac@3,1:interrupts: [[14, 8], [15, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ehci@4,1:interrupts:0: [18, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: ohci@4,2:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: sata@8,0:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@9,0:interrupts:0: [0, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@a,0:interrupts:0: [1, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@b,0:interrupts:0: [2, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@c,0:interrupts:0: [3, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@d,0:interrupts:0: [4, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000: pcie@e,0:interrupts:0: [5, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: gmac@3,1: compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.0', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.0', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
