Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5BE1465B5
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715583126; cv=none; b=VYQN88t1pTZmF7rz8dr8uvAOXbN2yRnUguF0Vu1Tb2AExlPK4cmUEu0pzAACMe0N7HNIDwlG15mRxhM9gsfCkjIa69DbiIvCK8B0VmQ+gVljdMOIwlReM0vfE9c53/nsHqb1bUawEYpde5m5jCDYymiEx4uqYCd4ingBy9qpydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715583126; c=relaxed/simple;
	bh=dPXMkQ5latb4gaEM0e8EJ95dTxvXnzUQ8CWggKEpyhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/3WO3lkB2bccHyOjTqz0vrdnWXkrMUTUoA9noEW2L0YYEJ2UHRdWpOh18w+RP8bGnFzWZ6Hfx4tS3eg1epCaqUu/saXrAvNdb2oh+iFllWHY4zMBaskXRM3U4MGnDJkjgK+e3BNpH4eZlaZlbInularX7IbEeNgFUi+tp/XfHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwdxK3kA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwdxK3kA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715583124; x=1747119124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPXMkQ5latb4gaEM0e8EJ95dTxvXnzUQ8CWggKEpyhA=;
  b=kwdxK3kAe2TRRkER2o6Z9OCQgBQOBkyqBil3OQD7ZVGzk68TedW9vwln
   Ctgk/u18B5UgrZK4Fy/+arryySJv90H+2P1yYmI1qwWFjEeQkoxPlybNE
   FT8cdcvLBvkMOFkRrSlxo+J8YDuj9quZYOPbN8JNiPEvKanTnhrzp7DX6
   bahVf88uuRXI4hh2EF2ktkpok/X7YXyErVnpabPgQON4Ec7eeQmGw/Sm2
   /K0F6u4CaICTOZcTjncCmyjDn3yCsIsHC95egsvTeyNOzTn/QPYD+fjt0
   CMfKqe3oM/jbBVxbqoIqUAivClWVrp8CEn5IjtdtVILbeZjrfDmIbYMOL
   A==;
X-CSE-ConnectionGUID: sFuqDdtMQpWCevQOKmXTlA==
X-CSE-MsgGUID: 30ASYn7TREqRgAWcJXVUdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="29014691"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="29014691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 23:52:04 -0700
X-CSE-ConnectionGUID: VyL3/ltUQTaDgfP8VsfV/w==
X-CSE-MsgGUID: jpoU92S9R3+MeyfN5hiDTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34657971"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2024 23:52:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6PXU-0009cP-2X;
	Mon, 13 May 2024 06:52:00 +0000
Date: Mon, 13 May 2024 14:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 10/13] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku1.dt.yaml] Error 1
Message-ID: <202405131442.dnOfxrTe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku1.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   13462c363b251d097da489d96c6a5e13963fd0bd
commit: 983cf8a2ffc55396fb6f9cefe931ec2984a6c8ee [10/13] CHROMIUM: arm64: dts: mt8186-wugtrio: Add starry panel
:::::: branch date: 79 minutes ago
:::::: commit date: 3 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
dtschema version: 2024.5.dev2+ged9190d
reproduce: (https://download.01.org/0day-ci/archive/20240513/202405131442.dnOfxrTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405131442.dnOfxrTe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku1.dt.yaml] Error 1
>> make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-evb.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-evb.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8192-evb.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8192-evb.dt.yaml'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
