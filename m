Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97533399372
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jun 2026 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906322; cv=none; b=VdZ5RB4VhKpX/sWBH3BAGy5wSpaznmNRjqn7GASDdPN47k+zSUYFtIHCPgybrV8r3R35eZsha7xDekV7u4o3Bop/kRuquGWHVJX24bqa3IiVJcr3bxvO4Y3ac2Yp0iBLVaPgXa7bDe/6x2dJdtdRpjGlBzjxG7KJlvrfvqqGmM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906322; c=relaxed/simple;
	bh=dIKPjiTOe/Yy0q7DwCUcihTonpoX2DBpGhkbVJzYcN0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HGHKwXA2Vg7G5hZBX93kHRIaA6MQ+IvtNPBTRrkdTbXyWlbWnw8bqubRW+vKj/BBgtfV4qXnxXH3j4yeUyWjgzyJsVpcRqKkt3rCEvvbDQXMeyDZVYdkgEBDScWQRBvEyACqodXxdqTbj0ArB6IYzmXoyp0K+wWt18UCjz078r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I22JDFC+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I22JDFC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780906320; x=1812442320;
  h=date:from:to:cc:subject:message-id;
  bh=dIKPjiTOe/Yy0q7DwCUcihTonpoX2DBpGhkbVJzYcN0=;
  b=I22JDFC+7uPVQpMYoqQSkgyZC2I72Y5c3rNTxwqn5mNaxY4M1AUci1Yp
   iiSWXK0ESMc173OyWWRyi2PtQTFcExGIH6G7nfKUq891ypu2RHNRMEnk4
   QSpEJ1dm+blYZ23vI8udi0XfNq9/ldlIGTvMpv4SFoxUVVmUEUTK3ZL6x
   25R/8CWz8OaJ9PwpBsLhVde3rs7vtDNXFkbwQ9K6lcxDnzIOY3HQio0g4
   ErJr+YRNc2/HEcJAUFJYAcH1UmdicbBCE9qNxV56FIZL+9i0gaRVUnkXZ
   7AgHXp4B98QdhxqdZoXLA13jrsP0W3iLYRGwT5nORIj8s5x4Kvc4WFO13
   w==;
X-CSE-ConnectionGUID: xMQAkm85SGOqSaOFqtnKpw==
X-CSE-MsgGUID: 7XZUZ+HEQWKrSCS3V8uQZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85261786"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85261786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 01:12:00 -0700
X-CSE-ConnectionGUID: PpqPay/ETJykAW9w/yBJOw==
X-CSE-MsgGUID: ZLByrrsBTSC0J4oz4YwemA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="247335055"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2026 01:11:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWV5R-000000003DB-0thu;
	Mon, 08 Jun 2026 08:11:57 +0000
Date: Mon, 08 Jun 2026 10:11:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dtb:
 /soc/hstimer@3008000: failed to match any schema with compatible:
 ['allwinner,sun20i-d1-hstimer']
Message-ID: <202606081038.F1LjdUSY-lkp@intel.com>
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
TO: Lukas Schmid <lukas.schmid@netcube.li>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lukas-Schmid/dt-bindings-arm-sunxi-Add-NetCube-Systems-OpenNMC-dobermann/20260607-051101
head:   db9a856f594986822035c2363e8274e35faeb9a2
commit: db9a856f594986822035c2363e8274e35faeb9a2 ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)
date:   35 hours ago
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-2051-20260607 (https://download.01.org/0day-ci/archive/20260608/202606081038.F1LjdUSY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606081038.F1LjdUSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606081038.F1LjdUSY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
