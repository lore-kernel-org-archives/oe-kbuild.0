Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC678F45
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739718599; cv=none; b=D27If6e8MU4+VgnY/4VxuJ6JUUX33A8modjiY9aidtF67SxJwdM+Vn1TEo4UtylrKl+NZG0XsBWrNa+0VpbXfNKTWcxJ3kkQF3AaCoFjkyyjU361UaSCBAMMHbv+REddmYZsjDPwPOa9EzsrtbK/Uf3XwMQ2QVv4GS0U4tOLixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739718599; c=relaxed/simple;
	bh=G0IMnyZNIDzqMQ4MqYC/aYKgoomP/07W49faUJnAW+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GTNeyxxzJ1pMnXZCp6PwtLC9ut/AYDZ6tSll0qV2sxDefmvkiTlNAK0nWRgeNUicsqw/AeSHzUhPXII8lhbMPBLLUs4zCalwtss4AL8vD6aXUfWpXrW1xF6F3wCfo9eNSmAU3i5hONZiqE0ib+tWSIKE99idWMluGXU6Mt3Jq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qmnj2WVu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qmnj2WVu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so6721379a12.1
        for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 07:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739718595; x=1740323395; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQltKA0tNVcBcPuHr/XRsc5WCe3ZWlNN7/rKHdzriuA=;
        b=qmnj2WVuSpQV2f/ibZYvOxDJJe2+HpNK5ozixf6QhDHdO3IWXRI6M7Z3WN9oN+5wbQ
         hGgy1o1ETKB+KFK6Vf3Pdp4Ro5MAZQIAeJdwSX1XrAhdYPEhnunN4Zi5083s61CD5fPi
         yfqn3/o+fIHtG1J/s3lYQxfuM25Y8VkQEsA0f3PnllpMax7b+0RjWEhzvmsLVZId37Pb
         NPpZ5dPi1VE6qHjJKemeupDlJGiRBHgmNKlmECMRpKEXB6zMR2Zf0gQj6m2rxPOeSvO4
         dUpJTnAgSJtL/4IkquxWQx454Ry3tECnG84vH1hVjlFKOFXiZ0m7wGrJVL4JPRbHq3MY
         RJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739718595; x=1740323395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQltKA0tNVcBcPuHr/XRsc5WCe3ZWlNN7/rKHdzriuA=;
        b=Zt0veO33AKzTy05t1NpgiUu/cVZvzE5zqbPzQUQz86CJgd3dzFusUS+pZ3wwgc/fWt
         VsBg1+sFMr+IMEtzIUjMmUXSsZ4h8dZHSCa2BmuFeI6ujUGlV9A8w3Wz0EthJ2hW+GHl
         0O/t5Nd007p3IkRvsbz4cXyAywmD3QgyTbOIMVjEaTc7FwhsQZpcF2KjWQeqMab2bH4U
         /TyzVaQ6Gl3YPS5n5bNwgyHavlscvHZCwNqGLH6/bJ/dHuwlhyKGnXp1We6Du51hpNc4
         wPisQCyEjh923SsgRL2HGepeFLjaMTpwO5FTGqbtNOnieXaYGqvWRvcfr2oOX6WXuU9M
         ZyEg==
X-Gm-Message-State: AOJu0YyEU6OoksFPbFPZuMtSO5ZHr//TmTLw5SWTTcuXnuc3wZ0iqWLN
	tB6O/Md7QrEa3ndjYvtmqGjso4SOVKfobIVQXvzBq9tGIlbTX72ylFp/iHgZ9FqobW4f5hjtH0l
	oyPs=
X-Gm-Gg: ASbGnct5XrhgExisr+dXts/jrBqKJa6fJBgXagusgcp1JxA5Pt/buovFTaItUx0Js5N
	obEmiRbGwHX5+sWz6aOq7bMP3mbAT6/j7kVPJJGeZqXuLXJ4mo9oLF/wL8QboEiQBEP7ewj5gtT
	HuvTA9c/MF6fQhv0dZ1NKRhA2PnI8CvhPzpDnzgWuKl73S8tPMVk2Np/RUM/F9qBhJ/tHaTmgQ4
	1J5dI6cPbmET9cZu8u8Sa+fAOQ4x8tRwM0BI+uUtH/Cd2I2PCmGVAB2jwHLOWIi1Xh/7vuLx9mI
	kRbE/A+JUJA5bU53ARux
X-Google-Smtp-Source: AGHT+IHJsE0ROhU+5EFjTvPeBNev3OoGUekrWln3QcnWsKCPZN/QF8d+zZieLX4Gp757mtOgvo6VVA==
X-Received: by 2002:a05:6402:1d50:b0:5de:a928:e3fa with SMTP id 4fb4d7f45d1cf-5decb48c6e1mr12239541a12.1.1739718595323;
        Sun, 16 Feb 2025 07:09:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1c4646sm5997458a12.27.2025.02.16.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:09:54 -0800 (PST)
