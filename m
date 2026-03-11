Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D7248873
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 03:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773200210; cv=none; b=Lg8/eKyKfxozbA/Q/PQydjTFgWq7z/XyIjf+n+ZY795Vg+sY3Sbr6MBDzahx37uclxODYzVXBb4xLN4zwqqbBx+AucC8UVY9e//5mf63qynx32HrA4qIN6YbIGOOjKb/Ay98rRnx7zhfrlZ+fUmDENeh2ngvvb0RWRtaY3W9Kw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773200210; c=relaxed/simple;
	bh=MY6f+Tqr77LL229UgPi0BcCbyknQ/rGfNFeLruxrU3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tz7WcuN+oxlgGKEqHe2Cq4A+a73eKO+ktzgqkkbaGwTwC+vNjeAr297OZXAI0WQDL/8j//SGBBJDES9SVMqGllBOxHc1+L8iOaaDabRqSCmq2Qv/Xhu41K9Pb97yJ54r495d9z7teUAUiYY0o/9LuEPcAlIVYqsEjjJjthTSIWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFb0FKAJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFb0FKAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773200209; x=1804736209;
  h=date:from:to:cc:subject:message-id;
  bh=MY6f+Tqr77LL229UgPi0BcCbyknQ/rGfNFeLruxrU3I=;
  b=oFb0FKAJbuR+554C2sPYObCPCFt4fSMNdQ7tL+J+QSOMkUG3gAPOzWoC
   dIx8A9u30XdanKPxPn8nlqb5RwP7gUBoVnxSIEprhBme+aCAaoY7MFJVB
   bzvhG95Cd5k14islT4lltIpGHKBXdikWAzPNxM3HavnoZYI2O6d1B0EgU
   ZTof/TJRrONh/qmFeqwIVWjDsEBqKrZ5Zn8WYWv2fJ+0r+f7a//igTBcM
   qt3Bo22FD9GvoHqASQ0JIP0sIPCvjd4OnYO4FJYLHyohIaVykOGt3t6lJ
   onnxqe+zvzGnwVL17YvU9bbe9yvpherss3y2kk2x8iEufS77QwUw4ET+Y
   Q==;
X-CSE-ConnectionGUID: 0Keu7m/GSQGUja7Ol7OmpQ==
X-CSE-MsgGUID: T+JZgKa0QByBVcwrMRLwpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85349397"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85349397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:36:49 -0700
X-CSE-ConnectionGUID: xvR9VqbfSl2Ob4UdxN3W/w==
X-CSE-MsgGUID: 6XLDiPlwRJ6wkvtN71If9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220361489"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2026 20:36:48 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0ANJ-000000003D3-3hqa;
	Wed, 11 Mar 2026 03:36:45 +0000
Date: Wed, 11 Mar 2026 04:35:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 192/621]
 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr:
 missing type definition
Message-ID: <202603110428.6RB7U7zA-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 40d5cd8fbee8170be3d6ccdeb824a7726b9badd3 [192/621] dt-bindings: leds: Convert lacie,netxbig-leds to DT schema
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110428.6RB7U7zA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110428.6RB7U7zA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110428.6RB7U7zA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
>> Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
>> Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())
                ~~~~^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/mk_schema.py", line 28, in main
       schemas = dtschema.DTValidator(args.schemas).schemas

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
