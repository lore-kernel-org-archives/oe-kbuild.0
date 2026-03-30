Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884229BDBB
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881103; cv=none; b=K7Y+QFk4Ah68xi+rCE0zYQs0455VIlBPMB/YItBpGOGotVGo7bVdh9mlMsZGRsHSxZUQCSQKDCMyRiHgy7fgWX5uCB+CPS8RTfFov9PBudGuUYESIS19h4EvAV6WbQgp5ilpuH6iyHfPs/eQ8WPUM0S/la3Au+yxy5y4E8dUl8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881103; c=relaxed/simple;
	bh=MGx+xAP98ioEdseXcfyuJc1y3+p4LE6B5LsdiFhgMyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIjK0Ef8mE8eQE4Ntw6f4sOGb6g/Kpr8Wz038Ljs10o1TZhwtOtiOkeUKS/T/VwCOEahCExImoFBE8WF4JnIMZq+n2RacQb62fZ+lPpRzQ+laztp3tS5ITS6oTmuPdnqTlaWTMFpH50T21deKML89A5hIQs1ML7bixV+FSBLLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xw/NnDZw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xw/NnDZw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb14227cso60305535e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774881099; x=1775485899; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=92s8MxBnkgSfP8Asv1XyRy/Iv4Nm72CPxyXp3z1Hr7o=;
        b=Xw/NnDZw7rbivDDui4kR12FnvnUqC4DT5kU94JVMSyIiVnD/C6L2CVrn4+2PcuiHKF
         R23dUwqbM17vq9b3OUMv7++3lhBBXVxqeTrGIdhGpVE2rSGUD774QK3oOMr5zhmpZN0m
         RMuGCjxU4VG9+Y8bPLUxaM9yutPrueTVejKvDgJblZ3XSY3TzK27iJ7Lt2sFXTrIM+8D
         aqUQV/cSTF5Tp2iXQlHFap0b543ryM+gnodCLrvEQFkk/uz3tVQzstK4zvJlizos9jpR
         ypBSl5lsa35UxlLSujHLVQ1c40aGErDSE3qo9GeGjxfFv3UtZ7CPbmfFlvHNudidkuIw
         jvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881099; x=1775485899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92s8MxBnkgSfP8Asv1XyRy/Iv4Nm72CPxyXp3z1Hr7o=;
        b=D8NNYwa2G9S28WYH6xPFSDjRxFfh+KQ7aJ1/SruGhBM1q/z40Qzw/h/AOB6b14pCyd
         DrzeWeASVM91q72Y574TqCYdDOqpXbQMVhvocfoOr31YVivVDc00KY7j4ceSYTvJaMLQ
         hlpVF50OBo6WZBROw9UkAMds/qtIYOAoy91WIx0euOQD52P7MWg7lDU121EHsoRIgusE
         7awkgylMEk00+S4TowI4SdLKNi7sBOXV5YK2gxkOGYRi21ujEvQTP77xy/w12IDMU2V6
         +/ysSEWva2gLoWRHM8npEE57DXpqHeOrZsJlWBsD0JA9yaf1TtgUteZ2cr2DJs8L1DT4
         8FRw==
X-Gm-Message-State: AOJu0YwGmsEltBHcpKM7gffOccUGC2l/K4Qi/ATT4Rtk85AdDyGMvHRZ
	3YpDvNCRTrCf+/kTyewUulr5kp2c2IshVGUugoRT6/YPEFM1g/+NqPvH
X-Gm-Gg: ATEYQzwJyPlYjoOEEnP1ENlgEo7Nr0TW20VYIAVGWDWVRNG3kGYIuW/bamhBihiA8zR
	RhZat8lvgeA2u/1ANolPmJUIarz7dUTLSPci/qu13eeVy04LFLif/nfdbNmDPv9F6oWYF/RNjkj
	XQJlrxByqx0VYR3+1p3a2JpjPbQKvAdTmug1oyC6e51rqIZS/uhntLtl1wTT8V1xqiA39HjvZf6
	2HTsG2/SxxS4qWAYWj4/xgyibrhgeIekKV7I0bd4AdTzAk9PfpeVQmoBawTK3NgRta/UbizdfgM
	zpHETejK0tZzWbfZoGRM/1YRChDi2TaDNzMO/Hdj/CdVT1m+k/qtz0dukFSTyWLptFUswH8Z2Zc
	9lxq4SCwX/6y4my+Z0+gbLEsG6/Uj0VGZ1Y4WjELW8lMEQ6VnswT/6i95u1N/iyx2PdrFo56kya
	mOhG9ORAzh3GMF
