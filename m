Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5A13C8E2
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711464807; cv=none; b=aKG04v9c4fE9SJTDKs1Ul5u15qKZYDqSmyqs01ZfHKkViEqLYlzWCC2NAtr3K7hcVQgFrkLn/KoWQd3nPTPR4Lq0jBmwEsyCvLB7EdC5er7vZF6IVOQTF7nPDJVGZvzmgRiyXSfuZWGREXqeY+1jb11t/XJ/GpeJ1y+brzOdyus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711464807; c=relaxed/simple;
	bh=43BbRxkxajQDN/25+D1eJoFI4tMU8l9Z2eWX6U54+Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfiUER4Ymjq7ok35RrHSMfjcQkXWypRXbTzEBLB+RnVynYhJRWPtv8NUTDN21kXWevN6lI0W3X1Tw+6i6utXVeh9YCwf43RGTSpN9lXZTT22FvTiO0X12uXsG4F+lmDz2BlkEmR9x44j0Xga2BxTtn+yPb3OO6YdkJa2JvWm1Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDvYBr7l; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDvYBr7l"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so973615066b.1
        for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711464804; x=1712069604; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPGdyAju/pQdjO1C00iwLpHOLGF1n3TGSgPu6ClcazY=;
        b=JDvYBr7lWiUfBtXVPdlcuuOpYGC0zATivKKvG+DMy9rviJqQUf8+1Mn79h4iDFlNuL
         VgOGUpDavbhDVPLotHZ144xO8ZjFtdakhdKR+S4UtdbCD7lOm6PFU4u8ZJGHCrC2MpGi
         AvLUEj5/DJotzcKD0QRGM2zm/uCpHmdf2V4u/iAB6mhh6n+gXSCXeHtVglQGVBN4t0jI
         zuBGm8Le1Ypqjc3PzwzFXz2jFhXBRbJpIMRyC3IPQfZu8ZIm3Q3TTnTMhAE6leAZ38Y+
         i21t64MA5l4iYagWPlxaJBcaZB9FCEdvJyxi1H8QKIxyhOXxN7k8VdASZe4aBzoPQ5qr
         2tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711464804; x=1712069604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPGdyAju/pQdjO1C00iwLpHOLGF1n3TGSgPu6ClcazY=;
        b=TyLMgu7EK+2MehSXEmjpkIyG0BQ3pdGDSDNGJ4+ds+ELBoYnBVCagmM2x5GAJ/AD8k
         hoQ+ZSofd9Ng6q7/XTxOkX4Lcui4ADnY5hCCInxZl9dkF7xkF9CwlAEpEEV5W0ZTy42+
         HvLOp4gXXIP0xRbXN1MBUmlai9uv+N944tWdxnNBy86VUXHGOmRlN3hT+pWKI9g4kHvP
         ix3/A49/yUHbDoheruFE0/2YHWF78TunfkZnMNi8NdneVDuYUwBG/mgm9yS1KJFp+6Vx
         efxP6JXUPdgmuIWl+5HTiwH3yAM1fjeV6+z/mVlbwPCxWG3I0HyrS+XyTIAuMJECs26i
         vhBw==
X-Gm-Message-State: AOJu0YzqYfzeRasdfvRFLCWflirbdVxLm4rOUru1moSP/IPKhe9RDRTw
	13whnvNlLMAA20j5CU3KEbIA0PXlY8UmYbHdW4JsbC0Vrzgap3MxQQWuX1LwSd6LHEtRybJkYHV
	B
X-Google-Smtp-Source: AGHT+IHTD1D+zrX3b85U+wo3uXIrU9foC3X9NWjLDyFo1DR8LHCn3xnJ85vyd7FW6Dd/EeEg7S088Q==
X-Received: by 2002:a17:906:5fc3:b0:a46:ea46:2089 with SMTP id k3-20020a1709065fc300b00a46ea462089mr1329699ejv.37.1711464803428;
        Tue, 26 Mar 2024 07:53:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l19-20020a17090612d300b00a46cffe6d06sm4301638ejb.42.2024.03.26.07.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 07:53:23 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:53:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Suren Baghdasaryan <surenb@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 1083/1266] drivers/dma/sun6i-dma.c:777
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli'
Message-ID: <1fae20f7-5c32-45af-858d-4b8f79e8149a@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ I guess Suren Baghdasaryan's patches exposed a much older use after
  free in this driver.  -dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   084c8e315db34b59d38d06e684b1a0dd07d30287
commit: c64e38ed88d13557ebeb4cb8def02390a8f3dfc4 [1083/1266] mm/slab: enable slab allocation tagging for kmalloc and friends
config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261808.c8ovEmC1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403261808.c8ovEmC1-lkp@intel.com/

