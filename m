Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466DC150997
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763831831; cv=none; b=mZTuH+tpt0mgOauz8gaeMJngGcp1ajTLxTVesiIq01YUmWi3+wEDO0cgX+Lhtah7HYdSCkDL5N1+nZB/0575Du5e5fkBpbf+avKPyWa4ZjtWwZ6emHcWHAengZfGDnq96G9gLu3aE5+Hysd4gUvu3jv5aDPHl6LzHJVgiorrj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763831831; c=relaxed/simple;
	bh=559RN8wYFFEt9FIqbu+IkGLNAyljcA8Vjymyt3qR1PI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dDaI43JA0Gk2J+8YJqknNLS37RuMbVliFQgiVVwGDAHdgh5Oo0JzgSwIIqQAVQgi9/7KBBx17Lg3fMIgFd3uA/bSXJXz7mrNI8x+F1aMtz2fAHT3YYeAX3sXokQXRhJlwpKLM/Gio+bsdmeXcCXL3GhV1dyfroqrOpmMvAxFHj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnxijEMR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnxijEMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763831829; x=1795367829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=559RN8wYFFEt9FIqbu+IkGLNAyljcA8Vjymyt3qR1PI=;
  b=gnxijEMRe4pWvRKfOBdr4DhqTxiK9CuUDG4PQ/hAqF7RfoF8ZXuAHESb
   7NlLr6pmT2xNEREibL/f8R2z3QFgLwk5CVJOK0i8o7Pop+a0t3LUoze7T
   jFizP0ASCM7V99JxVdEspnT5LefWZgeJUUMVMig/lS6GdxeKHALaTsKaB
   0ZtzPjKxnA3ANVKbLDa5uaJZsPUUY/W7vxQ3tLI3F7byPaEG8S+4dqd91
   uGQnjCDFWoItFWpLLDNs/PUl+/IOGRdFp9QYgRE9X6gPJltFiAvwdtSTr
   M4EKDALcd+wjmq4BvSu3cnZLLgAnDUqPypI7pIPnWgBmhSHy56cIu9IOf
   g==;
X-CSE-ConnectionGUID: hcU4WBGpQkerUrvnXwgdMQ==
X-CSE-MsgGUID: AFkNmgt8QQCT0rMyJMblNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65927274"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65927274"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 09:17:07 -0800
X-CSE-ConnectionGUID: VDvfxj9JSrmjmwgor9d+rA==
X-CSE-MsgGUID: ycrbOm+1Q5CP4wKW/uqkaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222587426"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 09:17:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMrEO-0007iV-0z;
	Sat, 22 Nov 2025 17:17:04 +0000
Date: Sun, 23 Nov 2025 01:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 11/18] vfio: selftests: Move IOMMU library code into
 iommu.c
Message-ID: <202511230037.0t3o9ByZ-lkp@intel.com>
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
In-Reply-To: <20251121181429.1421717-12-dmatlack@google.com>
References: <20251121181429.1421717-12-dmatlack@google.com>
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
patch link:    https://lore.kernel.org/r/20251121181429.1421717-12-dmatlack%40google.com
patch subject: [PATCH v3 11/18] vfio: selftests: Move IOMMU library code into iommu.c
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251123/202511230037.0t3o9ByZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230037.0t3o9ByZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511230037.0t3o9ByZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/iommu.c:2:10: fatal error: dirent.h: No such file or directory
       2 | #include <dirent.h>
         |          ^~~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/lib/iommu.c

4391647129942c David Matlack 2025-11-21 @2  #include <dirent.h>
4391647129942c David Matlack 2025-11-21  3  #include <fcntl.h>
4391647129942c David Matlack 2025-11-21  4  #include <libgen.h>
4391647129942c David Matlack 2025-11-21  5  #include <stdint.h>
4391647129942c David Matlack 2025-11-21  6  #include <stdlib.h>
4391647129942c David Matlack 2025-11-21  7  #include <string.h>
4391647129942c David Matlack 2025-11-21  8  #include <unistd.h>
4391647129942c David Matlack 2025-11-21  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
