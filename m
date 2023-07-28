Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11EE7C
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 00:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690504985; x=1722040985;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sKDnRqwOx9GFy3Zfc0npq9FooMMzlqTveFx+Qgtt3kM=;
  b=gf7FRXd00/v6z/abmCopo8SPyl4G4e9uT1HozPfW5atAsxseqPR0T8vu
   SSqqCg4XHubbNM1riQ1vKun2jFA0J8y6eXiz7XkQ5GWpbvMzDZRZ7T9Mx
   3AzuODAZJiwrYMRYsY3KXpCtigKz70zLnDxgdh8ILBlZdU9PoQ2oTZDX3
   PuE7+GN/6o0iekpK6cW5hiiQt/8NHbd62tGgu4tXVDQ+sEj7RY9HrruQ1
   AEbcE7TA4dBv/m4dWP7GydFChfou/DB0vBhysELBPWfZnwgQA3OyoTnZR
   A9he5bafxrgX/oexK7S1+RPYJzJCSP9cMP1u1dWvwUkGR/IXNYZJ61FBG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358492632"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="358492632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 17:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817284527"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="817284527"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2023 17:43:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPBYM-0002j5-30;
	Fri, 28 Jul 2023 00:42:16 +0000
Date: Fri, 28 Jul 2023 08:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/6] kernel/reboot: remove generic restart mode
Message-ID: <202307280845.PjOBJE7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230727-pca9450-reboot-v1-5-c8edb27bf404@skidata.com>
References: <20230727-pca9450-reboot-v1-5-c8edb27bf404@skidata.com>
TO: Benjamin Bara <bbara93@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: Robin Gong <yibin.gong@nxp.com>
TO: Jerome Neanne <jneanne@baylibre.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: Benjamin Bara <benjamin.bara@skidata.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/kernel-reboot-distinguish-between-cold-and-warm/20230727-233435
base:   4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
patch link:    https://lore.kernel.org/r/20230727-pca9450-reboot-v1-5-c8edb27bf404%40skidata.com
patch subject: [PATCH 5/6] kernel/reboot: remove generic restart mode
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: csky-randconfig-r006-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280845.PjOBJE7m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280845.PjOBJE7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307280845.PjOBJE7m-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/tps6586x.c: In function 'tps6586x_i2c_probe':
>> drivers/mfd/tps6586x.c:593:23: error: implicit declaration of function 'devm_register_restart_handler'; did you mean 'devm_register_warm_restart_handler'? [-Werror=implicit-function-declaration]
     593 |                 ret = devm_register_restart_handler(&client->dev, &tps6586x_restart_handler,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       devm_register_warm_restart_handler
   cc1: some warnings being treated as errors


vim +593 drivers/mfd/tps6586x.c

e0a3da80c65dc42 Stefan Agner     2013-12-06  520  
ba801bd52f883bd Uwe Kleine-König 2022-11-18  521  static int tps6586x_i2c_probe(struct i2c_client *client)
c6c193326384aec Mike Rapoport    2010-08-11  522  {
334a41ce9b753ec Jingoo Han       2013-07-30  523  	struct tps6586x_platform_data *pdata = dev_get_platdata(&client->dev);
c6c193326384aec Mike Rapoport    2010-08-11  524  	struct tps6586x *tps6586x;
c6c193326384aec Mike Rapoport    2010-08-11  525  	int ret;
e0a3da80c65dc42 Stefan Agner     2013-12-06  526  	int version;
c6c193326384aec Mike Rapoport    2010-08-11  527  
62f6b0879304e21 Thierry Reding   2012-04-26  528  	if (!pdata && client->dev.of_node)
62f6b0879304e21 Thierry Reding   2012-04-26  529  		pdata = tps6586x_parse_dt(client);
62f6b0879304e21 Thierry Reding   2012-04-26  530  
c6c193326384aec Mike Rapoport    2010-08-11  531  	if (!pdata) {
c6c193326384aec Mike Rapoport    2010-08-11  532  		dev_err(&client->dev, "tps6586x requires platform data\n");
c6c193326384aec Mike Rapoport    2010-08-11  533  		return -ENOTSUPP;
c6c193326384aec Mike Rapoport    2010-08-11  534  	}
c6c193326384aec Mike Rapoport    2010-08-11  535  
e0a3da80c65dc42 Stefan Agner     2013-12-06  536  	version = i2c_smbus_read_byte_data(client, TPS6586X_VERSIONCRC);
e0a3da80c65dc42 Stefan Agner     2013-12-06  537  	if (version < 0) {
e0a3da80c65dc42 Stefan Agner     2013-12-06  538  		dev_err(&client->dev, "Chip ID read failed: %d\n", version);
c6c193326384aec Mike Rapoport    2010-08-11  539  		return -EIO;
c6c193326384aec Mike Rapoport    2010-08-11  540  	}
c6c193326384aec Mike Rapoport    2010-08-11  541  
b6719412dc28458 Laxman Dewangan  2012-07-18  542  	tps6586x = devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERNEL);
e0a3da80c65dc42 Stefan Agner     2013-12-06  543  	if (!tps6586x)
c6c193326384aec Mike Rapoport    2010-08-11  544  		return -ENOMEM;
e0a3da80c65dc42 Stefan Agner     2013-12-06  545  
e0a3da80c65dc42 Stefan Agner     2013-12-06  546  	tps6586x->version = version;
e0a3da80c65dc42 Stefan Agner     2013-12-06  547  	tps6586x_print_version(client, tps6586x->version);
c6c193326384aec Mike Rapoport    2010-08-11  548  
c6c193326384aec Mike Rapoport    2010-08-11  549  	tps6586x->client = client;
c6c193326384aec Mike Rapoport    2010-08-11  550  	tps6586x->dev = &client->dev;
c6c193326384aec Mike Rapoport    2010-08-11  551  	i2c_set_clientdata(client, tps6586x);
c6c193326384aec Mike Rapoport    2010-08-11  552  
1176b5be67692e9 Laxman Dewangan  2012-07-18  553  	tps6586x->regmap = devm_regmap_init_i2c(client,
1176b5be67692e9 Laxman Dewangan  2012-07-18  554  					&tps6586x_regmap_config);
1176b5be67692e9 Laxman Dewangan  2012-07-18  555  	if (IS_ERR(tps6586x->regmap)) {
1176b5be67692e9 Laxman Dewangan  2012-07-18  556  		ret = PTR_ERR(tps6586x->regmap);
1176b5be67692e9 Laxman Dewangan  2012-07-18  557  		dev_err(&client->dev, "regmap init failed: %d\n", ret);
1176b5be67692e9 Laxman Dewangan  2012-07-18  558  		return ret;
1176b5be67692e9 Laxman Dewangan  2012-07-18  559  	}
1176b5be67692e9 Laxman Dewangan  2012-07-18  560  
c6c193326384aec Mike Rapoport    2010-08-11  561  
c26448c48448266 Gary King        2010-09-20  562  	if (client->irq) {
c26448c48448266 Gary King        2010-09-20  563  		ret = tps6586x_irq_init(tps6586x, client->irq,
c26448c48448266 Gary King        2010-09-20  564  					pdata->irq_base);
c26448c48448266 Gary King        2010-09-20  565  		if (ret) {
c26448c48448266 Gary King        2010-09-20  566  			dev_err(&client->dev, "IRQ init failed: %d\n", ret);
b6719412dc28458 Laxman Dewangan  2012-07-18  567  			return ret;
c26448c48448266 Gary King        2010-09-20  568  		}
c26448c48448266 Gary King        2010-09-20  569  	}
c26448c48448266 Gary King        2010-09-20  570  
7a7487cb55a263d Laxman Dewangan  2012-07-18  571  	ret = mfd_add_devices(tps6586x->dev, -1,
0848c94fb4a5cc2 Mark Brown       2012-09-11  572  			      tps6586x_cell, ARRAY_SIZE(tps6586x_cell),
5b8b1fe2da98dbc Laxman Dewangan  2012-11-13  573  			      NULL, 0, tps6586x->irq_domain);
7a7487cb55a263d Laxman Dewangan  2012-07-18  574  	if (ret < 0) {
7a7487cb55a263d Laxman Dewangan  2012-07-18  575  		dev_err(&client->dev, "mfd_add_devices failed: %d\n", ret);
7a7487cb55a263d Laxman Dewangan  2012-07-18  576  		goto err_mfd_add;
6f9f13bf9b9fabf Vincent Palatin  2011-01-31  577  	}
6f9f13bf9b9fabf Vincent Palatin  2011-01-31  578  
c6c193326384aec Mike Rapoport    2010-08-11  579  	ret = tps6586x_add_subdevs(tps6586x, pdata);
c6c193326384aec Mike Rapoport    2010-08-11  580  	if (ret) {
c6c193326384aec Mike Rapoport    2010-08-11  581  		dev_err(&client->dev, "add devices failed: %d\n", ret);
c6c193326384aec Mike Rapoport    2010-08-11  582  		goto err_add_devs;
c6c193326384aec Mike Rapoport    2010-08-11  583  	}
c6c193326384aec Mike Rapoport    2010-08-11  584  
6c0b78171adf2ba Benjamin Bara    2023-07-15  585  	if (pdata->pm_off) {
6c0b78171adf2ba Benjamin Bara    2023-07-15  586  		ret = devm_register_power_off_handler(&client->dev, &tps6586x_power_off_handler,
6c0b78171adf2ba Benjamin Bara    2023-07-15  587  						      NULL);
6c0b78171adf2ba Benjamin Bara    2023-07-15  588  		if (ret) {
6c0b78171adf2ba Benjamin Bara    2023-07-15  589  			dev_err(&client->dev, "register power off handler failed: %d\n", ret);
6c0b78171adf2ba Benjamin Bara    2023-07-15  590  			goto err_add_devs;
6c0b78171adf2ba Benjamin Bara    2023-07-15  591  		}
88e326f23480c40 Benjamin Bara    2023-07-15  592  
88e326f23480c40 Benjamin Bara    2023-07-15 @593  		ret = devm_register_restart_handler(&client->dev, &tps6586x_restart_handler,
88e326f23480c40 Benjamin Bara    2023-07-15  594  						    NULL);
88e326f23480c40 Benjamin Bara    2023-07-15  595  		if (ret) {
88e326f23480c40 Benjamin Bara    2023-07-15  596  			dev_err(&client->dev, "register restart handler failed: %d\n", ret);
88e326f23480c40 Benjamin Bara    2023-07-15  597  			goto err_add_devs;
88e326f23480c40 Benjamin Bara    2023-07-15  598  		}
004c15a68076f5b Bill Huang       2012-08-19  599  	}
004c15a68076f5b Bill Huang       2012-08-19  600  
c6c193326384aec Mike Rapoport    2010-08-11  601  	return 0;
c6c193326384aec Mike Rapoport    2010-08-11  602  
c6c193326384aec Mike Rapoport    2010-08-11  603  err_add_devs:
7a7487cb55a263d Laxman Dewangan  2012-07-18  604  	mfd_remove_devices(tps6586x->dev);
7a7487cb55a263d Laxman Dewangan  2012-07-18  605  err_mfd_add:
c26448c48448266 Gary King        2010-09-20  606  	if (client->irq)
c26448c48448266 Gary King        2010-09-20  607  		free_irq(client->irq, tps6586x);
c6c193326384aec Mike Rapoport    2010-08-11  608  	return ret;
c6c193326384aec Mike Rapoport    2010-08-11  609  }
c6c193326384aec Mike Rapoport    2010-08-11  610  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
