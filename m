Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1FF1465A1
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 19:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635017; cv=none; b=n4y3sCeg+8z0gCMq3os6XNHilT31JwJhR3ib/7N0eAPmg9Zhzt0pvHwBspfxptthpafPBSlLUqfOaX9RNQ9gsUk2itDfed2vYqO4zMgyYvDXCpkddsgnWdq/Lklb4LJvwYzHyDIhwNd+zK+CLTLz6y83x04BazDziiCLkOtlWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635017; c=relaxed/simple;
	bh=Z1x3AiNYyYRe8OmVQe4q7VmZDhFdJnzVMSla/iD2uEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IiYt41ICFDSVIvTTZA7goCt/DI+Wp9Wtoj1Q12d9Ce7F4oN3PuEcl5cqbkR0KAHl4Nn1nYmjNqaWi7q9SvlHpNwQTnWslvyPcekTZtI9jw4yad9r3xPIQwLsPsz6Et+GU2xo03NVmpT9LhhVeR+0lEhU+RoxEsLJc6fRnY2xdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+YT2leH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+YT2leH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748635015; x=1780171015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1x3AiNYyYRe8OmVQe4q7VmZDhFdJnzVMSla/iD2uEU=;
  b=l+YT2leH9QqmnwfhFc6Z4sShRiS+lBpTdN0dCHXkPXE4N3dXT1ZVGIIN
   TTRm2TbZ7etTsMhMYcB/GiFHwmlnpZCPg8lztoxxPJie0Xplp+mX1GwFi
   +9EFLKJqhbPhqkDdxZ+j8BQ2nYxhP4B7sdqp4EWBynYvdzV6OtznkxHtX
   wpYghl7edoZiPBz7SSOjfFVAtm6LgMEM9v39okiMWyAK2NNzECzU8+8a4
   i36PADf/IVbWqclnuCWeWblpWl3opindiKAcN/udDZG0FwwgWqtSe0TNa
   HMfbB9Z+O433LSJLyrO18vDvifl+imzBDipgMJ+faX+yegX7BVBsAdvFC
   Q==;
X-CSE-ConnectionGUID: DZnwal0XSYOBDBgCLELLmw==
X-CSE-MsgGUID: D7cHWT/8RgCD9k/BOFIsYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61406265"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="61406265"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 12:56:54 -0700
X-CSE-ConnectionGUID: oXM2jaEQT3CqEBiRNqaK6g==
X-CSE-MsgGUID: 6seybD2gRH+kGFsXcABxGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144934522"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 12:56:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL5qU-000XvI-1U;
	Fri, 30 May 2025 19:56:50 +0000
Date: Sat, 31 May 2025 03:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /
 (loongson,loongson64-2core-2k1000): 'model' is a required property
Message-ID: <202505310340.TVrRceKk-lkp@intel.com>
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
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: d89a415ff8d5e0aad4963f2d8ebb0f9e8110b7fa MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-051-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310340.TVrRceKk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310340.TVrRceKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310340.TVrRceKk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: failed to match any schema with compatible: ['loongson,loongson64-2core-2k1000']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: / (loongson,loongson64-2core-2k1000): memory@200000: 'compatible' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: / (loongson,loongson64-2core-2k1000): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: cpu@0 (loongson,gs264): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /memory@200000: failed to match any schema with compatible: ['memory']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0: [12, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0: [14, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts: [[14, 8], [15, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0: [18, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0: [0, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@a,0:interrupts:0: [1, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@b,0:interrupts:0: [2, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@c,0:interrupts:0: [3, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@d,0:interrupts:0: [4, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0: [5, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'ehci@4,1', 'gmac@3,0', 'gmac@3,1', 'ohci@4,2', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'sata@8,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0: [12, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0: [14, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts: [[14, 8], [15, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0: [18, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0: [0, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@a,0:interrupts:0: [1, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@b,0:interrupts:0: [2, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@c,0:interrupts:0: [3, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@d,0:interrupts:0: [4, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0: [5, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
