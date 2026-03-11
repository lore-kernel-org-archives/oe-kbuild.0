Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E723EAB2
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 04:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203275; cv=none; b=IiJjZWTu34kV8ltqPV2w0RPJojDyOYeMucaQSblMh7ZuzBBQTKEcqXtk4dWsZIVe/RViAuLYIy8pohFv+jpm8X1e9/3mvKwlPmUVtDhiOuY7qAqWn2em8G37ZgwWJ2Laxoo9/eSYZECePqflX7re7T910aVskfjTpA033hBbt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203275; c=relaxed/simple;
	bh=U4suKJz7b5kV8wYs4lG+/MmQo/Ei30IHg2pT5AK2Jlk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eefT4RyBG7rVJGa0XmYRJFD7F1Fyam1CfffTxC2HKc9ECiro3P+WZKr8ZE2W3Wfv9lXy1XCa4r8x15y/4/2WtfqpG5HaopWA1NETk6TBs15MgzUJL+ePr6R0GdzRvAzhd5ORzLFuUJ5U5r2NQK9y+ZnBcORqR/kBQumkITvS3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mg3ow05N; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mg3ow05N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773203272; x=1804739272;
  h=date:from:to:cc:subject:message-id;
  bh=U4suKJz7b5kV8wYs4lG+/MmQo/Ei30IHg2pT5AK2Jlk=;
  b=Mg3ow05NAgG5i6Uj5qCE2WFNgNKMIKUFVlhB4KWw8mUcTLSL3R5wAuWk
   42/ZV7xVyn1i6qNqEbH9zkkwBFyGrx19EcEqIFSjP0/dywnmY+VOE2ell
   nOWfnycxkTYWD1b+WjHETytfPuU/RamFkGEdYyxXMlxkYdXGBgIip5Shq
   WoqGdXk5jjsQB8pdcacrNE08TkXiQ+SDVQCThiURQN7X1kqY5LdIG+Myr
   vk7JwXHouK1cZv1t60JvMOCNagadtPPXITlVjkfKE741yBnmLrKg98jF4
   N8rGajfU/AMFSQ/R+YYajnoodGMot2UgSagamCxPFg6J7SiSXNv6g2KRm
   A==;
X-CSE-ConnectionGUID: PmVWrgcuRJWP40VEV1KPdw==
X-CSE-MsgGUID: K1qIF80HTH2o3UQXP7HgVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74177994"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74177994"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 21:27:51 -0700
X-CSE-ConnectionGUID: 53mDjcolRMCyMmQw46F0Xg==
X-CSE-MsgGUID: 528p63CRRKOXDxALQgPKpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220373535"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2026 21:27:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0BAi-000000003GD-1Dcl;
	Wed, 11 Mar 2026 04:27:48 +0000
Date: Wed, 11 Mar 2026 05:27:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 218/621]
 Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml:
 atmel,smc-page-mode: missing type definition
Message-ID: <202603110528.nmKjdsSh-lkp@intel.com>
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
commit: 5817f8797e4aeee478801793812ea89dfbcd838a [218/621] dt-bindings: memory-controllers: Convert atmel,ebi to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110528.nmKjdsSh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110528.nmKjdsSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110528.nmKjdsSh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
