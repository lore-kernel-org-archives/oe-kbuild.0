Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC6ECB
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 11:22:26 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-2f939bea9ebso3734001f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 02 May 2023 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683026543; x=1685618543;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nIvwjJ0iCiAZZG2vTRW04uEx/oL2M+9z7xdEKH/GDCo=;
        b=hCuJSQAJKUl1OqCJ3eUlHiaZVW+euFR00TXYzhng/sIRjBaEs5nmqpFj+niPmFHxs7
         cWZpIGMp3XVqWmdP58UKuKyzdBxs0IuI35GILww3HmE1OPAgS5xaQvB6zPQVoosbHm4Y
         T6EPFQzGgQ1aYqYMJul6Kho2lH7Lsl9yJd9URaESc3+ngXNPDxreD2L41gyK/iU0wrko
         Zl8yn1JSWa8yobWNV+OPhIcYafIpzlOi43Cvap97HpCnxHXz5wseeBg8Q1/eT1Zi2G/o
         z3iNtaYAEFTC1S8lRklMkl5g3OlalRwklSkZZdSV0n1nUeaWpVCJNRamO72Nd+06T2w+
         sFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026543; x=1685618543;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIvwjJ0iCiAZZG2vTRW04uEx/oL2M+9z7xdEKH/GDCo=;
        b=QyOKTDBqmqurMipGIQfQAxSBtnbmMinGlxHNURyVSkexc1X8d+iUElsS+rhd7WhdY1
         y6UCsYHMOOGOl0dY1hTYRtBM+p5OTowRlQYbyd3pMLI8zWvxcg9D7v8CwSmcVqaEIhpV
         wmKvzvZ01DG8AAEViUjfWrmkt40HQKTA6gFoWNjqAY6jVhBrmXfndWWCC8teMshxQxmR
         rX/iS0ANWul/2BgzINbVMOmELDkerPw8eICmS5uv6BMdVh0zEacHlMYUACNzc6QKYNcP
         eUKG82WN9t1LrMhLHWn0OtFhlRAnfRnDfUJSQRBmSRlnBcDN8Np5ho2sbuNWoks3nA62
         4WxQ==
X-Gm-Message-State: AC+VfDyLxnxtdArMBBECGQ+uOnE4Ldxgcvw/ailIDGds9kEZAT5wdnBd
	gtp591EuGwbUia6VoEsBzYh/EFbalx6VLdQYV9E=
X-Google-Smtp-Source: ACHHUZ4oyAmXq/qqsncztOC0HCHOXAWBxIUIW//ggMZuSe8KhAgASW9FHJs6lsQ2BohZoAOcracAqA==
X-Received: by 2002:adf:ea90:0:b0:306:3036:611b with SMTP id s16-20020adfea90000000b003063036611bmr3310457wrm.22.1683026543169;
        Tue, 02 May 2023 04:22:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w23-20020a05600c099700b003f17af4c4e0sm38361855wmp.9.2023.05.02.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:22:21 -0700 (PDT)
Date: Tue, 2 May 2023 14:22:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marco Pagani <marpagan@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 4/4] fpga: add initial KUnit test suites
Message-ID: <e50f646a-1ff1-4b21-a937-b801a5eca9ea@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417122308.131453-5-marpagan@redhat.com>

