Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB05715A7
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 01:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621034; x=1711157034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4H6jJ2u2IQvBSctHIy+ufBZtfIshvy1S0t3VBpV7r4=;
  b=MzZ7Qmg5AMZhec2kXjCdJPmL0eW0MDyDyYVd/dPLY0SiE2EKmmglI37v
   dIvLz9v6Xtw7x1MqglNhH3b0Ii1jvj4VArmCS3I3Kkcn1JEPIdKr9GLqL
   Yy7OtRdGYGa8Ye8TKThLar8LMFAyp2sUefq4Vn47o/3K1hnpExZXhysmX
   ePiq/EkX6+6CrxCxfKISe/GFpijH79SznMqiPhRXxvsSTqMYgqAT/zGEW
   aZcIDtT4sW2A9EnHfg0xtBgJ+hfhKO9O9k7gKKrnQ2ZYVrbgNFGYiTGZg
   x1xe4rmxS9oIfpV9oU+Oyh9sOor59lJSVsBrv8l1sHv+4wBmIFr1NHN8p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="337176365"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="337176365"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 18:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="715041758"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="715041758"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 18:23:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfW9n-000Erm-1o;
	Fri, 24 Mar 2023 01:23:51 +0000
Date: Fri, 24 Mar 2023 09:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [driver-core:driver-core-testing 7/59]
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:1246 inno_hdmi_phy_probe()
 warn: 'inno->refpclk' from clk_prepare_enable() not released on lines:
 1211,1228.
Message-ID: <202303240927.eyaM6slw-lkp@intel.com>
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
CC: devel@driverdev.osuosl.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   9d11b13402d1b80f7f3ca5061d75f15cf8002555
commit: 410e7088e971ad656170fe9768b072b267a95310 [7/59] devres: Pass unique name of the resource to devm_add_action_or_reset()
:::::: branch date: 13 hours ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-m041-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240927.eyaM6slw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303240927.eyaM6slw-lkp@intel.com/

New smatch warnings:
drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:1246 inno_hdmi_phy_probe() warn: 'inno->refpclk' from clk_prepare_enable() not released on lines: 1211,1228.
drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:1246 inno_hdmi_phy_probe() warn: 'inno->sysclk' from clk_prepare_enable() not released on lines: 1211,1228.

Old smatch warnings:
drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:633 inno_hdmi_phy_rk3228_clk_set_rate() warn: passing a valid pointer to 'PTR_ERR'
drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:787 inno_hdmi_phy_rk3328_clk_set_rate() warn: passing a valid pointer to 'PTR_ERR'

vim +1246 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c

