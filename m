Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5AAF512
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOVnfO1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705124258; x=1736660258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUD8WD86O5S3hm6B5QIpPjADXUXmBGpxPvExYHJrp98=;
  b=mOVnfO1mx6sZxWl4+qQpeF3YtyXQXQPiwkVxDP4nRWdk3ttzXKXmDsQ4
   XxUsWa+jczvpbSMCPlh+KDaqmH0OtJcjntxVbfIw1R0aMl+HYGDie+/u2
   /y7K0RCradgnwYSdDNbyrQj0FVno4rHyX0brlSeCqYUGvugC18Zl6TbDu
   eV7g90eSZs/S8fiDoitRY/PygjlXMcpRwGjQHGcL1q52gG/mi6tTrYepm
   sOvD5l+DJGeiAD/iGWXhBmBV24LOMwvmoSG40P9CLNMi/3bGvVRkqKZK6
   7orM9q9CyjCt3s/ee49h9nCONAIOGeG0p1PW3weAhgFs3mumTb6mDMgOb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="398220436"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="398220436"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 21:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906520379"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="906520379"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 21:37:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOWi3-000A8M-0v;
	Sat, 13 Jan 2024 05:37:31 +0000
Date: Sat, 13 Jan 2024 13:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.1/dovetail-xenomai 15605/15708]
 drivers/clocksource/mmio.c: linux/slab.h is included more than once.
Message-ID: <202401131355.lrapqTYY-lkp@intel.com>
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
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: d4e16bf0941a00ae6aec566cfd1496d416139429 [15605/15708] clocksource: mmio: add user-mappable mmio clocksources
:::::: branch date: 10 days ago
:::::: commit date: 5 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401131355.lrapqTYY-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c: linux/slab.h is included more than once.

vim +8 drivers/clocksource/mmio.c

   > 8	#include <linux/slab.h>
     9	#include <linux/spinlock.h>
    10	#include <linux/uaccess.h>
    11	#include <linux/miscdevice.h>
    12	#include <linux/list.h>
  > 13	#include <linux/slab.h>
    14	#include <linux/fs.h>
    15	#include <linux/mm.h>
    16	#include <linux/mman.h>
    17	#include <linux/device.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
