Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C421ABC5
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197487; cv=none; b=KIY1qqaG9PMqxvhfxPajbb/nB+6xIl4nXE1T8OmiciB/WLko5Rha0QbAafvaYn8EtWOOA7o9LjVujHpjbg+Tdm0QhEzpQeWOGDFeeYA04+5F67+HBrtkiapt/o2eEzWcz+Y+7taAwSpkq8SynJ5ZyjFvfvgbzhNQVB6l5XIaNBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197487; c=relaxed/simple;
	bh=e4gavxXdmgwwBHJB7m3krJGrbLbzsW3XuPJmhcq5zOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUP0/jIsq+A1KLXa661l6l8WABxQLgOsPT1JCXJvhdRzK8/RJ7BfvPgLa+RGANOI6V38aZ+nrh2eDEyzzrC7dD/YkDbzY9CD9TDxFZD5awen0OMuafL0Q3y2QCzyMEYlIeo9brk0Yyonu0rueKH1z4gPz2Jgd8gVJWvmy7WRSIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xnt7POZb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xnt7POZb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so6742030a12.2
        for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742197483; x=1742802283; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUE8R4D8seWsEnROssMEJ1/bphw90lqlu9OPwN2yrqc=;
        b=Xnt7POZb3zph0tR66aCFrcZwPHGMCNgK6Is00LzKCyBQIhUZq5Yccj+gi0sIGB9uB2
         69FRq5Xhv7XUTaLc2EKm3zgoIrISQrFY6nTcNuGldIxuDBFFFGZECvZix2EbzqwedGDp
         2k6EgH4ZaJakZAsh2nvHEu0WA0ulQ6QLDsNu1oPJr1N5Bc+bQ4aT9PsXCu2ypuYf4sLA
         UjaE48A7m1Grk0MEOhMNIbmQZ+8EKduOKWOlIf8Q3eD+MHQtK+auXPey8LKNf5n9B/yP
         pYTuTJDrcJxITinhvac64u4S+eDurvl28zbws8KUuu/+UlFJ0vZuS+YyrJgZ3oDsPaS2
         gepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197483; x=1742802283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUE8R4D8seWsEnROssMEJ1/bphw90lqlu9OPwN2yrqc=;
        b=Dblmq7ojOcsqnV2CqCXyYZDJSr4lK4EBeNCFrTcGGghwMUOiph6X//77p8GS8Tdy1I
         UmA9ZPu9RQzhwGtREfJA//RKB6MfZwI7gVny3pMqokEAPVQoDmPAGHnSDSPECDvKWwpo
         4CX/Vojen4oxTiXKnU8XVIomp77z5+J0HezsAFdJwcDG8/0vpxGTEfTsvk8nqRZVeX+L
         hqJgtkpOwBMUT8X2KCs05nusfUZTBup1uwyLAe3U7JM5U9/8Yl7YJZEBVuB8LlMbns+Z
         odhBVUtR9si4/7bVgU//vTVd6LdAViezVZfNiNyKDQ1QOGnnE4hYvKNqfugzSTk7Xwwp
         VWcg==
X-Gm-Message-State: AOJu0YzSYFKkDzQRxyVL8i/+ZuZ/+1seEboX01V9wRTxjL1vMgp6f8FO
	R6LPjBC9sUQ9bc3xNf7uq2zIeUwPbw7gAGMCtMf6uD3x5jggl8TxeSHQ6N0X6lrHAsIBK2oH30L
	aTNjUPQuniqHAuQRAXQkzwEJto3DPQpOtETJyLQ==
X-Gm-Gg: ASbGncvky5i2L5vTtykeGhLN/+9+xvB19qd/NKQR4rEWz/SWY1wrqMlvC1mJcWW7S4v
	q8xzwYZSJrC7+52zKEzop4YUysq3IEhz+Od03Uc/7CWe8wg68nF9d3pRBvwO4J5rhgzvxnKmg/T
	ySM/C1/8Kw0enG3jtLsk/CA68cClcwxq4f/tRv0g==
X-Google-Smtp-Source: AGHT+IFb96AN9mBCT1uy5xz0tP/MegBeTN5ZXb8NeZYZgjqqksQ/j9r9IGvTWLXSAnudiKHZDOhUhP7feCwMfjOs9c4=
X-Received: by 2002:a50:cd81:0:b0:5e8:bdb4:2891 with SMTP id
 4fb4d7f45d1cf-5e8bdb42a54mr7828593a12.30.1742197483416; Mon, 17 Mar 2025
 00:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <06bf6c6d-f4f3-4a19-be2e-e8a7f3f6c999@stanley.mountain>