Hi Marco,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/fpga-add-fake-FPGA-manager/20230417-203029
base:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
patch link:    https://lore.kernel.org/r/20230417122308.131453-5-marpagan%40redhat.com
patch subject: [RFC PATCH v4 4/4] fpga: add initial KUnit test suites
config: nios2-randconfig-m031-20230420 (https://download.01.org/0day-ci/archive/20230423/202304231455.FXiQya7T-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304231455.FXiQya7T-lkp@intel.com/

smatch warnings:
drivers/fpga/tests/fake-fpga-mgr.c:231 fake_fpga_mgr_register() warn: possible memory leak of 'mgr_ctx'
drivers/fpga/tests/fake-fpga-bridge.c:131 fake_fpga_bridge_register() warn: possible memory leak of 'bridge_ctx'
drivers/fpga/tests/fake-fpga-region.c:94 fake_fpga_region_register() warn: possible memory leak of 'region_ctx'
drivers/fpga/tests/fake-fpga-region.c:187 fake_region_get_bridges() error: uninitialized symbol 'ret'.
drivers/fpga/tests/fpga-test.c:245 fpga_bridge_test_get_put_list() error: 'bridge_1_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:308 fpga_test_init() error: 'base_ctx->mgr_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:309 fpga_test_init() error: 'base_ctx->bridge_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:408 fpga_test_partial_rcfg() error: 'sub_bridge_0_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:419 fpga_test_partial_rcfg() error: 'sub_bridge_1_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:432 fpga_test_partial_rcfg() error: 'sub_region_0_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:443 fpga_test_partial_rcfg() error: 'sub_region_1_ctx' dereferencing possible ERR_PTR()

vim +/mgr_ctx +231 drivers/fpga/tests/fake-fpga-mgr.c

0417c4b16b6924 Marco Pagani 2023-04-17  189  struct fake_fpga_mgr *
0417c4b16b6924 Marco Pagani 2023-04-17  190  fake_fpga_mgr_register(struct kunit *test, struct device *parent)
0417c4b16b6924 Marco Pagani 2023-04-17  191  {
0417c4b16b6924 Marco Pagani 2023-04-17  192  	struct fake_fpga_mgr *mgr_ctx;
0417c4b16b6924 Marco Pagani 2023-04-17  193  	struct fake_mgr_data pdata;
0417c4b16b6924 Marco Pagani 2023-04-17  194  	int ret;
0417c4b16b6924 Marco Pagani 2023-04-17  195  
0417c4b16b6924 Marco Pagani 2023-04-17  196  	mgr_ctx = kzalloc(sizeof(*mgr_ctx), GFP_KERNEL);
0417c4b16b6924 Marco Pagani 2023-04-17  197  	if (!mgr_ctx) {
0417c4b16b6924 Marco Pagani 2023-04-17  198  		ret = -ENOMEM;
0417c4b16b6924 Marco Pagani 2023-04-17  199  		goto err_mem;
0417c4b16b6924 Marco Pagani 2023-04-17  200  	}
0417c4b16b6924 Marco Pagani 2023-04-17  201  
0417c4b16b6924 Marco Pagani 2023-04-17  202  	mgr_ctx->pdev = platform_device_alloc(FAKE_FPGA_MGR_DEV_NAME,
0417c4b16b6924 Marco Pagani 2023-04-17  203  					      PLATFORM_DEVID_AUTO);
0417c4b16b6924 Marco Pagani 2023-04-17  204  	if (!mgr_ctx->pdev) {
0417c4b16b6924 Marco Pagani 2023-04-17  205  		pr_err("Fake FPGA manager device allocation failed\n");
0417c4b16b6924 Marco Pagani 2023-04-17  206  		ret = -ENOMEM;
0417c4b16b6924 Marco Pagani 2023-04-17  207  		goto err_mem;

goto err_free_mgr?

0417c4b16b6924 Marco Pagani 2023-04-17  208  	}
0417c4b16b6924 Marco Pagani 2023-04-17  209  
0417c4b16b6924 Marco Pagani 2023-04-17  210  	pdata.test = test;
0417c4b16b6924 Marco Pagani 2023-04-17  211  	platform_device_add_data(mgr_ctx->pdev, &pdata, sizeof(pdata));
0417c4b16b6924 Marco Pagani 2023-04-17  212  
0417c4b16b6924 Marco Pagani 2023-04-17  213  	mgr_ctx->pdev->dev.parent = parent;
0417c4b16b6924 Marco Pagani 2023-04-17  214  	ret = platform_device_add(mgr_ctx->pdev);
0417c4b16b6924 Marco Pagani 2023-04-17  215  	if (ret) {
0417c4b16b6924 Marco Pagani 2023-04-17  216  		pr_err("Fake FPGA manager device add failed\n");
0417c4b16b6924 Marco Pagani 2023-04-17  217  		goto err_pdev;
0417c4b16b6924 Marco Pagani 2023-04-17  218  	}
0417c4b16b6924 Marco Pagani 2023-04-17  219  
0417c4b16b6924 Marco Pagani 2023-04-17  220  	mgr_ctx->mgr = platform_get_drvdata(mgr_ctx->pdev);
0417c4b16b6924 Marco Pagani 2023-04-17  221  
0417c4b16b6924 Marco Pagani 2023-04-17  222  	if (test)
0417c4b16b6924 Marco Pagani 2023-04-17  223  		kunit_info(test, "Fake FPGA manager registered\n");
0417c4b16b6924 Marco Pagani 2023-04-17  224  
0417c4b16b6924 Marco Pagani 2023-04-17  225  	return mgr_ctx;
0417c4b16b6924 Marco Pagani 2023-04-17  226  
0417c4b16b6924 Marco Pagani 2023-04-17  227  err_pdev:
0417c4b16b6924 Marco Pagani 2023-04-17  228  	platform_device_put(mgr_ctx->pdev);

err_free_mgr:

0417c4b16b6924 Marco Pagani 2023-04-17  229  	kfree(mgr_ctx);
0417c4b16b6924 Marco Pagani 2023-04-17  230  err_mem:
0417c4b16b6924 Marco Pagani 2023-04-17 @231  	return ERR_PTR(ret);
0417c4b16b6924 Marco Pagani 2023-04-17  232  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

