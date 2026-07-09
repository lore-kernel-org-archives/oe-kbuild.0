Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B733D3327
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593620; cv=none; b=in1Ao4dQEpGGpxWCZbiNEFRiAEjK2qEqVcGx5GZosjS8UHGSI4XwiwjFUpPGPG7Dga9NQ85SgEOMemG2mi8nHxJGSXTHgpnLKcpjbmhov1tGPQjDwxIbIWjrLjwq9/2J0hPkxPZkEaX8MKGCbOyaOq5qlPqO78aaOSnMja1SGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593620; c=relaxed/simple;
	bh=P/9frszRQMakq6rP5ZGKnqg5po7DL2Q/XbvzX/5O6c8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO2CYMsKzRbv++OjoKaNynqDXhs1lqBDH7qT10K1orOIH3SOpJAYrZ9dJjFwiiPAdqmXAiHgWECC+1/VPdE5UYhbtvfTXqY9KkZUzIVo2DZss6cAoCmYQYOQgK+BNYHC38TpvjLDM7gQyFZgFZHgGDykj3nfVtoGXY3LoHpaLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfkdhkpx; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfkdhkpx"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-491f5e6d564so976685b6e.1
        for <oe-kbuild@lists.linux.dev>; Thu, 09 Jul 2026 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593618; x=1784198418; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sRIoL7V8Ni/joRex0fbhmsiGIOha2+4T7QCV85MKdE=;
        b=gfkdhkpxNX7R5ji8XXGX/9xDhMYPftbAdqNbu5iw2Gp9z2LKkWTyQ/VzkcIngLG+eF
         0/wIUcRvSc5cd5pcr5f/wcqBcWIMfAX6GtGPrv1bKqt9fC08FQ3cpwXfFx/R+TTdAVCK
         9oP731nmwS0t+HeNau/mG2GEdvh8dpFRsNopA4v9uXCcCnUBLoeMHrA7A4ABpM9+OaDK
         n+fcSYXWA705mG1xTTjXoxYGjOEonxdDy2mg7PPL+vuEHcvf9BTXHVM2cz3JpDl5M144
         5VJi0j2Migx/dGcJRUQBsuJ5WsVXIX0k80Bmib6f8kfu/JBK3xJtqj/AVFrjCh16cn5H
         qkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593618; x=1784198418;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sRIoL7V8Ni/joRex0fbhmsiGIOha2+4T7QCV85MKdE=;
        b=VY4dbH2p+sRvM6+Z3SG21RzBaAL90KUg9jdEdrXcUXm4fpuGWjk8e7fxhIG2dYsvJO
         p5h9eYANQLPDeKORT92EgEEL2jbOyNZyl/RGjHDfFzEobS66HMYaXEZdbOdnUP7M3eXV
         at6S1mWFJlQWyI2vfYig4N4tF9RAnBB6g1/nNn/OpNhKZwsL6mer2UwJeJCsp+JqW7RM
         E+JdmODFdGdZhO+feNRCP9bnlxTGf7rJ7AT1beasY/sZhoonLzzv5J3vX3eb4hugWVws
         0t2zFurkAbL3hRhqGOtr9z+sWOeexq23cbBbi9Qck86aH07ADzJ98KU2Jd4StnzxvnnD
         qKZw==
X-Gm-Message-State: AOJu0Yxv+WQ2G/ey4axm0lYA2RiTseeC5uEyvdqC9GJJsE6mKUZLFu6i
	yDC+7DiUTMxVl3LkFDHZEnVUF2fymhlUzm1OXrMGQq3oNy4j5xCiEHUv7ZQpJlAGlr4=
X-Gm-Gg: AfdE7ckw8BaEKvV9oo+313UmunYxIzs7z13oxSY+B+plLbBA06wZUgIdy94oWtlCKgL
	6KDsdDjMhV0gBTqKb5kDNVifzdIXA+/e3lcYvP6yzFIqM59WzzzJC30luSYYRZsUlI1h3IV6iFV
	3I7I2IOI2C1J1+SuPzNYNXj4WFYuXfSBGln6HnB1yiSUsNoWjVCFHbyWZDeEyK/z3QOyXUPbI7L
	dzBszN1PHaU6qI7lHHEuu9A7+KrvAsSVjZ+bdzs1pQtwcOHsDVVnMmUsTTM2J73oiO0P6Fx2nYb
	0086PvAFhyJQbq8nGWEn9DxBlmrgaAGCl7C5L3B4F5lhqRzWz40WjizEL8lVABnue1rd05MW6EJ
	wWhanOrivmilPuUMH+Dl2Ei8hDJL6Z1n9mcXJR4Eac0a4HTLMA5qkUtogWpnyFFzT2jbpX0MaSK
	YmniUmMRVxi3GUK1Y=
