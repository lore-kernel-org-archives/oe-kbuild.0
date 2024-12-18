Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC7215382E
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503055; cv=none; b=Wxaz+IUIJkLnmM+0eccPCpERp5daQV6U38YtyMcCV3qFBtefUEh/Iw19VaI4U1jnBis8MNCwIF3t6Osm8DWU1DQ0j0dvJzgjs+AuenVMsEPs7Z7jCDDOwXKwJPbhpG8f2yW0Llo6uT3WvsgSn6HKEkRsuBQ+2golrDXoBhzgMMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503055; c=relaxed/simple;
	bh=PoeXivOTvcEWPPGj/7Nn6VJq6L6cHUvc+m+gkx4Z6x0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o/iVRE6N8WWqc5brqgghimjsiy9L1S49nlwAarCjQiiJ4NhKKvw214MJbzIFe8TmIEC+4ZaLEFgF2lL/9qlU7sIhCHF6Onvqllnz1iy4PDndI4jsb3facujOINJmAFQIr1wuJ8S+PIxhcHU27rQ/4mG4wRCEIDdnXDj7uLMus+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1DWMyfx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1DWMyfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734503054; x=1766039054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PoeXivOTvcEWPPGj/7Nn6VJq6L6cHUvc+m+gkx4Z6x0=;
  b=a1DWMyfxnZ68UnEdV+3TRgqEaNdk5dG3ZAgt0U8YXN9KLlYfpM0yiGoO
   Zpr4VKXwPONHRFHI6y8kdimO8iXtpYnrJ541KL7OEIQ2AggunORA8xZWA
   /xsGQFFj01SDsis7D7lle5FmAodeoeNvFZfGWwiJCmai4n6Agfo3WrpOY
   zj5b1ahsKFmNqBYAfXp7sPmZjHT7fy2urzxCH7XIXAoF4W+Rqm7YhJGMD
   RB6PU6YNv1bIMAT6M+0h92awXS9L1QLrAaqV+sjMHMOhiyZ4sjrj0R5+i
   mX8i2zk+XwmzutPxgu0L96lEOemJAiq5po05AdiWu83ONrtKME0MhYw86
   A==;
X-CSE-ConnectionGUID: jZR9AgSfRdeEp+yEbzE9Jg==
X-CSE-MsgGUID: h/oWVrM+QjyEAudArdfWVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45968623"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45968623"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 22:24:14 -0800
X-CSE-ConnectionGUID: 83h6HHoDRXCoHtofcHa3fA==
X-CSE-MsgGUID: 6p8OCuzBTHW6Zrp9qBgXQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135091686"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2024 22:24:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNnTe-000G9a-0v;
	Wed, 18 Dec 2024 06:24:10 +0000
Date: Wed, 18 Dec 2024 14:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 65/187]
 arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000:
 power-controller@4000: 'apple,force-disable' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202412181433.a5yQHSj6-lkp@intel.com>
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
head:   5553f8f1fe2a6f02eded3969869311b465aeb258
commit: 96052369dda9091a4eebc55f3e3f71f36dcb618f [65/187] arm64: dts: apple: Add initial t602x device trees
:::::: branch date: 9 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241218/202412181433.a5yQHSj6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181433.a5yQHSj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412181433.a5yQHSj6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@418:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@420:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@428:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@c00:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@4000:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@4008:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@4010:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@4018:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@4020:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000: power-controller@4028:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@420: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@428: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@428: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@c00: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@c00: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4000: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4000: 'apple,force-disable' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@4000: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4008: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@4008: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4010: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@4010: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4018: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
