Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3D2AF1B
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717230; cv=none; b=syxETksCiF/inHO/XaCZowhCIVHYM/BMdNo64lcNP5lzGmITXL1aKsKl/9U1d2yQYAW/E6FJkE6YDHDLYaa6EuqTqrQo7rZBA7otXSEEIzUK+Cao5rie7v1MiCm3kc4e0/Cqh7SLHqMUYeAQv29zGMBQ69GgGg+fzxc1E2YAooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717230; c=relaxed/simple;
	bh=NKaRR/OEwsd+r7rPclqdCJP4l1fnSP2FTt0guL2g4Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l80M5zo/C+VL284rthrKByeXS2VmX6SGQ6INcQswxtJcf7hP39uzKyM7Kf20yYsY6uanPHlz+/NxbvegcS8k5FIRe3EUAxUN98QlUcTWdmuH1C8yXXUzCL/WRQ4mzhQb2HqZ30MedifsB/xF3VhbemtzBhES8F0Ijy1iBXmV1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5yU1agu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5yU1agu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717228; x=1765253228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NKaRR/OEwsd+r7rPclqdCJP4l1fnSP2FTt0guL2g4Ek=;
  b=V5yU1agur3VMIl8bGzv0Wh8YHG2LRoodOqaOgJBgBmifplyZJECXARjL
   MDNNik52bYxQOarqYwLCFoRNZb5nGzoL2BE5HG2EitEqo09duHncN40OV
   lcz+nx8aJJ2+4YAH5e7/KBgnT0NgFQGPezDr+gVSjaa41Y1A4nCtmRA16
   OvCCKn3drLcooGumF5kqsJDnMliVjuZ5LB097WRFkBMAw8XOa8HXt7ie0
   GHc6ZitLdYZuvhAfgnpdQvpL76PtB1GlBm3JRHvtFXbfBMe3djg3LEc2V
   nlA2Wv7K7OPHo242awlad8COJMyZLGGvnDk86F1MSPoyiHxDa0XWZnpNM
   g==;
X-CSE-ConnectionGUID: 231s0mfaSKWlFlkodo+kHg==
X-CSE-MsgGUID: m8rgGMQJS7SELYZnhmUV4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33347003"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33347003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:07:07 -0800
X-CSE-ConnectionGUID: 5na4rKqdSTWFtT6x8sSIVQ==
X-CSE-MsgGUID: JTnGm+P/TTW/o5NGy3QOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125793765"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 20:07:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV31-0003n6-0r;
	Mon, 09 Dec 2024 04:07:03 +0000
Date: Mon, 9 Dec 2024 12:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/loongson1-apb-dma.c:282 ls1x_dma_prep_lli() error:
 uninitialized symbol 'lli'.
Message-ID: <202412071158.CeZgABMV-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Keguang Zhang <keguang.zhang@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: e06c432312148ddb550ec55b004e32671657ea23 dmaengine: Loongson1: Add Loongson-1 APB DMA driver
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-r071-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071158.CeZgABMV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071158.CeZgABMV-lkp@intel.com/

smatch warnings:
drivers/dma/loongson1-apb-dma.c:282 ls1x_dma_prep_lli() error: uninitialized symbol 'lli'.
drivers/dma/loongson1-apb-dma.c:458 ls1x_dma_tx_status() warn: iterator used outside loop: 'lli'

vim +/lli +282 drivers/dma/loongson1-apb-dma.c

