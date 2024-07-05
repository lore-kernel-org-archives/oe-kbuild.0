Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5BA13CFA8
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720199912; cv=none; b=T39xKa2Gi5hAA2sRZiEH4HBYT5cwxs5uZim5REX2STa0eFQzCOpC/6G+mb/+BdrSY2QtpHLC+7RJVmqSA3vGrpHGSbWMyxmXheu3Mp67kgABjNVRYHS54akgouNDVx8tpi2mJplNNQ72XWlTr9hY29H2xH8f97fxHE8GUCWAzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720199912; c=relaxed/simple;
	bh=CkaDuIm4ug/e8fD4HcW8xilM0vfz8MEEfs4VHspUufU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d9nE+ROKv6KBkxDxWguHJjtLge3Wz79Y6NnS4cZ3XhyUBNIcRigcNO9bIoApBWcvgEF56oGTY9Z49V6AneuP6QuddoNdWpcs9ZGX7ETVBaYCtN2Qe/Gdj5RIyz/6c60eCdQm+AqlUeEqEiuqNQ5ljYjP94ZMJqOxcFIabLMinOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgtHhmDb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgtHhmDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720199911; x=1751735911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkaDuIm4ug/e8fD4HcW8xilM0vfz8MEEfs4VHspUufU=;
  b=FgtHhmDbqPt3GT1q5AB0xpxShPAvReYO7WxuqDJS1cEIziS6UyE2JgNC
   hc4K5lffBCbK/5K9384ckKcJ3TeXK8OLvH0NevOIOao4BVG3xe1iQ3VmZ
   FWvKdx6zgtv5MdR3536agZ+rZyNqHAZfLTLcUgL3xznnJgpBI8qxeBD0/
   i28mQsT4eKQZXx8O5X3gpxzbJ1yMnMxSuEj8Yybrx7npxqo4lbp1ph7ct
   W/sxz6+o1jamjv6QN1AS2Kxd9FC53RiIFzc7PMBhziqJLoWb0u4KqhwWu
   ZHekARf7CuDfZbCydgfkjQY5i+z54RR9jeym7hxVUHruUC8GWbQYL8T/G
   A==;
X-CSE-ConnectionGUID: i39efRNDTzCL/HAwFmb4Og==
X-CSE-MsgGUID: wdBmW6BgQk+GnN3zxfTzZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21266580"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="21266580"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 10:18:30 -0700
X-CSE-ConnectionGUID: N+XIVh3lQtK7ELeftWa0JQ==
X-CSE-MsgGUID: yXJj9HU1QAiRHjF8YOWArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="52107868"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2024 10:18:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPmZn-000Seu-0A;
	Fri, 05 Jul 2024 17:18:27 +0000
Date: Sat, 6 Jul 2024 01:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 132/187]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: Unevaluated properties
 are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were
 unexpected)
Message-ID: <202407060141.IYlhs5wl-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: e6650fda8b14a550039d3d39fe8ecd87dd736116 [132/187] arm64: dts: apple: j413: Model SDZ GPIO as a regulator
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240706/202407060141.IYlhs5wl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060141.IYlhs5wl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407060141.IYlhs5wl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j413', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j413', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@235014000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@235014000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000: power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000: power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
