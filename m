Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F91D432D
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600274; cv=none; b=hHShYkHgh+Y95ytSqSCepHlsBO9nku2cdh8P1dZaXQsnW3wOu1pK4w8udChZoG1IXWkwAioi6jTAYAogPEKVWynW5a+iCFB0MeLdIx+aJ3DYgahLd1gUSTfX2kSUj5C2Mb7sSy6WRXZ9qfKcBYwzygNh4opzLvcVLE9e9IA1TAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600274; c=relaxed/simple;
	bh=0aLv+odPx1Pe3ZfHK+wGprAqk7cLTynWAZXGg17vs2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LEETxxz7AkC4/r6nHY4DZLmy2m06GIioxtF4M/4xXPjmbiLGlSbz9xBLaufhhQmwVpQH+DlOqsgPPTP0K7Cw1KFs7nXlivmgE13hpd/i16bFesj6Z4N+j3OEeyVmCn9Ua96n8deobtgfphOhf67jjEDkfwXFqG5QzOg3oDzlrZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9KxyHEp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9KxyHEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746600273; x=1778136273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0aLv+odPx1Pe3ZfHK+wGprAqk7cLTynWAZXGg17vs2Y=;
  b=F9KxyHEpRAZ3ICrbzZOYZHR9cXYxb6+vICxzlMiW+n3X4TPQ+q1VN09u
   okI10gAR24eYiPia0uMQWmEp/srG9MZbXeJ6VAaBWaZu9b9WPHE+DuDGJ
   +BNJtET0ZuaHgRcoHR77dEtGglqoNbk4M1gjoamgbzNAm8qJw9YCQzoOc
   K17gcsnziAPHWHmSVuThGXPAbQNFy5RO+mC5YVBfZZLyWmCIRxNJ0duGq
   Dgcr2PGo3JNGhvnkYgptYxr8NO8a/QX2TNnUrusTu4OCdToKyuGqNm4tv
   QRWIl4r1AZey+uWZP8F2ugTJUxFBIB3GXaTFV/3NDdw+7dfrxd8h6ewl2
   A==;
X-CSE-ConnectionGUID: EDItcqV+ROOalwwsYU/EDg==
X-CSE-MsgGUID: BuStUsFPR9SCn1LNxVLdQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48020144"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48020144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:44:32 -0700
X-CSE-ConnectionGUID: Ub05lSZpQ6Oheaip7fNQVw==
X-CSE-MsgGUID: Z1fPjAKZSqCtgf3lJJkwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135578906"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 06 May 2025 23:44:30 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYW4-00008M-0p;
	Wed, 07 May 2025 06:44:28 +0000
Date: Wed, 7 May 2025 14:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: mcc
 (arm,vexpress,config-bus): 'clock-controller' does not match any of the
 regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$',
 '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
Message-ID: <202505071427.eme4TxFj-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Sudeep Holla <sudeep.holla@arm.com>

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf arm/arm64: dts: arm: Use generic clock and regulator nodenames
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071427.eme4TxFj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071427.eme4TxFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071427.eme4TxFj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: / (arm,rtsm_ve,aemv8a): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
>> arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: mcc (arm,vexpress,config-bus): 'clock-controller' does not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
--
   scripts/dtc/include-prefixes/arm/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   scripts/dtc/include-prefixes/arm/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: / (arm,vexpress,v2f-1xv7,ca53x2): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
   arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: dcc (arm,vexpress,config-bus): 'clock-controller', 'regulator-12v', 'regulator-vio' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
--
   arch/arm64/boot/dts/arm/fvp-base-revc.dtb: / (arm,fvp-base-revc): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
>> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: mcc (arm,vexpress,config-bus): 'clock-controller' does not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
