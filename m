Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A623AD
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Mar 2024 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709373954; cv=none; b=kbmKkQhELklbX0QgnLEuJG3WPi3XpZQXxVcZ+XpnC88Hx5KoxAE/YqmXm/Leyf/S8w67teeS5nB3xAHGPv6G7U+zDEZZOkSZrcjcrGWEFLVf1dReFdbDyaYWgnjsZaiXSzXvIWqGlvTSq44d4WJGj4hdNf3Th9+ztUvNpI6gNK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709373954; c=relaxed/simple;
	bh=hh0T0s0UufgYOP8l9L/QviOwtz3/7LcIlwRMvhfReS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOpQmNaBbsdSk7gkLsxpVAizLWQi0ybzpzdN6fLjHzvovmfgDMJhx700fWPn10qrjkZ/tjpVQMqe+Dr2G2WKnrBiRNi5gEZm1hlMtBFD3/16xsSEFXMP3V2a295IYHbr8ppI1NxelzzLtkbU9GzgGavxYoFqtSwZvMkIar4GqdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSuQpJHE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSuQpJHE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412d67e4e91so1197685e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 02 Mar 2024 02:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709373951; x=1709978751; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFUtAlxmJVizfJmrvCvJuODkamjzYH11rLdKEFqWZD4=;
        b=sSuQpJHE+h3SJ79fhS3uxDLu6REA7bjpQegwLcZWGCpJmLIs0kccARPDwr22CyepQz
         nvyRTwPCLmWwjv7Pwnd4gq765DPB+XQnOvsBibw/O+kKj4lPM+Ee+0rY3FkJnuOMbq7d
         p0jgBN5RgX6eREQdTMjRu7ZucxojbXyuHsFVB1RsqBMcEGyd35sBBPHQJZDyE41XK/nT
         aHf4Ejj6amC1A+dg4FHKu/czS1rvObvmz3xiq7J/um++NkPNw86Ky3vO3n/5dfwumfyR
         8E2ivtRlkdaRSuKRJVPlxvpLl4HnIzQr8vAIZ0sWT94JFuCiUTSp6vKvBeoyfTFYwk0E
         22Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709373951; x=1709978751;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFUtAlxmJVizfJmrvCvJuODkamjzYH11rLdKEFqWZD4=;
        b=CsBXh2Za1XLitZ5SLc7jPXj3sfkBZYZVXoNwhXkrQMtoY1LA2gcTYxNNYWw6eXP4oG
         MqigJuFt4luc5NzH/UPJwr4dzeCq8CEkCoFcBWGf1XcMoWdFoT2cY7CPD6AUcsI0MXT6
         2+Ubww8+RiFhWvQVPwEHURh+7zakA8fzGqIsr7FsWkpH6LFbd32fpmV0t5s5oZBaLNOT
         nexe96AFTBOlQ+KKFgM3lf8weK7h+xEqZGZiq5QRnSVBEqMSgoqUVFLlm7ZGC2I6q5kf
         FeZ9dQsP86j476quq5fLzU5wJP157BHRKwTWh4J7hAzuZeORZxyXF9CO0HdqDlEf4f3x
         FtEg==
X-Gm-Message-State: AOJu0YwZHfH4akLOQbNnyjHRL5g8dh7Zzvwg1TDITBTQyn2ww+htyjXv
	AEKkeQ/zzkMuhzGhVMvzh4k8TTaJz/4e1wgIIfXDXEpXsvgvhsgFdtpHwGtNk+hp4T1bWmOgeHY
	S
X-Google-Smtp-Source: AGHT+IE/6SL7kjXh20wHEUAKzmd/8XbfNxpOYBUCPI3xcrJ7z8PdOZnCGUgJshdX0SqyWiPn91TuIA==
X-Received: by 2002:a05:600c:468a:b0:412:bcc9:32dc with SMTP id p10-20020a05600c468a00b00412bcc932dcmr3663497wmo.31.1709373950800;
        Sat, 02 Mar 2024 02:05:50 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c138a00b00412cbe411f0sm666647wmf.0.2024.03.02.02.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 02:05:50 -0800 (PST)
Date: Sat, 2 Mar 2024 13:05:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xi Pardee <xi.pardee@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Rajvi Jingar <rajvi.jingar@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore()
 error: uninitialized symbol 'map'.
Message-ID: <cdae87ea-ad8b-44d4-936a-c3b698186932@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ad3cb0ed525b80c7f66c32b49a68c1f3510bec9
commit: 2bcef4529222424559ac9b45948ee9d82c09d9b5 platform/x86:intel/pmc: Enable debugfs multiple PMC support
config: i386-randconfig-141-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021544.6qtkaAly-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403021544.6qtkaAly-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: uninitialized symbol 'map'.

Old smatch warnings:
drivers/platform/x86/intel/pmc/core.c:500 pmc_core_send_ltr_ignore() error: uninitialized symbol 'pmc'.

vim +/map +500 drivers/platform/x86/intel/pmc/core.c

92f530edd7c955 drivers/platform/x86/intel/pmc/core.c Gayatri Kammela   2022-11-14  463  int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  464  {
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  465  	struct pmc *pmc;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  466  	const struct pmc_reg_map *map;
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  467  	u32 reg;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  468  	int pmc_index, ltr_index;
9592438886756c drivers/platform/x86/intel_pmc_core.c Andy Shevchenko   2019-12-18  469  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  470  	ltr_index = value;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  471  	/* For platforms with multiple pmcs, ltr index value given by user
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  472  	 * is based on the contiguous indexes from ltr_show output.
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  473  	 * pmc index and ltr index needs to be calculated from it.
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  474  	 */
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  475  	for (pmc_index = 0; pmc_index < ARRAY_SIZE(pmcdev->pmcs) && ltr_index > 0; pmc_index++) {


ltr_index comes from the user via pmc_core_ltr_ignore_write()  Assume
that it is zero.

2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  476  		pmc = pmcdev->pmcs[pmc_index];
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  477  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  478  		if (!pmc)
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  479  			continue;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  480  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  481  		map = pmc->map;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  482  		if (ltr_index <= map->ltr_ignore_max)
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  483  			break;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  484  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  485  		/* Along with IP names, ltr_show map includes CURRENT_PLATFORM
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  486  		 * and AGGREGATED_SYSTEM values per PMC. Take these two index
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  487  		 * values into account in ltr_index calculation. Also, to start
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  488  		 * ltr index from zero for next pmc, subtract it by 1.
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  489  		 */
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  490  		ltr_index = ltr_index - (map->ltr_ignore_max + 2) - 1;
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  491  	}
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  492  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  493  	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0)
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  494  		return -EINVAL;
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  495  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  496  	pr_debug("ltr_ignore for pmc%d: ltr_index:%d\n", pmc_index, ltr_index);
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  497  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  498  	mutex_lock(&pmcdev->lock);
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  499  
1c709ae12dad6f drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13 @500  	reg = pmc_core_reg_read(pmc, map->ltr_ignore_offset);
                                                                                                                             ^^^^^^^^^^^^^^^^^^^^^^
map is uninitialized.

2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  501  	reg |= BIT(ltr_index);
1c709ae12dad6f drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  502  	pmc_core_reg_write(pmc, map->ltr_ignore_offset, reg);
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  503  
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  504  	mutex_unlock(&pmcdev->lock);
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  505  
2bcef452922242 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2023-06-13  506  	return 0;
36974daf53888e drivers/platform/x86/intel_pmc_core.c David E. Box      2021-03-19  507  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

