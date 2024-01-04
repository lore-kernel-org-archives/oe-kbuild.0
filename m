Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFB121359
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAnGsPHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704369364; x=1735905364;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6XF3rUOfsrGLWd3NcFfeKwJVE4RiKG6vxGD0g6vrczg=;
  b=GAnGsPHMQfoYF3rrPNUyXFhchHIwho1a2flrsg6gYGdojlQFkivUZbBk
   YvONX6sOydUJmr3/U6Iu4iOFA9BilMC5nt59a2am7yhKhScbRm0biDFz/
   ObHNey8CY7Dr6DlcaOnPHGbIzxCtIX2ASaTii4/iVQqZ50ei3QqZSOWO4
   rVF9wOYrMI0n/+e3rzYAYjRigQ8AWHXhzIcA9hFWutVGjJgSYTjAevMuC
   EQIEoUJAWE40lXoCcubHmafka8XVANWWtHwb/b8S9cLAd+kP5WWnckc/f
   lUADq7ig1ssfrh5tipaoBTstDLxHGEN+ZiPPOTC4PAJfvvqXoon+FZtxC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="387674619"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="387674619"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 03:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="850777622"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="850777622"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2024 03:56:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLMKN-000NGG-2u;
	Thu, 04 Jan 2024 11:55:59 +0000
Date: Thu, 4 Jan 2024 19:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/leds/leds-pca955x.c:588:43: warning: '%d' directive output
 may be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <202401041926.6liGuHyq-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/leds/leds-pca955x.c:588:43: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac865f00af293d081356bec56eea90815094a60e
commit: 3f301dc292eb122eff61b8b2906e519154b0327f LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r035-20230529 (https://download.01.org/0day-ci/archive/20240104/202401041926.6liGuHyq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240104/202401041926.6liGuHyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401041926.6liGuHyq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-pca955x.c: In function 'pca955x_probe':
>> drivers/leds/leds-pca955x.c:588:43: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
     588 |                                          "%d", i);
         |                                           ^~
   drivers/leds/leds-pca955x.c:588:42: note: directive argument in the range [-2147483644, 2147483646]
     588 |                                          "%d", i);
         |                                          ^~~~
   drivers/leds/leds-pca955x.c:587:33: note: 'snprintf' output between 2 and 12 bytes into a destination of size 8
     587 |                                 snprintf(default_label, sizeof(default_label),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     588 |                                          "%d", i);
         |                                          ~~~~~~~~
--
   drivers/mfd/omap-usb-host.c: In function 'usbhs_omap_probe':
>> drivers/mfd/omap-usb-host.c:708:54: warning: '_clk' directive output may be truncated writing 4 bytes into a region of size between 1 and 11 [-Wformat-truncation=]
     708 |                                 "usb_host_hs_utmi_p%d_clk", i + 1);
         |                                                      ^~~~
   drivers/mfd/omap-usb-host.c:707:17: note: 'snprintf' output between 24 and 34 bytes into a destination of size 30
     707 |                 snprintf(clkname, sizeof(clkname),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     708 |                                 "usb_host_hs_utmi_p%d_clk", i + 1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/omap-usb-host.c:723:56: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
     723 |                                 "usb_host_hs_hsic480m_p%d_clk", i + 1);
         |                                                        ^~
   drivers/mfd/omap-usb-host.c:723:33: note: directive argument in the range [-2147483642, 2147483647]
     723 |                                 "usb_host_hs_hsic480m_p%d_clk", i + 1);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/omap-usb-host.c:722:17: note: 'snprintf' output between 28 and 38 bytes into a destination of size 30
     722 |                 snprintf(clkname, sizeof(clkname),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     723 |                                 "usb_host_hs_hsic480m_p%d_clk", i + 1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/omap-usb-host.c:733:55: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 9 [-Wformat-truncation=]
     733 |                                 "usb_host_hs_hsic60m_p%d_clk", i + 1);
         |                                                       ^~
   drivers/mfd/omap-usb-host.c:733:33: note: directive argument in the range [-2147483642, 2147483647]
     733 |                                 "usb_host_hs_hsic60m_p%d_clk", i + 1);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/omap-usb-host.c:732:17: note: 'snprintf' output between 27 and 37 bytes into a destination of size 30
     732 |                 snprintf(clkname, sizeof(clkname),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     733 |                                 "usb_host_hs_hsic60m_p%d_clk", i + 1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/usb/core/usb.c: In function 'usb_alloc_dev':
>> drivers/usb/core/usb.c:715:37: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     715 |                                 "%s.%d", parent->devpath, port1);
         |                                     ^~
   drivers/usb/core/usb.c:715:33: note: using the range [-2147483648, 2147483647] for directive argument
     715 |                                 "%s.%d", parent->devpath, port1);
         |                                 ^~~~~~~
   drivers/usb/core/usb.c:714:25: note: 'snprintf' output between 3 and 28 bytes into a destination of size 16
     714 |                         snprintf(dev->devpath, sizeof dev->devpath,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     715 |                                 "%s.%d", parent->devpath, port1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/usb/core/hcd.c: In function 'rh_call_control':
>> drivers/usb/core/hcd.c:464:48: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Wformat-truncation=]
     464 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
         |                                                ^~
     465 |                         init_utsname()->release, hcd->driver->description);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~ 
   In function 'rh_string',
       inlined from 'rh_call_control' at drivers/usb/core/hcd.c:622:26:
   drivers/usb/core/hcd.c:464:17: note: 'snprintf' output 3 or more bytes (assuming 131) into a destination of size 100
     464 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     465 |                         init_utsname()->release, hcd->driver->description);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/misc/bcm-vk/bcm_vk_dev.c: In function 'bcm_vk_probe':
