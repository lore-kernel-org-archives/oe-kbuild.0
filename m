Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22739BA22
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680812113; x=1712348113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=stZQ8Tj4jcAJ5GsUaU2z2cvzEnfdqkR8B3qpsSqzxkk=;
  b=ZDW4Ee9EZXPTyqP2t+aarE0yYz7djlw9ODAsgGLwdO9L05oLJ9M5LCOQ
   hPvIkzcED6i50RKF5FEQtcg98E/0g5gThZ4kuJ3xhvMoGPo04o7WatKQr
   fKE8PkzN/gnDiBYkX1WRb/LTvWn7XGU75VwMDt+xesYptqJL25CMV4Vzi
   fmgV57xLaBcuIHw/kCPTXV7Nw8850netMUjsDm59sFQjWLI78Xw0F+Umc
   /m1OQYwnpg9Huh7mrCc9iIWZY/WUuIxBktiVU+wcuQxcZuLrSb0Vtr0A0
   pTNSv3NNmmOPb8+h0yIm9PU2x3SqpUMlzsXHa6xEP9wmvzfnPsK/owcmw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326900868"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326900868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687269270"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="687269270"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2023 13:15:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkW0j-000RjU-0D;
	Thu, 06 Apr 2023 20:15:09 +0000
Date: Fri, 7 Apr 2023 04:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mscc/ocelot_stats.c:75
 ocelot_check_stats_work() error: uninitialized symbol 'err'.
Message-ID: <202304070454.zyIz7AIL-lkp@intel.com>
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
head:   f2afccfefe7be1f7346564fe619277110d341f9b
commit: fe90104cd6048364db821c06bcb2246074919c04 net: mscc: ocelot: move stats code to ocelot_stats.c
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230407/202304070454.zyIz7AIL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070454.zyIz7AIL-lkp@intel.com/

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
