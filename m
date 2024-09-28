Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A2E185939
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727520078; cv=none; b=M13CWho/mflCpmH1+WLlF5lDpPu1X9Fa4LrFbZtlL57tph4a3SLxNsqEw3FHaDCpFwLDcQ7fuz5w7hZnHdmW+4duUg+m4ranFVHASzjTUPgl7hjjFfACJcl7c4FbYu6NBi4GHEtQPvByGF5aVC9wEieqlaGgTlvb2z3nss0Qki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727520078; c=relaxed/simple;
	bh=v1yV4jW3R55ldM3TpBe/kwTpDOv2ZL/MfH4F7wJfimA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pFnIyqvf2pzyTsMAtfBkJEEE+3pTCqkbl2btO9y0W5ugKRyGwl4Gixq8o8F7VhNHbkHJJ9IDhbq/5EQ7u9fVl65IhRHswXYUlCqQhmIhDBHXS5svUPxVp8B49ky3hyBPmpxOEVgKKwT3y0Dw27DBhMivXFVs9ny0lri7Os4HtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTfcgYUG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTfcgYUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727520076; x=1759056076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1yV4jW3R55ldM3TpBe/kwTpDOv2ZL/MfH4F7wJfimA=;
  b=GTfcgYUGg/7odWdtvU3290mIbOz8RTeK4UqdImUEqPPzjG39+PCdSKyf
   ho8IWWwItx2ev6mR2iC2AocFEr0CnFnWofF7YY3nF/Cj99u7IdTBIrB0/
   fPUHZwCk0YGgGd0A5bkJ6xJ0l16f0U5m3dlskNwq0NrituVBHyHumv93u
   ZJKTxmBqGBty7b4i2yqI+E+vDjufhCfw2kKu2zMQt128btTNfB9eZXcBQ
   FQjLQ4WbYg2ZhRwa1eFlZHrhOz4KV/G7AsA6AvNAJpRpRh3TenFEgP4Tu
   jnvtTOnqrrKuWyaxmzWWpdrvGyebikTIVjW3ONaRSrS6lGhRzyYjfqlXU
   A==;
X-CSE-ConnectionGUID: 6DnJGfQAQv6MN27YgqW9Rw==
X-CSE-MsgGUID: BV8IVq4jRBKanJRCJdhrgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26792772"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26792772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:41:13 -0700
X-CSE-ConnectionGUID: c3tL90B5RXeaWa8DLO7HPA==
X-CSE-MsgGUID: VZkNzQk2TiSDqqI/br7fkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73084887"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 03:41:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUsv-000NBD-1s;
	Sat, 28 Sep 2024 10:41:09 +0000
Date: Sat, 28 Sep 2024 18:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [freescale-fslc:6.6-2.0.x-imx 515/16788]
 drivers/media/i2c/mt9m114.c:794 mt9m114_set_fmt() warn: inconsistent returns
 '&sensor->lock'.
Message-ID: <202409281825.DPhdYY5p-lkp@intel.com>
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
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f5eb071582415f1bb836a5f4c0740e51d4f17c83 [515/16788] LF-7052-04: media: i2c: add MT9M114 driver support for iMX93 platform
:::::: branch date: 3 days ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281825.DPhdYY5p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409281825.DPhdYY5p-lkp@intel.com/

smatch warnings:
drivers/media/i2c/mt9m114.c:794 mt9m114_set_fmt() warn: inconsistent returns '&sensor->lock'.
drivers/media/i2c/mt9m114.c:913 mt9m114_get_chip_id() warn: unsigned 'ret' is never less than zero.

vim +794 drivers/media/i2c/mt9m114.c

