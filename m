Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317415CB
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681051414; x=1712587414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZdIAQ8im8wbFiRI6s7G4JsCZitZRnMNxl43GNq1/p4=;
  b=bkq/ZuPiDs2UqvcdCtHhP+S6K8SzLrzNdDCxhcaNKaf+ww3avjMz21kC
   hkuqs5xI/hdNIvFcOMQWEISCsC6N1i0icjv7mTv7ve0P7BjBIhRYBqnIg
   nAMwgSWn61m6ibw1OBgOLUMjiktPJPOps7fypkitV9O7A+tRaOY0DiNpt
   0wtFmDwYC/kyaNgF/NwWr5yoGXPWpFzkNjDb4z/kwd6i+iW3kGUOGbv+Q
   YwvslV5KzcXigCqOXWkPPNt5RhS0lUF6cpSulP9Nu39NHpiX8f21xr4vF
   DKiuhPQ02Sp3XhkFeju0bglNX3Xsf2lMSTfn95mfMN0RT97UV2fS8v4HF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="429509908"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="429509908"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 07:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="688022529"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="688022529"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Apr 2023 07:43:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plWGR-000UYv-2e;
	Sun, 09 Apr 2023 14:43:31 +0000
Date: Sun, 9 Apr 2023 22:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-5.10.y-cicd 16224/22735]
 drivers/i2c/i2c-core-base.c:952 i2c_new_client_device() warn: passing zero
 to 'ERR_PTR'
Message-ID: <202304092208.xMt25SVl-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   e6bb059e69c106b73bfe2a10e729dbe5a5820916
commit: c0310e2d8c4fd7df44bc194a295314dd104df623 [16224/22735] i2c: core: let adapters be notified of client attach/detach
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230409/202304092208.xMt25SVl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304092208.xMt25SVl-lkp@intel.com/

smatch warnings:
drivers/i2c/i2c-core-base.c:952 i2c_new_client_device() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +952 drivers/i2c/i2c-core-base.c

