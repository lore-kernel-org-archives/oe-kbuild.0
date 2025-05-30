Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5002211706
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 20:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638082; cv=none; b=spG0Cs4chkt/szrmWwxQHpIiyIpZuXjzria36IJlcz69VhebcEJNwDIKKpP/vswc4Jx+KO5Ue/RY9BS8fbzHmS4Zu90WGj9SYvWCgoiJUpUFqY6rBNnyQPH/7pfMNc11tznROeD+8pYzeF4OYy/B8RUlTKrqtrXUxeK0gpXXYSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638082; c=relaxed/simple;
	bh=yL7TPPYy0uuxfEwW/gCVsRXthcEmqPYK0QWq6UUhQuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R02CGoohqn4hl9kTHyf1hLYRTkSws5KaQ3X7suhldijvNcGeZDn1FH0GSqCmiHx8q8APhh6uDonyt+II1Ky0lhB91lD/3gQlrVf2WctMv2wII3bpA25GaxPcsTylwfwzHmBQDlOWi9lF+molmGqruNH6Lh0jex5Ez0LHtxHJ27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmQ0JmQT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmQ0JmQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748638079; x=1780174079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yL7TPPYy0uuxfEwW/gCVsRXthcEmqPYK0QWq6UUhQuk=;
  b=dmQ0JmQTMOtbRl5t4YYJEUWg11cF56oF6LKFs02Bi8Mz7Ko+OKQCvJ40
   ssP6sc29BRCrj1rZ61EJ+BDElTvscpm0ksZV++EbWkhoKPFAxQ9H7Az0a
   BSUOYJFHtuo5LdyVKiHPh9pIm3E7gypWy/9c3ZKeT304RFLaELQa8N/SS
   XXmBqlljKlgiyQZpKAKdWqpEiq4Hs2jgTE3rLsR+bPMT/R6PPooibW3EA
   Q8elbd2zKk3lJHa5+otGo6psTAmg10g7yOW3Kx4SMyUyfOENzn21/sbIi
   /OarHr5HitLxjdaOfQeLx8z2uPPjiLcRNKwh7G/UtFh89HSimKSAgsriA
   Q==;
X-CSE-ConnectionGUID: 7Pz/wCp9TlCk3r58tH/cRw==
X-CSE-MsgGUID: 4MM5vNAWQZONJrcMMrVymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49860715"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49860715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:47:58 -0700
X-CSE-ConnectionGUID: kj8WlgurRomqsuWvW4DaOg==
X-CSE-MsgGUID: P684uMFQSzaFtU9UQUULYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144614047"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2025 13:47:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL6du-000Xwy-0g;
	Fri, 30 May 2025 20:47:54 +0000
Date: Sat, 31 May 2025 04:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /
 (loongson,loongson64c-4core-ls7a): 'model' is a required property
Message-ID: <202505310407.oSA0i175-lkp@intel.com>
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
TO: Xi Ruoyao <xry111@xry111.site>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: 4fbd66d8254cedfd1218393f39d83b6c07a01917 MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-051-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310407.oSA0i175-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310407.oSA0i175-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310407.oSA0i175-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: / (loongson,loongson64c-4core-ls7a): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
--
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: / (loongson,loongson64g-4core-ls7a): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
