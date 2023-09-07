Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8213AC1
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 22:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694124289; x=1725660289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/IQFLU8ekaVG15uErQ4u6GPiJkhWxkTaUbmG+YmeWo=;
  b=EA7sskZh5vHqoP6QHKFvUYuwLlOHKwQD7Ea+zA9FluPR/MqK+cFIU1Fu
   5ol8v7Xx3EiNobXCSqqnbvPfHyhtOfbRqaJIPF6xcwXaI36zXzvLMBepB
   SKlabSO9fMevCAQZREsl8Lk/8oUQSZeEHu4wzh4EJLEA/qW2Rc6LjCs9y
   JsWtTyU3Ua6EG+auHNlfYS1TCS+tQpaoZKuTL1Npwd1rGJczQDc5whMod
   mFBaa//p4gs9VcfHYCoDqty2/DlqYyAopT7Rq1jVZkrbflczCwNUHggVV
   qkcWWruWN/lfHWozjspPYRgsxxfLBPl4paTkcHlA+N20py9GwJjNXH7oR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367751709"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="367751709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 15:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="832373218"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="832373218"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2023 15:04:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeN71-0001cb-2J;
	Thu, 07 Sep 2023 22:04:31 +0000
Date: Fri, 8 Sep 2023 06:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mscc/ocelot_stats.c:75
 ocelot_check_stats_work() error: uninitialized symbol 'err'.
Message-ID: <202309080500.C0h5QUJo-lkp@intel.com>
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
head:   4a0fc73da97efd23a383ca839e6fe86410268f6b
commit: fe90104cd6048364db821c06bcb2246074919c04 net: mscc: ocelot: move stats code to ocelot_stats.c
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080500.C0h5QUJo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309080500.C0h5QUJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309080500.C0h5QUJo-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