53706a1168631f Zheng Yang   2018-09-07  1142  
53706a1168631f Zheng Yang   2018-09-07  1143  static int inno_hdmi_phy_probe(struct platform_device *pdev)
53706a1168631f Zheng Yang   2018-09-07  1144  {
53706a1168631f Zheng Yang   2018-09-07  1145  	struct inno_hdmi_phy *inno;
53706a1168631f Zheng Yang   2018-09-07  1146  	struct phy_provider *phy_provider;
53706a1168631f Zheng Yang   2018-09-07  1147  	void __iomem *regs;
53706a1168631f Zheng Yang   2018-09-07  1148  	int ret;
53706a1168631f Zheng Yang   2018-09-07  1149  
53706a1168631f Zheng Yang   2018-09-07  1150  	inno = devm_kzalloc(&pdev->dev, sizeof(*inno), GFP_KERNEL);
53706a1168631f Zheng Yang   2018-09-07  1151  	if (!inno)
53706a1168631f Zheng Yang   2018-09-07  1152  		return -ENOMEM;
53706a1168631f Zheng Yang   2018-09-07  1153  
53706a1168631f Zheng Yang   2018-09-07  1154  	inno->dev = &pdev->dev;
53706a1168631f Zheng Yang   2018-09-07  1155  
53706a1168631f Zheng Yang   2018-09-07  1156  	inno->plat_data = of_device_get_match_data(inno->dev);
53706a1168631f Zheng Yang   2018-09-07  1157  	if (!inno->plat_data || !inno->plat_data->ops)
53706a1168631f Zheng Yang   2018-09-07  1158  		return -EINVAL;
53706a1168631f Zheng Yang   2018-09-07  1159  
6824ebc047b993 Chunfeng Yun 2020-11-06  1160  	regs = devm_platform_ioremap_resource(pdev, 0);
53706a1168631f Zheng Yang   2018-09-07  1161  	if (IS_ERR(regs))
53706a1168631f Zheng Yang   2018-09-07  1162  		return PTR_ERR(regs);
53706a1168631f Zheng Yang   2018-09-07  1163  
53706a1168631f Zheng Yang   2018-09-07  1164  	inno->sysclk = devm_clk_get(inno->dev, "sysclk");
53706a1168631f Zheng Yang   2018-09-07  1165  	if (IS_ERR(inno->sysclk)) {
53706a1168631f Zheng Yang   2018-09-07  1166  		ret = PTR_ERR(inno->sysclk);
53706a1168631f Zheng Yang   2018-09-07  1167  		dev_err(inno->dev, "failed to get sysclk: %d\n", ret);
53706a1168631f Zheng Yang   2018-09-07  1168  		return ret;
53706a1168631f Zheng Yang   2018-09-07  1169  	}
53706a1168631f Zheng Yang   2018-09-07  1170  
53706a1168631f Zheng Yang   2018-09-07  1171  	inno->refpclk = devm_clk_get(inno->dev, "refpclk");
53706a1168631f Zheng Yang   2018-09-07  1172  	if (IS_ERR(inno->refpclk)) {
53706a1168631f Zheng Yang   2018-09-07  1173  		ret = PTR_ERR(inno->refpclk);
53706a1168631f Zheng Yang   2018-09-07  1174  		dev_err(inno->dev, "failed to get ref clock: %d\n", ret);
53706a1168631f Zheng Yang   2018-09-07  1175  		return ret;
53706a1168631f Zheng Yang   2018-09-07  1176  	}
53706a1168631f Zheng Yang   2018-09-07  1177  
53706a1168631f Zheng Yang   2018-09-07  1178  	inno->refoclk = devm_clk_get(inno->dev, "refoclk");
53706a1168631f Zheng Yang   2018-09-07  1179  	if (IS_ERR(inno->refoclk)) {
53706a1168631f Zheng Yang   2018-09-07  1180  		ret = PTR_ERR(inno->refoclk);
53706a1168631f Zheng Yang   2018-09-07  1181  		dev_err(inno->dev, "failed to get oscillator-ref clock: %d\n",
53706a1168631f Zheng Yang   2018-09-07  1182  			ret);
53706a1168631f Zheng Yang   2018-09-07  1183  		return ret;
53706a1168631f Zheng Yang   2018-09-07  1184  	}
53706a1168631f Zheng Yang   2018-09-07  1185  
53706a1168631f Zheng Yang   2018-09-07  1186  	ret = clk_prepare_enable(inno->sysclk);
53706a1168631f Zheng Yang   2018-09-07  1187  	if (ret) {
53706a1168631f Zheng Yang   2018-09-07  1188  		dev_err(inno->dev, "Cannot enable inno phy sysclk: %d\n", ret);
53706a1168631f Zheng Yang   2018-09-07  1189  		return ret;
53706a1168631f Zheng Yang   2018-09-07  1190  	}
53706a1168631f Zheng Yang   2018-09-07  1191  
53706a1168631f Zheng Yang   2018-09-07  1192  	/*
53706a1168631f Zheng Yang   2018-09-07  1193  	 * Refpclk needs to be on, on at least the rk3328 for still
53706a1168631f Zheng Yang   2018-09-07  1194  	 * unknown reasons.
53706a1168631f Zheng Yang   2018-09-07  1195  	 */
53706a1168631f Zheng Yang   2018-09-07  1196  	ret = clk_prepare_enable(inno->refpclk);
53706a1168631f Zheng Yang   2018-09-07  1197  	if (ret) {
53706a1168631f Zheng Yang   2018-09-07  1198  		dev_err(inno->dev, "failed to enable refpclk\n");
53706a1168631f Zheng Yang   2018-09-07  1199  		clk_disable_unprepare(inno->sysclk);
53706a1168631f Zheng Yang   2018-09-07  1200  		return ret;
53706a1168631f Zheng Yang   2018-09-07  1201  	}
53706a1168631f Zheng Yang   2018-09-07  1202  
53706a1168631f Zheng Yang   2018-09-07  1203  	ret = devm_add_action_or_reset(inno->dev, inno_hdmi_phy_action,
53706a1168631f Zheng Yang   2018-09-07  1204  				       inno);
53706a1168631f Zheng Yang   2018-09-07  1205  	if (ret)
53706a1168631f Zheng Yang   2018-09-07  1206  		return ret;
53706a1168631f Zheng Yang   2018-09-07  1207  
53706a1168631f Zheng Yang   2018-09-07  1208  	inno->regmap = devm_regmap_init_mmio(inno->dev, regs,
53706a1168631f Zheng Yang   2018-09-07  1209  					     &inno_hdmi_phy_regmap_config);
53706a1168631f Zheng Yang   2018-09-07  1210  	if (IS_ERR(inno->regmap))
53706a1168631f Zheng Yang   2018-09-07  1211  		return PTR_ERR(inno->regmap);
53706a1168631f Zheng Yang   2018-09-07  1212  
53706a1168631f Zheng Yang   2018-09-07  1213  	/* only the newer rk3328 hdmiphy has an interrupt */
53706a1168631f Zheng Yang   2018-09-07  1214  	inno->irq = platform_get_irq(pdev, 0);
53706a1168631f Zheng Yang   2018-09-07  1215  	if (inno->irq > 0) {
53706a1168631f Zheng Yang   2018-09-07  1216  		ret = devm_request_threaded_irq(inno->dev, inno->irq,
53706a1168631f Zheng Yang   2018-09-07  1217  						inno_hdmi_phy_rk3328_hardirq,
53706a1168631f Zheng Yang   2018-09-07  1218  						inno_hdmi_phy_rk3328_irq,
53706a1168631f Zheng Yang   2018-09-07  1219  						IRQF_SHARED,
53706a1168631f Zheng Yang   2018-09-07  1220  						dev_name(inno->dev), inno);
53706a1168631f Zheng Yang   2018-09-07  1221  		if (ret)
53706a1168631f Zheng Yang   2018-09-07  1222  			return ret;
53706a1168631f Zheng Yang   2018-09-07  1223  	}
53706a1168631f Zheng Yang   2018-09-07  1224  
53706a1168631f Zheng Yang   2018-09-07  1225  	inno->phy = devm_phy_create(inno->dev, NULL, &inno_hdmi_phy_ops);
53706a1168631f Zheng Yang   2018-09-07  1226  	if (IS_ERR(inno->phy)) {
53706a1168631f Zheng Yang   2018-09-07  1227  		dev_err(inno->dev, "failed to create HDMI PHY\n");
53706a1168631f Zheng Yang   2018-09-07  1228  		return PTR_ERR(inno->phy);
53706a1168631f Zheng Yang   2018-09-07  1229  	}
53706a1168631f Zheng Yang   2018-09-07  1230  
53706a1168631f Zheng Yang   2018-09-07  1231  	phy_set_drvdata(inno->phy, inno);
53706a1168631f Zheng Yang   2018-09-07  1232  	phy_set_bus_width(inno->phy, 8);
53706a1168631f Zheng Yang   2018-09-07  1233  
53706a1168631f Zheng Yang   2018-09-07  1234  	if (inno->plat_data->ops->init) {
53706a1168631f Zheng Yang   2018-09-07  1235  		ret = inno->plat_data->ops->init(inno);
53706a1168631f Zheng Yang   2018-09-07  1236  		if (ret)
53706a1168631f Zheng Yang   2018-09-07  1237  			return ret;
53706a1168631f Zheng Yang   2018-09-07  1238  	}
53706a1168631f Zheng Yang   2018-09-07  1239  
53706a1168631f Zheng Yang   2018-09-07  1240  	ret = inno_hdmi_phy_clk_register(inno);
53706a1168631f Zheng Yang   2018-09-07  1241  	if (ret)
53706a1168631f Zheng Yang   2018-09-07  1242  		return ret;
53706a1168631f Zheng Yang   2018-09-07  1243  
53706a1168631f Zheng Yang   2018-09-07  1244  	phy_provider = devm_of_phy_provider_register(inno->dev,
53706a1168631f Zheng Yang   2018-09-07  1245  						     of_phy_simple_xlate);
53706a1168631f Zheng Yang   2018-09-07 @1246  	return PTR_ERR_OR_ZERO(phy_provider);
53706a1168631f Zheng Yang   2018-09-07  1247  }
53706a1168631f Zheng Yang   2018-09-07  1248  

:::::: The code at line 1246 was first introduced by commit
:::::: 53706a1168631fa5bf2e6d47de4647ea7e69f270 phy: add Rockchip Innosilicon hdmi phy

:::::: TO: Zheng Yang <zhengyang@rock-chips.com>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
