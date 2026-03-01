Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6FC322DAF
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772402800; cv=none; b=f50cnC3K+wwtKDa/ZlYw5AyPUPWoBAHFhBL2DLdIcrPPhdeQIttZostprZXMwdLDm3OAj+s9WWCE7IQ1rOjDdlpqL3IicQEjjuf1+QWVOp0t7flYPfVWvYwo+4R/hHocpgHF+8I8V1IIWKlqbpDN04JI5JBJaO8VThW0tcrQKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772402800; c=relaxed/simple;
	bh=GDS5RkpLCLiCWgn51Ash757O5oTr/eujc7o5FzQDu2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXFqxRqDt7Ju2uEuRemuw1uJV28Mrx4QS/qyL5R3Orpta1jtmRyDt8T9FZ8L848A/57S4F9y3hjBc5zvhgKBg8FgZhlMac6aYXAeqzd7WFwt15c47hM7+DKu1w1SmXlFXPDyIhXzVL3cH8GEe1B+ObhbGa5srH/csGAAVxUuoQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UieDfp3N; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UieDfp3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772402798; x=1803938798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDS5RkpLCLiCWgn51Ash757O5oTr/eujc7o5FzQDu2g=;
  b=UieDfp3N18h2jZMqI5gT53Q11OQzdJNdb21q8OAaem9e2MvPAi4qQi90
   a86Alz2A6AAYJq+OXDKkvVlGx2DogydVTX0AaUwlwK2QMKZs9NHqbv6xC
   UGoDNb8qTwzySTvKGeYoTlq22QRdnmHN67xEoDKivH1t9Wyakt2A3FByI
   DRnYgMDeGZn5Vn+UKGi3VTPTpNf3rbSXO2cWSUkHUS6k5T9spz0fZtLm3
   cqIMkRlWQJo2HKC09GfwuiQU5h1T5uZ1Oqe7qL0wy+2YLJLWEmG+SdqU2
   aUnh5VNuX93gXw8RIgCB1mB+mLtjdo2cEWfLQ8iTW/k/+8YAy6nbkhYmU
   Q==;
X-CSE-ConnectionGUID: 7kIe8s2ORJqV/+/VdIhCUA==
X-CSE-MsgGUID: wJxlhKQuSHe/2DEh41ipJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73477617"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73477617"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 14:06:37 -0800
X-CSE-ConnectionGUID: sAnrWN7gTw2y08AX9H20uQ==
X-CSE-MsgGUID: t/puVPGBT8WNW92zfaM4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="222076771"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2026 14:06:36 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwovp-0000000002j-3AaH;
	Sun, 01 Mar 2026 22:06:33 +0000
