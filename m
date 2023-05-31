Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4017736
	for <oe-kbuild@lists.linux.dev>; Wed, 31 May 2023 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685553030; x=1717089030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrcGZjqnUb9Os1zikLLeseKfIAW0c+3LjXSnv7oz5wI=;
  b=WtQ5blizU1r4RkYXsKnNNW6ApnnajBtoyJb5K7utnkS8kqkMv+ScrY/n
   OTS4gvnMe7nrXFlb7YgUgZQGYxSuA68UX179PwBLLhw8f3HrAX/45OtO+
   L1O64Lgznu8n0y3NAG49ejIqKYX4f3n1DGxESuRjb1TvewKlyygfD9yp/
   YIj/fU5Rr2n0drM89aQlQFA5d2XAUcAYyOygIlHBKwAxiQGNpVgUGprV+
   y0dVasKhTp1as2wDBp1NRFfsTcaGXIfuXND43VTQwP9KgCoKRYOn631yk
   CTDfCvmaego2jTIuz1QhXV7t1GUclfrOIu6yBPmxCs+7OclEyK7Ti+ACk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354148042"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="354148042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 10:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796798707"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="796798707"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2023 10:07:34 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4PIL-0001VG-2D;
	Wed, 31 May 2023 17:07:33 +0000
Date: Thu, 1 Jun 2023 01:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/phy/renesas/phy-rcar-gen3-usb2.c:747
 rcar_gen3_phy_usb2_probe() warn: missing error code 'ret'
Message-ID: <202306010128.L7WA8rEH-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Guo Ren <guoren@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48b1320a674e1ff5de2fad8606bee38f724594dc
commit: 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1 riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
date:   7 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-m031-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010128.L7WA8rEH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306010128.L7WA8rEH-lkp@intel.com/

smatch warnings:
drivers/phy/renesas/phy-rcar-gen3-usb2.c:747 rcar_gen3_phy_usb2_probe() warn: missing error code 'ret'

vim +/ret +747 drivers/phy/renesas/phy-rcar-gen3-usb2.c

