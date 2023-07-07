Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD99BA2F
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Jul 2023 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688725678; x=1720261678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=455AWBwvygyOlA9SUR17Q0UMrGaZb81ZHRNi9bttFU0=;
  b=fm3svllvZXZyeWlga5Ner3UZ928pdcfZZ6Q0UyuoEDW+i6blOv4GTAcK
   eutDCd+FTJzdvrn6fn73GZ8iJmGsHIuBoPu7b6I/KpMmfcNh+gjmhCTz8
   3YOlcqPFg879SWb2sCsPksFFR8cGsRImJlVEOkJnIWZmRgEq46cB9ZRV/
   sFduvbnHcq4ub4ne8bPh/gwbTc2WywHNN0KJ5wnbmyZxShhuUDTmfiBpp
   xFc+yrDEP/95QR3HYZU9cZPGmZh5xejcK+madL+binMumsov7l9bBLvoa
   nW1zE1aW3LVVfWRNCd3B5DfyoLxQ9E5DV9XzScxBP76PbtkgrumbeNsVX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427543683"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="427543683"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 03:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="844075490"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="844075490"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Jul 2023 03:27:56 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHigt-0001wY-2y;
	Fri, 07 Jul 2023 10:27:55 +0000
Date: Fri, 7 Jul 2023 18:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shenki:aspeed-xvuart-host-driver 3/3]
 drivers/soc/aspeed/aspeed-host-bmc-dev.c: linux/module.h is included more
 than once.
Message-ID: <202307071806.FEKZ7a84-lkp@intel.com>
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
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux aspeed-xvuart-host-driver
head:   8384d7b383c2aff772d5503ddddd8a938e48c43f
commit: 8384d7b383c2aff772d5503ddddd8a938e48c43f [3/3] soc/aspeed: Add BMC host driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071806.FEKZ7a84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307071806.FEKZ7a84-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/soc/aspeed/aspeed-host-bmc-dev.c: linux/module.h is included more than once.

vim +6 drivers/soc/aspeed/aspeed-host-bmc-dev.c

     3	
     4	#include <linux/init.h>
     5	#include <linux/version.h>
   > 6	#include <linux/module.h>
     7	#include <linux/kernel.h>
     8	#include <linux/errno.h>
     9	
    10	#include <linux/pci.h>
    11	#include <linux/file.h>
    12	#include <linux/fs.h>
    13	#include <linux/interrupt.h>
    14	#include <linux/wait.h>
    15	#include <linux/workqueue.h>
    16	
    17	
  > 18	#include <linux/module.h>
    19	#include <linux/serial_core.h>
    20	#include <linux/serial_8250.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