X-Received: by 2002:a05:6808:1b24:b0:495:dea9:3b6 with SMTP id 5614622812f47-4a203dbf803mr4963728b6e.26.1783593616928;
        Thu, 09 Jul 2026 03:40:16 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1ad6b73c1sm3495895b6e.7.2026.07.09.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:40:15 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:40:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: drivers/usb/chipidea/ci_hdrc_imx.c:532 ci_hdrc_imx_probe() warn:
 missing error code 'ret'
Message-ID: <202607031656.FR3Xrved-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260709104009.VDqk7w4a0vkeUuhXCztYLkM7DJ_BG8YtiOLeh2-n33E@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   51512e22efe813d8223de27f6fd02a8a48ea2323
commit: 2e9762f45efb53e7e7fc61f4ebf7a3507f5daa45 usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name
config: microblaze-randconfig-r072-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031656.FR3Xrved-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2e9762f45efb ("usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031656.FR3Xrved-lkp@intel.com/

smatch warnings:
drivers/usb/chipidea/ci_hdrc_imx.c:532 ci_hdrc_imx_probe() warn: missing error code 'ret'

vim +/ret +532 drivers/usb/chipidea/ci_hdrc_imx.c

ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  527  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  528  	if (data->wakeup_irq > 0) {
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-01-12  529  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-01-12  530  		if (!irq_name) {
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-01-12  531  			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-01-12 @532  			goto err_clk;

ret = -ENOMEM;

2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-01-12  533  		}
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-01-12  534  
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  535  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  536  						NULL, ci_wakeup_irq_handler,
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  537  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-01-12  538  						irq_name, data);
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  539  		if (ret)
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  540  			goto err_clk;
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  541  	}
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-03-18  542  
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-08-14  543  	ret = imx_usbmisc_init(data->usbmisc_data);
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-09-12  544  	if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  545  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-03-16  546  		goto phy_shutdown;
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-09-12  547  	}
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-09-12  548  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  549  	data->ci_pdev = ci_hdrc_add_device(dev,
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  550  				pdev->resource, pdev->num_resources,
f6a3b3a37c4772 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-06-13  551  				&pdata);
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  552  	if (IS_ERR(data->ci_pdev)) {
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  553  		ret = PTR_ERR(data->ci_pdev);
18171cfc3c236a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2022-06-14  554  		dev_err_probe(dev, ret, "ci_hdrc_add_device failed\n");
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-03-16  555  		goto phy_shutdown;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  556  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  557  
df17aa9fb31f6a drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-10-09  558  	if (data->usbmisc_data) {
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  559  		if (!IS_ERR(pdata.id_extcon.edev) ||
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  560  		    of_property_read_bool(np, "usb-role-switch"))
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  561  			data->usbmisc_data->ext_id = 1;
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  562  
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  563  		if (!IS_ERR(pdata.vbus_extcon.edev) ||
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  564  		    of_property_read_bool(np, "usb-role-switch"))
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  565  			data->usbmisc_data->ext_vbus = 1;
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  566  
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  567  		/* usbmisc needs to know dr mode to choose wakeup setting */
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  568  		data->usbmisc_data->available_role =
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-07-28  569  			ci_hdrc_query_available_role(data->ci_pdev);
df17aa9fb31f6a drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-10-09  570  	}
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-09-09  571  
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-08-14  572  	ret = imx_usbmisc_init_post(data->usbmisc_data);
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-03-30  573  	if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  574  		dev_err(dev, "usbmisc post failed, ret=%d\n", ret);
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  575  		goto disable_device;
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-03-30  576  	}
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-03-30  577  
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  578  	if (data->supports_runtime_pm) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  579  		pm_runtime_set_active(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  580  		pm_runtime_enable(dev);
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  581  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  582  
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  583  	device_set_wakeup_capable(dev, true);
6d6531104d2069 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-02-11  584  
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  585  	return 0;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  586  
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-06-13  587  disable_device:
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-06-24  588  	ci_hdrc_remove_device(data->ci_pdev);
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-03-16  589  phy_shutdown:
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-03-16  590  	if (data->override_phy_control)
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-03-16  591  		usb_phy_shutdown(data->phy);
ea1418b5f1a394 drivers/usb/chipidea/ci13xxx_imx.c Sascha Hauer        2013-06-13  592  err_clk:
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  593  	clk_disable_unprepare(data->clk_wakeup);
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-12-28  594  err_wakeup_clk:
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-10-16  595  	imx_disable_unprepare_clks(dev);
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-03-16  596  qos_remove_request:
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-04-28  597  	if (pdata.flags & CI_HDRC_PMQOS)
77b352456941e8 drivers/usb/chipidea/ci_hdrc_imx.c Rafael J. Wysocki   2020-02-12  598  		cpu_latency_qos_remove_request(&data->pm_qos_req);
141822aa3f79ef drivers/usb/chipidea/ci_hdrc_imx.c André Draszik       2019-08-10  599  	data->ci_pdev = NULL;
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-16  600  err_put:
4e28f79e3dffa5 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-03-16  601  	if (data->usbmisc_data)
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-12-16  602  		put_device(data->usbmisc_data->dev);
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  603  	return ret;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-07-07  604  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

