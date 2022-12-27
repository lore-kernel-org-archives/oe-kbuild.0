Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6223239;
	Tue, 27 Dec 2022 18:31:11 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id m12so3122246qvq.13;
        Tue, 27 Dec 2022 10:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS71xZ4HPr7MRbcFAzGlUhLBBLnKXHBQUCJ7VI/xMRw=;
        b=UKIYX6sTjIrN2dR+vWZ+y7NHzENQOFsbOk19f8o9VqhnPr75D1CkxnDkX9prANvVLr
         vsuDFBydsdqoPFxGik/5raljx9gSZ7ZUsrZh1uTBFTtcQYZ9KeebJqHOiJvVBagamsWd
         F33I7QugA5YQy7of8pFxF0wTToAOw5RYuoR46XPZC4fIZaShsFa+12uaNHOr9CBNXkAr
         cxMfQdXpmlC5Kx+rNeLhIPb39EA1VKzwSnm6j+LDKFUkLKohb5XufBXJ4oeByM7cA/KL
         LwwNULmgGk0SmfjMwNZuLorgIRcyjYVhL/kxRTrakngH9HNXNrxEJgWwSPjKl0zf9G9E
         AgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rS71xZ4HPr7MRbcFAzGlUhLBBLnKXHBQUCJ7VI/xMRw=;
        b=IspWEmeJ/7IeXJmFwD7KiM+3byyIOVz7VWssLgwGN16YxsaHjziOyRWI8c76Sbi85x
         Vjqgqyq6l/dYoBzPnBDrxQIf0i8ykjcqm9SREmYEghRY0k1tZuTxOLSfowqWY0PlYgTR
         gOyPzmX8du3Qjz5qKR3iwpWbhWrmPv3HvyGHQsPEjQY8/cWAcHc/00YiI+PBu3BIZ1Ux
         8/LVFsCtLMSoQhTLHeCZBwVZgD1rgSuCPNFs+zCKEuNqO7wFMlMmEMqYqjIk1hoMhY0Z
         EENk0Xfa1DZrZllxVp31A8XZYhw0RbeiZ/+ma9Mq8IjsCOQO8icERzYhbewdLIKGsw4K
         7/wA==
X-Gm-Message-State: AFqh2kpY5BEVXISNHwFSsokMR823SBZPqDyyhlsh1Pays6r/itejmbX9
	KwjyFKvt8mkWb5Fga4cuE6/I4nql7dFp9UTgiTw=
X-Google-Smtp-Source: AMrXdXs1qjq1O2E0Rnon1S3PAG6bQzt7jJbRRZ9N8svHBY4kIoinjybj2oI6X22rHRVeevwIpdzaONvuDJUuvObBXcI=
X-Received: by 2002:a05:6214:3906:b0:4c7:1ebf:719f with SMTP id
 nh6-20020a056214390600b004c71ebf719fmr914966qvb.64.1672165870312; Tue, 27 Dec
 2022 10:31:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212181140.EAWl7FKx-lkp@intel.com> <3D147284-AF8C-4414-9BE1-C83032B6C15D@gmail.com>
 <Y6dTX2wx/SXlswGC@kadam> <F701A496-22A6-4E3B-B3CB-E5BCF4C30502@gmail.com>
 <C430F7E6-723B-4EA8-BA87-00C84676BD4F@gmail.com> <Y6svZX++B5TYRHBT@kadam>
In-Reply-To: <Y6svZX++B5TYRHBT@kadam>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Dec 2022 20:30:33 +0200
Message-ID: <CAHp75Vem0ypV9+3JUrt_mBJU_TQ5yrp-ubk_NV2-ejTZ8Ac4Dg@mail.gmail.com>
Subject: Re: drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn:
 replace divide condition 'pin / 8' with 'pin >= 8'
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Qingtao Cao <qingtao.cao.au@gmail.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2022 at 7:46 PM Dan Carpenter <error27@gmail.com> wrote:
> On Sun, Dec 25, 2022 at 12:50:46PM +0100, Andy Shevchenko wrote:
> > > Andy Shevchenko <andy.shevchenko@gmail.com> kirjoitti 25.12.2022 kell=
o 12.45:
> > >>> Dan Carpenter <error27@gmail.com> kirjoitti 24.12.2022 kello 20.30:
> > >>> On Sat, Dec 24, 2022 at 05:19:27PM +0100, Andy Shevchenko wrote:
> > >>>> Dan Carpenter <error27@gmail.com> kirjoitti 23.12.2022 kello 11.54=
:

...

> > >>>> smatch warnings:
> > >>>> drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replac=
e divide condition 'pin / 8' with 'pin >=3D 8'
> > >>>> drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn: replac=
e divide condition 'pin / 8' with 'pin >=3D 8'
> > >>>
> > >>> I don=E2=80=99t think this is a good advice. If we want to limit th=
at, we need
> > >>> to check also upper limit. But. The GPIO framework does that. So,
> > >>> changing / to >=3D is bogus.
> > >>
> > >> How is checking pin / 8 not mathematically equivalent to pin >=3D 8?
> > >
> > > The point is that semantically the / is better in case this code will=
 ever support more than two banks of pins.
> >
> > On top of that it=E2=80=99s paired with pin % 8.
>
> I noticed that, but it's a common bug though that a lot of people
> accidentally write if (pin / 8) when if ((pin % 8) =3D=3D 0) is intended.

Probably. Here the pin/8 is the correct approach, it shows the bank
number, where each bank is out of 8 pins.

> For example:

Thanks, but it's unrelated to this case.

--=20
With Best Regards,
Andy Shevchenko
