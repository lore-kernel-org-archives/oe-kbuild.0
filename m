Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969246A4
	for <oe-kbuild@lists.linux.dev>; Mon, 29 May 2023 09:30:34 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30aa76048fbso1833984f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 29 May 2023 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685352632; x=1687944632;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+PZ/8vtk+vOl9qqDm4A4Cvfl/A+cxzXZXve008UphE=;
        b=K5q+5l7JUSToyu+fnkvfC2c2dAK70MGIt4nNsXq/uazURgxpkwi6nact6yLxwPOvOC
         S/XBYZNFg58EIZFEMyM4dOka3k5jdYcn42grjheRkG97EvHzbJYC5QkB79wM484pLO7S
         qFadtIiVJalIoTnm2f5lbJKif36yjaoCpPraX//9FbBYlscrjmiywbCU+Fas01aCNPUW
         jK4n1YuO1QIDELhE2ZxscbSo0jMgGIPQhffZsopCC26NVvuMsYnv87T+Xdm9JUOVaN0R
         YsEgtzTJOvHx6zD7hNZf+5wqoW/5V3AHxz6t+qBJqQVWDZtRTifRY0POsnyyO4paBu41
         Eszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685352632; x=1687944632;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+PZ/8vtk+vOl9qqDm4A4Cvfl/A+cxzXZXve008UphE=;
        b=aix67cbM5QP/fYI/eRgCpmJRU6ukVz01fCpT51NyzzgflcZHGcWNPaQvgzLKAYPkTJ
         tNwvGMAGWreQdAnnZ5VQehVm+Bat9ajmiHuCoEK++jKsSOh7NESkItRKZObQQg022X+0
         +GOKt/ivg+S7xQ+ncFNRVLIK+WyXs8KjoIyedyWhCXSK87h2AAHFmZ5V10uvL4TfG37F
         fcAv3ijnu7JRW9S/+hZiN8FD3IVzKbAo29XepNr8ghlxwdAtRhbfz6tWp+HMPBAOO00E
         qPcUVkupYDJBtrXBjudcq+7pWriCLyTbeknpJExJTrockts28RXlPbg2tGvEnxwPpmv2
         ff5A==
X-Gm-Message-State: AC+VfDwcSStCdNBaNvX9G82X8dsY58HzBaJknx/OkjCOvFZZVuVRCGQf
	IGjAKPScyKQTfl8DMIo6lXFRS8baZFmc9RSQkJY=
X-Google-Smtp-Source: ACHHUZ53lvKO30FFBNzI4qx5jaiiupYOGUkXjxLKFe0TkRPpicjwR2wcycrBo84wy9OJwgLvwVUWXw==
X-Received: by 2002:a5d:6644:0:b0:2ef:bada:2f25 with SMTP id f4-20020a5d6644000000b002efbada2f25mr9371736wrw.67.1685352632115;
        Mon, 29 May 2023 02:30:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x3-20020adfdcc3000000b0030ade1b9400sm8524003wrm.30.2023.05.29.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 02:30:30 -0700 (PDT)
Date: Mon, 29 May 2023 12:30:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] gnss: ubx: add support for the reset gpio
Message-ID: <a4648fe2-c439-4f3e-a09a-624d4b097d84@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523064310.3005-5-wsa+renesas@sang-engineering.com>

Hi Wolfram,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/WIP-gnss-merge-MTK-driver-into-UBX-driver/20230523-144613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20230523064310.3005-5-wsa%2Brenesas%40sang-engineering.com
patch subject: [RFC PATCH 4/5] gnss: ubx: add support for the reset gpio
config: i386-randconfig-m021-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281234.zR27yeIA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305281234.zR27yeIA-lkp@intel.com/

smatch warnings:
drivers/gnss/ubx.c:128 ubx_probe() warn: missing unwind goto?

vim +128 drivers/gnss/ubx.c

