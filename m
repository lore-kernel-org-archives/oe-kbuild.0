Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118188BF8
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Apr 2023 21:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682632293; x=1714168293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSPY6NocecjGkssTipGAFH+PPhb9rrtEwJYshoyhj7Y=;
  b=DrStFBeHiQCn4+gfvnaW8lut0QgdMB2mGd0q7C7BiXq5emReNxsXU9UG
   uOUDZnrapBJ6kH5J7HF83dch/kQc5vO33FysS/qN5BDzBeKcIq0K6tw9T
   VWv+98RmlLYJNh2SgKEWLkMSQpQFDQFNkHWIDvvwOAGt7eHOIi5tgnys1
   UY9go7cBWQLoNEzK+dblV4ZIG03WBv+zYGVqv+YLghcJ1WfNM9cJPznMJ
   cqjfbrE43h2w9xPmSgf0ibGI5pHTuDgPvdcqV4FGo9UfAx9TLA7vizFzX
   HDdxpgMGAsh0OWojqXvzjabBAAWACiazr/oEAShDh5NQ80dFv74o9TnQR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346345784"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="346345784"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 14:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868892645"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="868892645"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 14:51:28 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps9WR-000091-0y;
	Thu, 27 Apr 2023 21:51:27 +0000
Date: Fri, 28 Apr 2023 05:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mscc/ocelot_stats.c:75
 ocelot_check_stats_work() error: uninitialized symbol 'err'.
Message-ID: <202304280526.wzYKRcv7-lkp@intel.com>
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
head:   cec24b8b6bb841a19b5c5555b600a511a8988100
commit: fe90104cd6048364db821c06bcb2246074919c04 net: mscc: ocelot: move stats code to ocelot_stats.c
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: openrisc-randconfig-m041-20230423 (https://download.01.org/0day-ci/archive/20230428/202304280526.wzYKRcv7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304280526.wzYKRcv7-lkp@intel.com/

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
