Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311456760
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Feb 2024 05:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708406107; cv=none; b=t4m+dFNczwyVzrE0C8kURAgbWdaPtDF9b4p7G64eMu4T0f6BqTwC3Xwe58B6JpvXrE9r9J237t2AdJ9HxQzHGYnOCogd8TpgiGiiwyVlmaSwMuktl5fQu0uk67B8Gjj127OpCkSE3pMpG5otJ3nT0StW8uIKeHwIXiQ1n9aXwmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708406107; c=relaxed/simple;
	bh=lJ5eHoDO1q2KH+q2LYf17Mns667I/8oNXkiqviWmwUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfTtd9KHn3qCoekz+TV94OP8QyhgsXYSq+6NadyJqqnctMd07R2LGyAsA5/wVpt6qQJk3/waVXbn6wp0yQsZM87oh9ia/59uN+PfAC/2birBtPs/tPAP5U9ZSbXoSKEBPHrugjTB/DQTJvg9VgLQDau9Sd0Ch2JgUNqe0c3rPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fxHJNKY7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fxHJNKY7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3e550ef31cso215152166b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 21:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708406104; x=1709010904; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHI3KbpgapQRx9GIeYIL4HFsWQEAsBDxc3rS4slc7Po=;
        b=fxHJNKY7ANyCYG2IwHbv4aCw5mxaqo+dhmGYn3uFLfqV55bc61HUb5tUBPhKR+iqPp
         rUcAchVyeMVcyo43cheY63naz91v/lVagwy6rqUKq+JHKzp3ZzE+EuEEBX4Nq4xLe9F/
         EaEwxZa2KfL4+v/AksbMl7cJqgLgh7LozbnnYJEGHFyeUj9gGXwu6SMgK3dSQACOAKj7
         bOa7L+Z80rGccc6nmeVD/sCrHafZfQizCy7XKRd0MUR6xBYCQsxGSLjGUqfKSznmgeM2
         ycHFi+fs+cA4kgG4428WpfMO43FomosLq9QUbVgCiCRic0ivB/RCwlX8m7GLAuP9T6Xk
         ILbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708406104; x=1709010904;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHI3KbpgapQRx9GIeYIL4HFsWQEAsBDxc3rS4slc7Po=;
        b=JpWlwzX8hUeVcEqjfekQVqoXe1t0uCFd3NF7Y5bQrRwVj92nnye+MKPG1QSgKljzqp
         GgsVMOCzN7fR4/+apwp47K2cRBbsVzZkbONN47Ck/fUA/IFnkhwpUBJ/FDlNWTHuqvS8
         Jx8qeIVVgEskPdJP1i3kx1Q+19NwFy5kSfiY5UOitphrOiZMEC61ltqCEF4yV8HGROGo
         bMtwT+8MBqB6xkpm7P5Lk2VHcL7xM6wcJNXA1Ci/2mO0TREo1MDW39I0tdUaqOR2Os+Q
         yk+MrZ387PBRA/yXLa5cMeEcBLMyenBVgzrJpAetJj4tTqzM1D9LWpCQQN7PGdfWAT54
         NLWg==
X-Gm-Message-State: AOJu0Yy2zO8Fhy8j3lH/M+W2NrWUNCnmGs5htQCh0DfLFosKmVCht3Pa
	dllY5zyuYcc41H2ts8sJAjA3SSK9qPKwnsNFLFPVCqAyt/SmvTQf0qjr18f3ZQjHU+HVpAzf2sh
	K
X-Google-Smtp-Source: AGHT+IEP+YoDwhEuY+D6G+dXMKEyvqAlvZi4hY8lJrZDhcxGQJ8Ux5nlJYdTcRxw5vTTdsfSLRVSEQ==
X-Received: by 2002:a17:906:b352:b0:a3e:6463:2fc7 with SMTP id cd18-20020a170906b35200b00a3e64632fc7mr3948486ejb.4.1708406103676;
        Mon, 19 Feb 2024 21:15:03 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cu11-20020a170906ba8b00b00a3ee5c19ee5sm523401ejd.109.2024.02.19.21.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 21:15:03 -0800 (PST)
Date: Tue, 20 Feb 2024 08:15:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-regulators 3/6]
 drivers/regulator/da9055-regulator.c:481 da9055_gpio_init() error:
 uninitialized symbol 'ret'.
