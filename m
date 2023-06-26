Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CAA8F60
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 13:05:35 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-313f04ff978so988101f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687784732; x=1690376732;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjDvgBLfkeCQ7u1JAhSIaUDf6xaKsvh/5fwzmjOxvzY=;
        b=eaIQGRKP860//c8yA0AgUhcPbWoikUFKNOD9r0CR+BYchlp0RDhI3PfNF5YWcv9LHz
         9ywLsbOYH9Xach3blyCjLyWRw91F4y7OaqoJ+DHnZoW6hOpPWz5+SIAAb++f+hd1vNVx
         I+RN1K007OlG4tTW3hR1abJKk41d62EVDZRl+8plaADRg5t0ZztbpCSKGrX/8QhoFuvQ
         eCTFC3XFNz22x7JPNqegsJhPHepTAfGtaA/k8NuTM564jO4EBlH58uozElFb6WNDgHwX
         zBkplqk40Tio3sjc1VworxvSBsVvfeVONGokSDy9iPLUUfOzW7PkjowCtj728/gsW4h0
         cdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687784732; x=1690376732;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjDvgBLfkeCQ7u1JAhSIaUDf6xaKsvh/5fwzmjOxvzY=;
        b=a/fa1M3AIa/SRyWV1ds/aKaNa2BfKIpemTREuTVbl70CdJ+V88czXlAPKDbXpXoweQ
         tUmLElkG+2ZoxT+o9cGQx7byBME2Uo6SzvgTSiKbe7tPRPJa/SWkPrd250HVuxd80YBa
         /YxBUDnvXzLhXyoB9ULCzPEinounw2dI9TY2WpMLFOOIFhF7UKDRUGltdqzT7wwtfXyw
         05tFXgQhmaX0ofCL9N6XSatuHq3kCZAO3QfuRuHmgj1htOyIojcCmBsKGvtDMY8RXjxZ
         O8b5qXlSK9f9OrVrJbxnRF+uAwhWe/2X0HuFBuJJuwJuzJolhD8e3EsPKs/gFoFWCL5C
         WkVA==
X-Gm-Message-State: AC+VfDzksHz3JCgs+FAEtbA/bkq4Z4aq3KDppUdz1BnA7Lt8qdo81v5J
	V9bHnz83yK0nAxxOhSDkhLJGNJTHs+ibsZt3U/A=
X-Google-Smtp-Source: ACHHUZ4mJvdIUeHYQShkE7gsmqFx5B0cm0FoWwqhcT2rDJPiGsKQdLI2VwLZoqbt+IVVVmKBKL+I4A==
X-Received: by 2002:adf:ee50:0:b0:313:f59f:986d with SMTP id w16-20020adfee50000000b00313f59f986dmr977022wro.65.1687784732396;
        Mon, 26 Jun 2023 06:05:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d6986000000b0031130b9b173sm7344716wru.34.2023.06.26.06.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:05:31 -0700 (PDT)
Date: Mon, 26 Jun 2023 16:05:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 22/24] Input: bcm-keypad - Simplify with
 dev_err_probe()
Message-ID: <3b63bde3-797e-4d58-92a7-c77c953f17d6@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230625162817.100397-23-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/Input-gpio_keys_polled-Simplify-with-dev_err_probe/20230626-003156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20230625162817.100397-23-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH v4 22/24] Input: bcm-keypad - Simplify with dev_err_probe()
config: i386-randconfig-m021-20230625 (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306261505.wTjCXRIO-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/bcm-keypad.c:370 bcm_kp_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +370 drivers/input/keyboard/bcm-keypad.c

0c7e67a928ac53 Scott Branden       2015-02-28  348  	error = matrix_keypad_build_keymap(NULL, NULL,
0c7e67a928ac53 Scott Branden       2015-02-28  349  					   kp->n_rows, kp->n_cols,
0c7e67a928ac53 Scott Branden       2015-02-28  350  					   NULL, input_dev);
0c7e67a928ac53 Scott Branden       2015-02-28  351  	if (error) {
0c7e67a928ac53 Scott Branden       2015-02-28  352  		dev_err(&pdev->dev, "failed to build keymap\n");
0c7e67a928ac53 Scott Branden       2015-02-28  353  		return error;
0c7e67a928ac53 Scott Branden       2015-02-28  354  	}
0c7e67a928ac53 Scott Branden       2015-02-28  355  
0c7e67a928ac53 Scott Branden       2015-02-28  356  	/* Get the KEYPAD base address */
0c7e67a928ac53 Scott Branden       2015-02-28  357  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
0c7e67a928ac53 Scott Branden       2015-02-28  358  	if (!res) {
0c7e67a928ac53 Scott Branden       2015-02-28  359  		dev_err(&pdev->dev, "Missing keypad base address resource\n");
0c7e67a928ac53 Scott Branden       2015-02-28  360  		return -ENODEV;
0c7e67a928ac53 Scott Branden       2015-02-28  361  	}
0c7e67a928ac53 Scott Branden       2015-02-28  362  
0c7e67a928ac53 Scott Branden       2015-02-28  363  	kp->base = devm_ioremap_resource(&pdev->dev, res);
0c7e67a928ac53 Scott Branden       2015-02-28  364  	if (IS_ERR(kp->base))
0c7e67a928ac53 Scott Branden       2015-02-28  365  		return PTR_ERR(kp->base);
0c7e67a928ac53 Scott Branden       2015-02-28  366  
0c7e67a928ac53 Scott Branden       2015-02-28  367  	/* Enable clock */
5d0380bcb07530 Krzysztof Kozlowski 2023-06-25  368  	kp->clk = devm_clk_get_optional(&pdev->dev, "peri_clk");
0c7e67a928ac53 Scott Branden       2015-02-28  369  	if (IS_ERR(kp->clk)) {
5d0380bcb07530 Krzysztof Kozlowski 2023-06-25 @370  		return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");

s/error/PTR_ERR(kp->clk)/

5d0380bcb07530 Krzysztof Kozlowski 2023-06-25  371  	} else if (!kp->clk) {
5d0380bcb07530 Krzysztof Kozlowski 2023-06-25  372  		dev_dbg(&pdev->dev, "No clock specified. Assuming it's enabled\n");
0c7e67a928ac53 Scott Branden       2015-02-28  373  	} else {
0c7e67a928ac53 Scott Branden       2015-02-28  374  		unsigned int desired_rate;
0c7e67a928ac53 Scott Branden       2015-02-28  375  		long actual_rate;
0c7e67a928ac53 Scott Branden       2015-02-28  376  
0c7e67a928ac53 Scott Branden       2015-02-28  377  		error = of_property_read_u32(pdev->dev.of_node,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

