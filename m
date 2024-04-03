Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E5136E3E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Apr 2024 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141305; cv=none; b=He901poRvhYwC3jHYSU0af210i54v9M7u1vS7Sz8CHOIVLBhJTTg5YfvWtlFJkDCrCDK8JNTy6iiLKD7PUyAOJ5nwIe4zjCTq+tPhNfumhbjCl4Ad+oxHKe3LIb5CXXp6d5HIS28PbSqa6yz2DPQhhPGgV+Nz4Z24dt2n7CMTyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141305; c=relaxed/simple;
	bh=rVzwMOHevUYb9zbiefBLzJmJL2BLCod0EsmhP95pgUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cixcwF4MVO7SmPT0DP7b9qksdaBeRYJpEm0lhhz3zwzwxlVy2NFRV5gNtlvEbV+G33ob4v1FN/T7R9zrHIZaRsy670OqEszPhcQIpovCveWkqTVTI2hYSSnIJADVJgSnEsYOojVgPWQsfenIPNI7EyhdXlWLE1zSQUBM03e2zsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RaNjkwfk; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RaNjkwfk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56df8e6a376so1577893a12.0
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Apr 2024 03:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712141302; x=1712746102; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A8/xWx4c0CtG/2UB+dKr8NhYYOILRHFBONTBopP5RV8=;
        b=RaNjkwfkfLblnKb+5I+juEmYZLQK6XFEYG9Ke0BTs5ouPiZTy5EGI5q5SM2cprl32P
         GqD99bvYaTWsxlGy4Mk8+5EzSsqeTNZlgWdhd3mIhMECnxlp9WLXZGegQiZj4m/D8QJv
         eNfQIF2GZqdopD8xJUXTWiQyJ/QAF0Jv6fJ5uOALfZf+5mdwO13mrPWQLclad3AKhPA4
         39Wr4m9vnAnvVFQ+jDO+jCrBMVTjOUnH77kL7op8nf0WER0kJ2TFMlPGr2d14bovvOxm
         /WLtNa6j8LPU5jpE+Hz3PKYSSC7NjDgdcNPDIjmCaBZ1pUDKFbnVNgRc7EdBfzhEve8p
         lOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712141302; x=1712746102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8/xWx4c0CtG/2UB+dKr8NhYYOILRHFBONTBopP5RV8=;
        b=NsFqhMXYQcReyRzQDUY19wrFXPMj8f5Hs/+1i0OA1CoEPadnBorLbYghQaxtVTfAHv
         EbbrxVX/q+Lnnd7o3vGFxo3v3+qqODeRsrTFpjVI76mAal3DwDBWBMgHYTSUXQb3uXS/
         ax9rXjNCtJQyff+qxGEGJB8fP1jvoQk/dtJcZdgUdE9Laz1USKt/KwK6cdQ+FIxET0p4
         fY5RynfLCnt61cVaFoX7aq4zItriCI1GO/KVWT6+O7jBeQCrjq6sPd/Tey40Pve9CBxn
         9Tj8jyHk/fSi44kvXkGHnt8YGdw/S6P8njR8vZbXIfJlyuMovrOZZG5/w6/p+YM7oGUo
         eiRQ==
X-Gm-Message-State: AOJu0Yx0p5Nga8Zgo6q7WxNoSk3xkuvLcMacw9fm+vfiggWudyO8UvuG
	TxzcPvsrLAYWHBoGc3tLIfabyp6HvMm5QY0CqMhfPGgs1FLp4HmF7SXzpIKMdl0=
X-Google-Smtp-Source: AGHT+IHKaN7THG2ZzuGsKUj3Zs9uIRke3IgBj1z99ytwAGtKtugNNeCJOInuJb8dQw4krnmG78Tznw==
X-Received: by 2002:a50:ba88:0:b0:56d:faa3:7dac with SMTP id x8-20020a50ba88000000b0056dfaa37dacmr1877653ede.9.1712141301653;
        Wed, 03 Apr 2024 03:48:21 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v3-20020aa7d643000000b0056e0376286bsm835183edr.24.2024.04.03.03.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 03:48:21 -0700 (PDT)
Date: Wed, 3 Apr 2024 13:48:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 1131/2532] drivers/pwm/core.c:1282
 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
Message-ID: <d7dcc0bf-ace4-476f-9ef9-4f9f7955001c@moroto.mountain>
References: <1e3dc81d-dcd4-4b04-85b1-23937e2f0acd@moroto.mountain>
 <jobtlrm6v7r2gssuko6hn3mo4wsjcifaytsltfj3nvwhrh66lr@wmihv53dv75s>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jobtlrm6v7r2gssuko6hn3mo4wsjcifaytsltfj3nvwhrh66lr@wmihv53dv75s>

On Wed, Apr 03, 2024 at 12:28:57PM +0200, Uwe Kleine-König wrote:
> On Tue, Apr 02, 2024 at 05:26:31PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
> > commit: 0835e5c8704297e91b54071c3bbcd0c05c63bd3f [1131/2532] pwm: Add support for pwmchip devices for faster and easier userspace access
> > config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240401/202404010703.o1yYkXrA-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 13.2.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202404010703.o1yYkXrA-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/pwm/core.c:1282 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
> > drivers/pwm/core.c:1284 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'
> > drivers/pwm/core.c:1368 pwm_cdev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
> 
> I fixed the issue in line 1368 in my pwm/for-next branch.
> 
> For the spectre issue my first guess is:
> 
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 2745941a008b..dd54acd336a6 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/device.h>
>  #include <linux/debugfs.h>
> +#include <linux/nospec.h>
>  #include <linux/seq_file.h>
>  
>  #include <dt-bindings/pwm/pwm.h>
> @@ -1191,6 +1192,12 @@ static int pwm_cdev_request(struct pwm_cdev_data *cdata, unsigned int hwpwm)
>  	if (hwpwm >= chip->npwm)
>  		return -EINVAL;
>  
> +	/*
> +	 * Mitigate speculation side-channels; without considering speculation
> +	 * this is a noop.
> +	 */
> +	hwpwm = array_index_nospec(hwpwm, chip->npwm);
> +
>  	if (!cdata->pwm[hwpwm]) {
>  		struct pwm_device *pwm = &chip->pwms[hwpwm];
>  		int ret;
> 
> But I'm unsure if this also addresses the issue for
> 
> 	pwm = cdata->pwm[cstate.hwpwm];
> 
> Maybe pwm_cdev_request() is better changed to return the struct
> pwm_device *? Who is the expert, who can help here?

I believe that your patch does fix it.  I'm not sure who the experts are
but probably they are on the x86@kernel.org mailing list.

regards,
dan carpenter

