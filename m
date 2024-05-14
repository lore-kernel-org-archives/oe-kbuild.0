Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6817FF
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 01:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650573; cv=none; b=d8MIFZ3VWfW6ftagpritFNm4sqp7jdeuu+u4FyxA74ZTn4oO4NbIuIBEfdnyQvYMI9ntGHLSyJ0CoW51YlJ4KVEtSixBOGp0bEx0l0reL5/03iJNGjaSkBSlyIaV5j1b910D6pLj23oJzrWZtpSu+81nbOAU3AEp1td2QUwa4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650573; c=relaxed/simple;
	bh=FGsMv+9KfFoakNWyjID0OijkWYfzsQPEnM27MD6/IJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDwfXTkwSnpzMdY8zEBbGTxU0yqM6SoYH3Ar6EHqKOA2bloYSWhK1oktK92977kW3KtI1Jkq+J2dx9p3vr8g/Sukuuwec+oPAr4NpcXmL2Sng6Uo4l+U70fYZfOL0uMHqzggM82hl5mltSwpVOY0TN59qy0jcB+EYnkObdVuX4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4AJZE2T; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4AJZE2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715650571; x=1747186571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FGsMv+9KfFoakNWyjID0OijkWYfzsQPEnM27MD6/IJo=;
  b=g4AJZE2T830dRV1qx7uk7wZ2befKzfPU7qxzUW8Yrm7acxFz/caBnwdL
   efCu3eCoxG4mHOKX6ugBXzZRApE/GuUeo0uQ7SKp63zsI4R6ZayCAw4Rj
   n8vK9XeL6PN13svJlrJ69G+DjyeirWCwLcULPZsFtX3rXaDsc0MkdoS+e
   zO8S2QphrRSbGg8gRpla3Mu18+T27D0e5vS2uY6Qm1ccWsn8TIQL6GDZE
   IH2diRt6dXyMX/IAhqacDT2i9Gv59TsZlbiGMexYOFCruWzhV7v0P343c
   fDVJDGq+MZaXDBhsqXlw/dZFK2YLcu2Kuo4BUH7bW2aqiyQenN9QN1Kd5
   w==;
X-CSE-ConnectionGUID: E/yxr9TcSDq+sM10HTJAiA==
X-CSE-MsgGUID: up2YTWOWS8Kn+C90oK4iCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11431920"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11431920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:36:09 -0700
X-CSE-ConnectionGUID: nNyHomR6RWiBRP9nTvVKzQ==
X-CSE-MsgGUID: onf6WCAUSmawARgYqCMWsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="67990819"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2024 18:36:08 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6h5J-000Av7-10;
	Tue, 14 May 2024 01:36:05 +0000
Date: Tue, 14 May 2024 09:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 20/21] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dt.yaml] Error 1
Message-ID: <202405140922.Z0omcobX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   fd4390aa6d5e5024ef62f597e06373352810a560
commit: c3a3a44bb020ce7ad0c77be1ecdea76fd3d05734 [20/21] CHROMIUM: arm64: dts: mt8186: Add corsola-squirtle board
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
dtschema version: 2024.5.dev2+ged9190d
reproduce: (https://download.01.org/0day-ci/archive/20240514/202405140922.Z0omcobX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405140922.Z0omcobX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dt.yaml] Error 1
>> make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