>> <command-line>: warning: '_ttyVK' directive output may be truncated writing 6 bytes into a region of size between 3 and 12 [-Wformat-truncation=]
   drivers/misc/bcm-vk/bcm_vk_dev.c:1456:38: note: in expansion of macro 'KBUILD_MODNAME'
    1456 |         snprintf(name, sizeof(name), KBUILD_MODNAME ".%d_ttyVK", id);
         |                                      ^~~~~~~~~~~~~~
   drivers/misc/bcm-vk/bcm_vk_dev.c:1456:9: note: 'snprintf' output between 15 and 24 bytes into a destination of size 20
    1456 |         snprintf(name, sizeof(name), KBUILD_MODNAME ".%d_ttyVK", id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/input/misc/ims-pcu.c: In function 'ims_pcu_get_device_info':
>> drivers/input/misc/ims-pcu.c:1803:31: warning: '%02d' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 4 [-Wformat-truncation=]
    1803 |                  "%02d%02d%02d%02d.%c%c",
         |                               ^~~~
   drivers/input/misc/ims-pcu.c:1803:18: note: directive argument in the range [0, 255]
    1803 |                  "%02d%02d%02d%02d.%c%c",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ims-pcu.c:1802:9: note: 'snprintf' output between 12 and 16 bytes into a destination of size 10
    1802 |         snprintf(pcu->fw_version, sizeof(pcu->fw_version),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1803 |                  "%02d%02d%02d%02d.%c%c",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~
    1804 |                  pcu->cmd_buf[2], pcu->cmd_buf[3], pcu->cmd_buf[4], pcu->cmd_buf[5],
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1805 |                  pcu->cmd_buf[6], pcu->cmd_buf[7]);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ims-pcu.c:1815:31: warning: '%02d' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 4 [-Wformat-truncation=]
    1815 |                  "%02d%02d%02d%02d.%c%c",
         |                               ^~~~
   drivers/input/misc/ims-pcu.c:1815:18: note: directive argument in the range [0, 255]
    1815 |                  "%02d%02d%02d%02d.%c%c",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/ims-pcu.c:1814:9: note: 'snprintf' output between 12 and 16 bytes into a destination of size 10
    1814 |         snprintf(pcu->bl_version, sizeof(pcu->bl_version),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1815 |                  "%02d%02d%02d%02d.%c%c",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~
    1816 |                  pcu->cmd_buf[2], pcu->cmd_buf[3], pcu->cmd_buf[4], pcu->cmd_buf[5],
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1817 |                  pcu->cmd_buf[6], pcu->cmd_buf[7]);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c: In function 'gfx_v11_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:500:54: warning: '_pfp.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     500 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:500:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     500 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:517:54: warning: '_me.bin' directive output may be truncated writing 7 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     517 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |                                                      ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:517:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 40
     517 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:530:62: warning: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     530 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:530:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     530 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:542:54: warning: '_mec.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     542 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:542:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     542 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +588 drivers/leds/leds-pca955x.c

ed1f4b9676a8eb Cédric Le Goater 2017-08-08  469  
239f32b4f161c1 Eddie James      2021-07-16  470  static int pca955x_probe(struct i2c_client *client)
f46e9203d9a100 Nate Case        2008-07-16  471  {
e7e11d8ba807d4 Alexander Stein  2012-05-29  472  	struct pca955x *pca955x;
e7e11d8ba807d4 Alexander Stein  2012-05-29  473  	struct pca955x_led *pca955x_led;
f46e9203d9a100 Nate Case        2008-07-16  474  	struct pca955x_chipdef *chip;
2420ae02ce0a92 Eddie James      2021-07-16  475  	struct led_classdev *led;
7c4815929276b2 Eddie James      2021-07-16  476  	struct led_init_data init_data;
f46e9203d9a100 Nate Case        2008-07-16  477  	struct i2c_adapter *adapter;
95bf14bff58fd2 Sven Wegener     2008-10-03  478  	int i, err;
ed1f4b9676a8eb Cédric Le Goater 2017-08-08  479  	struct pca955x_platform_data *pdata;
7c4815929276b2 Eddie James      2021-07-16  480  	bool set_default_label = false;
e46cb6d0c760a5 Eddie James      2021-07-16  481  	bool keep_pwm = false;
7c4815929276b2 Eddie James      2021-07-16  482  	char default_label[8];
239f32b4f161c1 Eddie James      2021-07-16  483  	enum pca955x_type chip_type;
239f32b4f161c1 Eddie James      2021-07-16  484  	const void *md = device_get_match_data(&client->dev);
f46e9203d9a100 Nate Case        2008-07-16  485  
239f32b4f161c1 Eddie James      2021-07-16  486  	if (md) {
239f32b4f161c1 Eddie James      2021-07-16  487  		chip_type = (enum pca955x_type)md;
239f32b4f161c1 Eddie James      2021-07-16  488  	} else {
239f32b4f161c1 Eddie James      2021-07-16  489  		const struct i2c_device_id *id = i2c_match_id(pca955x_id,
239f32b4f161c1 Eddie James      2021-07-16  490  							      client);
239f32b4f161c1 Eddie James      2021-07-16  491  
239f32b4f161c1 Eddie James      2021-07-16  492  		if (id) {
239f32b4f161c1 Eddie James      2021-07-16  493  			chip_type = (enum pca955x_type)id->driver_data;
239f32b4f161c1 Eddie James      2021-07-16  494  		} else {
239f32b4f161c1 Eddie James      2021-07-16  495  			dev_err(&client->dev, "unknown chip\n");
239f32b4f161c1 Eddie James      2021-07-16  496  			return -ENODEV;
239f32b4f161c1 Eddie James      2021-07-16  497  		}
239f32b4f161c1 Eddie James      2021-07-16  498  	}
239f32b4f161c1 Eddie James      2021-07-16  499  
239f32b4f161c1 Eddie James      2021-07-16  500  	chip = &pca955x_chipdefs[chip_type];
1c57d9bd29f639 Wolfram Sang     2019-06-08  501  	adapter = client->adapter;
87aae1ea82f93f Jingoo Han       2013-07-30  502  	pdata = dev_get_platdata(&client->dev);
ed1f4b9676a8eb Cédric Le Goater 2017-08-08  503  	if (!pdata) {
967f69de81478c Andy Shevchenko  2019-03-25  504  		pdata =	pca955x_get_pdata(client, chip);
ed1f4b9676a8eb Cédric Le Goater 2017-08-08  505  		if (IS_ERR(pdata))
ed1f4b9676a8eb Cédric Le Goater 2017-08-08  506  			return PTR_ERR(pdata);
ed1f4b9676a8eb Cédric Le Goater 2017-08-08  507  	}
f46e9203d9a100 Nate Case        2008-07-16  508  
f46e9203d9a100 Nate Case        2008-07-16  509  	/* Make sure the slave address / chip type combo given is possible */
f46e9203d9a100 Nate Case        2008-07-16  510  	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
f46e9203d9a100 Nate Case        2008-07-16  511  	    chip->slv_addr) {
f46e9203d9a100 Nate Case        2008-07-16  512  		dev_err(&client->dev, "invalid slave address %02x\n",
f46e9203d9a100 Nate Case        2008-07-16  513  			client->addr);
f46e9203d9a100 Nate Case        2008-07-16  514  		return -ENODEV;
f46e9203d9a100 Nate Case        2008-07-16  515  	}
f46e9203d9a100 Nate Case        2008-07-16  516  
b40b0c17d7fa59 Sachin Kamat     2012-11-25  517  	dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
2420ae02ce0a92 Eddie James      2021-07-16  518  		 "slave address 0x%02x\n", client->name, chip->bits,
2420ae02ce0a92 Eddie James      2021-07-16  519  		 client->addr);
f46e9203d9a100 Nate Case        2008-07-16  520  
aace34c0bb8ea3 Tin Huynh        2017-05-22  521  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
f46e9203d9a100 Nate Case        2008-07-16  522  		return -EIO;
f46e9203d9a100 Nate Case        2008-07-16  523  
f46e9203d9a100 Nate Case        2008-07-16  524  	if (pdata->num_leds != chip->bits) {
ed1f4b9676a8eb Cédric Le Goater 2017-08-08  525  		dev_err(&client->dev,
ed1f4b9676a8eb Cédric Le Goater 2017-08-08  526  			"board info claims %d LEDs on a %d-bit chip\n",
f46e9203d9a100 Nate Case        2008-07-16  527  			pdata->num_leds, chip->bits);
f46e9203d9a100 Nate Case        2008-07-16  528  		return -ENODEV;
f46e9203d9a100 Nate Case        2008-07-16  529  	}
f46e9203d9a100 Nate Case        2008-07-16  530  
73759f6ab3620d Bryan Wu         2012-07-04  531  	pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
95bf14bff58fd2 Sven Wegener     2008-10-03  532  	if (!pca955x)
95bf14bff58fd2 Sven Wegener     2008-10-03  533  		return -ENOMEM;
95bf14bff58fd2 Sven Wegener     2008-10-03  534  
2420ae02ce0a92 Eddie James      2021-07-16  535  	pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
2420ae02ce0a92 Eddie James      2021-07-16  536  				     sizeof(*pca955x_led), GFP_KERNEL);
73759f6ab3620d Bryan Wu         2012-07-04  537  	if (!pca955x->leds)
73759f6ab3620d Bryan Wu         2012-07-04  538  		return -ENOMEM;
e7e11d8ba807d4 Alexander Stein  2012-05-29  539  
95bf14bff58fd2 Sven Wegener     2008-10-03  540  	i2c_set_clientdata(client, pca955x);
95bf14bff58fd2 Sven Wegener     2008-10-03  541  
e7e11d8ba807d4 Alexander Stein  2012-05-29  542  	mutex_init(&pca955x->lock);
e7e11d8ba807d4 Alexander Stein  2012-05-29  543  	pca955x->client = client;
e7e11d8ba807d4 Alexander Stein  2012-05-29  544  	pca955x->chipdef = chip;
e7e11d8ba807d4 Alexander Stein  2012-05-29  545  
7c4815929276b2 Eddie James      2021-07-16  546  	init_data.devname_mandatory = false;
7c4815929276b2 Eddie James      2021-07-16  547  	init_data.devicename = "pca955x";
7c4815929276b2 Eddie James      2021-07-16  548  
f46e9203d9a100 Nate Case        2008-07-16  549  	for (i = 0; i < chip->bits; i++) {
e7e11d8ba807d4 Alexander Stein  2012-05-29  550  		pca955x_led = &pca955x->leds[i];
e7e11d8ba807d4 Alexander Stein  2012-05-29  551  		pca955x_led->led_num = i;
e7e11d8ba807d4 Alexander Stein  2012-05-29  552  		pca955x_led->pca955x = pca955x;
561099a1a2e992 Cédric Le Goater 2017-08-08  553  		pca955x_led->type = pdata->leds[i].type;
f46e9203d9a100 Nate Case        2008-07-16  554  
561099a1a2e992 Cédric Le Goater 2017-08-08  555  		switch (pca955x_led->type) {
561099a1a2e992 Cédric Le Goater 2017-08-08  556  		case PCA955X_TYPE_NONE:
561099a1a2e992 Cédric Le Goater 2017-08-08  557  		case PCA955X_TYPE_GPIO:
561099a1a2e992 Cédric Le Goater 2017-08-08  558  			break;
561099a1a2e992 Cédric Le Goater 2017-08-08  559  		case PCA955X_TYPE_LED:
2420ae02ce0a92 Eddie James      2021-07-16  560  			led = &pca955x_led->led_cdev;
2420ae02ce0a92 Eddie James      2021-07-16  561  			led->brightness_set_blocking = pca955x_led_set;
7086625fde6538 Eddie James      2021-07-16  562  			led->brightness_get = pca955x_led_get;
f46e9203d9a100 Nate Case        2008-07-16  563  
0dd37b1cf51e56 Andy Shevchenko  2023-01-03  564  			if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF) {
e46cb6d0c760a5 Eddie James      2021-07-16  565  				err = pca955x_led_set(led, LED_OFF);
91940bb4ca7b7f Cédric Le Goater 2017-08-08  566  				if (err)
91940bb4ca7b7f Cédric Le Goater 2017-08-08  567  					return err;
0dd37b1cf51e56 Andy Shevchenko  2023-01-03  568  			} else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON) {
e46cb6d0c760a5 Eddie James      2021-07-16  569  				err = pca955x_led_set(led, LED_FULL);
e46cb6d0c760a5 Eddie James      2021-07-16  570  				if (err)
e46cb6d0c760a5 Eddie James      2021-07-16  571  					return err;
e46cb6d0c760a5 Eddie James      2021-07-16  572  			}
f46e9203d9a100 Nate Case        2008-07-16  573  
7c4815929276b2 Eddie James      2021-07-16  574  			init_data.fwnode = pdata->leds[i].fwnode;
7c4815929276b2 Eddie James      2021-07-16  575  
7c4815929276b2 Eddie James      2021-07-16  576  			if (is_of_node(init_data.fwnode)) {
7c4815929276b2 Eddie James      2021-07-16  577  				if (to_of_node(init_data.fwnode)->name[0] ==
7c4815929276b2 Eddie James      2021-07-16  578  				    '\0')
7c4815929276b2 Eddie James      2021-07-16  579  					set_default_label = true;
7c4815929276b2 Eddie James      2021-07-16  580  				else
7c4815929276b2 Eddie James      2021-07-16  581  					set_default_label = false;
7c4815929276b2 Eddie James      2021-07-16  582  			} else {
7c4815929276b2 Eddie James      2021-07-16  583  				set_default_label = true;
7c4815929276b2 Eddie James      2021-07-16  584  			}
7c4815929276b2 Eddie James      2021-07-16  585  
7c4815929276b2 Eddie James      2021-07-16  586  			if (set_default_label) {
7c4815929276b2 Eddie James      2021-07-16  587  				snprintf(default_label, sizeof(default_label),
7c4815929276b2 Eddie James      2021-07-16 @588  					 "%d", i);
7c4815929276b2 Eddie James      2021-07-16  589  				init_data.default_label = default_label;
7c4815929276b2 Eddie James      2021-07-16  590  			} else {
7c4815929276b2 Eddie James      2021-07-16  591  				init_data.default_label = NULL;
7c4815929276b2 Eddie James      2021-07-16  592  			}
7c4815929276b2 Eddie James      2021-07-16  593  
7c4815929276b2 Eddie James      2021-07-16  594  			err = devm_led_classdev_register_ext(&client->dev, led,
7c4815929276b2 Eddie James      2021-07-16  595  							     &init_data);
1591caf2d5eafd Cédric Le Goater 2017-08-30  596  			if (err)
1591caf2d5eafd Cédric Le Goater 2017-08-30  597  				return err;
e46cb6d0c760a5 Eddie James      2021-07-16  598  
ca386253ff6fb8 Andrew Jeffery   2021-09-21  599  			set_bit(i, &pca955x->active_pins);
ca386253ff6fb8 Andrew Jeffery   2021-09-21  600  
e46cb6d0c760a5 Eddie James      2021-07-16  601  			/*
e46cb6d0c760a5 Eddie James      2021-07-16  602  			 * For default-state == "keep", let the core update the
e46cb6d0c760a5 Eddie James      2021-07-16  603  			 * brightness from the hardware, then check the
e46cb6d0c760a5 Eddie James      2021-07-16  604  			 * brightness to see if it's using PWM1. If so, PWM1
e46cb6d0c760a5 Eddie James      2021-07-16  605  			 * should not be written below.
e46cb6d0c760a5 Eddie James      2021-07-16  606  			 */
0dd37b1cf51e56 Andy Shevchenko  2023-01-03  607  			if (pdata->leds[i].default_state == LEDS_DEFSTATE_KEEP) {
e46cb6d0c760a5 Eddie James      2021-07-16  608  				if (led->brightness != LED_FULL &&
e46cb6d0c760a5 Eddie James      2021-07-16  609  				    led->brightness != LED_OFF &&
e46cb6d0c760a5 Eddie James      2021-07-16  610  				    led->brightness != LED_HALF)
e46cb6d0c760a5 Eddie James      2021-07-16  611  					keep_pwm = true;
e46cb6d0c760a5 Eddie James      2021-07-16  612  			}
561099a1a2e992 Cédric Le Goater 2017-08-08  613  		}
561099a1a2e992 Cédric Le Goater 2017-08-08  614  	}
f46e9203d9a100 Nate Case        2008-07-16  615  
f46e9203d9a100 Nate Case        2008-07-16  616  	/* PWM0 is used for half brightness or 50% duty cycle */
1591caf2d5eafd Cédric Le Goater 2017-08-30  617  	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
1591caf2d5eafd Cédric Le Goater 2017-08-30  618  	if (err)
1591caf2d5eafd Cédric Le Goater 2017-08-30  619  		return err;
f46e9203d9a100 Nate Case        2008-07-16  620  
e46cb6d0c760a5 Eddie James      2021-07-16  621  	if (!keep_pwm) {
f46e9203d9a100 Nate Case        2008-07-16  622  		/* PWM1 is used for variable brightness, default to OFF */
1591caf2d5eafd Cédric Le Goater 2017-08-30  623  		err = pca955x_write_pwm(client, 1, 0);
1591caf2d5eafd Cédric Le Goater 2017-08-30  624  		if (err)
1591caf2d5eafd Cédric Le Goater 2017-08-30  625  			return err;
e46cb6d0c760a5 Eddie James      2021-07-16  626  	}
f46e9203d9a100 Nate Case        2008-07-16  627  
f46e9203d9a100 Nate Case        2008-07-16  628  	/* Set to fast frequency so we do not see flashing */
1591caf2d5eafd Cédric Le Goater 2017-08-30  629  	err = pca955x_write_psc(client, 0, 0);
1591caf2d5eafd Cédric Le Goater 2017-08-30  630  	if (err)
1591caf2d5eafd Cédric Le Goater 2017-08-30  631  		return err;
1591caf2d5eafd Cédric Le Goater 2017-08-30  632  	err = pca955x_write_psc(client, 1, 0);
1591caf2d5eafd Cédric Le Goater 2017-08-30  633  	if (err)
1591caf2d5eafd Cédric Le Goater 2017-08-30  634  		return err;
f46e9203d9a100 Nate Case        2008-07-16  635  

:::::: The code at line 588 was first introduced by commit
:::::: 7c4815929276b2e223eb6f2e49afe5071d4294a5 leds: pca955x: Let the core process the fwnode

:::::: TO: Eddie James <eajames@linux.ibm.com>
:::::: CC: Pavel Machek <pavel@ucw.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
