Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E08746C;
	Wed, 27 Sep 2023 10:12:06 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4526d872941so4969471137.1;
        Wed, 27 Sep 2023 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695809525; x=1696414325; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZtI1kg9CQov6RXUpazIfG5f54p0rlP4ski1H96gvHU=;
        b=T/cUga2c6eE4hyruCnLegM0X7uek2urSDj5TSJyt54hKo9v67sWj/aEtZTGGlHJU0i
         MiohjJLPELWa7ZZEfcFneT9eZmJxPRMaqW9BxHhr9L6wAOEw3UsRtCdAxxuqr5C4RCDN
         r4Ph4mWaaY45pdCi7lI2e+wgWVwpfOL7UPHMdPZWH39x5Sg6nv1AI0JeHHt/1aZCawU/
         Wri0mKrSH6N+hqXGSmMnlOazEa1PUyyWslRgArUsYysQnyxkjcv5GG8HpLlwhd8CCvA4
         HnEm1ztpB2txCZSksV2E13ckz7Xjbt15N/WmHe1UcOG7EFmuViK8tdfxUM25kvItwzqV
         lrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695809525; x=1696414325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZtI1kg9CQov6RXUpazIfG5f54p0rlP4ski1H96gvHU=;
        b=iBV3YsnyVhILXJiznWIXPcNBAB3RDoLYaxN0QZXfgT95qcto+xBPTrG5+HUpc+ShB5
         CLCjuWP/4F+6HZ66BHRx1c/+2N2gUOoEfXHm1svgmuGK+QrQgPDMAJxOBLrAj33cTlGw
         w1EwaDjB1VjNSpX4Jt6UcWSRrjT+FnooA3K1pxzk5orG2MQ5XL/nqb+QpVJIqEhTIfuQ
         oggoWwqVZSBaMKpAF6Ns6zgkFm562Y+eg6Vfy5J7z1MaIuROV7jec2/0AaprXyuywSBz
         ypljHPea3un8PVoXo+ti07CwvzdPfP7IV5M5ejqlyIk10W9uPiD+Vn0WdaIcu9h1J8xz
         /FCg==
X-Gm-Message-State: AOJu0YzukyaPkwOwDkjabOc8DX+NtnIuvqaNNl/DGyvXn4Rmg1I/a4QS
	dvDydnXY5cFBkUp4LOCMpq3mYiaRLrFb9RnIpK4=
X-Google-Smtp-Source: AGHT+IHSdowiclIdOgzUxgXHHhryaXhCehLWKTLNNjmauUG0tMXaiChYS0u5p03La/CUXkEL0UALVmNf7H7XCFXllNc=
X-Received: by 2002:a67:ebce:0:b0:452:dae8:df05 with SMTP id
 y14-20020a67ebce000000b00452dae8df05mr1543407vso.9.1695809525589; Wed, 27 Sep
 2023 03:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain>
 <CAOQ4uxizw5ogqcehJcmuZTDBNLM=hx=jZpdQZ2fsTyVdMZHf1g@mail.gmail.com>
 <d41c7647-2085-4f80-9d7c-5f17eecb03ba@kadam.mountain> <374b9ca8-1391-4c30-8c70-b788cb656a94@kadam.mountain>
In-Reply-To: <374b9ca8-1391-4c30-8c70-b788cb656a94@kadam.mountain>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 27 Sep 2023 13:11:54 +0300
Message-ID: <CAOQ4uxhCpnE_cQEuomfrBeCjq=mpHsYG=A_8WDp-YQWJX0Q_Sg@mail.gmail.com>
Subject: Re: [amir73il:ovl_want_write 8/8] fs/overlayfs/copy_up.c:459
 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line 458)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 11:41=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Wed, Sep 27, 2023 at 11:39:09AM +0300, Dan Carpenter wrote:
> > On Wed, Sep 27, 2023 at 11:16:12AM +0300, Amir Goldstein wrote:
> > > > a0c236b11706cc Amir Goldstein 2021-06-19 @458   err =3D ovl_check_s=
etxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
> > > >                                                                    =
                                    ^^^^^^^
> > > > Dereference
> > > >
> > > > cbe7fba8edfc8c Amir Goldstein 2019-11-15 @459                      =
      fh ? fh->fb.len : 0, 0);
> > > >                                                                    =
      ^^
> > > > Checked too late.  This code is from 2021 though, so why is the war=
ning
> > > > getting reported now?
> > >
> > > That is what I was asking myself as well.
> > > The regressing commit is actually from 2019:
> > >
> > > cbe7fba8edfc ("ovl: make sure that real fid is 32bit aligned in memor=
y")
> > >
> > > I am guessing that the report above was triggered by my change of hel=
per
> > > name (to ovl_set_origin_fh()) in overlayfs-next.
> > >
> > > Anyway, Su Hui just reported the same smatch warning a few days ago:
> > >
> > > https://lore.kernel.org/linux-unionfs/20230925045059.92883-1-suhui@nf=
schina.com/
> > >
> > > I will apply Su Hui's fix to overlayfs-next.
> > > It does not seem too urgent though, because setxattr with 0 length
> > > would probably ignore the invalid value of buf.
> >
> > I don't know if it's urgent or not, but that explanation doesn't work.
> > This isn't an inline function.  So the dereference would happen at the
> > call site and not inside the ovl_check_setxattr() function.
>
> Ah.  Nope.   I'm wrong.  fb->buf[] is an array, so this is pointer
> math and not a dereference.  Sorry!
>
> Perhaps we did discuss this earlier and decided it's not a bug.
>

I can imagine we did :)
It's still worth fixing though, but not urgent.

Thanks,
Amir.
