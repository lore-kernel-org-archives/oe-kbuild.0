Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E41C774
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 10:48:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f41d087b24so40161775e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683802092; x=1686394092;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7JADIWBUmOCU2mF7tw9c2hF0lxUUJ8uvybFtNfl4/Wg=;
        b=lNzPM1R+cRkJltiSWXf5AKeqHJ3arnTbuez6xeRf9mGoCm3QmVLbkuLXG3lAlMGoaU
         4UEWJh0zNnpOPBVgyc8QnDkc8pspCPRVe/uidq8EOzkNY9aLiUP5RQC5d2/QnIAUFMFK
         cseqfGp2ccftld32jGfBoZILRpCGq1+hgqiOChCm26NRvR5g93E1tLTukMaOv/toAIIl
         TZrDi0xsywaLpuxLhqyPKmFoBosXJdz3Zvg0847rBjPx23+QcRgrAoB2xWPc0KQaAUdU
         YhcrqHKUGTq7sJ9ylO2qve5qjJDkEREcn1K1e3aYJKTIwVzr68IIjb19zaLDnXysryM+
         ud2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683802092; x=1686394092;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JADIWBUmOCU2mF7tw9c2hF0lxUUJ8uvybFtNfl4/Wg=;
        b=RdMyeXSQptILgs+Qa9+q/peCv2q8arMxI3NoJnVaX+Xxl3D4NXpIKlXpzYoSuLc+0K
         zAZHamMWhLTJorcanAgW9rLQiuIflz9LeECUimuBvZizrxYGWMqKGOcfEpez5oFa6IT1
         SmMQGWPmCUhbAE0PTawZaOV4zeBXsCB4cOXAynAZ8qV5OK1e7LSWWE0MRH2rC0Foto38
         RzyU4Qze+UxZRmMKy4NpFop74j7O9ZH0bh+bSWSQc29/H9qjranK2/WLzl0GnLwIMjcj
         LObY3EeZdavej+6qy3476dvDe1vo0+6FBMGcLt02SE2VufViFPrYhFzg+y5MVxo4XkgJ
         TLzQ==
X-Gm-Message-State: AC+VfDxYf/SBfkH7jifkBfQjv+fCwJIE7RG+EybpDWIWVyOg/d9B+FGD
	hdH7qJZHCqrxDJi7wfSBTEpPkFWDAGOk0klMrzA=
X-Google-Smtp-Source: ACHHUZ7Va8iFg38r9ewoleVUC9xSujzB06Xl3uWpcybKri8RNGNNtHBcP2WyQKx3+cSC2BTzIsl/Bg==
X-Received: by 2002:a5d:6990:0:b0:306:2d15:fc35 with SMTP id g16-20020a5d6990000000b003062d15fc35mr14039198wru.37.1683802092418;
        Thu, 11 May 2023 03:48:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p5-20020a7bcc85000000b003f4dde07956sm3641919wma.42.2023.05.11.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 03:48:10 -0700 (PDT)
Date: Thu, 11 May 2023 13:48:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: drivers/iio/accel/kionix-kx022a.c:1053 kx022a_probe_internal() warn:
 passing zero to 'dev_err_probe'
Message-ID: <46296e39-dbc1-4f27-b89c-af6f08d9f318@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ad2fd53a7870a395b8564697bef6c329d017c6c9
commit: 7c1d1677b3227c6b18ac999f2b84778baa280b8f iio: accel: Support Kionix/ROHM KX022A accelerometer
config: openrisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110245.MFxC9bUj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110245.MFxC9bUj-lkp@intel.com/

smatch warnings:
drivers/iio/accel/kionix-kx022a.c:1053 kx022a_probe_internal() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1053 drivers/iio/accel/kionix-kx022a.c

7c1d1677b3227c Matti Vaittinen 2022-10-24  1000  int kx022a_probe_internal(struct device *dev)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1001  {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1002  	static const char * const regulator_names[] = {"io-vdd", "vdd"};
7c1d1677b3227c Matti Vaittinen 2022-10-24  1003  	struct iio_trigger *indio_trig;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1004  	struct fwnode_handle *fwnode;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1005  	struct kx022a_data *data;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1006  	struct regmap *regmap;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1007  	unsigned int chip_id;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1008  	struct iio_dev *idev;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1009  	int ret, irq;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1010  	char *name;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1011  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1012  	regmap = dev_get_regmap(dev, NULL);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1013  	if (!regmap) {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1014  		dev_err(dev, "no regmap\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1015  		return -EINVAL;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1016  	}
7c1d1677b3227c Matti Vaittinen 2022-10-24  1017  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1018  	fwnode = dev_fwnode(dev);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1019  	if (!fwnode)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1020  		return -ENODEV;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1021  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1022  	idev = devm_iio_device_alloc(dev, sizeof(*data));
7c1d1677b3227c Matti Vaittinen 2022-10-24  1023  	if (!idev)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1024  		return -ENOMEM;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1025  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1026  	data = iio_priv(idev);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1027  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1028  	/*
7c1d1677b3227c Matti Vaittinen 2022-10-24  1029  	 * VDD is the analog and digital domain voltage supply and
7c1d1677b3227c Matti Vaittinen 2022-10-24  1030  	 * IO_VDD is the digital I/O voltage supply.
7c1d1677b3227c Matti Vaittinen 2022-10-24  1031  	 */
7c1d1677b3227c Matti Vaittinen 2022-10-24  1032  	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(regulator_names),
7c1d1677b3227c Matti Vaittinen 2022-10-24  1033  					     regulator_names);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1034  	if (ret && ret != -ENODEV)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1035  		return dev_err_probe(dev, ret, "failed to enable regulator\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1036  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1037  	ret = regmap_read(regmap, KX022A_REG_WHO, &chip_id);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1038  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1039  		return dev_err_probe(dev, ret, "Failed to access sensor\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1040  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1041  	if (chip_id != KX022A_ID) {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1042  		dev_err(dev, "unsupported device 0x%x\n", chip_id);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1043  		return -EINVAL;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1044  	}
7c1d1677b3227c Matti Vaittinen 2022-10-24  1045  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1046  	irq = fwnode_irq_get_byname(fwnode, "INT1");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1047  	if (irq > 0) {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1048  		data->inc_reg = KX022A_REG_INC1;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1049  		data->ien_reg = KX022A_REG_INC4;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1050  	} else {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1051  		irq = fwnode_irq_get_byname(fwnode, "INT2");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1052  		if (irq <= 0)
                                                                    ^^^^^^^^
This code assumes fwnode_irq_get_byname() can return zero.

7c1d1677b3227c Matti Vaittinen 2022-10-24 @1053  			return dev_err_probe(dev, irq, "No suitable IRQ\n");

But fortunately, it can't otherwise this would return success.

7c1d1677b3227c Matti Vaittinen 2022-10-24  1054  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1055  		data->inc_reg = KX022A_REG_INC5;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1056  		data->ien_reg = KX022A_REG_INC6;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1057  	}
7c1d1677b3227c Matti Vaittinen 2022-10-24  1058  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1059  	data->regmap = regmap;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1060  	data->dev = dev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

