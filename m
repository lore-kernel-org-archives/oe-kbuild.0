Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B038291F
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682866231; x=1714402231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6/jIHIgB1LHwwHWFZVYoPPz7oGxuc/PX5ATbEo7D2U=;
  b=VCpwwKqJ0dCpC+Epdq0oocvVa777rAk2NblnQHGnsQj1llTvqK9mDuNF
   J79OAZkv5wjlwkQMG+PPrRa9MQrwWj3wVTPwpNwkDBvusQGRgfJhDiit+
   QOj0wBmGYfAd4PmmSX4FHQ5grqZPHjoxldqcugmuan3SxHCai7h3wtGNH
   4v565/uG888A8d6+Ln7V//rIRKKWXuJSyCAkuz7Ckm3VyblauCe6wkGEu
   ySXZyVp36ORjVZQQKZqsRgJB2cbIkWxwQjjJuysNH9iPcrbK8akuX9idl
   og2qZW6dG1ALl9Xr3hxkH0+xdWMsOG/tuxP5cC0ISf8yryrLGxBAsJida
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="328378678"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="328378678"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 07:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="672926132"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="672926132"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Apr 2023 07:50:26 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt8Ne-0001g0-01;
	Sun, 30 Apr 2023 14:50:26 +0000
Date: Sun, 30 Apr 2023 22:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mscc/ocelot_stats.c:75
 ocelot_check_stats_work() error: uninitialized symbol 'err'.
Message-ID: <202304302241.iztYrXw2-lkp@intel.com>
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
head:   825a0714d2b3883d4f8ff64f6933fb73ee3f1834
commit: fe90104cd6048364db821c06bcb2246074919c04 net: mscc: ocelot: move stats code to ocelot_stats.c
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: m68k-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230430/202304302241.iztYrXw2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304302241.iztYrXw2-lkp@intel.com/

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