1ad69f10e3a58d Johan Hovold 2018-06-01   90  static int ubx_probe(struct serdev_device *serdev)
1ad69f10e3a58d Johan Hovold 2018-06-01   91  {
7b5f4730e4af68 Wolfram Sang 2023-05-23   92  	const struct ubx_info *info = of_device_get_match_data(&serdev->dev);
1ad69f10e3a58d Johan Hovold 2018-06-01   93  	struct gnss_serial *gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01   94  	struct ubx_data *data;
1ad69f10e3a58d Johan Hovold 2018-06-01   95  	int ret;
1ad69f10e3a58d Johan Hovold 2018-06-01   96  
7b5f4730e4af68 Wolfram Sang 2023-05-23   97  	if (!info)
7b5f4730e4af68 Wolfram Sang 2023-05-23   98  		return -ENOENT;
7b5f4730e4af68 Wolfram Sang 2023-05-23   99  
1ad69f10e3a58d Johan Hovold 2018-06-01  100  	gserial = gnss_serial_allocate(serdev, sizeof(*data));
1ad69f10e3a58d Johan Hovold 2018-06-01  101  	if (IS_ERR(gserial)) {
1ad69f10e3a58d Johan Hovold 2018-06-01  102  		ret = PTR_ERR(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  103  		return ret;
1ad69f10e3a58d Johan Hovold 2018-06-01  104  	}
1ad69f10e3a58d Johan Hovold 2018-06-01  105  
1ad69f10e3a58d Johan Hovold 2018-06-01  106  	gserial->ops = &ubx_gserial_ops;
1ad69f10e3a58d Johan Hovold 2018-06-01  107  
7b5f4730e4af68 Wolfram Sang 2023-05-23  108  	gserial->gdev->type = info->type;
10f146639fee5f Johan Hovold 2018-06-01  109  
1ad69f10e3a58d Johan Hovold 2018-06-01  110  	data = gnss_serial_get_drvdata(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  111  
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  112  	data->vcc = devm_regulator_get_optional(&serdev->dev, "vcc");
1ad69f10e3a58d Johan Hovold 2018-06-01  113  	if (IS_ERR(data->vcc)) {
1ad69f10e3a58d Johan Hovold 2018-06-01  114  		ret = PTR_ERR(data->vcc);
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  115  		if (ret == -ENODEV)
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  116  			data->vcc = NULL;
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  117  		else
1ad69f10e3a58d Johan Hovold 2018-06-01  118  			goto err_free_gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01  119  	}
1ad69f10e3a58d Johan Hovold 2018-06-01  120  
58f289a9dc7461 Wolfram Sang 2023-05-23  121  	ret = devm_regulator_get_enable_optional(&serdev->dev, info->v_bckp_name);
58f289a9dc7461 Wolfram Sang 2023-05-23  122  	if (ret < 0 && ret != -ENODEV)
1ad69f10e3a58d Johan Hovold 2018-06-01  123  		goto err_free_gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01  124  
32522a4fa4ae01 Wolfram Sang 2023-05-23  125  	/* Start with reset asserted (GPIO must be active low!) */
32522a4fa4ae01 Wolfram Sang 2023-05-23  126  	data->reset_gpio = devm_gpiod_get_optional(&serdev->dev, "reset", GPIOD_OUT_HIGH);
32522a4fa4ae01 Wolfram Sang 2023-05-23  127  	if (IS_ERR(data->reset_gpio))
32522a4fa4ae01 Wolfram Sang 2023-05-23 @128  		return PTR_ERR(data->reset_gpio);

ret = PTR_ERR(data->reset_gpio);
goto err_free_gserial;

32522a4fa4ae01 Wolfram Sang 2023-05-23  129  
1ad69f10e3a58d Johan Hovold 2018-06-01  130  	ret = gnss_serial_register(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  131  	if (ret)
58f289a9dc7461 Wolfram Sang 2023-05-23  132  		goto err_free_gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01  133  
1ad69f10e3a58d Johan Hovold 2018-06-01  134  	return 0;
1ad69f10e3a58d Johan Hovold 2018-06-01  135  
1ad69f10e3a58d Johan Hovold 2018-06-01  136  err_free_gserial:
1ad69f10e3a58d Johan Hovold 2018-06-01  137  	gnss_serial_free(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  138  
1ad69f10e3a58d Johan Hovold 2018-06-01  139  	return ret;
1ad69f10e3a58d Johan Hovold 2018-06-01  140  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

