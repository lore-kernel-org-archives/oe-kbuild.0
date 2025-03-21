Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848FD13635C
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Mar 2025 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574956; cv=none; b=eaKm4END3n2MJzFUDLP6Wgkqr7EBqGWzCFwjpRAzBxbGXLb6L3x3aqX+9W5+hMEliIba0h1FiRw1vBnrV958bPze6murwIm78Em4tLKJXNV3cIZobFC9l8tVBJFtGnD4NbfREnJ8LFG+EGolkedvAxvqycMJ7yTLfFP9TFeygrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574956; c=relaxed/simple;
	bh=CW45+DK442vjvTC20/su25pqWHzZnT5wQP3zfsoiWm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPKIk9bF2fbHhQDYu80VU3qSuRkAF9025OI1FmbSUxvQpxMO9PpJOQehdc/Yt/Bv+LKZRESl8bE4PZaK6PbAfDSvzAxeRl0nI+k4kJcM5E8c2TxpJlEQU775x27Hui744APQQuI8Wo/+4KU/PqcZ2KXprOP61cWnborDlXarguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJZx/dYE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJZx/dYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742574955; x=1774110955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CW45+DK442vjvTC20/su25pqWHzZnT5wQP3zfsoiWm4=;
  b=XJZx/dYEyqYZsvcpy8Kg+y87IV1FJBiWKpWSvOzT1RNggK1KhLXFJNaV
   OzScC+7q7AnjPvrYvk3edskoXvtny5yjUNX904/GgZs6kheqvT/U0KJVs
   2moyWsWp2nu/Ah34F+f6X2PW2rsWhyGolEUHeyaXfGsaeUgZvDASRpEec
   a8f5FRGk2f1GZvYezrpey8kdvHOVZr9LOKld43kpD5KU6j+W16+vn3IIi
   p5BFAus16bnigfsdB4xwSXtk9l+jrpuuwIzNiLgOtiSkACE6J4isg5lWE
   vx2vy9ZiGbimTFo/ES7kvVltCxz42rgEMJERxLmQucJnTtkqYmwfzBkab
   A==;
X-CSE-ConnectionGUID: CAaGue63QTGYIvxu/UKRlw==
X-CSE-MsgGUID: /LWL41Z2TtqH0sCCe3G6yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47724576"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="47724576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 09:35:54 -0700
X-CSE-ConnectionGUID: 9cbJsn0ASC+IIM5cbKsKvw==
X-CSE-MsgGUID: IhlKWQghSqCHiPCldFcCWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="128558319"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2025 09:35:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvfLW-0001Un-1E;
	Fri, 21 Mar 2025 16:35:47 +0000
Date: Sat, 22 Mar 2025 00:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/8] media: i2c: add OV02E10 image sensor driver
Message-ID: <202503220055.pt1r9P7M-lkp@intel.com>
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
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889@linaro.org>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889@linaro.org>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
CC: Jingjing Xiong <jingjing.xiong@intel.com>
CC: Hao Yao <hao.yao@intel.com>
CC: Jim Lai <jim.lai@intel.com>
CC: "You-Sheng Yang" <vicamo.yang@canonical.com>
CC: Alan Stern <stern@rowland.harvard.edu>
CC: Hans de Goede <hdegoede@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>

Hi Bryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f2151613e040973c868d28c8b00885dfab69eb75]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/media-i2c-add-OV02E10-image-sensor-driver/20250317-084316
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889%40linaro.org
patch subject: [PATCH 1/8] media: i2c: add OV02E10 image sensor driver
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503220055.pt1r9P7M-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503220055.pt1r9P7M-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov02e10.c:903 ov02e10_probe() warn: missing unwind goto?

vim +903 drivers/media/i2c/ov02e10.c

62323d3b3c4dc1 Jingjing Xiong 2025-03-17  861  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  862  static int ov02e10_probe(struct i2c_client *client)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  863  {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  864  	struct ov02e10 *ov02e;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  865  	int ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  866  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  867  	/* Check HW config */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  868  	ret = ov02e10_check_hwcfg(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  869  	if (ret)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  870  		return ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  871  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  872  	ov02e = devm_kzalloc(&client->dev, sizeof(*ov02e), GFP_KERNEL);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  873  	if (!ov02e)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  874  		return -ENOMEM;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  875  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  876  	/* Initialize subdev */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  877  	ov02e->regmap = devm_cci_regmap_init_i2c(client, 8);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  878  	if (IS_ERR(ov02e->regmap))
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  879  		return PTR_ERR(ov02e->regmap);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  880  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  881  	v4l2_i2c_subdev_init(&ov02e->sd, client, &ov02e10_subdev_ops);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  882  	ov02e10_get_pm_resources(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  883  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  884  	ret = ov02e10_power_on(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  885  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  886  		dev_err_probe(&client->dev, ret, "failed to power on\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  887  		goto error_power_off;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  888  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  889  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  890  	/* Check module identity */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  891  	ret = ov02e10_identify_module(ov02e);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  892  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  893  		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  894  		goto error_power_off;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  895  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  896  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  897  	/* Set default mode to max resolution */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  898  	ov02e->cur_mode = &supported_modes[0];
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  899  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  900  	dev_dbg(&client->dev, "will Init controls\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  901  	ret = ov02e10_init_controls(ov02e);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  902  	if (ret)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17 @903  		return ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  904  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  905  	/* Initialize subdev */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  906  	ov02e->sd.internal_ops = &ov02e10_internal_ops;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  907  	ov02e->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  908  	ov02e->sd.entity.ops = &ov02e10_subdev_entity_ops;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  909  	ov02e->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  910  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  911  	/* Initialize source pad */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  912  	ov02e->pad.flags = MEDIA_PAD_FL_SOURCE;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  913  	ret = media_entity_pads_init(&ov02e->sd.entity, 1, &ov02e->pad);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  914  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  915  		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  916  		goto error_handler_free;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  917  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  918  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  919  	ret = v4l2_async_register_subdev_sensor(&ov02e->sd);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  920  	if (ret < 0) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  921  		dev_err(&client->dev, "async reg subdev error\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  922  		goto error_media_entity;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  923  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  924  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  925  	/*
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  926  	 * Device is already turned on by i2c-core with ACPI domain PM.
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  927  	 * Enable runtime PM and turn off the device.
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  928  	 */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  929  	pm_runtime_set_active(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  930  	pm_runtime_enable(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  931  	pm_runtime_idle(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  932  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  933  	return 0;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  934  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  935  error_media_entity:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  936  	media_entity_cleanup(&ov02e->sd.entity);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  937  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  938  error_handler_free:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  939  	v4l2_ctrl_handler_free(ov02e->sd.ctrl_handler);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  940  	mutex_destroy(&ov02e->mutex);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  941  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  942  error_power_off:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  943  	ov02e10_power_off(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  944  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  945  	dev_dbg(&client->dev, "probe done\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  946  	return ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  947  }
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  948  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
