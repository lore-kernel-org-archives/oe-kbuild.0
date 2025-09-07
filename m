Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7D261B60
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Sep 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244391; cv=none; b=kjrQnrFQf9R9q4F4/bJtZTMVjXVaSK95dqyQy6DyOgy/G+YVgYXKMoet3hT1W3su7QMUfvfiGPq+a7rJ3HfDHuHy8qW7yuio1hNzxFurXvuIKSqAwNxrHn90YnzNrVO29+VaURnHOG855u/Amt+2G3nMJjVTRJaPg4+zrCufSAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244391; c=relaxed/simple;
	bh=WplKFwssKc1f+3uh2xBYy47HhTBAUrgd7sJvb8Dd+AA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YfqMx0KvdDQCFtDmU2N1Dj+xg1PHbYSqnIFoxouv1y2QK8toqLUM+7gk3E/htSicaiDljXAo0qi108wzhSKfT6/s1TToDZjm9Y1x81OB45Jhegf2skEX9xZjY4mYZXz+r5CABX3e061mhi4wdbB4HYNuVtAvJXyWhwPkxb77DO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rytJglpC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rytJglpC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45de1f2cdeeso2629195e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 07 Sep 2025 04:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757244388; x=1757849188; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aAYNdsBKYi67Oem/jYjGQylTcJt/iir5KzfK7uZa2Os=;
        b=rytJglpCNwjQ+mUzaC17y5cIxDnvp1WBldhkK8HcToA/aOzF3W+qzPloUfrK35VvQh
         nqtcLnkNGdxMrMCbttuwDwRpsIEJov20i8r/pcpe1YknhCw0td4NQmdUK7b58snXyUvs
         ot2dTN+sWjCjwc2zxdU0hsBt+nwiQOO+q4pYwng02CVZLhAwhVF8y8GVDfJgEx/wkEnO
         jS+9GBvVNBCp/b7Wc9DBQ1mYxGmDTzuzU09bQEW06agErAbt+Sql+HV7AtNjagQbbIRB
         9HBrqdpp5k4YWQx4Qkf04zEdXFYKBgbY6jDRIgdtxfe2JLs55XzA+hh4XdnMVlhI4kqe
         6LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244388; x=1757849188;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAYNdsBKYi67Oem/jYjGQylTcJt/iir5KzfK7uZa2Os=;
        b=PzKVE2mF/IeX4SJ3l2RY69kOIJ1Z6n0RT1tVI2g16zxR7gODl67zMz8iNVSgMw1FtW
         a/NiWIxG757mFq//yyYy8HNLBX0aBYarFEoEGzQduwScITVzuLCHtQjbWlKq0QHuheOH
         5SvB/BU0PSg/n6XydUZsKRBs6tvZcQXkeAiyR9t1kt1prj8DASh195jPR0MnpiM4ljgN
         6wbBJgjnTWREqoxKrftnwSWs8wTTLDwMBXMM+h4JJlAP/6DDC7Rfw5I1Vy+RBXBQ160I
         YWRRS09RMRMNNi0HvXRtqNHH5Oy6uihCpaI5UYM4q+TTaFX22d86a+965dmkLSbeCsnX
         FW9w==
X-Gm-Message-State: AOJu0YyD9TSvAjHWpNly5zx96SEduZlI1YWRz1osaPUZ41SZEHo9GRZh
	LlmGL3yUyaW8di+GKgXAPUY5YdTbWJWB/44sh5ocC5rBAKhq3dTgfQhKlzz3/zL7udHiuPchYCP
	xVNDS
X-Gm-Gg: ASbGncuuPtBeBKJ7wXwPfjmQLyaC2lrp3AmeWdvZ0JrtUMOVsbhIFevTYMAwTpsxBgr
	HZXd80SIcWAXyLic+0vFMURxp2h+C6RR/NnHrPdbbX53yaGw/CAUcQqdNlfuWd6ZVn22lt9ZNH1
	nO4Mr0AVRgGkOMKfs1+/gtAspTPbFYgSzwfJ9cDRbZljjEVdP8CCG+IPx5dvJlYbMpR+mG4Q+74
	xhTMQ9RNIo/pMgbbs6+Xtv6+vP8LNcUU4/L+9H4VffEF9iI+spES5HiTm/ObAebevdmpbEqd29X
	spklPFhFnPluK+gUGp+SBiztw1c/vUdhInbEwoSVAGgKokffk1s9OoGXky8CaMb78bPs27fyRSa
	Mkb+iIKfUfteEDp6LpnBRjwHaFpl46NjR9G2+MA==
