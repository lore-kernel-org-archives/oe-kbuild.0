Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0925EF9C
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155645; cv=none; b=R/kakDsUxIiJdLK8lHpIBwwT/R0cTMVT7QMlgfmMNKr0pu7FKoA/11wuXzjaae/mYBj+py4qM8jPOQ+cE8MAxfCE2rcdWzBHQLB9jYqknzB0TGpqlhqjaMOon6hpHKQKsDF+xgrCb9XvBmPkstxbtbBybMugBRvBgTlFN1IbF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155645; c=relaxed/simple;
	bh=hDI+QCx07/AA+50YEkqGaqIlvDcXSqreOpqc3cQQCe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VfRympf0eomjZvfQvbhV1Vvx//fElpQTOc6ultbWbXwuAZZkn9wytvWZFquPDnLLZnIvwYh0ktsGCCc6Z9UEf8jBTwxzrj/mwu5GdmckJM30yew1zNzTuJ7xKIC5Qpa5ePkaUrxWNrQvi5M/j5qCpDlkYUGKsRp83ppShWZTUVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lA+U2rUZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lA+U2rUZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b00a65fso2910665e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755155641; x=1755760441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t9E3NrCTEwbCDabEtVeBf62CMBWNpRfAcIAwAy7HrVc=;
        b=lA+U2rUZCsRPBvOrKbIcD2D1poez3kTXy57GMt+VBsCq9WtZSCJD2OqJF1CWID3uu4
         qrM48NHq5n76n3GaBxDpwmldoezxdYcbj6qXtpTQpcgOjPYA6t6EupMyesA/x0uf5Eba
         xfcEmWy6GTZN7FF/Hru4JV5P2cypt7TjyDIdXEFMTS1a0OzeRkfrFloHZjcaNja8KtLE
         jrLVrzAJVnrh8lWaZUlI5lQuQwM27VpdBaWxJjF2Wb6XLAYwFOKSqeX9aqCz0nuc9yeP
         OvxFdGj12iqx/RjokrEaCp5lej/LVrb+SSl5xclNNpym2AGhu7UDh/sSA0jX5w+ekaLV
         vqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155641; x=1755760441;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9E3NrCTEwbCDabEtVeBf62CMBWNpRfAcIAwAy7HrVc=;
        b=hYtaQ1SRY2N5wdXMMDLU5kfILGNm3VBjqSIJQXnrPqpZW1PSEkBZPQfkeg4Nea/TOm
         mtv2HEM7zX4X8BuFKK/vr2ZTZ3+Vaf2h9vEXxJPKWnBxoWMCcmeWNdCNsDDwre2bFIKy
         CUbzSSq/Tv0zjBVRJr1LW8qrQFjnLlCDb/KxtmKX3IOjGF5QYR81RwsuazYj4OXHp0ME
         aUooZxpcdRvvmDmDDv1DyEZrzYo8HsqvuYzMTmTIUYtkrnWNYazuejzmEO8s55hzjQvI
         EaMXtUFFuT/O1XHdUmdBuIW+hSYnZQn5rhAMWUTUuED7+YmiiDaY/wg1D4FWIQRsnvvA
         Ie9w==
X-Gm-Message-State: AOJu0YweKY3FZtNiAe7jh2yuRi4xkHamIJO4nfxnxSioy2PIAwE0xXN8
	DKrboNf9EwquK+9R3Bs4x2K51M3YpSU9rDVj45Cd70U0Fw9bTLAPC8RUKG+/lcq+dvji3S8wDRh
	xKZuY
X-Gm-Gg: ASbGncsLk3nZHljsmU8pWWk3BsLaS7i4FD/Vcs/t/pq3gNQVy0CBu8Nv0fLMXyfldhc
	0IgKwSRLV4/b+h9oIgQC4EX4IfBJlTsCXmzIJ5Pi811OyTJEAopxZ/EDWid2ud+o4kfAXA/1xgT
	SoMfEvDITsSEMF1Xem+YTjstDbpyAw2+0Y3qQu44AHRkopfKTzm+F7Og+J6V3J9K3GdHh17O8Lq
	t7aP7mk1j8RFZuXGasWKrmoe1ALtgVSRd0Kw9ZQ6VA2X6B7a8Z4wJz6t6ZukHSmTI79sky9jSGO
	DQmZr9Ec75ctdV7OZ84PS4NYtyhZCXVYQNGfD6WC6UAc6RhvrpHIBrLGFsJhUFIBIbEF3W9gL8t
	pclpNQI5CvcB07QlOCRP5lCjje6s=
X-Google-Smtp-Source: AGHT+IFP9kiDc1q1dkQQRBUhr400gKrEB0WYTXwapO4qVV4879GgEBYYtEyy7MjPdh+h9soCzQb3KQ==
X-Received: by 2002:a05:6000:2089:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3b9edfd196emr1313673f8f.3.1755155641197;
        Thu, 14 Aug 2025 00:14:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c70acc7sm9647105e9.25.2025.08.14.00.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:14:00 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:13:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
	linux-rockchip@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	lgirdwood@gmail.com, sre@kernel.org, heiko@sntech.de,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V6 4/5] regulator: bq257xx: Add bq257xx boost regulator
 driver