f5eb071582415f1 Guoniu.zhou 2022-06-13  767  
f5eb071582415f1 Guoniu.zhou 2022-06-13  768  static int mt9m114_set_fmt(struct v4l2_subdev *sd,
f5eb071582415f1 Guoniu.zhou 2022-06-13  769  			  struct v4l2_subdev_state *sd_state,
f5eb071582415f1 Guoniu.zhou 2022-06-13  770  			  struct v4l2_subdev_format *format)
f5eb071582415f1 Guoniu.zhou 2022-06-13  771  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  772  	struct mt9m114 *sensor = to_mt9m114(sd);
f5eb071582415f1 Guoniu.zhou 2022-06-13  773  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
f5eb071582415f1 Guoniu.zhou 2022-06-13  774  	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
f5eb071582415f1 Guoniu.zhou 2022-06-13  775  	const struct mt9m114_resolution *new_mode;
f5eb071582415f1 Guoniu.zhou 2022-06-13  776  
f5eb071582415f1 Guoniu.zhou 2022-06-13  777  	if (format->pad != 0)
f5eb071582415f1 Guoniu.zhou 2022-06-13  778  		return -EINVAL;
f5eb071582415f1 Guoniu.zhou 2022-06-13  779  
f5eb071582415f1 Guoniu.zhou 2022-06-13  780  	mutex_lock(&sensor->lock);
f5eb071582415f1 Guoniu.zhou 2022-06-13  781  	new_mode = mt9m114_find_mode(sensor, mbus_fmt->width, mbus_fmt->height);
f5eb071582415f1 Guoniu.zhou 2022-06-13  782  	if (!new_mode)
f5eb071582415f1 Guoniu.zhou 2022-06-13  783  	      return -EINVAL;
f5eb071582415f1 Guoniu.zhou 2022-06-13  784  
f5eb071582415f1 Guoniu.zhou 2022-06-13  785  	sensor->curr_mode = new_mode;
f5eb071582415f1 Guoniu.zhou 2022-06-13  786  	if (sensor->curr_mode != sensor->last_mode) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  787  		sensor->pending_mode_change = true;
f5eb071582415f1 Guoniu.zhou 2022-06-13  788  		memcpy(fmt, mbus_fmt, sizeof(*fmt));
f5eb071582415f1 Guoniu.zhou 2022-06-13  789  		fmt->width  = new_mode->hact;
f5eb071582415f1 Guoniu.zhou 2022-06-13  790  		fmt->height = new_mode->vact;
f5eb071582415f1 Guoniu.zhou 2022-06-13  791  	}
f5eb071582415f1 Guoniu.zhou 2022-06-13  792  
f5eb071582415f1 Guoniu.zhou 2022-06-13  793  	mutex_unlock(&sensor->lock);
f5eb071582415f1 Guoniu.zhou 2022-06-13 @794  	return 0;
f5eb071582415f1 Guoniu.zhou 2022-06-13  795  }
f5eb071582415f1 Guoniu.zhou 2022-06-13  796  
f5eb071582415f1 Guoniu.zhou 2022-06-13  797  static int mt9m114_enum_frame_size(struct v4l2_subdev *sd,
f5eb071582415f1 Guoniu.zhou 2022-06-13  798  				  struct v4l2_subdev_state *sd_state,
f5eb071582415f1 Guoniu.zhou 2022-06-13  799  				  struct v4l2_subdev_frame_size_enum *fse)
f5eb071582415f1 Guoniu.zhou 2022-06-13  800  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  801  	struct mt9m114 *sensor = to_mt9m114(sd);
f5eb071582415f1 Guoniu.zhou 2022-06-13  802  
f5eb071582415f1 Guoniu.zhou 2022-06-13  803  	if (fse->pad != 0)
f5eb071582415f1 Guoniu.zhou 2022-06-13  804  		return -EINVAL;
f5eb071582415f1 Guoniu.zhou 2022-06-13  805  
f5eb071582415f1 Guoniu.zhou 2022-06-13  806  	if (fse->index >= ARRAY_SIZE(mt9m114_resolutions))
f5eb071582415f1 Guoniu.zhou 2022-06-13  807  		return -EINVAL;
f5eb071582415f1 Guoniu.zhou 2022-06-13  808  
f5eb071582415f1 Guoniu.zhou 2022-06-13  809  	mutex_lock(&sensor->lock);
f5eb071582415f1 Guoniu.zhou 2022-06-13  810  	fse->min_width  = mt9m114_resolutions[fse->index].width;
f5eb071582415f1 Guoniu.zhou 2022-06-13  811  	fse->min_height = mt9m114_resolutions[fse->index].height;
f5eb071582415f1 Guoniu.zhou 2022-06-13  812  	fse->max_width  = mt9m114_resolutions[fse->index].width;
f5eb071582415f1 Guoniu.zhou 2022-06-13  813  	fse->max_height = mt9m114_resolutions[fse->index].height;
f5eb071582415f1 Guoniu.zhou 2022-06-13  814  	mutex_unlock(&sensor->lock);
f5eb071582415f1 Guoniu.zhou 2022-06-13  815  
f5eb071582415f1 Guoniu.zhou 2022-06-13  816  	return 0;
f5eb071582415f1 Guoniu.zhou 2022-06-13  817  }
f5eb071582415f1 Guoniu.zhou 2022-06-13  818  
f5eb071582415f1 Guoniu.zhou 2022-06-13  819  static const struct v4l2_subdev_pad_ops mt9m114_pad_ops = {
f5eb071582415f1 Guoniu.zhou 2022-06-13  820  	.enum_mbus_code  = mt9m114_enum_mbus_code,
f5eb071582415f1 Guoniu.zhou 2022-06-13  821  	.enum_frame_size = mt9m114_enum_frame_size,
f5eb071582415f1 Guoniu.zhou 2022-06-13  822  	.get_fmt         = mt9m114_get_fmt,
f5eb071582415f1 Guoniu.zhou 2022-06-13  823  	.set_fmt         = mt9m114_set_fmt,
f5eb071582415f1 Guoniu.zhou 2022-06-13  824  };
f5eb071582415f1 Guoniu.zhou 2022-06-13  825  
f5eb071582415f1 Guoniu.zhou 2022-06-13  826  static const struct v4l2_subdev_video_ops mt9m114_video_ops = {
f5eb071582415f1 Guoniu.zhou 2022-06-13  827  	.g_frame_interval = mt9m114_g_frame_interval,
f5eb071582415f1 Guoniu.zhou 2022-06-13  828  	.s_frame_interval = mt9m114_s_frame_interval,
f5eb071582415f1 Guoniu.zhou 2022-06-13  829  	.s_stream         = mt9m114_s_stream,
f5eb071582415f1 Guoniu.zhou 2022-06-13  830  };
f5eb071582415f1 Guoniu.zhou 2022-06-13  831  
f5eb071582415f1 Guoniu.zhou 2022-06-13  832  static const struct v4l2_subdev_ops mt9m114_subdev_ops = {
f5eb071582415f1 Guoniu.zhou 2022-06-13  833  	.core  = &mt9m114_core_ops,
f5eb071582415f1 Guoniu.zhou 2022-06-13  834  	.video = &mt9m114_video_ops,
f5eb071582415f1 Guoniu.zhou 2022-06-13  835  	.pad   = &mt9m114_pad_ops,
f5eb071582415f1 Guoniu.zhou 2022-06-13  836  };
f5eb071582415f1 Guoniu.zhou 2022-06-13  837  
f5eb071582415f1 Guoniu.zhou 2022-06-13  838  static int mt9m114_get_regulators(struct mt9m114 *sensor)
f5eb071582415f1 Guoniu.zhou 2022-06-13  839  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  840  	int i;
f5eb071582415f1 Guoniu.zhou 2022-06-13  841  
f5eb071582415f1 Guoniu.zhou 2022-06-13  842  	for (i = 0; i < MT9M114_NUM_SUPPLIES; i++)
f5eb071582415f1 Guoniu.zhou 2022-06-13  843  		sensor->supplies[i].supply = mt9m114_supply_name[i];
f5eb071582415f1 Guoniu.zhou 2022-06-13  844  
f5eb071582415f1 Guoniu.zhou 2022-06-13  845  	return devm_regulator_bulk_get(&sensor->i2c_client->dev,
f5eb071582415f1 Guoniu.zhou 2022-06-13  846  				       MT9M114_NUM_SUPPLIES,
f5eb071582415f1 Guoniu.zhou 2022-06-13  847  				       sensor->supplies);
f5eb071582415f1 Guoniu.zhou 2022-06-13  848  }
f5eb071582415f1 Guoniu.zhou 2022-06-13  849  
f5eb071582415f1 Guoniu.zhou 2022-06-13  850  static int mt9m114_set_power(struct mt9m114 *sensor, bool on)
f5eb071582415f1 Guoniu.zhou 2022-06-13  851  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  852  	struct i2c_client *client = sensor->i2c_client;
f5eb071582415f1 Guoniu.zhou 2022-06-13  853  	int ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  854  
f5eb071582415f1 Guoniu.zhou 2022-06-13  855  	if (on) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  856  		ret = regulator_bulk_enable(MT9M114_NUM_SUPPLIES, sensor->supplies);
f5eb071582415f1 Guoniu.zhou 2022-06-13  857  		if (ret < 0) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  858  			dev_err(&client->dev, "failed to enable regulators\n");
f5eb071582415f1 Guoniu.zhou 2022-06-13  859  			return ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  860  		}
f5eb071582415f1 Guoniu.zhou 2022-06-13  861  	} else {
f5eb071582415f1 Guoniu.zhou 2022-06-13  862  		ret = regulator_bulk_disable(MT9M114_NUM_SUPPLIES, sensor->supplies);
f5eb071582415f1 Guoniu.zhou 2022-06-13  863  		if (ret < 0) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  864  			dev_err(&client->dev, "failed to disable regulators\n");
f5eb071582415f1 Guoniu.zhou 2022-06-13  865  			return ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  866  		}
f5eb071582415f1 Guoniu.zhou 2022-06-13  867  	}
f5eb071582415f1 Guoniu.zhou 2022-06-13  868  	return 0;
f5eb071582415f1 Guoniu.zhou 2022-06-13  869  }
f5eb071582415f1 Guoniu.zhou 2022-06-13  870  
f5eb071582415f1 Guoniu.zhou 2022-06-13  871  static int mt9m114_get_gpios(struct mt9m114 *sensor)
f5eb071582415f1 Guoniu.zhou 2022-06-13  872  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  873  	struct device *dev = &sensor->i2c_client->dev;
f5eb071582415f1 Guoniu.zhou 2022-06-13  874  	struct gpio_desc *gpiod;
f5eb071582415f1 Guoniu.zhou 2022-06-13  875  	int ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  876  
f5eb071582415f1 Guoniu.zhou 2022-06-13  877  	/* request optional power down pin */
f5eb071582415f1 Guoniu.zhou 2022-06-13  878  	gpiod = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
f5eb071582415f1 Guoniu.zhou 2022-06-13  879  	if (IS_ERR(gpiod)) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  880  		ret = PTR_ERR(gpiod);
f5eb071582415f1 Guoniu.zhou 2022-06-13  881  		dev_err(dev, "fail to get power down pin, ret=%d\n", ret);
f5eb071582415f1 Guoniu.zhou 2022-06-13  882  		return ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  883  	}
f5eb071582415f1 Guoniu.zhou 2022-06-13  884  	sensor->pwdn_gpio = gpiod;
f5eb071582415f1 Guoniu.zhou 2022-06-13  885  
f5eb071582415f1 Guoniu.zhou 2022-06-13  886  	/* request optional reset pin */
f5eb071582415f1 Guoniu.zhou 2022-06-13  887  	gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
f5eb071582415f1 Guoniu.zhou 2022-06-13  888  	if (IS_ERR(gpiod)) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  889  		ret = PTR_ERR(gpiod);
f5eb071582415f1 Guoniu.zhou 2022-06-13  890  		dev_err(dev, "fail to get reset pin, ret=%d\n", ret);
f5eb071582415f1 Guoniu.zhou 2022-06-13  891  		return ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  892  	}
f5eb071582415f1 Guoniu.zhou 2022-06-13  893  	sensor->reset_gpio = gpiod;
f5eb071582415f1 Guoniu.zhou 2022-06-13  894  
f5eb071582415f1 Guoniu.zhou 2022-06-13  895  	return 0;
f5eb071582415f1 Guoniu.zhou 2022-06-13  896  }
f5eb071582415f1 Guoniu.zhou 2022-06-13  897  
f5eb071582415f1 Guoniu.zhou 2022-06-13  898  static void mt9m114_hw_reset(struct mt9m114 *sensor)
f5eb071582415f1 Guoniu.zhou 2022-06-13  899  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  900  	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
f5eb071582415f1 Guoniu.zhou 2022-06-13  901  	msleep(50);
f5eb071582415f1 Guoniu.zhou 2022-06-13  902  	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
f5eb071582415f1 Guoniu.zhou 2022-06-13  903  	msleep(45);
f5eb071582415f1 Guoniu.zhou 2022-06-13  904  }
f5eb071582415f1 Guoniu.zhou 2022-06-13  905  
f5eb071582415f1 Guoniu.zhou 2022-06-13  906  static int mt9m114_get_chip_id(struct mt9m114 *sensor)
f5eb071582415f1 Guoniu.zhou 2022-06-13  907  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  908  	struct i2c_client *client = sensor->i2c_client;
f5eb071582415f1 Guoniu.zhou 2022-06-13  909  	u32 ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  910  	u16 chip_id;
f5eb071582415f1 Guoniu.zhou 2022-06-13  911  
f5eb071582415f1 Guoniu.zhou 2022-06-13  912  	ret = mt9m114_read16(client, MT9M114_CHIP_ID, &chip_id);
f5eb071582415f1 Guoniu.zhou 2022-06-13 @913  	if (ret < 0) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  914  		v4l_err(client, "Failed to get chip id\n");
f5eb071582415f1 Guoniu.zhou 2022-06-13  915  		return -ENODEV;
f5eb071582415f1 Guoniu.zhou 2022-06-13  916  	}
f5eb071582415f1 Guoniu.zhou 2022-06-13  917  	if (chip_id != 0x2481) {
f5eb071582415f1 Guoniu.zhou 2022-06-13  918  		v4l_err(client, "chip id 0x%04x mismatch\n", chip_id);
f5eb071582415f1 Guoniu.zhou 2022-06-13  919  		return -ENODEV;
f5eb071582415f1 Guoniu.zhou 2022-06-13  920  	}
f5eb071582415f1 Guoniu.zhou 2022-06-13  921  	v4l_info(client, "chip found @ 0x%02x (%s)\n",
f5eb071582415f1 Guoniu.zhou 2022-06-13  922  		 client->addr << 1, client->adapter->name);
f5eb071582415f1 Guoniu.zhou 2022-06-13  923  
f5eb071582415f1 Guoniu.zhou 2022-06-13  924  	return 0;
f5eb071582415f1 Guoniu.zhou 2022-06-13  925  }
f5eb071582415f1 Guoniu.zhou 2022-06-13  926  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
