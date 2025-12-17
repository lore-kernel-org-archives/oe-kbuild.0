Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC122E06D2
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987591; cv=none; b=EoQHviKjSXTfcP3mE2bzYIMj1S4/zZdHUnvTsmMmu8l9JlWRQypQL/Pp9NUHq0Frp43jerCFzKHaphiVWAzasZqrdQ76L0H/ZiTrsDvMnjeSGWWEjWMNqjztf6Cu3A3oFpK+m6XNJ651ik9JCewcjShWX0jW/Z/iE6O0wfDDtsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987591; c=relaxed/simple;
	bh=5AniAOa5/+PqR2pfWWBxXsgkgtusgwQDvb/Y/U1A2iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LhPBHrLowhon/CeFqUFkr3qA+DiLjoSOHDR4r0uBGRRdP6fkzVdyG3U9EbtJCftvjVNqtYWcCMwt75/PHriIp4q2J9nytohsrq6HAjQOCL8Ap5r5wi64RsrwT/CXzoCH3IvGhjg7QVdTdK2WoOOHYlHpyxcf1APAY62QRjSPfFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYUkM2XI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYUkM2XI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so70991175e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 08:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765987588; x=1766592388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DhaZn5snWYZuZvKSLH9hbfe1Vg8CeCc34oBkhAsHEMg=;
        b=hYUkM2XI2VMmbVRCP8tG/DFH+oQ4Cve2aSoo3RvjVCm/taYoIJ+7pXSM3udRo62oP1
         DfL6OycFMS3EYV9aaN6PBtqnrAiHbW7+t+nhIl4jLRP1DUejecBL94Y8KecJT5I0JPFt
         VXu1tXq4Z3kovUkMDajURx7pc7EJuHHpy+rf+DBdlQMagwwstkR4ju3zJyrQlPOK12m8
         XudhHWGGXivuC7dpqMKCUXhQDaoxWTWjSd1AEES8ZnbGpReoUg4zS0z/icIiTp/sPVGq
         0BaGgVMMHyb97Lk32GtGOodkebgo8Cv+2+XRINj3nirxzybDwGfM3ZN5wZ5ZMUR0WN23
         Rskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987588; x=1766592388;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhaZn5snWYZuZvKSLH9hbfe1Vg8CeCc34oBkhAsHEMg=;
        b=sGWzpmpXTVmmVbELUARkW7Rbgig/o//tBoYEJmYpO4YzAQSLWJlzeHKR7D8M4vwKho
         y27DXeFLzMmCb2cWg6XZi3vjmgSz78QI3W7EEKubwZ9Ug1y5k06H2xcU2KoNxi/7jjAT
         mS37FsLofEfnGfOYqmwLbUKxUshJsB5eUthjXVLKdUPleb0TZBo0u6aAQNDsLdASgBbV
         oGv/+m3Xs5hNm/z0XHNkNn8K9muH0MMo5FA4mXAM8HB63lxhULYJLPixEpb2+vIvYbDL
         PcDCQ6Z47ezo1h++Ws0OXHbKZqpE3Y/6m0RbkQzo+mflCHyuBUPYr73qC/aA0iLjhMag
         w7mA==
X-Gm-Message-State: AOJu0YyeBlscLj4igmMmYczcNIZmMY8yHeQ00Wq/CwRG1gP3dWo+Dwwj
	rfZpuxDudyHUI/+L7wl9lLmNT3jK4GVwGaHiLISrYVA8+dzGfQaBT5cyf0Q7wPh33qXblLbQMm/
	Ej+Y1
X-Gm-Gg: AY/fxX5esSKaqA+791e6ZzSmwu5Xo08gbO9JX8f6ZhPgR8QcAdRU75c5K9KASuXSW1S
	0URt0qMd4rcWYwA/4OlddaNB93Rqo1iM1yuFKoXReqmU3E3cEIjuHHpgMIui5iCluk/jhfNz6bw
	nxUTC4TluQyM8krpVotIWFkDfXUoDpoG0OyQQ/YuhGeVb67tg/dtyRXM3i3ALsJPdloHcYhn0T2
	TdQV2CwlJhYbPYrO4D768A+suCL2JlgGYlYibun3HKY+T/j92VyQ69D6O299nFYC5VDtyhvgdeR
	NdEIlcDEznpkeSQjKbm6XWYPgnhkm695qVxFKu8jwkjaxpA6OAKPgz+rstE5whJS9WQNS2DYOSt
	UmDRODJ6AYMMujlgTzEQm9Ypt4fb0Q8B5elJZ6Raeaqj/bj54bTLhHeZck9BN8geU3OaKaEucfD
	kVZ3iNYB8W1U8HX+c6JHw5tpK9ZwU=
