Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A39257E
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694359321; x=1725895321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tLtSwYhpJADJPGXPpsHarHkkkbe62+GV4k5vx9Svr1A=;
  b=NYdGL5zxJGCtD0KrETAdWSpZEK4U/AecyoPUoTz/KUyitGJC8XCUSP3M
   JZAEO06yHKmuB83pZwCtParzGb8kZVneS/mqlWNHh7eTihHdZW397jTXn
   Kid+vpbTTp8ZXO20DalXa9PpiHiusuZwwzhJH+pMwNvgkVS7zUZSIfMvJ
   nXEzyoevRPgEuab1KKfO4JS9jdoQ2Ok2FM+fnowLZDuYa7xyDjTVH3vML
   Lu8aldZGDuk0+6xBZccg970qCZSWozeUctpsPPIARxwNm4XxI4r7g8VnQ
   VzSzeEJJe9DHmv/sui7q+A11Tk0n93x4AphosvBN6cU4+WXNFlsL1gyyr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="444332970"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="444332970"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 08:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916734138"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="916734138"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Sep 2023 08:21:59 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfMG5-00055D-1W;
	Sun, 10 Sep 2023 15:21:57 +0000
Date: Sun, 10 Sep 2023 23:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hverkuil-media-tree:hdmi-dbg 2/27]
 sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than
 once.
Message-ID: <202309102328.tIiTqx1m-lkp@intel.com>
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
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   4e36f69879c101236bfb136deb83de210cf43046
commit: 6f24fe32ea9540ce2945d64d477fd3babd4b662e [2/27] hifiberry_dacplusadc: add support for the Hifiberry DAC+ ADC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309102328.tIiTqx1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309102328.tIiTqx1m-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than once.
>> sound/soc/bcm/hifiberry_dacplusadc.c: linux/module.h is included more than once.

vim +22 sound/soc/bcm/hifiberry_dacplusadc.c

  > 22	#include <linux/kernel.h>
    23	#include <linux/clk.h>
  > 24	#include <linux/kernel.h>
    25	#include <linux/module.h>
    26	#include <linux/of.h>
    27	#include <linux/slab.h>
    28	#include <linux/delay.h>
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
