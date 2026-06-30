Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C83EDE6E
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814524; cv=none; b=LT41hLJCS2Sxq651wlE4wR7hs5LRr1GQ/nJg+PZs5OGNoKb5aWxsuOoD1TNpEHnnIr6tcDavkPebh5taXcCaGwRo6M5HZRYhzBjS2XIJ1+rxsy8oXBN6RvYDYxSXlavTJQQ2UDvtDfa3tuK6n1UIUYfnhY4YtGAw1RfJiY98dVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814524; c=relaxed/simple;
	bh=xbhzrVeTs5Np2fqOtNi1Shl7AMjJ6sjyyPAHut2Dtiw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCg95PGIBmSVJNDeucFODQFCKhKUy1wHf3oUckdFZmGk9ScOanyJ5BhmKBhcDiS9T1dgt4Q+WvnEQ5yV17oKmDsoWLP58RkoGBn/aL3/hpnf1HS71xbiU87gFbaGebWhJpyvltbFW2ZO91dgaJ7+x+zYIvASN4TVtkPq7iPycfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2zZ29YF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2zZ29YF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782814520; x=1814350520;
  h=date:from:to:cc:subject:message-id;
  bh=xbhzrVeTs5Np2fqOtNi1Shl7AMjJ6sjyyPAHut2Dtiw=;
  b=J2zZ29YFUHSbrr2m98F8OTJg/Bt8/MXzkVgm8iwo0WdWbNFel/cjX1R/
   OP2GyJ0xPjK+OrTzBi00ff/wIfuFj46BM4Ipgh6ZG84pvj9rKZNf79QSw
   sjMq55e9Oxz6+WqPNQvtg8xoUnVp3uEsixpCeCYcxQtuI0nXeXPK5bmHW
   ulwrSm9EEGysswEIkMR4h/RIMfGFjrEp8t2sLyteJvtf+si2+r5I5uiTC
   /ajPWeS6jRIq4FV9UKW8CxIxlPE+E56Fb0p0A3KB3dDRi+BvMB+/dgw4B
   kk5GpM3aaIUteJngQe/YPlEBTx/TOjyR0N35rQ96TRokryTu5OrRbdgVg
   g==;
X-CSE-ConnectionGUID: w2NSId3kR7ejoQ6krsMgMA==
X-CSE-MsgGUID: xjfB5DWUSmamFZQZTZizYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83580740"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83580740"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:15:19 -0700
X-CSE-ConnectionGUID: nzwlk3vUSuiT1b9+XmdfbA==
X-CSE-MsgGUID: KQZDkBKcRCaKq82lFNg7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="245876486"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2026 03:15:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weVUq-000000000S9-3vQn;
	Tue, 30 Jun 2026 10:15:16 +0000
Date: Tue, 30 Jun 2026 12:14:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 117/117]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): Unevaluated
 properties are not allowed ('SDZ-supply' was unexpected)
Message-ID: <202606301251.6RxNy3B1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: James Calligeros <jcalligeros99@gmail.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   99c4b512cb31202c213d72e2422577adbe1324d6
commit: 99c4b512cb31202c213d72e2422577adbe1324d6 [117/117] arm64: dts: apple: t8112: Use new codec bus keeper config
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260629 (https://download.01.org/0day-ci/archive/20260630/202606301251.6RxNy3B1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301251.6RxNy3B1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606301251.6RxNy3B1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8112-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8112-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8112-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8112-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8112-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8112-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8112-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8112-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8112-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/pmp_report@23b3c0000: failed to match any schema with compatible: ['apple,t8112-pmp-v2-report']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
