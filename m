Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1798617C2;
	Sun, 25 Dec 2022 11:50:52 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id e13so6795172ljn.0;
        Sun, 25 Dec 2022 03:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlnLyJ2BHwOq0v6YM5eXS65npGm8qINlxvZC0I9lVgQ=;
        b=KOqteYkKtgJyR7TLsHd/wtr0yFSNfCI7LJtbi9Wlvv5KF6a0t/eXNn1I7Roio0Scku
         zNS2DGEaTz8AGBPLyxNItIrD8GNHNd0DlMWT74LWYXLYXVycJOljbXNDdj9LkpjVgrlr
         AuWUuhzEas2Y1VMrEgLemv5neOV+jEkICHzacQ7nYrTx8pN61PMr41cSQY7iq3mNjaxn
         qg91Dl4xt7E/+E7VL/mNEYIQIo7AVoG+4MoA5pD09aLogjvZdqFj1C/9JtMUyZvuym1T
         L56tniLHtEPckCPXgBMqzCp6qWO096my1InWmhbPOfsO2AuyCIEOV3232g//OfmPzhHr
         YMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlnLyJ2BHwOq0v6YM5eXS65npGm8qINlxvZC0I9lVgQ=;
        b=ukynlC9NKRNL1KTpmSMLCmdsQVYWNOnc5zxArbBXZM7F+qpbBA7Q/wjmDJj6lUhH2R
         Z2dZcLrh73Z0Fz83ItKGtJfUrXPoX5mKTtjbBhXYiYMprmJ+lfeobinGYTd5ViDXZpVw
         Auw3yU3EGGoJjgh5zuC5C3wLuIP7SAh3rLLaWiT4aju5BPD+QFKR81My/0FD+0XpANPb
         9mInOxdMXhmjPbqi5+hNBCZ4wodUFfHwW2/fSHYHB7dE/Cy46Iw1XHFNSGK31uxdkvZT
         6BOZk3gv0PEhfaVjDymTXhJQpRwIWp7w/U5ugBZ/UK/4lcCo04XWX9kwlJUjbJmBYoVw
         jCJg==
X-Gm-Message-State: AFqh2ko/suX0WzVEqt/PGOHNf4QHQ2HDLadozG5G9NaM+apDmpNRMSYc
	FlQBt7x2vL5ovuXAGC2Ilek=
X-Google-Smtp-Source: AMrXdXtpqOE8xzMIpqCUQKOF5Tiwvjms5Ci7tnoMpNH9CEC1oMyD5hsNVBnD033CgGolSrP4plkqHg==
X-Received: by 2002:a2e:8244:0:b0:276:dc01:8058 with SMTP id j4-20020a2e8244000000b00276dc018058mr4260997ljh.1.1671969050971;
        Sun, 25 Dec 2022 03:50:50 -0800 (PST)
Received: from [10.0.207.73] ([185.32.8.213])
        by smtp.gmail.com with ESMTPSA id bj31-20020a2eaa9f000000b0027facd123a0sm959608ljb.106.2022.12.25.03.50.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Dec 2022 03:50:49 -0800 (PST)
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
In-Reply-To: <F701A496-22A6-4E3B-B3CB-E5BCF4C30502@gmail.com>
Date: Sun, 25 Dec 2022 12:50:46 +0100
Cc: oe-kbuild@lists.linux.dev, Qingtao Cao <qingtao.cao.au@gmail.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C430F7E6-723B-4EA8-BA87-00C84676BD4F@gmail.com>
References: <202212181140.EAWl7FKx-lkp@intel.com> <3D147284-AF8C-4414-9BE1-C83032B6C15D@gmail.com> <Y6dTX2wx/SXlswGC@kadam> <F701A496-22A6-4E3B-B3CB-E5BCF4C30502@gmail.com>
To: Dan Carpenter <error27@gmail.com>



L=C3=A4hetetty iPhonesta

> Andy Shevchenko <andy.shevchenko@gmail.com> kirjoitti 25.12.2022 kello 12.=
45:
>=20
>=20
>=20
> L=C3=A4hetetty iPhonesta
>=20
>>> Dan Carpenter <error27@gmail.com> kirjoitti 24.12.2022 kello 20.30:
>>>=20
>>> On Sat, Dec 24, 2022 at 05:19:27PM +0100, Andy Shevchenko wrote:
>>>=20
>>>=20
>>> L=C3=A4hetetty iPhonesta
>>>=20
>>>> Dan Carpenter <error27@gmail.com> kirjoitti 23.12.2022 kello 11.54:
>>>>=20
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
>>>> head:   f9ff5644bcc04221bae56f922122f2b7f5d24d62
>>>> commit: 5134272f9f3f71d4e1f3aa15cb09321af49b3646 gpio: exar: access MPI=
O registers on cascaded chips
>>>> config: ia64-randconfig-m031-20221218
>>>> compiler: ia64-linux-gcc (GCC) 12.1.0
>>>>=20
>>>> If you fix the issue, kindly add following tag where applicable
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Reported-by: Dan Carpenter <error27@gmail.com>
>>>>=20
>>>> smatch warnings:
>>>> drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace div=
ide condition 'pin / 8' with 'pin >=3D 8'
>>>> drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn: replace div=
ide condition 'pin / 8' with 'pin >=3D 8'
>>>>=20
>>>=20
>>>=20
>>>=20
>>> I don=E2=80=99t think this is a good advice. If we want to limit that, w=
e need
>>> to check also upper limit. But. The GPIO framework does that. So,
>>> changing / to >=3D is bogus.
>>=20
>>=20
>> How is checking pin / 8 not mathematically equivalent to pin >=3D 8?
>=20
> The point is that semantically the / is better in case this code will ever=
 support more than two banks of pins.

On top of that it=E2=80=99s paired with pin % 8.


>=20
>> I don't understand this code at all.  The divide is inscrutable  Is it
>> storing something in in the lower 3 bits and something in bit 4?  In
>> that case it might be nicer to just check (pin & BIT(4)).
>>=20
>> regards,
>> dan carpenter
>>=20
>>>=20
>>>=20
>>>> vim +52 drivers/gpio/gpio-exar.c
>>>>=20
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  47  static unsigned int
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  48  exar_offset_to_sel_a=
ddr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  49  {
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  50      unsigned int pin=
 =3D exar_gpio->first_pin + (offset % 16);
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  51      unsigned int cas=
caded =3D offset / 16;
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02 @52      unsigned int add=
r =3D pin / 8 ? EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
>>>>=20
>>>> Why not change this to pin > 8 instead.  Comparisons are faster than
>>>> divide ops.  Way more readable too.
>>>>=20
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  53 =20
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  54      return addr + (c=
ascaded ? exar_gpio->cascaded_offset : 0);
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  55  }
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  56 =20
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  57  static unsigned int
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  58  exar_offset_to_lvl_a=
ddr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  59  {
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  60      unsigned int pin=
 =3D exar_gpio->first_pin + (offset % 16);
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  61      unsigned int cas=
caded =3D offset / 16;
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02 @62      unsigned int add=
r =3D pin / 8 ? EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  63 =20
>>>> 5134272f9f3f71 Qingtao Cao         2022-09-02  64      return addr + (c=
ascaded ? exar_gpio->cascaded_offset : 0);
>>>> 696868d0a79c21 Bartosz Golaszewski 2020-09-30  65  }
>>>>=20
>>>> --=20
>>>> 0-DAY CI Kernel Test Service
>>>> https://01.org/lkp
>>>>=20
