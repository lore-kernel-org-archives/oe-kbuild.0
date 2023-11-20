Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160BD1C2A5
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKyjpsvc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32f78dcf036so3313064f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700490127; x=1701094927; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZRoTaJ32o9tPRXkkVwVS9YWvdhMT3yvRyQ+4toqfvw=;
        b=DKyjpsvcaIbAijyOLq58wAuZLgrW7BfXnNtq/8/aIPzhzCvPVZKuRDFSDvJ5u8YK5o
         xAk+lq2LV0CgfKxhnTUMDJZt6bZ2590mi8Ty5l0wGm3giadQVxt3ln0C9tbftnBTfWD+
         Og7uEaJegLf8/w7l5h5DPrMwicFZtcbOq0fR95usLCY+1MlPk0TGLScDgjgaWwNu6/TR
         GaudzRITRo67NzgcYSQUVprRpXEOLglXRq8rKNhmNIWThv1Cm+/aIUO4wzDUqAcpmSmo
         lGkgPJPV6Gj2k6DugjY6M25g/kArTkNTUay2uChvdEHr7btp3qXnUP0BkncYOqeuUAmX
         OJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700490127; x=1701094927;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZRoTaJ32o9tPRXkkVwVS9YWvdhMT3yvRyQ+4toqfvw=;
        b=OvulkDMkeuSiJrzkLr/1EqBgt9o31iT6hOiJS45SwsiSdy3CVWfsfz/4VTx8nmntBT
         lMVZXJrkturhWM5sUYG3Ciy3oh6e93+W+yN7N29Cwg3/vlxZ/t/+X2VDSUoL9cChVRYW
         NucHEi+6u9cuXWUSrd3wtD36AyIYM+d0k863froiCgfayNoYBZd2Mj1cMuyv7uTImtsv
         1d4Eogxzfw4fPpbKldDUR5R3YAVNhvYt8htktCgc3YLNx8F1vEXqn3tl13Fa/LxLabQB
         b815IAnh4GD0lGgfN6C71C8vXa2yqTulud2dyXrcQZHmhGvRIcFeuHNXMXj9enmike0/
         zqJw==
X-Gm-Message-State: AOJu0YyC9VHRbm+SXoLhBnPGCRpH2MmLDfzrnSYiaa7AJKJSKfZHhunY
	nHmTMMXGXPR4bctdvWqu1AbFKHpNNvqEiFKB1tA=
X-Google-Smtp-Source: AGHT+IFiA9HA9YGTYfmnRJC/OH9eFnvSMpMYsG1aOBeKPBbXmirgcRrKHviUUGkw4b9Eh2Ya3MfMqg==
X-Received: by 2002:a5d:47a6:0:b0:332:c65a:8f1e with SMTP id 6-20020a5d47a6000000b00332c65a8f1emr3774513wrb.19.1700490126592;
        Mon, 20 Nov 2023 06:22:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020adfcc8b000000b0032d9337e7d1sm11390181wrj.11.2023.11.20.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:22:06 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 09:22:03 -0500
To: oe-kbuild@lists.linux.dev, Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jenny Zhang <jenny.zhang@starfivetech.com>
Subject: drivers/char/hw_random/jh7110-trng.c:303 starfive_trng_probe() warn:
 passing zero to 'dev_err_probe'
