Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77686221561
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344516; cv=none; b=au0GrSkibrpopJDBcz0499WkGC/HdTrnGxpu/82cJ9c6MKzTYekZzWl6q6fO5V9VFQKUOV47mYr5s7qkO4t78vm+xGX3r2Se3fMq42inXBkv4xa4EVZD0QWGSjENqkqe3ABnBbWUzzwaWnws2dHOVd8kLGUv0y7lCUr96+LyiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344516; c=relaxed/simple;
	bh=XQbO+MeU7LphEXYmi3GPh+fSnb0aMig4WX9RiVNilV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ME1jzplvCoJtDOWFSFWQ7eSq+TE92YKnAnXrQARNVQ3cc754ZMI8Zph2QOxHShW9Do+6WS1JsfLK5BsDxqGCS88wmvKk5wELU8nfBW5Rl636KBIYBPfsd9zA1UwobJ3/6tJ5vsRURgNumNyNS3GdfjZzzg05wrrFqbgY+FfQ38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OzCxa+BQ; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OzCxa+BQ"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2eb6c422828so523559fac.1
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344513; x=1750949313; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uve89EMzkitmRjOaJNdbWQJ/RDIXjqQq2KcXNC17HOs=;
        b=OzCxa+BQux9W8mPgbQgJPDyOPnlzMEmRegEtfzrwdzo0FBeCyiiqpYIbLLsMu0Tqvw
         tJBiqDPXmzo42ZGZL82dYBqcihfUxOW1f/J7l7noXnlnN0QxUJ0ar5x2OzniZEVewUhN
         XtVaqJwOwEILfSBaCftBGZ2A1gig1yInihn9WjcEmL6XerZf++9NuSDIZz514XK1bMFH
         rCkJ/mNIQ6A4G2ehBgQI/gRlB8UKkQb3DUIZNtsG1mjmiUzwe1RI+hT8pxjwPRqBtgJk
         7+VHW3pU42RuRarPwp7JGDbaizTzdBBhZBzntJlUGNCTnJq+UV3IdU1I7MtlcsCWd0yz
         IL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344513; x=1750949313;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uve89EMzkitmRjOaJNdbWQJ/RDIXjqQq2KcXNC17HOs=;
        b=oAvo5hy/RFCdsIm9BQGinOPCoUoEPTT/r+h4n9V1/dbPXRnNH+tg1diwxVGPqfUSkU
         PEbWur5qeK7XMhVj+Kue25uwOAbYFphN+YGLWhSFa+aErjkagvwXFHL/95yZgUFoZUTi
         H2u/bC/LJ7en3u13sY2W48f1F3kQe7nBZmL9qdAx4yXBxtRGChCXKbyVFwZpf/sNzFWZ
         j+wNd5uVNpTJb0UOuohvzdqkGSZZ6VYeb1KIkYKGnxWoNvJE4qX4xrfHAzprif/m4Qhk
         03644qSgwlqSEgp+TbFKOPBBfdlJoZ4Unn0z/r1wgpmhT8KS80dYAm5a9sSC5Far0j5D
         DoCg==
X-Gm-Message-State: AOJu0YyFeR9caHMSYEyY3FO5HP6j5mEhQlDapXi0B0uLc8T2nyJ7Bhir
	yEXXkE4V+mQS/xQtDbSUDVynZ34L3JQpfyac3A4SYYJpyVMaiU5sJO3N68YWFiSjGl4owPbEG4Q
	/7y1e
X-Gm-Gg: ASbGncsHTo7tpiu5002HPKxZZJqzyGT2zuD0TUyaHflad+jWoX5l3zrjMdrymtDsTkA
	jJLYG0YjgwnY6kCBJnTPY6mD1fcRHN9aa3WH+/5J9uVXVLb338kohGxwwH5euEU6HWlfuBdP5jU
	6ckBrADySjrRiON7u873igCZbeLlWaWL978GvdMZLJFrEAqUZNTazXsUrpEDbdMOQ1Cue1eCMtD
	poWDjm4tPoprPhqdEZ+Of9vl0kcsomh6SeILq3hTF2h+VsRYnKPRDfDuNryoRaUZuVqw9h1TACN
	hEh//tCrCk4koffd2x+lkSNnudqqLM47NaoFQEQJAZqR873CSLI4lfE9ytNKIxp+OxyGHQ==
X-Google-Smtp-Source: AGHT+IFQB8JILX7sEXumld5e4Y3/ldgg/AQr8eFGAOqhptgecy59aQAmbClEqPPBViAJFk+qgfNH2w==
X-Received: by 2002:a05:6870:8894:b0:2d5:97d0:c03c with SMTP id 586e51a60fabf-2eb9ecd771bmr2508756fac.18.1750344513157;
        Thu, 19 Jun 2025 07:48:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ebb30b0653sm139118fac.8.2025.06.19.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:48:31 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:48:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 42/53] drivers/pinctrl/pinctrl-aw9523.c:658
 aw9523_gpio_set_multiple() warn: inconsistent returns '&awi->i2c_lock'.
Message-ID: <4efce873-0542-4dff-9a77-fca9d582f1aa@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   62be3d6e481122f02364993fee8322a681072918
commit: dffe286e2428a32bf5a70648d22a678b83080414 [42/53] pinctrl: aw9523: use new GPIO line value setter callbacks
config: x86_64-randconfig-161-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191952.A03cvn22-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506191952.A03cvn22-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-aw9523.c:658 aw9523_gpio_set_multiple() warn: inconsistent returns '&awi->i2c_lock'.

vim +658 drivers/pinctrl/pinctrl-aw9523.c

dffe286e2428a3 Bartosz Golaszewski        2025-06-12  628  static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  629  				    unsigned long *mask,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  630  				    unsigned long *bits)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  631  {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  632  	struct aw9523 *awi = gpiochip_get_data(chip);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  633  	u8 mask_lo, mask_hi, bits_lo, bits_hi;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  634  	unsigned int reg;
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  635  	int ret = 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  636  
4210ef801a2482 Andy Shevchenko            2024-03-29  637  	mask_lo = *mask;
4210ef801a2482 Andy Shevchenko            2024-03-29  638  	mask_hi = *mask >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  639  	bits_lo = *bits;
4210ef801a2482 Andy Shevchenko            2024-03-29  640  	bits_hi = *bits >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  641  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  642  	mutex_lock(&awi->i2c_lock);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  643  	if (mask_hi) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  644  		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  645  		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
091655b9285d83 Andy Shevchenko            2024-03-29  646  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  647  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  648  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  649  	if (mask_lo) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  650  		reg = AW9523_REG_OUT_STATE(0);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  651  		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  652  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  653  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  654  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  655  	mutex_unlock(&awi->i2c_lock);

This unlock should be after the out: label.

dffe286e2428a3 Bartosz Golaszewski        2025-06-12  656  
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  657  out:
dffe286e2428a3 Bartosz Golaszewski        2025-06-12 @658  	return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  659  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

