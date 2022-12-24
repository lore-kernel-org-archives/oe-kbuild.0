Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48093322E;
	Sat, 24 Dec 2022 16:19:38 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id cf42so10819628lfb.1;
        Sat, 24 Dec 2022 08:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FslJhWaKW9z5xwJZHpiYxxxEnIH3Sck+9I6M7FUPSoE=;
        b=mcnljUFcAe5KZayeSRFs++9drg3V3uq2kOj5pbTvJSUSFz6XSBlK+O2TBj2bnoekaq
         4db9ykhhPTY5ym91DKfOcHyLH7rkFTxwpeIC4LF0i3X2/wTwHLqClTfq6ERNNSfI/ZYH
         pbb53UVEYZ79dbyfLHssHjp7sA7M57fthItEJalbCCH6eyqRWHTpy/Xf5EfRXXdzCD/S
         Mey/3K+wH8DnobNJxGLTFehNSqawEW0cRrwi1pUd74htDmiJSvu2EQnbfQAFIxehN8bE
         F31NfU6U5wK1X8IcvF8cMOT2loaV9Q/GK8CoNxrmgT7GpQaNHvvqTLCUEX8vCmCsvKhd
         Ok5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FslJhWaKW9z5xwJZHpiYxxxEnIH3Sck+9I6M7FUPSoE=;
        b=JS2bap/uOuIB9hw7EZrN8Dk5ZsmGQ3i2RVSOEiOK0RZxViHT1cyded2LlKoalk77hP
         EZFJTYh/bdymr4+VRvRwtNJZn/xhSvMNhOb9r5l2j85vaZRHFEdf1Yy2A+fEGmOSaf59
         EcRyWYsMqtb9zhI493IGgITqRPeN6paUkM7lI1YpCpuUHqG9sJDdslq2uy+vSXUMOHid
         mIXUB4iUOint+oLfS9OqRY67SOUkfujIdDj2x2zvNsBPWE5RNsGx1hzrcJtXIHmc7vny
         tgJZR1KGT4Sb8HPyxHCnLvpURxA7jKs706Eb3DnWDdsH/bUbNDCDTnvccu4KXA0TWJqT
         HHLA==
X-Gm-Message-State: AFqh2kp4nUKLG7xicixfmL4CvlMJgfMniJC8XQztPO+jJ6bYF84ngzdd
	mJY4dPBpHf5nAk3fLUUu5tY=
X-Google-Smtp-Source: AMrXdXv94BsWqbTejL34QeaaLX+14f+sFMTVy0R4Cj2w2DthPksO8V5wLzTQYMNoYqFXub3hNjPk5A==
X-Received: by 2002:ac2:5f49:0:b0:4b6:ebbc:3d3a with SMTP id 9-20020ac25f49000000b004b6ebbc3d3amr3274090lfz.53.1671898776135;
        Sat, 24 Dec 2022 08:19:36 -0800 (PST)
Received: from [10.0.207.73] ([185.32.8.213])
        by smtp.gmail.com with ESMTPSA id z9-20020a056512370900b004b55c1b5c66sm992326lfr.157.2022.12.24.08.19.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Dec 2022 08:19:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace divide condition 'pin / 8' with 'pin >= 8'
From: Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: iPhone Mail (16H71)
In-Reply-To: <202212181140.EAWl7FKx-lkp@intel.com>
Date: Sat, 24 Dec 2022 17:19:27 +0100
Cc: oe-kbuild@lists.linux.dev, Qingtao Cao <qingtao.cao.au@gmail.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D147284-AF8C-4414-9BE1-C83032B6C15D@gmail.com>
References: <202212181140.EAWl7FKx-lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>



L=C3=A4hetetty iPhonesta

> Dan Carpenter <error27@gmail.com> kirjoitti 23.12.2022 kello 11.54:
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 master
> head:   f9ff5644bcc04221bae56f922122f2b7f5d24d62
> commit: 5134272f9f3f71d4e1f3aa15cb09321af49b3646 gpio: exar: access MPIO r=
egisters on cascaded chips
> config: ia64-randconfig-m031-20221218
> compiler: ia64-linux-gcc (GCC) 12.1.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>=20
> smatch warnings:
> drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace divide=
 condition 'pin / 8' with 'pin >=3D 8'
> drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn: replace divide=
 condition 'pin / 8' with 'pin >=3D 8'
>=20



I don=E2=80=99t think this is a good advice. If we want to limit that, we ne=
ed to check also upper limit. But. The GPIO framework does that. So, changin=
g / to >=3D is bogus.


> vim +52 drivers/gpio/gpio-exar.c
>=20
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  47  static unsigned int
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  48  exar_offset_to_sel_addr=
(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  49  {
> 5134272f9f3f71 Qingtao Cao         2022-09-02  50      unsigned int pin =3D=
 exar_gpio->first_pin + (offset % 16);
> 5134272f9f3f71 Qingtao Cao         2022-09-02  51      unsigned int cascad=
ed =3D offset / 16;
> 5134272f9f3f71 Qingtao Cao         2022-09-02 @52      unsigned int addr =3D=
 pin / 8 ? EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
>=20
> Why not change this to pin > 8 instead.  Comparisons are faster than
> divide ops.  Way more readable too.
>=20
> 5134272f9f3f71 Qingtao Cao         2022-09-02  53 =20
> 5134272f9f3f71 Qingtao Cao         2022-09-02  54      return addr + (casc=
aded ? exar_gpio->cascaded_offset : 0);
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  55  }
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  56 =20
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  57  static unsigned int
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  58  exar_offset_to_lvl_addr=
(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  59  {
> 5134272f9f3f71 Qingtao Cao         2022-09-02  60      unsigned int pin =3D=
 exar_gpio->first_pin + (offset % 16);
> 5134272f9f3f71 Qingtao Cao         2022-09-02  61      unsigned int cascad=
ed =3D offset / 16;
> 5134272f9f3f71 Qingtao Cao         2022-09-02 @62      unsigned int addr =3D=
 pin / 8 ? EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
> 5134272f9f3f71 Qingtao Cao         2022-09-02  63 =20
> 5134272f9f3f71 Qingtao Cao         2022-09-02  64      return addr + (casc=
aded ? exar_gpio->cascaded_offset : 0);
> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  65  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>=20
