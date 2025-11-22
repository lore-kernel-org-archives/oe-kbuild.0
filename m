Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63002C08D0
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763841265; cv=none; b=ZrZlCepHJYdtHMShKNSlI6RwU0vtNThG2oPuS5Ev759IoPbcYX6QFUOlGxU8Us5o/daid2/QBz00aQknDlKfwj/a2IOAgxEB2Ecx/7jsD1dJfPKsuIoelHpnp7wFXrGlb/ESEseW7bKGZnIftUWeE/bh+X1JwU8wdkswE0p7Alw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763841265; c=relaxed/simple;
	bh=DP8wNmp+8GGmgHNRXvGOBcaSdUMmTDJ2MRicwmJFU+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QckjSFSNpThkteY7fO1PNWRnAMYQrIFsW2IIgt4w4Qpn47LPypQsuwVdansE1M9yEyEBdvjj+YeSfr5Fchzbgbl69qL911x7T80cDm8Et3QkumU8dFASZ+6NX3wNASWIiDf00HGZFiS4TQbUamCftJOs3+tFmU7MsgwjS6h0OdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQPnc8t1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQPnc8t1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763841262; x=1795377262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DP8wNmp+8GGmgHNRXvGOBcaSdUMmTDJ2MRicwmJFU+w=;
  b=LQPnc8t1xxxbL1CpVcdYhJmuXuYzDDPytIk5P+g1u9wEF/9oQfKpgZs8
   kG8hKuuOO1hYXTJwI6R+q+yBEXHN+2eFOrCrbX+TDjGzv6igt/xg+TJPW
   T6eMNHqWweMGTANV4qVgea8kR5KMEy8tOc0zsl2Ir5x3u3VIrX4H7wzre
   xFSts3pDNN9U0bOdCMJ+YBkzcSed0vEWQ0ACZePwGarLXQZzgnT+QrmWn
   qU7BawY8+okk5ewZWYKDCK3Qqp6PbSpECTteNrSTvMnHYcVKDQ7UuU/DE
   uhVDvROFOq5X21xWkgZqwyOPwZxx6cn4qfnkByL0XgfxjquNG/rLooOxR
   w==;
X-CSE-ConnectionGUID: lJQZJgiMTzGUhq+X4QNBHQ==
X-CSE-MsgGUID: v8/npSxvQV6NX8kObh5f4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65841003"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65841003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 11:54:21 -0800
X-CSE-ConnectionGUID: LrbPDtK/RoiuV6+uOrV5nQ==
X-CSE-MsgGUID: 2zZRIFStR0qcUpTrE/G6vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192751349"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 11:54:20 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMtgX-0007nh-2s;
	Sat, 22 Nov 2025 19:54:17 +0000
Date: Sun, 23 Nov 2025 03:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 12/18] vfio: selftests: Move IOVA allocator into
 iova_allocator.c
Message-ID: <202511230306.1hPcCizQ-lkp@intel.com>
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
In-Reply-To: <20251121181429.1421717-13-dmatlack@google.com>
References: <20251121181429.1421717-13-dmatlack@google.com>
TO: David Matlack <dmatlack@google.com>
TO: Alex Williamson <alex@shazbot.org>
CC: Alex Mastro <amastro@fb.com>
CC: David Matlack <dmatlack@google.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Josh Hilke <jrhilke@google.com>
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Raghavendra Rao Ananta <rananta@google.com>
CC: Vipin Sharma <vipinsh@google.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on fa804aa4ac1b091ef2ec2981f08a1c28aaeba8e7]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Matlack/vfio-selftests-Move-run-sh-into-scripts-directory/20251122-022109
base:   fa804aa4ac1b091ef2ec2981f08a1c28aaeba8e7
patch link:    https://lore.kernel.org/r/20251121181429.1421717-13-dmatlack%40google.com
patch subject: [PATCH v3 12/18] vfio: selftests: Move IOVA allocator into iova_allocator.c
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251123/202511230306.1hPcCizQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230306.1hPcCizQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511230306.1hPcCizQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/iova_allocator.c:2:10: fatal error: dirent.h: No such file or directory
       2 | #include <dirent.h>
         |          ^~~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/lib/iova_allocator.c

a1ab4208a86852 David Matlack 2025-11-21 @2  #include <dirent.h>
a1ab4208a86852 David Matlack 2025-11-21  3  #include <fcntl.h>
a1ab4208a86852 David Matlack 2025-11-21  4  #include <libgen.h>
a1ab4208a86852 David Matlack 2025-11-21  5  #include <stdint.h>
a1ab4208a86852 David Matlack 2025-11-21  6  #include <stdlib.h>
a1ab4208a86852 David Matlack 2025-11-21  7  #include <string.h>
a1ab4208a86852 David Matlack 2025-11-21  8  #include <unistd.h>
a1ab4208a86852 David Matlack 2025-11-21  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
