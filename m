Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0A299A8C
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755347937; cv=none; b=gSu97g6rdfYcuS5kTWSb/UlBO9Nf+yfTTCMCI6T2vcI/hmq442KC51h6W4SV70IHDkJyEXMPXn/y1DUjLMy4CopnLndnqadXfvJb8OjB+VyeEaUfFBolx6Q3Br38q5pCtTeq0wG2VL8getYfyxmIgHiw9kxT0IrTaLBCsU9C4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755347937; c=relaxed/simple;
	bh=hHuCQmau9G59oYt5maW2XUn/Bl+/NoO5QOZMn5hs+os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBhOSWvGZpApuTUkSyvYhNb4tXNOJQmyYLlpMQ28XnLffRSvbx+0vwt8QODm7BM5jk8GtaKKdK8QTIHqG1vftkxwX0qj/H5WErng/MASk8Ua8XYrD7WWw1nVe4s3R5MKniajl17JOXUacfkiqBTgGWxzishFdEc/H0AXuQUr4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bU9VkkBI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bU9VkkBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755347936; x=1786883936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHuCQmau9G59oYt5maW2XUn/Bl+/NoO5QOZMn5hs+os=;
  b=bU9VkkBIuYxou0J6SkJY/ztl7TGtWcfmQbBjnXi3TYyT67rMWQJ01CeN
   0B7QRYKfZz2dZS1ht56CB+pRlLoBWhcNt+NtgLre6xTV5NjPb9h4U5BIb
   vqjSudmR71/qq6gl0233aXiCSZMCF+Tpuuekkb6CnlRBqyZ2OHo7tSq9U
   8PgrO6tEJRM4HQhct0d6d4uvCZGxF7XQNBxvLWijhxG2ZlWNLojmkAiWn
   kol/bMLh8vaoHNbIWf4CbheBud8pLx8MYUS/JEILLFr5zAir4Ny/abS34
   0gkO5JddGrR5JUZMH2uIqwRJ9i97kTQMm+BoHAgPQgzcnSEvhsgqMa3v5
   g==;
X-CSE-ConnectionGUID: yrVP+5/FT5yi+AIvenrsuw==
X-CSE-MsgGUID: k1kGFi9mSKaHCmgJOCwrXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68734789"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68734789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 05:38:55 -0700
X-CSE-ConnectionGUID: Np0OCvNASGWCHPhiaYpbpg==
X-CSE-MsgGUID: memkcACYQriMG+Ubb4ep+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166436307"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Aug 2025 05:38:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unGBO-000CsA-0N;
	Sat, 16 Aug 2025 12:38:50 +0000
Date: Sat, 16 Aug 2025 20:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 782/801]
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl4030-usb (ti,twl4030-usb):
 '#phy-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508162050.YCD3Pdx9-lkp@intel.com>
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
commit: d0c32ed4d6e5195eacc9f4563499d3484ebf79c0 [782/801] dt-bindings: usb: Convert ti,twl6030-usb to DT schema
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250816/202508162050.YCD3Pdx9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508162050.YCD3Pdx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508162050.YCD3Pdx9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio (ti,twl4030-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/ti,twl4030-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio (ti,twl4030-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio (ti,twl4030-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl4030-usb (ti,twl4030-usb): '#phy-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,twl4030-usb.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pwm (ti,twl4030-pwm): compatible: ['ti,twl4030-pwm'] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: dss@48050000 (ti,omap2-dss): '#address-cells', '#size-cells', 'dispc@48050400', 'encoder@48050800', 'encoder@48050c00', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,omap2-dss.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): '#address-cells', '#size-cells', 'prcm@6000', 'scm@2000', 'target-module@20000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,omap2-l4.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: prcm@6000 (ti,omap2-prcm): 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/omap/prcm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: dpll_ck@500 (ti,omap2-dpll-core-clock): reg: [[1280], [1344]] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
