Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF610E8;
	Tue, 22 Nov 2022 07:10:23 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id ft34so33580048ejc.12;
        Mon, 21 Nov 2022 23:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACtYEnj+ZxSHoXW9eVnJn/GgOlvVWeqHjTJrz+/eEmc=;
        b=N+Z7YboQpZljw/hHzPvWAqAGB/Opfsb7RiJ48hirAJwugQ0oP2ZpkW/V9Z7j1adR2d
         7kL+U8P07WjBsTPDUVAxPuO6lsbFC0FICOiu6zQBuTA9rrsg36Rz0XgcGR5SqBg4Kzmr
         kmQcYmW8ivfvU7ZrLCjSTYRD9c4yL3Qrfw2X+SLgRM/8oQ531NPqK+WWxFTLS51rHQN1
         sVBkeUGn2txFSnOs0tlNWxY1cUxWIBydTOpKPVK/ui23fjARnCAyx0f3MwZEEco1ehLW
         O5fEwWfcF5zssI4bbbr8/ZvU0LB4RoWjJ3CAzYjywFw7MKxUd9Hl6JUDtsqHbtlnF4pz
         Vw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACtYEnj+ZxSHoXW9eVnJn/GgOlvVWeqHjTJrz+/eEmc=;
        b=xBNJdzvX61jD9Tbfgqj9xtxeaO9gWCSsBV8S8aQR+DbMvjOpPE/CC/BKSYO0jEcFQq
         meSoMRiZRAqcLq/Zx/ANawtKV/afX7Da98hgPJkOiRkquvS4FoG62WwXuvqcDVN7oWTX
         MdD/oUzMkf/p60kVaoi2V+v484ggcjOuo+8rM3aMtTVbF5aHioDoexCxYLSy6bcR6wdu
         YIMOXlGd+8tqisw2k8QS2zU4NwPBTjMmhIVamy7RRONMLYfAQP4H9sUcgMQJFW9Me2U0
         WsnY4og6p0G0SEkqIYsPAntRJb1tvcxJMC9gQcRsrAs1OWM279uRtKCOPfoTrREYVJ7A
         gRQg==
X-Gm-Message-State: ANoB5pljhlF9eaJzTZ8LeKXfte4QxKQLfjZ/Xv4rL3Zr24oQtUw/OJsm
	hLoK2tbno9BmhMp1qepVxw8sn2sTWWs=
X-Google-Smtp-Source: AA0mqf7UQa4URz4H9d4lg4FffLi7ntDtRhZdC7v4x7zaBeNSnxIzUYZhtL2IfdaXA8FDgM2pa6jnxQ==
X-Received: by 2002:a17:906:84a:b0:7ae:1e53:3f97 with SMTP id f10-20020a170906084a00b007ae1e533f97mr18847827ejd.169.1669101021080;
        Mon, 21 Nov 2022 23:10:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gt22-20020a170906f21600b0073c10031dc9sm5724477ejb.80.2022.11.21.23.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 23:10:20 -0800 (PST)
Date: Tue, 22 Nov 2022 10:10:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [linux-next:master 8444/9537]
 drivers/mmc/host/renesas_sdhi_internal_dmac.c:327
 renesas_sdhi_internal_dmac_dma_irq() warn: set_bit() takes a bit number
Message-ID: <202211220405.lg7LeBgb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221122071015.uV0cykEEma85PsjmmSO7EHxYflyAp0gN9opPhnjVulw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9
commit: 8d901e2ba5667ea48b99b27a8d9c7faec37e6bb6 [8444/9537] mmc: renesas_sdhi: take DMA end interrupts into account
config: microblaze-randconfig-m041-20221121
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/mmc/host/renesas_sdhi_internal_dmac.c:327 renesas_sdhi_internal_dmac_dma_irq() warn: set_bit() takes a bit number
drivers/mmc/host/renesas_sdhi_internal_dmac.c:341 renesas_sdhi_internal_dmac_dataend_dma() warn: set_bit() takes a bit number
drivers/mmc/host/renesas_sdhi_internal_dmac.c:444 renesas_sdhi_internal_dmac_issue_tasklet_fn() warn: set_bit() takes a bit number

