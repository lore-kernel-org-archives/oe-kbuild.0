Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BFA15C0;
	Wed, 27 Sep 2023 08:16:24 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7a8b839fc0aso3215577241.3;
        Wed, 27 Sep 2023 01:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695802583; x=1696407383; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUgLkpKSQhm88opg6l1TFrdCejUdTkpPszrJTse65Cg=;
        b=AwXM00yB2Qa4lDNou6LQwWOaC1RJctntAbqyA9FsVOzWENRlo7esY2yPMu85LK6zAs
         6DBcDO6OGI2tpLyTlx2vCdkbTM4kh1Zkv2XPZ3KZ/Ct9mPdLY6p6fvImC2RBUIbI5qIf
         C0IrxuIvz9345fUVsdT9jCtJ4axPPiNImGsfl4+OLthoPm5GBw3ECOB388BKE6YTFM46
         tvGv02Ank/6AsKxeRoIHi6LwY5NjiIpU2AiEVb+pUpV/v5Jk67XzCwTkIY3JJoNzdsCB
         y82vwoUlB80EttVA9Eo0T7cgwkh+4OauUBZXRJPKG0va2HIpyYexLwe1KgvOWU5zlEZP
         vZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695802583; x=1696407383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUgLkpKSQhm88opg6l1TFrdCejUdTkpPszrJTse65Cg=;
        b=WSugp6Tya6wWuolc/a6IqILBHg4lwDl3kAgvg33Vxym2W18cOzDXGYvZIgyqkdPgzJ
         4cjCiEEtIEplHCcDWFSlcPyGT0+KO5KEOJ6A/YvTBJKN1LSDMysJwrI+yVqSqGeGXiVl
         h57Ev5JjYY6ucW9kKdNQKQmvTrnZcxtPV3GvGlXGVqXLlGn52X2YnUgAX3voF+/ucQyB
         kFios+Jy0/pGMJyvG6Yo4uXoKuLJtKD/CkjCF82dzB4hTps9oy4CJKNjpR/YrRlf4xaU
         Hj9zzoMCKc7Ihn7HB4t5hu8n2Os8/Za37n9NUi7801aEwd9ax3Z4AsezSUzt+yPSMiAM
         QmOQ==
X-Gm-Message-State: AOJu0YzXvNsuwfcSWopsBaQ9Znz3bxioz16ee2ntolQWfsooMxyaRgKQ
	YNmlrD7A6DiKX+Zzn2qazrVIwE2/k9iEDGQl2SE=
X-Google-Smtp-Source: AGHT+IG1FpMengipmAlrUf+If+099h8X6iYckw+x637172ebpmoYN3IkGj/+IlkXANXrCrFMq779HLJGk/H0quhwsyk=
X-Received: by 2002:a67:fb4e:0:b0:452:8574:4545 with SMTP id
 e14-20020a67fb4e000000b0045285744545mr952923vsr.5.1695802583432; Wed, 27 Sep
 2023 01:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain>
In-Reply-To: <1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 27 Sep 2023 11:16:12 +0300
Message-ID: <CAOQ4uxizw5ogqcehJcmuZTDBNLM=hx=jZpdQZ2fsTyVdMZHf1g@mail.gmail.com>
Subject: Re: [amir73il:ovl_want_write 8/8] fs/overlayfs/copy_up.c:459
 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line 458)
To: Dan Carpenter <dan.carpenter@linaro.org>, Su Hui <suhui@nfschina.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 10:46=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> tree:   https://github.com/amir73il/linux ovl_want_write
> head:   4ea9d9f55925f6631923f76831d8a2a850d3876e
> commit: 4ea9d9f55925f6631923f76831d8a2a850d3876e [8/8] ovl: do not encode=
 lower fh with upper sb_writers held
> config: i386-randconfig-141-20230909 (https://download.01.org/0day-ci/arc=
hive/20230909/202309091443.rCZuOntT-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091443=
.rCZuOntT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/1ce9ae3e-718d-490f-b85d-80f7a5d1df72@=
kadam.mountain/
>
> smatch warnings:
> fs/overlayfs/copy_up.c:459 ovl_set_origin_fh() warn: variable dereference=
d before check 'fh' (see line 458)
>
> vim +/fh +459 fs/overlayfs/copy_up.c
>
> 4ea9d9f55925f6 Amir Goldstein 2023-08-16  450  int ovl_set_origin_fh(stru=
ct ovl_fs *ofs, const struct ovl_fh *fh,
> 4ea9d9f55925f6 Amir Goldstein 2023-08-16  451                 struct dent=
ry *upper)
> 4ea9d9f55925f6 Amir Goldstein 2023-08-16  452  {
> 4ea9d9f55925f6 Amir Goldstein 2023-08-16  453   int err;
> 4ea9d9f55925f6 Amir Goldstein 2023-08-16  454
> 6266d465bde044 Miklos Szeredi 2017-05-18  455   /*
> 6266d465bde044 Miklos Szeredi 2017-05-18  456    * Do not fail when upper=
 doesn't support xattrs.
> 6266d465bde044 Miklos Szeredi 2017-05-18  457    */
> a0c236b11706cc Amir Goldstein 2021-06-19 @458   err =3D ovl_check_setxatt=
r(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
>                                                                          =
                              ^^^^^^^
> Dereference
>
> cbe7fba8edfc8c Amir Goldstein 2019-11-15 @459                            =
fh ? fh->fb.len : 0, 0);
>                                                                          =
^^
> Checked too late.  This code is from 2021 though, so why is the warning
> getting reported now?

That is what I was asking myself as well.
The regressing commit is actually from 2019:

cbe7fba8edfc ("ovl: make sure that real fid is 32bit aligned in memory")

I am guessing that the report above was triggered by my change of helper
name (to ovl_set_origin_fh()) in overlayfs-next.

Anyway, Su Hui just reported the same smatch warning a few days ago:

https://lore.kernel.org/linux-unionfs/20230925045059.92883-1-suhui@nfschina=
.com/

I will apply Su Hui's fix to overlayfs-next.
It does not seem too urgent though, because setxattr with 0 length
would probably ignore the invalid value of buf.

Thanks,
Amir.
