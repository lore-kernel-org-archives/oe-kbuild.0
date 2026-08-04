Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8CE3F54A7
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825596; cv=none; b=Rt1urJislZdDar+38NE5Hw08N/MKF1g2+jPwrnl/6lLBsObm3ux9ZYTbkrDqth34b0OHUKRC07dFvaRkay31ZBVfF/D2eLvshvLwvwNNoXntliwbo4GxzA29zOI0s2DY7T5+ytFCN6uImjJs/LAIRUnBVQcq5H7pgJ7ZjzQWAm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825596; c=relaxed/simple;
	bh=qQfgN5eYrY9xAsK4uFLSqKzeOTm1vuAwQyTy+QxA+Eo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tMQ/beKN2YNS+fmDbJ6tNu8DlS6AHPnC9z1U9U/6dHA50Vs0l9Gsmy+sgjVStZJ+rTGakIOkryUdMPbbhYniKY4pj/OiS5unoUjDZ1vBmAlrOGi9LJfp4Nx0onaP9M7UnepHHdB2xiCxx6SyK6wytYDQGCp3AIt3H3PW9acwlAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjmSbwt7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjmSbwt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785825594; x=1817361594;
  h=date:from:to:cc:subject:message-id;
  bh=qQfgN5eYrY9xAsK4uFLSqKzeOTm1vuAwQyTy+QxA+Eo=;
  b=FjmSbwt7upeGLAeCF4D9OdX9oGgcwnLPoI8tytfP/RVFmgJg7QmdShsw
   +wf22osy/CJvtC8eNkLlyPI4DydeXLVJAKtIrN2ZJZkc0Ks1M2CNlUM/W
   vr8DF20xb4vPOuTCePJuhh9ImPqd3aY31zos0Krmh1myxI+76bQuuTXLb
   upiFilY/oui0aFsob/x/9kGdLrVZtc15ch3I3vnwwqttP/S1wNa6MIo+N
   v+MHQt7/B0diOUp4cnz1zlnEAEHagOeNs907VjyIgb3vhhlYygcUG2mnK
   Pg6Qo5F1KU9jQtjxA5zTzrp2RVG8fQrC9sC7VRc/rKuTAhE0qXzPK/Oma
   Q==;
X-CSE-ConnectionGUID: QiHdthuhTjC8S0i1VHdH5A==
X-CSE-MsgGUID: IexU9c/GRJCX/xsbMnZ5GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97525209"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97525209"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 23:39:54 -0700
X-CSE-ConnectionGUID: LKsCq0epR2+cW/+opDKMbQ==
X-CSE-MsgGUID: soR7BQ0nQJiSTTwxpvlIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="286074896"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2026 23:39:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr8oW-000000009AT-0sNS;
	Tue, 04 Aug 2026 06:39:48 +0000
Date: Tue, 04 Aug 2026 14:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/usb/gadget/udc/bcm63xx_udc.c:1845 Excess
 function parameter 'driver' description in 'bcm63xx_udc_stop'
Message-ID: <202608041430.DbVPV31N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
commit: 46d9c16115cf046ce564f0230126cae785f73826 scripts/kernel-doc: Detect mismatched inline member documentation tags
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r064-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041430.DbVPV31N-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041430.DbVPV31N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 46d9c16115cf ("scripts/kernel-doc: Detect mismatched inline member documentation tags")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608041430.DbVPV31N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/gadget/udc/bcm63xx_udc.c:1845 Excess function parameter 'driver' description in 'bcm63xx_udc_stop'
>> Warning: drivers/usb/gadget/udc/bcm63xx_udc.c:1845 Excess function parameter 'driver' description in 'bcm63xx_udc_stop'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
