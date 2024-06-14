Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53919AA63
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jun 2024 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718371163; cv=none; b=gYgHxWpbxAaN/ZawaVE0QmevTE8dUBbj4/hVB/GT9m0fPOL5zOy+S2jkUdKOsmA99kwQOWXft4H3zxjM+cXHmZuriJ5dqEMKJVkGSrUXm3RQN68TvMUrM1ee46quHsiJH8bQhUyf/5Xksf6zNKo6IkqgOmuyBkLM9LBQ25pbeA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718371163; c=relaxed/simple;
	bh=JmJKmAuPj9kduKQFiI8tppycENgBvW3rbiZxfZzFF8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kOLge6/TEOBzjWAGfmtoBx4w4QvgcZL1fI4hIgZWUZVsmg2S70bIt8PuTUAv6HGTRRWwkXQQN3NmRvewd6UQnCEO16nP/5eUBSRZR1dxetn/luMtN+QuDf1Br2T4s8Nwbp5pZALi67FpM6iUnl1XnsQbvsXL/6leAPFHbSUFyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LKfgdRnx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LKfgdRnx"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52caebc6137so390733e87.0
        for <oe-kbuild@lists.linux.dev>; Fri, 14 Jun 2024 06:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718371159; x=1718975959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGaz9pxPn2jEVNz9zF2iF9ACAAFUCHh5HrdyKjCjJas=;
        b=LKfgdRnxY9qJZsEEnlKDqyMq86q56edXkZmO96Wg9h6Z2J432X7UswHR1b5Wwm5ofG
         9hh3WNmrvFWjPqQGrh0bn7P9tQr7eJHixgpLPsXSMvV/MQuwFR37r8Tv2Sf28+iaKF9D
         CWgMhdPgogYRfaehudOkXePGb69y6YuZtubjCMDjJZaQdEgdLwtFduvjo/QLR9Z6+8kV
         bYyrAuAUgqxh6/b2k/gRZp3C4DXM9FEReSEHEDCwcEtdYWDJjPP9A3rVcYnXmclLs0oO
         QQ3E6jqEHdhGkT9drPbuiHqW701U2bIoMvy+r0L37zlKw76UIRCVraKRWqhTZJSgBS38
         v4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718371159; x=1718975959;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGaz9pxPn2jEVNz9zF2iF9ACAAFUCHh5HrdyKjCjJas=;
        b=pL17T2bLcjzz7Ia6t8E61kTperQ9UOVLyz8xpFrnRhCAa6gYyWS1cLiYx6aczVrDLm
         NHzVimS7ArhhlayaAO9UuEGVt+G0VuKnrpAhxDDWn7EmFpftaKxnoC26mfBlqzLNVSxG
         cZh9x4xCvm4wM3RMjnj6R+Gc+bX3/hQQlp/8N0sWTrFK91tvnQo+OuU2ftF07KVGTiyZ
         TgIuNvnk2wIylDgRdAc1ZlN25tCh5Xjh3a4dw5Kj7rpFY0uwVo7bMW5v5FqXbW8EgOsQ
         modzLHZlH1hhdRgcSyNOeNCLfn6djfWLMdDSCnPRd9L2Sxk4E/TlxN7m9wCWrT2pRmVj
         lofQ==
X-Gm-Message-State: AOJu0YzgTNVJW7biw2yQBbrLkGch4Mhm+ydd/1cFCGkIek+B0170gTWc
	JSZe3UXCQOLn+jC0eTKJ16Oi8HLtFbmntYdKPoe+tqdpobuMHrh1bcwd0Eli61jK/97jPS8SgAf
	1
X-Google-Smtp-Source: AGHT+IHfaHvlYgLtOp6uwWXhWz5Ssbw8dUeNoSDkAZ7kw+bNm9oczNvJ4ONkUSapp3ZwCM9O4Z18kA==
X-Received: by 2002:ac2:5e22:0:b0:52c:99ed:4c9a with SMTP id 2adb3069b0e04-52ca6e99288mr1570472e87.59.1718371159118;
        Fri, 14 Jun 2024 06:19:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f9e2b306sm59781315e9.16.2024.06.14.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 06:19:18 -0700 (PDT)
Date: Fri, 14 Jun 2024 16:19:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yasin Lee <yasin.lee.x@outlook.com>,
	jic23@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, andy.shevchenko@gmail.com,
	lars@metafoo.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, nuno.a@analog.com,
	swboyd@chromium.org, u.kleine-koenig@pengutronix.de,
	yasin.lee.x@gmail.com, yasin.lee.x@outlook.com