smatch warnings:
drivers/dma/sun6i-dma.c:777 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli'
drivers/dma/sun6i-dma.c:848 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli'

vim +/v_lli +777 drivers/dma/sun6i-dma.c

555859308723d8 Maxime Ripard       2014-07-17  700  static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
555859308723d8 Maxime Ripard       2014-07-17  701  		struct dma_chan *chan, struct scatterlist *sgl,
555859308723d8 Maxime Ripard       2014-07-17  702  		unsigned int sg_len, enum dma_transfer_direction dir,
555859308723d8 Maxime Ripard       2014-07-17  703  		unsigned long flags, void *context)
555859308723d8 Maxime Ripard       2014-07-17  704  {
555859308723d8 Maxime Ripard       2014-07-17  705  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
555859308723d8 Maxime Ripard       2014-07-17  706  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
555859308723d8 Maxime Ripard       2014-07-17  707  	struct dma_slave_config *sconfig = &vchan->cfg;
555859308723d8 Maxime Ripard       2014-07-17  708  	struct sun6i_dma_lli *v_lli, *prev = NULL;
555859308723d8 Maxime Ripard       2014-07-17  709  	struct sun6i_desc *txd;
555859308723d8 Maxime Ripard       2014-07-17  710  	struct scatterlist *sg;
555859308723d8 Maxime Ripard       2014-07-17  711  	dma_addr_t p_lli;
52c871798ff84b Jean-Francois Moine 2016-04-22  712  	u32 lli_cfg;
555859308723d8 Maxime Ripard       2014-07-17  713  	int i, ret;
555859308723d8 Maxime Ripard       2014-07-17  714  
555859308723d8 Maxime Ripard       2014-07-17  715  	if (!sgl)
555859308723d8 Maxime Ripard       2014-07-17  716  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  717  
52c871798ff84b Jean-Francois Moine 2016-04-22  718  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
52c871798ff84b Jean-Francois Moine 2016-04-22  719  	if (ret) {
52c871798ff84b Jean-Francois Moine 2016-04-22  720  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
52c871798ff84b Jean-Francois Moine 2016-04-22  721  		return NULL;
52c871798ff84b Jean-Francois Moine 2016-04-22  722  	}
52c871798ff84b Jean-Francois Moine 2016-04-22  723  
555859308723d8 Maxime Ripard       2014-07-17  724  	txd = kzalloc(sizeof(*txd), GFP_NOWAIT);
555859308723d8 Maxime Ripard       2014-07-17  725  	if (!txd)
555859308723d8 Maxime Ripard       2014-07-17  726  		return NULL;
555859308723d8 Maxime Ripard       2014-07-17  727  
555859308723d8 Maxime Ripard       2014-07-17  728  	for_each_sg(sgl, sg, sg_len, i) {
ec31c5c5949275 Samuel Holland      2022-04-24  729  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
4fbd804e009ae9 Maxime Ripard       2014-07-30  730  		if (!v_lli)
4fbd804e009ae9 Maxime Ripard       2014-07-30  731  			goto err_lli_free;
555859308723d8 Maxime Ripard       2014-07-17  732  
52c871798ff84b Jean-Francois Moine 2016-04-22  733  		v_lli->len = sg_dma_len(sg);
52c871798ff84b Jean-Francois Moine 2016-04-22  734  		v_lli->para = NORMAL_WAIT;
555859308723d8 Maxime Ripard       2014-07-17  735  
52c871798ff84b Jean-Francois Moine 2016-04-22  736  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  737  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  738  					   sg_dma_address(sg),
ec31c5c5949275 Samuel Holland      2022-04-24  739  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  740  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  741  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  742  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
555859308723d8 Maxime Ripard       2014-07-17  743  
555859308723d8 Maxime Ripard       2014-07-17  744  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  745  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  746  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  747  				&sconfig->dst_addr, &sg_dma_address(sg),
555859308723d8 Maxime Ripard       2014-07-17  748  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  749  
555859308723d8 Maxime Ripard       2014-07-17  750  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  751  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  752  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  753  					   sg_dma_address(sg));
802440bdf3b787 Jernej Skrabec      2019-05-27  754  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  755  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  756  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
555859308723d8 Maxime Ripard       2014-07-17  757  
555859308723d8 Maxime Ripard       2014-07-17  758  			dev_dbg(chan2dev(chan),
7f5e03e7367293 Vinod Koul          2014-07-28  759  				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
555859308723d8 Maxime Ripard       2014-07-17  760  				__func__, vchan->vc.chan.chan_id,
555859308723d8 Maxime Ripard       2014-07-17  761  				&sg_dma_address(sg), &sconfig->src_addr,
555859308723d8 Maxime Ripard       2014-07-17  762  				sg_dma_len(sg), flags);
555859308723d8 Maxime Ripard       2014-07-17  763  		}
555859308723d8 Maxime Ripard       2014-07-17  764  
555859308723d8 Maxime Ripard       2014-07-17  765  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
555859308723d8 Maxime Ripard       2014-07-17  766  	}
555859308723d8 Maxime Ripard       2014-07-17  767  
555859308723d8 Maxime Ripard       2014-07-17  768  	dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
9aa48806edb8c3 Samuel Holland      2022-04-24  769  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24  770  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  771  		sun6i_dma_dump_lli(vchan, v_lli, p_lli);
555859308723d8 Maxime Ripard       2014-07-17  772  
555859308723d8 Maxime Ripard       2014-07-17  773  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
555859308723d8 Maxime Ripard       2014-07-17  774  
4fbd804e009ae9 Maxime Ripard       2014-07-30  775  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  776  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @777  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
                                                                     ^^^^^^^                    ^^^^^^^
