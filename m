Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B251867
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 07:02:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so1678274f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 08 Sep 2023 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694156578; x=1694761378; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zkmVUPpERjdJbe/ABkkfNAbpRBlyI6513Q0TGvFG1A=;
        b=MPFr8JUs97QC1IjA0a39oFUmE8jdZZGTfIpHxZ6K9cA7UymHjGsetLiOY6eK/NSPeS
         Y8AUGrph+g3WlE0M5qJtCWKuE6KGAJD4ZyPH7GFyEDwBafVkCfL2BJup6UT+aIcAJRgw
         F3wfF3CuyjvN/B/68F0qc0Zp0AI5FZYvd/X4R/2e3GdLfdmx6qtB9F0rU205rYYMzYJi
         lNquwn7nYgN4UO66VYISQaARmQY0SymBaN6zzvrm+83D0r3wQx1xeUZ3rX905BTmhTne
         eI6gkL94zWKwbxM9LhVXqRTzAgAr7yKlxEic1Sk0/pQR7ZROAU4BlL/xqHEfdTUYv4JX
         l70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694156578; x=1694761378;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zkmVUPpERjdJbe/ABkkfNAbpRBlyI6513Q0TGvFG1A=;
        b=FNAFzvNC9lzHFNn8ft7OfspTyB0uqSNUmrcBakF5T9FO7+BGMYjFjBMI9HBJkhBwLs
         9R0qJdg3znXUdy7eyGmuq5ImUoKqWzpJM9vUj1Gzwa9CSKicru7jkQaTFfwv/pvvIRa1
         +PSiGmdjaInqBwD99Ib3P+6coRS/kw69tyInpusAzJY/+sJnfkTHG4wXX+nl0bC4sao7
         xCrLB3hGWsB1bXdJ5EL3LVjTI/z/CyIDnnQs1okIYDtGWJvcN8F8cts9v/TMTr+ZrMg0
         qt8QLJYaYpT5wXzo3p1eME0FnCjmuGP18yCHWup7oEv+cZ18XmnSAQpKDH6EqPp2BTEp
         TEXw==
X-Gm-Message-State: AOJu0Yw9cerE8Wd9Bvdw81Y4FcHX5yZyMrnUfNPBEeQdPDbqC3LlWD/l
	6ZrtWQuy7plslkoYLfLa6K57BNqejN6eIF7Ht7I=
X-Google-Smtp-Source: AGHT+IHPhb2Sx85xGshs4ePTDnD3zDJl4Hy9QXOZI7ZLiGrPaLMT8+k9LQZ5c/4iQMjTii1NxFFjhg==
X-Received: by 2002:adf:cc8a:0:b0:317:67bf:3376 with SMTP id p10-20020adfcc8a000000b0031767bf3376mr1102841wrj.57.1694156577966;
        Fri, 08 Sep 2023 00:02:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r17-20020adfce91000000b003198a9d758dsm1269386wrn.78.2023.09.08.00.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 00:02:57 -0700 (PDT)
Date: Fri, 8 Sep 2023 10:02:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Liam Beguin <liambeguin@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 50/62] drivers/iio/adc/ltc2309.c:208
 ltc2309_probe() warn: ignoring unreachable code.
Message-ID: <0a5495e7-9cd7-47d0-b783-a293012b2139@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   184d37294d1b4f21a2a625be10133aafb270d591
commit: ca4c617015ff7803b72a2afc1bd45c9c5b570492 [50/62] iio: adc: add ltc2309 support
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080619.pVarITpN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309080619.pVarITpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309080619.pVarITpN-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ltc2309.c:208 ltc2309_probe() warn: ignoring unreachable code.

vim +208 drivers/iio/adc/ltc2309.c

