Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4891A258F
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 00:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693699238; x=1725235238;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=89abuXRRdRrlspBl4wHJjzzwkYEUNwRmi0eaKVbMSEs=;
  b=TjJXa91/3ZRhLi2F8vBvL2Dq5+K/rl/9lX17kjQGIQaF5vxGrC9o5r3M
   QjsA4y/M+cCQbF+Jo6eyojoMYioT9A/LKjTQNHaiu8gn+403TXg8QPfRA
   fHeqZnclzqqnQ8DUpjyZmTfvIl0+WETQ8iXB41ofuoKi8X9U6GYaE6Dwe
   5J+L2gMNOLtPxZXsT/3gox89J1wlX5ERLVtgQL5YEUB40kYti90EzpnXE
   B5O1VO8Mhtx7jw0MTzwSCPqLouMNhEK/dMDDq38Ygi0GGsmZW8hh1Ml7Z
   OAQD2wsNZCKyjBtW+PP84+eQUK3gPA23bIaOdCY7yi7wa8YL3qDWcsV2J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366635027"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="366635027"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="1071158256"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="1071158256"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2023 17:00:35 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcaXZ-0002hr-0g;
	Sun, 03 Sep 2023 00:00:33 +0000
Date: Sun, 3 Sep 2023 07:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mcp23s08: Simplify probe()
Message-ID: <202309030751.GQvtrZnS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230902090937.32195-3-biju.das.jz@bp.renesas.com>
References: <20230902090937.32195-3-biju.das.jz@bp.renesas.com>
TO: Biju Das <biju.das.jz@bp.renesas.com>
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/pinctrl-mcp23s08-Extend-match-support-for-OF-tables/20230902-171023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230902090937.32195-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 2/2] pinctrl: mcp23s08: Simplify probe()
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20230902 (https://download.01.org/0day-ci/archive/20230903/202309030751.GQvtrZnS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309030751.GQvtrZnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309030751.GQvtrZnS-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-mcp23s08_i2c.c:33 mcp230xx_probe() error: we previously assumed 'info' could be null (see line 31)

vim +/info +33 drivers/pinctrl/pinctrl-mcp23s08_i2c.c

b5f259f6fc5912 Biju Das         2023-09-02  18  
8bb5811129f9e4 Uwe Kleine-König 2022-11-18  19  static int mcp230xx_probe(struct i2c_client *client)
0f04a81784fe3d Andy Shevchenko  2020-04-07  20  {
b5f259f6fc5912 Biju Das         2023-09-02  21  	const struct mcp23s08_i2c_info *info;
0f04a81784fe3d Andy Shevchenko  2020-04-07  22  	struct device *dev = &client->dev;
0f04a81784fe3d Andy Shevchenko  2020-04-07  23  	struct mcp23s08 *mcp;
0f04a81784fe3d Andy Shevchenko  2020-04-07  24  	int ret;
0f04a81784fe3d Andy Shevchenko  2020-04-07  25  
0f04a81784fe3d Andy Shevchenko  2020-04-07  26  	mcp = devm_kzalloc(dev, sizeof(*mcp), GFP_KERNEL);
0f04a81784fe3d Andy Shevchenko  2020-04-07  27  	if (!mcp)
0f04a81784fe3d Andy Shevchenko  2020-04-07  28  		return -ENOMEM;
0f04a81784fe3d Andy Shevchenko  2020-04-07  29  
b5f259f6fc5912 Biju Das         2023-09-02  30  	info = i2c_get_match_data(client);
b5f259f6fc5912 Biju Das         2023-09-02 @31  	if (!info)
b5f259f6fc5912 Biju Das         2023-09-02  32  		return dev_err_probe(dev, -EINVAL, "invalid device type (%d)\n",
b5f259f6fc5912 Biju Das         2023-09-02 @33  				     info->type);
0f04a81784fe3d Andy Shevchenko  2020-04-07  34  
b5f259f6fc5912 Biju Das         2023-09-02  35  	mcp->reg_shift = info->reg_shift;
b5f259f6fc5912 Biju Das         2023-09-02  36  	mcp->chip.ngpio = info->ngpio;
b5f259f6fc5912 Biju Das         2023-09-02  37  	mcp->chip.label = info->label;
b5f259f6fc5912 Biju Das         2023-09-02  38  	mcp->regmap = devm_regmap_init_i2c(client, info->regmap);
0f04a81784fe3d Andy Shevchenko  2020-04-07  39  	if (IS_ERR(mcp->regmap))
0f04a81784fe3d Andy Shevchenko  2020-04-07  40  		return PTR_ERR(mcp->regmap);
0f04a81784fe3d Andy Shevchenko  2020-04-07  41  
0f04a81784fe3d Andy Shevchenko  2020-04-07  42  	mcp->irq = client->irq;
0f04a81784fe3d Andy Shevchenko  2020-04-07  43  	mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
0f04a81784fe3d Andy Shevchenko  2020-04-07  44  
b5f259f6fc5912 Biju Das         2023-09-02  45  	ret = mcp23s08_probe_one(mcp, dev, client->addr, info->type, -1);
0f04a81784fe3d Andy Shevchenko  2020-04-07  46  	if (ret)
0f04a81784fe3d Andy Shevchenko  2020-04-07  47  		return ret;
0f04a81784fe3d Andy Shevchenko  2020-04-07  48  
0f04a81784fe3d Andy Shevchenko  2020-04-07  49  	i2c_set_clientdata(client, mcp);
0f04a81784fe3d Andy Shevchenko  2020-04-07  50  
0f04a81784fe3d Andy Shevchenko  2020-04-07  51  	return 0;
0f04a81784fe3d Andy Shevchenko  2020-04-07  52  }
0f04a81784fe3d Andy Shevchenko  2020-04-07  53  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
