Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DA88825
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 22:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694383709; x=1725919709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izuZztBq73mjMNk79HLwH26xpCnzJ2BSj/hjfLOuJAY=;
  b=QbzQCsU3ATNwgwulSrLYgG6E5e78YVBuneUdTtxCbKP/t+VgkTMuMPLO
   8J+bdyYWK6jq51Qi0l3NOcc324b3UKNT1icOv99ymdSdNrMJyUVb9qnU9
   GsLPOtlYDCumXkub6UMhR5mOhC0k3cMWfY7OY5XIXNWQAdu0v8xGSVJxy
   FncJ3UvTD5iq7XGjMfbF/wDYocfK2VgD1o8FA1Mo1zXedaI/ubQv4XABz
   wzjPwoT46/i2CRBzmNoITxMTgIa8xX2mpUV6YrztqSbH5rZguAzaocEbS
   urHj0y/za/W8egE46YX2TYoWm7IJerGrg8kAfmqYs8wWlbEwrSqW3AwlE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="362972625"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="362972625"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 15:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073902472"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="1073902472"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Sep 2023 15:08:27 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfSbR-0005Tm-0q;
	Sun, 10 Sep 2023 22:08:25 +0000
Date: Mon, 11 Sep 2023 06:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hverkuil-media-tree:hdmi-dbg 9/27] drivers/media/i2c/cat24c208.c:
 linux/of.h is included more than once.
Message-ID: <202309110546.f8QdSkwB-lkp@intel.com>
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
TO: Jonathan Selnes <jonathansb1@gmail.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Erling Ljunggren <hljunggr@cisco.com>

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   4e36f69879c101236bfb136deb83de210cf43046
commit: 888bec9a94511b113c044468ba95d33eb980daed [9/27] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110546.f8QdSkwB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309110546.f8QdSkwB-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/i2c/cat24c208.c: linux/of.h is included more than once.

vim +15 drivers/media/i2c/cat24c208.c

  > 15	#include "linux/of.h"
    16	#include <linux/delay.h>
    17	#include <linux/i2c.h>
    18	#include <linux/kernel.h>
    19	#include <linux/module.h>
    20	#include <linux/mutex.h>
    21	#include <linux/mod_devicetable.h>
    22	#include <linux/gpio/consumer.h>
    23	#include <linux/slab.h>
    24	#include <linux/videodev2.h>
    25	#include <linux/workqueue.h>
  > 26	#include <linux/of.h>
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