Message-ID: <202508141051.hwl2Erq6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812214300.123129-5-macroalpha82@gmail.com>
Message-ID: <20250814071356.U7rYN6MuEoG7F525wActO8FfplePG5-y6L9EF7Iqm6I@z>

Hi Chris,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-mfd-ti-bq25703a-Add-TI-BQ25703A-Charger/20250813-054704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250812214300.123129-5-macroalpha82%40gmail.com
patch subject: [PATCH V6 4/5] regulator: bq257xx: Add bq257xx boost regulator driver
config: m68k-randconfig-r073-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141051.hwl2Erq6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508141051.hwl2Erq6-lkp@intel.com/

smatch warnings:
drivers/regulator/bq257xx-regulator.c:161 bq257xx_regulator_probe() error: uninitialized symbol 'init_data'.

vim +/init_data +161 drivers/regulator/bq257xx-regulator.c

d6db7dce7cd965 Chris Morgan 2025-08-12  138  static int bq257xx_regulator_probe(struct platform_device *pdev)
d6db7dce7cd965 Chris Morgan 2025-08-12  139  {
d6db7dce7cd965 Chris Morgan 2025-08-12  140  	struct device *dev = &pdev->dev;
d6db7dce7cd965 Chris Morgan 2025-08-12  141  	struct bq257xx_device *bq = dev_get_drvdata(pdev->dev.parent);
d6db7dce7cd965 Chris Morgan 2025-08-12  142  	struct bq257xx_reg_data *pdata;
d6db7dce7cd965 Chris Morgan 2025-08-12  143  	struct device_node *np = dev->of_node;
d6db7dce7cd965 Chris Morgan 2025-08-12  144  	struct regulator_init_data *init_data;
d6db7dce7cd965 Chris Morgan 2025-08-12  145  	struct regulator_config cfg = {};
d6db7dce7cd965 Chris Morgan 2025-08-12  146  
d6db7dce7cd965 Chris Morgan 2025-08-12  147  	pdev->dev.of_node = pdev->dev.parent->of_node;
d6db7dce7cd965 Chris Morgan 2025-08-12  148  	pdev->dev.of_node_reused = true;
d6db7dce7cd965 Chris Morgan 2025-08-12  149  
d6db7dce7cd965 Chris Morgan 2025-08-12  150  	pdata = devm_kzalloc(&pdev->dev, sizeof(struct bq257xx_reg_data), GFP_KERNEL);
d6db7dce7cd965 Chris Morgan 2025-08-12  151  	if (!pdata)
d6db7dce7cd965 Chris Morgan 2025-08-12  152  		return -ENOMEM;
d6db7dce7cd965 Chris Morgan 2025-08-12  153  
d6db7dce7cd965 Chris Morgan 2025-08-12  154  	pdata->bq = bq;
d6db7dce7cd965 Chris Morgan 2025-08-12  155  	pdata->desc = bq25703_vbus_desc;
d6db7dce7cd965 Chris Morgan 2025-08-12  156  
d6db7dce7cd965 Chris Morgan 2025-08-12  157  	platform_set_drvdata(pdev, pdata);
d6db7dce7cd965 Chris Morgan 2025-08-12  158  	bq257xx_reg_dt_parse_gpio(pdev);
d6db7dce7cd965 Chris Morgan 2025-08-12  159  
d6db7dce7cd965 Chris Morgan 2025-08-12  160  	cfg.dev = &pdev->dev;
d6db7dce7cd965 Chris Morgan 2025-08-12 @161  	cfg.init_data = init_data;
                                                                ^^^^^^^^^
Uninitialized.

d6db7dce7cd965 Chris Morgan 2025-08-12  162  	cfg.driver_data = pdata;
d6db7dce7cd965 Chris Morgan 2025-08-12  163  	cfg.of_node = np;
d6db7dce7cd965 Chris Morgan 2025-08-12  164  	cfg.regmap = dev_get_regmap(pdev->dev.parent, NULL);
d6db7dce7cd965 Chris Morgan 2025-08-12  165  	if (!cfg.regmap)
d6db7dce7cd965 Chris Morgan 2025-08-12  166  		return -ENODEV;
d6db7dce7cd965 Chris Morgan 2025-08-12  167  
d6db7dce7cd965 Chris Morgan 2025-08-12  168  	pdata->bq257xx_reg = devm_regulator_register(dev, &pdata->desc, &cfg);
d6db7dce7cd965 Chris Morgan 2025-08-12  169  	if (IS_ERR(pdata->bq257xx_reg)) {
d6db7dce7cd965 Chris Morgan 2025-08-12  170  		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->bq257xx_reg),
d6db7dce7cd965 Chris Morgan 2025-08-12  171  				     "error registering bq257xx regulator");
d6db7dce7cd965 Chris Morgan 2025-08-12  172  	}
d6db7dce7cd965 Chris Morgan 2025-08-12  173  
d6db7dce7cd965 Chris Morgan 2025-08-12  174  	return 0;
d6db7dce7cd965 Chris Morgan 2025-08-12  175  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

