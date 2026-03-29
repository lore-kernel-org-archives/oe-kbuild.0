Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D926FA60
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 23:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774827665; cv=none; b=uiejS39csq9Mp/SMNRofkR5FpuZrupoNU+R8wbgT/HBSwiN5SNA7b3vXAlqM4xQ1ouecE4n4vCKNtpkDqjjgCdNADJDIMIwK2FrIrjqqSjo3xJ/sUBZF6U5L30iAQ+03/e1Z7UjidazfoUikVy2cL38Kf9OCa6D4iGsEfXmM/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774827665; c=relaxed/simple;
	bh=Xlm7+aVT7FxzAA3u5Q91zmzFmBCgLorPw0f/JHL9HEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8asdihHPL6y3g3j6Fa4kHwkgiSGGW0Zulh2fke9k+flM6c169az1op8r9hd81Rn5BprNV6KWRgz5Gy40/u6aac0rzhXAeBCOgHCgbYC47h4tgbr0Dzy0lq9N3/huccUo3mXyfAQqsEOQJHFISSr7U86zjd4T2ZzCgVH9Cdb9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXp8u1D0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXp8u1D0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774827662; x=1806363662;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xlm7+aVT7FxzAA3u5Q91zmzFmBCgLorPw0f/JHL9HEY=;
  b=NXp8u1D0T1lO5aY9k+zWrEh1+tlPTQTcFG+hwyDjF75LnFwr2aVqFEkf
   L6FKqp05F6tFXhg4JXYc+/x0RbJ5fk57Oz5QJFBlGXP33rA5xtxIF1ZXv
   GH8VsRAiPDL6W1U1lqK2xZiwg9Tjgk7hp9U7QUQGG6CK0IFAJtCpQqqtE
   Lk7bNkbEkYxR7Ay2NfDgoV0ysUs4PFOQJ/YpK05uHI99Vl3iBAhtIkjQL
   a/KP4D6tAmzevhcDTpKwXxuYD+L0H69McGvREcCgFE1K3ynvmImRNmuHb
   /fSKtaALOZkYWq21mok0Q09olc3Hsnc1jq971csURKA+G33y5h9lIAC9C
   w==;
X-CSE-ConnectionGUID: QM/s2oTGT9CH8BrMosTHSg==
X-CSE-MsgGUID: 65It/N3RTdOXFlyQfEgr6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79680497"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="79680497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 16:41:01 -0700
X-CSE-ConnectionGUID: yK1AKhfqTrmUnP4DsIsfww==
X-CSE-MsgGUID: bfgTrElvQWmtu+UbXE7MZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="225888294"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Mar 2026 16:41:00 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6zkX-000000000Kb-3t6k;
	Sun, 29 Mar 2026 23:40:57 +0000
Date: Mon, 30 Mar 2026 07:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/4] dmaengine: dma-axi-dmac: fix use-after-free on
 unbind
