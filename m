Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B604191F88
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 03:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734752402; cv=none; b=Og0U+Kx9lHrrcSLIjBQI4XOWSMeoDceyEUiozRB8v5PRAr+elZnvVwRsyEv35kc3OAPZ0/spLaTKqIcxem35GrvnEL6Kqbq/x9WUhgS8fLO9SJxTcddF4H0CgWsoS8j0uZlocG0NAywrl7i+Ydpg4K/KoNwSCN7kA2qxfr608C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734752402; c=relaxed/simple;
	bh=PhJCfcEVxbDe9RqV09BEctyof3pCkNI0YXIX45g2gSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bIXHIKu4hb3N8j7QwM+LNpbZLmbTlMc/4eiaD3yChygGWtD3wK98AvpPEfQNv3CvAqFXui6lbTq63oRxEPcVw++vxir7maufyQitSStMsBe6zOedAWHqEeb+hhPzwEyg9WjVa81+/DsSILAJRD6XdoqDapHvrljwWCY6Fy1BFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQt6Ck6J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQt6Ck6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734752399; x=1766288399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PhJCfcEVxbDe9RqV09BEctyof3pCkNI0YXIX45g2gSw=;
  b=iQt6Ck6Jll+rRRfVmB7jL4foNuk7JoQtFOtyGpNUualre9EXWuYbVOUt
   dVXPjAPivjbt24qfoNjIR8R1TKuTDF8IdX18H3p9w19YVyNBHhrq+jngw
   WesVgwZ0FdHnMeKpeQSaZS/CHA8TYMrJBW0G9H0C0flYUBCkcCr2h3MHG
   +XEBa/K227XGDZ4B7c/0+N0JTgo6/v+KHVOPNfMT2PXK7sPYAS+P4YVvf
   uGsEtdvDP+cF+lXDoO6O/jGoHTmlVclQih+nT8qCUrfrhIcoPU4mGsFM0
   KL7gJlXCo6HTW/G70hL62m52MS2Qt34wecDvolBbD0+3wzF9UzKy791eF
   g==;
X-CSE-ConnectionGUID: tQ3fMXhwQQmyTza/3ySJRA==
X-CSE-MsgGUID: OIr3N5tVTxKHrbpkaB7RSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35332834"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35332834"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 19:39:59 -0800
X-CSE-ConnectionGUID: ropk4I/0Txm8geGGAywkww==
X-CSE-MsgGUID: 0gR9h2VNRRSSFdAUvsT0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98502002"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2024 19:39:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOqLC-0001uZ-1q;
	Sat, 21 Dec 2024 03:39:46 +0000
Date: Sat, 21 Dec 2024 11:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/bridge: display-connector: implement the error
 path of .probe()
