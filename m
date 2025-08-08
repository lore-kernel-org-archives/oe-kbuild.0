Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262817AE11
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636686; cv=none; b=G6b5KQqM3fDY0KIo46FDZAC2hfrHYBDsz+m+Ip1yYetBNN1hU8d7ZLwpIooSv5xuQKhClFC/ctGduSi1+nD/H9bp/nF7vMvVycNLzDmdQsl8EsoyuCICM+EIpOZjZTEPwqKwMuuNRWDHX4QFJPJely15+jz4A+ZVajPH7IouZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636686; c=relaxed/simple;
	bh=tbkV/anag9xAc951qBXxTAiYWYOBVWe2Sh0mS77ag6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dGmFtBBllot3Ja8f4wC70GQH6l+T/rcWC2puQcu66z04lWYNsi4O+VfTOLBFn4UkdDfgQfIrD+k5Kznl61LCpFmCaEJxrzVZPAy6/mWPSauDAU5yPboNMA9MhyIEJLTAcRgPudZ6Zjl1e1w7eP6aMZkDs/zl8Y794XYhdYpSOVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBpxFtEB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBpxFtEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754636684; x=1786172684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tbkV/anag9xAc951qBXxTAiYWYOBVWe2Sh0mS77ag6Y=;
  b=HBpxFtEBN0/SQMqKhBfFhq9J0d/vNK72N8SD6oSHr1WtjafCvWgPMbhz
   a53ZGtzJovWm/zocqU5LyPfO7z8K+N//rc+mJ21deu9Pz8vhU75q8dokL
   8hZ5+TuTu0E0u2niSY3gGsXcN4Zeswv8ZbCKXSHC9xzFmXLcheQsRDKLt
   F4sp3G29IplHw1PDEBtMc1C7awrSkNs5aqk03p9Z/XPfB/4FEW+oZKOTk
   x716m2itmZ/N9jOIAUX8wS6SqjO01CUT7Br3yvcnVEZ0cY7jdkqVIGX7Z
   6RmaBsv7V7uHTrM7Jh5q8Yhe+YCGxrEz8yVxjNiRkJSsUMeI/iygdXwhl
   g==;
X-CSE-ConnectionGUID: tOAYBPWoQsKoz8M86zx6YA==
X-CSE-MsgGUID: RKVlL7v7SYmziv4M6Qx9YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56903735"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56903735"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:04:43 -0700
X-CSE-ConnectionGUID: OZyHCO1SSheB7wjrPs9TUA==
X-CSE-MsgGUID: Ut3tNI5STrCZx9MsO+mxTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="196088391"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2025 00:04:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukH9b-0003c6-19;
	Fri, 08 Aug 2025 07:04:39 +0000
Date: Fri, 8 Aug 2025 15:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 364/801]
 arch/powerpc/boot/dts/tqm8548-bigflash.dtb: upm@3,0 (tqc,tqm8548-upm-nand):
 '#address-cells', '#size-cells', 'nand@0' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202508081514.v5P9AH5s-lkp@intel.com>
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
commit: 374f3be56d0af360e1fb13720942e2bdb56bf5be [364/801] dt-bindings: mtd: Convert fsl,upm-nand to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508081514.v5P9AH5s-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081514.v5P9AH5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081514.v5P9AH5s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: localbus@a0005000 (fsl,mpc8548-localbus): upm@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: localbus@a0005000 (fsl,mpc8548-localbus): can@2,100: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: localbus@a0005000 (fsl,mpc8548-localbus): can@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000/can@2,0: failed to match any schema with compatible: ['bosch,cc770']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000/can@2,100: failed to match any schema with compatible: ['bosch,cc770']
>> arch/powerpc/boot/dts/tqm8548-bigflash.dtb: upm@3,0 (tqc,tqm8548-upm-nand): '#address-cells', '#size-cells', 'nand@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,upm-nand.yaml#
>> arch/powerpc/boot/dts/tqm8548-bigflash.dtb: upm@3,0 (tqc,tqm8548-upm-nand): reg: [[3, 0, 2048]] is too short
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,upm-nand.yaml#
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: nand@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: nand@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
--
   arch/powerpc/boot/dts/tqm8548.dtb: localbus@e0005000 (fsl,mpc8548-localbus): can@2,100: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8548.dtb: localbus@e0005000 (fsl,mpc8548-localbus): upm@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8548.dtb: localbus@e0005000 (fsl,mpc8548-localbus): flash@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000/can@2,0: failed to match any schema with compatible: ['bosch,cc770']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000/can@2,100: failed to match any schema with compatible: ['bosch,cc770']
>> arch/powerpc/boot/dts/tqm8548.dtb: upm@3,0 (tqc,tqm8548-upm-nand): '#address-cells', '#size-cells', 'nand@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,upm-nand.yaml#
>> arch/powerpc/boot/dts/tqm8548.dtb: upm@3,0 (tqc,tqm8548-upm-nand): reg: [[3, 0, 2048]] is too short
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,upm-nand.yaml#
   arch/powerpc/boot/dts/tqm8548.dtb: nand@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
   arch/powerpc/boot/dts/tqm8548.dtb: nand@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