Date: Sun, 16 Feb 2025 18:09:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Emil Renner Berthing <kernel@esmil.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 27/33] sound/soc/starfive/pwmdac.c:151
 pwmdac_duty_cycle_put() error: buffer overflow 'pwmdac_ct_duty_cycle' 3 <= 3
Message-ID: <9208464f-0b24-4fe8-b210-a82b7817a926@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   dcb5a245dbe2203ae35f6b1b5cb28929f758008c
commit: e8916d018c5219f3e996f1a11f11ed767dd727ff [27/33] ASoC: starfive: Add StarFive JH7100 audio drivers
config: um-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150325.e0HHs9Rb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502150325.e0HHs9Rb-lkp@intel.com/

smatch warnings:
sound/soc/starfive/pwmdac.c:151 pwmdac_duty_cycle_put() error: buffer overflow 'pwmdac_ct_duty_cycle' 3 <= 3
sound/soc/starfive/pwmdac.c:231 pwmdac_data_mode_put() error: buffer overflow 'pwmdac_ct_data_mode' 2 <= 2
sound/soc/starfive/pwmdac.c:273 pwmdac_shift_put() error: buffer overflow 'pwmdac_ct_shift' 7 <= 7
sound/soc/starfive/pwmdac.c:314 pwmdac_lr_change_put() error: buffer overflow 'pwmdac_ct_lr_change' 2 <= 2

vim +/pwmdac_ct_duty_cycle +151 sound/soc/starfive/pwmdac.c

e8916d018c5219 Walker Chen 2021-11-17  140  static int pwmdac_duty_cycle_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  141  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  142  {
e8916d018c5219 Walker Chen 2021-11-17  143  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  144  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  145  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  146  	unsigned int items = ARRAY_SIZE(pwmdac_ct_duty_cycle);
e8916d018c5219 Walker Chen 2021-11-17  147  
e8916d018c5219 Walker Chen 2021-11-17  148  	if (sel > items)

These should be >= items

e8916d018c5219 Walker Chen 2021-11-17  149  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  150  
e8916d018c5219 Walker Chen 2021-11-17 @151  	dev->duty_cycle = pwmdac_ct_duty_cycle[sel].vals;
                                                                                       ^^^
Off by one.

e8916d018c5219 Walker Chen 2021-11-17  152  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  153  }

e8916d018c5219 Walker Chen 2021-11-17  220  static int pwmdac_data_mode_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  221  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  222  {
e8916d018c5219 Walker Chen 2021-11-17  223  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  224  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  225  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  226  	unsigned int items = ARRAY_SIZE(pwmdac_ct_data_mode);
e8916d018c5219 Walker Chen 2021-11-17  227  
e8916d018c5219 Walker Chen 2021-11-17  228  	if (sel > items)

Same.

e8916d018c5219 Walker Chen 2021-11-17  229  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  230  
e8916d018c5219 Walker Chen 2021-11-17 @231  	dev->data_mode = pwmdac_ct_data_mode[sel].vals;
e8916d018c5219 Walker Chen 2021-11-17  232  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  233  }

e8916d018c5219 Walker Chen 2021-11-17  262  static int pwmdac_shift_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  263  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  264  {
e8916d018c5219 Walker Chen 2021-11-17  265  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  266  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  267  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  268  	unsigned int items = ARRAY_SIZE(pwmdac_ct_shift);
e8916d018c5219 Walker Chen 2021-11-17  269  
e8916d018c5219 Walker Chen 2021-11-17  270  	if (sel > items)

Same

e8916d018c5219 Walker Chen 2021-11-17  271  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  272  
e8916d018c5219 Walker Chen 2021-11-17 @273  	dev->shift = pwmdac_ct_shift[sel].vals;
e8916d018c5219 Walker Chen 2021-11-17  274  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  275  }

e8916d018c5219 Walker Chen 2021-11-17  303  static int pwmdac_lr_change_put(struct snd_kcontrol *kcontrol,
e8916d018c5219 Walker Chen 2021-11-17  304  				struct snd_ctl_elem_value *ucontrol)
e8916d018c5219 Walker Chen 2021-11-17  305  {
e8916d018c5219 Walker Chen 2021-11-17  306  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
e8916d018c5219 Walker Chen 2021-11-17  307  	struct sf_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
e8916d018c5219 Walker Chen 2021-11-17  308  	int sel = ucontrol->value.enumerated.item[0];
e8916d018c5219 Walker Chen 2021-11-17  309  	unsigned int items = ARRAY_SIZE(pwmdac_ct_lr_change);
e8916d018c5219 Walker Chen 2021-11-17  310  
e8916d018c5219 Walker Chen 2021-11-17  311  	if (sel > items)

Same

e8916d018c5219 Walker Chen 2021-11-17  312  		return 0;
e8916d018c5219 Walker Chen 2021-11-17  313  
e8916d018c5219 Walker Chen 2021-11-17 @314  	dev->lr_change = pwmdac_ct_lr_change[sel].vals;
e8916d018c5219 Walker Chen 2021-11-17  315  	return 0;
e8916d018c5219 Walker Chen 2021-11-17  316  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