X-Google-Smtp-Source: AGHT+IGH6H0mBFkDQVDcAbYMsb+ulzbOrfFiUgLrXxCyJBe2kwF4x8+y+psKdMwtQ84ERtsBks0g8g==
X-Received: by 2002:a5d:5847:0:b0:3e5:190b:b04e with SMTP id ffacd0b85a97d-3e64317fdd0mr2511246f8f.37.1757244388066;
        Sun, 07 Sep 2025 04:26:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e74893acecsm319047f8f.36.2025.09.07.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:26:27 -0700 (PDT)
Date: Sun, 7 Sep 2025 14:26:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andreas Kemnade <akemnade@kernel.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Andreas Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH 3/4] regulator: sy7636a: add gpios and input regulator
Message-ID: <202509071141.TSai6ltk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-sy7636-rsrc-v1-3-e2886a9763a7@kernel.org>
Message-ID: <20250907112624.uWN_LEOQ_bnpqP9GFhOmnrWq2-2NJJT7JFjpig15Yig@z>

Hi Andreas,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-mfd-sy7636a-Add-missing-gpio-pins-and-supply/20250906-171133
base:   1b237f190eb3d36f52dffe07a40b5eb210280e00
patch link:    https://lore.kernel.org/r/20250906-sy7636-rsrc-v1-3-e2886a9763a7%40kernel.org
patch subject: [PATCH 3/4] regulator: sy7636a: add gpios and input regulator
config: x86_64-randconfig-161-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071141.TSai6ltk-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509071141.TSai6ltk-lkp@intel.com/

smatch warnings:
drivers/regulator/sy7636a-regulator.c:121 sy7636a_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +121 drivers/regulator/sy7636a-regulator.c