549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  651  
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  652  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  653  {
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  654  	const struct rcar_gen3_phy_drv_data *phy_data;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  655  	struct device *dev = &pdev->dev;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  656  	struct rcar_gen3_chan *channel;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  657  	struct phy_provider *provider;
08b0ad375ca6618 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2020-07-17  658  	int ret = 0, i;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  659  
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  660  	if (!dev->of_node) {
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  661  		dev_err(dev, "This driver needs device tree\n");
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  662  		return -EINVAL;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  663  	}
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  664  
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  665  	channel = devm_kzalloc(dev, sizeof(*channel), GFP_KERNEL);
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  666  	if (!channel)
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  667  		return -ENOMEM;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  668  
0b5604affbec024 drivers/phy/renesas/phy-rcar-gen3-usb2.c Chunfeng Yun      2020-11-06  669  	channel->base = devm_platform_ioremap_resource(pdev, 0);
801a69c787812f9 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  670  	if (IS_ERR(channel->base))
801a69c787812f9 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  671  		return PTR_ERR(channel->base);
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  672  
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  673  	channel->obint_enable_bits = USB2_OBINT_BITS;
08b0ad375ca6618 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2020-07-17  674  	/* get irq number here and request_irq for OTG in phy_init */
08b0ad375ca6618 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2020-07-17  675  	channel->irq = platform_get_irq_optional(pdev, 0);
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  676  	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
73801b90a38ff1e drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21  677  	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
7e0540f41332cb0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2017-10-12  678  		int ret;
7e0540f41332cb0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2017-10-12  679  
979b519c7a1bff5 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21  680  		channel->is_otg_channel = true;
8dde0008ffc9e2e drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21  681  		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
8dde0008ffc9e2e drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21  682  							"renesas,no-otg-pins");
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  683  		channel->extcon = devm_extcon_dev_allocate(dev,
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  684  							rcar_gen3_phy_cable);
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  685  		if (IS_ERR(channel->extcon))
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  686  			return PTR_ERR(channel->extcon);
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  687  
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  688  		ret = devm_extcon_dev_register(dev, channel->extcon);
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  689  		if (ret < 0) {
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  690  			dev_err(dev, "Failed to register extcon\n");
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  691  			return ret;
2b38543c8db1c7d drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29  692  		}
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  693  	}
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  694  
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  695  	/*
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  696  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  697  	 * And then, phy-core will manage runtime pm for this device.
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  698  	 */
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  699  	pm_runtime_enable(dev);
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  700  
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  701  	phy_data = of_device_get_match_data(dev);
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  702  	if (!phy_data) {
51e339deab1e514 drivers/phy/renesas/phy-rcar-gen3-usb2.c Wang Li           2020-11-26  703  		ret = -EINVAL;
51e339deab1e514 drivers/phy/renesas/phy-rcar-gen3-usb2.c Wang Li           2020-11-26  704  		goto error;
51e339deab1e514 drivers/phy/renesas/phy-rcar-gen3-usb2.c Wang Li           2020-11-26  705  	}
5d8042e95fd471d drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2019-04-10  706  
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  707  	channel->soc_no_adp_ctrl = phy_data->no_adp_ctrl;
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  708  	if (phy_data->no_adp_ctrl)
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  709  		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  710  
5c9dc6379f539c6 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-06-10  711  	mutex_init(&channel->lock);
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  712  	for (i = 0; i < NUM_OF_PHYS; i++) {
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  713  		channel->rphys[i].phy = devm_phy_create(dev, NULL,
b0512a6ec0cd6dc drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  714  							phy_data->phy_usb2_ops);
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  715  		if (IS_ERR(channel->rphys[i].phy)) {
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  716  			dev_err(dev, "Failed to create USB2 PHY\n");
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  717  			ret = PTR_ERR(channel->rphys[i].phy);
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  718  			goto error;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  719  		}
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  720  		channel->rphys[i].ch = channel;
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  721  		channel->rphys[i].int_enable_bits = rcar_gen3_int_enable[i];
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  722  		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  723  	}
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  724  
6dcfd7c300bf358 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  725  	channel->vbus = devm_regulator_get_optional(dev, "vbus");
6dcfd7c300bf358 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  726  	if (IS_ERR(channel->vbus)) {
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  727  		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  728  			ret = PTR_ERR(channel->vbus);
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  729  			goto error;
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  730  		}
6dcfd7c300bf358 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  731  		channel->vbus = NULL;
6dcfd7c300bf358 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  732  	}
6dcfd7c300bf358 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  733  
9bb86777fb71eeb drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  734  	platform_set_drvdata(pdev, channel);
92fec1c27caa7b6 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  735  	channel->dev = dev;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  736  
549b6b55b005581 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  737  	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
9bb86777fb71eeb drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  738  	if (IS_ERR(provider)) {
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  739  		dev_err(dev, "Failed to register PHY provider\n");
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  740  		ret = PTR_ERR(provider);
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  741  		goto error;
979b519c7a1bff5 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21  742  	} else if (channel->is_otg_channel) {
9bb86777fb71eeb drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  743  		int ret;
9bb86777fb71eeb drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  744  
9bb86777fb71eeb drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  745  		ret = device_create_file(dev, &dev_attr_role);
9bb86777fb71eeb drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  746  		if (ret < 0)
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14 @747  			goto error;
9bb86777fb71eeb drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  748  	}
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  749  
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  750  	return 0;
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  751  
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  752  error:
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  753  	pm_runtime_disable(dev);
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  754  
441a681b8843474 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  755  	return ret;
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  756  }
f3b5a8d9b50d71b drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  757  

:::::: The code at line 747 was first introduced by commit
:::::: 441a681b8843474c9796b50c35794ff102701f37 phy: rcar-gen3-usb2: fix implementation for runtime PM

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
