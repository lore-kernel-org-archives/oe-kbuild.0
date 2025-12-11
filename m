Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873F192D8A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765458170; cv=none; b=Uq032GnDlZ7nXt/pc0w5sgMs6Y4k76LDRLNlI6EerBD4AQp80IoKega7HAzwa6pfEljQDyzjxuP/2vT3ASvpMhL9EYnuyNaPEqjrPHcyY4lXW0trUzTvBhdi/RY/ZxRPIR9pB4sBF+5o4uiZEfqv5/BNX/iF8tmEZtfp84u7xL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765458170; c=relaxed/simple;
	bh=r/Y2EFOcLYjExk3eDv9dZozXh+cQU0SHS8TUclR+uUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNY1de09u8+WsjfbEPH9sZqANhtSpjUZfMkURd9lgKb+tlpmW5ujPJyesxjsL9Mg1CvC9IlsFLCFLkXB56sXq7PVbY1KTIWlL8TSpaO2XaZUX7DWqJxkvIObjOHdx4YmKs4EFqTOTVGLAit7D/uuqbvTgQDmxoQQiyLsu5RE0Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPxezxcE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPxezxcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765458168; x=1796994168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/Y2EFOcLYjExk3eDv9dZozXh+cQU0SHS8TUclR+uUg=;
  b=nPxezxcEuu4KkazLZKPwZXe7pZVhwZeyNG4a26kX6A7kQxwa1Fw9/YdX
   a4iluYI4bHxly8+4s90pB5BGJH9zfd4WgPUJ+fML4CyBXJaepRZhCYClY
   icAW9KW468V5lSxBEpaFY3C+siKlScxxz3Vv6+o6Sk1MHvwBK6pRZp5Et
   KKPdGNvYoUSyy0ZgxQT0xTmmvM3aXy+wL8xbMkG54PkCBgkUhz41rDpho
   Aj1x4EvBHoTZj+qAMlkl6c+vjvUPJdM26rx+jPYagq+L+dzC4YA0nzDlx
   6KNVI3i9mCVC7nS2/vNdpYhtym3HWPFWfLfJWKIrm6jChIF9h4WohhihK
   A==;
X-CSE-ConnectionGUID: ltOO9462QGmw03ZIHscrUg==
X-CSE-MsgGUID: NbAciV8DRhSKgXv7adYDDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84847584"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="84847584"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:02:48 -0800
X-CSE-ConnectionGUID: l47cIfOrRnmgd4j90Mnauw==
X-CSE-MsgGUID: 0IS4kCryQr6O0ahzkEhyVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="201220504"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 05:02:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgJh-0000000016E-06vZ;
	Thu, 11 Dec 2025 13:02:45 +0000
Date: Thu, 11 Dec 2025 14:01:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tools/testing/selftests/vfio/lib/sysfs.c:2:10: fatal error: fcntl.h:
 No such file or directory
Message-ID: <202512111413.6b3YU1iC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Raghavendra Rao Ananta <rananta@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Raghavendra-Rao-Ananta/vfio-selftests-Introduce-snprintf_assert/20251211-021935
head:   4a5587b56280853c777a57f0d0ed02bf603d00c9
commit: b7d1ae2c582c89062b3f85a1f94c1b39ebb547b9 vfio: selftests: Introduce a sysfs lib
date:   19 hours ago
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111413.6b3YU1iC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111413.6b3YU1iC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512111413.6b3YU1iC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/sysfs.c:2:10: fatal error: fcntl.h: No such file or directory
       2 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/lib/sysfs.c

b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10 @2  #include <fcntl.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  3  #include <unistd.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  4  #include <stdlib.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  5  #include <string.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  6  #include <linux/limits.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
