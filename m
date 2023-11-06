Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B43C168DB;
	Mon,  6 Nov 2023 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAh6hc49"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so30538985e9.1;
        Mon, 06 Nov 2023 02:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699264883; x=1699869683; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uQeDRzZ7qKZNnEn0N8L5vnxfulx8nPiBiTEMaQyN9Fk=;
        b=IAh6hc49HVB38jKFlKzWYPxsrNXSJoEHZ5eZT5jWjUIWbfTltza9Y9lZA7ljaj9mPU
         WLSRqsb8HJrb7eZQoNVPePueHv+2BpGIOxmkeBObPlyczwfeATUuSg76kZQnW/P7ArJk
         9vf51lWXOd+rrhfG/zQjwIcGdDAeROGPAvCV5pZr73OxdVF5eaBY43SuE2vWOXT+i1Lf
         U8QNI8wtNqkfdJ4yQyLvY5WKekqI+m4hc7VcpDU+d3tbE013HLB4nK0CIEvzaF8dvPoX
         8/4GWu0XLbtffFRjRPbwdxZaCxRMkRiwVlIZMykk60z3AF+mhnHrQL0S+2WHgg5U+2Yn
         AtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699264883; x=1699869683;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQeDRzZ7qKZNnEn0N8L5vnxfulx8nPiBiTEMaQyN9Fk=;
        b=urQJq4WfSG31E4DrsCVfhcCOAgS2OEEU0yAOwUduQ3NxbM7O+1xfgKkDBxJWktH6bo
         4fGGrpMo2C8TD5RIE1Zr3UQe28To29MXCxU73qyAXYGpuHWl9Vs2Euea/4DmVykVzMuH
         G71U87KFxkEZl4QbIzY0DtzXBPRB7h10Xy5KPluH8z96YY6+07nveXE3pwtRgZqaeqq5
         YszoDmzyod0h7XTqiptNKk1idsfbAwrr8TFH3/kfRdYSydztMy9z5fICx7TS/hnWUt6c
         JCnOTkb/ApPtm14TErE/NUVrIOb1PYWHxvDVyzTZeALTRn2RO+4/ZC66Kzk0TLlJmhF7
         llZA==
X-Gm-Message-State: AOJu0YxEvSryOgRpQOuMC3IWvJ4XFfhUnWdZLEYRMeD4kzKvTBCBS04y
	7OiWo4N2286f9qqjPdxQjOMJftJBIkJ6Hg==
X-Google-Smtp-Source: AGHT+IFgGV5NP1sPL6L1k/n8y4IZGAeySHXSg+68QqC29FoL/GVSzvJYYB6u20/R2+43K82rWbDcpw==
X-Received: by 2002:a05:6000:1541:b0:32f:87e8:707d with SMTP id 1-20020a056000154100b0032f87e8707dmr10338621wry.5.1699264883060;
        Mon, 06 Nov 2023 02:01:23 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b004053a6b8c41sm11493600wmq.12.2023.11.06.02.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:01:22 -0800 (PST)
Message-ID: <d5bce6084013fd8066e9b5c23e0ce708ab4b2dea.camel@gmail.com>
Subject: Re: [alobakin:pfcp 5/20] drivers/iio/imu/adis16475.c:363
 adis16475_set_freq() warn: set_bit() takes a bit number
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Przemek Kitszel
	 <przemyslaw.kitszel@intel.com>
Date: Mon, 06 Nov 2023 11:01:19 +0100
In-Reply-To: <ff4ef031-774e-4e4d-a009-31f242bf6aee@kadam.mountain>
References: <ff4ef031-774e-4e4d-a009-31f242bf6aee@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-11-06 at 11:50 +0300, Dan Carpenter wrote:
> tree:=C2=A0=C2=A0 https://github.com/alobakin/linux=C2=A0pfcp
> head:=C2=A0=C2=A0 89565e300e3d4033b8bb568774804fdc09d4f3cc
> commit: 945a0d6e86d97bf60f2fae88ee557ed3eae18b94 [5/20] bitops: let the c=
ompiler
> optimize {__,}assign_bit()
> config: i386-randconfig-141-20231105
> (https://download.01.org/0day-ci/archive/20231106/202311060647.i9XyO4ej-l=
kp@intel.c
> om/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce:
> (https://download.01.org/0day-ci/archive/20231106/202311060647.i9XyO4ej-l=
kp@intel.c
> om/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202311060647.i9XyO4ej-lkp@intel.com/
>=20
> smatch warnings:
> drivers/iio/imu/adis16475.c:363 adis16475_set_freq() warn: set_bit() take=
s a bit
> number
> drivers/iio/imu/adis16475.c:363 adis16475_set_freq() warn: clear_bit() ta=
kes a bit
> number
> drivers/iio/imu/adis16475.c:416 adis16475_set_filter() warn: set_bit() ta=
kes a bit
> number
> drivers/iio/imu/adis16475.c:416 adis16475_set_filter() warn: clear_bit() =
takes a
> bit number
>=20
> vim +363 drivers/iio/imu/adis16475.c
>=20
> fff7352bf7a3ce Nuno S=C3=A1 2020-04-13=C2=A0 357=C2=A0=20
> 9da1b86865ab43 Nuno S=C3=A1 2021-09-20=C2=A0 358=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0adis_dev_unlock(&st->adis);
> fff7352bf7a3ce Nuno S=C3=A1 2020-04-13=C2=A0 359=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> fff7352bf7a3ce Nuno S=C3=A1 2020-04-13=C2=A0 360=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If decimation is used, then gyro
> and accel data will have meaningful
> fff7352bf7a3ce Nuno S=C3=A1 2020-04-13=C2=A0 361=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bits on the LSB registers. This
> info is used on the trigger handler.
> fff7352bf7a3ce Nuno S=C3=A1 2020-04-13=C2=A0 362=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> fff7352bf7a3ce Nuno S=C3=A1 2020-04-13 @363=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assign_bit(ADIS16475_LSB_DEC_MASK,
> &st->lsb_flag, dec);
>=20
> assign_bit() takes a bit number like 0.=C2=A0 But this is passing BIT(0) =
so
> it's like BIT(BIT(0)).=C2=A0 Which is fine until you get to 5.
>=20

Yeah, on 32bit arch that would not be funny... This should not really ever =
be a
problem for this driver as that mask should not get bigger. But, for correc=
tness, I
will send a patch removing BIT() from the #defines.


- Nuno S=C3=A1