9aa48806edb8c3 Samuel Holland      2022-04-24  778  		dma_pool_free(sdev->pool, v_lli, p_lli);
                                                                                          ^^^^^
It's illegal to dereference "v_lli" after passing it to
dma_pool_free().

4fbd804e009ae9 Maxime Ripard       2014-07-30  779  	kfree(txd);
555859308723d8 Maxime Ripard       2014-07-17  780  	return NULL;
555859308723d8 Maxime Ripard       2014-07-17  781  }
555859308723d8 Maxime Ripard       2014-07-17  782  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  783  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
a90e173f3faf29 Jean-Francois Moine 2016-04-28  784  					struct dma_chan *chan,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  785  					dma_addr_t buf_addr,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  786  					size_t buf_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  787  					size_t period_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  788  					enum dma_transfer_direction dir,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  789  					unsigned long flags)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  790  {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  791  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  792  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  793  	struct dma_slave_config *sconfig = &vchan->cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  794  	struct sun6i_dma_lli *v_lli, *prev = NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  795  	struct sun6i_desc *txd;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  796  	dma_addr_t p_lli;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  797  	u32 lli_cfg;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  	unsigned int i, periods = buf_len / period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  799  	int ret;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  800  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  801  	ret = set_config(sdev, sconfig, dir, &lli_cfg);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  802  	if (ret) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  803  		dev_err(chan2dev(chan), "Invalid DMA configuration\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  804  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  806  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  807  	txd = kzalloc(sizeof(*txd), GFP_NOWAIT);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  808  	if (!txd)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  809  		return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  810  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  811  	for (i = 0; i < periods; i++) {
ec31c5c5949275 Samuel Holland      2022-04-24  812  		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  813  		if (!v_lli) {
a90e173f3faf29 Jean-Francois Moine 2016-04-28  814  			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
a90e173f3faf29 Jean-Francois Moine 2016-04-28  815  			goto err_lli_free;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  816  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  817  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  818  		v_lli->len = period_len;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  819  		v_lli->para = NORMAL_WAIT;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  820  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  821  		if (dir == DMA_MEM_TO_DEV) {
ec31c5c5949275 Samuel Holland      2022-04-24  822  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  823  					   buf_addr + period_len * i,
ec31c5c5949275 Samuel Holland      2022-04-24  824  					   sconfig->dst_addr);
802440bdf3b787 Jernej Skrabec      2019-05-27  825  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  826  			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
802440bdf3b787 Jernej Skrabec      2019-05-27  827  			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  828  		} else {
ec31c5c5949275 Samuel Holland      2022-04-24  829  			sun6i_dma_set_addr(sdev, v_lli,
ec31c5c5949275 Samuel Holland      2022-04-24  830  					   sconfig->src_addr,
ec31c5c5949275 Samuel Holland      2022-04-24  831  					   buf_addr + period_len * i);
802440bdf3b787 Jernej Skrabec      2019-05-27  832  			v_lli->cfg = lli_cfg;
67f34055118cb6 Jernej Skrabec      2019-05-27  833  			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
802440bdf3b787 Jernej Skrabec      2019-05-27  834  			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  835  		}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  836  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  837  		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  838  	}
a90e173f3faf29 Jean-Francois Moine 2016-04-28  839  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  840  	prev->p_lli_next = txd->p_lli;		/* cyclic list */
a90e173f3faf29 Jean-Francois Moine 2016-04-28  841  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  842  	vchan->cyclic = true;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  843  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  844  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  845  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  846  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  847  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @848  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  849  		dma_pool_free(sdev->pool, v_lli, p_lli);

Same.

a90e173f3faf29 Jean-Francois Moine 2016-04-28  850  	kfree(txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  851  	return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  852  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