Message-ID: <202603300705.jhDfInJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b@analog.com>
References: <20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b@analog.com>
TO: "Nuno Sá via B4 Relay" <devnull+nuno.sa.analog.com@kernel.org>
TO: dmaengine@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@kernel.org>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b7560798466a07d9c3fb011698e92c335ab28baf]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dmaengine-Fix-possuible-use-after-free/20260329-160000
base:   b7560798466a07d9c3fb011698e92c335ab28baf
patch link:    https://lore.kernel.org/r/20260327-dma-dmac-handle-vunmap-v2-3-021f95f0e87b%40analog.com
patch subject: [PATCH v2 3/4] dmaengine: dma-axi-dmac: fix use-after-free on unbind
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: loongarch-randconfig-r071-20260329 (https://download.01.org/0day-ci/archive/20260330/202603300705.jhDfInJk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603300705.jhDfInJk-lkp@intel.com/

smatch warnings:
drivers/dma/dma-axi-dmac.c:1342 axi_dmac_probe() warn: address of NULL pointer 'dmac'

vim +/dmac +1342 drivers/dma/dma-axi-dmac.c

e6cff0d5c22ce16 Nuno Sá            2026-03-27  1231  
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1232  static int axi_dmac_probe(struct platform_device *pdev)
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1233  {
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1234  	struct dma_device *dma_dev;
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1235  	struct axi_dmac *__dmac;
a5b982af953bcc8 Chuhong Yuan       2019-12-09  1236  	struct regmap *regmap;
b377e670bac558a Alexandru Ardelean 2020-08-25  1237  	unsigned int version;
238f68a08e19a61 Paul Cercueil      2023-12-15  1238  	u32 irq_mask = 0;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1239  	int ret;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1240  
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1241  	struct axi_dmac *dmac __free(kfree) = kzalloc_obj(struct axi_dmac);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1242  	if (!dmac)
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1243  		return -ENOMEM;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1244  
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1245  	dmac->irq = platform_get_irq(pdev, 0);
50dc60a25597e10 Lars-Peter Clausen 2016-07-01  1246  	if (dmac->irq < 0)
50dc60a25597e10 Lars-Peter Clausen 2016-07-01  1247  		return dmac->irq;
50dc60a25597e10 Lars-Peter Clausen 2016-07-01  1248  	if (dmac->irq == 0)
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1249  		return -EINVAL;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1250  
4b23603a251d240 Tudor Ambarus      2022-11-10  1251  	dmac->base = devm_platform_ioremap_resource(pdev, 0);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1252  	if (IS_ERR(dmac->base))
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1253  		return PTR_ERR(dmac->base);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1254  
779a44831a4f646 Nuno Sa            2024-03-28  1255  	dmac->clk = devm_clk_get_enabled(&pdev->dev, NULL);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1256  	if (IS_ERR(dmac->clk))
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1257  		return PTR_ERR(dmac->clk);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1258  
78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1259  	version = axi_dmac_read(dmac, ADI_AXI_REG_VERSION);
78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1260  
78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1261  	if (version >= ADI_AXI_PCORE_VER(4, 3, 'a'))
78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1262  		ret = axi_dmac_read_chan_config(&pdev->dev, dmac);
78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1263  	else
06b6e88c7ecf48e Alexandru Ardelean 2020-08-25  1264  		ret = axi_dmac_parse_dt(&pdev->dev, dmac);
78a2f92e4c4a3b7 Alexandru Ardelean 2020-08-25  1265  
06b6e88c7ecf48e Alexandru Ardelean 2020-08-25  1266  	if (ret < 0)
779a44831a4f646 Nuno Sa            2024-03-28  1267  		return ret;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1268  
a88fdece44d40cd Alexandru Ardelean 2020-08-25  1269  	INIT_LIST_HEAD(&dmac->chan.active_descs);
a88fdece44d40cd Alexandru Ardelean 2020-08-25  1270  
921234e0c5d77b5 Lars-Peter Clausen 2019-03-08  1271  	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1272  
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1273  	dma_dev = &dmac->dma_dev;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1274  	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1275  	dma_cap_set(DMA_CYCLIC, dma_dev->cap_mask);
9a05045d2a681d3 Dragos Bogdan      2019-03-26  1276  	dma_cap_set(DMA_INTERLEAVE, dma_dev->cap_mask);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1277  	dma_dev->device_free_chan_resources = axi_dmac_free_chan_resources;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1278  	dma_dev->device_tx_status = dma_cookie_status;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1279  	dma_dev->device_issue_pending = axi_dmac_issue_pending;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1280  	dma_dev->device_prep_slave_sg = axi_dmac_prep_slave_sg;
74609e5686701ed Paul Cercueil      2024-06-20  1281  	dma_dev->device_prep_peripheral_dma_vec = axi_dmac_prep_peripheral_dma_vec;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1282  	dma_dev->device_prep_dma_cyclic = axi_dmac_prep_dma_cyclic;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1283  	dma_dev->device_prep_interleaved_dma = axi_dmac_prep_interleaved;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1284  	dma_dev->device_terminate_all = axi_dmac_terminate_all;
860dd64c4382709 Lars-Peter Clausen 2015-10-20  1285  	dma_dev->device_synchronize = axi_dmac_synchronize;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1286  	dma_dev->dev = &pdev->dev;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1287  	dma_dev->src_addr_widths = BIT(dmac->chan.src_width);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1288  	dma_dev->dst_addr_widths = BIT(dmac->chan.dest_width);
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1289  	dma_dev->device_release = axi_dmac_release;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1290  	dma_dev->directions = BIT(dmac->chan.direction);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1291  	dma_dev->residue_granularity = DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
e97dc7435972d28 Paul Cercueil      2023-12-15  1292  	dma_dev->max_sg_burst = 31; /* 31 SGs maximum in one burst */
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1293  	INIT_LIST_HEAD(&dma_dev->channels);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1294  
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1295  	dmac->chan.vchan.desc_free = axi_dmac_desc_free;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1296  	vchan_init(&dmac->chan.vchan, dma_dev);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1297  
b377e670bac558a Alexandru Ardelean 2020-08-25  1298  	ret = axi_dmac_detect_caps(dmac, version);
b5d89905d0391de Lars-Peter Clausen 2019-05-16  1299  	if (ret)
779a44831a4f646 Nuno Sa            2024-03-28  1300  		return ret;
56009f0d2f54e4c Lars-Peter Clausen 2019-03-26  1301  
5b969bd1d9cdfc8 Alexandru Ardelean 2019-05-27  1302  	dma_dev->copy_align = (dmac->chan.address_align_mask + 1);
56009f0d2f54e4c Lars-Peter Clausen 2019-03-26  1303  
238f68a08e19a61 Paul Cercueil      2023-12-15  1304  	if (dmac->chan.hw_sg)
238f68a08e19a61 Paul Cercueil      2023-12-15  1305  		irq_mask |= AXI_DMAC_IRQ_SOT;
238f68a08e19a61 Paul Cercueil      2023-12-15  1306  
238f68a08e19a61 Paul Cercueil      2023-12-15  1307  	axi_dmac_write(dmac, AXI_DMAC_REG_IRQ_MASK, irq_mask);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1308  
9327c7e7539371c Mathias Tausen     2022-07-26  1309  	if (of_dma_is_coherent(pdev->dev.of_node)) {
9327c7e7539371c Mathias Tausen     2022-07-26  1310  		ret = axi_dmac_read(dmac, AXI_DMAC_REG_COHERENCY_DESC);
9327c7e7539371c Mathias Tausen     2022-07-26  1311  
9327c7e7539371c Mathias Tausen     2022-07-26  1312  		if (version < ADI_AXI_PCORE_VER(4, 4, 'a') ||
9327c7e7539371c Mathias Tausen     2022-07-26  1313  		    !AXI_DMAC_DST_COHERENT_GET(ret)) {
9327c7e7539371c Mathias Tausen     2022-07-26  1314  			dev_err(dmac->dma_dev.dev,
9327c7e7539371c Mathias Tausen     2022-07-26  1315  				"Coherent DMA not supported in hardware");
779a44831a4f646 Nuno Sa            2024-03-28  1316  			return -EINVAL;
9327c7e7539371c Mathias Tausen     2022-07-26  1317  		}
9327c7e7539371c Mathias Tausen     2022-07-26  1318  	}
9327c7e7539371c Mathias Tausen     2022-07-26  1319  
779a44831a4f646 Nuno Sa            2024-03-28  1320  	ret = dmaenginem_async_device_register(dma_dev);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1321  	if (ret)
779a44831a4f646 Nuno Sa            2024-03-28  1322  		return ret;
779a44831a4f646 Nuno Sa            2024-03-28  1323  
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1324  	/*
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1325  	 * From this point on, our dmac object has it's lifetime bounded with
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1326  	 * dma_dev. Will be freed when dma_dev refcount goes to 0. That means,
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1327  	 * no more automatic kfree(). Also note that dmac is now NULL so we
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1328  	 * need __dmac.
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1329  	 */
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1330  	__dmac = no_free_ptr(dmac);
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1331  	get_device(&pdev->dev);
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1332  
779a44831a4f646 Nuno Sa            2024-03-28  1333  	/*
779a44831a4f646 Nuno Sa            2024-03-28  1334  	 * Put the action in here so it get's done before unregistering the DMA
779a44831a4f646 Nuno Sa            2024-03-28  1335  	 * device.
779a44831a4f646 Nuno Sa            2024-03-28  1336  	 */
779a44831a4f646 Nuno Sa            2024-03-28  1337  	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_tasklet_kill,
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1338  				       &__dmac->chan.vchan.task);
779a44831a4f646 Nuno Sa            2024-03-28  1339  	if (ret)
779a44831a4f646 Nuno Sa            2024-03-28  1340  		return ret;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1341  
0e3b67b348b838d Lars-Peter Clausen 2015-08-20 @1342  	ret = of_dma_controller_register(pdev->dev.of_node,
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1343  		of_dma_xlate_by_chan_id, dma_dev);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1344  	if (ret)
779a44831a4f646 Nuno Sa            2024-03-28  1345  		return ret;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1346  
779a44831a4f646 Nuno Sa            2024-03-28  1347  	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_free_dma_controller,
779a44831a4f646 Nuno Sa            2024-03-28  1348  				       pdev->dev.of_node);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1349  	if (ret)
779a44831a4f646 Nuno Sa            2024-03-28  1350  		return ret;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1351  
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1352  	/* So that we can mark the device as unbound and disable it */
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1353  	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_disable, __dmac);
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1354  	if (ret)
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1355  		return ret;
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1356  
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1357  	ret = devm_request_irq(&pdev->dev, __dmac->irq, axi_dmac_interrupt_handler,
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1358  			       IRQF_SHARED, dev_name(&pdev->dev), __dmac);
779a44831a4f646 Nuno Sa            2024-03-28  1359  	if (ret)
779a44831a4f646 Nuno Sa            2024-03-28  1360  		return ret;
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1361  
e6cff0d5c22ce16 Nuno Sá            2026-03-27  1362  	regmap = devm_regmap_init_mmio(&pdev->dev, __dmac->base,
a5b982af953bcc8 Chuhong Yuan       2019-12-09  1363  				       &axi_dmac_regmap_config);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1364  
779a44831a4f646 Nuno Sa            2024-03-28  1365  	return PTR_ERR_OR_ZERO(regmap);
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1366  }
0e3b67b348b838d Lars-Peter Clausen 2015-08-20  1367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
