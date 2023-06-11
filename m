Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E611105
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 00:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686443596; x=1717979596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZN59a5kXjmDWZzQA45XHuvK3pXoeFPqMjfsEFBbIVYk=;
  b=nvAtJIAayPb+FpI6pmuE3PDUKPDDI6n2HRAVzPoxdW+IaUJhx2Ri9opY
   ZZPhaQ2kZC/J6jVSE6CraoofeuO79RHgjjijRh8VrsaFfyUfbvjYI3NbP
   KT9AKqEZwus7QKaZt0WD421T8cTrzh/ZH/8dKRT2J+XXAVUBLUuESdh1M
   4FJsnNr1ZGkNTqfhVRnE+FizEwmGo0ARVbPKh5NOzloZM1DVdTUVwqCMG
   gfClq6MM9oxdjsH3S8ge52dNP7GNz0LkUB2J/DJk8lZmuHaivebC19Bp6
   jB/1RyzdgOls7sAo4Yyt0fIeFZ7jj3B93wJyvDbBpg+iktWiDabvXQpze
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="444185920"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="444185920"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 17:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="855147760"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="855147760"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 17:33:15 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8918-000AWG-1Z;
	Sun, 11 Jun 2023 00:33:14 +0000
Date: Sun, 11 Jun 2023 08:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt/header-cleanups 18/20] drivers/firmware/meson/meson_sm.c:
 linux/platform_device.h is included more than once.
Message-ID: <202306110817.hE7USVO9-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: e5f3e4857d32954dded294a3536c0d97dd345921 [18/20] Use of_device_get_match_data
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306110817.hE7USVO9-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/firmware/meson/meson_sm.c: linux/platform_device.h is included more than once.

vim +17 drivers/firmware/meson/meson_sm.c

    10	
    11	#include <linux/arm-smccc.h>
    12	#include <linux/bug.h>
    13	#include <linux/io.h>
    14	#include <linux/module.h>
    15	#include <linux/of.h>
    16	#include <linux/of_device.h>
  > 17	#include <linux/platform_device.h>
  > 18	#include <linux/platform_device.h>
    19	#include <linux/printk.h>
    20	#include <linux/types.h>
    21	#include <linux/sizes.h>
    22	 #include <linux/slab.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