X-Google-Smtp-Source: AGHT+IE5C+8XR7IV6c4zVwBm3meFZRpb0J9v6SiNoXA//+Q4cpgDwjNmTD5ceMYxYddcVa3nUo3oWQ==
X-Received: by 2002:a05:600c:8119:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47a8f8a7170mr178296865e9.3.1765987587466;
        Wed, 17 Dec 2025 08:06:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd90f0bd9sm34497855e9.5.2025.12.17.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:06:27 -0800 (PST)
Date: Wed, 17 Dec 2025 19:06:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Oder Chiou <oder_chiou@realtek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
Message-ID: <202512140909.a0ok9gVy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211110130.2925541-3-oder_chiou@realtek.com>
Message-ID: <20251217160623.kmgYL7ggKWl-XR0CrdQobV1vNuGhP7xdltjL64GlWD0@z>

Hi Oder,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oder-Chiou/ASoC-dt-bindings-realtek-rt5575-add-support-for-ALC5575/20251211-190355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251211110130.2925541-3-oder_chiou%40realtek.com
patch subject: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
config: parisc-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512140909.a0ok9gVy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512140909.a0ok9gVy-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt5575.c:256 rt5575_fw_load_by_spi() error: uninitialized symbol 'ret'.

vim +/ret +256 sound/soc/codecs/rt5575.c

56f073d89eb8e0 Oder Chiou 2025-12-11  247  static int rt5575_fw_load_by_spi(struct rt5575_priv *rt5575)
56f073d89eb8e0 Oder Chiou 2025-12-11  248  {
56f073d89eb8e0 Oder Chiou 2025-12-11  249  	struct i2c_client *i2c = rt5575->i2c;
56f073d89eb8e0 Oder Chiou 2025-12-11  250  	struct spi_device *spi;
56f073d89eb8e0 Oder Chiou 2025-12-11  251  	struct device *dev = &i2c->dev;
56f073d89eb8e0 Oder Chiou 2025-12-11  252  	int ret;
56f073d89eb8e0 Oder Chiou 2025-12-11  253  
56f073d89eb8e0 Oder Chiou 2025-12-11  254  	spi = rt5575_spi_find_device();
56f073d89eb8e0 Oder Chiou 2025-12-11  255  	if (!spi) {
56f073d89eb8e0 Oder Chiou 2025-12-11 @256  		dev_err(dev, "Get SPI device failure: %d\n", ret);
                                                                                                     ^^^
ret isn't initialized.

56f073d89eb8e0 Oder Chiou 2025-12-11  257  		return -ENODEV;
56f073d89eb8e0 Oder Chiou 2025-12-11  258  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  259  
56f073d89eb8e0 Oder Chiou 2025-12-11  260  	regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
56f073d89eb8e0 Oder Chiou 2025-12-11  261  	regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  262  	regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
56f073d89eb8e0 Oder Chiou 2025-12-11  263  
56f073d89eb8e0 Oder Chiou 2025-12-11  264  	ret = rt5575_spi_fw_load(spi);
56f073d89eb8e0 Oder Chiou 2025-12-11  265  	if (ret) {
56f073d89eb8e0 Oder Chiou 2025-12-11  266  		dev_err(dev, "Load firmware failure: %d\n", ret);
56f073d89eb8e0 Oder Chiou 2025-12-11  267  		return -ENODEV;

s/-ENODEV/ret/

56f073d89eb8e0 Oder Chiou 2025-12-11  268  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  269  
56f073d89eb8e0 Oder Chiou 2025-12-11  270  	regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  271  	regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
56f073d89eb8e0 Oder Chiou 2025-12-11  272  
56f073d89eb8e0 Oder Chiou 2025-12-11  273  	regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT, ret, !ret, 100000, 10000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  274  	if (ret) {
56f073d89eb8e0 Oder Chiou 2025-12-11  275  		dev_err(dev, "Run firmware failure: %d\n", ret);
56f073d89eb8e0 Oder Chiou 2025-12-11  276  		return -ENODEV;
56f073d89eb8e0 Oder Chiou 2025-12-11  277  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  278  
56f073d89eb8e0 Oder Chiou 2025-12-11  279  	return 0;
56f073d89eb8e0 Oder Chiou 2025-12-11  280  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

