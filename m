Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60DE2512C8
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768604661; cv=none; b=GAQKCMgxzDYpJulPxFNiyqGCNcItqIHdtolaZwoHQLyelDggs+cLfi7A0Ldq0n76atDOI4qcdlNqEtfpn4FpphDkszprIKHbyMd0/lasaqiCdQvl+kSf8GxQPTtFVaGBnSMzOtV+6k6aAMxETJfUx9+y3Wj8Tc8e2ID2ILSP5dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768604661; c=relaxed/simple;
	bh=A6eQqAfa9k3EFk4WZIgb2aBkNoDqUEkh1/Q56gjJPoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k+QyS4Ox8Okas7cmi0nj0zEZIYwaAYAXIDy2Ybp093x4qu9DSNvuVzFKNywk20o706WpcUrFv59/A4WDzXyvvx9A2F7ajW4VYAXcPEM15PPdbWnXnoil2uuY1RocmOp3UDrXxWOPvlpfW6zffwqsr7qau7GDn6gikHQWKDJx1hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJfbJEfk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJfbJEfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768604659; x=1800140659;
  h=date:from:to:cc:subject:message-id;
  bh=A6eQqAfa9k3EFk4WZIgb2aBkNoDqUEkh1/Q56gjJPoM=;
  b=WJfbJEfkahWW5nJhPJMTYSoRXqejivN/6Z64UIHEK/ZAefA6PJw+NAkW
   7yR3n5w8FDAv+tcbr0CsVKJSjTwzaQ4s39sV1MG7QCeLQkSHgw80rjrps
   nzjunw1RCuupjOwWLbFyMddmh3fJdwfU97rM5UBPmBZF8myv6cLAc6wcl
   DMWKkXfTvkvJlEAnY8+LVROIgdaBkU6MFWQb9vzVYUC7oHVDXc6cE4Kp+
   eF7ZqVxgGfjx1sXVcD87yHv/0NR+Yc936y+ktiX0oWj4+Bd4WtJPucuUF
   yfII9lx6AaOGEpesVIPqV9i7xcBvhg6rmLQWXJPKa7YEAYY5LEP/uc9uy
   A==;
X-CSE-ConnectionGUID: Xdw5A+NnRzqEJ5yTZqJM5g==
X-CSE-MsgGUID: IMWaLL3tTcKwc8k2KTPdFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69973330"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69973330"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:04:19 -0800
X-CSE-ConnectionGUID: 6mlgi5VvTgKY6PkHfthpqA==
X-CSE-MsgGUID: MjrQOX7wS6Wgw/S1hY24Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205158749"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2026 15:04:18 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsrX-000000001rp-2Sq8;
	Fri, 16 Jan 2026 23:04:15 +0000
Date: Sat, 17 Jan 2026 00:04:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:dt-bindings 15/16]
 arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000
 (loongson,ls7a-pci): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1',
 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0...
Message-ID: <202601170033.zwC0gvms-lkp@intel.com>
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
CC: linux-pci@vger.kernel.org
TO: Yao Zi <me@ziyao.cc>
CC: Manivannan Sadhasivam <mani@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git dt-bindings
head:   e74887035fba99ead63235740908debeb1326dad
commit: d782e6e7aa798a2c28f30f984ea6dcdb63f51674 [15/16] dt-bindings: PCI: loongson: Document msi-parent property
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
config: mips-randconfig-2051-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170033.zwC0gvms-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170033.zwC0gvms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601170033.zwC0gvms-lkp@intel.com/

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
