Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6231266565
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584095; cv=none; b=BEQWNVaLm12YP3vQKJNk7gL8Da60BeUKB6IpbRbqdGUCVHTOgSeredHEjyDpFRUll44EejjYV+rovmfbNI43rd/jVSJNmflgp0aFkvf1I0+lFIOD+C+5NZ+YUrUz1wMpKZXrsl83ozQZFWXu8bodM6JMlar/YjwzjTwjbUMRDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584095; c=relaxed/simple;
	bh=2YJR7pEFPy7xq1orNpVNhiTcdNQif4qFtdmH0fu7uU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SpnavGWBtbFJGbsUWx5FJSz6PHq4D3b1WVtPDNf8e3r4GlPLJDgojrRq3hNKWx/9F69wa/SUtkXKLbVucT5T374E26JOzjlyyNoYE/wNMNG9YeomlE2QiBlu015D+IhGlOnFnXyNY2sSe1O6ELR6LjWrlExannjENDwgBeaPLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IW+W6aet; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IW+W6aet"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3bb30c72433so1558294f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755584092; x=1756188892; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfC6tmyznTQhu0WfGzgV8ZZbOGfzSI/Lw/Z1TOmfLRk=;
        b=IW+W6aetxQKFWd3I/w8RWc0IOxp39pGqIzGGW6tIW1b984UhI/8yMUq6EFdgQyYErJ
         P8EAlosTCE71FxJ+GKT3ldNpz0OXHoEObzrY3cTBuw8MO92PoGU5TerkGwhIK3cBldeu
         Jpb9n8wvg9WYOXUJxar53wuervFMjJJroCh8tlk9mTO+QNHv+xdZgPnWB0y5dRhMZQrC
         XZ6NVsdiBeps9TvfpSdUtaBtA7sgMxhnIFZkjdKPhZdR6An63vhAQFD6mEXZFb0TF9Rm
         X2Q/yPf8bbbw11LlbYH4lVv21x+sk12TwbaAQTv79/7jjZx9QXuHlfhXoQu/+6eq81Zz
         959g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755584092; x=1756188892;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfC6tmyznTQhu0WfGzgV8ZZbOGfzSI/Lw/Z1TOmfLRk=;
        b=c4zml2zbfvgciJx8fBxptddAkiRdYTkrwyU4lOWs1UBKHgGBcH7Y2+HdXlW/F97z8+
         cnGzD9zq1EA+w/BvpHFRMxWhoOCq/sfmeCMrkR4OIY3jEZC1ynIMsYXunv9qb2ihJke4
         Ah4q41Z5sBd2TCZxZMHnJMUlBgqTPbrAKvfbA6jbwkUQt0TACOFwZiQhHfL4Nx99gixK
         cGZmXNCo9a0pP/lXEF/R/FWV6ed3E+2Vogky5it0sSQcL7uy4peQw+AwhENWJ+5vtZ41
         bEtrvLMFtcI0xCYlBnzd5TEdTrAjEVA9C9kCvF4yohJO9RDRFHSwLxcWxImLFBLJh7cL
         9gdQ==
X-Gm-Message-State: AOJu0Yw7P1I7EXofF7KpPeg6t3lxV7qeSO7VxndKntcxXW5oAvd2UrMr
	rNqDFx+jXfCuY22FlxIl7n9eh8A/OZ9dk2qmiboAPP2MvnVlWLTPmiSWDUmEKDQ/L3op5Oy5b9p
	27yYu
X-Gm-Gg: ASbGnctbeHZHAksrK+b3Kh7Ci55sBSRyI76qf5VS2zPXUDSdaBziwzhZkdQPISTgTjL
	K+ffdsZiOGK0btCHrMOHz9Vh3vN0vcD2mMJHyuDdv9WUxzGu82TjB/Qr/PI514hGUoCu1SEV60K
	Ey5UYtaqMo/N1A/lKfeM34s/ZKTlIE6QMYVjS2sp1E/GENevdYy5zRpSukpIJge9T9GfD/VEMUJ
	YkWWWMWTlDqGtDn5aANox8WZIcFhadKmmYJ2drKCVR21XHzhtzKqvTyEwoAK1yyo/tXZv1CteQ3
	zhJ9f0z3Lp+NmqsGy0THs09TmEK9oV+73fmNoeYCmSWpq1G7gNnvkNUymQckSxAQwDp8ZGA9w8X
	7hD5wo/WO2Op2rGeXmcXvcUP3ZT93n2qkGkwQ4g==
