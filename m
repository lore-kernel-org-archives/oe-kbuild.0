Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2753D68
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713024120; cv=none; b=IJxpli6KIVoX8iszh1J35ep8fTowFQ7FBg8W0i6rVYZLH+M12r/auY8kvH/HYROrMH5je5tI0rxeRqcq2EJenAerShWWc7uaR+x4tO3JbO8KJDDDFWf15JQI/j6tpy7uyFZLs1SX2TE9A88EHrrrZygDdvyeWxNIc4j8tkkiBQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713024120; c=relaxed/simple;
	bh=MkLp47QNVTb+4keNVaaNPL/2aXAmzGOWPxeEhuExvc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IiPauzgqcvkk9t23mmuvs2C96ClfSDwjeIq9NNaNxqmxq4C2sS+v9NNmGo0/bkcPpSdU++UdDFGxJBFQO4/MtfYdQIk5AyPf/z4H1alJ3iVmd2TaVbmiKLT2+eKKX8nsvBYIruIDpc3DGf4uHKDMLJamov1QVpk/sE13kDUXMfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laKros4w; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laKros4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713024118; x=1744560118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MkLp47QNVTb+4keNVaaNPL/2aXAmzGOWPxeEhuExvc0=;
  b=laKros4w/l1JKsHIVtySwASWfxAwxiVp6GxolsROT0eKNTGXKUhS/bly
   4vgrXZouYF2DexLwqclQ5gJ8R8TmYA0+uEsqJHXDc6WYK73H43hqeUf/s
   zyRyfVz1Xc6y0qP0exVZh2LV5og5MlrVYX0wxst+HZzrY0kFNWDmLD3qk
   WYf+SGheZA4Ec6zz9ZZDx6bGBrD+GYzMwwZaAS+Orjbz6rA7sPpvjgufL
   NXBuwDR/Xj0MszWrTvunfy77lIz8QJ7PNd56R0/Obi0XNVaAjHfnilXhA
   uSMD+UZj/GaO8vSONimGtneF9Nb0IzA4+NrfsEKDR5y0huleFQnEcI3MQ
   w==;
X-CSE-ConnectionGUID: cEBgf7rGSbKmfMiAUxLZtw==
X-CSE-MsgGUID: TpgpYl1ySz+zCv7vynA6YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="25981549"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="25981549"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 09:01:57 -0700
X-CSE-ConnectionGUID: j/jHTwKdSwWPMPFO3m5XaA==
X-CSE-MsgGUID: 1Dp9mwQ6TQeAVJ77F3GGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="58926331"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Apr 2024 09:01:56 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvfp5-0002qy-1k;
	Sat, 13 Apr 2024 16:01:49 +0000
Date: Sun, 14 Apr 2024 00:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 19/22] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml] Error 1
Message-ID: <202404132300.usD9FKmJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   f9e93fcc1b2b72931ed6e75b6964dc74f0e0b8e3
commit: 094079bc0206fd913bf829bf507139bfab36882a [19/22] CHROMIUM: arm64: dts: mt8186: Add mt8186-skitty
:::::: branch date: 14 hours ago
:::::: commit date: 29 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
dtschema version: 2024.3.dev14+g64b72b0
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404132300.usD9FKmJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404132300.usD9FKmJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml] Error 1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
