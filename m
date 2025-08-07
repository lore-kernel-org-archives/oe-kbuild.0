Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8592A1D7995
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754555851; cv=none; b=TUtvzKrTjGanWCre6ZsVYdzloI4c99MNO7KY0gmdKcOH8pvzD6e3+SN0zCFETiR49faHow7Q9O+3YkAGXVWU8KIhmcqRhR0FmtYKbJJ2mrEZEr5EqBukqczjqKGp85r+LhVgeEcfEsO+liaL7peh4FdO2H/2bniTHL0lzucjt18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754555851; c=relaxed/simple;
	bh=hqJUwODAl9mxmZ9862W4lSGaL28rI5udWkZp8cN7Y8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbq6FkCZBSUOvIXWjIhXcM3FlliBuMsi4rhHazSgHRbTVTmxaFhhaiiMGITxbpjSsssk8yIoGnSLIbAUIL3EmCXmi6CIEck9TpP/ggp4elgPbd9bz7EqUrnUTvvIee6sqqMc9hNy9DpCqsIfaXAk5fufXKGnnMadETw9T18Np7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1MVPHfv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1MVPHfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754555850; x=1786091850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqJUwODAl9mxmZ9862W4lSGaL28rI5udWkZp8cN7Y8M=;
  b=S1MVPHfvQfjCQfxKDhD42QRSsR0XBBZl2eAuN8CqEU/evcfTAEBkRUmk
   Jg+aGykOYHzefhQvMbUkzcA3xbE7oeEbfTD5CZQQ+AYfbadjeXDFQPRDn
   hHZIBUHR1Mm8kIvV/Y64XIqD7U8oGNc4av0H48UawrP++tFwX7mKS6N+e
   G3Ty2SCTHKQKAtgofXofem0JSDe1WnVkp11aTZX+nOxA+cdhQSjgDjdoA
   00FrigCiQ2Kbqf0bKRmpYlQ93aJ7COosTe/nIYNVQxTlnhfPRvcXMo/cF
   UzzY1blgnERf9/wB/LeOyRUrXiYXcIt1dUQoW8MejhuzLlt9nHC31usjZ
   Q==;
X-CSE-ConnectionGUID: M72L/3PBQnibQGJJXKIJWA==
X-CSE-MsgGUID: 795rH3e+S5KW0J58FeEfjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56782385"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56782385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 01:37:29 -0700
X-CSE-ConnectionGUID: Oc5zzuabTaaPXqHhxleGmA==
X-CSE-MsgGUID: MpTg7QYqTOSSe2OiSqbHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169462564"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 01:37:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujw7A-0002a4-2C;
	Thu, 07 Aug 2025 08:37:03 +0000
Date: Thu, 7 Aug 2025 16:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 122/801] arch/powerpc/boot/dts/fsl/p1025twr.dtb:
 display@2,0 (solomon,ssd1289fb): reg: [[2, 0, 4]] is too short
Message-ID: <202508071601.gL3NwjeK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 94fd0465aefaf6dceef0489b73b03ce57e044acd [122/801] dt-bindings: display: Convert solomon,ssd1289fb to DT schema
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071601.gL3NwjeK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071601.gL3NwjeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071601.gL3NwjeK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: localbus@ffe05000 (fsl,p1021-elbc): nor@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: localbus@ffe05000 (fsl,p1021-elbc): display@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@ec0000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: display@2,0 (solomon,ssd1289fb): reg: [[2, 0, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/solomon,ssd1289fb.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
