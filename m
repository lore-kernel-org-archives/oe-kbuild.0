Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015785C5E
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712067207; cv=none; b=q1EYH3ZcQI4uPA/FKL8wH8kqyepeBPtuy3g+wfapriZbGaWQjpCfhHdnNbo5woSwEo0PHHLu7Q3QG3UTTW4EC59kkH39L5ePpjcu5kbJd03UUBiBCAW/AdmnG2ot5K3D3Fl3kQVkaH2MEOH2d7LuizX0xaW3u7WnKAsw1i8a9y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712067207; c=relaxed/simple;
	bh=myVZecOk3Ed/cVQu1GohN55yrx81omokKm141OJElQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCHGZlugXWPbejGA/9elrOnQH2uWiW4S0yX9P4OiUA8fqIkL1gCgWBM+DNqNbT2FcsbDWbh7FztxVeLzLgc+hJ4MyXUNif/srshvvScJnxJ+gbb+WPCiqDGKf+hEnLcno/+YhCyuNtrUkxh+yq/3Im5XbnJaO43JFzY+1S6RmWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nb18miF7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nb18miF7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso5151424a12.3
        for <oe-kbuild@lists.linux.dev>; Tue, 02 Apr 2024 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067202; x=1712672002; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5crgseU3oE+PhUnVc2+IUp/YwGxlCdbBsc631LE+kPg=;
        b=Nb18miF7CYj5TkFl3CuxWn3l0aKC9qZbuIOpKAwEK+iVt403DoeeukN8HtkcuXU0Kd
         tclRL72gOB6s3M9EUPPkJuzc5TxEsiB8QGTop07CSAPtCM7L+7OdMNZ9pbXBzIWs1FLP
         1ab03ux3kjvl2hZa8Pki4lSR8JINv9FnBQKWPh7XS4/JNdnCHUTOfisav9YyNiSbok+2
         sXsO0raC8cF9G5Krvf5AG/9M9Gf2VkZSAKiPw3ysYpYkMjrAPDJ671LzNRDimfUT90dx
         XQ+d/ohRbKXNGlHDHf3NMHVOsOd7kMysYs0vsYLa/KIp2uZlt8wkbDrM5XKE41wVoeiK
         SchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067202; x=1712672002;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5crgseU3oE+PhUnVc2+IUp/YwGxlCdbBsc631LE+kPg=;
        b=F9e5Irm2KN+XogifISl2P6dVL6+DolTcNu9yMEAlUUZztt4cllxhflqqbOPdWIYgnD
         YNIgLXtWYcZuze5vC/GFhctH19ZfyIYlNF4ru2MbPrDHbQI2tTTjLXPpjWT5sGQyuZVI
         uTvUdKoC4vxJCLioo+QLfPLk6cpW82lyprClH3ofnWMxc0IJN6/K2pAK30WLMWjQc1st
         Uymn7+ih/Jj2tUI2pBFHl1PJrvMwcAlTtCW9YzSPKhXwdFGBj0lvK5e92jg/VmmKAsF7
         Ze6sptsl28on1XWLuUdQMhhetIOztza6KgtRRjMydePGF3mZVWWFKk8/gG4RwWoZXuY+
         1dqw==
X-Gm-Message-State: AOJu0YxESg6pB0oImWfO4bjxHUBVe/z0f5YVbJ2I5Q2zqae0Eynyvl51
	xRe+ogeKR9x7I34913wfJW2DYdkLIfKbL0jBKH9zrOzNujZB2mEQJiPvoLRV5SB04S4YRh8NRc8
	g
X-Google-Smtp-Source: AGHT+IHtqKI6BwgC0P0wDMdRWsDuSFUH4zvD4pMt6jcJo9Z5OKN76KJ4JaJb10lRjee0qT/wSK4EDQ==
X-Received: by 2002:a05:6402:4311:b0:56c:1696:58a8 with SMTP id m17-20020a056402431100b0056c169658a8mr11880181edc.0.1712067199355;
        Tue, 02 Apr 2024 07:13:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dc15-20020a056402310f00b0056df1795c6dsm604807edb.46.2024.04.02.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 07:13:19 -0700 (PDT)
Date: Tue, 2 Apr 2024 17:13:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1128/2532] drivers/pwm/core.c:1530 pwm_put()
 warn: variable dereferenced before check 'pwm' (see line 1528)
Message-ID: <086d46a0-70a2-41cf-94e5-5cd2377a0937@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: d60bc2995732489766cbe650fc367e036ff6a0e0 [1128/2532] pwm: Add a struct device to struct pwm_chip
config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240331/202403312030.QYCgiAey-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403312030.QYCgiAey-lkp@intel.com/

smatch warnings:
drivers/pwm/core.c:1530 pwm_put() warn: variable dereferenced before check 'pwm' (see line 1528)

vim +/pwm +1530 drivers/pwm/core.c

8138d2ddbcca2a Thierry Reding   2012-03-26  1526  void pwm_put(struct pwm_device *pwm)
8138d2ddbcca2a Thierry Reding   2012-03-26  1527  {
d60bc299573248 Uwe Kleine-König 2024-03-17 @1528  	struct pwm_chip *chip = pwm->chip;
                                                                                ^^^^^^^^^^
Dereference

d60bc299573248 Uwe Kleine-König 2024-03-17  1529  
8138d2ddbcca2a Thierry Reding   2012-03-26 @1530  	if (!pwm)
                                                            ^^^^
Too late.

8138d2ddbcca2a Thierry Reding   2012-03-26  1531  		return;
8138d2ddbcca2a Thierry Reding   2012-03-26  1532  
8138d2ddbcca2a Thierry Reding   2012-03-26  1533  	mutex_lock(&pwm_lock);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

