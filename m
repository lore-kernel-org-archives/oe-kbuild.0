Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AEA224D7
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 09:08:00 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-502a25ab777so1151374e87.2
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694682479; x=1695287279; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9TycA2d+hGJE1L0NgDvv7LXEnVNEc9UIvN0YyZsaCs=;
        b=UBKFh70MKrQedNwEK9ZhVWJlyAHHZWFHeGWnPmaJ/+Vn1ioYEDdJftTKXRIspAWFUO
         8QmKQ6/DogqweHpyB6qvPURXQMKWK222qQjh3KHUYEC3SHZTUEXUsNP5b9JE0fbbgKYl
         F4WvfAoEP6NVOkIpOwv46fnmAyriBTiEXIJr8j2BGjoB0vGtsBGVJJ2cvEM2tz1we7gH
         Wa+Vfv0bcUiLHCBJCpvj7aNHl3fjfT6kMoIEZR5SPSnwo0w1EVRMR4GWcaPAEuHEFD2o
         hNBptIifA6T12wi3oRXuVoCvOAg5UMoqJ7WVB55Bu45jdbp3mwa2t6EYsiS2BeKNHyl1
         0B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694682479; x=1695287279;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9TycA2d+hGJE1L0NgDvv7LXEnVNEc9UIvN0YyZsaCs=;
        b=gmVwttHzyL8wAr7IBtdThqSogRcjetvzgAnuS+ql9MdsgOVaaG7O2IPe/Ixw1aC8A8
         oswBEHs/vDMxDwCA3J8MEAqr7p1Zg3YB3EmKZXvc2vYN9WmwxQED1vH2EotLROE9Tyxs
         MEIzOHLICIzyrsJSQqOzgKvTQEeN/7krwbzUfc3fjkmMqxlCyYLAvpGnwkNYbWUrAziW
         NW2xFUSgxXktNElQUNIaZVizcEa5w9WkKE48Ibz0r0UWTTfyc2OFxaxqlXVveEcucp6q
         SocVAlHA39f5yPlUlJXb//lQys/qtYFVw1jlqDdAJ13iXdEyE5aagFHcnjVh1ETJx1pw
         JC4w==
X-Gm-Message-State: AOJu0YyqQgt9P1w2C1HFzZKRHkv/zcnEJj7b/duVOJ/kX7TkNXZGQU8t
	3zTOK3vWXEApmTB5ME0Fgz9K8VbsFTJ0wxkfE8M=
X-Google-Smtp-Source: AGHT+IEhZfr26lx/zOB+3rXdj47mmxYKGr4MGtrjiZLEDg9RGj5jWskyUWslOi+rpx6NzHq2bmWjYw==
X-Received: by 2002:a05:6512:110c:b0:502:9fce:b6cc with SMTP id l12-20020a056512110c00b005029fceb6ccmr4731705lfg.11.1694682478601;
        Thu, 14 Sep 2023 02:07:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c028800b00402c0a8a084sm4182967wmk.17.2023.09.14.02.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:07:58 -0700 (PDT)
Date: Thu, 14 Sep 2023 12:07:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dhruva Gole <d-gole@ti.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>
Subject: [linux-next:master 1275/4965] drivers/spi/spi-cadence-quadspi.c:1882
 cqspi_probe() warn: missing unwind goto?
Message-ID: <5e21c351-cd08-443e-8509-aecf242a4da9@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e143016b56ecb0fcda5bb6026b0a25fe55274f56
commit: 0578a6dbfe7514db7134501cf93acc21cf13e479 [1275/4965] spi: spi-cadence-quadspi: add runtime pm support
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140543.03dMbMM5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140543.03dMbMM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309140543.03dMbMM5-lkp@intel.com/

smatch warnings:
drivers/spi/spi-cadence-quadspi.c:1882 cqspi_probe() warn: missing unwind goto?

vim +1882 drivers/spi/spi-cadence-quadspi.c

14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1861  	cqspi_wait_idle(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1862  	cqspi_controller_init(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1863  	cqspi->current_cs = -1;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1864  	cqspi->sclk = 0;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1865  
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1866  	host->num_chipselect = cqspi->num_chipselect;
b436fb7d29bfa4 drivers/spi/spi-cadence-quadspi.c                 Ramuthevar Vadivel Murugan 2020-11-24  1867  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1868  	ret = cqspi_setup_flash(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1869  	if (ret) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1870  		dev_err(dev, "failed to setup flash parameters %d\n", ret);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1871  		goto probe_setup_failed;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1872  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1873  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1874  	if (cqspi->use_direct_mode) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1875  		ret = cqspi_request_mmap_dma(cqspi);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1876  		if (ret == -EPROBE_DEFER)
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1877  			goto probe_setup_failed;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1878  	}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1879  
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1880  	ret = devm_pm_runtime_enable(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1881  	if (ret)
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29 @1882  		return ret;

This needs to clean up before returning.  The error handling in this
function is slightly buggy.  It needs to undo cqspi_request_mmap_dma()
for example using:

	if (cqspi->rx_chan)
		dma_release_channel(cqspi->rx_chan);

I wrote a blog about error handling:
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1883  
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1884  	pm_runtime_set_autosuspend_delay(dev, CQSPI_AUTOSUSPEND_TIMEOUT);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1885  	pm_runtime_use_autosuspend(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1886  	pm_runtime_get_noresume(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1887  
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1888  	ret = spi_register_controller(host);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1889  	if (ret) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1890  		dev_err(&pdev->dev, "failed to register SPI ctlr %d\n", ret);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1891  		goto probe_setup_failed;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1892  	}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1893  
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1894  	pm_runtime_mark_last_busy(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1895  	pm_runtime_put_autosuspend(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1896  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1897  	return 0;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1898  probe_setup_failed:
329864d35a7f49 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1899  	cqspi_controller_enable(cqspi, 0);
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1900  probe_reset_failed:
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1901  	clk_disable_unprepare(cqspi->clk);
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1902  probe_clk_failed:
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1903  	return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1904  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

