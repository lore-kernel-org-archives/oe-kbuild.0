Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24B568B;
	Thu,  7 Sep 2023 11:30:23 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5924093a9b2so8876927b3.2;
        Thu, 07 Sep 2023 04:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694086222; x=1694691022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARN4xuhYZ7lSwH89iRCy1ksYn1EV+NyFN8++9iEiUo4=;
        b=Oxz/+1pqeIUCEdkPq6T8dcbqp5OS06cmpLie65H3ZH2HPFesMH12qL4g+Z6QKkGF9a
         TNTlRlbqKodaZ3eFdwXYUcuLxhGJt5qfTaRqdLVZ5gj5xr5XupJxkr4HM1QG9LJabtFH
         8sppQRK/TDNLp7DmCO3fdRCjorfBqzTRfDhT/mmBrvR80OG0mgIjZ7VSn4O/Y4Vk27dE
         3KA/Q4QdFKvY65Binb3x9nMIosEFNwYtNbF535DvVdJuer5fgbUEjVM96fXNZJbKzeVY
         lSQrP/Br8bWqCXqtUh+wnm4qelMewp97kSyEW8wD/UMNZJwQjUmBnEsbPY+oAbYi0H0S
         mXYQ==
X-Gm-Message-State: AOJu0YwAX7S79DRhmVcaI/Ahx67603F0GyIPCUt0jKrZefgSPC9WY6nn
	N/I3CCgpyU16jgwOsVZFtEcZY5xQEwCMYA==
X-Google-Smtp-Source: AGHT+IEosDlc0Zx8w8dQN3Tihb1Ou2zvOSza1J4Mqs6jtmCZEChm2MrKs9CwegsHcQF8yMB1DCY2Ug==
X-Received: by 2002:a0d:f3c7:0:b0:592:2a17:9d64 with SMTP id c190-20020a0df3c7000000b005922a179d64mr22230686ywf.20.1694086222338;
        Thu, 07 Sep 2023 04:30:22 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id d193-20020a0ddbca000000b0058c8b1ddcc1sm4255842ywe.15.2023.09.07.04.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 04:30:21 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d7e6d9665bcso759152276.1;
        Thu, 07 Sep 2023 04:30:21 -0700 (PDT)
X-Received: by 2002:a25:8f87:0:b0:d08:5a25:e6b4 with SMTP id
 u7-20020a258f87000000b00d085a25e6b4mr19246497ybl.28.1694086221753; Thu, 07
 Sep 2023 04:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <eaa86211-436d-445b-80bd-84cea5745b5a@kadam.mountain>
In-Reply-To: <eaa86211-436d-445b-80bd-84cea5745b5a@kadam.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Sep 2023 13:30:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgTKfk0DdzS1ZtKuij1NE-nTEBdgnnS0o2uy8RbtagmQ@mail.gmail.com>
Message-ID: <CAMuHMdUgTKfk0DdzS1ZtKuij1NE-nTEBdgnnS0o2uy8RbtagmQ@mail.gmail.com>
Subject: Re: drivers/of/dynamic.c:935 of_changeset_action() warn: possible
 memory leak of 'ce'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Rob Herring <robh@kernel.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, Sep 7, 2023 at 12:52=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   99d99825fc075fd24b60cc9cf0fb1e20b9c16b0f
> commit: 914d9d831e6126a6e7a92e27fcfaa250671be42c of: dynamic: Refactor ac=
tion prints to not use "%pOF" inside devtree_lock
> config: x86_64-randconfig-161-20230831 (https://download.01.org/0day-ci/a=
rchive/20230901/202309011059.EOdr4im9-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230901/202309011059=
.EOdr4im9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202309011059.EOdr4im9-lkp@intel.com/
>
> smatch warnings:
> drivers/of/dynamic.c:935 of_changeset_action() warn: possible memory leak=
 of 'ce'
>
> vim +/ce +935 drivers/of/dynamic.c
>
> 201c910bd6898d Pantelis Antoniou 2014-07-04  925  int of_changeset_action=
(struct of_changeset *ocs, unsigned long action,
> 201c910bd6898d Pantelis Antoniou 2014-07-04  926                struct de=
vice_node *np, struct property *prop)
> 201c910bd6898d Pantelis Antoniou 2014-07-04  927  {
> 201c910bd6898d Pantelis Antoniou 2014-07-04  928        struct of_changes=
et_entry *ce;
> 201c910bd6898d Pantelis Antoniou 2014-07-04  929
> 201c910bd6898d Pantelis Antoniou 2014-07-04  930        ce =3D kzalloc(si=
zeof(*ce), GFP_KERNEL);
> 606ad42aa3b1fe Rob Herring       2016-06-15  931        if (!ce)
> 201c910bd6898d Pantelis Antoniou 2014-07-04  932                return -E=
NOMEM;
> 606ad42aa3b1fe Rob Herring       2016-06-15  933
> 914d9d831e6126 Rob Herring       2023-08-18  934        if (WARN_ON(actio=
n >=3D ARRAY_SIZE(action_names)))
> 914d9d831e6126 Rob Herring       2023-08-18 @935                return -E=
INVAL;
>
> No kfree(ce).  Probably we move this check before the kmalloc()?

Yes, moving up sounds great.
Care to send a patch?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