In-Reply-To: <06bf6c6d-f4f3-4a19-be2e-e8a7f3f6c999@stanley.mountain>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 17 Mar 2025 08:44:25 +0100
X-Gm-Features: AQ5f1JqRxMJKDyNsH2RYmCh1FDRej6HUqlbWbthmjJRjAW-vfg9dHr5bjnh-OLk
Message-ID: <CAHUa44HvaH0YZ0YSKTA-Xrrfy1140c3nVL=eD7gc=ZWG0=LgAQ@mail.gmail.com>
Subject: Re: [jens-wiklander-tee:testing/tuxbuild 6/10] drivers/tee/tee_shm.c:258
 tee_shm_register_fd() warn: passing zero to 'PTR_ERR'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Etienne Carriere <etienne.carriere@linaro.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Olivier Masse <olivier.masse@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Fri, Mar 7, 2025 at 10:35=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tux=
build
> head:   f4198d1f9ee51430ec81d02bb21f769cb6fd14c1
> commit: 7fc3cd07fc7e055deefa3b33ff9f702ccd9f7864 [6/10] tee: new ioctl to=
 a register tee_shm from a dmabuf file descriptor
> config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/arch=
ive/20250307/202503071648.ViJVMQTh-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202503071648.ViJVMQTh-lkp@intel.com/
>
> smatch warnings:
> drivers/tee/tee_shm.c:258 tee_shm_register_fd() warn: passing zero to 'PT=
R_ERR'
>
> vim +/PTR_ERR +258 drivers/tee/tee_shm.c
>
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  210  struct tee_shm *tee_shm_=
register_fd(struct tee_context *ctx, int fd)
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  211  {
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  212         struct tee_shm_dm=
abuf_ref *ref;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  213         int rc;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  214
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  215         if (!tee_device_g=
et(ctx->teedev))
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  216                 return ER=
R_PTR(-EINVAL);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  217
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  218         teedev_ctx_get(ct=
x);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  219
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  220         ref =3D kzalloc(s=
izeof(*ref), GFP_KERNEL);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  221         if (!ref) {
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  222                 rc =3D -E=
NOMEM;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  223                 goto err_=
put_tee;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  224         }
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  225
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  226         refcount_set(&ref=
->shm.refcount, 1);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  227         ref->shm.ctx =3D =
ctx;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  228         ref->shm.id =3D -=
1;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  229         ref->shm.flags =
=3D TEE_SHM_DMA_BUF;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  230
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  231         ref->dmabuf =3D d=
ma_buf_get(fd);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  232         if (IS_ERR(ref->d=
mabuf)) {
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  233                 rc =3D PT=
R_ERR(ref->dmabuf);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  234                 goto err_=
kfree_ref;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  235         }
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  236
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  237         rc =3D tee_heap_u=
pdate_from_dma_buf(ctx->teedev, ref->dmabuf,
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  238                          =
                 &ref->offset, &ref->shm,
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  239                          =
                 &ref->parent_shm);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  240         if (!rc)
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  241                 goto out;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  242         if (rc !=3D -EINV=
AL)
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  243                 goto err_=
put_dmabuf;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  244
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  245         ref->attach =3D d=
ma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  246         if (IS_ERR(ref->a=
ttach)) {
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  247                 rc =3D PT=
R_ERR(ref->attach);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  248                 goto err_=
put_dmabuf;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  249         }
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  250
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  251         ref->sgt =3D dma_=
buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  252         if (IS_ERR(ref->s=
gt)) {
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  253                 rc =3D PT=
R_ERR(ref->sgt);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  254                 goto err_=
detach;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  255         }
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  256
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  257         if (sg_nents(ref-=
>sgt->sgl) !=3D 1) {
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27 @258                 rc =3D PT=
R_ERR(ref->sgt->sgl);
>
> This should be "rc =3D -EINVAL;"

You're right, I'll update in the next version.

Thanks,
Jens

>
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  259                 goto err_=
unmap_attachement;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  260         }
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  261
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  262         ref->shm.paddr =
=3D page_to_phys(sg_page(ref->sgt->sgl));
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  263         ref->shm.size =3D=
 ref->sgt->sgl->length;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  264
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  265  out:
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  266         mutex_lock(&ref->=
shm.ctx->teedev->mutex);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  267         ref->shm.id =3D i=
dr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  268                          =
       1, 0, GFP_KERNEL);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  269         mutex_unlock(&ref=
->shm.ctx->teedev->mutex);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  270         if (ref->shm.id <=
 0) {
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  271                 rc =3D re=
f->shm.id;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  272                 if (ref->=
attach)
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  273                         g=
oto err_unmap_attachement;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  274                 goto err_=
put_dmabuf;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  275         }
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  276
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  277         return &ref->shm;
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  278
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  279  err_unmap_attachement:
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  280         dma_buf_unmap_att=
achment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  281  err_detach:
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  282         dma_buf_detach(re=
f->dmabuf, ref->attach);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  283  err_put_dmabuf:
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  284         dma_buf_put(ref->=
dmabuf);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  285  err_kfree_ref:
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  286         kfree(ref);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  287  err_put_tee:
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  288         teedev_ctx_put(ct=
x);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  289         tee_device_put(ct=
x->teedev);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  290
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  291         return ERR_PTR(rc=
);
> 7fc3cd07fc7e05 Etienne Carriere 2016-10-27  292  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
