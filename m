Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11875210FF
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgWCwMRy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9d8d3b65a67so651078266b.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Nov 2023 05:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699276989; x=1699881789; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwXLKUnSQoOSHcRnwFxVfJzRv08qTvkOz1tbOyXxUaE=;
        b=KgWCwMRyaA2HTRsjJQ4UfNmE0hgBrx0rN20ifCetKziQq17siToUPp+BXJ1eOfljUX
         wBn85zwfjx7dV3uqEWBuMES+F3e0lItNKQw/9OS18UPPFAUltxt+ZB1cI/idNhoyZ3Zt
         me7CkEVTQOfVY9v8Xkk1cg0HkELsByISCGLwR/oZn4lIMkZ/4ayHb/HsxggHnPc2h7yg
         3eiaKxbdZEIUKMboQDRVrRW+QqMLBD06xuglkCf/oL3SDLJz3uN6djyN3+bmTg/bDeqN
         VzzwVqLxmrmAKj7+Uq9a7FONVlc8h/8yq2Ahzghh9AVBeOdPsHbDENk79n6dvnm7x89x
         GJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276989; x=1699881789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwXLKUnSQoOSHcRnwFxVfJzRv08qTvkOz1tbOyXxUaE=;
        b=DvWVrbu9mJvXyjIzqhcOuADbhZlEAWCDUyyeWa4IZz8Y45iqORTt9aGDU+gu4s5nVF
         i8eQet52YXyi1EvCakbqG5djVsilPFpbyPjy1n4eWDnnJK6MfAcpSzkFTKritf2wtfsb
         7eMhLvRJQhBZ1lgovK1Ka02QzyVhRJdI2mkI+v7OXu1WmMvgrXSgc7CqzYRyOqEb3oe0
         yh4ajeFN1jcsXKB+SPp63LE0YplDtB+zE/HV9Du/BfTZ0dfk6i57Si37hyFrCZrPRabc
         p9mpPpqbO91TfXdC+oj1JCOt1R7MW1VN1GHOD/8v4Mn+PjT8yEUyrAS4ex3WXl+Rdouw
         AIvw==
X-Gm-Message-State: AOJu0Yw+TzGq5JbzORoZSCwszPQ5beKJzQ7PPYdEYqAewugHrnXw3AZi
	tFMLVpVTsgUZWjmeQxBa04yBBQ==
X-Google-Smtp-Source: AGHT+IF1dzOC5fZqYqU3K9DGhgL5aQurnaWyR9/b8VENhom7SzEjWH4DabdsoEgcx3+sABuWxQJDag==
X-Received: by 2002:a17:907:c084:b0:9de:dc3d:3b2 with SMTP id st4-20020a170907c08400b009dedc3d03b2mr4878805ejc.16.1699276989297;
        Mon, 06 Nov 2023 05:23:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id zu5-20020a17090708c500b009ddcf5b07b8sm3240548ejb.148.2023.11.06.05.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:23:08 -0800 (PST)
Date: Mon, 6 Nov 2023 16:23:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: Re: [alobakin:pfcp 5/20] drivers/iio/imu/adis16475.c:363
 adis16475_set_freq() warn: set_bit() takes a bit number
Message-ID: <f5e2eb52-ef0f-4fc2-8a1a-db7623e64baf@kadam.mountain>
References: <ff4ef031-774e-4e4d-a009-31f242bf6aee@kadam.mountain>
 <d5bce6084013fd8066e9b5c23e0ce708ab4b2dea.camel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5bce6084013fd8066e9b5c23e0ce708ab4b2dea.camel@gmail.com>

On Mon, Nov 06, 2023 at 11:01:19AM +0100, Nuno Sá wrote:
> > fff7352bf7a3ce Nuno Sá 2020-04-13  357  
> > 9da1b86865ab43 Nuno Sá 2021-09-20  358          adis_dev_unlock(&st->adis);
> > fff7352bf7a3ce Nuno Sá 2020-04-13  359          /*
> > fff7352bf7a3ce Nuno Sá 2020-04-13  360           * If decimation is used, then gyro
> > and accel data will have meaningful
> > fff7352bf7a3ce Nuno Sá 2020-04-13  361           * bits on the LSB registers. This
> > info is used on the trigger handler.
> > fff7352bf7a3ce Nuno Sá 2020-04-13  362           */
> > fff7352bf7a3ce Nuno Sá 2020-04-13 @363          assign_bit(ADIS16475_LSB_DEC_MASK,
> > &st->lsb_flag, dec);
> > 
> > assign_bit() takes a bit number like 0.  But this is passing BIT(0) so
> > it's like BIT(BIT(0)).  Which is fine until you get to 5.
> > 
> 
> Yeah, on 32bit arch that would not be funny...

Indeed.  Btw, a lot of people don't realize that what actually happens
is not shift wrapping but a buffer overflow.  The test_bit() functions
are designed to handle large bit masks so they can basically set or
clear a bit anywhere in your RAM.  This isn't so much an issue with
this type of double shift bugs, but you need to be careful passing 
unvalidated user data to test_bit().

regards,
dan carpenter

