Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40A14A4DC
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470086; cv=none; b=G+nBWPfoSIuW9gGRokDCc/PumX0Xv7E6p5oUmisNX1sSyDdc54NjP/1CaDH6V3fwRyxxB9P22XId/m4nE29G/9R8g9cKjTJbW2cEMJSb+bKueLuBFjMKhBMv5CFrqqy9DjJp3LbxRA7s5gAgWN91i4EgMswg6RljjijHBymbz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470086; c=relaxed/simple;
	bh=nK1mhMR5sp2HGvlXVhonM9F6WZxXA/qiREN8Rf6H+4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ypw1fyYB7GICbjS5o1oBNeq5FziAHiYQLiEdSZ3V+gEsAspGG8ASoChs+QhXVrzgBo5uO3MiFTd9rUguCWxcsWAWa5O0bX7F0FimewM4NMo2gY1sziG6lF8uiZaiI7OZT/FzWcj7DSSfggOVgekAWczxbowNQbBIAh/bm7HV8Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U/2+YSZB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/2+YSZB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4200ee78f33so19990225e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716470083; x=1717074883; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWD7CtUtkqXIzQoWrQh8FoeaevQYrYwYHAnr/5q6xaI=;
        b=U/2+YSZBQiRbEFw1Zgo264Eio7s9MKmdMF76VGL1p7sqot30TYVVLtjXDCbv922A2c
         UCxujT8Uyf2uX8bqg1yRRgltBdG7WD3XZ3JAInGjb7wiJVey5LTMFCDu479zfxljuh6x
         98UBX5xO5etIM2XLgQi5s651CNWuU2jVXBh1oUwdBSZ3pTtZUMtxTqRFU35e8a4mz3G2
         jL50o8dI02LwPfqIK+VSyivNuDhqOX4wFuCQak6v0DipMSoPzVOQ13NJH8K3rxhMGYtD
         5HKxhAUCAjG5OO2HwHJspkbjSZ+6+C3JtEEOMmvntVXYLtI7FkLs7KLOSDqDYqwdqwI4
         hebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716470083; x=1717074883;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWD7CtUtkqXIzQoWrQh8FoeaevQYrYwYHAnr/5q6xaI=;
        b=TT14D8QjrzuQtJGvMJX08cjedrVYXtmSoRjhM3qQkYLEsnM28hlbzvuHYC8W+4G5Wi
         SmMz/J28gijOzp5oSurtWIif64syx3Hjkozq+2RjQxSmHRhyvVnEbumszt9xErfC6Aw/
         17fPavYQ2+5WsPe5Q5VYg0rBT7loYNzeclorRfKujx31LQSj0Y5SUd6jXq08i97cQIgP
         uYXHLBPiHXCLHmm/b8nGtV/olCWs6wEKMM7NlKgCfjVYZwaQJXMPMKBJVg5+RLj2ZFEV
         eXpvu9t+NGI4UPhuEelJZvKGlEnaYlV9VFDwRsG2BdOtzS1UTzyuwRxJsSRjihTfh1cd
         bXWQ==
X-Gm-Message-State: AOJu0YxGakU1yd/tWLqshUlo6GiY5Rb7Gs7NfAuMmigZ+aRBA9pQVJDz
	M1iHNnXQt16/VkScFHRcTuoBciU9BripgoIk81JsOo3ME5Ni2EqJJRxoX508S1UeU9LteFHraGf
	FZTw=
X-Google-Smtp-Source: AGHT+IFNQhgHCdHm4dC36MCqGkdYxgUj5wdX9du2Ncve17vPZJB8anwVgsBR/V0kkOoTM/uM20yPew==
X-Received: by 2002:adf:ec07:0:b0:354:f24f:aa4b with SMTP id ffacd0b85a97d-354f24fab45mr2710505f8f.3.1716470082525;
        Thu, 23 May 2024 06:14:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad037sm36523640f8f.71.2024.05.23.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 06:14:41 -0700 (PDT)
Date: Thu, 23 May 2024 16:14:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Volodymyr Kharuk <vkh@melexis.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: Re: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
Message-ID: <5a14400e-97e6-47a0-bac5-0e4c4db9b8d5@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh@melexis.com>

Hi Volodymyr,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Volodymyr-Kharuk/media-uapi-ctrls-Add-camera-trigger-controls/20240517-004536
base:   8771b7f31b7fff91a998e6afdb60650d4bac59a5
patch link:    https://lore.kernel.org/r/6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh%40melexis.com
patch subject: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
config: mips-randconfig-r071-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181557.HpbDJU4b-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405181557.HpbDJU4b-lkp@intel.com/

smatch warnings:
drivers/media/i2c/mlx7502x.c:664 mlx7502x_runtime_resume() warn: 'sensor->xclk' from clk_prepare_enable() not released on lines: 664.
drivers/media/i2c/mlx7502x.c:1586 mlx7502x_link_freq_init() error: buffer overflow 'link_freq' 6 <= 6 (assuming for loop doesn't break)

vim +664 drivers/media/i2c/mlx7502x.c

93b22d3a235baf Volodymyr Kharuk 2024-05-16  620  static int __maybe_unused mlx7502x_runtime_resume(struct device *dev)
93b22d3a235baf Volodymyr Kharuk 2024-05-16  621  {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  622  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  623  	struct mlx7502x *sensor = to_mlx7502x(sd);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  624  	int ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  625  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  626  	gpiod_set_value_cansleep(sensor->reset, 0);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  627  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  628  	ret = regulator_bulk_enable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  629  	if (ret) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  630  		dev_err(sensor->dev, "failed to enable supply: %d\n", ret);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  631  		return ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  632  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  633  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  634  	ret = clk_prepare_enable(sensor->xclk);
                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

93b22d3a235baf Volodymyr Kharuk 2024-05-16  635  	if (ret) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  636  		dev_err(sensor->dev, "failed to enable external clock: %d\n",
93b22d3a235baf Volodymyr Kharuk 2024-05-16  637  			ret);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  638  		goto fail_clk;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  639  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  640  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  641  	gpiod_set_value_cansleep(sensor->reset, 1);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  642  	msleep(MLX7502X_RESET_DELAY_MS);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  643  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  644  	dev_dbg(sensor->dev, "power on\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  645  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  646  	ret = mlx7502x_write_regval(sd, mlx7502x_common_init_cfg,
93b22d3a235baf Volodymyr Kharuk 2024-05-16  647  				    ARRAY_SIZE(mlx7502x_common_init_cfg));
93b22d3a235baf Volodymyr Kharuk 2024-05-16  648  	if (ret < 0) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  649  		dev_err(sensor->dev, "failed to write init_cfg\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  650  		goto fail_clk;

Don't we need to disable the xclk on this path?

93b22d3a235baf Volodymyr Kharuk 2024-05-16  651  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  652  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  653  	ret = mlx7502x_write_regval(sd, sensor->cur_desc->init_cfg,
93b22d3a235baf Volodymyr Kharuk 2024-05-16  654  				    sensor->cur_desc->init_cfg_size);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  655  	if (ret < 0) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  656  		dev_err(sensor->dev, "failed to write sensor specific init_cfg\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  657  		goto fail_clk;

And here.

93b22d3a235baf Volodymyr Kharuk 2024-05-16  658  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  659  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  660  	return 0;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  661  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  662  fail_clk:
93b22d3a235baf Volodymyr Kharuk 2024-05-16  663  	regulator_bulk_disable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
93b22d3a235baf Volodymyr Kharuk 2024-05-16 @664  	return ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  665  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

