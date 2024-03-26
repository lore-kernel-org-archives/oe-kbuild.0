Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2313C918
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469749; cv=none; b=Fb61OJ542bf2/z7BKxWjNGCsoklMcofpQEWcI4Nvv6s9KiDeSJ75cHqEQ67C13EJUOuY+CDMuCGipTwZkPena+X4/BdwJ7sepRUtG3M2N8hfCHIfR8BxLLGiXs1UJyKDhm0nB2SNItevN3Co4GGPYRUj5gTb3rRwB4cJbehgDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469749; c=relaxed/simple;
	bh=hukmpe7xc3HcGfuSzJCHMAomx7RAbQ/kuhVm0meup8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=et4POfdwazTJxg05ANw8j+fkmEjQTDPU0aKMOOyjEdtDNk+mbEo/yhJ3kfHA8JwQmkSfXlJrXx+QOQitA2af3jUHK3HWOw5eQsRDIRKIBBjsAKbVXxgbXirJoNsxYx9d2orMn+7kmu0TE85FvOZvaKIrfNi+j11mYb/LVqPKDNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Ya4E22O; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Ya4E22O"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-414925ba76eso845125e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711469746; x=1712074546; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uW99GXbuR2PPtMFac4gbpKdFmdqs2065opCorH1F6c=;
        b=3Ya4E22OAfFL6mftwpCHFWV13vtn0THfeXIrzXl5KpYjCX7HsDhCKcUIFKhhoazhs5
         MzWWBz6BIAPnvpLLHrS8/QYJ/KxHNSxzxXRl8DlEFFiHiT2t7ET7d7IJ+uQTYOO42OzZ
         DLJDfnXSUdKqADlpaoE8o5CTSBlhkHctjrkTQux/0o3lN7GzfR7UWztYCcB7p8Vy37+Y
         ZHOatKJV2sLjuO4hQvDgZrD+Elpkmgmu71dsFppc7aTd3kWvU0qZ9ZsPtuHxVP/B7U3x
         j3bwSi0Bi3Yve1r+dKD0RgwpvAtYkcIWy6T6Wqfa+HOgSJEtHBnfkqqGRuBjfN5uBQ9l
         u4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711469746; x=1712074546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uW99GXbuR2PPtMFac4gbpKdFmdqs2065opCorH1F6c=;
        b=hyNhqU7fsP3G1YTmZsLtoHxTQ8vYxMMoq9daHAOPipnNIvrcKzhSMJoSKjHs68HZVZ
         8rrqA0WA7cUkc1/nGG0MObx8qCUbHfMIoAqUG2s85G7Mr1LJXW9Mcrgk5i6NjgA63rx8
         lh/NyXI5X5k8vPDrU+poVp8qgwyiLKUl02EO7xrrXHrd+bWa/tv5XcOMKy31zyDzPLK5
         wNdaGEyzPNzC/wDLeWErJ7XEH/MCRaOcL0PolJYqD3hldmeCclkg3l4Cj7lQqh/L1wKZ
         IVLRVzT/WHM8Y3hYIShvCd/LkwrVxIck8+YjQZ7CFgEULlX5ub2DinTPcP8a2agPyXHr
         YgBg==
X-Gm-Message-State: AOJu0YyFgAuooL+ljSvenK61w9oxpRIml0UGZOl+WOCMILjuX34IufeB
	ve3R3YOGrOvx2ACFTQ7fk/jTbMbiDsRj/Soa6E5IilVZqMVqDFxFUjju2qQGEOVxeDeGK7nwtaB
	cfPw5gp52tqS/C2p+opF9AJYHcn2x8Zdw7PuN
X-Google-Smtp-Source: AGHT+IFVT5MW9Zflb+bZUf4FmiOHAr5hTvvpv80I5QU2xB+ej9yy/I8vrkrZ/xjH2QuRNE63qF2FRVTZkLTEBZ41B4k=
X-Received: by 2002:a05:6000:1569:b0:341:d912:1fec with SMTP id
 9-20020a056000156900b00341d9121fecmr1728118wrz.49.1711469745408; Tue, 26 Mar
 2024 09:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1fae20f7-5c32-45af-858d-4b8f79e8149a@moroto.mountain>
In-Reply-To: <1fae20f7-5c32-45af-858d-4b8f79e8149a@moroto.mountain>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 26 Mar 2024 09:15:31 -0700
Message-ID: <CAJuCfpGXyKNFJd4BsOkAqEJ5QSfbpVvjZRhCA9AEXZzTKGryFw@mail.gmail.com>
Subject: Re: [linux-next:master 1083/1266] drivers/dma/sun6i-dma.c:777
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 7:53=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> [ I guess Suren Baghdasaryan's patches exposed a much older use after
>   free in this driver.  -dan ]

