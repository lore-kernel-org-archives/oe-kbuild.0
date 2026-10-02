Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946DF4570FD
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977001; cv=none; b=fe2lyz+lPcvOqqmUhVcU4KWTzVv2oyFfIKO96RW+IupZj3vXysIARCp/fLdOScHYqNMczQqW9+qa1Ayrt+FXXcfgpljSZYnk332LUheBvghanKdvxqPqi7gwT+bf6xdxxTZ2rxZmc9GuJH5nmPLSog45hAe1ewCOc2Al8H1+s9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977001; c=relaxed/simple;
	bh=1TT4grKMP+G+dqZczBDVOmtTTuvEjpRJFB0u8j27VcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EwTTS2+HGf/2piXpWEJsLU8W0mo8ZfJVSVuyfy6qNQJdg4y3iJ8oAzgMCEe14DO82LVmoRbcYHX4q/pzzy2aLtT8lQPW3nR6D6effeybyG8PbJwprPk6AnNzIqAVJJeKGP5/IdxaSCHOXNAXT1WO5NZy9BtphLhwKElIFsV22FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGXQ+tRC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGXQ+tRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790976997; x=1822512997;
  h=date:from:to:cc:subject:message-id;
  bh=1TT4grKMP+G+dqZczBDVOmtTTuvEjpRJFB0u8j27VcY=;
  b=FGXQ+tRCGo7TOSnqZHB035PwrwREuoGHPSUAD0EdewUhHgIZQFAAXNpM
   XcRh7M/sWTwGn564mSSd6hfQdzZki0mH5+7kSFXtP/Z608S6/gFCy/ED3
   /dJH5jXVNfr/I6brHs6tFxiuOgp8oiqlZd5zwjBSDOwfB/fq/99JtuetW
   zbcW6yzI98RYeTwfBsFbSeyaxSwHmdCq34fMJPpw/yvQ1EtKF0h5TVpsO
   xhP6+k8uXS6vBWDR9Srsw/TZ2XFQzfp5hzUIzQxsyGxlAD2ASmAVL7C8h
   cbuPKgn9/BJwRpbWjo3LkCpqyta5YwnA8zjedDB3hRJwOkei6wcEZV9zs
   w==;
X-CSE-ConnectionGUID: +5XlmAwtQ4anBlTEwP6KFA==
X-CSE-MsgGUID: TiW7BIL3TGe4V6qn8SV0Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="101078615"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101078615"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 14:36:36 -0700
X-CSE-ConnectionGUID: ioN8FOqxTOOfm4vy0dmcpg==
X-CSE-MsgGUID: C0ilgEBgTGyaSkSdSqn1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274150064"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2026 14:36:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCkvh-00000000TVF-01Cs;
	Fri, 02 Oct 2026 21:36:33 +0000
Date: Sat, 03 Oct 2026 05:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/rtc/rtc-raspberrypi.c:18 expecting
 prototype for rtc(). Prototype was for RTC_TIME() instead
Message-ID: <202610030533.NdBMhtiQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Sander-Speetjens/dt-bindings-rtc-Add-missing-type-to-trickle-voltage-millivolt/20261002-122417, commit: f0603900ba1981a9e2248413689194bfaed6f91e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sander Speetjens <sander.speetjens@gmail.com>
CC: 0day robot <lkp@intel.com>

Hi Sander,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Sander-Speetjens/dt-bindings-rtc-Add-missing-type-to-trickle-voltage-millivolt/20261002-122417
head:   f0603900ba1981a9e2248413689194bfaed6f91e
commit: f0603900ba1981a9e2248413689194bfaed6f91e rtc: Add Raspberry Pi 5 RTC driver
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: parisc-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030533.NdBMhtiQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030533.NdBMhtiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030533.NdBMhtiQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rtc/rtc-raspberrypi.c:18 expecting prototype for rtc(). Prototype was for RTC_TIME() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
