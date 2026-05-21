Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF180386C13
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346316; cv=none; b=nHoCsA1dkQG0CBQosfbnR7lWHGQ+JlUUlYEfvAACWqC3yOqF/qjtHhOlvwaJtLnJxITguRe/KWAwgPUjwdyL2gM8yzFYjSEt87DjuZwLNhcvZi+GEQJ7HR57W7chbkuGvVdbWRtV1ASrY+rPDUj8yLc9bjxBFbcFwlG/dpakMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346316; c=relaxed/simple;
	bh=h2gWwjOSEeDlUstkkjkfQDnEbksmSa0RARkf+z81x/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QOwYDs8jnZWHDZs3711kWrlIGorDnnNjrth53RwJbVpnaXi0YPmXYUmIdaRNdIVHb84E98W0OXULPxCQWSfdA4mG4kA9GaSqSHlr7GFM9ly1hAMo3AZmHAEFGMYvf5uYicdw+zWDORMNYG5R5X5iCu12bGAYhuFU3BhQ5VAy4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlWpXpsX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlWpXpsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779346315; x=1810882315;
  h=date:from:to:cc:subject:message-id;
  bh=h2gWwjOSEeDlUstkkjkfQDnEbksmSa0RARkf+z81x/E=;
  b=PlWpXpsXC9uMTl/ptFKKJeQd5wtOwJvNVcehjGwv2oH6Alhp32tL6Qs/
   /szx6mn62CYSJ3RshTLxRu62oVthdBa10XSBc4VWxUIT1EnnqwEhWFagF
   jALI+gbw6QRBx5LXuOpakNZxQSVL0SQ0e2KjJ73yfN/fCfP88whz8oQAS
   QyyGqQleZtYvJkasaDnxaVdr9RSNvTJjcRalIr34QOEoOZylrVQ676oF/
   Cv8w4su7prI99/uGL5wK9kuDV3e2w+Nq7MGh/ZHveELrEq/qDod3lOzse
   LtIZfbJ/dKUQtI3Tl1ww+nwWYNRbr2JCQzLScwqoiZdgCmeS3BGR9AnhN
   Q==;
X-CSE-ConnectionGUID: fm6vtuqhS/OgccaGAhpsbQ==
X-CSE-MsgGUID: l4kJVGfLSNSF3gCbyiUfnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91366774"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91366774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 23:51:54 -0700
X-CSE-ConnectionGUID: 1pyR/J8YR3Khr/pIkAqe0A==
X-CSE-MsgGUID: PZIcMPeOSGaSI7ygzv/bDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="239439076"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2026 23:51:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPxG3-00000000Anh-06BV;
	Thu, 21 May 2026 06:51:51 +0000
Date: Thu, 21 May 2026 08:51:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/boot/dts/virt.dtb: pic (cdns,xtensa-pic):
 '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605210853.8XroncGI-lkp@intel.com>
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
head:   8bc67e4db64aa72732c474b44ea8622062c903f0
commit: 1ee0fd43803bf82b5388db9b406c1b5e1a08cac8 dt-bindings: interrupt-controller: Convert cdns,xtensa-{mx,pic} to DT schema
date:   1 year ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-2051-20260520 (https://download.01.org/0day-ci/archive/20260521/202605210853.8XroncGI-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210853.8XroncGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1ee0fd43803b ("dt-bindings: interrupt-controller: Convert cdns,xtensa-{mx,pic} to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605210853.8XroncGI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/virt.dts:48.6-71.4: Warning (unit_address_vs_reg): /pci: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/virt.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-iss']
   arch/xtensa/boot/dts/virt.dtb: / (cdns,xtensa-iss): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/xtensa/boot/dts/virt.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/xtensa/boot/dts/virt.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/virt.dtb: pic (cdns,xtensa-pic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/cdns,xtensa-pic.yaml
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): $nodename:0: 'pci' does not match '^pcie?@'
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
