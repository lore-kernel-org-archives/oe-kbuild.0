Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62BC14F98
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754766611; cv=none; b=TR5+sRk1louGxwHGhsmRsb7QA1rsxvSKMfG/DMrhDLjExz0LIthGvl/gP4qPiOt1C/NMIOJYPtdMe6ytj/IZ/Zjqj8SIna3il+8uNTtimPxxPVqB/lCdl/JtieoJfcwKEFp6J+fJbQkyjzoqwEkgZVzDb00ZBMhLznIEJIPf2v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754766611; c=relaxed/simple;
	bh=O16IzncFXsEKmAHT0lEJTUDUVBSf6U2nB86XMl1Bv4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9gMwVMLYHSZGPg2f+IeoLLE8DDpQogtQnYSu8lg/jZsfbI5aw0RhfuFDnA3CEOOi0eDvcyu1EV0zOOb85oChU35nBxu3KMfS1pxUbErAtaRyy0hV5jmyR94HtLPRomTMLyLG4aQ3D98FrQIGrxvA+MTzA97rYwNuEB8ShM/1y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOZdCKeH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOZdCKeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754766609; x=1786302609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O16IzncFXsEKmAHT0lEJTUDUVBSf6U2nB86XMl1Bv4w=;
  b=VOZdCKeHT3KU+tNTyWzSFYshYmyXyl5KZthzLzWszYJKmG1ZzecHUYnJ
   6moHblyb85MyiytDvmsgBhid4E+/R16fl4o8femN8eA/7Ok5alnB8jPDk
   5XZb386JHRB5GsFEzChop266Zsmeke4vKT5KSq09pLvr7r+yJUxG4Ea6Q
   kBhXTXJvHT8O/5+WPM+l/7/KqkxCNmogCK4funcjP+XM5SMGFEdoQ30SX
   2d8jCO4sphztBbkUCVujGc2pirLCIyussoMwWXeg8NywyqB4ZWoWpNfzx
   E/HDbDxJUUOlX8oH65zuUaxykZJZtQcOonqtbeOk7nJXuY3abDvnlY3Y8
   w==;
X-CSE-ConnectionGUID: 6uhYb19CTX2RWp7Qa4dFLA==
X-CSE-MsgGUID: IZs89O2SRZaeABZevE45tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57040202"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57040202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 12:10:08 -0700
X-CSE-ConnectionGUID: A4j86+WXSG6UU97A/DWFzg==
X-CSE-MsgGUID: tJ6GC0nLRpeAVF/8YSVBxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166368682"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Aug 2025 12:10:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukox2-00051E-2Z;
	Sat, 09 Aug 2025 19:09:59 +0000
Date: Sun, 10 Aug 2025 03:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 15/801]
 arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: / (brcm,bcm7445):
 '#address-cells', '#size-cells', 'chosen', 'cpus',
 'interrupt-controller@ffd00000', 'interrupt-parent', 'memory@0',
 'memory_controllers@f1100000', 'model', 'rdb@f0000000', 'sram@ffe000...
Message-ID: <202508100327.c8CsxE94-lkp@intel.com>
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
commit: 1010b621748ebc5245d7da8e0dacf60171559aeb [15/801] dt-bindings: arm: Convert bcm/brcm,brcmstb to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250810/202508100327.c8CsxE94-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100327.c8CsxE94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508100327.c8CsxE94-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: / (brcm,bcm7445): '#address-cells', '#size-cells', 'chosen', 'cpus', 'interrupt-controller@ffd00000', 'interrupt-parent', 'memory@0', 'memory_controllers@f1100000', 'model', 'rdb@f0000000', 'sram@ffe00000', 'timer' do not match any of the regexes: '^.*-ctrl@.*', '^aon-ctrl@.*', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/brcm,brcmstb.yaml#
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: / (brcm,bcm7445): reboot:compatible: 'oneOf' conditional failed, one must be fixed:
   	'brcm,brcmstb-reboot' was expected
   	'brcm,bcm7038-reboot' was expected
   	from schema $id: http://devicetree.org/schemas/brcm,brcmstb.yaml#
>> arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: / (brcm,bcm7445): smpboot:compatible: 'brcm,brcmstb-smpboot' was expected
   	from schema $id: http://devicetree.org/schemas/brcm,brcmstb.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: rdb@f0000000 (simple-bus): $nodename:0: 'rdb@f0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: /rdb@f0000000/syscon@3e2400: failed to match any schema with compatible: ['brcm,bcm7445-hif-cpubiuctrl', 'syscon']
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: gpio@4172c0 (brcm,bcm7445-gpio): interrupts-extended: [[6, 6], [7, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memory_controllers@f1100000 (simple-bus): $nodename:0: 'memory_controllers@f1100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm7445-bcm97445svmb.dtb: memc@0 (brcm,brcmstb-memc): $nodename:0: 'memc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
