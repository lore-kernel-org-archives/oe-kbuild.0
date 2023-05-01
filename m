Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F452F48
	for <oe-kbuild@lists.linux.dev>; Mon,  1 May 2023 23:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682984761; x=1714520761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRehie1Vah0bsfZC3c0KGu+sokaF2NB6SEYNvhGG+Ow=;
  b=jWuAFl6Qf3mjYtrk00/uqDD71lXvQ+zQPIUVTUQtjk/G0rqvn0xghAE9
   zjQvb+PCavDUjOnFScy+etoy9hb/K1I7PqrEwwFZQr9Uju5TDemEF6i3M
   Tw6HKULGoG0XwWWpvoMhO7bl5hkvKvmCnbg3K5J814NBdkJkYCSS2I/qc
   tgLA4HlMvbsBNsxsp4JFyNwfd4/BduV6slL4x/LLHTCBESKigb2PQR3Xz
   GRyfsFSyFtrZg9CYnsIRlsvHV9WpVXW6MKq1GrwFqwT0Woj6JDcGEQvfF
   fTJmCoUnbG+G/g+QiW66H+0JKBhEOCmu1e/nL0SivexZ4oacdKZAefxa9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="413701703"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="413701703"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 16:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="698726574"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="698726574"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 May 2023 16:45:17 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptdCm-0000hg-2K;
	Mon, 01 May 2023 23:45:16 +0000
Date: Tue, 2 May 2023 07:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/i2c/tc358746.c:1626 tc358746_suspend() warn:
 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1626.
Message-ID: <202305020755.gh27yblx-lkp@intel.com>
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
TO: Marco Felsch <m.felsch@pengutronix.de>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8c655c34e33544aec9d64b660872ab33c29b5f1
commit: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-m021-20230501 (https://download.01.org/0day-ci/archive/20230502/202305020755.gh27yblx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305020755.gh27yblx-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/tc358746.c:1626 tc358746_suspend() warn: 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1626.

Old smatch warnings:
drivers/media/i2c/tc358746.c:766 tc358746_enum_mbus_code() warn: passing a valid pointer to 'PTR_ERR'

vim +1626 drivers/media/i2c/tc358746.c

80a21da360516f Marco Felsch 2022-09-30  1613  
80a21da360516f Marco Felsch 2022-09-30  1614  static int tc358746_suspend(struct device *dev)
80a21da360516f Marco Felsch 2022-09-30  1615  {
80a21da360516f Marco Felsch 2022-09-30  1616  	struct tc358746 *tc358746 = dev_get_drvdata(dev);
80a21da360516f Marco Felsch 2022-09-30  1617  	int err;
80a21da360516f Marco Felsch 2022-09-30  1618  
80a21da360516f Marco Felsch 2022-09-30  1619  	clk_disable_unprepare(tc358746->refclk);
80a21da360516f Marco Felsch 2022-09-30  1620  
80a21da360516f Marco Felsch 2022-09-30  1621  	err = regulator_bulk_disable(ARRAY_SIZE(tc358746_supplies),
80a21da360516f Marco Felsch 2022-09-30  1622  				     tc358746->supplies);
80a21da360516f Marco Felsch 2022-09-30  1623  	if (err)
80a21da360516f Marco Felsch 2022-09-30  1624  		clk_prepare_enable(tc358746->refclk);
80a21da360516f Marco Felsch 2022-09-30  1625  
80a21da360516f Marco Felsch 2022-09-30 @1626  	return err;
80a21da360516f Marco Felsch 2022-09-30  1627  }
80a21da360516f Marco Felsch 2022-09-30  1628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
