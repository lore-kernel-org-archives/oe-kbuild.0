Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328B1113
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Apr 2024 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711953764; cv=none; b=YHWo0G8R2boxRT/A0/kOQjr8IcXKyfmA3iV7kM4Z8R6jGc7yRkNUtVgCh1Dcg+VJea+heFOEl/kqLoQZ7RcEQHAPdSLTNAN9s8JH1sLhuQSpRzQOSXJp1ffjdxAe9hl9TBcTsT2IZeLgbjBTK/MNDU14N2emW25WnTDaW7xpSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711953764; c=relaxed/simple;
	bh=4j1Wo/0QABPn89g1h4PosLwpHFzh71LlSHEizIYWTsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iHAdDMFAoOMaj8T7TaeuG08BvJ3LlkxPWyQjFITx9S0Jc6Wz21T3nCpUD3tdtDXBFPD1vESF++qWtXv1p2tEa6DVLdbooS303QKFb2Q3LNwaHVP9UIMEQH3QMiXiN18iRBK6szw6YALEwWHXDuSI0Vqhcl5Tobe2opPMPQCeazo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZY7M4Bpm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZY7M4Bpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711953761; x=1743489761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4j1Wo/0QABPn89g1h4PosLwpHFzh71LlSHEizIYWTsg=;
  b=ZY7M4BpmKG6fwLbQYh1QdOTxrl9Y07vsrma9gwdQ0Hu82KVNoh2ccmFn
   BwukVjaj/wx+dLPPbIHcr/0DtHg6un63qmrkp+uU0B7cHoOg8xg0KD6NU
   HAa+YgKIkgCtqzIj5fGCYBiiHuABtfDkIdlZyDYwe6GNmlNJa9LYAetgm
   H65fsjTBkmt8+wfjOXt+1HT0Eb/9bmbUwjkst6i1LI2p3rN7PEp537xah
   nZ/4diQOP+Dt8bBO/C5tP3sIIAlo+2+9uN6A5FQiMatNO9zsbaBtEO2Ql
   1oDPEqNMlFUkNem9k8x6iJj174WjO/fOdX4CdgyqYcrMiakKl54MQj+Hx
   g==;
X-CSE-ConnectionGUID: 5q4Kf3NTSje04qYDW6LA1Q==
X-CSE-MsgGUID: ddi0jwIMTp2HvD48fIeIFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7007193"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="7007193"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 23:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17699470"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2024 23:42:38 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrBN3-00006K-09;
	Mon, 01 Apr 2024 06:42:24 +0000
Date: Mon, 1 Apr 2024 14:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 22/23] drivers: media: i2c: imx258: Add support for
 powerdown gpio
Message-ID: <202404011425.PVKV9Lf1-lkp@intel.com>
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
In-Reply-To: <20240327231710.53188-23-git@luigi311.com>
References: <20240327231710.53188-23-git@luigi311.com>
TO: git@luigi311.com
TO: linux-media@vger.kernel.org
CC: dave.stevenson@raspberrypi.com
CC: jacopo.mondi@ideasonboard.com
CC: mchehab@kernel.org
CC: robh@kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: conor+dt@kernel.org
CC: shawnguo@kernel.org
CC: s.hauer@pengutronix.de
CC: kernel@pengutronix.de
CC: festevam@gmail.com
CC: sakari.ailus@linux.intel.com
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Luigi311 <git@luigi311.com>
CC: Ondrej Jirman <megi@xff.cz>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master v6.9-rc2 next-20240328]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/git-luigi311-com/media-i2c-imx258-Remove-unused-defines/20240328-072629
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240327231710.53188-23-git%40luigi311.com
patch subject: [PATCH 22/23] drivers: media: i2c: imx258: Add support for powerdown gpio
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240401/202404011425.PVKV9Lf1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404011425.PVKV9Lf1-lkp@intel.com/

smatch warnings:
drivers/media/i2c/imx258.c:1562 imx258_probe() warn: missing unwind goto?

vim +1562 drivers/media/i2c/imx258.c