Subject: Re: [PATCH v4 2/2] iio:proximity:hx9023s: Add TYHX HX9023S sensor
 driver
Message-ID: <bfb1a32d-be14-47e2-9cb0-4d1c75e207f6@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR12MB81017291E79E6B61A8DEC9A5A4FB2@SN7PR12MB8101.namprd12.prod.outlook.com>

Hi Yasin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yasin-Lee/iio-proximity-hx9023s-Add-TYHX-HX9023S-sensor-driver/20240607-194446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/SN7PR12MB81017291E79E6B61A8DEC9A5A4FB2%40SN7PR12MB8101.namprd12.prod.outlook.com
patch subject: [PATCH v4 2/2] iio:proximity:hx9023s: Add TYHX HX9023S sensor driver
config: um-randconfig-r071-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142001.swm6CU40-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406142001.swm6CU40-lkp@intel.com/

New smatch warnings:
drivers/iio/proximity/hx9023s.c:666 hx9023s_property_get() error: uninitialized symbol 'i'.
drivers/iio/proximity/hx9023s.c:976 hx9023s_trigger_handler() error: uninitialized symbol 'i'.
drivers/iio/proximity/hx9023s.c:996 hx9023s_buffer_preenable() error: uninitialized symbol 'channels'.

Old smatch warnings:
drivers/iio/proximity/hx9023s.c:667 hx9023s_property_get() error: uninitialized symbol 'i'.

vim +/i +666 drivers/iio/proximity/hx9023s.c

6133aa711518da Yasin Lee 2024-06-07  650  static int hx9023s_property_get(struct hx9023s_data *data)
6133aa711518da Yasin Lee 2024-06-07  651  {
6133aa711518da Yasin Lee 2024-06-07  652  	int ret, i;

Needs to be initialized.  int i = 0;

6133aa711518da Yasin Lee 2024-06-07  653  	u32 temp;
6133aa711518da Yasin Lee 2024-06-07  654  	struct fwnode_handle *child;
6133aa711518da Yasin Lee 2024-06-07  655  	struct device *dev = regmap_get_device(data->regmap);
6133aa711518da Yasin Lee 2024-06-07  656  
6133aa711518da Yasin Lee 2024-06-07  657  	ret = device_property_read_u32(dev, "channel-in-use", &temp);
6133aa711518da Yasin Lee 2024-06-07  658  	if (ret)
6133aa711518da Yasin Lee 2024-06-07  659  		return dev_err_probe(dev, ret, "Failed to read channel-in-use property\n");
6133aa711518da Yasin Lee 2024-06-07  660  	data->chan_in_use = temp;
6133aa711518da Yasin Lee 2024-06-07  661  
6133aa711518da Yasin Lee 2024-06-07  662  	device_for_each_child_node(dev, child) {
6133aa711518da Yasin Lee 2024-06-07  663  		ret = fwnode_property_read_u32(child, "channel-positive", &temp);
6133aa711518da Yasin Lee 2024-06-07  664  		if (ret)
6133aa711518da Yasin Lee 2024-06-07  665  			return dev_err_probe(dev, ret,
6133aa711518da Yasin Lee 2024-06-07 @666  					"Failed to read channel-positive for channel %d\n", i);
6133aa711518da Yasin Lee 2024-06-07  667  		data->ch_data[i].channel_positive = temp;
6133aa711518da Yasin Lee 2024-06-07  668  
6133aa711518da Yasin Lee 2024-06-07  669  		ret = fwnode_property_read_u32(child, "channel-negative", &temp);
6133aa711518da Yasin Lee 2024-06-07  670  		if (ret)
6133aa711518da Yasin Lee 2024-06-07  671  			return dev_err_probe(dev, ret,
6133aa711518da Yasin Lee 2024-06-07  672  					"Failed to read channel-negative for channel %d\n", i);
6133aa711518da Yasin Lee 2024-06-07  673  		data->ch_data[i].channel_negative = temp;
6133aa711518da Yasin Lee 2024-06-07  674  
6133aa711518da Yasin Lee 2024-06-07  675  		i++;
6133aa711518da Yasin Lee 2024-06-07  676  	}
6133aa711518da Yasin Lee 2024-06-07  677  
6133aa711518da Yasin Lee 2024-06-07  678  	return 0;
6133aa711518da Yasin Lee 2024-06-07  679  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

