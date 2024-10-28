Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D61917FA
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104176; cv=none; b=mn8RImD1h3krvyekcC54v6ymE1jA6drRgf2ZH4v/+/LNjuRcwTKeQpN7LGaWniyZWVrlL1MFV713LrbDNUzg6ZBgBG0ciqVGhO+Edre2jkEy2WO/iEEWCT508eIA3jvTWEYLldrJig+GhPw24EWWpBY//rppLlKORWspTwC72C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104176; c=relaxed/simple;
	bh=Kij0R+F2AUkcrPO1Vyp0QF19aybMDfeEQHJI3p6UAyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=awhO7IOISkbzWFrWoFb3ClgK22sX7BiAgBKHmbRjfrEtha0zX3cCtTYTTz47wfs9H/qMx/fB6tPGgKOKJ2I7TysYwROfmn+wL9UVrC/4JjmBSj+w3Z3lz+QlpVFy+Gd+MAcI1vRVM497ui0f3J31A+Nn61vK9rg4Kl9fYLinZP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzqAMdYy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzqAMdYy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4316cce103dso54469455e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 01:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730104172; x=1730708972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GERpUXVY3n6vwU273of+vSVo0aqCOfoEOdD3KIMh3pg=;
        b=JzqAMdYyqDl7f4FUbXHx6LlN5DxoaqjWFbO9/UGqbd2ZaBq8p54ASfWtNn0S3J9zJy
         TBUnhzKtuj/p0t//Ne31tTpDPRCQ6YCv5Cb4x4EJRDDGwi4H9UUoB9MAFlJu/NJiGHtz
         Jp0XWNC6RmAH83bsKS7Y4yNppFnki/Wu0Ba8sOyfuDcq2JotLVopBv4aOlLUKEQL5dMn
         dYC63sRqbH839+sSzor4uSDb3w2n4qN/ahBsbUrOeOkCqsvdADtKfJCH+wsCNhq4FWxl
         o21AqanDb2DuVsQd6xmVBkvUrWgoPzSZmLnDi+i1wU641tgya8Cu/oGLix4UUJWav6Hu
         nLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104172; x=1730708972;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GERpUXVY3n6vwU273of+vSVo0aqCOfoEOdD3KIMh3pg=;
        b=H6EOTiYrGPkCVTVUNwHbUbsVfXYQ59G/8JhhN24ov1H6SeaEqaM9wHy82MxkHndXYq
         DVfXRjiMgncclDcNQ8MQU7GZ0AlGYBqGAv7qcIJKTsvLtDsK2fu8pIEUQSfVkNLy+EXd
         SmXlzVmelaJbEExoFmcLLa7WZHQjVF7RplDd9Fll00Z/eb79pDGNHO2vtvepUl1VITJj
         HqPW2ZAAbf/t7UKfpa/Qwp5N5aKiwV2Ra52tBiVmGug81fQbPlj/yTLrhTMUBeeHONpp
         iM59RyDOPFeh6GDvg2KlGXMjnrZ+28v01EuwZc18Co1JIvK50o+PEi/+dDcK43kDsbsI
         8B2A==
X-Gm-Message-State: AOJu0YyNLZEHRQRHMoNlKpFOfhdWKvtHD9G3r1ffbTfoFnqXSaqQgQ9K
	x6yxxtXKuMWhzIHnNV4+p7lJi5wWg+19fhRiBOCHgbtpYUUZaTXY1jDxmjHVvfvt/u5n8l3OZzT
	yFnA=
X-Google-Smtp-Source: AGHT+IEDoVhgRxyjqct6mSGr1YzBcQB14r9Y4y5I4ZdUb1Nq7l3R3wuxHUJYZJDz9q5Yz6G9yKT7OA==
X-Received: by 2002:adf:f850:0:b0:37e:d2b8:883a with SMTP id ffacd0b85a97d-380611409c4mr7307673f8f.12.1730104172382;
        Mon, 28 Oct 2024 01:29:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70d5csm8828672f8f.89.2024.10.28.01.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:29:32 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:29:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marek Vasut <marex@denx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] [RFC] hwrng: fix khwrng lifecycle