e06c432312148dd Keguang Zhang 2024-08-09  215  
e06c432312148dd Keguang Zhang 2024-08-09  216  static int ls1x_dma_prep_lli(struct dma_chan *dchan, struct ls1x_dma_desc *desc,
e06c432312148dd Keguang Zhang 2024-08-09  217  			     struct scatterlist *sgl, unsigned int sg_len,
e06c432312148dd Keguang Zhang 2024-08-09  218  			     enum dma_transfer_direction dir, bool is_cyclic)
e06c432312148dd Keguang Zhang 2024-08-09  219  {
e06c432312148dd Keguang Zhang 2024-08-09  220  	struct ls1x_dma_chan *chan = to_ls1x_dma_chan(dchan);
e06c432312148dd Keguang Zhang 2024-08-09  221  	struct ls1x_dma_lli *lli, *prev = NULL, *first = NULL;
e06c432312148dd Keguang Zhang 2024-08-09  222  	struct device *dev = chan2dev(dchan);
e06c432312148dd Keguang Zhang 2024-08-09  223  	struct list_head *pos = NULL;
e06c432312148dd Keguang Zhang 2024-08-09  224  	struct scatterlist *sg;
e06c432312148dd Keguang Zhang 2024-08-09  225  	unsigned int dev_addr, cmd, i;
e06c432312148dd Keguang Zhang 2024-08-09  226  
e06c432312148dd Keguang Zhang 2024-08-09  227  	switch (dir) {
e06c432312148dd Keguang Zhang 2024-08-09  228  	case DMA_MEM_TO_DEV:
e06c432312148dd Keguang Zhang 2024-08-09  229  		dev_addr = chan->dst_addr;
e06c432312148dd Keguang Zhang 2024-08-09  230  		chan->bus_width = chan->dst_addr_width;
e06c432312148dd Keguang Zhang 2024-08-09  231  		cmd = LS1X_DMA_RAM2DEV | LS1X_DMA_INT;
e06c432312148dd Keguang Zhang 2024-08-09  232  		break;
e06c432312148dd Keguang Zhang 2024-08-09  233  	case DMA_DEV_TO_MEM:
e06c432312148dd Keguang Zhang 2024-08-09  234  		dev_addr = chan->src_addr;
e06c432312148dd Keguang Zhang 2024-08-09  235  		chan->bus_width = chan->src_addr_width;
e06c432312148dd Keguang Zhang 2024-08-09  236  		cmd = LS1X_DMA_INT;
e06c432312148dd Keguang Zhang 2024-08-09  237  		break;
e06c432312148dd Keguang Zhang 2024-08-09  238  	default:
e06c432312148dd Keguang Zhang 2024-08-09  239  		dev_err(dev, "unsupported DMA direction: %s\n",
e06c432312148dd Keguang Zhang 2024-08-09  240  			dmaengine_get_direction_text(dir));
e06c432312148dd Keguang Zhang 2024-08-09  241  		return -EINVAL;
e06c432312148dd Keguang Zhang 2024-08-09  242  	}
e06c432312148dd Keguang Zhang 2024-08-09  243  
e06c432312148dd Keguang Zhang 2024-08-09  244  	for_each_sg(sgl, sg, sg_len, i) {
e06c432312148dd Keguang Zhang 2024-08-09  245  		dma_addr_t buf_addr = sg_dma_address(sg);
e06c432312148dd Keguang Zhang 2024-08-09  246  		size_t buf_len = sg_dma_len(sg);
e06c432312148dd Keguang Zhang 2024-08-09  247  		dma_addr_t phys;
e06c432312148dd Keguang Zhang 2024-08-09  248  
e06c432312148dd Keguang Zhang 2024-08-09  249  		if (!is_dma_copy_aligned(dchan->device, buf_addr, 0, buf_len)) {
e06c432312148dd Keguang Zhang 2024-08-09  250  			dev_err(dev, "buffer is not aligned\n");
e06c432312148dd Keguang Zhang 2024-08-09  251  			return -EINVAL;
e06c432312148dd Keguang Zhang 2024-08-09  252  		}
e06c432312148dd Keguang Zhang 2024-08-09  253  
e06c432312148dd Keguang Zhang 2024-08-09  254  		/* allocate HW descriptors */
e06c432312148dd Keguang Zhang 2024-08-09  255  		lli = dma_pool_zalloc(chan->lli_pool, GFP_NOWAIT, &phys);
e06c432312148dd Keguang Zhang 2024-08-09  256  		if (!lli) {
e06c432312148dd Keguang Zhang 2024-08-09  257  			dev_err(dev, "failed to alloc lli %u\n", i);
e06c432312148dd Keguang Zhang 2024-08-09  258  			return -ENOMEM;
e06c432312148dd Keguang Zhang 2024-08-09  259  		}
e06c432312148dd Keguang Zhang 2024-08-09  260  
e06c432312148dd Keguang Zhang 2024-08-09  261  		/* setup HW descriptors */
e06c432312148dd Keguang Zhang 2024-08-09  262  		lli->phys = phys;
e06c432312148dd Keguang Zhang 2024-08-09  263  		lli->hw[LS1X_DMADESC_SADDR] = buf_addr;
e06c432312148dd Keguang Zhang 2024-08-09  264  		lli->hw[LS1X_DMADESC_DADDR] = dev_addr;
e06c432312148dd Keguang Zhang 2024-08-09  265  		lli->hw[LS1X_DMADESC_LENGTH] = buf_len / chan->bus_width;
e06c432312148dd Keguang Zhang 2024-08-09  266  		lli->hw[LS1X_DMADESC_STRIDE] = 0;
e06c432312148dd Keguang Zhang 2024-08-09  267  		lli->hw[LS1X_DMADESC_CYCLES] = 1;
e06c432312148dd Keguang Zhang 2024-08-09  268  		lli->hw[LS1X_DMADESC_CMD] = cmd;
e06c432312148dd Keguang Zhang 2024-08-09  269  
e06c432312148dd Keguang Zhang 2024-08-09  270  		if (prev)
e06c432312148dd Keguang Zhang 2024-08-09  271  			prev->hw[LS1X_DMADESC_NEXT] =
e06c432312148dd Keguang Zhang 2024-08-09  272  			    lli->phys | LS1X_DMA_NEXT_VALID;
e06c432312148dd Keguang Zhang 2024-08-09  273  		prev = lli;
e06c432312148dd Keguang Zhang 2024-08-09  274  
e06c432312148dd Keguang Zhang 2024-08-09  275  		if (!first)
e06c432312148dd Keguang Zhang 2024-08-09  276  			first = lli;
e06c432312148dd Keguang Zhang 2024-08-09  277  
e06c432312148dd Keguang Zhang 2024-08-09  278  		list_add_tail(&lli->node, &desc->lli_list);
e06c432312148dd Keguang Zhang 2024-08-09  279  	}
e06c432312148dd Keguang Zhang 2024-08-09  280  
e06c432312148dd Keguang Zhang 2024-08-09  281  	if (is_cyclic) {
e06c432312148dd Keguang Zhang 2024-08-09 @282  		lli->hw[LS1X_DMADESC_NEXT] = first->phys | LS1X_DMA_NEXT_VALID;
e06c432312148dd Keguang Zhang 2024-08-09  283  		chan->is_cyclic = is_cyclic;
e06c432312148dd Keguang Zhang 2024-08-09  284  	}
e06c432312148dd Keguang Zhang 2024-08-09  285  
e06c432312148dd Keguang Zhang 2024-08-09  286  	list_for_each(pos, &desc->lli_list) {
e06c432312148dd Keguang Zhang 2024-08-09  287  		lli = list_entry(pos, struct ls1x_dma_lli, node);
e06c432312148dd Keguang Zhang 2024-08-09  288  		print_hex_dump_debug("LLI: ", DUMP_PREFIX_OFFSET, 16, 4,
e06c432312148dd Keguang Zhang 2024-08-09  289  				     lli, sizeof(*lli), false);
e06c432312148dd Keguang Zhang 2024-08-09  290  	}
e06c432312148dd Keguang Zhang 2024-08-09  291  
e06c432312148dd Keguang Zhang 2024-08-09  292  	return 0;
e06c432312148dd Keguang Zhang 2024-08-09  293  }
e06c432312148dd Keguang Zhang 2024-08-09  294  
e06c432312148dd Keguang Zhang 2024-08-09  295  static struct dma_async_tx_descriptor *
e06c432312148dd Keguang Zhang 2024-08-09  296  ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
e06c432312148dd Keguang Zhang 2024-08-09  297  		       unsigned int sg_len, enum dma_transfer_direction dir,
e06c432312148dd Keguang Zhang 2024-08-09  298  		       unsigned long flags, void *context)
e06c432312148dd Keguang Zhang 2024-08-09  299  {
e06c432312148dd Keguang Zhang 2024-08-09  300  	struct ls1x_dma_desc *desc;
e06c432312148dd Keguang Zhang 2024-08-09  301  
e06c432312148dd Keguang Zhang 2024-08-09  302  	dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
e06c432312148dd Keguang Zhang 2024-08-09  303  		sg_len, flags, dmaengine_get_direction_text(dir));
e06c432312148dd Keguang Zhang 2024-08-09  304  
e06c432312148dd Keguang Zhang 2024-08-09  305  	desc = ls1x_dma_alloc_desc();
e06c432312148dd Keguang Zhang 2024-08-09  306  	if (!desc)
e06c432312148dd Keguang Zhang 2024-08-09  307  		return NULL;
e06c432312148dd Keguang Zhang 2024-08-09  308  
e06c432312148dd Keguang Zhang 2024-08-09  309  	if (ls1x_dma_prep_lli(dchan, desc, sgl, sg_len, dir, false)) {
e06c432312148dd Keguang Zhang 2024-08-09  310  		ls1x_dma_free_desc(&desc->vd);
e06c432312148dd Keguang Zhang 2024-08-09  311  		return NULL;
e06c432312148dd Keguang Zhang 2024-08-09  312  	}
e06c432312148dd Keguang Zhang 2024-08-09  313  
e06c432312148dd Keguang Zhang 2024-08-09  314  	return vchan_tx_prep(to_virt_chan(dchan), &desc->vd, flags);
e06c432312148dd Keguang Zhang 2024-08-09  315  }
e06c432312148dd Keguang Zhang 2024-08-09  316  
e06c432312148dd Keguang Zhang 2024-08-09  317  static struct dma_async_tx_descriptor *
e06c432312148dd Keguang Zhang 2024-08-09  318  ls1x_dma_prep_dma_cyclic(struct dma_chan *dchan, dma_addr_t buf_addr,
e06c432312148dd Keguang Zhang 2024-08-09  319  			 size_t buf_len, size_t period_len,
e06c432312148dd Keguang Zhang 2024-08-09  320  			 enum dma_transfer_direction dir, unsigned long flags)
e06c432312148dd Keguang Zhang 2024-08-09  321  {
e06c432312148dd Keguang Zhang 2024-08-09  322  	struct ls1x_dma_desc *desc;
e06c432312148dd Keguang Zhang 2024-08-09  323  	struct scatterlist *sgl;
e06c432312148dd Keguang Zhang 2024-08-09  324  	unsigned int sg_len;
e06c432312148dd Keguang Zhang 2024-08-09  325  	unsigned int i;
e06c432312148dd Keguang Zhang 2024-08-09  326  	int ret;
e06c432312148dd Keguang Zhang 2024-08-09  327  
e06c432312148dd Keguang Zhang 2024-08-09  328  	dev_dbg(chan2dev(dchan),
e06c432312148dd Keguang Zhang 2024-08-09  329  		"buf_len=%zu period_len=%zu flags=0x%lx dir=%s\n",
e06c432312148dd Keguang Zhang 2024-08-09  330  		buf_len, period_len, flags, dmaengine_get_direction_text(dir));
e06c432312148dd Keguang Zhang 2024-08-09  331  
e06c432312148dd Keguang Zhang 2024-08-09  332  	desc = ls1x_dma_alloc_desc();
e06c432312148dd Keguang Zhang 2024-08-09  333  	if (!desc)
e06c432312148dd Keguang Zhang 2024-08-09  334  		return NULL;
e06c432312148dd Keguang Zhang 2024-08-09  335  
e06c432312148dd Keguang Zhang 2024-08-09  336  	/* allocate the scatterlist */
e06c432312148dd Keguang Zhang 2024-08-09  337  	sg_len = buf_len / period_len;
e06c432312148dd Keguang Zhang 2024-08-09  338  	sgl = kmalloc_array(sg_len, sizeof(*sgl), GFP_NOWAIT);
e06c432312148dd Keguang Zhang 2024-08-09  339  	if (!sgl)
e06c432312148dd Keguang Zhang 2024-08-09  340  		return NULL;
e06c432312148dd Keguang Zhang 2024-08-09  341  
e06c432312148dd Keguang Zhang 2024-08-09  342  	sg_init_table(sgl, sg_len);
e06c432312148dd Keguang Zhang 2024-08-09  343  	for (i = 0; i < sg_len; ++i) {
e06c432312148dd Keguang Zhang 2024-08-09  344  		sg_set_page(&sgl[i], pfn_to_page(PFN_DOWN(buf_addr)),
e06c432312148dd Keguang Zhang 2024-08-09  345  			    period_len, offset_in_page(buf_addr));
e06c432312148dd Keguang Zhang 2024-08-09  346  		sg_dma_address(&sgl[i]) = buf_addr;
e06c432312148dd Keguang Zhang 2024-08-09  347  		sg_dma_len(&sgl[i]) = period_len;
e06c432312148dd Keguang Zhang 2024-08-09  348  		buf_addr += period_len;
e06c432312148dd Keguang Zhang 2024-08-09  349  	}
e06c432312148dd Keguang Zhang 2024-08-09  350  
e06c432312148dd Keguang Zhang 2024-08-09  351  	ret = ls1x_dma_prep_lli(dchan, desc, sgl, sg_len, dir, true);
e06c432312148dd Keguang Zhang 2024-08-09  352  	kfree(sgl);
e06c432312148dd Keguang Zhang 2024-08-09  353  	if (ret) {
e06c432312148dd Keguang Zhang 2024-08-09  354  		ls1x_dma_free_desc(&desc->vd);
e06c432312148dd Keguang Zhang 2024-08-09  355  		return NULL;
e06c432312148dd Keguang Zhang 2024-08-09  356  	}
e06c432312148dd Keguang Zhang 2024-08-09  357  
e06c432312148dd Keguang Zhang 2024-08-09  358  	return vchan_tx_prep(to_virt_chan(dchan), &desc->vd, flags);
e06c432312148dd Keguang Zhang 2024-08-09  359  }
e06c432312148dd Keguang Zhang 2024-08-09  360  
e06c432312148dd Keguang Zhang 2024-08-09  361  static int ls1x_dma_slave_config(struct dma_chan *dchan,
e06c432312148dd Keguang Zhang 2024-08-09  362  				 struct dma_slave_config *config)
e06c432312148dd Keguang Zhang 2024-08-09  363  {
e06c432312148dd Keguang Zhang 2024-08-09  364  	struct ls1x_dma_chan *chan = to_ls1x_dma_chan(dchan);
e06c432312148dd Keguang Zhang 2024-08-09  365  
e06c432312148dd Keguang Zhang 2024-08-09  366  	chan->src_addr = config->src_addr;
e06c432312148dd Keguang Zhang 2024-08-09  367  	chan->src_addr_width = config->src_addr_width;
e06c432312148dd Keguang Zhang 2024-08-09  368  	chan->dst_addr = config->dst_addr;
e06c432312148dd Keguang Zhang 2024-08-09  369  	chan->dst_addr_width = config->dst_addr_width;
e06c432312148dd Keguang Zhang 2024-08-09  370  
e06c432312148dd Keguang Zhang 2024-08-09  371  	return 0;
e06c432312148dd Keguang Zhang 2024-08-09  372  }
e06c432312148dd Keguang Zhang 2024-08-09  373  
e06c432312148dd Keguang Zhang 2024-08-09  374  static int ls1x_dma_pause(struct dma_chan *dchan)
e06c432312148dd Keguang Zhang 2024-08-09  375  {
e06c432312148dd Keguang Zhang 2024-08-09  376  	struct ls1x_dma_chan *chan = to_ls1x_dma_chan(dchan);
e06c432312148dd Keguang Zhang 2024-08-09  377  	int ret;
e06c432312148dd Keguang Zhang 2024-08-09  378  
e06c432312148dd Keguang Zhang 2024-08-09  379  	guard(spinlock_irqsave)(&chan->vc.lock);
e06c432312148dd Keguang Zhang 2024-08-09  380  	/* save the current lli */
e06c432312148dd Keguang Zhang 2024-08-09  381  	ret = ls1x_dma_query(chan, &chan->curr_lli->phys);
e06c432312148dd Keguang Zhang 2024-08-09  382  	if (!ret)
e06c432312148dd Keguang Zhang 2024-08-09  383  		ls1x_dma_stop(chan);
e06c432312148dd Keguang Zhang 2024-08-09  384  
e06c432312148dd Keguang Zhang 2024-08-09  385  	return ret;
e06c432312148dd Keguang Zhang 2024-08-09  386  }
e06c432312148dd Keguang Zhang 2024-08-09  387  
e06c432312148dd Keguang Zhang 2024-08-09  388  static int ls1x_dma_resume(struct dma_chan *dchan)
e06c432312148dd Keguang Zhang 2024-08-09  389  {
e06c432312148dd Keguang Zhang 2024-08-09  390  	struct ls1x_dma_chan *chan = to_ls1x_dma_chan(dchan);
e06c432312148dd Keguang Zhang 2024-08-09  391  
e06c432312148dd Keguang Zhang 2024-08-09  392  	guard(spinlock_irqsave)(&chan->vc.lock);
e06c432312148dd Keguang Zhang 2024-08-09  393  
e06c432312148dd Keguang Zhang 2024-08-09  394  	return ls1x_dma_start(chan, &chan->curr_lli->phys);
e06c432312148dd Keguang Zhang 2024-08-09  395  }
e06c432312148dd Keguang Zhang 2024-08-09  396  
e06c432312148dd Keguang Zhang 2024-08-09  397  static int ls1x_dma_terminate_all(struct dma_chan *dchan)
e06c432312148dd Keguang Zhang 2024-08-09  398  {
e06c432312148dd Keguang Zhang 2024-08-09  399  	struct ls1x_dma_chan *chan = to_ls1x_dma_chan(dchan);
e06c432312148dd Keguang Zhang 2024-08-09  400  	struct virt_dma_desc *vd;
e06c432312148dd Keguang Zhang 2024-08-09  401  	LIST_HEAD(head);
e06c432312148dd Keguang Zhang 2024-08-09  402  
e06c432312148dd Keguang Zhang 2024-08-09  403  	ls1x_dma_stop(chan);
e06c432312148dd Keguang Zhang 2024-08-09  404  
e06c432312148dd Keguang Zhang 2024-08-09  405  	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
e06c432312148dd Keguang Zhang 2024-08-09  406  		vd = vchan_next_desc(&chan->vc);
e06c432312148dd Keguang Zhang 2024-08-09  407  		if (vd)
e06c432312148dd Keguang Zhang 2024-08-09  408  			vchan_terminate_vdesc(vd);
e06c432312148dd Keguang Zhang 2024-08-09  409  
e06c432312148dd Keguang Zhang 2024-08-09  410  		vchan_get_all_descriptors(&chan->vc, &head);
e06c432312148dd Keguang Zhang 2024-08-09  411  	}
e06c432312148dd Keguang Zhang 2024-08-09  412  
e06c432312148dd Keguang Zhang 2024-08-09  413  	vchan_dma_desc_free_list(&chan->vc, &head);
e06c432312148dd Keguang Zhang 2024-08-09  414  
e06c432312148dd Keguang Zhang 2024-08-09  415  	return 0;
e06c432312148dd Keguang Zhang 2024-08-09  416  }
e06c432312148dd Keguang Zhang 2024-08-09  417  
e06c432312148dd Keguang Zhang 2024-08-09  418  static void ls1x_dma_synchronize(struct dma_chan *dchan)
e06c432312148dd Keguang Zhang 2024-08-09  419  {
e06c432312148dd Keguang Zhang 2024-08-09  420  	vchan_synchronize(to_virt_chan(dchan));
e06c432312148dd Keguang Zhang 2024-08-09  421  }
e06c432312148dd Keguang Zhang 2024-08-09  422  
e06c432312148dd Keguang Zhang 2024-08-09  423  static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
e06c432312148dd Keguang Zhang 2024-08-09  424  					  dma_cookie_t cookie,
e06c432312148dd Keguang Zhang 2024-08-09  425  					  struct dma_tx_state *state)
e06c432312148dd Keguang Zhang 2024-08-09  426  {
e06c432312148dd Keguang Zhang 2024-08-09  427  	struct ls1x_dma_chan *chan = to_ls1x_dma_chan(dchan);
e06c432312148dd Keguang Zhang 2024-08-09  428  	struct virt_dma_desc *vd;
e06c432312148dd Keguang Zhang 2024-08-09  429  	enum dma_status status;
e06c432312148dd Keguang Zhang 2024-08-09  430  	size_t bytes = 0;
e06c432312148dd Keguang Zhang 2024-08-09  431  
e06c432312148dd Keguang Zhang 2024-08-09  432  	status = dma_cookie_status(dchan, cookie, state);
e06c432312148dd Keguang Zhang 2024-08-09  433  	if (status == DMA_COMPLETE)
e06c432312148dd Keguang Zhang 2024-08-09  434  		return status;
e06c432312148dd Keguang Zhang 2024-08-09  435  
e06c432312148dd Keguang Zhang 2024-08-09  436  	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
e06c432312148dd Keguang Zhang 2024-08-09  437  		vd = vchan_find_desc(&chan->vc, cookie);
e06c432312148dd Keguang Zhang 2024-08-09  438  		if (vd) {
e06c432312148dd Keguang Zhang 2024-08-09  439  			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
e06c432312148dd Keguang Zhang 2024-08-09  440  			struct ls1x_dma_lli *lli;
e06c432312148dd Keguang Zhang 2024-08-09  441  			dma_addr_t next_phys;
e06c432312148dd Keguang Zhang 2024-08-09  442  
e06c432312148dd Keguang Zhang 2024-08-09  443  			/* get the current lli */
e06c432312148dd Keguang Zhang 2024-08-09  444  			if (ls1x_dma_query(chan, &chan->curr_lli->phys))
e06c432312148dd Keguang Zhang 2024-08-09  445  				return status;
e06c432312148dd Keguang Zhang 2024-08-09  446  
e06c432312148dd Keguang Zhang 2024-08-09  447  			/* locate the current lli */
e06c432312148dd Keguang Zhang 2024-08-09  448  			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
e06c432312148dd Keguang Zhang 2024-08-09  449  			list_for_each_entry(lli, &desc->lli_list, node)
e06c432312148dd Keguang Zhang 2024-08-09  450  				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
e06c432312148dd Keguang Zhang 2024-08-09  451  					break;
e06c432312148dd Keguang Zhang 2024-08-09  452  
e06c432312148dd Keguang Zhang 2024-08-09  453  			dev_dbg(chan2dev(dchan), "current lli_phys=%pad",
e06c432312148dd Keguang Zhang 2024-08-09  454  				&lli->phys);
e06c432312148dd Keguang Zhang 2024-08-09  455  
e06c432312148dd Keguang Zhang 2024-08-09  456  			/* count the residues */
e06c432312148dd Keguang Zhang 2024-08-09  457  			list_for_each_entry_from(lli, &desc->lli_list, node)
e06c432312148dd Keguang Zhang 2024-08-09 @458  				bytes += lli->hw[LS1X_DMADESC_LENGTH] *
e06c432312148dd Keguang Zhang 2024-08-09  459  					 chan->bus_width;
e06c432312148dd Keguang Zhang 2024-08-09  460  		}
e06c432312148dd Keguang Zhang 2024-08-09  461  	}
e06c432312148dd Keguang Zhang 2024-08-09  462  
e06c432312148dd Keguang Zhang 2024-08-09  463  	dma_set_residue(state, bytes);
e06c432312148dd Keguang Zhang 2024-08-09  464  
e06c432312148dd Keguang Zhang 2024-08-09  465  	return status;
e06c432312148dd Keguang Zhang 2024-08-09  466  }
e06c432312148dd Keguang Zhang 2024-08-09  467  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