d3773094af21c9 Dave Stevenson      2024-03-27  1476  
e4802cb00bfe3d Jason Chen          2018-05-02  1477  static int imx258_probe(struct i2c_client *client)
e4802cb00bfe3d Jason Chen          2018-05-02  1478  {
e4802cb00bfe3d Jason Chen          2018-05-02  1479  	struct imx258 *imx258;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1480  	struct fwnode_handle *endpoint;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1481  	struct v4l2_fwnode_endpoint ep = {
786d2ad50b9b49 Dave Stevenson      2024-03-27  1482  		.bus_type = V4L2_MBUS_CSI2_DPHY
786d2ad50b9b49 Dave Stevenson      2024-03-27  1483  	};
e4802cb00bfe3d Jason Chen          2018-05-02  1484  	int ret;
e4802cb00bfe3d Jason Chen          2018-05-02  1485  	u32 val = 0;
e4802cb00bfe3d Jason Chen          2018-05-02  1486  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1487  	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1488  	if (!imx258)
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1489  		return -ENOMEM;
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1490  
d3773094af21c9 Dave Stevenson      2024-03-27  1491  	ret = imx258_get_regulators(imx258, client);
d3773094af21c9 Dave Stevenson      2024-03-27  1492  	if (ret)
d3773094af21c9 Dave Stevenson      2024-03-27  1493  		return dev_err_probe(&client->dev, ret,
d3773094af21c9 Dave Stevenson      2024-03-27  1494  				     "failed to get regulators\n");
d3773094af21c9 Dave Stevenson      2024-03-27  1495  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1496  	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
d170b0ea176098 Sakari Ailus        2021-08-16  1497  	if (IS_ERR(imx258->clk))
d170b0ea176098 Sakari Ailus        2021-08-16  1498  		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
d170b0ea176098 Sakari Ailus        2021-08-16  1499  				     "error getting clock\n");
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1500  	if (!imx258->clk) {
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1501  		dev_dbg(&client->dev,
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1502  			"no clock provided, using clock-frequency property\n");
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1503  
e4802cb00bfe3d Jason Chen          2018-05-02  1504  		device_property_read_u32(&client->dev, "clock-frequency", &val);
d170b0ea176098 Sakari Ailus        2021-08-16  1505  	} else {
d170b0ea176098 Sakari Ailus        2021-08-16  1506  		val = clk_get_rate(imx258->clk);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1507  	}
8bde18cb296d0e Dave Stevenson      2024-03-27  1508  
8bde18cb296d0e Dave Stevenson      2024-03-27  1509  	switch (val) {
8bde18cb296d0e Dave Stevenson      2024-03-27  1510  	case 19200000:
8bde18cb296d0e Dave Stevenson      2024-03-27  1511  		imx258->link_freq_configs = link_freq_configs_19_2;
8bde18cb296d0e Dave Stevenson      2024-03-27  1512  		imx258->link_freq_menu_items = link_freq_menu_items_19_2;
8bde18cb296d0e Dave Stevenson      2024-03-27  1513  		break;
8bde18cb296d0e Dave Stevenson      2024-03-27  1514  	case 24000000:
8bde18cb296d0e Dave Stevenson      2024-03-27  1515  		imx258->link_freq_configs = link_freq_configs_24;
8bde18cb296d0e Dave Stevenson      2024-03-27  1516  		imx258->link_freq_menu_items = link_freq_menu_items_24;
8bde18cb296d0e Dave Stevenson      2024-03-27  1517  		break;
8bde18cb296d0e Dave Stevenson      2024-03-27  1518  	default:
8bde18cb296d0e Dave Stevenson      2024-03-27  1519  		dev_err(&client->dev, "input clock frequency of %u not supported\n",
8bde18cb296d0e Dave Stevenson      2024-03-27  1520  			val);
e4802cb00bfe3d Jason Chen          2018-05-02  1521  		return -EINVAL;
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1522  	}
e4802cb00bfe3d Jason Chen          2018-05-02  1523  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1524  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1525  	if (!endpoint) {
786d2ad50b9b49 Dave Stevenson      2024-03-27  1526  		dev_err(&client->dev, "Endpoint node not found\n");
786d2ad50b9b49 Dave Stevenson      2024-03-27  1527  		return -EINVAL;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1528  	}
786d2ad50b9b49 Dave Stevenson      2024-03-27  1529  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1530  	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1531  	fwnode_handle_put(endpoint);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1532  	if (ret) {
786d2ad50b9b49 Dave Stevenson      2024-03-27  1533  		dev_err(&client->dev, "Parsing endpoint node failed\n");
786d2ad50b9b49 Dave Stevenson      2024-03-27  1534  		return ret;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1535  	}
786d2ad50b9b49 Dave Stevenson      2024-03-27  1536  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1537  	/* Get number of data lanes */
a42d61a239fac8 Dave Stevenson      2024-03-27  1538  	switch (ep.bus.mipi_csi2.num_data_lanes) {
a42d61a239fac8 Dave Stevenson      2024-03-27  1539  	case 2:
a42d61a239fac8 Dave Stevenson      2024-03-27  1540  		imx258->lane_mode_idx = IMX258_2_LANE_MODE;
a42d61a239fac8 Dave Stevenson      2024-03-27  1541  		break;
a42d61a239fac8 Dave Stevenson      2024-03-27  1542  	case 4:
a42d61a239fac8 Dave Stevenson      2024-03-27  1543  		imx258->lane_mode_idx = IMX258_4_LANE_MODE;
a42d61a239fac8 Dave Stevenson      2024-03-27  1544  		break;
a42d61a239fac8 Dave Stevenson      2024-03-27  1545  	default:
786d2ad50b9b49 Dave Stevenson      2024-03-27  1546  		dev_err(&client->dev, "Invalid data lanes: %u\n",
a42d61a239fac8 Dave Stevenson      2024-03-27  1547  			ep.bus.mipi_csi2.num_data_lanes);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1548  		ret = -EINVAL;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1549  		goto error_endpoint_free;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1550  	}
786d2ad50b9b49 Dave Stevenson      2024-03-27  1551  
7db096053387db Dave Stevenson      2024-03-27  1552  	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
7db096053387db Dave Stevenson      2024-03-27  1553  
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1554  	imx258->variant_cfg = of_device_get_match_data(&client->dev);
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1555  	if (!imx258->variant_cfg)
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1556  		imx258->variant_cfg = &imx258_cfg;
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1557  
8a1906e91c0093 Luigi311            2024-03-27  1558  	/* request optional power down pin */
8a1906e91c0093 Luigi311            2024-03-27  1559  	imx258->powerdown_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
8a1906e91c0093 Luigi311            2024-03-27  1560  						    GPIOD_OUT_HIGH);
8a1906e91c0093 Luigi311            2024-03-27  1561  	if (IS_ERR(imx258->powerdown_gpio))
8a1906e91c0093 Luigi311            2024-03-27 @1562  		return PTR_ERR(imx258->powerdown_gpio);
8a1906e91c0093 Luigi311            2024-03-27  1563  
e4802cb00bfe3d Jason Chen          2018-05-02  1564  	/* Initialize subdev */
e4802cb00bfe3d Jason Chen          2018-05-02  1565  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
e4802cb00bfe3d Jason Chen          2018-05-02  1566  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1567  	/* Will be powered off via pm_runtime_idle */
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1568  	ret = imx258_power_on(&client->dev);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1569  	if (ret)
786d2ad50b9b49 Dave Stevenson      2024-03-27  1570  		goto error_endpoint_free;
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1571  
e4802cb00bfe3d Jason Chen          2018-05-02  1572  	/* Check module identity */
e4802cb00bfe3d Jason Chen          2018-05-02  1573  	ret = imx258_identify_module(imx258);
e4802cb00bfe3d Jason Chen          2018-05-02  1574  	if (ret)
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1575  		goto error_identify;
e4802cb00bfe3d Jason Chen          2018-05-02  1576  
e4802cb00bfe3d Jason Chen          2018-05-02  1577  	/* Set default mode to max resolution */
e4802cb00bfe3d Jason Chen          2018-05-02  1578  	imx258->cur_mode = &supported_modes[0];
e4802cb00bfe3d Jason Chen          2018-05-02  1579  
e4802cb00bfe3d Jason Chen          2018-05-02  1580  	ret = imx258_init_controls(imx258);
e4802cb00bfe3d Jason Chen          2018-05-02  1581  	if (ret)
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1582  		goto error_identify;
e4802cb00bfe3d Jason Chen          2018-05-02  1583  
e4802cb00bfe3d Jason Chen          2018-05-02  1584  	/* Initialize subdev */
e4802cb00bfe3d Jason Chen          2018-05-02  1585  	imx258->sd.internal_ops = &imx258_internal_ops;
e4802cb00bfe3d Jason Chen          2018-05-02  1586  	imx258->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
e4802cb00bfe3d Jason Chen          2018-05-02  1587  	imx258->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
e4802cb00bfe3d Jason Chen          2018-05-02  1588  
e4802cb00bfe3d Jason Chen          2018-05-02  1589  	/* Initialize source pad */
e4802cb00bfe3d Jason Chen          2018-05-02  1590  	imx258->pad.flags = MEDIA_PAD_FL_SOURCE;
e4802cb00bfe3d Jason Chen          2018-05-02  1591  
e4802cb00bfe3d Jason Chen          2018-05-02  1592  	ret = media_entity_pads_init(&imx258->sd.entity, 1, &imx258->pad);
e4802cb00bfe3d Jason Chen          2018-05-02  1593  	if (ret)
e4802cb00bfe3d Jason Chen          2018-05-02  1594  		goto error_handler_free;
e4802cb00bfe3d Jason Chen          2018-05-02  1595  
15786f7b564eff Sakari Ailus        2021-03-05  1596  	ret = v4l2_async_register_subdev_sensor(&imx258->sd);
e4802cb00bfe3d Jason Chen          2018-05-02  1597  	if (ret < 0)
e4802cb00bfe3d Jason Chen          2018-05-02  1598  		goto error_media_entity;
e4802cb00bfe3d Jason Chen          2018-05-02  1599  
e4802cb00bfe3d Jason Chen          2018-05-02  1600  	pm_runtime_set_active(&client->dev);
e4802cb00bfe3d Jason Chen          2018-05-02  1601  	pm_runtime_enable(&client->dev);
e4802cb00bfe3d Jason Chen          2018-05-02  1602  	pm_runtime_idle(&client->dev);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1603  	v4l2_fwnode_endpoint_free(&ep);
e4802cb00bfe3d Jason Chen          2018-05-02  1604  
e4802cb00bfe3d Jason Chen          2018-05-02  1605  	return 0;
e4802cb00bfe3d Jason Chen          2018-05-02  1606  
e4802cb00bfe3d Jason Chen          2018-05-02  1607  error_media_entity:
e4802cb00bfe3d Jason Chen          2018-05-02  1608  	media_entity_cleanup(&imx258->sd.entity);
e4802cb00bfe3d Jason Chen          2018-05-02  1609  
e4802cb00bfe3d Jason Chen          2018-05-02  1610  error_handler_free:
e4802cb00bfe3d Jason Chen          2018-05-02  1611  	imx258_free_controls(imx258);
e4802cb00bfe3d Jason Chen          2018-05-02  1612  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1613  error_identify:
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1614  	imx258_power_off(&client->dev);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1615  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1616  error_endpoint_free:
786d2ad50b9b49 Dave Stevenson      2024-03-27  1617  	v4l2_fwnode_endpoint_free(&ep);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1618  
e4802cb00bfe3d Jason Chen          2018-05-02  1619  	return ret;
e4802cb00bfe3d Jason Chen          2018-05-02  1620  }
e4802cb00bfe3d Jason Chen          2018-05-02  1621  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