Message-ID: <e9e60d3b-77db-4b5d-ae63-b5454f61a59f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: c388f458bc34eb3a5728b67f6614f9375cd99087 hwrng: starfive - Add TRNG driver for StarFive SoC
config: riscv-randconfig-r071-20231112 (https://download.01.org/0day-ci/archive/20231116/202311160649.3GhKCfhd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160649.3GhKCfhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311160649.3GhKCfhd-lkp@intel.com/

smatch warnings:
drivers/char/hw_random/jh7110-trng.c:303 starfive_trng_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +303 drivers/char/hw_random/jh7110-trng.c

c388f458bc34eb Jia Jie Ho 2023-01-17  274  static int starfive_trng_probe(struct platform_device *pdev)
c388f458bc34eb Jia Jie Ho 2023-01-17  275  {
c388f458bc34eb Jia Jie Ho 2023-01-17  276  	int ret;
c388f458bc34eb Jia Jie Ho 2023-01-17  277  	int irq;
c388f458bc34eb Jia Jie Ho 2023-01-17  278  	struct starfive_trng *trng;
c388f458bc34eb Jia Jie Ho 2023-01-17  279  
c388f458bc34eb Jia Jie Ho 2023-01-17  280  	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
c388f458bc34eb Jia Jie Ho 2023-01-17  281  	if (!trng)
c388f458bc34eb Jia Jie Ho 2023-01-17  282  		return -ENOMEM;
c388f458bc34eb Jia Jie Ho 2023-01-17  283  
c388f458bc34eb Jia Jie Ho 2023-01-17  284  	platform_set_drvdata(pdev, trng);
c388f458bc34eb Jia Jie Ho 2023-01-17  285  	trng->dev = &pdev->dev;
c388f458bc34eb Jia Jie Ho 2023-01-17  286  
c388f458bc34eb Jia Jie Ho 2023-01-17  287  	trng->base = devm_platform_ioremap_resource(pdev, 0);
c388f458bc34eb Jia Jie Ho 2023-01-17  288  	if (IS_ERR(trng->base))
c388f458bc34eb Jia Jie Ho 2023-01-17  289  		return dev_err_probe(&pdev->dev, PTR_ERR(trng->base),
c388f458bc34eb Jia Jie Ho 2023-01-17  290  				     "Error remapping memory for platform device.\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  291  
c388f458bc34eb Jia Jie Ho 2023-01-17  292  	irq = platform_get_irq(pdev, 0);
c388f458bc34eb Jia Jie Ho 2023-01-17  293  	if (irq < 0)
c388f458bc34eb Jia Jie Ho 2023-01-17  294  		return irq;
c388f458bc34eb Jia Jie Ho 2023-01-17  295  
c388f458bc34eb Jia Jie Ho 2023-01-17  296  	init_completion(&trng->random_done);
c388f458bc34eb Jia Jie Ho 2023-01-17  297  	init_completion(&trng->reseed_done);
c388f458bc34eb Jia Jie Ho 2023-01-17  298  	spin_lock_init(&trng->write_lock);
c388f458bc34eb Jia Jie Ho 2023-01-17  299  
c388f458bc34eb Jia Jie Ho 2023-01-17  300  	ret = devm_request_irq(&pdev->dev, irq, starfive_trng_irq, 0, pdev->name,
c388f458bc34eb Jia Jie Ho 2023-01-17  301  			       (void *)trng);
c388f458bc34eb Jia Jie Ho 2023-01-17  302  	if (ret)
c388f458bc34eb Jia Jie Ho 2023-01-17 @303  		return dev_err_probe(&pdev->dev, irq,
                                                                                         ^^^
Should be "ret".  Weird how we're getting this warning in November when
the code is from Jan...  Looks like the bug is still their in linux-next
though.

c388f458bc34eb Jia Jie Ho 2023-01-17  304  				     "Failed to register interrupt handler\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  305  
c388f458bc34eb Jia Jie Ho 2023-01-17  306  	trng->hclk = devm_clk_get(&pdev->dev, "hclk");
c388f458bc34eb Jia Jie Ho 2023-01-17  307  	if (IS_ERR(trng->hclk))
c388f458bc34eb Jia Jie Ho 2023-01-17  308  		return dev_err_probe(&pdev->dev, PTR_ERR(trng->hclk),
c388f458bc34eb Jia Jie Ho 2023-01-17  309  				     "Error getting hardware reference clock\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  310  
c388f458bc34eb Jia Jie Ho 2023-01-17  311  	trng->ahb = devm_clk_get(&pdev->dev, "ahb");
c388f458bc34eb Jia Jie Ho 2023-01-17  312  	if (IS_ERR(trng->ahb))
c388f458bc34eb Jia Jie Ho 2023-01-17  313  		return dev_err_probe(&pdev->dev, PTR_ERR(trng->ahb),
c388f458bc34eb Jia Jie Ho 2023-01-17  314  				     "Error getting ahb reference clock\n");
c388f458bc34eb Jia Jie Ho 2023-01-17  315  
c388f458bc34eb Jia Jie Ho 2023-01-17  316  	trng->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
c388f458bc34eb Jia Jie Ho 2023-01-17  317  	if (IS_ERR(trng->rst))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

