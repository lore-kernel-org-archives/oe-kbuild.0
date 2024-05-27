Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E06A33D
	for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716800869; cv=none; b=tE4rMvBwXefOgVpPexbpkocsow7Eer6zEJQ5AOvudN0pEad/bv4uW7tnd+UWFxW52K9r6gOn0NzfYfwtTW5/2YI0b7CMknlf2UGO+gY3Dev5BBvPyV7rxVVz8dtabGG3i4KrL62oIPa1uWQ8aaAKl0n+ErOtUdSeB9IBxgNn23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716800869; c=relaxed/simple;
	bh=a1Vl1rci3lVc+qkTZXlXSNM3HyM20lhqxxNM6JEBPyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOzfahxd5Y+ZsIu28+qdTDnsf0X6tXAeLkkuwuTF32BmRqlUoyn+51IAh2t6wjJobnZLR0zzBkByrO9jbhIWo1WIkD7btXY+Y20MztPnZMGIzsIPFPYODFp36xtGMP3WF8YPtP/8JcxeLt+zLex4ncg2k7CFD1irBBUbKMEEYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9zAvf0S; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9zAvf0S"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59a609dd3fso897738466b.0
        for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716800866; x=1717405666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1Vl1rci3lVc+qkTZXlXSNM3HyM20lhqxxNM6JEBPyE=;
        b=x9zAvf0SXu1lcH4EPaA4SbIvJ8kw6PMRzayNt9GcSMGYEGSc00ERrIq5BksVJh2m8K
         VAJbJvAydlUMwLPzhRr1mmlnYIq0ETAcL7T7GGLzKgpPsZVLueak3W1mq+VM2yfZGmKa
         JkVziMz1vX5jgqV/EQddHvrBErBQRMDA8OYdgnEQadjvG/kh4urDJZmaxznMN1BYM9o3
         tz9vt2Me9M9jajP0vNYqQImcGm2IW1gG4ZTTl9THQ7UhZ3Kmp5R9uoqFKqgmtgnKXQRx
         wfsdCJWdudfgMC81a47912VZDjBzLXcevvFE8VY56yRAjYJfbUCL9Gm6887U5Ufreb8d
         frYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716800866; x=1717405666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1Vl1rci3lVc+qkTZXlXSNM3HyM20lhqxxNM6JEBPyE=;
        b=D5lLdtFjKnVG23vfJFhitv1ZerY9Qeq6lgLHmpxy54YGsn4AGOp7YCKWZqkKFnsWXo
         PhEyTmUjuRKa77Tce+43msC7Xfqy3fJpSKZR83KXlV/al4Y3FJX5Q0SuaZHmMf0FTT3c
         g9OzE+rLWIJ51qyUGlrcOHs7zjvdWxG2aQPbjac8a3I8o3KJypR2Hh52eSWfawP0sNnE
         G3Er98wut4G584t4YpBa1O4bXmGcRdvHxDCThgd0ZfKJehhQzyr1NyzBZ3PhjUAvJPcW
         0E4EpZG/eJtYzGpj3mNrtrznbjt3BLjYJKRWc9KJZtRKwOiHVhOJQytI8LOfp/02nA5T
         OpqA==
X-Gm-Message-State: AOJu0YyiWtRLZ0v3alGP9dN83bmKwGn8yepLr8t/9tuI+ajskCuc/Kc4
	Wz+J8YBj7eYjvK/OKyYNSlTsP9BBY7PPvVQJUrTdXBuP7rbHFYJV8bdUnqS4KrU=
X-Google-Smtp-Source: AGHT+IF7OcaPLruFbCjuG1bWRANJbFK+TLfQ4b7xj1bJIFQqh4jWRuxYVX51Rrq+jAKwgb46l39rYw==
X-Received: by 2002:a17:906:2a89:b0:a59:c944:de4 with SMTP id a640c23a62f3a-a62616df6b5mr808475566b.2.1716800866283;
        Mon, 27 May 2024 02:07:46 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a62de917c6bsm167617166b.194.2024.05.27.02.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:07:46 -0700 (PDT)
Date: Mon, 27 May 2024 12:07:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: oe-kbuild@lists.linux.dev, Yasin Lee <yasin.lee.x@outlook.com>,
	jic23@kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	lars@metafoo.de, swboyd@chromium.org, nuno.a@analog.com,
	u.kleine-koenig@pengutronix.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, yasin.lee.x@gmail.com
Subject: Re: [PATCH] iio:proximity:hx9031as: Add TYHX HX9031AS/HX9023S sensor
 driver
Message-ID: <494eacc4-c406-4288-9f7f-85a69add7c6f@moroto.mountain>
References: <SN7PR12MB8101EDFA7F91A59761095A28A4E72@SN7PR12MB8101.namprd12.prod.outlook.com>
 <59869d5f-3d97-48a2-8a96-127f7b46c0e8@moroto.mountain>
 <CAHp75VcTxXsnKVR5EQYTNhokHeXrOxQPe9gAkWFRr0yZT1KTPA@mail.gmail.com>
 <6f479ca6-cd6d-4a28-8afe-8b74c4d171d4@moroto.mountain>
 <16a63a13-4c98-4eea-82b7-68213bff61bc@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16a63a13-4c98-4eea-82b7-68213bff61bc@moroto.mountain>

I've looked through a large sample of other callers and they're okay.
The bug seems to not be so prevalent as I feared.

regards,
dan carpenter