ca4c617015ff78 Liam Beguin 2023-08-28  165  static int ltc2309_probe(struct i2c_client *client)
ca4c617015ff78 Liam Beguin 2023-08-28  166  {
ca4c617015ff78 Liam Beguin 2023-08-28  167  	struct iio_dev *indio_dev;
ca4c617015ff78 Liam Beguin 2023-08-28  168  	struct ltc2309 *ltc2309;
ca4c617015ff78 Liam Beguin 2023-08-28  169  	int ret;
ca4c617015ff78 Liam Beguin 2023-08-28  170  
ca4c617015ff78 Liam Beguin 2023-08-28  171  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*ltc2309));
ca4c617015ff78 Liam Beguin 2023-08-28  172  	if (!indio_dev)
ca4c617015ff78 Liam Beguin 2023-08-28  173  		return -ENOMEM;
ca4c617015ff78 Liam Beguin 2023-08-28  174  
ca4c617015ff78 Liam Beguin 2023-08-28  175  	ltc2309 = iio_priv(indio_dev);
ca4c617015ff78 Liam Beguin 2023-08-28  176  	ltc2309->dev = &indio_dev->dev;
ca4c617015ff78 Liam Beguin 2023-08-28  177  	ltc2309->client = client;
ca4c617015ff78 Liam Beguin 2023-08-28  178  	ltc2309->vref_mv = 4096; /* Default to the internal ref */
ca4c617015ff78 Liam Beguin 2023-08-28  179  
ca4c617015ff78 Liam Beguin 2023-08-28  180  	indio_dev->name = "ltc2309";
ca4c617015ff78 Liam Beguin 2023-08-28  181  	indio_dev->modes = INDIO_DIRECT_MODE;
ca4c617015ff78 Liam Beguin 2023-08-28  182  	indio_dev->channels = ltc2309_channels;
ca4c617015ff78 Liam Beguin 2023-08-28  183  	indio_dev->num_channels = ARRAY_SIZE(ltc2309_channels);
ca4c617015ff78 Liam Beguin 2023-08-28  184  	indio_dev->info = &ltc2309_info;
ca4c617015ff78 Liam Beguin 2023-08-28  185  
ca4c617015ff78 Liam Beguin 2023-08-28  186  	ltc2309->vref = devm_regulator_get_optional(&client->dev, "vref");
ca4c617015ff78 Liam Beguin 2023-08-28  187  	if (IS_ERR(ltc2309->vref)) {
ca4c617015ff78 Liam Beguin 2023-08-28  188  		ret = PTR_ERR(ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  189  		if (ret == -ENODEV)
ca4c617015ff78 Liam Beguin 2023-08-28  190  			ltc2309->vref = NULL;
ca4c617015ff78 Liam Beguin 2023-08-28  191  		else
ca4c617015ff78 Liam Beguin 2023-08-28  192  			return ret;
ca4c617015ff78 Liam Beguin 2023-08-28  193  	}
ca4c617015ff78 Liam Beguin 2023-08-28  194  
ca4c617015ff78 Liam Beguin 2023-08-28  195  	if (ltc2309->vref) {
ca4c617015ff78 Liam Beguin 2023-08-28  196  		ret = regulator_enable(ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  197  		if (ret)
ca4c617015ff78 Liam Beguin 2023-08-28  198  			return dev_err_probe(ltc2309->dev, ret,
ca4c617015ff78 Liam Beguin 2023-08-28  199  					     "failed to enable vref\n");
ca4c617015ff78 Liam Beguin 2023-08-28  200  
ca4c617015ff78 Liam Beguin 2023-08-28  201  		ret = devm_add_action_or_reset(ltc2309->dev,
ca4c617015ff78 Liam Beguin 2023-08-28  202  					       ltc2309_regulator_disable,
ca4c617015ff78 Liam Beguin 2023-08-28  203  					       ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  204  		if (ret) {
ca4c617015ff78 Liam Beguin 2023-08-28  205  			return dev_err_probe(ltc2309->dev, ret,
                                                                ^^^^^^

ca4c617015ff78 Liam Beguin 2023-08-28  206  					     "failed to add regulator_disable action: %d\n",
ca4c617015ff78 Liam Beguin 2023-08-28  207  					     ret);
ca4c617015ff78 Liam Beguin 2023-08-28 @208  			return ret;
                                                                ^^^^^^^^^^^
Delete this second return.

ca4c617015ff78 Liam Beguin 2023-08-28  209  		}
ca4c617015ff78 Liam Beguin 2023-08-28  210  
ca4c617015ff78 Liam Beguin 2023-08-28  211  		ret = regulator_get_voltage(ltc2309->vref);
ca4c617015ff78 Liam Beguin 2023-08-28  212  		if (ret < 0)
ca4c617015ff78 Liam Beguin 2023-08-28  213  			return ret;
ca4c617015ff78 Liam Beguin 2023-08-28  214  
ca4c617015ff78 Liam Beguin 2023-08-28  215  		ltc2309->vref_mv = ret / 1000;
ca4c617015ff78 Liam Beguin 2023-08-28  216  	}
ca4c617015ff78 Liam Beguin 2023-08-28  217  
ca4c617015ff78 Liam Beguin 2023-08-28  218  	mutex_init(&ltc2309->lock);
ca4c617015ff78 Liam Beguin 2023-08-28  219  
ca4c617015ff78 Liam Beguin 2023-08-28  220  	return devm_iio_device_register(&client->dev, indio_dev);
ca4c617015ff78 Liam Beguin 2023-08-28  221  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