Message-ID: <668ca5ea-6086-49d4-bffd-15ba1bf11ad3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024163121.246420-1-marex@denx.de>

Hi Marek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/hwrng-fix-khwrng-registration/20241025-003448
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241024163121.246420-1-marex%40denx.de
patch subject: [PATCH 1/2] [RFC] hwrng: fix khwrng lifecycle
config: i386-randconfig-141-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271650.hsa6hWLy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410271650.hsa6hWLy-lkp@intel.com/

smatch warnings:
drivers/char/hw_random/core.c:685 hwrng_modinit() error: double free of 'rng_buffer'

vim +/rng_buffer +685 drivers/char/hw_random/core.c

ac3a497f13e42a Herbert Xu                 2014-12-23  648  static int __init hwrng_modinit(void)
ac3a497f13e42a Herbert Xu                 2014-12-23  649  {
78dd6dd163821d Marek Vasut                2024-10-24  650  	int ret = -ENOMEM;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  651  
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  652  	/* kmalloc makes this safe for virt_to_page() in virtio_rng.c */
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  653  	rng_buffer = kmalloc(rng_buffer_size(), GFP_KERNEL);
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  654  	if (!rng_buffer)
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  655  		return -ENOMEM;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  656  
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  657  	rng_fillbuf = kmalloc(rng_buffer_size(), GFP_KERNEL);
78dd6dd163821d Marek Vasut                2024-10-24  658  	if (!rng_fillbuf)
78dd6dd163821d Marek Vasut                2024-10-24  659  		goto err_fillbuf;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  660  
df1e9791998a92 Masahiro Yamada            2024-07-06  661  	ret = misc_register(&rng_miscdev);
78dd6dd163821d Marek Vasut                2024-10-24  662  	if (ret)
78dd6dd163821d Marek Vasut                2024-10-24  663  		goto err_miscdev;
78dd6dd163821d Marek Vasut                2024-10-24  664  
78dd6dd163821d Marek Vasut                2024-10-24  665  	hwrng_fill = kthread_create(hwrng_fillfn, NULL, "hwrng");
78dd6dd163821d Marek Vasut                2024-10-24  666  	if (IS_ERR(hwrng_fill)) {
78dd6dd163821d Marek Vasut                2024-10-24  667  		ret = PTR_ERR(hwrng_fill);
78dd6dd163821d Marek Vasut                2024-10-24  668  		pr_err("hwrng_fill thread creation failed (%d)\n", ret);
78dd6dd163821d Marek Vasut                2024-10-24  669  		goto err_kthread;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  670  	}
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  671  
78dd6dd163821d Marek Vasut                2024-10-24  672  	ret = kthread_park(hwrng_fill);
78dd6dd163821d Marek Vasut                2024-10-24  673  	if (ret)
78dd6dd163821d Marek Vasut                2024-10-24  674  		goto err_park;
78dd6dd163821d Marek Vasut                2024-10-24  675  
78dd6dd163821d Marek Vasut                2024-10-24  676  	return ret;
78dd6dd163821d Marek Vasut                2024-10-24  677  
78dd6dd163821d Marek Vasut                2024-10-24  678  err_park:
78dd6dd163821d Marek Vasut                2024-10-24  679  	kthread_stop(hwrng_fill);
78dd6dd163821d Marek Vasut                2024-10-24  680  err_kthread:
78dd6dd163821d Marek Vasut                2024-10-24  681  	misc_deregister(&rng_miscdev);
78dd6dd163821d Marek Vasut                2024-10-24  682  err_miscdev:
78dd6dd163821d Marek Vasut                2024-10-24  683  	kfree(rng_buffer);
                                                                      ^^^^^^^^^^
78dd6dd163821d Marek Vasut                2024-10-24  684  err_fillbuf:
78dd6dd163821d Marek Vasut                2024-10-24 @685  	kfree(rng_buffer);
                                                                      ^^^^^^^^^^
Double free.

58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  686  	return ret;
ac3a497f13e42a Herbert Xu                 2014-12-23  687  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