Huh, this is interesting. The warnings seem reasonable but I have no
idea why our patchset would make them more visible... CC'ing Kent in
case he has an idea.

>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   084c8e315db34b59d38d06e684b1a0dd07d30287
> commit: c64e38ed88d13557ebeb4cb8def02390a8f3dfc4 [1083/1266] mm/slab: ena=
ble slab allocation tagging for kmalloc and friends
> config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/ar=
chive/20240326/202403261808.c8ovEmC1-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403261808.c8ovEmC1-lkp@intel.com/
>
> smatch warnings:
> drivers/dma/sun6i-dma.c:777 sun6i_dma_prep_slave_sg() error: dereferencin=
g freed memory 'v_lli'
> drivers/dma/sun6i-dma.c:848 sun6i_dma_prep_dma_cyclic() error: dereferenc=
ing freed memory 'v_lli'
>
> vim +/v_lli +777 drivers/dma/sun6i-dma.c
>
> 555859308723d8 Maxime Ripard       2014-07-17  700  static struct dma_asy=
nc_tx_descriptor *sun6i_dma_prep_slave_sg(
> 555859308723d8 Maxime Ripard       2014-07-17  701              struct dm=
a_chan *chan, struct scatterlist *sgl,
> 555859308723d8 Maxime Ripard       2014-07-17  702              unsigned =
int sg_len, enum dma_transfer_direction dir,
> 555859308723d8 Maxime Ripard       2014-07-17  703              unsigned =
long flags, void *context)
> 555859308723d8 Maxime Ripard       2014-07-17  704  {
> 555859308723d8 Maxime Ripard       2014-07-17  705      struct sun6i_dma_=
dev *sdev =3D to_sun6i_dma_dev(chan->device);
> 555859308723d8 Maxime Ripard       2014-07-17  706      struct sun6i_vcha=
n *vchan =3D to_sun6i_vchan(chan);
> 555859308723d8 Maxime Ripard       2014-07-17  707      struct dma_slave_=
config *sconfig =3D &vchan->cfg;
> 555859308723d8 Maxime Ripard       2014-07-17  708      struct sun6i_dma_=
lli *v_lli, *prev =3D NULL;
> 555859308723d8 Maxime Ripard       2014-07-17  709      struct sun6i_desc=
 *txd;
> 555859308723d8 Maxime Ripard       2014-07-17  710      struct scatterlis=
t *sg;
> 555859308723d8 Maxime Ripard       2014-07-17  711      dma_addr_t p_lli;
> 52c871798ff84b Jean-Francois Moine 2016-04-22  712      u32 lli_cfg;
> 555859308723d8 Maxime Ripard       2014-07-17  713      int i, ret;
> 555859308723d8 Maxime Ripard       2014-07-17  714
> 555859308723d8 Maxime Ripard       2014-07-17  715      if (!sgl)
> 555859308723d8 Maxime Ripard       2014-07-17  716              return NU=
LL;
> 555859308723d8 Maxime Ripard       2014-07-17  717
> 52c871798ff84b Jean-Francois Moine 2016-04-22  718      ret =3D set_confi=
g(sdev, sconfig, dir, &lli_cfg);
> 52c871798ff84b Jean-Francois Moine 2016-04-22  719      if (ret) {
> 52c871798ff84b Jean-Francois Moine 2016-04-22  720              dev_err(c=
han2dev(chan), "Invalid DMA configuration\n");
> 52c871798ff84b Jean-Francois Moine 2016-04-22  721              return NU=
LL;
> 52c871798ff84b Jean-Francois Moine 2016-04-22  722      }
> 52c871798ff84b Jean-Francois Moine 2016-04-22  723
> 555859308723d8 Maxime Ripard       2014-07-17  724      txd =3D kzalloc(s=
izeof(*txd), GFP_NOWAIT);
> 555859308723d8 Maxime Ripard       2014-07-17  725      if (!txd)
> 555859308723d8 Maxime Ripard       2014-07-17  726              return NU=
LL;
> 555859308723d8 Maxime Ripard       2014-07-17  727
> 555859308723d8 Maxime Ripard       2014-07-17  728      for_each_sg(sgl, =
sg, sg_len, i) {
> ec31c5c5949275 Samuel Holland      2022-04-24  729              v_lli =3D=
 dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  730              if (!v_ll=
i)
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  731                      g=
oto err_lli_free;
> 555859308723d8 Maxime Ripard       2014-07-17  732
> 52c871798ff84b Jean-Francois Moine 2016-04-22  733              v_lli->le=
n =3D sg_dma_len(sg);
> 52c871798ff84b Jean-Francois Moine 2016-04-22  734              v_lli->pa=
ra =3D NORMAL_WAIT;
> 555859308723d8 Maxime Ripard       2014-07-17  735
> 52c871798ff84b Jean-Francois Moine 2016-04-22  736              if (dir =
=3D=3D DMA_MEM_TO_DEV) {
> ec31c5c5949275 Samuel Holland      2022-04-24  737                      s=
un6i_dma_set_addr(sdev, v_lli,
> ec31c5c5949275 Samuel Holland      2022-04-24  738                       =
                  sg_dma_address(sg),
> ec31c5c5949275 Samuel Holland      2022-04-24  739                       =
                  sconfig->dst_addr);
> 802440bdf3b787 Jernej Skrabec      2019-05-27  740                      v=
_lli->cfg =3D lli_cfg;
> 67f34055118cb6 Jernej Skrabec      2019-05-27  741                      s=
dev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
> 802440bdf3b787 Jernej Skrabec      2019-05-27  742                      s=
dev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
> 555859308723d8 Maxime Ripard       2014-07-17  743
> 555859308723d8 Maxime Ripard       2014-07-17  744                      d=
ev_dbg(chan2dev(chan),
> 7f5e03e7367293 Vinod Koul          2014-07-28  745                       =
       "%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
> 555859308723d8 Maxime Ripard       2014-07-17  746                       =
       __func__, vchan->vc.chan.chan_id,
> 555859308723d8 Maxime Ripard       2014-07-17  747                       =
       &sconfig->dst_addr, &sg_dma_address(sg),
> 555859308723d8 Maxime Ripard       2014-07-17  748                       =
       sg_dma_len(sg), flags);
> 555859308723d8 Maxime Ripard       2014-07-17  749
> 555859308723d8 Maxime Ripard       2014-07-17  750              } else {
> ec31c5c5949275 Samuel Holland      2022-04-24  751                      s=
un6i_dma_set_addr(sdev, v_lli,
> ec31c5c5949275 Samuel Holland      2022-04-24  752                       =
                  sconfig->src_addr,
> ec31c5c5949275 Samuel Holland      2022-04-24  753                       =
                  sg_dma_address(sg));
> 802440bdf3b787 Jernej Skrabec      2019-05-27  754                      v=
_lli->cfg =3D lli_cfg;
> 67f34055118cb6 Jernej Skrabec      2019-05-27  755                      s=
dev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
> 802440bdf3b787 Jernej Skrabec      2019-05-27  756                      s=
dev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
> 555859308723d8 Maxime Ripard       2014-07-17  757
> 555859308723d8 Maxime Ripard       2014-07-17  758                      d=
ev_dbg(chan2dev(chan),
> 7f5e03e7367293 Vinod Koul          2014-07-28  759                       =
       "%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
> 555859308723d8 Maxime Ripard       2014-07-17  760                       =
       __func__, vchan->vc.chan.chan_id,
> 555859308723d8 Maxime Ripard       2014-07-17  761                       =
       &sg_dma_address(sg), &sconfig->src_addr,
> 555859308723d8 Maxime Ripard       2014-07-17  762                       =
       sg_dma_len(sg), flags);
> 555859308723d8 Maxime Ripard       2014-07-17  763              }
> 555859308723d8 Maxime Ripard       2014-07-17  764
> 555859308723d8 Maxime Ripard       2014-07-17  765              prev =3D =
sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
> 555859308723d8 Maxime Ripard       2014-07-17  766      }
> 555859308723d8 Maxime Ripard       2014-07-17  767
> 555859308723d8 Maxime Ripard       2014-07-17  768      dev_dbg(chan2dev(=
chan), "First: %pad\n", &txd->p_lli);
> 9aa48806edb8c3 Samuel Holland      2022-04-24  769      for (p_lli =3D tx=
d->p_lli, v_lli =3D txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24  770           p_lli =3D v_=
lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> 9aa48806edb8c3 Samuel Holland      2022-04-24  771              sun6i_dma=
_dump_lli(vchan, v_lli, p_lli);
> 555859308723d8 Maxime Ripard       2014-07-17  772
> 555859308723d8 Maxime Ripard       2014-07-17  773      return vchan_tx_p=
rep(&vchan->vc, &txd->vd, flags);
> 555859308723d8 Maxime Ripard       2014-07-17  774
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  775  err_lli_free:
> 9aa48806edb8c3 Samuel Holland      2022-04-24  776      for (p_lli =3D tx=
d->p_lli, v_lli =3D txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @777           p_lli =3D v_=
lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
>                                                                      ^^^^=
^^^                    ^^^^^^^
> 9aa48806edb8c3 Samuel Holland      2022-04-24  778              dma_pool_=
free(sdev->pool, v_lli, p_lli);
>                                                                          =
                 ^^^^^
> It's illegal to dereference "v_lli" after passing it to
> dma_pool_free().
>
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  779      kfree(txd);
> 555859308723d8 Maxime Ripard       2014-07-17  780      return NULL;
> 555859308723d8 Maxime Ripard       2014-07-17  781  }
> 555859308723d8 Maxime Ripard       2014-07-17  782
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  783  static struct dma_asy=
nc_tx_descriptor *sun6i_dma_prep_dma_cyclic(
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  784                       =
               struct dma_chan *chan,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  785                       =
               dma_addr_t buf_addr,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  786                       =
               size_t buf_len,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  787                       =
               size_t period_len,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  788                       =
               enum dma_transfer_direction dir,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  789                       =
               unsigned long flags)
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  790  {
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  791      struct sun6i_dma_=
dev *sdev =3D to_sun6i_dma_dev(chan->device);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  792      struct sun6i_vcha=
n *vchan =3D to_sun6i_vchan(chan);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  793      struct dma_slave_=
config *sconfig =3D &vchan->cfg;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  794      struct sun6i_dma_=
lli *v_lli, *prev =3D NULL;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  795      struct sun6i_desc=
 *txd;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  796      dma_addr_t p_lli;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  797      u32 lli_cfg;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  798      unsigned int i, p=
eriods =3D buf_len / period_len;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  799      int ret;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  800
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  801      ret =3D set_confi=
g(sdev, sconfig, dir, &lli_cfg);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  802      if (ret) {
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  803              dev_err(c=
han2dev(chan), "Invalid DMA configuration\n");
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  804              return NU=
LL;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  805      }
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  806
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  807      txd =3D kzalloc(s=
izeof(*txd), GFP_NOWAIT);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  808      if (!txd)
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  809              return NU=
LL;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  810
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  811      for (i =3D 0; i <=
 periods; i++) {
> ec31c5c5949275 Samuel Holland      2022-04-24  812              v_lli =3D=
 dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  813              if (!v_ll=
i) {
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  814                      d=
ev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  815                      g=
oto err_lli_free;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  816              }
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  817
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  818              v_lli->le=
n =3D period_len;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  819              v_lli->pa=
ra =3D NORMAL_WAIT;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  820
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  821              if (dir =
=3D=3D DMA_MEM_TO_DEV) {
> ec31c5c5949275 Samuel Holland      2022-04-24  822                      s=
un6i_dma_set_addr(sdev, v_lli,
> ec31c5c5949275 Samuel Holland      2022-04-24  823                       =
                  buf_addr + period_len * i,
> ec31c5c5949275 Samuel Holland      2022-04-24  824                       =
                  sconfig->dst_addr);
> 802440bdf3b787 Jernej Skrabec      2019-05-27  825                      v=
_lli->cfg =3D lli_cfg;
> 67f34055118cb6 Jernej Skrabec      2019-05-27  826                      s=
dev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
> 802440bdf3b787 Jernej Skrabec      2019-05-27  827                      s=
dev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  828              } else {
> ec31c5c5949275 Samuel Holland      2022-04-24  829                      s=
un6i_dma_set_addr(sdev, v_lli,
> ec31c5c5949275 Samuel Holland      2022-04-24  830                       =
                  sconfig->src_addr,
> ec31c5c5949275 Samuel Holland      2022-04-24  831                       =
                  buf_addr + period_len * i);
> 802440bdf3b787 Jernej Skrabec      2019-05-27  832                      v=
_lli->cfg =3D lli_cfg;
> 67f34055118cb6 Jernej Skrabec      2019-05-27  833                      s=
dev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
> 802440bdf3b787 Jernej Skrabec      2019-05-27  834                      s=
dev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  835              }
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  836
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  837              prev =3D =
sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  838      }
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  839
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  840      prev->p_lli_next =
=3D txd->p_lli;          /* cyclic list */
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  841
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  842      vchan->cyclic =3D=
 true;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  843
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  844      return vchan_tx_p=
rep(&vchan->vc, &txd->vd, flags);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  845
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  846  err_lli_free:
> 9aa48806edb8c3 Samuel Holland      2022-04-24  847      for (p_lli =3D tx=
d->p_lli, v_lli =3D txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @848           p_lli =3D v_=
lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> 9aa48806edb8c3 Samuel Holland      2022-04-24  849              dma_pool_=
free(sdev->pool, v_lli, p_lli);
>
> Same.
>
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  850      kfree(txd);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  851      return NULL;
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  852  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