Date: Mon, 2 Mar 2026 06:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/3] dma: amlogic: Add general DMA driver for A9
Message-ID: <202603020642.3hq2CxZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260227-amlogic-dma-v4-2-f25e4614e9b7@amlogic.com>
References: <20260227-amlogic-dma-v4-2-f25e4614e9b7@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Kees Cook <kees@kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: linux-amlogic@lists.infradead.org
CC: dmaengine@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-dma-Add-Amlogic-A9-SoC-DMA/20260227-152743
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260227-amlogic-dma-v4-2-f25e4614e9b7%40amlogic.com
patch subject: [PATCH v4 2/3] dma: amlogic: Add general DMA driver for A9
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r073-20260228 (https://download.01.org/0day-ci/archive/20260302/202603020642.3hq2CxZ7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603020642.3hq2CxZ7-lkp@intel.com/

New smatch warnings:
drivers/dma/amlogic-dma.c:354 aml_dma_interrupt_handler() warn: variable dereferenced before check 'aml_chan' (see line 353)
drivers/dma/amlogic-dma.c:483 aml_dma_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/dma/amlogic-dma.c:384 aml_dma_interrupt_handler() warn: variable dereferenced before check 'aml_chan' (see line 383)

vim +/aml_chan +354 drivers/dma/amlogic-dma.c

c01d15789f1d15b Xianwei Zhao 2026-02-27  334  
c01d15789f1d15b Xianwei Zhao 2026-02-27  335  static irqreturn_t aml_dma_interrupt_handler(int irq, void *dev_id)
c01d15789f1d15b Xianwei Zhao 2026-02-27  336  {
c01d15789f1d15b Xianwei Zhao 2026-02-27  337  	struct aml_dma_dev *aml_dma = dev_id;
c01d15789f1d15b Xianwei Zhao 2026-02-27  338  	struct aml_dma_chan *aml_chan;
c01d15789f1d15b Xianwei Zhao 2026-02-27  339  	u32 done, eoc_done, err, err_l, end;
c01d15789f1d15b Xianwei Zhao 2026-02-27  340  	int i = 0;
c01d15789f1d15b Xianwei Zhao 2026-02-27  341  
c01d15789f1d15b Xianwei Zhao 2026-02-27  342  	/* deal with rch normal complete and error */
c01d15789f1d15b Xianwei Zhao 2026-02-27  343  	regmap_read(aml_dma->regmap, RCH_DONE, &done);
c01d15789f1d15b Xianwei Zhao 2026-02-27  344  	regmap_read(aml_dma->regmap, RCH_ERR, &err);
c01d15789f1d15b Xianwei Zhao 2026-02-27  345  	regmap_read(aml_dma->regmap, RCH_LEN_ERR, &err_l);
c01d15789f1d15b Xianwei Zhao 2026-02-27  346  	err = err | err_l;
c01d15789f1d15b Xianwei Zhao 2026-02-27  347  
c01d15789f1d15b Xianwei Zhao 2026-02-27  348  	done = done | err;
c01d15789f1d15b Xianwei Zhao 2026-02-27  349  
c01d15789f1d15b Xianwei Zhao 2026-02-27  350  	while (done) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  351  		i = ffs(done) - 1;
c01d15789f1d15b Xianwei Zhao 2026-02-27  352  		aml_chan = aml_dma->aml_rch[i];
c01d15789f1d15b Xianwei Zhao 2026-02-27 @353  		regmap_write(aml_dma->regmap, CLEAR_RCH, BIT(aml_chan->chan_id));
c01d15789f1d15b Xianwei Zhao 2026-02-27 @354  		if (!aml_chan) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  355  			dev_err(aml_dma->dma_device.dev, "idx %d rch not initialized\n", i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  356  			done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  357  			continue;
c01d15789f1d15b Xianwei Zhao 2026-02-27  358  		}
c01d15789f1d15b Xianwei Zhao 2026-02-27  359  		aml_chan->status = (err & (1 << i)) ? DMA_ERROR : DMA_COMPLETE;
c01d15789f1d15b Xianwei Zhao 2026-02-27  360  		dma_cookie_complete(&aml_chan->desc);
c01d15789f1d15b Xianwei Zhao 2026-02-27  361  		dmaengine_desc_get_callback_invoke(&aml_chan->desc, NULL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  362  		done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  363  	}
c01d15789f1d15b Xianwei Zhao 2026-02-27  364  
c01d15789f1d15b Xianwei Zhao 2026-02-27  365  	/* deal with wch normal complete and error */
c01d15789f1d15b Xianwei Zhao 2026-02-27  366  	regmap_read(aml_dma->regmap, DMA_BATCH_END, &end);
c01d15789f1d15b Xianwei Zhao 2026-02-27  367  	if (end)
c01d15789f1d15b Xianwei Zhao 2026-02-27  368  		regmap_write(aml_dma->regmap, CLEAR_W_BATCH, end);
c01d15789f1d15b Xianwei Zhao 2026-02-27  369  
c01d15789f1d15b Xianwei Zhao 2026-02-27  370  	regmap_read(aml_dma->regmap, WCH_DONE, &done);
c01d15789f1d15b Xianwei Zhao 2026-02-27  371  	regmap_read(aml_dma->regmap, WCH_EOC_DONE, &eoc_done);
c01d15789f1d15b Xianwei Zhao 2026-02-27  372  	done = done | eoc_done;
c01d15789f1d15b Xianwei Zhao 2026-02-27  373  
c01d15789f1d15b Xianwei Zhao 2026-02-27  374  	regmap_read(aml_dma->regmap, WCH_ERR, &err);
c01d15789f1d15b Xianwei Zhao 2026-02-27  375  	regmap_read(aml_dma->regmap, WDMA_RESP_ERR, &err_l);
c01d15789f1d15b Xianwei Zhao 2026-02-27  376  	err = err | err_l;
c01d15789f1d15b Xianwei Zhao 2026-02-27  377  
c01d15789f1d15b Xianwei Zhao 2026-02-27  378  	done = done | err;
c01d15789f1d15b Xianwei Zhao 2026-02-27  379  	i = 0;
c01d15789f1d15b Xianwei Zhao 2026-02-27  380  	while (done) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  381  		i = ffs(done) - 1;
c01d15789f1d15b Xianwei Zhao 2026-02-27  382  		aml_chan = aml_dma->aml_wch[i];
c01d15789f1d15b Xianwei Zhao 2026-02-27  383  		regmap_write(aml_dma->regmap, CLEAR_WCH, BIT(aml_chan->chan_id));
c01d15789f1d15b Xianwei Zhao 2026-02-27  384  		if (!aml_chan) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  385  			dev_err(aml_dma->dma_device.dev, "idx %d wch not initialized\n", i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  386  			done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  387  			continue;
c01d15789f1d15b Xianwei Zhao 2026-02-27  388  		}
c01d15789f1d15b Xianwei Zhao 2026-02-27  389  		aml_chan->status = (err & (1 << i)) ? DMA_ERROR : DMA_COMPLETE;
c01d15789f1d15b Xianwei Zhao 2026-02-27  390  		dma_cookie_complete(&aml_chan->desc);
c01d15789f1d15b Xianwei Zhao 2026-02-27  391  		dmaengine_desc_get_callback_invoke(&aml_chan->desc, NULL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  392  		done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  393  	}
c01d15789f1d15b Xianwei Zhao 2026-02-27  394  
c01d15789f1d15b Xianwei Zhao 2026-02-27  395  	return IRQ_HANDLED;
c01d15789f1d15b Xianwei Zhao 2026-02-27  396  }
c01d15789f1d15b Xianwei Zhao 2026-02-27  397  
c01d15789f1d15b Xianwei Zhao 2026-02-27  398  static struct dma_chan *aml_of_dma_xlate(struct of_phandle_args *dma_spec, struct of_dma *ofdma)
c01d15789f1d15b Xianwei Zhao 2026-02-27  399  {
c01d15789f1d15b Xianwei Zhao 2026-02-27  400  	struct aml_dma_dev *aml_dma = (struct aml_dma_dev *)ofdma->of_dma_data;
c01d15789f1d15b Xianwei Zhao 2026-02-27  401  	struct aml_dma_chan *aml_chan = NULL;
c01d15789f1d15b Xianwei Zhao 2026-02-27  402  	u32 type;
c01d15789f1d15b Xianwei Zhao 2026-02-27  403  	u32 phy_chan_id;
c01d15789f1d15b Xianwei Zhao 2026-02-27  404  
c01d15789f1d15b Xianwei Zhao 2026-02-27  405  	if (dma_spec->args_count != 2)
c01d15789f1d15b Xianwei Zhao 2026-02-27  406  		return NULL;
c01d15789f1d15b Xianwei Zhao 2026-02-27  407  
c01d15789f1d15b Xianwei Zhao 2026-02-27  408  	type = dma_spec->args[0];
c01d15789f1d15b Xianwei Zhao 2026-02-27  409  	phy_chan_id = dma_spec->args[1];
c01d15789f1d15b Xianwei Zhao 2026-02-27  410  
c01d15789f1d15b Xianwei Zhao 2026-02-27  411  	if (phy_chan_id >= MAX_CHAN_ID)
c01d15789f1d15b Xianwei Zhao 2026-02-27  412  		return NULL;
c01d15789f1d15b Xianwei Zhao 2026-02-27  413  
c01d15789f1d15b Xianwei Zhao 2026-02-27  414  	if (type == AML_DMA_TYPE_TX) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  415  		aml_chan = aml_dma->aml_rch[phy_chan_id];
c01d15789f1d15b Xianwei Zhao 2026-02-27  416  		if (!aml_chan) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  417  			if (aml_dma->chan_used >= aml_dma->chan_nr) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  418  				dev_err(aml_dma->dma_device.dev, "some dma clients err used\n");
c01d15789f1d15b Xianwei Zhao 2026-02-27  419  				return NULL;
c01d15789f1d15b Xianwei Zhao 2026-02-27  420  			}
c01d15789f1d15b Xianwei Zhao 2026-02-27  421  			aml_chan = &aml_dma->aml_chans[aml_dma->chan_used];
c01d15789f1d15b Xianwei Zhao 2026-02-27  422  			aml_dma->chan_used++;
c01d15789f1d15b Xianwei Zhao 2026-02-27  423  			aml_chan->direction = DMA_MEM_TO_DEV;
c01d15789f1d15b Xianwei Zhao 2026-02-27  424  			aml_chan->chan_id = phy_chan_id;
c01d15789f1d15b Xianwei Zhao 2026-02-27  425  			aml_chan->reg_offs = RCH_REG_BASE + 0x40 * aml_chan->chan_id;
c01d15789f1d15b Xianwei Zhao 2026-02-27  426  			aml_dma->aml_rch[phy_chan_id] = aml_chan;
c01d15789f1d15b Xianwei Zhao 2026-02-27  427  		}
c01d15789f1d15b Xianwei Zhao 2026-02-27  428  	} else if (type == AML_DMA_TYPE_RX) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  429  		aml_chan = aml_dma->aml_wch[phy_chan_id];
c01d15789f1d15b Xianwei Zhao 2026-02-27  430  		if (!aml_chan) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  431  			if (aml_dma->chan_used >= aml_dma->chan_nr) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  432  				dev_err(aml_dma->dma_device.dev, "some dma clients err used\n");
c01d15789f1d15b Xianwei Zhao 2026-02-27  433  				return NULL;
c01d15789f1d15b Xianwei Zhao 2026-02-27  434  			}
c01d15789f1d15b Xianwei Zhao 2026-02-27  435  			aml_chan = &aml_dma->aml_chans[aml_dma->chan_used];
c01d15789f1d15b Xianwei Zhao 2026-02-27  436  			aml_dma->chan_used++;
c01d15789f1d15b Xianwei Zhao 2026-02-27  437  			aml_chan->direction = DMA_DEV_TO_MEM;
c01d15789f1d15b Xianwei Zhao 2026-02-27  438  			aml_chan->chan_id = phy_chan_id;
c01d15789f1d15b Xianwei Zhao 2026-02-27  439  			aml_chan->reg_offs = WCH_REG_BASE + 0x40 * aml_chan->chan_id;
c01d15789f1d15b Xianwei Zhao 2026-02-27  440  			aml_dma->aml_wch[phy_chan_id] = aml_chan;
c01d15789f1d15b Xianwei Zhao 2026-02-27  441  		}
c01d15789f1d15b Xianwei Zhao 2026-02-27  442  	} else {
c01d15789f1d15b Xianwei Zhao 2026-02-27  443  		dev_err(aml_dma->dma_device.dev, "type %d not supported\n", type);
c01d15789f1d15b Xianwei Zhao 2026-02-27  444  		return NULL;
c01d15789f1d15b Xianwei Zhao 2026-02-27  445  	}
c01d15789f1d15b Xianwei Zhao 2026-02-27  446  
c01d15789f1d15b Xianwei Zhao 2026-02-27  447  	return dma_get_slave_channel(&aml_chan->chan);
c01d15789f1d15b Xianwei Zhao 2026-02-27  448  }
c01d15789f1d15b Xianwei Zhao 2026-02-27  449  
c01d15789f1d15b Xianwei Zhao 2026-02-27  450  static int aml_dma_probe(struct platform_device *pdev)
c01d15789f1d15b Xianwei Zhao 2026-02-27  451  {
c01d15789f1d15b Xianwei Zhao 2026-02-27  452  	struct device_node *np = pdev->dev.of_node;
c01d15789f1d15b Xianwei Zhao 2026-02-27  453  	struct dma_device *dma_dev;
c01d15789f1d15b Xianwei Zhao 2026-02-27  454  	struct aml_dma_dev *aml_dma;
c01d15789f1d15b Xianwei Zhao 2026-02-27  455  	int ret, i, len;
c01d15789f1d15b Xianwei Zhao 2026-02-27  456  	u32 chan_nr;
c01d15789f1d15b Xianwei Zhao 2026-02-27  457  
c01d15789f1d15b Xianwei Zhao 2026-02-27  458  	const struct regmap_config aml_regmap_config = {
c01d15789f1d15b Xianwei Zhao 2026-02-27  459  		.reg_bits = 32,
c01d15789f1d15b Xianwei Zhao 2026-02-27  460  		.val_bits = 32,
c01d15789f1d15b Xianwei Zhao 2026-02-27  461  		.reg_stride = 4,
c01d15789f1d15b Xianwei Zhao 2026-02-27  462  		.max_register = 0x3000,
c01d15789f1d15b Xianwei Zhao 2026-02-27  463  	};
c01d15789f1d15b Xianwei Zhao 2026-02-27  464  
c01d15789f1d15b Xianwei Zhao 2026-02-27  465  	ret = of_property_read_u32(np, "dma-channels", &chan_nr);
c01d15789f1d15b Xianwei Zhao 2026-02-27  466  	if (ret)
c01d15789f1d15b Xianwei Zhao 2026-02-27  467  		return dev_err_probe(&pdev->dev, ret, "failed to read dma-channels\n");
c01d15789f1d15b Xianwei Zhao 2026-02-27  468  
c01d15789f1d15b Xianwei Zhao 2026-02-27  469  	len = sizeof(struct aml_dma_dev) + sizeof(struct aml_dma_chan) * chan_nr;
c01d15789f1d15b Xianwei Zhao 2026-02-27  470  	aml_dma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  471  	if (!aml_dma)
c01d15789f1d15b Xianwei Zhao 2026-02-27  472  		return -ENOMEM;
c01d15789f1d15b Xianwei Zhao 2026-02-27  473  
c01d15789f1d15b Xianwei Zhao 2026-02-27  474  	aml_dma->chan_nr = chan_nr;
c01d15789f1d15b Xianwei Zhao 2026-02-27  475  
c01d15789f1d15b Xianwei Zhao 2026-02-27  476  	aml_dma->base = devm_platform_ioremap_resource(pdev, 0);
c01d15789f1d15b Xianwei Zhao 2026-02-27  477  	if (IS_ERR(aml_dma->base))
c01d15789f1d15b Xianwei Zhao 2026-02-27  478  		return PTR_ERR(aml_dma->base);
c01d15789f1d15b Xianwei Zhao 2026-02-27  479  
c01d15789f1d15b Xianwei Zhao 2026-02-27  480  	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
c01d15789f1d15b Xianwei Zhao 2026-02-27  481  						&aml_regmap_config);
c01d15789f1d15b Xianwei Zhao 2026-02-27  482  	if (IS_ERR_OR_NULL(aml_dma->regmap))
c01d15789f1d15b Xianwei Zhao 2026-02-27 @483  		return PTR_ERR(aml_dma->regmap);
c01d15789f1d15b Xianwei Zhao 2026-02-27  484  
c01d15789f1d15b Xianwei Zhao 2026-02-27  485  	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  486  	if (IS_ERR(aml_dma->clk))
c01d15789f1d15b Xianwei Zhao 2026-02-27  487  		return PTR_ERR(aml_dma->clk);
c01d15789f1d15b Xianwei Zhao 2026-02-27  488  
c01d15789f1d15b Xianwei Zhao 2026-02-27  489  	aml_dma->irq = platform_get_irq(pdev, 0);
c01d15789f1d15b Xianwei Zhao 2026-02-27  490  
c01d15789f1d15b Xianwei Zhao 2026-02-27  491  	aml_dma->pdev = pdev;
c01d15789f1d15b Xianwei Zhao 2026-02-27  492  	aml_dma->dma_device.dev = &pdev->dev;
c01d15789f1d15b Xianwei Zhao 2026-02-27  493  
c01d15789f1d15b Xianwei Zhao 2026-02-27  494  	dma_dev = &aml_dma->dma_device;
c01d15789f1d15b Xianwei Zhao 2026-02-27  495  	INIT_LIST_HEAD(&dma_dev->channels);
c01d15789f1d15b Xianwei Zhao 2026-02-27  496  
c01d15789f1d15b Xianwei Zhao 2026-02-27  497  	/* Initialize channel parameters */
c01d15789f1d15b Xianwei Zhao 2026-02-27  498  	for (i = 0; i < chan_nr; i++) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  499  		struct aml_dma_chan *aml_chan = &aml_dma->aml_chans[i];
c01d15789f1d15b Xianwei Zhao 2026-02-27  500  
c01d15789f1d15b Xianwei Zhao 2026-02-27  501  		aml_chan->aml_dma = aml_dma;
c01d15789f1d15b Xianwei Zhao 2026-02-27  502  		aml_chan->chan.device = &aml_dma->dma_device;
c01d15789f1d15b Xianwei Zhao 2026-02-27  503  		dma_cookie_init(&aml_chan->chan);
c01d15789f1d15b Xianwei Zhao 2026-02-27  504  
c01d15789f1d15b Xianwei Zhao 2026-02-27  505  		/* Add the channel to aml_chan list */
c01d15789f1d15b Xianwei Zhao 2026-02-27  506  		list_add_tail(&aml_chan->chan.device_node,
c01d15789f1d15b Xianwei Zhao 2026-02-27  507  			      &aml_dma->dma_device.channels);
c01d15789f1d15b Xianwei Zhao 2026-02-27  508  	}
c01d15789f1d15b Xianwei Zhao 2026-02-27  509  	aml_dma->chan_used = 0;
c01d15789f1d15b Xianwei Zhao 2026-02-27  510  
c01d15789f1d15b Xianwei Zhao 2026-02-27  511  	dma_set_max_seg_size(dma_dev->dev, SG_MAX_LEN);
c01d15789f1d15b Xianwei Zhao 2026-02-27  512  
c01d15789f1d15b Xianwei Zhao 2026-02-27  513  	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
c01d15789f1d15b Xianwei Zhao 2026-02-27  514  	dma_dev->device_alloc_chan_resources = aml_dma_alloc_chan_resources;
c01d15789f1d15b Xianwei Zhao 2026-02-27  515  	dma_dev->device_free_chan_resources = aml_dma_free_chan_resources;
c01d15789f1d15b Xianwei Zhao 2026-02-27  516  	dma_dev->device_tx_status = aml_dma_tx_status;
c01d15789f1d15b Xianwei Zhao 2026-02-27  517  	dma_dev->device_prep_slave_sg = aml_dma_prep_slave_sg;
c01d15789f1d15b Xianwei Zhao 2026-02-27  518  
c01d15789f1d15b Xianwei Zhao 2026-02-27  519  	dma_dev->device_pause = aml_dma_pause_chan;
c01d15789f1d15b Xianwei Zhao 2026-02-27  520  	dma_dev->device_resume = aml_dma_resume_chan;
c01d15789f1d15b Xianwei Zhao 2026-02-27  521  	dma_dev->device_terminate_all = aml_dma_terminate_all;
c01d15789f1d15b Xianwei Zhao 2026-02-27  522  	dma_dev->device_issue_pending = aml_dma_enable_chan;
c01d15789f1d15b Xianwei Zhao 2026-02-27  523  	/* PIO 4 bytes and I2C 1 byte */
c01d15789f1d15b Xianwei Zhao 2026-02-27  524  	dma_dev->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
c01d15789f1d15b Xianwei Zhao 2026-02-27  525  	dma_dev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
c01d15789f1d15b Xianwei Zhao 2026-02-27  526  	dma_dev->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
c01d15789f1d15b Xianwei Zhao 2026-02-27  527  
c01d15789f1d15b Xianwei Zhao 2026-02-27  528  	ret = dmaenginem_async_device_register(dma_dev);
c01d15789f1d15b Xianwei Zhao 2026-02-27  529  	if (ret)
c01d15789f1d15b Xianwei Zhao 2026-02-27  530  		return dev_err_probe(&pdev->dev, ret, "failed to register dmaenginem\n");
c01d15789f1d15b Xianwei Zhao 2026-02-27  531  
c01d15789f1d15b Xianwei Zhao 2026-02-27  532  	ret = of_dma_controller_register(np, aml_of_dma_xlate, aml_dma);
c01d15789f1d15b Xianwei Zhao 2026-02-27  533  	if (ret)
c01d15789f1d15b Xianwei Zhao 2026-02-27  534  		goto err_dmaenginem_register;
c01d15789f1d15b Xianwei Zhao 2026-02-27  535  
c01d15789f1d15b Xianwei Zhao 2026-02-27  536  	regmap_write(aml_dma->regmap, RCH_INT_MASK, 0xffffffff);
c01d15789f1d15b Xianwei Zhao 2026-02-27  537  	regmap_write(aml_dma->regmap, WCH_INT_MASK, 0xffffffff);
c01d15789f1d15b Xianwei Zhao 2026-02-27  538  
c01d15789f1d15b Xianwei Zhao 2026-02-27  539  	ret = devm_request_irq(&pdev->dev, aml_dma->irq, aml_dma_interrupt_handler,
c01d15789f1d15b Xianwei Zhao 2026-02-27  540  			       IRQF_SHARED, dev_name(&pdev->dev), aml_dma);
c01d15789f1d15b Xianwei Zhao 2026-02-27  541  	if (ret) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  542  		dev_err(&pdev->dev, "failed to reqest_irq\n");
c01d15789f1d15b Xianwei Zhao 2026-02-27  543  		goto err_of_dma_controller;
c01d15789f1d15b Xianwei Zhao 2026-02-27  544  	}
c01d15789f1d15b Xianwei Zhao 2026-02-27  545  
c01d15789f1d15b Xianwei Zhao 2026-02-27  546  	platform_set_drvdata(pdev, aml_dma);
c01d15789f1d15b Xianwei Zhao 2026-02-27  547  
c01d15789f1d15b Xianwei Zhao 2026-02-27  548  	return 0;
c01d15789f1d15b Xianwei Zhao 2026-02-27  549  
c01d15789f1d15b Xianwei Zhao 2026-02-27  550  err_of_dma_controller:
c01d15789f1d15b Xianwei Zhao 2026-02-27  551  	of_dma_controller_free(np);
c01d15789f1d15b Xianwei Zhao 2026-02-27  552  err_dmaenginem_register:
c01d15789f1d15b Xianwei Zhao 2026-02-27  553  	dma_async_device_unregister(dma_dev);
c01d15789f1d15b Xianwei Zhao 2026-02-27  554  
c01d15789f1d15b Xianwei Zhao 2026-02-27  555  	return ret;
c01d15789f1d15b Xianwei Zhao 2026-02-27  556  }
c01d15789f1d15b Xianwei Zhao 2026-02-27  557  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
