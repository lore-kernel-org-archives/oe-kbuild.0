Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEDB3B298
	for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797664; cv=none; b=nl+/k2HkqeAc3c/XZiMJOqMQ9UYyfwWRF8CShXuHQUjlOSW6E94k31nCsgFHgu0kXAuSeye0rE40/4E17Wg8PqnFfXAlTBZ9/FHmf6qDGkqRDUlwsBJaY+xMHHqpI2ZBVKRH2QkPI9uzpCu1qH4tZGcuFBM6hHfEvQBY5jBv3ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797664; c=relaxed/simple;
	bh=nwYaraCxggBDKnVnYzLQQW0XR3XO/+s4UMrvkMG2ZYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YB9vERkcud0xwkCs7tyD/3cga2+TNA70D+JuiIpFt2+SHhQBQ8yyf3RB3Wh42UOBmq9Eh6U8qWGpvOoz4TWN2IIAHZC2SapfUis+nyxH3SXh/GE/NdXJDIior6RJHiNqZAascbF+TDNXhb8rcFncJeAxwl3LUWsQEqSABoszTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qsdRHj7I; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsdRHj7I"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57857e0f462so2867588a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 01:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716797661; x=1717402461; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2gOfFJLDZFM1NLZoeu2fRwYilxYpWgEWWcHQQR/WPKs=;
        b=qsdRHj7IG7Fb5yufxOipTMCMjGvPzK9jXUXn1ADHEuNRQPDoYXkr4/YyWB3EMaQSFi
         adlWXpJsbQlPzWTUrpu914RSJAFQF2rlWOt0VptmKERQaosWjdu3ghSx/80N1lZ57OpB
         IvAxrryGF8B8SJEtUVB45UYs/3OlLmIwg8wFAACsNPgsW7DYIdLmM2YZoUxA3AP5q1tl
         vzSqfH73m67qr/G3Jf0cmBktQt4i/8aZIFtyHWwIdX0hd2D7kghS/Oc0/SsxI5HPFr8D
         4P+Y1/nPXbbCsfwtQkv9N9kQ13qH+VXhjiMRoB3BekXjwG+nhFfUmnlJW1z3ErPkzimT
         GLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797661; x=1717402461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gOfFJLDZFM1NLZoeu2fRwYilxYpWgEWWcHQQR/WPKs=;
        b=Msj98Mx9/TJfMstXCHnemvEas4Vs0o2JqiBPbmMluWYRiPFw8dlBl/0mTbDjDTZE0L
         mK8k+H6e2CuKxNZsNfVJi7umrq6RdJst6RrIT7zA6xPjIo11gbYknV9o12HJ/ey8nJna
         Y92VRMAF6Xz/Cc6zKk8T61en3H49HNSGQfWpXUmf0rm2zd0MUeLXB3v6RPwC+Vt7P9ab
         /u14XA4hSxeYVzFFE1cG6RZm0dJowhh1OHkDN6rlCjhBF39PWkecR0pzJd6aD9X7UdQ+
         LoHIk+D1cdRd+R3djKoll6cse68GoCCMrqxQkaAozK+wsl9FEG+iUwrxbrMf3nFNuc+K
         qwzQ==
X-Gm-Message-State: AOJu0YxW5/xlAAtlMJb3VheHSMWJK7ub9j+90/omYRNAiX7BYYBQ9YdX
	9TQp+WTX/JlSePEPgS9D4+MvPW3D+edfL6ai25JYmPdwJHXRrKsWCV8lXv+yHik=
X-Google-Smtp-Source: AGHT+IHYnL+hf/PaVRs5w2cBRVnHz4XxYlxeikqwWQlJyhXrjPG34g7ILif/Bx2s4uuxLU41DeUKtQ==
X-Received: by 2002:a17:906:7f15:b0:a62:e9c:f621 with SMTP id a640c23a62f3a-a6265148c46mr601649666b.58.1716797660675;
        Mon, 27 May 2024 01:14:20 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8dcbdsm472629966b.175.2024.05.27.01.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:14:20 -0700 (PDT)
Date: Mon, 27 May 2024 11:14:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Yasin Lee <yasin.lee.x@outlook.com>,
	jic23@kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	lars@metafoo.de, swboyd@chromium.org, nuno.a@analog.com,
	u.kleine-koenig@pengutronix.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, yasin.lee.x@gmail.com
Subject: Re: [PATCH] iio:proximity:hx9031as: Add TYHX HX9031AS/HX9023S sensor
 driver
Message-ID: <6f479ca6-cd6d-4a28-8afe-8b74c4d171d4@moroto.mountain>
References: <SN7PR12MB8101EDFA7F91A59761095A28A4E72@SN7PR12MB8101.namprd12.prod.outlook.com>
 <59869d5f-3d97-48a2-8a96-127f7b46c0e8@moroto.mountain>
 <CAHp75VcTxXsnKVR5EQYTNhokHeXrOxQPe9gAkWFRr0yZT1KTPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcTxXsnKVR5EQYTNhokHeXrOxQPe9gAkWFRr0yZT1KTPA@mail.gmail.com>

On Sat, May 25, 2024 at 05:00:59PM +0300, Andy Shevchenko wrote:
> On Thu, May 23, 2024 at 3:42 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> 
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1110  static ssize_t hx9031as_raw_data_show(struct file *file, char __user *user_buf, size_t count, loff_t *ppos)
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1111  {
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1112       char buf[BUF_SIZE] = {0};
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1113       char *p = buf;
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1114       int ii = 0;
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1115
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1116       hx9031as_sample();
> > 5e5a419c9407f6 Yasin Lee 2024-05-10  1117       for (ii = 0; ii < HX9031AS_CH_NUM; ii++) {
> > 5e5a419c9407f6 Yasin Lee 2024-05-10 @1118               p += snprintf(p, PAGE_SIZE, "ch[%d]: DIFF=%-8d, RAW=%-8d, OFFSET=%-8d, BL=%-8d, LP=%-8d\n",
> >                                                                          ^^^^^^^^^
> 
> 
> > Also use scnprintf() instead of snprintf() unless you need to check the
> > results.
> 
> This is incorrect advice. You should recommend sysfs_emit() /
> sysfs_emit_at() in this kind of case.

No, this is not sysfs code.  It's debugfs.  The API is completely
different.

regards,
dan carpenter
