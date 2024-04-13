Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4CD10957
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713015509; cv=none; b=Y1Vfpbo2hEXJYFlp3/h/k7WPEeq5WCK1jzvvon5jjHx8UPnRJJSOCW5NW6KZhajFHoDBJwQobLZgOfuKfegRiEaADQrs1w/S2KptaxWmAN232RrOjyOp2O7895EgurR5TlH8wKwTyUr477xeKF2zLlQLG/scDcK6gC2/3VbddPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713015509; c=relaxed/simple;
	bh=vtkSGY4IF5JUO5B66zwa1CJx2ArfzectVJqjPzNY1zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z9t9TNf7BYSTd6sW1eXuFsBgfKW7/SHZhAm83Wr0xnVaUD6Jtz0EqLv2BJgXdMrzHvneUmA5l8sXULh4rDxKkEx4jRmBBBTMCqYqUP6QjuYwOnA4lbmolK+lFRCDCYvjFRKl20sx5OGqSafTXtkUX8F+QntA/fShFGyP80hyICE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N57AkUu9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N57AkUu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713015507; x=1744551507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtkSGY4IF5JUO5B66zwa1CJx2ArfzectVJqjPzNY1zs=;
  b=N57AkUu9O+J7dkJRK5cIgMVz2wsadPH/tgykOWCThQqW+Qco1RbEa6PT
   GluOhbf+x7QQpUJtirPPq0Z0IZLv5s66WWhSXI5RNqMMgAFCBLVYtTmMe
   M/7j0VIOfTpb5bdn2l4cOGjW5SHHLo8eKBp/8jLiiJ0KrQOAJ4fqlppbQ
   krOG9HFcScxQ5olPISQRusEMxK10WJ6XicvJ85w26Rn8J02CA0FZRFcTM
   FdvmVwiN5eIOxFZOdLUiMvGKJ1gRm2ISSJmq35w1KFJlElZJCUVCE4c9Y
   h8Yqs2W50VpUVQelFMumYTkpbYuHAGFRZruIEDYsr+UfCEZitQ6L8D99e
   g==;
X-CSE-ConnectionGUID: ZMcWix2LTXSO7ipua2hnsw==
X-CSE-MsgGUID: iViYDEqqQUetdcBn+753nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="9012743"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="9012743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 06:38:27 -0700
X-CSE-ConnectionGUID: bCu+oqaTRtywwdcKIL/jNg==
X-CSE-MsgGUID: vH/n2rAzTIa1kdd9vK4FQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="26288708"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 13 Apr 2024 06:38:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvdaJ-0002aW-0F;
	Sat, 13 Apr 2024 13:38:23 +0000
Date: Sat, 13 Apr 2024 21:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 9/22] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml] Error 1
Message-ID: <202404132133.nb0kgJWH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   f9e93fcc1b2b72931ed6e75b6964dc74f0e0b8e3
commit: 8aa0b3ed2564db4a5e44add011ee9c075cd824fc [9/22] CHROMIUM: arm64: dts: mt8186: Add mt8186-wugtrio
:::::: branch date: 12 hours ago
:::::: commit date: 5 days ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
dtschema version: 2024.3.dev14+g64b72b0
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404132133.nb0kgJWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404132133.nb0kgJWH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-evb.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-evb.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dt.yaml] Error 1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