Message-ID: <202412211150.heCXmLwf-lkp@intel.com>
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
In-Reply-To: <20241214012652.2104807-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241214012652.2104807-1-joe@pf.is.s.u-tokyo.ac.jp>
TO: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
TO: andrzej.hajda@intel.com
TO: neil.armstrong@linaro.org
TO: rfoss@kernel.org
TO: Laurent.pinchart@ideasonboard.com
TO: jonas@kwiboo.se
TO: jernej.skrabec@gmail.com
TO: maarten.lankhorst@linux.intel.com
TO: mripard@kernel.org
TO: tzimmermann@suse.de
TO: airlied@gmail.com
TO: simona@ffwll.ch
CC: dri-devel@lists.freedesktop.org
CC: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Hi Joe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on drm-misc/drm-misc-next v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Hattori/drm-bridge-display-connector-implement-the-error-path-of-probe/20241214-230605
base:   linus/master
patch link:    https://lore.kernel.org/r/20241214012652.2104807-1-joe%40pf.is.s.u-tokyo.ac.jp
patch subject: [PATCH v2] drm/bridge: display-connector: implement the error path of .probe()
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20241220 (https://download.01.org/0day-ci/archive/20241221/202412211150.heCXmLwf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412211150.heCXmLwf-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/display-connector.c:397 display_connector_probe() error: uninitialized symbol 'ret'.

vim +/ret +397 drivers/gpu/drm/bridge/display-connector.c

6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  204  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  205  static int display_connector_probe(struct platform_device *pdev)
0c275c30176b2e7 Laurent Pinchart     2020-02-26  206  {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  207  	struct display_connector *conn;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  208  	unsigned int type;
189723fbe9aca18 Dan Carpenter        2021-10-13  209  	const char *label = NULL;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  210  	int ret;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  211  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  212  	conn = devm_kzalloc(&pdev->dev, sizeof(*conn), GFP_KERNEL);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  213  	if (!conn)
0c275c30176b2e7 Laurent Pinchart     2020-02-26  214  		return -ENOMEM;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  215  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  216  	platform_set_drvdata(pdev, conn);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  217  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  218  	type = (uintptr_t)of_device_get_match_data(&pdev->dev);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  219  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  220  	/* Get the exact connector type. */
0c275c30176b2e7 Laurent Pinchart     2020-02-26  221  	switch (type) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  222  	case DRM_MODE_CONNECTOR_DVII: {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  223  		bool analog, digital;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  224  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  225  		analog = of_property_read_bool(pdev->dev.of_node, "analog");
0c275c30176b2e7 Laurent Pinchart     2020-02-26  226  		digital = of_property_read_bool(pdev->dev.of_node, "digital");
0c275c30176b2e7 Laurent Pinchart     2020-02-26  227  		if (analog && !digital) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  228  			conn->bridge.type = DRM_MODE_CONNECTOR_DVIA;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  229  		} else if (!analog && digital) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  230  			conn->bridge.type = DRM_MODE_CONNECTOR_DVID;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  231  		} else if (analog && digital) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  232  			conn->bridge.type = DRM_MODE_CONNECTOR_DVII;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  233  		} else {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  234  			dev_err(&pdev->dev, "DVI connector with no type\n");
0c275c30176b2e7 Laurent Pinchart     2020-02-26  235  			return -EINVAL;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  236  		}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  237  		break;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  238  	}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  239  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  240  	case DRM_MODE_CONNECTOR_HDMIA: {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  241  		const char *hdmi_type;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  242  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  243  		ret = of_property_read_string(pdev->dev.of_node, "type",
0c275c30176b2e7 Laurent Pinchart     2020-02-26  244  					      &hdmi_type);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  245  		if (ret < 0) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  246  			dev_err(&pdev->dev, "HDMI connector with no type\n");
0c275c30176b2e7 Laurent Pinchart     2020-02-26  247  			return -EINVAL;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  248  		}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  249  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  250  		if (!strcmp(hdmi_type, "a") || !strcmp(hdmi_type, "c") ||
0c275c30176b2e7 Laurent Pinchart     2020-02-26  251  		    !strcmp(hdmi_type, "d") || !strcmp(hdmi_type, "e")) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  252  			conn->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  253  		} else if (!strcmp(hdmi_type, "b")) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  254  			conn->bridge.type = DRM_MODE_CONNECTOR_HDMIB;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  255  		} else {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  256  			dev_err(&pdev->dev,
0c275c30176b2e7 Laurent Pinchart     2020-02-26  257  				"Unsupported HDMI connector type '%s'\n",
0c275c30176b2e7 Laurent Pinchart     2020-02-26  258  				hdmi_type);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  259  			return -EINVAL;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  260  		}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  261  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  262  		break;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  263  	}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  264  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  265  	default:
0c275c30176b2e7 Laurent Pinchart     2020-02-26  266  		conn->bridge.type = type;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  267  		break;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  268  	}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  269  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  270  	/* All the supported connector types support interlaced modes. */
0c275c30176b2e7 Laurent Pinchart     2020-02-26  271  	conn->bridge.interlace_allowed = true;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  272  
d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  273  	if (type == DRM_MODE_CONNECTOR_HDMIA ||
d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  274  	    type == DRM_MODE_CONNECTOR_DisplayPort)
d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  275  		conn->bridge.ycbcr_420_allowed = true;
d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  276  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  277  	/* Get the optional connector label. */
0c275c30176b2e7 Laurent Pinchart     2020-02-26  278  	of_property_read_string(pdev->dev.of_node, "label", &label);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  279  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  280  	/*
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  281  	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can provide
0c275c30176b2e7 Laurent Pinchart     2020-02-26  282  	 * edge interrupts, register an interrupt handler.
0c275c30176b2e7 Laurent Pinchart     2020-02-26  283  	 */
0c275c30176b2e7 Laurent Pinchart     2020-02-26  284  	if (type == DRM_MODE_CONNECTOR_DVII ||
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  285  	    type == DRM_MODE_CONNECTOR_HDMIA ||
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  286  	    type == DRM_MODE_CONNECTOR_DisplayPort) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  287  		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
0c275c30176b2e7 Laurent Pinchart     2020-02-26  288  							 GPIOD_IN);
ed8f4e1002781c4 Ye Xingchen          2023-03-22  289  		if (IS_ERR(conn->hpd_gpio))
ed8f4e1002781c4 Ye Xingchen          2023-03-22  290  			return dev_err_probe(&pdev->dev, PTR_ERR(conn->hpd_gpio),
0c275c30176b2e7 Laurent Pinchart     2020-02-26  291  					     "Unable to retrieve HPD GPIO\n");
0c275c30176b2e7 Laurent Pinchart     2020-02-26  292  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  293  		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  294  	} else {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  295  		conn->hpd_irq = -EINVAL;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  296  	}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  297  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  298  	if (conn->hpd_irq >= 0) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  299  		ret = devm_request_threaded_irq(&pdev->dev, conn->hpd_irq,
0c275c30176b2e7 Laurent Pinchart     2020-02-26  300  						NULL, display_connector_hpd_irq,
0c275c30176b2e7 Laurent Pinchart     2020-02-26  301  						IRQF_TRIGGER_RISING |
0c275c30176b2e7 Laurent Pinchart     2020-02-26  302  						IRQF_TRIGGER_FALLING |
0c275c30176b2e7 Laurent Pinchart     2020-02-26  303  						IRQF_ONESHOT,
0c275c30176b2e7 Laurent Pinchart     2020-02-26  304  						"HPD", conn);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  305  		if (ret) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  306  			dev_info(&pdev->dev,
0c275c30176b2e7 Laurent Pinchart     2020-02-26  307  				 "Failed to request HPD edge interrupt, falling back to polling\n");
0c275c30176b2e7 Laurent Pinchart     2020-02-26  308  			conn->hpd_irq = -EINVAL;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  309  		}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  310  	}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  311  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  312  	/* Retrieve the DDC I2C adapter for DVI, HDMI and VGA connectors. */
0c275c30176b2e7 Laurent Pinchart     2020-02-26  313  	if (type == DRM_MODE_CONNECTOR_DVII ||
0c275c30176b2e7 Laurent Pinchart     2020-02-26  314  	    type == DRM_MODE_CONNECTOR_HDMIA ||
0c275c30176b2e7 Laurent Pinchart     2020-02-26  315  	    type == DRM_MODE_CONNECTOR_VGA) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  316  		struct device_node *phandle;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  317  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  318  		phandle = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  319  		if (phandle) {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  320  			conn->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  321  			of_node_put(phandle);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  322  			if (!conn->bridge.ddc)
0c275c30176b2e7 Laurent Pinchart     2020-02-26  323  				return -EPROBE_DEFER;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  324  		} else {
0c275c30176b2e7 Laurent Pinchart     2020-02-26  325  			dev_dbg(&pdev->dev,
0c275c30176b2e7 Laurent Pinchart     2020-02-26  326  				"No I2C bus specified, disabling EDID readout\n");
0c275c30176b2e7 Laurent Pinchart     2020-02-26  327  		}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  328  	}
0c275c30176b2e7 Laurent Pinchart     2020-02-26  329  
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  330  	/* Get the DP PWR for DP connector. */
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  331  	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  332  		int ret;
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  333  
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  334  		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
a7afd1756ad7c06 Joe Hattori          2024-12-14  335  		if (ret < 0) {
a7afd1756ad7c06 Joe Hattori          2024-12-14  336  			ret = dev_err_probe(&pdev->dev, ret,
a7afd1756ad7c06 Joe Hattori          2024-12-14  337  					    "failed to get DP PWR regulator\n");
a7afd1756ad7c06 Joe Hattori          2024-12-14  338  			goto err_put;
a7afd1756ad7c06 Joe Hattori          2024-12-14  339  		}
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  340  	}
2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  341  
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  342  	/* enable DDC */
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  343  	if (type == DRM_MODE_CONNECTOR_HDMIA) {
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  344  		int ret;
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  345  
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  346  		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  347  						       GPIOD_OUT_HIGH);
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  348  
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  349  		if (IS_ERR(conn->ddc_en)) {
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  350  			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
a7afd1756ad7c06 Joe Hattori          2024-12-14  351  			ret = PTR_ERR(conn->ddc_en);
a7afd1756ad7c06 Joe Hattori          2024-12-14  352  			goto err_put;
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  353  		}
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  354  
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  355  		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
a7afd1756ad7c06 Joe Hattori          2024-12-14  356  		if (ret < 0) {
a7afd1756ad7c06 Joe Hattori          2024-12-14  357  			ret = dev_err_probe(
a7afd1756ad7c06 Joe Hattori          2024-12-14  358  				&pdev->dev, ret,
a7afd1756ad7c06 Joe Hattori          2024-12-14  359  				"failed to get HDMI +5V Power regulator\n");
a7afd1756ad7c06 Joe Hattori          2024-12-14  360  			goto err_put;
a7afd1756ad7c06 Joe Hattori          2024-12-14  361  		}
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  362  	}
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  363  
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  364  	if (conn->supply) {
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  365  		ret = regulator_enable(conn->supply);
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  366  		if (ret) {
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  367  			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
a7afd1756ad7c06 Joe Hattori          2024-12-14  368  			goto err_put;
6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  369  		}
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  370  	}
6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  371  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  372  	conn->bridge.funcs = &display_connector_bridge_funcs;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  373  	conn->bridge.of_node = pdev->dev.of_node;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  374  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  375  	if (conn->bridge.ddc)
0c275c30176b2e7 Laurent Pinchart     2020-02-26  376  		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
0c275c30176b2e7 Laurent Pinchart     2020-02-26  377  				 |  DRM_BRIDGE_OP_DETECT;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  378  	if (conn->hpd_gpio)
0c275c30176b2e7 Laurent Pinchart     2020-02-26  379  		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  380  	if (conn->hpd_irq >= 0)
0c275c30176b2e7 Laurent Pinchart     2020-02-26  381  		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  382  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  383  	dev_dbg(&pdev->dev,
0c275c30176b2e7 Laurent Pinchart     2020-02-26  384  		"Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
0c275c30176b2e7 Laurent Pinchart     2020-02-26  385  		drm_get_connector_type_name(conn->bridge.type),
0c275c30176b2e7 Laurent Pinchart     2020-02-26  386  		label ? label : "<unlabelled>",
0c275c30176b2e7 Laurent Pinchart     2020-02-26  387  		conn->bridge.ddc ? "with" : "without",
0c275c30176b2e7 Laurent Pinchart     2020-02-26  388  		conn->hpd_gpio ? "with" : "without",
0c275c30176b2e7 Laurent Pinchart     2020-02-26  389  		conn->bridge.ops);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  390  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  391  	drm_bridge_add(&conn->bridge);
0c275c30176b2e7 Laurent Pinchart     2020-02-26  392  
0c275c30176b2e7 Laurent Pinchart     2020-02-26  393  	return 0;
a7afd1756ad7c06 Joe Hattori          2024-12-14  394  
a7afd1756ad7c06 Joe Hattori          2024-12-14  395  err_put:
a7afd1756ad7c06 Joe Hattori          2024-12-14  396  	i2c_put_adapter(conn->bridge.ddc);
a7afd1756ad7c06 Joe Hattori          2024-12-14 @397  	return ret;
0c275c30176b2e7 Laurent Pinchart     2020-02-26  398  }
0c275c30176b2e7 Laurent Pinchart     2020-02-26  399  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
