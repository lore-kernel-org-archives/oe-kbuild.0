Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D712F398
	for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799866; cv=none; b=fQCfQKAA1WsRr9gIpx0SeF6EXhQN8pfuab95Mfqcs+Iiat1AdC63Y2FjjS/qhSeSGUmiYD+wn5N90oTWFyMmmPV3NM00y3bUxWVr23ykqszYS5eiO4LfxFobjIpJraISDHbfz+RWY3B/gKX69+Bg3biEkuxYxOqtjbQoKo/9sK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799866; c=relaxed/simple;
	bh=VWIWAz/C36z3ejzKqZpM6Ta9/KsBCD/qHV4r6Ufeiwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qn5jZe6DNcZMnzhrpJWsV0OfB9zDfE4xUj8DDAsRQ3CX8vzXyc9H4H2d5RB8uL6jPxgdjsXzye7FpyEoyY5RkoV9egToULvgCSoSsltRZUk2kQ2wKxHWVtjGOM8aQ+o/i/p6WYT5coB9Mqisg8XLMsmByWi0O0AYNEvDuYDk+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hb04v4+S; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hb04v4+S"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso268200066b.0
        for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716799863; x=1717404663; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IngHvuVJ+qy5kq3ZL0tayX0b+UVqjmY0nRoaAshOXto=;
        b=hb04v4+S/wHknv+S0mkF65GQyOPZkMHkTfHb4GRHIOkP7fMt1MJhV+wJ9xsbSBT26P
         JN1Mq23q4Gtl6WS6TJDJaK0GtkV1aakIBtbjBaO4rT69+UtFm6g2cMt7bduiBE5HtlsO
         ztGdyoBNcdmlDCbkIvjjNSHzkDW9xHGyZhyaS/+q2GkbWBjnYtjC8GE6/Uk2NCQjWum9
         2TDrWGOlZG9CRkvOFUL9Y2m/nYkgiL8zcotkndxuPgR17Y5WZb9Eo32TBmW14NX0KGzM
         nUnAhbM1m6w+9eNlwOGboshSVKVAEcTOjn8cvEcsSDQXntYmsFPyyQWX0dx59Yg7xjKa
         NFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799863; x=1717404663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IngHvuVJ+qy5kq3ZL0tayX0b+UVqjmY0nRoaAshOXto=;
        b=VuBBIDpHbuyZQ8WHHhy340irzvR+c4XJ7NvZl6oyBirpNjeu8+G8SNLIxrx3jiAJSP
         EAkjDw9xyhs9AsadwcyOBvvinfzIJ+sBr/ByXrOa/kHtLsak0BcahDsNX0lzvouC8gPi
         Aqmzc4R/1dgC2sChRl48zmPtap8ksAkr84qb8Kqs8zRtWgJ7ToyLIh8e32EH2xQ6lJoo
         yYjo82zA55g4sxKBLMrKDvkAE70Z6gaLBdM1WlhJM8BX3NM/z/BwX40UIXhJtcmpXkCI
         O80AbqYnWLkL4FA2d4MiOO2RNuoh+0yx6ENjYqFDM8Bs1jO57zjrEhLNYGOYXE9Y54bZ
         xn+w==
X-Gm-Message-State: AOJu0YxvoQeTYheoTdu8ll2hJi7ocv5Ysgux/fTaZSsByHzsBE5X1QhC
	MyCuHJ3js9IMqzV+3affYZjqg0rI2Zj0wpywHBemBYQLu/qqHPmAIzTbDs8bD/I=
X-Google-Smtp-Source: AGHT+IGCA1HNlfKaJ/l7+h/ehh9h7+FLYF0FcNG522umKz/7ymLJE0wk2XH+LOhyNYPx0n/gIfzzKg==
X-Received: by 2002:a17:906:f353:b0:a55:9dec:355f with SMTP id a640c23a62f3a-a626511604fmr475369266b.70.1716799863000;
        Mon, 27 May 2024 01:51:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc519f5sm471282566b.98.2024.05.27.01.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:51:02 -0700 (PDT)
Date: Mon, 27 May 2024 11:50:58 +0300
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
Message-ID: <16a63a13-4c98-4eea-82b7-68213bff61bc@moroto.mountain>
References: <SN7PR12MB8101EDFA7F91A59761095A28A4E72@SN7PR12MB8101.namprd12.prod.outlook.com>
 <59869d5f-3d97-48a2-8a96-127f7b46c0e8@moroto.mountain>
 <CAHp75VcTxXsnKVR5EQYTNhokHeXrOxQPe9gAkWFRr0yZT1KTPA@mail.gmail.com>
 <6f479ca6-cd6d-4a28-8afe-8b74c4d171d4@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f479ca6-cd6d-4a28-8afe-8b74c4d171d4@moroto.mountain>

Mauro, Hans,

The debugfs code in drivers/media/common/siano/smsdvb-debugfs.c is
completely broken.  No one has tested it since Dec 2022.  Can we just
remove it?

On Mon, May 27, 2024 at 11:14:16AM +0300, Dan Carpenter wrote:
> On Sat, May 25, 2024 at 05:00:59PM +0300, Andy Shevchenko wrote:
> > On Thu, May 23, 2024 at 3:42 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > 
> > 
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1110  static ssize_t hx9031as_raw_data_show(struct file *file, char __user *user_buf, size_t count, loff_t *ppos)
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1111  {
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1112       char buf[BUF_SIZE] = {0};
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1113       char *p = buf;
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1114       int ii = 0;
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1115
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1116       hx9031as_sample();
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10  1117       for (ii = 0; ii < HX9031AS_CH_NUM; ii++) {
> > > 5e5a419c9407f6 Yasin Lee 2024-05-10 @1118               p += snprintf(p, PAGE_SIZE, "ch[%d]: DIFF=%-8d, RAW=%-8d, OFFSET=%-8d, BL=%-8d, LP=%-8d\n",
> > >                                                                          ^^^^^^^^^
> > 
> > 
> > > Also use scnprintf() instead of snprintf() unless you need to check the
> > > results.
> > 
> > This is incorrect advice. You should recommend sysfs_emit() /
> > sysfs_emit_at() in this kind of case.
> 
> No, this is not sysfs code.  It's debugfs.  The API is completely
> different.

I was going to say that if you find yourself calling sysfs_emit_at()
then you're already in trouble because sysfs is supposed to be one thing
per file.

But then I searched and we call it almost 1000 times.

The first caller I looked at was drivers/media/common/siano/smsdvb-debugfs.c
from commit 2f7d0c94396e ("media: siano: Convert to use sysfs_emit_at()
API") which changes debugfs code to use sysfs_emit().  And it so clearly
has never been tested because debug_data->stats_data does not point to
the start of a page.  sysfs_emit() will refuse to print anything unless
it's given a pointer to the start of a page.  Ugh...

regards,
dan carpenter

