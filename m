Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753107C
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 02:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680401508; x=1711937508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=js8ry3h4+yQJvT4bIbYJP7cm+SSiy6BTFeQqHRi1jOI=;
  b=jDGQ41EPTT1JnXUnP5x0Y8ttxgzY4fZHvngN7OmdKyXMv3If7F1MYXAf
   DBsqaBMjMw0t8Ngxt49hsCVt0y1aIAoWyfLeRSg7BahfRQU3jm/IulYo+
   JBaPgV2hv6SbuzT8G2AsC1rGH8y6CFH47dEc1r6Atb2Fvg9lU3zmrvEHz
   tZzZ/SRamipLo9pCs7alMJfb/KbTcRQJ/N7KjadKMheAvyw2sPzYVp0tV
   ertLExkt3u2XMOlpsNjApB4AZeRKJL0ZgG9ojsvvaVmVwtZUxDaS+gP0i
   vw8moiPPKXHAXQ8k8cmQ6Yuetka+83bKY+BrA3Fy+FokXklsmu1qAnaTv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="341713736"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="341713736"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 19:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="688113259"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="688113259"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Apr 2023 19:11:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pinC5-000NAz-2e;
	Sun, 02 Apr 2023 02:11:45 +0000
Date: Sun, 2 Apr 2023 10:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mscc/ocelot_stats.c:75
 ocelot_check_stats_work() error: uninitialized symbol 'err'.
Message-ID: <202304021056.yfxjmhH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: fe90104cd6048364db821c06bcb2246074919c04 net: mscc: ocelot: move stats code to ocelot_stats.c
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230402/202304021056.yfxjmhH4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304021056.yfxjmhH4-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mscc/ocelot_stats.c:75 ocelot_check_stats_work() error: uninitialized symbol 'err'.

vim +/err +75 drivers/net/ethernet/mscc/ocelot_stats.c

fe90104cd60483 Vladimir Oltean 2022-09-08  55  
fe90104cd60483 Vladimir Oltean 2022-09-08  56  static void ocelot_check_stats_work(struct work_struct *work)
fe90104cd60483 Vladimir Oltean 2022-09-08  57  {
fe90104cd60483 Vladimir Oltean 2022-09-08  58  	struct delayed_work *del_work = to_delayed_work(work);
fe90104cd60483 Vladimir Oltean 2022-09-08  59  	struct ocelot *ocelot = container_of(del_work, struct ocelot,
fe90104cd60483 Vladimir Oltean 2022-09-08  60  					     stats_work);
fe90104cd60483 Vladimir Oltean 2022-09-08  61  	int port, err;
fe90104cd60483 Vladimir Oltean 2022-09-08  62  
fe90104cd60483 Vladimir Oltean 2022-09-08  63  	mutex_lock(&ocelot->stat_view_lock);
fe90104cd60483 Vladimir Oltean 2022-09-08  64  
fe90104cd60483 Vladimir Oltean 2022-09-08  65  	for (port = 0; port < ocelot->num_phys_ports; port++) {
fe90104cd60483 Vladimir Oltean 2022-09-08  66  		err = ocelot_port_update_stats(ocelot, port);
fe90104cd60483 Vladimir Oltean 2022-09-08  67  		if (err)
fe90104cd60483 Vladimir Oltean 2022-09-08  68  			break;
fe90104cd60483 Vladimir Oltean 2022-09-08  69  
fe90104cd60483 Vladimir Oltean 2022-09-08  70  		spin_lock(&ocelot->stats_lock);
fe90104cd60483 Vladimir Oltean 2022-09-08  71  		ocelot_port_transfer_stats(ocelot, port);
fe90104cd60483 Vladimir Oltean 2022-09-08  72  		spin_unlock(&ocelot->stats_lock);
fe90104cd60483 Vladimir Oltean 2022-09-08  73  	}
fe90104cd60483 Vladimir Oltean 2022-09-08  74  
fe90104cd60483 Vladimir Oltean 2022-09-08 @75  	if (!err && ocelot->ops->update_stats)
fe90104cd60483 Vladimir Oltean 2022-09-08  76  		ocelot->ops->update_stats(ocelot);
fe90104cd60483 Vladimir Oltean 2022-09-08  77  
fe90104cd60483 Vladimir Oltean 2022-09-08  78  	mutex_unlock(&ocelot->stat_view_lock);
fe90104cd60483 Vladimir Oltean 2022-09-08  79  
fe90104cd60483 Vladimir Oltean 2022-09-08  80  	if (err)
fe90104cd60483 Vladimir Oltean 2022-09-08  81  		dev_err(ocelot->dev, "Error %d updating ethtool stats\n",  err);
fe90104cd60483 Vladimir Oltean 2022-09-08  82  
fe90104cd60483 Vladimir Oltean 2022-09-08  83  	queue_delayed_work(ocelot->stats_queue, &ocelot->stats_work,
fe90104cd60483 Vladimir Oltean 2022-09-08  84  			   OCELOT_STATS_CHECK_DELAY);
fe90104cd60483 Vladimir Oltean 2022-09-08  85  }
fe90104cd60483 Vladimir Oltean 2022-09-08  86  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
