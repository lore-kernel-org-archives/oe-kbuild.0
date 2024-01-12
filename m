Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E06D1BA
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jan 2024 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azv5vXnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705065390; x=1736601390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TxEGagygQywmZ004DRLbyIFOPz6osJe2QXCEazJul3s=;
  b=azv5vXnqlP6vhvUD5DfMbxiCqwjHqguYOaWYss9779Q0yBBWnby5nVPs
   r7snSA+OHj7A+AiIA+Irx6jMT8VjL41h/xLmvBhBuJUISUTHbeFLFHEv3
   d8ae85jNbkexoK1SqPRn2HThxRThBVrRyn4XSLrBBnCbtpi7NtPL1E3+u
   h3kSfBXQlRlwJChJF/Uh5y9yCreFcFCPWiGMW9yvbavxu1oXRjwfK2nql
   Wxafibhk+cKsb4ruHKwau2ba7qC91Nx5A7JkdmN3h0SsZtlj4tVWIeWRy
   FVl6F/qAcUHgSqrSZXf3Vve8MoPjbMp3vixgPvD4o7MN8v424tTc2pmOn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6530533"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6530533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 05:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="817072193"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="817072193"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Jan 2024 05:16:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOHOb-0009V0-38;
	Fri, 12 Jan 2024 13:16:25 +0000
Date: Fri, 12 Jan 2024 21:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.1/dovetail-xenomai 15605/15708]
 drivers/clocksource/mmio.c: linux/slab.h is included more than once.
Message-ID: <202401122105.8DOW8dWD-lkp@intel.com>
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
:::::: branch date: 9 days ago
:::::: commit date: 4 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401122105.8DOW8dWD-lkp@intel.com/

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