Message-ID: <64de8aad-9b6a-4c6c-b02c-58c163d4aadf@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-regulators
head:   70f1ac1c0e32e3d7fb546eac70f113bd57b659fa
commit: db93c3de09384ee1d48a99bb103a49938f80e046 [3/6] regulator: da9055: Fully convert to GPIO descriptors
config: nios2-randconfig-r071-20240219 (https://download.01.org/0day-ci/archive/20240220/202402200604.tilWhpaa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402200604.tilWhpaa-lkp@intel.com/

smatch warnings:
drivers/regulator/da9055-regulator.c:481 da9055_gpio_init() error: uninitialized symbol 'ret'.

vim +/ret +481 drivers/regulator/da9055-regulator.c

db93c3de09384e Linus Walleij 2024-02-15  415  static int da9055_gpio_init(struct device *dev,
db93c3de09384e Linus Walleij 2024-02-15  416  			    struct da9055_regulator *regulator,
f6130be652d0b4 Ashish Jangam 2012-11-01  417  			    struct regulator_config *config,
f6130be652d0b4 Ashish Jangam 2012-11-01  418  			    struct da9055_pdata *pdata, int id)
f6130be652d0b4 Ashish Jangam 2012-11-01  419  {
f6130be652d0b4 Ashish Jangam 2012-11-01  420  	struct da9055_regulator_info *info = regulator->info;
db93c3de09384e Linus Walleij 2024-02-15  421  	struct gpio_desc *ren;
db93c3de09384e Linus Walleij 2024-02-15  422  	struct gpio_desc *ena;
db93c3de09384e Linus Walleij 2024-02-15  423  	struct gpio_desc *rsel;
db93c3de09384e Linus Walleij 2024-02-15  424  	int ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  425  
db93c3de09384e Linus Walleij 2024-02-15  426  	/* Look for "regulator-enable-gpios" GPIOs in the regulator node */
db93c3de09384e Linus Walleij 2024-02-15  427  	ren = devm_gpiod_get_optional(dev, "regulator-enable", GPIOD_IN);

If both devm_gpiod_get_optional() calls return NULL then "ret" ends up
being uninitialized.

db93c3de09384e Linus Walleij 2024-02-15  428  	if (IS_ERR(ren))
db93c3de09384e Linus Walleij 2024-02-15  429  		return PTR_ERR(ren);
8b61a28d616a34 Adam Thomson  2014-02-06  430  
db93c3de09384e Linus Walleij 2024-02-15  431  	if (ren) {
db93c3de09384e Linus Walleij 2024-02-15  432  		/* This GPIO is not optional at this point */
db93c3de09384e Linus Walleij 2024-02-15  433  		ena = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
db93c3de09384e Linus Walleij 2024-02-15  434  		if (IS_ERR(ena))
db93c3de09384e Linus Walleij 2024-02-15  435  			return PTR_ERR(ena);
f6130be652d0b4 Ashish Jangam 2012-11-01  436  
db93c3de09384e Linus Walleij 2024-02-15  437  		config->ena_gpiod = ena;
f6130be652d0b4 Ashish Jangam 2012-11-01  438  
f6130be652d0b4 Ashish Jangam 2012-11-01  439  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  440  		 * GPI pin is muxed with regulator to control the
f6130be652d0b4 Ashish Jangam 2012-11-01  441  		 * regulator state.
f6130be652d0b4 Ashish Jangam 2012-11-01  442  		 */
db93c3de09384e Linus Walleij 2024-02-15  443  		gpiod_set_consumer_name(ren, "DA9055 ren GPI");
f6130be652d0b4 Ashish Jangam 2012-11-01  444  
f6130be652d0b4 Ashish Jangam 2012-11-01  445  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  446  		 * Let the regulator know that its state is controlled
f6130be652d0b4 Ashish Jangam 2012-11-01  447  		 * through GPI.
f6130be652d0b4 Ashish Jangam 2012-11-01  448  		 */
f6130be652d0b4 Ashish Jangam 2012-11-01  449  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4 Ashish Jangam 2012-11-01  450  					DA9055_E_GPI_MASK,
f6130be652d0b4 Ashish Jangam 2012-11-01  451  					pdata->reg_ren[id]
f6130be652d0b4 Ashish Jangam 2012-11-01  452  					<< DA9055_E_GPI_SHIFT);
f6130be652d0b4 Ashish Jangam 2012-11-01  453  		if (ret < 0)
db93c3de09384e Linus Walleij 2024-02-15  454  			return ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  455  	}
f6130be652d0b4 Ashish Jangam 2012-11-01  456  
db93c3de09384e Linus Walleij 2024-02-15  457  	/* Look for "regulator-select-gpios" GPIOs in the regulator node */
db93c3de09384e Linus Walleij 2024-02-15  458  	rsel = devm_gpiod_get_optional(dev, "regulator-select", GPIOD_IN);
db93c3de09384e Linus Walleij 2024-02-15  459  	if (IS_ERR(rsel))
db93c3de09384e Linus Walleij 2024-02-15  460  		return PTR_ERR(rsel);
f6130be652d0b4 Ashish Jangam 2012-11-01  461  
db93c3de09384e Linus Walleij 2024-02-15  462  	if (rsel) {
f6130be652d0b4 Ashish Jangam 2012-11-01  463  		regulator->reg_rselect = pdata->reg_rsel[id];
f6130be652d0b4 Ashish Jangam 2012-11-01  464  
f6130be652d0b4 Ashish Jangam 2012-11-01  465  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  466  		 * GPI pin is muxed with regulator to select the
f6130be652d0b4 Ashish Jangam 2012-11-01  467  		 * regulator register set A/B for voltage ramping.
f6130be652d0b4 Ashish Jangam 2012-11-01  468  		 */
db93c3de09384e Linus Walleij 2024-02-15  469  		gpiod_set_consumer_name(rsel, "DA9055 rsel GPI");
f6130be652d0b4 Ashish Jangam 2012-11-01  470  
f6130be652d0b4 Ashish Jangam 2012-11-01  471  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  472  		 * Let the regulator know that its register set A/B
f6130be652d0b4 Ashish Jangam 2012-11-01  473  		 * will be selected through GPI for voltage ramping.
f6130be652d0b4 Ashish Jangam 2012-11-01  474  		 */
f6130be652d0b4 Ashish Jangam 2012-11-01  475  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4 Ashish Jangam 2012-11-01  476  					DA9055_V_GPI_MASK,
f6130be652d0b4 Ashish Jangam 2012-11-01  477  					pdata->reg_rsel[id]
f6130be652d0b4 Ashish Jangam 2012-11-01  478  					<< DA9055_V_GPI_SHIFT);
f6130be652d0b4 Ashish Jangam 2012-11-01  479  	}
f6130be652d0b4 Ashish Jangam 2012-11-01  480  
f6130be652d0b4 Ashish Jangam 2012-11-01 @481  	return ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  482  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

