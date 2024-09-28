Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5281531D8
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 20:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727554513; cv=none; b=s8Ia9IfJRNxtRXu9foQuwcagRwRlYl0P3W/O2RHuHHptFeFfnZlkRqs7sTCF6M58R0p2JKfiHZnDcLtPtdUIxyilcoBZegV+iP5MhqrChLTt7J1UOIiRhEYz6Sd/5v7Kim+xy5oDyfo+XrYer6BmJ7zSJLgnM5LKdfD04lECo+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727554513; c=relaxed/simple;
	bh=/Dgki3q4gZ3dJXV7Rg/ZehxEn7KClaxP+pTYPq7pQZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUL8wKoRM8K9CNZIR5SPmBQSx4X/Cng6LT6WM5rl8gITh7OzXGmwV1en3soc/3CPc3Gne0b8pByXyJZYFWolqZj6gChubQlD5vYpSKJy/u4/8WU7NUXHZjjWuoGZ1ymv9Ur5XtC9O9vwYKJ4CZ0+arF069tkrNKtJqSTsWRkqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhPY0pJ5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhPY0pJ5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so26081815e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727554510; x=1728159310; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M17GoL7d+O0NDddGQBSTqbD6rLQRxBpQRjx5XUpnxOs=;
        b=bhPY0pJ5p50kIL6K6ZruJI0lb3bAIRfstbJFdEIFT2Tcun/HPJdnKSN8UGJyvJo3yA
         AteAS47PH/KiCXGkyoscP1h01u1P/+h+hNQ4wF8Qt/n2XsVPfMzEm/mGcAGBb9oFGkHG
         CzRrIiR5O+ZapfAgJZcGRRor4j0HP1MoAIKw0gOaB4elOwXopOGwQpupkMGQBm1wyCHc
         wikaitT9vBVZ8e1svNjNwROtjKqKHzFHoKqfNebnfxE3qWBonqwnPXF6g2Xh+sRF9xhl
         eU0PeTIq/YzQdycZMT4Sv78N+QD5GGGthaJVHaigrQhhuTQo3gbo2inVIIXA9lCBxCjO
         9QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727554510; x=1728159310;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M17GoL7d+O0NDddGQBSTqbD6rLQRxBpQRjx5XUpnxOs=;
        b=MgeYh7YgIKAK/HMiFBy8ZmYhR2NfaQH1rrSx5m/aeVkIW5hXVvW7hPxRtxU58BX6kU
         BEhnBihZSsC9cg71DZKyMFkoK3czqdpQ9gXikcPj+cgHsH3zYKclWXtrX404Z4m0R/U8
         xwB3hvodyZwxn1K8ZJ0+K6250soZdZ0S1p4R3pXaKnuoKVZ3yOhE8MFBoCD2WBUNNsLV
         q/Y2ozMtNpqOYsYoiHeN5s84h33Z0fRIJJ7DjQUFKEsRhGL90yah5JXBfWUK6AZUE6rT
         6UJzq7yNMcZ9yjHZR3EXvXh3UCjS4eXtq+l+9CssHDJMjry1cj0LupUE5iXXPdb0gtp9
         K2OQ==
X-Gm-Message-State: AOJu0YyoHzyD2PRWOzkwssfuLq7gz95ZHhyoDGnbl+ttYWhvWq7tG6AB
	zTPxEOjR8rUXAM6r0gjNCIiUqrn6+kzQCIiY+juZVCAysHm/TLXHEtvSRtLf2rrQOUmfZPHyr3S
	3
X-Google-Smtp-Source: AGHT+IFqG1hbvOQ56tO4m6yVzUKUFnR4vOmV9huyo9dUqY064yMzssnZq0JqsamjI7w0Sa3c/g7jbA==
X-Received: by 2002:a05:600c:3588:b0:42c:a72a:e8f4 with SMTP id 5b1f17b1804b1-42f58434d37mr54859055e9.14.1727554509537;
        Sat, 28 Sep 2024 13:15:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e2fe89sm60739265e9.40.2024.09.28.13.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 13:15:08 -0700 (PDT)
Date: Sat, 28 Sep 2024 23:15:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Otavio Salvador <otavio@ossystems.com.br>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 515/16788]
 drivers/media/i2c/mt9m114.c:794 mt9m114_set_fmt() warn: inconsistent returns
 '&sensor->lock'.
Message-ID: <33b00d5a-b14c-4ca8-815b-a3b6cab6de38@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f5eb071582415f1bb836a5f4c0740e51d4f17c83 [515/16788] LF-7052-04: media: i2c: add MT9M114 driver support for iMX93 platform
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281825.DPhdYY5p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409281825.DPhdYY5p-lkp@intel.com/

smatch warnings:
drivers/media/i2c/mt9m114.c:794 mt9m114_set_fmt() warn: inconsistent returns '&sensor->lock'.
drivers/media/i2c/mt9m114.c:913 mt9m114_get_chip_id() warn: unsigned 'ret' is never less than zero.

vim +794 drivers/media/i2c/mt9m114.c

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

unlock before returning

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

[ snip ]

f5eb071582415f1 Guoniu.zhou 2022-06-13  906  static int mt9m114_get_chip_id(struct mt9m114 *sensor)
f5eb071582415f1 Guoniu.zhou 2022-06-13  907  {
f5eb071582415f1 Guoniu.zhou 2022-06-13  908  	struct i2c_client *client = sensor->i2c_client;
f5eb071582415f1 Guoniu.zhou 2022-06-13  909  	u32 ret;
f5eb071582415f1 Guoniu.zhou 2022-06-13  910  	u16 chip_id;
f5eb071582415f1 Guoniu.zhou 2022-06-13  911  
f5eb071582415f1 Guoniu.zhou 2022-06-13  912  	ret = mt9m114_read16(client, MT9M114_CHIP_ID, &chip_id);
f5eb071582415f1 Guoniu.zhou 2022-06-13 @913  	if (ret < 0) {

ret is unsigned so it can't be < 0.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