vim +327 drivers/mmc/host/renesas_sdhi_internal_dmac.c

8d901e2ba5667ea Wolfram Sang       2022-10-06  315  static bool renesas_sdhi_internal_dmac_dma_irq(struct tmio_mmc_host *host)
8d901e2ba5667ea Wolfram Sang       2022-10-06  316  {
8d901e2ba5667ea Wolfram Sang       2022-10-06  317  	struct renesas_sdhi *priv = host_to_priv(host);
8d901e2ba5667ea Wolfram Sang       2022-10-06  318  	struct renesas_sdhi_dma *dma_priv = &priv->dma_priv;
8d901e2ba5667ea Wolfram Sang       2022-10-06  319  
8d901e2ba5667ea Wolfram Sang       2022-10-06  320  	u32 dma_irqs = INFO1_DTRANEND0 |
8d901e2ba5667ea Wolfram Sang       2022-10-06  321  			(priv->quirks && priv->quirks->old_info1_layout ?
8d901e2ba5667ea Wolfram Sang       2022-10-06  322  			INFO1_DTRANEND1_OLD : INFO1_DTRANEND1);
8d901e2ba5667ea Wolfram Sang       2022-10-06  323  	u32 status = readl(host->ctl + DM_CM_INFO1);
8d901e2ba5667ea Wolfram Sang       2022-10-06  324  
8d901e2ba5667ea Wolfram Sang       2022-10-06  325  	if (status & dma_irqs) {
8d901e2ba5667ea Wolfram Sang       2022-10-06  326  		writel(status ^ dma_irqs, host->ctl + DM_CM_INFO1);
8d901e2ba5667ea Wolfram Sang       2022-10-06 @327  		set_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags);

This is like doing dma_priv->end_flags = BIT(BIT(x));  Double BIT().

8d901e2ba5667ea Wolfram Sang       2022-10-06  328  		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags))
8d901e2ba5667ea Wolfram Sang       2022-10-06  329  			tasklet_schedule(&dma_priv->dma_complete);
8d901e2ba5667ea Wolfram Sang       2022-10-06  330  	}
8d901e2ba5667ea Wolfram Sang       2022-10-06  331  
8d901e2ba5667ea Wolfram Sang       2022-10-06  332  	return status & dma_irqs;
8d901e2ba5667ea Wolfram Sang       2022-10-06  333  }
8d901e2ba5667ea Wolfram Sang       2022-10-06  334  
2a68ea7896e3277 Simon Horman       2017-06-21  335  static void
ed9ab884987bf80 Wolfram Sang       2022-03-20  336  renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host)
ed9ab884987bf80 Wolfram Sang       2022-03-20  337  {
90d951064576540 Masahiro Yamada    2017-11-25  338  	struct renesas_sdhi *priv = host_to_priv(host);
8d901e2ba5667ea Wolfram Sang       2022-10-06  339  	struct renesas_sdhi_dma *dma_priv = &priv->dma_priv;
90d951064576540 Masahiro Yamada    2017-11-25  340  
8d901e2ba5667ea Wolfram Sang       2022-10-06 @341  	set_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags);
8d901e2ba5667ea Wolfram Sang       2022-10-06  342  	if (test_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags) ||
8d901e2ba5667ea Wolfram Sang       2022-10-06  343  	    host->data->error)
8d901e2ba5667ea Wolfram Sang       2022-10-06  344  		tasklet_schedule(&dma_priv->dma_complete);
2a68ea7896e3277 Simon Horman       2017-06-21  345  }
2a68ea7896e3277 Simon Horman       2017-06-21  346  
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  347  /*
088604048b24846 Lad Prabhakar      2022-06-24  348   * renesas_sdhi_internal_dmac_map() will be called with two different
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  349   * sg pointers in two mmc_data by .pre_req(), but tmio host can have a single
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  350   * sg_ptr only. So, renesas_sdhi_internal_dmac_{un}map() should use a sg
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  351   * pointer in a mmc_data instead of host->sg_ptr.
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  352   */
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  353  static void
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  354  renesas_sdhi_internal_dmac_unmap(struct tmio_mmc_host *host,
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  355  				 struct mmc_data *data,
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  356  				 enum renesas_sdhi_dma_cookie cookie)
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  357  {
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  358  	bool unmap = cookie == COOKIE_UNMAPPED ? (data->host_cookie != cookie) :
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  359  						 (data->host_cookie == cookie);
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  360  
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  361  	if (unmap) {
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  362  		dma_unmap_sg(&host->pdev->dev, data->sg, data->sg_len,
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  363  			     mmc_get_dma_dir(data));
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  364  		data->host_cookie = COOKIE_UNMAPPED;
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  365  	}
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  366  }
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  367  
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  368  static bool
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  369  renesas_sdhi_internal_dmac_map(struct tmio_mmc_host *host,
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  370  			       struct mmc_data *data,
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  371  			       enum renesas_sdhi_dma_cookie cookie)
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  372  {
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  373  	if (data->host_cookie == COOKIE_PRE_MAPPED)
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  374  		return true;
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  375  
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  376  	if (!dma_map_sg(&host->pdev->dev, data->sg, data->sg_len,
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  377  			    mmc_get_dma_dir(data)))
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  378  		return false;
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  379  
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  380  	data->host_cookie = cookie;
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  381  
088604048b24846 Lad Prabhakar      2022-06-24  382  	/* This DMAC needs buffers to be 128-byte aligned */
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  383  	if (!IS_ALIGNED(sg_dma_address(data->sg), 128)) {
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  384  		renesas_sdhi_internal_dmac_unmap(host, data, cookie);
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  385  		return false;
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  386  	}
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  387  
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  388  	return true;
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  389  }
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  390  
2a68ea7896e3277 Simon Horman       2017-06-21  391  static void
2a68ea7896e3277 Simon Horman       2017-06-21  392  renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
2a68ea7896e3277 Simon Horman       2017-06-21  393  				     struct mmc_data *data)
2a68ea7896e3277 Simon Horman       2017-06-21  394  {
c0a43968be5609c Wolfram Sang       2022-03-20  395  	struct renesas_sdhi *priv = host_to_priv(host);
2a68ea7896e3277 Simon Horman       2017-06-21  396  	struct scatterlist *sg = host->sg_ptr;
9706b4722e120f2 Chris Brandt       2018-10-24  397  	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
9706b4722e120f2 Chris Brandt       2018-10-24  398  
139bbdba494b0ba Geert Uytterhoeven 2022-04-01  399  	if (!(priv->quirks && priv->quirks->fixed_addr_mode))
9706b4722e120f2 Chris Brandt       2018-10-24  400  		dtran_mode |= DTRAN_MODE_ADDR_MODE;
2a68ea7896e3277 Simon Horman       2017-06-21  401  
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  402  	if (!renesas_sdhi_internal_dmac_map(host, data, COOKIE_MAPPED))
ae275b9d606f922 Masaharu Hayakawa  2018-04-18  403  		goto force_pio;
ae275b9d606f922 Masaharu Hayakawa  2018-04-18  404  
2a68ea7896e3277 Simon Horman       2017-06-21  405  	if (data->flags & MMC_DATA_READ) {
2a68ea7896e3277 Simon Horman       2017-06-21  406  		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
139bbdba494b0ba Geert Uytterhoeven 2022-04-01  407  		if (priv->quirks && priv->quirks->dma_one_rx_only &&
0cbc94daa55441c Wolfram Sang       2018-04-18  408  		    test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
fe6e04941aa1247 Yoshihiro Shimoda  2018-06-29  409  			goto force_pio_with_unmap;
2a68ea7896e3277 Simon Horman       2017-06-21  410  	} else {
2a68ea7896e3277 Simon Horman       2017-06-21  411  		dtran_mode |= DTRAN_MODE_CH_NUM_CH0;
2a68ea7896e3277 Simon Horman       2017-06-21  412  	}
2a68ea7896e3277 Simon Horman       2017-06-21  413  
8d901e2ba5667ea Wolfram Sang       2022-10-06  414  	priv->dma_priv.end_flags = 0;
2a68ea7896e3277 Simon Horman       2017-06-21  415  	renesas_sdhi_internal_dmac_enable_dma(host, true);
2a68ea7896e3277 Simon Horman       2017-06-21  416  
2a68ea7896e3277 Simon Horman       2017-06-21  417  	/* set dma parameters */
f33261c369ba5b7 Wolfram Sang       2022-10-06  418  	writel(dtran_mode, host->ctl + DM_CM_DTRAN_MODE);
f33261c369ba5b7 Wolfram Sang       2022-10-06  419  	writel(sg_dma_address(sg), host->ctl + DM_DTRAN_ADDR);
48e1dc10a944087 Yoshihiro Shimoda  2017-10-20  420  
d3dd5db0c1b904e Masahiro Yamada    2018-10-13  421  	host->dma_on = true;
d3dd5db0c1b904e Masahiro Yamada    2018-10-13  422  
48e1dc10a944087 Yoshihiro Shimoda  2017-10-20  423  	return;
48e1dc10a944087 Yoshihiro Shimoda  2017-10-20  424  
fe6e04941aa1247 Yoshihiro Shimoda  2018-06-29  425  force_pio_with_unmap:
69e7d76afdb5424 Yoshihiro Shimoda  2020-12-16  426  	renesas_sdhi_internal_dmac_unmap(host, data, COOKIE_UNMAPPED);
fe6e04941aa1247 Yoshihiro Shimoda  2018-06-29  427  
48e1dc10a944087 Yoshihiro Shimoda  2017-10-20  428  force_pio:
48e1dc10a944087 Yoshihiro Shimoda  2017-10-20  429  	renesas_sdhi_internal_dmac_enable_dma(host, false);
2a68ea7896e3277 Simon Horman       2017-06-21  430  }
2a68ea7896e3277 Simon Horman       2017-06-21  431  
2a68ea7896e3277 Simon Horman       2017-06-21  432  static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
2a68ea7896e3277 Simon Horman       2017-06-21  433  {
2a68ea7896e3277 Simon Horman       2017-06-21  434  	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
8d901e2ba5667ea Wolfram Sang       2022-10-06  435  	struct renesas_sdhi *priv = host_to_priv(host);
2a68ea7896e3277 Simon Horman       2017-06-21  436  
2a68ea7896e3277 Simon Horman       2017-06-21  437  	tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
2a68ea7896e3277 Simon Horman       2017-06-21  438  
8d901e2ba5667ea Wolfram Sang       2022-10-06  439  	if (!host->cmd->error) {
2a68ea7896e3277 Simon Horman       2017-06-21  440  		/* start the DMAC */
f33261c369ba5b7 Wolfram Sang       2022-10-06  441  		writel(DTRAN_CTRL_DM_START, host->ctl + DM_CM_DTRAN_CTRL);
8d901e2ba5667ea Wolfram Sang       2022-10-06  442  	} else {
8d901e2ba5667ea Wolfram Sang       2022-10-06  443  		/* on CMD errors, simulate DMA end immediately */
8d901e2ba5667ea Wolfram Sang       2022-10-06 @444  		set_bit(SDHI_DMA_END_FLAG_DMA, &priv->dma_priv.end_flags);
8d901e2ba5667ea Wolfram Sang       2022-10-06  445  		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &priv->dma_priv.end_flags))
8d901e2ba5667ea Wolfram Sang       2022-10-06  446  			tasklet_schedule(&priv->dma_priv.dma_complete);
8d901e2ba5667ea Wolfram Sang       2022-10-06  447  	}
2a68ea7896e3277 Simon Horman       2017-06-21  448  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

