Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCACC17991
	for <oe-kbuild@lists.linux.dev>; Sat, 11 May 2024 03:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715396566; cv=none; b=j3nndBV5qwUzuzfW9bliqL+lokxXY6c927iCkQN+Nmnkh2OOq/nSMJLwowbBOooCwiLeFGXyFhrPVVZ629DU+PzsnYc3pJTYc5Sl2CU4CE7iawN7k96SxPlQ3e/eawYhbqDz6SnjAjqKVsftPlSgXM4CymVx0B+fnWSZf99iHlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715396566; c=relaxed/simple;
	bh=OUtzxbiZBF3+/wq6hfBPBwE5ZJuiWqYN7s6eLNSSEys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IqzlSCVo4tw9l2xyFxAmKYIs+3IxuqsAY2O+ptciEEo9hi1YU2GvRvK2yV/VYv+G6BIG6BIUThwP6dcZyoVmw9Q6FzZEYS4uY1jyM/KEMUgUpWLQcxPD2+QKCCGrT46OYL2ZCbOsZ/7/Oqt4iYiMpeISyTpqncMj8VBYbLO9ANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ee4zuHC5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ee4zuHC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715396565; x=1746932565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OUtzxbiZBF3+/wq6hfBPBwE5ZJuiWqYN7s6eLNSSEys=;
  b=ee4zuHC5q+S/5U0bPrjRCbjN+x+BlC4Q/vhvIoIK4v8aLi6xfScU6G04
   pxkOGIfj+Qtz7ddfDvKV3tVs8KdEry+HCiocRlpb8iy2/4mtRaOi0uIxX
   HHU7ZwbVVApDemTn+p4GSuvy7Oy9P9x0d/h60jfrtx9C8hnOYud3RRm9m
   yKQ7pvI+A/xk95tALTcnXyei6ztC+V6ObuG8fa1Yju6+M1nMTAgIrZEKI
   bsYjtL7UyoooeBM/peMxdeNhWBCZCy3FVKOtGxvNcR1pJ5biysOMcDXeK
   mVQ58kAL4gJAc9cjWWa6Ol2bMODTbjovTz44mN6VbdGDs3KRiWOLonGp1
   g==;
X-CSE-ConnectionGUID: FQH2GR1vS6SukV0WOSzHeQ==
X-CSE-MsgGUID: 2whMenuURUuj+LgRmgE18w==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11567580"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11567580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 20:02:44 -0700
X-CSE-ConnectionGUID: UKhlOffYQlOIZccWFDffcg==
X-CSE-MsgGUID: u/eN54vbRcea4SQPLMQ3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="60647621"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2024 20:02:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5d0S-0006qR-11;
	Sat, 11 May 2024 03:02:40 +0000
Date: Sat, 11 May 2024 11:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 6/9] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dt.yaml] Error 1
Message-ID: <202405111012.nunvEZtG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   a9b51c2494133c012e34a050191e3954b5109747
commit: 22baeec0beea26e4aeea8a88ee7d2f7dd77779c5 [6/9] CHROMIUM: arm64: dts: mt8186: Add new touchscreen in Veluza
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
dtschema version: 2024.5.dev2+ged9190d
reproduce: (https://download.01.org/0day-ci/archive/20240511/202405111012.nunvEZtG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405111012.nunvEZtG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8192-evb.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8192-evb.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8195-demo.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8195-demo.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml] Error 1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