4124c4eba40256 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-03-01  854  
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  855  /**
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  856   * i2c_new_client_device - instantiate an i2c device
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  857   * @adap: the adapter managing the device
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  858   * @info: describes one I2C device; bus_num is ignored
d64f73be1b59b9 drivers/i2c/i2c-core.c      David Brownell    2007-07-12  859   * Context: can sleep
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  860   *
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  861   * Create an i2c device. Binding is handled through driver model
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  862   * probe()/remove() methods.  A driver may be bound to this device when we
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  863   * return from this function, or any later moment (e.g. maybe hotplugging will
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  864   * load the driver module).  This call is not appropriate for use by mainboard
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  865   * initialization logic, which usually runs during an arch_initcall() long
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  866   * before any i2c_adapter could exist.
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  867   *
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  868   * This returns the new i2c client, which may be saved for later use with
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  869   * i2c_unregister_device(); or an ERR_PTR to describe the error.
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  870   */
550113d4e9f5c7 drivers/i2c/i2c-core-base.c Wolfram Sang      2019-06-24  871  struct i2c_client *
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  872  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  873  {
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  874  	struct i2c_client	*client;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  875  	int			status;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  876  
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  877  	client = kzalloc(sizeof *client, GFP_KERNEL);
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  878  	if (!client)
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  879  		return ERR_PTR(-ENOMEM);
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  880  
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  881  	client->adapter = adap;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  882  
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  883  	client->dev.platform_data = info->platform_data;
ee35425c8eb115 drivers/i2c/i2c-core.c      Marc Pignat       2008-08-28  884  	client->flags = info->flags;
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  885  	client->addr = info->addr;
4124c4eba40256 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-03-01  886  
93b6604c5a669d drivers/i2c/i2c-core-base.c Jim Broadus       2019-02-19  887  	client->init_irq = info->irq;
93b6604c5a669d drivers/i2c/i2c-core-base.c Jim Broadus       2019-02-19  888  	if (!client->init_irq)
93b6604c5a669d drivers/i2c/i2c-core-base.c Jim Broadus       2019-02-19  889  		client->init_irq = i2c_dev_irq_from_resources(info->resources,
4124c4eba40256 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-03-01  890  							 info->num_resources);
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  891  
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  892  	strlcpy(client->name, info->type, sizeof(client->name));
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  893  
c4019b7040eaf8 drivers/i2c/i2c-core.c      Wolfram Sang      2015-07-17  894  	status = i2c_check_addr_validity(client->addr, client->flags);
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  895  	if (status) {
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  896  		dev_err(&adap->dev, "Invalid %d-bit I2C address 0x%02hx\n",
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  897  			client->flags & I2C_CLIENT_TEN ? 10 : 7, client->addr);
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  898  		goto out_err_silent;
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  899  	}
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  900  
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  901  	/* Check for address business */
9bccc70a127cfe drivers/i2c/i2c-core.c      Wolfram Sang      2015-07-17  902  	status = i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  903  	if (status)
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  904  		goto out_err;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  905  
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  906  	client->dev.parent = &client->adapter->dev;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  907  	client->dev.bus = &i2c_bus_type;
51298d1257b9f0 drivers/i2c/i2c-core.c      Jean Delvare      2009-09-18  908  	client->dev.type = &i2c_client_type;
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  909  	client->dev.of_node = of_node_get(info->of_node);
ce793486e23e01 drivers/i2c/i2c-core.c      Rafael J. Wysocki 2015-03-16  910  	client->dev.fwnode = info->fwnode;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  911  
728fe6cef27444 drivers/i2c/i2c-core-base.c Hans de Goede     2017-10-11  912  	i2c_dev_set_name(adap, client, info);
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  913  
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  914  	if (info->properties) {
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  915  		status = device_add_properties(&client->dev, info->properties);
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  916  		if (status) {
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  917  			dev_err(&adap->dev,
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  918  				"Failed to add properties to client %s: %d\n",
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  919  				client->name, status);
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  920  			goto out_err_put_of_node;
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  921  		}
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  922  	}
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  923  
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  924  	if (adap->attach_ops &&
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  925  	    adap->attach_ops->attach_client &&
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  926  	    adap->attach_ops->attach_client(adap, info, client) != 0)
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  927  		goto out_free_props;
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  928  
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  929  	status = device_register(&client->dev);
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  930  	if (status)
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  931  		goto out_detach_client;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  932  
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  933  	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  934  		client->name, dev_name(&client->dev));
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  935  
9c1600eda42e52 drivers/i2c/i2c-core.c      David Brownell    2007-05-01  936  	return client;
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  937  
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  938  out_detach_client:
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  939  	if (adap->attach_ops && adap->attach_ops->detach_client)
c0310e2d8c4fd7 drivers/i2c/i2c-core-base.c Luca Ceresoli     2022-04-13  940  		adap->attach_ops->detach_client(adap, client);
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  941  out_free_props:
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  942  	if (info->properties)
d3e1b617ae20c4 drivers/i2c/i2c-core.c      Dmitry Torokhov   2017-02-02  943  		device_remove_properties(&client->dev);
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  944  out_err_put_of_node:
04782265641839 drivers/i2c/i2c-core-base.c Boris Brezillon   2018-03-25  945  	of_node_put(info->of_node);
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  946  out_err:
b93d3d37392467 drivers/i2c/i2c-core.c      Andy Shevchenko   2016-08-25  947  	dev_err(&adap->dev,
b93d3d37392467 drivers/i2c/i2c-core.c      Andy Shevchenko   2016-08-25  948  		"Failed to register i2c client %s at 0x%02x (%d)\n",
b93d3d37392467 drivers/i2c/i2c-core.c      Andy Shevchenko   2016-08-25  949  		client->name, client->addr, status);
3a89db5f305766 drivers/i2c/i2c-core.c      Jean Delvare      2010-06-03  950  out_err_silent:
f8a227e8ac19c2 drivers/i2c/i2c-core.c      Jean Delvare      2009-06-19  951  	kfree(client);
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16 @952  	return ERR_PTR(status);
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  953  }
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  954  EXPORT_SYMBOL_GPL(i2c_new_client_device);
7159dbdae3c58d drivers/i2c/i2c-core-base.c Heiner Kallweit   2019-05-16  955  

:::::: The code at line 952 was first introduced by commit
:::::: 7159dbdae3c58d0200ae2550fab977a19a3c497a i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy

:::::: TO: Heiner Kallweit <hkallweit1@gmail.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
