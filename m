Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4559158DB9
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252308; cv=none; b=sZm82oq0SvfJSa+KEx4Cm+9XeoxjCjL48Ox+Pgo1Dt51UUo8cg74BwhwUoGPNIMvainY+H40hwVcBy14eXZWrOj5eS4gKkf2QAHMLKid9EtoOad2s54Kf4OczbZnAE0x5d4KZkg2y2ei8xgAb1WH05ksZM+rBOV8tbhKcKuQPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252308; c=relaxed/simple;
	bh=ZNN0WA2/p1ORgw0WLog369ZiQNy2kk/Mzv+YGlD0aSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=L3UBOwfCBQYQMn1kBDVfJDvwLltNfhAq4n/MQWsIyHvzsVjeygZktK8PPs8qTe1J1PkNGYncgTuQ7VrydCUS3oXUV0wFUxIvX8s3xjdCGs4ixXA40ipcSiiRwpUVQuU+pcRpTx4POZXgb6UbQC4Uarvri7Dt0dQrvJgaf4x4Dyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pyU0GbiL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pyU0GbiL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so63926625e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252305; x=1727857105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjViwqKoOuJx/lbhmfqAwvB3FRCAndqhaaKQMzHxtco=;
        b=pyU0GbiLBn0E96VWWW8xZUJ2KH+to/DlvIskc0fJTpWkwzNGNsq5OSYDpzQ84QgEYZ
         SM+Z9DGg7bwPGsr0C0MjNsEKoKSoFMVYVFesfJxqLzA09UilkCtb4RfDWndiKSFl1ZOW
         sn78EA7f9CalCM25Z/8uVjJnMTvomT4CQgJfFQ/pH8zqcaM90SPSaapuqkwwG8XsunNK
         VvvE/5s3/T1t0g7piKwtSBezMVO6210rsJbuuKLJa9o3wq3aSdnRmBgYjIi4yhCGMvqF
         3LKyjQ0LbzMcPoLRslUPnca2i4I10lVVtSHoO/kLKGjLwzaId0hqCbJUcuZ5tvko7r9M
         yCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252305; x=1727857105;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjViwqKoOuJx/lbhmfqAwvB3FRCAndqhaaKQMzHxtco=;
        b=ijtTyvW/7YwupsTy+yXll2zs0hM/Se3vIyXDZwdl6TXujwANYUJVd09lMOzBvAcATQ
         IjID4XpOJFSrG7InTA9BCeTJUCEN+/cbrGJiJYTY5BtJHFZhNoXIIlzyuN6+glrvAiuE
         93rDtlnzmhHXcS+4f4EBmhCYxvoKKNCXry4RbjfpNtTiVVcEF3dkgFVo2z/oenMrb6uH
         yzovih4ORGcITEUqjHUEO7Zev+7b4rSBzB5wq1IeILuOvjbep+7uBoYC34UPMSDESbTr
         Shq8Ejfu5UjOghQnBLr3cAwTzG6l7ERY47vLSqoP/yMJNiacidQwiG4/zGQqur8FT9wy
         TFkw==
X-Gm-Message-State: AOJu0YxH9Ko1WmqGmz88pSlJSypOOcaEKpzGN+AiETVk61eJ+2uu8/Td
	ty9zGAwFi/fZJGQN/i6CN1DCVmG5vnuJoPKsqH482sWqfZsrzeblJh7QcGpWvXRYyOsE8ZAMVN7
	+
X-Google-Smtp-Source: AGHT+IGzTCJoMIje7BlfvPfP0lS5uStHPhLpQoLdhOq/3pwsQ/1Hd2BTnfsSIdO9RAY8hcw1bZBCyQ==
X-Received: by 2002:a05:600c:3d05:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-42e96103358mr11373925e9.4.1727252304561;
        Wed, 25 Sep 2024 01:18:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8bcasm3362899f8f.9.2024.09.25.01.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:18:24 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:18:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mary Strodl <mstrodl@csh.rit.edu>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <0c58010f-3d25-498b-a519-d79e7021cff1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
Received: from imap.gmail.com (108.177.15.109:993) by stanley.mountain with

Hi Mary,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/gpio-add-support-for-FTDI-s-MPSSE-as-GPIO/20240919-221626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240919141014.4000958-1-mstrodl%40csh.rit.edu
patch subject: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230158.XhvhLOyY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409230158.XhvhLOyY-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-mpsse.c:211 gpio_mpsse_get_multiple() warn: inconsistent returns '&priv->io_mutex'.

vim +211 drivers/gpio/gpio-mpsse.c

be777399e9baea Mary Strodl 2024-09-19  190  static int gpio_mpsse_get_multiple(struct gpio_chip *chip, unsigned long *mask,
be777399e9baea Mary Strodl 2024-09-19  191  				   unsigned long *bits)
be777399e9baea Mary Strodl 2024-09-19  192  {
be777399e9baea Mary Strodl 2024-09-19  193  	unsigned long i, bank, bank_mask;
be777399e9baea Mary Strodl 2024-09-19  194  	int ret;
be777399e9baea Mary Strodl 2024-09-19  195  	struct mpsse_priv *priv = gpiochip_get_data(chip);
be777399e9baea Mary Strodl 2024-09-19  196  
be777399e9baea Mary Strodl 2024-09-19  197  	mutex_lock(&priv->io_mutex);
be777399e9baea Mary Strodl 2024-09-19  198  	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
be777399e9baea Mary Strodl 2024-09-19  199  		bank = i / 8;
be777399e9baea Mary Strodl 2024-09-19  200  
be777399e9baea Mary Strodl 2024-09-19  201  		if (bank_mask) {
be777399e9baea Mary Strodl 2024-09-19  202  			ret = gpio_mpsse_get_bank(priv, bank);
be777399e9baea Mary Strodl 2024-09-19  203  			if (ret < 0)
be777399e9baea Mary Strodl 2024-09-19  204  				return ret;

Needs to mutex_unlock(&priv->io_mutex) before returning.

be777399e9baea Mary Strodl 2024-09-19  205  
be777399e9baea Mary Strodl 2024-09-19  206  			bitmap_set_value8(bits, ret & bank_mask, i);
be777399e9baea Mary Strodl 2024-09-19  207  		}
be777399e9baea Mary Strodl 2024-09-19  208  	}
be777399e9baea Mary Strodl 2024-09-19  209  	mutex_unlock(&priv->io_mutex);
be777399e9baea Mary Strodl 2024-09-19  210  
be777399e9baea Mary Strodl 2024-09-19 @211  	return 0;
be777399e9baea Mary Strodl 2024-09-19  212  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