X-Received: by 2002:a05:600c:6287:b0:486:fc3b:3e61 with SMTP id 5b1f17b1804b1-48727ef67edmr222766695e9.18.1774881099040;
        Mon, 30 Mar 2026 07:31:39 -0700 (PDT)
Received: from nsa ([45.94.208.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d40741sm297517505e9.13.2026.03.30.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:31:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:32:25 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/4] dmaengine: dma-axi-dmac: fix use-after-free on
 unbind
Message-ID: <acqJX2HwDABMAZr8@nsa>
References: <202603300705.jhDfInJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202603300705.jhDfInJk-lkp@intel.com>

On Mon, Mar 30, 2026 at 07:40:55AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b@analog.com>
> References: <20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b@analog.com>
> TO: "Nuno Sá via B4 Relay" <devnull+nuno.sa.analog.com@kernel.org>
> TO: dmaengine@vger.kernel.org
> TO: linux-kernel@vger.kernel.org
> CC: "Lars-Peter Clausen" <lars@metafoo.de>
> CC: Vinod Koul <vkoul@kernel.org>
> CC: Frank Li <Frank.Li@kernel.org>
> 
> Hi Nuno,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on b7560798466a07d9c3fb011698e92c335ab28baf]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dmaengine-Fix-possuible-use-after-free/20260329-160000
> base:   b7560798466a07d9c3fb011698e92c335ab28baf
> patch link:    https://lore.kernel.org/r/20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b%40analog.com
> patch subject: [PATCH v2 3/4] dmaengine: dma-axi-dmac: fix use-after-free on unbind
> :::::: branch date: 16 hours ago
> :::::: commit date: 16 hours ago
> config: loongarch-randconfig-r071-20260329 (https://download.01.org/0day-ci/archive/20260330/202603300705.jhDfInJk-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 15.2.0
> smatch: v0.5.0-9004-gb810ac53
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202603300705.jhDfInJk-lkp@intel.com/
> 
> smatch warnings:
> drivers/dma/dma-axi-dmac.c:1342 axi_dmac_probe() warn: address of NULL pointer 'dmac'

Am I missing something or is this a false positive?

- Nuno Sá

> 
> vim +/dmac +1342 drivers/dma/dma-axi-dmac.c
> 
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1231  
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1232  static int axi_dmac_probe(struct platform_device *pdev)
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1233  {
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1234  	struct dma_device *dma_dev;
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1235  	struct axi_dmac *__dmac;
> a5b982af953bcc8 Chuhong Yuan       2019-12-09  1236  	struct regmap *regmap;
> b377e670bac558a Alexandru Ardelean 2020-08-25  1237  	unsigned int version;
> 238f68a08e19a61 Paul Cercueil      2023-12-15  1238  	u32 irq_mask = 0;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1239  	int ret;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1240  
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1241  	struct axi_dmac *dmac __free(kfree) = kzalloc_obj(struct axi_dmac);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1242  	if (!dmac)
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1243  		return -ENOMEM;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1244  
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1245  	dmac->irq = platform_get_irq(pdev, 0);
> 50dc60a25597e10 Lars-Peter Clausen 2016-07-01  1246  	if (dmac->irq < 0)
> 50dc60a25597e10 Lars-Peter Clausen 2016-07-01  1247  		return dmac->irq;
> 50dc60a25597e10 Lars-Peter Clausen 2016-07-01  1248  	if (dmac->irq == 0)
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1249  		return -EINVAL;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1250  
> 4b23603a251d240 Tudor Ambarus      2022-11-10  1251  	dmac->base = devm_platform_ioremap_resource(pdev, 0);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1252  	if (IS_ERR(dmac->base))
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1253  		return PTR_ERR(dmac->base);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1254  
> 779a44831a4f646 Nuno Sa            2024-03-28  1255  	dmac->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1256  	if (IS_ERR(dmac->clk))
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1257  		return PTR_ERR(dmac->clk);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1258  
> 78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1259  	version = axi_dmac_read(dmac, ADI_AXI_REG_VERSION);
> 78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1260  
> 78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1261  	if (version >= ADI_AXI_PCORE_VER(4, 3, 'a'))
> 78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1262  		ret = axi_dmac_read_chan_config(&pdev->dev, dmac);
> 78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1263  	else
> 06b6e88c7ecf48e Alexandru Ardelean 2020-08-25  1264  		ret = axi_dmac_parse_dt(&pdev->dev, dmac);
> 78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1265  
> 06b6e88c7ecf48e Alexandru Ardelean 2020-08-25  1266  	if (ret < 0)
> 779a44831a4f646 Nuno Sa            2024-03-28  1267  		return ret;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1268  
> a88fdece44d40cd Alexandru Ardelean 2020-08-25  1269  	INIT_LIST_HEAD(&dmac->chan.active_descs);
> a88fdece44d40cd Alexandru Ardelean 2020-08-25  1270  
> 921234e0c5d77b5 Lars-Peter Clausen 2019-03-08  1271  	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1272  
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1273  	dma_dev = &dmac->dma_dev;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1274  	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1275  	dma_cap_set(DMA_CYCLIC, dma_dev->cap_mask);
> 9a05045d2a681d3 Dragos Bogdan      2019-03-26  1276  	dma_cap_set(DMA_INTERLEAVE, dma_dev->cap_mask);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1277  	dma_dev->device_free_chan_resources = axi_dmac_free_chan_resources;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1278  	dma_dev->device_tx_status = dma_cookie_status;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1279  	dma_dev->device_issue_pending = axi_dmac_issue_pending;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1280  	dma_dev->device_prep_slave_sg = axi_dmac_prep_slave_sg;
> 74609e5686701ed Paul Cercueil      2024-06-20  1281  	dma_dev->device_prep_peripheral_dma_vec = axi_dmac_prep_peripheral_dma_vec;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1282  	dma_dev->device_prep_dma_cyclic = axi_dmac_prep_dma_cyclic;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1283  	dma_dev->device_prep_interleaved_dma = axi_dmac_prep_interleaved;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1284  	dma_dev->device_terminate_all = axi_dmac_terminate_all;
> 860dd64c4382709 Lars-Peter Clausen 2015-10-20  1285  	dma_dev->device_synchronize = axi_dmac_synchronize;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1286  	dma_dev->dev = &pdev->dev;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1287  	dma_dev->src_addr_widths = BIT(dmac->chan.src_width);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1288  	dma_dev->dst_addr_widths = BIT(dmac->chan.dest_width);
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1289  	dma_dev->device_release = axi_dmac_release;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1290  	dma_dev->directions = BIT(dmac->chan.direction);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1291  	dma_dev->residue_granularity = DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
> e97dc7435972d28 Paul Cercueil      2023-12-15  1292  	dma_dev->max_sg_burst = 31; /* 31 SGs maximum in one burst */
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1293  	INIT_LIST_HEAD(&dma_dev->channels);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1294  
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1295  	dmac->chan.vchan.desc_free = axi_dmac_desc_free;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1296  	vchan_init(&dmac->chan.vchan, dma_dev);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1297  
> b377e670bac558a Alexandru Ardelean 2020-08-25  1298  	ret = axi_dmac_detect_caps(dmac, version);
> b5d89905d0391de Lars-Peter Clausen 2019-05-16  1299  	if (ret)
> 779a44831a4f646 Nuno Sa            2024-03-28  1300  		return ret;
> 56009f0d2f54e4c Lars-Peter Clausen 2019-03-26  1301  
> 5b969bd1d9cdfc8 Alexandru Ardelean 2019-05-27  1302  	dma_dev->copy_align = (dmac->chan.address_align_mask + 1);
> 56009f0d2f54e4c Lars-Peter Clausen 2019-03-26  1303  
> 238f68a08e19a61 Paul Cercueil      2023-12-15  1304  	if (dmac->chan.hw_sg)
> 238f68a08e19a61 Paul Cercueil      2023-12-15  1305  		irq_mask |= AXI_DMAC_IRQ_SOT;
> 238f68a08e19a61 Paul Cercueil      2023-12-15  1306  
> 238f68a08e19a61 Paul Cercueil      2023-12-15  1307  	axi_dmac_write(dmac, AXI_DMAC_REG_IRQ_MASK, irq_mask);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1308  
> 9327c7e7539371c Mathias Tausen     2022-07-26  1309  	if (of_dma_is_coherent(pdev->dev.of_node)) {
> 9327c7e7539371c Mathias Tausen     2022-07-26  1310  		ret = axi_dmac_read(dmac, AXI_DMAC_REG_COHERENCY_DESC);
> 9327c7e7539371c Mathias Tausen     2022-07-26  1311  
> 9327c7e7539371c Mathias Tausen     2022-07-26  1312  		if (version < ADI_AXI_PCORE_VER(4, 4, 'a') ||
> 9327c7e7539371c Mathias Tausen     2022-07-26  1313  		    !AXI_DMAC_DST_COHERENT_GET(ret)) {
> 9327c7e7539371c Mathias Tausen     2022-07-26  1314  			dev_err(dmac->dma_dev.dev,
> 9327c7e7539371c Mathias Tausen     2022-07-26  1315  				"Coherent DMA not supported in hardware");
> 779a44831a4f646 Nuno Sa            2024-03-28  1316  			return -EINVAL;
> 9327c7e7539371c Mathias Tausen     2022-07-26  1317  		}
> 9327c7e7539371c Mathias Tausen     2022-07-26  1318  	}
> 9327c7e7539371c Mathias Tausen     2022-07-26  1319  
> 779a44831a4f646 Nuno Sa            2024-03-28  1320  	ret = dmaenginem_async_device_register(dma_dev);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1321  	if (ret)
> 779a44831a4f646 Nuno Sa            2024-03-28  1322  		return ret;
> 779a44831a4f646 Nuno Sa            2024-03-28  1323  
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1324  	/*
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1325  	 * From this point on, our dmac object has it's lifetime bounded with
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1326  	 * dma_dev. Will be freed when dma_dev refcount goes to 0. That means,
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1327  	 * no more automatic kfree(). Also note that dmac is now NULL so we
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1328  	 * need __dmac.
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1329  	 */
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1330  	__dmac = no_free_ptr(dmac);
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1331  	get_device(&pdev->dev);
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1332  
> 779a44831a4f646 Nuno Sa            2024-03-28  1333  	/*
> 779a44831a4f646 Nuno Sa            2024-03-28  1334  	 * Put the action in here so it get's done before unregistering the DMA
> 779a44831a4f646 Nuno Sa            2024-03-28  1335  	 * device.
> 779a44831a4f646 Nuno Sa            2024-03-28  1336  	 */
> 779a44831a4f646 Nuno Sa            2024-03-28  1337  	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_tasklet_kill,
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1338  				       &__dmac->chan.vchan.task);
> 779a44831a4f646 Nuno Sa            2024-03-28  1339  	if (ret)
> 779a44831a4f646 Nuno Sa            2024-03-28  1340  		return ret;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1341  
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20 @1342  	ret = of_dma_controller_register(pdev->dev.of_node,
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1343  		of_dma_xlate_by_chan_id, dma_dev);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1344  	if (ret)
> 779a44831a4f646 Nuno Sa            2024-03-28  1345  		return ret;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1346  
> 779a44831a4f646 Nuno Sa            2024-03-28  1347  	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_free_dma_controller,
> 779a44831a4f646 Nuno Sa            2024-03-28  1348  				       pdev->dev.of_node);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1349  	if (ret)
> 779a44831a4f646 Nuno Sa            2024-03-28  1350  		return ret;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1351  
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1352  	/* So that we can mark the device as unbound and disable it */
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1353  	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_disable, __dmac);
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1354  	if (ret)
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1355  		return ret;
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1356  
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1357  	ret = devm_request_irq(&pdev->dev, __dmac->irq, axi_dmac_interrupt_handler,
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1358  			       IRQF_SHARED, dev_name(&pdev->dev), __dmac);
> 779a44831a4f646 Nuno Sa            2024-03-28  1359  	if (ret)
> 779a44831a4f646 Nuno Sa            2024-03-28  1360  		return ret;
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1361  
> e6cff0d5c22ce16 Nuno Sá            2026-03-27  1362  	regmap = devm_regmap_init_mmio(&pdev->dev, __dmac->base,
> a5b982af953bcc8 Chuhong Yuan       2019-12-09  1363  				       &axi_dmac_regmap_config);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1364  
> 779a44831a4f646 Nuno Sa            2024-03-28  1365  	return PTR_ERR_OR_ZERO(regmap);
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1366  }
> 0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1367  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
