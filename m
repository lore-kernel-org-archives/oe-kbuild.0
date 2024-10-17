Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120B1C233C
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729194716; cv=none; b=j04HknM3dojXslPCICjYT6bQ7mVTRa3nKBtxrxTgKRiveiJ8DQmFac/lcV+v1f+Ws23RLGynpGA8yvA8h+n8xV3GVss6MrDriOloWcTxyrRA2tnBbPO03Y0BIHDx0/73FJnjyNQRxXL0WhIU9JfcJWS4RpvjJ6x4qAwldzULQOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729194716; c=relaxed/simple;
	bh=dKE7UOLG/oE1ZlgceyfTFdY4kzXY2wLOVPRta0EetOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suHzHD/LRScBIgQvRcbP2busxM28J+9a3hRarXnEoKYMshiZPJucxu2Arwj4n5BiwQsegWEG8/PBgVrKvdp24b5vgWensmSrw0F2UAbjo599MLc5bpXSX4bTtfAQTbiqQlLefp8gr4EvMzpZvgKlwAf0dEzozdUAx57usC0m1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpvlxdVG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpvlxdVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729194711; x=1760730711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKE7UOLG/oE1ZlgceyfTFdY4kzXY2wLOVPRta0EetOM=;
  b=mpvlxdVGovdqw6xsqTf/YrtoqP9tgvhfyhVkYH4Gjvoolbs/a2hy8tu8
   d4hr3S9l/zQWRvSbLWUQ2ucCRxi2ImEy4wJfieW8p5JqVRkv7HxUtQ4Rq
   Askk3Oh1Gq3Etdl4uMsp8zQxYdmkL+X2ZP4Q69KdEmt3sVETS/ZgAv2HW
   sPw+sSjtF9tX6vZ6CjPlQ6AupiXaTwJu4Vy+WqIES9VX1LZ7fBSr+2uHx
   Tu0tYx/ad8UBq8jjr/RsKk+dRIUqLeTwOOHxd2CtJnwSfSmetvcnxaLqq
   AW1wteS7tv+4NoxODiEuhh2xmMeCGpTD4DIuQxZnYa9EG4YBqme8UvR7e
   A==;
X-CSE-ConnectionGUID: EbRvTp7OR+68DXnAc0LCLg==
X-CSE-MsgGUID: SnITdkayR9yH65vRzjBUVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39827311"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39827311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 12:51:46 -0700
X-CSE-ConnectionGUID: WOEZpgrhSqSZHh9Txl6fyA==
X-CSE-MsgGUID: ssCn1ua1RV6hGyTUhICdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78617454"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2024 12:51:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1WX8-000Mqg-2G;
	Thu, 17 Oct 2024 19:51:42 +0000
Date: Fri, 18 Oct 2024 03:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4889/5321] arch/powerpc/boot/dts/turris1x.dtb:
 reboot@d: {'compatible': ['syscon-reboot'], 'reg': [[13, 1]], 'offset': 13,
 'mask': 1, 'value': 1, 'priority': 64, '$nodename': ['reboot@d']} is valid
 under each of {'required': ['reg']}, {'required': ['offset']}
Message-ID: <202410180305.ZFlGnzVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/powerpc/boot/dts/turris1x.dtb: reboot@d: {'compatible': ['syscon-reboot'], 'reg': [[13, 1]], 'offset': 13, 'mask': 1, 'value': 1, 'priority': 64, '$nodename': ['reboot@d']} is valid under each of {'required': ['reg']}, {'required': ['offset']}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chris Packham <chris.packham@alliedtelesis.co.nz>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: e7af7d13316dc5e2293c4f777f71bd8331f5d7a5 [4889/5321] dt-bindings: reset: syscon-reboot: Add reg property
:::::: branch date: 11 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-052-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180305.ZFlGnzVB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180305.ZFlGnzVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410180305.ZFlGnzVB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/turris1x.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/turris1x.dtb: cpld@3,0: $nodename:0: 'cpld@3,0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cznic,turris1x-cpld', 'fsl,p1021rdb-pc-cpld', 'simple-bus', 'syscon']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cznic,turris1x-cpld', 'fsl,p1021rdb-pc-cpld', 'simple-bus', 'syscon']
   arch/powerpc/boot/dts/turris1x.dtb: watchdog@2: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/maxim,max63xx.yaml#
>> arch/powerpc/boot/dts/turris1x.dtb: reboot@d: {'compatible': ['syscon-reboot'], 'reg': [[13, 1]], 'offset': 13, 'mask': 1, 'value': 1, 'priority': 64, '$nodename': ['reboot@d']} is valid under each of {'required': ['reg']}, {'required': ['offset']}
   	from schema $id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0/led-controller@13: failed to match any schema with compatible: ['cznic,turris1x-leds']
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