8c485bedfb7852 Alistair Francis 2021-06-15   77  static int sy7636a_regulator_probe(struct platform_device *pdev)
8c485bedfb7852 Alistair Francis 2021-06-15   78  {
cb17820ef71ed7 Alistair Francis 2021-10-15   79  	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
8c485bedfb7852 Alistair Francis 2021-06-15   80  	struct regulator_config config = { };
8c485bedfb7852 Alistair Francis 2021-06-15   81  	struct regulator_dev *rdev;
8c485bedfb7852 Alistair Francis 2021-06-15   82  	struct gpio_desc *gdp;
d38d49b140043b Alistair Francis 2021-08-03   83  	struct sy7636a_data *data;
8c485bedfb7852 Alistair Francis 2021-06-15   84  	int ret;
8c485bedfb7852 Alistair Francis 2021-06-15   85  
27fdd3bbb7a138 Alistair Francis 2021-08-06   86  	if (!regmap)
8c485bedfb7852 Alistair Francis 2021-06-15   87  		return -EPROBE_DEFER;
8c485bedfb7852 Alistair Francis 2021-06-15   88  
07678e530d8eab Andreas Kemnade  2025-09-06   89  	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
07678e530d8eab Andreas Kemnade  2025-09-06   90  
07678e530d8eab Andreas Kemnade  2025-09-06   91  	gdp = devm_gpiod_get(&pdev->dev, "epd-pwr-good", GPIOD_IN);
8c485bedfb7852 Alistair Francis 2021-06-15   92  	if (IS_ERR(gdp)) {
07678e530d8eab Andreas Kemnade  2025-09-06   93  		dev_err(&pdev->dev, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
8c485bedfb7852 Alistair Francis 2021-06-15   94  		return PTR_ERR(gdp);
8c485bedfb7852 Alistair Francis 2021-06-15   95  	}
8c485bedfb7852 Alistair Francis 2021-06-15   96  
d38d49b140043b Alistair Francis 2021-08-03   97  	data = devm_kzalloc(&pdev->dev, sizeof(struct sy7636a_data), GFP_KERNEL);
d38d49b140043b Alistair Francis 2021-08-03   98  	if (!data)
d38d49b140043b Alistair Francis 2021-08-03   99  		return -ENOMEM;
d38d49b140043b Alistair Francis 2021-08-03  100  
27fdd3bbb7a138 Alistair Francis 2021-08-06  101  	data->regmap = regmap;
d38d49b140043b Alistair Francis 2021-08-03  102  	data->pgood_gpio = gdp;
d38d49b140043b Alistair Francis 2021-08-03  103  
327603c2e83590 Andreas Kemnade  2025-09-06  104  	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
327603c2e83590 Andreas Kemnade  2025-09-06  105  	if (ret)
327603c2e83590 Andreas Kemnade  2025-09-06  106  		return dev_err_probe(&pdev->dev, ret,
327603c2e83590 Andreas Kemnade  2025-09-06  107  				     "failed to get vin regulator\n");
327603c2e83590 Andreas Kemnade  2025-09-06  108  
327603c2e83590 Andreas Kemnade  2025-09-06  109  	data->en_gpio = devm_gpiod_get_optional(&pdev->dev, "en",
327603c2e83590 Andreas Kemnade  2025-09-06  110  						GPIOD_OUT_HIGH);
327603c2e83590 Andreas Kemnade  2025-09-06  111  	if (IS_ERR(data->en_gpio))
327603c2e83590 Andreas Kemnade  2025-09-06  112  		return dev_err_probe(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06  113  				     PTR_ERR(data->en_gpio),
327603c2e83590 Andreas Kemnade  2025-09-06  114  				     "failed to get en gpio\n");
327603c2e83590 Andreas Kemnade  2025-09-06  115  
327603c2e83590 Andreas Kemnade  2025-09-06  116  	/* Let VCOM just follow the default power on sequence */
327603c2e83590 Andreas Kemnade  2025-09-06  117  	data->vcom_en_gpio = devm_gpiod_get_optional(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06  118  						     "vcom-en", GPIOD_OUT_LOW);
327603c2e83590 Andreas Kemnade  2025-09-06  119  	if (IS_ERR(data->vcom_en_gpio))
327603c2e83590 Andreas Kemnade  2025-09-06  120  		return dev_err_probe(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06 @121  				     PTR_ERR(data->en_gpio),
                                                                                             ^^^^^^^^^^^^^
s/data->en_gpio/data->vcom_en_gpio/

327603c2e83590 Andreas Kemnade  2025-09-06  122  				     "failed to get en gpio\n");
327603c2e83590 Andreas Kemnade  2025-09-06  123  
327603c2e83590 Andreas Kemnade  2025-09-06  124  	if (data->en_gpio)
327603c2e83590 Andreas Kemnade  2025-09-06  125  		usleep_range(2500, 4000);
327603c2e83590 Andreas Kemnade  2025-09-06  126  
d38d49b140043b Alistair Francis 2021-08-03  127  	platform_set_drvdata(pdev, data);
8c485bedfb7852 Alistair Francis 2021-06-15  128  
27fdd3bbb7a138 Alistair Francis 2021-08-06  129  	ret = regmap_write(regmap, SY7636A_REG_POWER_ON_DELAY_TIME, 0x0);
8c485bedfb7852 Alistair Francis 2021-06-15  130  	if (ret) {
4cafe1aeb5fb4e Alistair Francis 2021-08-03  131  		dev_err(pdev->dev.parent, "Failed to initialize regulator: %d\n", ret);
8c485bedfb7852 Alistair Francis 2021-06-15  132  		return ret;
8c485bedfb7852 Alistair Francis 2021-06-15  133  	}
8c485bedfb7852 Alistair Francis 2021-06-15  134  
8c485bedfb7852 Alistair Francis 2021-06-15  135  	config.dev = &pdev->dev;
27fdd3bbb7a138 Alistair Francis 2021-08-06  136  	config.regmap = regmap;
8c485bedfb7852 Alistair Francis 2021-06-15  137  
8c485bedfb7852 Alistair Francis 2021-06-15  138  	rdev = devm_regulator_register(&pdev->dev, &desc, &config);
8c485bedfb7852 Alistair Francis 2021-06-15  139  	if (IS_ERR(rdev)) {
4cafe1aeb5fb4e Alistair Francis 2021-08-03  140  		dev_err(pdev->dev.parent, "Failed to register %s regulator\n",
8c485bedfb7852 Alistair Francis 2021-06-15  141  			pdev->name);
8c485bedfb7852 Alistair Francis 2021-06-15  142  		return PTR_ERR(rdev);
8c485bedfb7852 Alistair Francis 2021-06-15  143  	}
8c485bedfb7852 Alistair Francis 2021-06-15  144  
8c485bedfb7852 Alistair Francis 2021-06-15  145  	return 0;
8c485bedfb7852 Alistair Francis 2021-06-15  146  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

