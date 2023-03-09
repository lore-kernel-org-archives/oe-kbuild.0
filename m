Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3357E6;
	Thu,  9 Mar 2023 05:19:49 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id cy23so2328592edb.12;
        Wed, 08 Mar 2023 21:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678339188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA9Ua6B6An6RP3rVZJ6ZH88clwhca28y6cgL9YikeQc=;
        b=P7gljFgRoN0FfATXgsTakXNbMVB+8MVmeIhCZS0lWnErCEEggI/jbT6JnluvbD0/3C
         bEXhQW4V96J2rXI4J45+0IJP3gFOflJRB6AHFLuZrviUk8isGWl9LXYZLWCZ/64lcipB
         4HuzOy3B6cy4D64xphkx91/Jevl7ikHIRsI1QwIsrx5LRJBbuiAcKpuktQpJiPvN4DYU
         dIRv7x/u50m1w+rngTsCSw5me7Axco5oWMk3L+clbC8ekrA/ewupCe7lqlFx9/Ozaayu
         dvkXgsKPatmdaozq1mA1dPhxfIiWK71TuY/61FEn9QRoBWMLZtw3FkkS/CFgtGb3Jp7k
         X3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678339188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA9Ua6B6An6RP3rVZJ6ZH88clwhca28y6cgL9YikeQc=;
        b=fdrWqUa8Xmb15LnjQQen9TWqTah7+vJgknlpdC41uJxtWbOrcXun7G2yfEgoCzQQEL
         RLrsq7bDGvXekkjaDcld+9sbGmsCzM+H8DQzCnIXN8vaCNQo9QL+ZPLlhJ8CUdoFvOHP
         ks96AAFFhk7094ficYa7QC8AbniDTWnbV04ZYZvGxJDzEIeG9g8bxGtFE+BQJcvFUbHu
         MV/u6K+l9ylQt5ui7m5jGwiZHG/CRTOWGhg7jrn6NF05hp1Ml7IKQtmA8ZVjNFwhnPFs
         a6xBvakV1BQu3Sqnpg0GiOKKds6oio3/zrgKc4CUgeSzZA61gCYs9YyFuqktgDzpQZsG
         K7BQ==
X-Gm-Message-State: AO0yUKVs31iy4ECHeMzfrLHnKUZOW0JIh/3ALw3vCT3Hjpw99+YH5GWM
	D+H4yva6sirQoReumn77iYaWlqYDu2mNmFzK3l0=
X-Google-Smtp-Source: AK7set+IydFkLYBqKZo5hwECOIoDIqKc9MbHNPs/CFSLMiIXPh25DogGB5WIwBlgpXsfxdM4f5MUHf3oNNCmXn1mgrA=
X-Received: by 2002:a17:906:4094:b0:8b1:28e5:a1bc with SMTP id
 u20-20020a170906409400b008b128e5a1bcmr9555160ejj.5.1678339188070; Wed, 08 Mar
 2023 21:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230308035416.2591326-4-andrii@kernel.org> <1399021d-b06a-447c-94ca-6cc657c9c0b2@kili.mountain>
In-Reply-To: <1399021d-b06a-447c-94ca-6cc657c9c0b2@kili.mountain>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 8 Mar 2023 21:19:36 -0800
Message-ID: <CAEf4BzYzUmoeNPGbb+up8jRa1Q_BsQr4Sh+pb-X-SnswNW8hGA@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 3/8] bpf: add support for open-coded iterator loops
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, kernel-team@meta.com, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 8:35=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> Hi Andrii,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bp=
f-factor-out-fetching-basic-kfunc-metadata/20230308-115539
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230308035416.2591326-4-andrii%=
40kernel.org
> patch subject: [PATCH v4 bpf-next 3/8] bpf: add support for open-coded it=
erator loops
> config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-=
ci/archive/20230309/202303090153.YeswNcW4-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303090153.YeswNcW4-lkp@intel.com/
>
> smatch warnings:
> kernel/bpf/verifier.c:1244 is_iter_reg_valid_uninit() error: uninitialize=
d symbol 'j'.
>
> vim +/j +1244 kernel/bpf/verifier.c
>
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1225  static bool is_iter_reg_=
valid_uninit(struct bpf_verifier_env *env,
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1226                          =
            struct bpf_reg_state *reg, int nr_slots)
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1227  {
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1228         struct bpf_func_s=
tate *state =3D func(env, reg);
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1229         int spi, i, j;
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1230
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1231         /* For -ERANGE (i=
.e. spi not falling into allocated stack slots), we
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1232          * will do check_=
mem_access to check and update stack bounds later, so
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1233          * return true fo=
r that case.
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1234          */
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1235         spi =3D iter_get_=
spi(env, reg, nr_slots);
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1236         if (spi =3D=3D -E=
RANGE)
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1237                 return tr=
ue;
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1238         if (spi < 0)
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1239                 return sp=
i;
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1240
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1241         for (i =3D 0; i <=
 nr_slots; i++) {
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1242                 struct bp=
f_stack_state *slot =3D &state->stack[spi - i];
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1243
> 8f263e1296a91f Andrii Nakryiko 2023-03-07 @1244                 if (slot-=
>slot_type[j] =3D=3D STACK_ITER)
>                                                                          =
           ^
> s/j/i/?
>

nope, I accidentally removed the inner for loop. I fixed all that in
v5, which was applied today. But thanks for the notification!

> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1245                         r=
eturn false;
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1246         }
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1247
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1248         return true;
> 8f263e1296a91f Andrii Nakryiko 2023-03-07  1249  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>