X-Google-Smtp-Source: AGHT+IGGFEZgyeEaX2pBRfjbPpLg1ixzuD1sw99+W5A5gTT8EacRooGmmANMREXLdZz4noMb1+AVvg==
X-Received: by 2002:a05:6000:4014:b0:3b9:148b:e66 with SMTP id ffacd0b85a97d-3c0ed2e8f63mr910658f8f.54.1755584091917;
        Mon, 18 Aug 2025 23:14:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0754f3b7esm2146290f8f.30.2025.08.18.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:14:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:14:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 2/2] power: supply: Add bd718(15/28/78) charger driver
Message-ID: <202508191303.UzPStkjj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816-bd71828-charger-v1-2-71b11bde5c73@kemnade.info>
Message-ID: <20250819061448.StJT9O1XqAj1_mv90_y8TphAsvvfRdvu_1fwY-hGec4@z>

Hi Andreas,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/mfd-bd71828-bd71815-prepare-for-power-supply-support/20250817-032146
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250816-bd71828-charger-v1-2-71b11bde5c73%40kemnade.info
patch subject: [PATCH 2/2] power: supply: Add bd718(15/28/78) charger driver
config: loongarch-randconfig-r073-20250818 (https://download.01.org/0day-ci/archive/20250819/202508191303.UzPStkjj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508191303.UzPStkjj-lkp@intel.com/

smatch warnings:
drivers/power/supply/bd71828-power.c:298 bd71828_get_temp() error: uninitialized symbol 't'.
drivers/power/supply/bd71828-power.c:559 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.

vim +/t +298 drivers/power/supply/bd71828-power.c

c57d31029550a0 Andreas Kemnade 2025-08-16  286  static int bd71828_get_temp(struct bd71828_power *pwr, int *temp)
c57d31029550a0 Andreas Kemnade 2025-08-16  287  {
c57d31029550a0 Andreas Kemnade 2025-08-16  288  	uint16_t t;
c57d31029550a0 Andreas Kemnade 2025-08-16  289  	int ret;
c57d31029550a0 Andreas Kemnade 2025-08-16  290  	int tmp = 200 * 10000;
c57d31029550a0 Andreas Kemnade 2025-08-16  291  
c57d31029550a0 Andreas Kemnade 2025-08-16  292  	ret = bd7182x_read16_himask(pwr, pwr->regs->btemp_vth,
c57d31029550a0 Andreas Kemnade 2025-08-16  293  				    BD71828_MASK_VM_BTMP_U, &t);
c57d31029550a0 Andreas Kemnade 2025-08-16  294  	if (ret || t > 3200)
c57d31029550a0 Andreas Kemnade 2025-08-16  295  		dev_err(pwr->dev,
c57d31029550a0 Andreas Kemnade 2025-08-16  296  			"Failed to read system min average voltage\n");

We should return the error here.

c57d31029550a0 Andreas Kemnade 2025-08-16  297  
c57d31029550a0 Andreas Kemnade 2025-08-16 @298  	tmp -= 625ULL * (unsigned int)t;

If bd7182x_read16_himask() fails then t is uninitialized or invalid.

c57d31029550a0 Andreas Kemnade 2025-08-16  299  	*temp = tmp / 1000;
c57d31029550a0 Andreas Kemnade 2025-08-16  300  
c57d31029550a0 Andreas Kemnade 2025-08-16  301  	return ret;
c57d31029550a0 Andreas Kemnade 2025-08-16  302  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

