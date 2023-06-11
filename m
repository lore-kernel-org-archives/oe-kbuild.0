Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD41415CA
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 05:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686460910; x=1717996910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GRGkHwgmFh0pOPB56ABd5FYYl9jDojPCOLp+Lf9AUJ8=;
  b=NjWjeRwjepbfPh5yhg7dFyyIXfh13qidH8Adqb60YZnC+6AbLK4m00Bx
   npHrCMIdgAY24rOSptOmZ2Bi1o7F1sw8t260Os9FcykQpladn7iVYyJQN
   0kurJ0rX4lY6t9uEim/CLJ8Zt/dGMFXZs4eCl3WRhr+2RcGW9TMzi4OBe
   G/QMGHp3jsldLEN6dnXua6G2IROVvaZfqO+rQYgSIsXkoIrBzAgGGPKDY
   eG3URJzKZws26oTih8GOfyF2VWs2RknTfTcM4YNSdzDNdVnNRSDs36ck0
   4eEvyG1vZEnXjBzAdnF4THwLYbstHPEXMBYLM+BGyxGdrCJhFy4EM0eEV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="421423999"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="421423999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 22:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="743913936"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="743913936"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jun 2023 22:21:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8DWO-000Aem-0m;
	Sun, 11 Jun 2023 05:21:48 +0000
Date: Sun, 11 Jun 2023 13:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt/header-cleanups 19/20] arch/powerpc/sysdev/of_rtc.c:
 linux/of.h is included more than once.
Message-ID: <202306111337.g3HQW5b3-lkp@intel.com>
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
commit: 6bd2c1239dfcde3e23570ac6b044382269edfd17 [19/20] DT include cleanups
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306111337.g3HQW5b3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/phy/tegra/xusb.c: linux/platform_device.h is included more than once.
--
>> arch/powerpc/sysdev/of_rtc.c: linux/of.h is included more than once.
--
>> drivers/net/ethernet/freescale/fman/mac.c: linux/of_platform.h is included more than once.
--
>> drivers/usb/host/fsl-mph-dr-of.c: linux/of.h is included more than once.
--
>> drivers/regulator/mt6359-regulator.c: linux/platform_device.h is included more than once.

vim +8 arch/powerpc/sysdev/of_rtc.c

   > 8	#include <linux/of.h>
     9	#include <linux/init.h>
  > 10	#include <linux/of.h>
    11	#include <linux/of_address.h>
    12	#include <linux/platform_device.h>
    13	#include <linux/slab.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
