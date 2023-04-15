Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D61868
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Apr 2023 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681586634; x=1713122634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pRj9XL2l2QEiZe6sJ8+1JWQt2Ppk4tacLPW7hQfB5P0=;
  b=Ek8+nWcM6bxGjBwq0jfybA/3GmIBq8N+u83IbFLp8Uu29XM4j3lP21sp
   DsKAy5KzfwsAlnbXFA6F39EB3O8/R6JlReIYkSBvE8seSTgZMmPqv5NoX
   lJPc1qZU8xJ4ADGpBWDHOVe+xf2P3cXiN3vco0pAeYKPTZ53Qvs5K7mqN
   J12ltQBnYEQaZr8EJWom3KD4SddNgRXUcccFpq7tGzo4eafbD4+Sf78eo
   WUhCttMOha5mK6dnUb1RKlPSSumIin5xEkZm1jLtc6x0LVZLxJEI2L3sA
   m6YhnXm91O97s6uYHKiDnd/s3I99g21uGUEWwki4+cLuVKCnXoC0PeZts
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="372548270"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="372548270"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 12:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="692819712"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="692819712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2023 12:23:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnlV1-000bIB-1Z;
	Sat, 15 Apr 2023 19:23:51 +0000
Date: Sun, 16 Apr 2023 03:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel-simple: allow LVDS format override
Message-ID: <202304160359.4LHmFOlU-lkp@intel.com>
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
In-Reply-To: <20230414161116.3673911-3-j.zink@pengutronix.de>
References: <20230414161116.3673911-3-j.zink@pengutronix.de>
TO: Johannes Zink <j.zink@pengutronix.de>
TO: thierry.reding@gmail.com
TO: sam@ravnborg.org
TO: airlied@gmail.com
TO: daniel@ffwll.ch
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: dri-devel@lists.freedesktop.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: kernel@pengutronix.de
CC: Johannes Zink <j.zink@pengutronix.de>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Zink/dt-bindings-display-simple-support-non-default-data-mapping/20230415-001256
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230414161116.3673911-3-j.zink%40pengutronix.de
patch subject: [PATCH 2/2] drm/panel-simple: allow LVDS format override
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: loongarch-randconfig-m031-20230415 (https://download.01.org/0day-ci/archive/20230416/202304160359.4LHmFOlU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304160359.4LHmFOlU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-simple.c:635 panel_simple_probe() warn: missing unwind goto?

vim +635 drivers/gpu/drm/panel/panel-simple.c

b8a2948fa2b3a5 Sean Paul             2019-07-11  555  
5f04e7ce392db9 Douglas Anderson      2021-09-14  556  static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
280921de7241ee Thierry Reding        2013-08-30  557  {
280921de7241ee Thierry Reding        2013-08-30  558  	struct panel_simple *panel;
b8a2948fa2b3a5 Sean Paul             2019-07-11  559  	struct display_timing dt;
0fe1564bd61642 Sam Ravnborg          2019-12-07  560  	struct device_node *ddc;
9f069c6fbc7266 Sam Ravnborg          2020-07-26  561  	int connector_type;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  562  	u32 bus_flags;
fad6396eea4946 Johannes Zink         2023-04-14  563  	int err, ret;
280921de7241ee Thierry Reding        2013-08-30  564  
280921de7241ee Thierry Reding        2013-08-30  565  	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
280921de7241ee Thierry Reding        2013-08-30  566  	if (!panel)
280921de7241ee Thierry Reding        2013-08-30  567  		return -ENOMEM;
280921de7241ee Thierry Reding        2013-08-30  568  
280921de7241ee Thierry Reding        2013-08-30  569  	panel->enabled = false;
4beb04beb24afe Douglas Anderson      2020-11-09  570  	panel->prepared_time = 0;
280921de7241ee Thierry Reding        2013-08-30  571  	panel->desc = desc;
280921de7241ee Thierry Reding        2013-08-30  572  
280921de7241ee Thierry Reding        2013-08-30  573  	panel->supply = devm_regulator_get(dev, "power");
280921de7241ee Thierry Reding        2013-08-30  574  	if (IS_ERR(panel->supply))
280921de7241ee Thierry Reding        2013-08-30  575  		return PTR_ERR(panel->supply);
280921de7241ee Thierry Reding        2013-08-30  576  
a61400d85c3ba4 Alexandre Courbot     2014-10-23  577  	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
a61400d85c3ba4 Alexandre Courbot     2014-10-23  578  						     GPIOD_OUT_LOW);
c9b48b91e2fbb7 Yuan Can              2022-09-29  579  	if (IS_ERR(panel->enable_gpio))
c9b48b91e2fbb7 Yuan Can              2022-09-29  580  		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
c9b48b91e2fbb7 Yuan Can              2022-09-29  581  				     "failed to request GPIO\n");
280921de7241ee Thierry Reding        2013-08-30  582  
5759c9674c20ff Dmitry Osipenko       2020-08-14  583  	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
5759c9674c20ff Dmitry Osipenko       2020-08-14  584  	if (err) {
5759c9674c20ff Dmitry Osipenko       2020-08-14  585  		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
5759c9674c20ff Dmitry Osipenko       2020-08-14  586  		return err;
5759c9674c20ff Dmitry Osipenko       2020-08-14  587  	}
5759c9674c20ff Dmitry Osipenko       2020-08-14  588  
280921de7241ee Thierry Reding        2013-08-30  589  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
280921de7241ee Thierry Reding        2013-08-30  590  	if (ddc) {
280921de7241ee Thierry Reding        2013-08-30  591  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
280921de7241ee Thierry Reding        2013-08-30  592  		of_node_put(ddc);
280921de7241ee Thierry Reding        2013-08-30  593  
0fe1564bd61642 Sam Ravnborg          2019-12-07  594  		if (!panel->ddc)
0fe1564bd61642 Sam Ravnborg          2019-12-07  595  			return -EPROBE_DEFER;
280921de7241ee Thierry Reding        2013-08-30  596  	}
280921de7241ee Thierry Reding        2013-08-30  597  
4a1d0dbc833223 Sam Ravnborg          2020-02-16  598  	if (desc == &panel_dpi) {
4a1d0dbc833223 Sam Ravnborg          2020-02-16  599  		/* Handle the generic panel-dpi binding */
4a1d0dbc833223 Sam Ravnborg          2020-02-16  600  		err = panel_dpi_probe(dev, panel);
4a1d0dbc833223 Sam Ravnborg          2020-02-16  601  		if (err)
4a1d0dbc833223 Sam Ravnborg          2020-02-16  602  			goto free_ddc;
6df4432a5eca10 Christoph Niedermaier 2022-02-01  603  		desc = panel->desc;
4a1d0dbc833223 Sam Ravnborg          2020-02-16  604  	} else {
b8a2948fa2b3a5 Sean Paul             2019-07-11  605  		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
e362cc6a247551 Douglas Anderson      2019-07-12  606  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
4a1d0dbc833223 Sam Ravnborg          2020-02-16  607  	}
b8a2948fa2b3a5 Sean Paul             2019-07-11  608  
fad6396eea4946 Johannes Zink         2023-04-14  609  
fad6396eea4946 Johannes Zink         2023-04-14  610  	/* optional data-mapping property for overriding bus format */
fad6396eea4946 Johannes Zink         2023-04-14  611  	ret = drm_of_lvds_get_data_mapping(dev->of_node);
fad6396eea4946 Johannes Zink         2023-04-14  612  	if (ret == -EINVAL) {
fad6396eea4946 Johannes Zink         2023-04-14  613  		dev_warn(dev, "Ignore invalid data-mapping property");
fad6396eea4946 Johannes Zink         2023-04-14  614  	} else if (ret != -ENODEV) {
fad6396eea4946 Johannes Zink         2023-04-14  615  		int bpc;
fad6396eea4946 Johannes Zink         2023-04-14  616  
fad6396eea4946 Johannes Zink         2023-04-14  617  		switch (ret) {
fad6396eea4946 Johannes Zink         2023-04-14  618  		default:
fad6396eea4946 Johannes Zink         2023-04-14  619  			WARN_ON(1);
fad6396eea4946 Johannes Zink         2023-04-14  620  			fallthrough;
fad6396eea4946 Johannes Zink         2023-04-14  621  		case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
fad6396eea4946 Johannes Zink         2023-04-14  622  			fallthrough;
fad6396eea4946 Johannes Zink         2023-04-14  623  		case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
fad6396eea4946 Johannes Zink         2023-04-14  624  			bpc = 8;
fad6396eea4946 Johannes Zink         2023-04-14  625  			break;
fad6396eea4946 Johannes Zink         2023-04-14  626  		case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
fad6396eea4946 Johannes Zink         2023-04-14  627  			bpc = 6;
fad6396eea4946 Johannes Zink         2023-04-14  628  		}
fad6396eea4946 Johannes Zink         2023-04-14  629  
fad6396eea4946 Johannes Zink         2023-04-14  630  		if (desc->bpc != bpc || desc->bus_format != ret) {
fad6396eea4946 Johannes Zink         2023-04-14  631  			struct panel_desc *override_desc;
fad6396eea4946 Johannes Zink         2023-04-14  632  
fad6396eea4946 Johannes Zink         2023-04-14  633  			override_desc = devm_kmemdup(dev, desc, sizeof(*desc), GFP_KERNEL);
fad6396eea4946 Johannes Zink         2023-04-14  634  			if (!override_desc)
fad6396eea4946 Johannes Zink         2023-04-14 @635  				return -ENOMEM;
fad6396eea4946 Johannes Zink         2023-04-14  636  
fad6396eea4946 Johannes Zink         2023-04-14  637  			override_desc->bus_format = ret;
fad6396eea4946 Johannes Zink         2023-04-14  638  			override_desc->bpc = bpc;
fad6396eea4946 Johannes Zink         2023-04-14  639  			panel->desc = override_desc;
fad6396eea4946 Johannes Zink         2023-04-14  640  		}
fad6396eea4946 Johannes Zink         2023-04-14  641  	}
fad6396eea4946 Johannes Zink         2023-04-14  642  
9f069c6fbc7266 Sam Ravnborg          2020-07-26  643  	connector_type = desc->connector_type;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  644  	/* Catch common mistakes for panels. */
9f069c6fbc7266 Sam Ravnborg          2020-07-26  645  	switch (connector_type) {
ddb8e853dc8507 Sam Ravnborg          2020-07-26  646  	case 0:
ddb8e853dc8507 Sam Ravnborg          2020-07-26  647  		dev_warn(dev, "Specify missing connector_type\n");
9f069c6fbc7266 Sam Ravnborg          2020-07-26  648  		connector_type = DRM_MODE_CONNECTOR_DPI;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  649  		break;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  650  	case DRM_MODE_CONNECTOR_LVDS:
c4715837b02393 Laurent Pinchart      2020-06-30  651  		WARN_ON(desc->bus_flags &
c4715837b02393 Laurent Pinchart      2020-06-30  652  			~(DRM_BUS_FLAG_DE_LOW |
c4715837b02393 Laurent Pinchart      2020-06-30  653  			  DRM_BUS_FLAG_DE_HIGH |
c4715837b02393 Laurent Pinchart      2020-06-30  654  			  DRM_BUS_FLAG_DATA_MSB_TO_LSB |
c4715837b02393 Laurent Pinchart      2020-06-30  655  			  DRM_BUS_FLAG_DATA_LSB_TO_MSB));
1185c406f11a49 Laurent Pinchart      2020-06-30  656  		WARN_ON(desc->bus_format != MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
1185c406f11a49 Laurent Pinchart      2020-06-30  657  			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_SPWG &&
1185c406f11a49 Laurent Pinchart      2020-06-30  658  			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA);
1185c406f11a49 Laurent Pinchart      2020-06-30  659  		WARN_ON(desc->bus_format == MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
1185c406f11a49 Laurent Pinchart      2020-06-30  660  			desc->bpc != 6);
1185c406f11a49 Laurent Pinchart      2020-06-30  661  		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
1185c406f11a49 Laurent Pinchart      2020-06-30  662  			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
1185c406f11a49 Laurent Pinchart      2020-06-30  663  			desc->bpc != 8);
ddb8e853dc8507 Sam Ravnborg          2020-07-26  664  		break;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  665  	case DRM_MODE_CONNECTOR_eDP:
5f04e7ce392db9 Douglas Anderson      2021-09-14  666  		dev_warn(dev, "eDP panels moved to panel-edp\n");
5f04e7ce392db9 Douglas Anderson      2021-09-14  667  		err = -EINVAL;
5f04e7ce392db9 Douglas Anderson      2021-09-14  668  		goto free_ddc;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  669  	case DRM_MODE_CONNECTOR_DSI:
ddb8e853dc8507 Sam Ravnborg          2020-07-26  670  		if (desc->bpc != 6 && desc->bpc != 8)
ddb8e853dc8507 Sam Ravnborg          2020-07-26  671  			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
ddb8e853dc8507 Sam Ravnborg          2020-07-26  672  		break;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  673  	case DRM_MODE_CONNECTOR_DPI:
ddb8e853dc8507 Sam Ravnborg          2020-07-26  674  		bus_flags = DRM_BUS_FLAG_DE_LOW |
ddb8e853dc8507 Sam Ravnborg          2020-07-26  675  			    DRM_BUS_FLAG_DE_HIGH |
ddb8e853dc8507 Sam Ravnborg          2020-07-26  676  			    DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
ddb8e853dc8507 Sam Ravnborg          2020-07-26  677  			    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
ddb8e853dc8507 Sam Ravnborg          2020-07-26  678  			    DRM_BUS_FLAG_DATA_MSB_TO_LSB |
ddb8e853dc8507 Sam Ravnborg          2020-07-26  679  			    DRM_BUS_FLAG_DATA_LSB_TO_MSB |
ddb8e853dc8507 Sam Ravnborg          2020-07-26  680  			    DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE |
ddb8e853dc8507 Sam Ravnborg          2020-07-26  681  			    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  682  		if (desc->bus_flags & ~bus_flags)
ddb8e853dc8507 Sam Ravnborg          2020-07-26  683  			dev_warn(dev, "Unexpected bus_flags(%d)\n", desc->bus_flags & ~bus_flags);
ddb8e853dc8507 Sam Ravnborg          2020-07-26  684  		if (!(desc->bus_flags & bus_flags))
ddb8e853dc8507 Sam Ravnborg          2020-07-26  685  			dev_warn(dev, "Specify missing bus_flags\n");
ddb8e853dc8507 Sam Ravnborg          2020-07-26  686  		if (desc->bus_format == 0)
ddb8e853dc8507 Sam Ravnborg          2020-07-26  687  			dev_warn(dev, "Specify missing bus_format\n");
ddb8e853dc8507 Sam Ravnborg          2020-07-26  688  		if (desc->bpc != 6 && desc->bpc != 8)
ddb8e853dc8507 Sam Ravnborg          2020-07-26  689  			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
ddb8e853dc8507 Sam Ravnborg          2020-07-26  690  		break;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  691  	default:
ddb8e853dc8507 Sam Ravnborg          2020-07-26  692  		dev_warn(dev, "Specify a valid connector_type: %d\n", desc->connector_type);
9f069c6fbc7266 Sam Ravnborg          2020-07-26  693  		connector_type = DRM_MODE_CONNECTOR_DPI;
ddb8e853dc8507 Sam Ravnborg          2020-07-26  694  		break;
1185c406f11a49 Laurent Pinchart      2020-06-30  695  	}
c4715837b02393 Laurent Pinchart      2020-06-30  696  
3235b0f20a0a41 Douglas Anderson      2021-04-16  697  	dev_set_drvdata(dev, panel);
3235b0f20a0a41 Douglas Anderson      2021-04-16  698  
3235b0f20a0a41 Douglas Anderson      2021-04-16  699  	/*
3235b0f20a0a41 Douglas Anderson      2021-04-16  700  	 * We use runtime PM for prepare / unprepare since those power the panel
3235b0f20a0a41 Douglas Anderson      2021-04-16  701  	 * on and off and those can be very slow operations. This is important
3235b0f20a0a41 Douglas Anderson      2021-04-16  702  	 * to optimize powering the panel on briefly to read the EDID before
3235b0f20a0a41 Douglas Anderson      2021-04-16  703  	 * fully enabling the panel.
3235b0f20a0a41 Douglas Anderson      2021-04-16  704  	 */
3235b0f20a0a41 Douglas Anderson      2021-04-16  705  	pm_runtime_enable(dev);
3235b0f20a0a41 Douglas Anderson      2021-04-16  706  	pm_runtime_set_autosuspend_delay(dev, 1000);
3235b0f20a0a41 Douglas Anderson      2021-04-16  707  	pm_runtime_use_autosuspend(dev);
3235b0f20a0a41 Douglas Anderson      2021-04-16  708  
9f069c6fbc7266 Sam Ravnborg          2020-07-26  709  	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
280921de7241ee Thierry Reding        2013-08-30  710  
0fe1564bd61642 Sam Ravnborg          2019-12-07  711  	err = drm_panel_of_backlight(&panel->base);
d9e74da2f1fc42 Alexander Stein       2022-06-21  712  	if (err) {
d9e74da2f1fc42 Alexander Stein       2022-06-21  713  		dev_err_probe(dev, err, "Could not find backlight\n");
70e12560126685 Douglas Anderson      2021-04-23  714  		goto disable_pm_runtime;
d9e74da2f1fc42 Alexander Stein       2022-06-21  715  	}
0fe1564bd61642 Sam Ravnborg          2019-12-07  716  
c3ee8c65f63799 Bernard Zhao          2020-08-01  717  	drm_panel_add(&panel->base);
280921de7241ee Thierry Reding        2013-08-30  718  
280921de7241ee Thierry Reding        2013-08-30  719  	return 0;
280921de7241ee Thierry Reding        2013-08-30  720  
70e12560126685 Douglas Anderson      2021-04-23  721  disable_pm_runtime:
a596fcd9cbc781 Douglas Anderson      2021-05-17  722  	pm_runtime_dont_use_autosuspend(dev);
70e12560126685 Douglas Anderson      2021-04-23  723  	pm_runtime_disable(dev);
280921de7241ee Thierry Reding        2013-08-30  724  free_ddc:
5f04e7ce392db9 Douglas Anderson      2021-09-14  725  	if (panel->ddc)
280921de7241ee Thierry Reding        2013-08-30  726  		put_device(&panel->ddc->dev);
280921de7241ee Thierry Reding        2013-08-30  727  
280921de7241ee Thierry Reding        2013-08-30  728  	return err;
280921de7241ee Thierry Reding        2013-08-30  729  }
280921de7241ee Thierry Reding        2013-08-30  730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
