Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463C184C
	for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 10:14:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3062db220a3so7061881f8f.0
        for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683972845; x=1686564845;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=maF/0RlragViZoWm89VtDYMWcUKFsGrII2Djwtu1jtU=;
        b=IY4i2rLxvErb1U5L0tYIo81smIefYT8H0FMMKwyURlxzfwft3QTw/mPGVY4CPhGX/i
         mjC132r2PIX6KWf6iN/X1aaVpjqWABRx124Rbzundkx750o3WiS/dswL9Nv65Oy0TVT4
         8kh/w7AqpigGtZB+Do6lZMbcanI5GEL2wvGGCjAd2uldTtGNWLnIUu7R0ri8WC2PFZhc
         zzWEeacsV1eWPF/Pp16UWF7lSArPDxw86Hy9yy5ie9hlAiXa2JumfGeUh7l8qB4CXVoR
         9efCuQ/sSL2KdIZ/CJKg2wYCtCnueWj2jYY5uNFsucQAP9mydrQfroWa04LFsgDxS9AZ
         VMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683972845; x=1686564845;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maF/0RlragViZoWm89VtDYMWcUKFsGrII2Djwtu1jtU=;
        b=iX8U/PBByBPfWwqaj3c1musRk4BsYHXdTkrKnI03lvsdZufuum7psfSr75xYyU+Al6
         dM8aJK9Ts7igW87MS3B14Jq/+suQJmy0vjdgqJ0u2UTi4uEOAuDON2op6UnF3cxEId3S
         lFmt8QMGrYi93Psaj69N3RKkIDEZR4aBoEw+fOqJgICcc6kTA7kPd6T+iQa0D7wqEvvg
         n0iwf2c2HI43AlEM0Ok4/tIZazbH5+J2SFRXSKHCKSPE51iQa5cjJwbjYWaOGRC2milv
         t5m0c+kLnzKY8fIScqB1UNVfTX3/d9k7OZwlOuJQ0MN7hNdDPoDP2SJIA8X19yyNm5+H
         RJhQ==
X-Gm-Message-State: AC+VfDzioA0186oZQ++iP3R539AbX6lIFIzE3dagS1pzUrqvMwF/p3oe
	1NwNaoCSXnjkDVPmoXL+VaH6sSLUPxzyDNl/5Hk=
X-Google-Smtp-Source: ACHHUZ6Ff1DQQv+XVzMZzYyuoqJo1osoXgw0EXDX9whkG2ReNHwn193nIbpCCOymcbltHnv8DCHzSA==
X-Received: by 2002:a5d:61ce:0:b0:306:30ea:a072 with SMTP id q14-20020a5d61ce000000b0030630eaa072mr21699723wrv.53.1683972844853;
        Sat, 13 May 2023 03:14:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n18-20020adfe792000000b002f7780eee10sm25984067wrm.59.2023.05.13.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 03:14:03 -0700 (PDT)
Date: Sat, 13 May 2023 13:14:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>
Subject: drivers/soc/qcom/icc-bwmon.c:360 bwmon_probe() warn: passing zero to
 'dev_err_probe'
Message-ID: <98e45455-7d5d-48e1-a87e-e0b3a05f1bb0@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a48d604672220545d209e9996c2a1edbb5637f6
commit: b9c2ae6cac403dee3195fda9eb28d8ee733b225b soc: qcom: icc-bwmon: Add bandwidth monitoring driver
config: openrisc-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230513/202305131657.76XeHDjF-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305131657.76XeHDjF-lkp@intel.com/

New smatch warnings:
drivers/soc/qcom/icc-bwmon.c:360 bwmon_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/soc/qcom/icc-bwmon.c:365 bwmon_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +360 drivers/soc/qcom/icc-bwmon.c

b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  327  static int bwmon_probe(struct platform_device *pdev)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  328  {
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  329  	struct device *dev = &pdev->dev;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  330  	struct dev_pm_opp *opp;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  331  	struct icc_bwmon *bwmon;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  332  	const struct icc_bwmon_data *data;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  333  	int ret;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  334  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  335  	bwmon = devm_kzalloc(dev, sizeof(*bwmon), GFP_KERNEL);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  336  	if (!bwmon)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  337  		return -ENOMEM;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  338  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  339  	data = of_device_get_match_data(dev);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  340  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  341  	bwmon->base = devm_platform_ioremap_resource(pdev, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  342  	if (IS_ERR(bwmon->base)) {
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  343  		dev_err(dev, "failed to map bwmon registers\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  344  		return PTR_ERR(bwmon->base);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  345  	}
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  346  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  347  	bwmon->irq = platform_get_irq(pdev, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  348  	if (bwmon->irq < 0) {
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  349  		dev_err(dev, "failed to acquire bwmon IRQ\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  350  		return bwmon->irq;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  351  	}
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  352  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  353  	ret = devm_pm_opp_of_add_table(dev);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  354  	if (ret)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  355  		return dev_err_probe(dev, ret, "failed to add OPP table\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  356  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  357  	bwmon->max_bw_kbps = UINT_MAX;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  358  	opp = dev_pm_opp_find_bw_floor(dev, &bwmon->max_bw_kbps, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  359  	if (IS_ERR(opp))
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04 @360  		return dev_err_probe(dev, ret, "failed to find max peak bandwidth\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  361  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  362  	bwmon->min_bw_kbps = 0;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  363  	opp = dev_pm_opp_find_bw_ceil(dev, &bwmon->min_bw_kbps, 0);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  364  	if (IS_ERR(opp))
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  365  		return dev_err_probe(dev, ret, "failed to find min peak bandwidth\n");

s/ret/PTR_ERR(opp)/

b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  366  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  367  	bwmon->sample_ms = data->sample_ms;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  368  	bwmon->default_lowbw_kbps = data->default_lowbw_kbps;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  369  	bwmon->dev = dev;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  370  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  371  	bwmon_disable(bwmon);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  372  	ret = devm_request_threaded_irq(dev, bwmon->irq, bwmon_intr,
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  373  					bwmon_intr_thread,
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  374  					IRQF_ONESHOT, dev_name(dev), bwmon);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  375  	if (ret)
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  376  		return dev_err_probe(dev, ret, "failed to request IRQ\n");
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  377  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  378  	platform_set_drvdata(pdev, bwmon);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  379  	bwmon_start(bwmon, data);
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  380  
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  381  	return 0;
b9c2ae6cac403de Krzysztof Kozlowski 2022-07-04  382  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

