Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B695286A9
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 03:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487024; cv=none; b=AlXV6Mvl2kKVAf1oMH0iAWMo4tUme098+ANF3Zyh2BjqXeMAX5rw7OszUMX7vpUWPQ+rg2/pK86CxLxZqKdo1mbEc3BqPAENiFLDBVPRHXMO7wO/dcOjD2wA5ojYqMuKwfqexbi0fCJl18/jmSNipZ3tTc4+mTjXWltvpLWRQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487024; c=relaxed/simple;
	bh=czhDZASlr7r2u1Hrxa8o7sThWsN7JI2B0wltBbGrjqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzsi3VzBstCs4m/usSmxOCy4u5zYMMTg6oOHqVCZO45UWF2ftdbckf/Ttn1paQJYYSEYg9I/5F5GW6wDAuQyNG4TZYq4x07MM8iJ8r3ivx73fR8DGPXzq24nzPsRmqt82S+Yxdo5oaT1AxMGUxnHa2J9jpmrRZ10BWXHVP33tI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyqJrdzw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyqJrdzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755487020; x=1787023020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=czhDZASlr7r2u1Hrxa8o7sThWsN7JI2B0wltBbGrjqQ=;
  b=jyqJrdzwjo84ZN6YU0Xb13aoR0FiiTUAdeuoTIQm13ZHDtVMvzczePzG
   W57E5ihChR0NG136rWN5xtBIgoMnekg08WKmOZHz/9di6RJtG/KyMoxgQ
   eD8N88QVk+nhd1H4iItpVJ4KbbGuA8Od2F9wJcEn44SsaAaXG+d8FBu/T
   v3vKy6nkde0pZnsFRYcM/k/P/HhyddrbWOWai1pneWnRQOEEB927Nuixl
   btXkRcOC3lc0mr3Q2fKskLPWWZsBo212KXrRrFDnY2EfdaixekpyK3dZX
   rMLShxa+3rsHTrQ3EX4E0fV7AEp+S9lS/XC00/pgViCL/B3plXkWVXAZT
   w==;
X-CSE-ConnectionGUID: mdNXws4QTpa7GKScFQDM2w==
X-CSE-MsgGUID: WfeYFKOoQQ+l9EysZq+j7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68417605"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68417605"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 20:16:59 -0700
X-CSE-ConnectionGUID: fbPURrOHQmCrV9/9cL2IZQ==
X-CSE-MsgGUID: /uNfDhx9RlOhFI2j65m1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167856416"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Aug 2025 20:16:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unqMi-000Dsx-0d;
	Mon, 18 Aug 2025 03:16:56 +0000
Date: Mon, 18 Aug 2025 11:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for
 controller abstraction
Message-ID: <202508181040.az8RxLrG-lkp@intel.com>
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
In-Reply-To: <20250815-working_dma_0701_v2-v4-4-62145ab6ea30@riscstar.com>
References: <20250815-working_dma_0701_v2-v4-4-62145ab6ea30@riscstar.com>
TO: Guodong Xu <guodong@riscstar.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Yixun Lan <dlan@gentoo.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: duje@dujemihanovic.xyz
CC: Alex Elder <elder@riscstar.com>
CC: Vivian Wang <wangruikang@iscas.ac.cn>
CC: dmaengine@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: Guodong Xu <guodong@riscstar.com>
CC: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Hi Guodong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 062b3e4a1f880f104a8d4b90b767788786aa7b78]

url:    https://github.com/intel-lab-lkp/linux/commits/Guodong-Xu/dt-bindings-dma-Add-SpacemiT-K1-PDMA-controller/20250815-132049
base:   062b3e4a1f880f104a8d4b90b767788786aa7b78
patch link:    https://lore.kernel.org/r/20250815-working_dma_0701_v2-v4-4-62145ab6ea30%40riscstar.com
patch subject: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for controller abstraction
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181040.az8RxLrG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508181040.az8RxLrG-lkp@intel.com/

smatch warnings:
drivers/dma/mmp_pdma.c:546 mmp_pdma_prep_memcpy() warn: variable dereferenced before check 'dchan' (see line 542)
drivers/dma/mmp_pdma.c:712 mmp_pdma_prep_dma_cyclic() warn: variable dereferenced before check 'dchan' (see line 708)

vim +/dchan +546 drivers/dma/mmp_pdma.c

c8acd6aa6bed3c Zhangfei Gao     2012-09-03  535  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  536  static struct dma_async_tx_descriptor *
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  537  mmp_pdma_prep_memcpy(struct dma_chan *dchan,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  538  		     dma_addr_t dma_dst, dma_addr_t dma_src,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  539  		     size_t len, unsigned long flags)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  540  {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  541  	struct mmp_pdma_chan *chan;
918da7ee50b22b Guodong Xu       2025-08-15 @542  	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(dchan->device);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  543  	struct mmp_pdma_desc_sw *first = NULL, *prev = NULL, *new;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  544  	size_t copy = 0;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  545  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03 @546  	if (!dchan)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  547  		return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  548  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  549  	if (!len)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  550  		return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  551  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  552  	chan = to_mmp_pdma_chan(dchan);
6fc4573c4e17eb Daniel Mack      2013-08-10  553  	chan->byte_align = false;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  554  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  555  	if (!chan->dir) {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  556  		chan->dir = DMA_MEM_TO_MEM;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  557  		chan->dcmd = DCMD_INCTRGADDR | DCMD_INCSRCADDR;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  558  		chan->dcmd |= DCMD_BURST32;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  559  	}
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  560  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  561  	do {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  562  		/* Allocate the link descriptor from DMA pool */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  563  		new = mmp_pdma_alloc_descriptor(chan);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  564  		if (!new) {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  565  			dev_err(chan->dev, "no memory for desc\n");
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  566  			goto fail;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  567  		}
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  568  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  569  		copy = min_t(size_t, len, PDMA_MAX_DESC_BYTES);
6fc4573c4e17eb Daniel Mack      2013-08-10  570  		if (dma_src & 0x7 || dma_dst & 0x7)
6fc4573c4e17eb Daniel Mack      2013-08-10  571  			chan->byte_align = true;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  572  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  573  		new->desc.dcmd = chan->dcmd | (DCMD_LENGTH & copy);
918da7ee50b22b Guodong Xu       2025-08-15  574  		pdev->ops->set_desc_src_addr(&new->desc, dma_src);
918da7ee50b22b Guodong Xu       2025-08-15  575  		pdev->ops->set_desc_dst_addr(&new->desc, dma_dst);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  576  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  577  		if (!first)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  578  			first = new;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  579  		else
918da7ee50b22b Guodong Xu       2025-08-15  580  			pdev->ops->set_desc_next_addr(&prev->desc,
918da7ee50b22b Guodong Xu       2025-08-15  581  						      new->async_tx.phys);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  582  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  583  		new->async_tx.cookie = 0;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  584  		async_tx_ack(&new->async_tx);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  585  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  586  		prev = new;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  587  		len -= copy;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  588  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  589  		if (chan->dir == DMA_MEM_TO_DEV) {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  590  			dma_src += copy;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  591  		} else if (chan->dir == DMA_DEV_TO_MEM) {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  592  			dma_dst += copy;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  593  		} else if (chan->dir == DMA_MEM_TO_MEM) {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  594  			dma_src += copy;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  595  			dma_dst += copy;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  596  		}
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  597  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  598  		/* Insert the link descriptor to the LD ring */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  599  		list_add_tail(&new->node, &first->tx_list);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  600  	} while (len);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  601  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  602  	first->async_tx.flags = flags; /* client is in control of this ack */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  603  	first->async_tx.cookie = -EBUSY;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  604  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  605  	/* last desc and fire IRQ */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  606  	new->desc.ddadr = DDADR_STOP;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  607  	new->desc.dcmd |= DCMD_ENDIRQEN;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  608  
50440d74aae318 Daniel Mack      2013-08-21  609  	chan->cyclic_first = NULL;
50440d74aae318 Daniel Mack      2013-08-21  610  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  611  	return &first->async_tx;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  612  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  613  fail:
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  614  	if (first)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  615  		mmp_pdma_free_desc_list(chan, &first->tx_list);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  616  	return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  617  }
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  618  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  619  static struct dma_async_tx_descriptor *
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  620  mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  621  		       unsigned int sg_len, enum dma_transfer_direction dir,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  622  		       unsigned long flags, void *context)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  623  {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  624  	struct mmp_pdma_chan *chan = to_mmp_pdma_chan(dchan);
918da7ee50b22b Guodong Xu       2025-08-15  625  	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(dchan->device);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  626  	struct mmp_pdma_desc_sw *first = NULL, *prev = NULL, *new = NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  627  	size_t len, avail;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  628  	struct scatterlist *sg;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  629  	dma_addr_t addr;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  630  	int i;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  631  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  632  	if ((sgl == NULL) || (sg_len == 0))
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  633  		return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  634  
6fc4573c4e17eb Daniel Mack      2013-08-10  635  	chan->byte_align = false;
6fc4573c4e17eb Daniel Mack      2013-08-10  636  
56b94b02cb079a Vinod Koul       2018-10-25  637  	mmp_pdma_config_write(dchan, &chan->slave_config, dir);
56b94b02cb079a Vinod Koul       2018-10-25  638  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  639  	for_each_sg(sgl, sg, sg_len, i) {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  640  		addr = sg_dma_address(sg);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  641  		avail = sg_dma_len(sgl);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  642  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  643  		do {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  644  			len = min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
6fc4573c4e17eb Daniel Mack      2013-08-10  645  			if (addr & 0x7)
6fc4573c4e17eb Daniel Mack      2013-08-10  646  				chan->byte_align = true;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  647  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  648  			/* allocate and populate the descriptor */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  649  			new = mmp_pdma_alloc_descriptor(chan);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  650  			if (!new) {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  651  				dev_err(chan->dev, "no memory for desc\n");
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  652  				goto fail;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  653  			}
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  654  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  655  			new->desc.dcmd = chan->dcmd | (DCMD_LENGTH & len);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  656  			if (dir == DMA_MEM_TO_DEV) {
918da7ee50b22b Guodong Xu       2025-08-15  657  				pdev->ops->set_desc_src_addr(&new->desc, addr);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  658  				new->desc.dtadr = chan->dev_addr;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  659  			} else {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  660  				new->desc.dsadr = chan->dev_addr;
918da7ee50b22b Guodong Xu       2025-08-15  661  				pdev->ops->set_desc_dst_addr(&new->desc, addr);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  662  			}
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  663  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  664  			if (!first)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  665  				first = new;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  666  			else
918da7ee50b22b Guodong Xu       2025-08-15  667  				pdev->ops->set_desc_next_addr(&prev->desc,
918da7ee50b22b Guodong Xu       2025-08-15  668  							   new->async_tx.phys);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  669  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  670  			new->async_tx.cookie = 0;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  671  			async_tx_ack(&new->async_tx);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  672  			prev = new;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  673  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  674  			/* Insert the link descriptor to the LD ring */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  675  			list_add_tail(&new->node, &first->tx_list);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  676  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  677  			/* update metadata */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  678  			addr += len;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  679  			avail -= len;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  680  		} while (avail);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  681  	}
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  682  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  683  	first->async_tx.cookie = -EBUSY;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  684  	first->async_tx.flags = flags;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  685  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  686  	/* last desc and fire IRQ */
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  687  	new->desc.ddadr = DDADR_STOP;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  688  	new->desc.dcmd |= DCMD_ENDIRQEN;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  689  
50440d74aae318 Daniel Mack      2013-08-21  690  	chan->dir = dir;
50440d74aae318 Daniel Mack      2013-08-21  691  	chan->cyclic_first = NULL;
50440d74aae318 Daniel Mack      2013-08-21  692  
50440d74aae318 Daniel Mack      2013-08-21  693  	return &first->async_tx;
50440d74aae318 Daniel Mack      2013-08-21  694  
50440d74aae318 Daniel Mack      2013-08-21  695  fail:
50440d74aae318 Daniel Mack      2013-08-21  696  	if (first)
50440d74aae318 Daniel Mack      2013-08-21  697  		mmp_pdma_free_desc_list(chan, &first->tx_list);
50440d74aae318 Daniel Mack      2013-08-21  698  	return NULL;
50440d74aae318 Daniel Mack      2013-08-21  699  }
50440d74aae318 Daniel Mack      2013-08-21  700  
2b7f65b11d87f9 Joe Perches      2013-11-17  701  static struct dma_async_tx_descriptor *
2b7f65b11d87f9 Joe Perches      2013-11-17  702  mmp_pdma_prep_dma_cyclic(struct dma_chan *dchan,
2b7f65b11d87f9 Joe Perches      2013-11-17  703  			 dma_addr_t buf_addr, size_t len, size_t period_len,
2b7f65b11d87f9 Joe Perches      2013-11-17  704  			 enum dma_transfer_direction direction,
31c1e5a1350ae8 Laurent Pinchart 2014-08-01  705  			 unsigned long flags)
50440d74aae318 Daniel Mack      2013-08-21  706  {
50440d74aae318 Daniel Mack      2013-08-21  707  	struct mmp_pdma_chan *chan;
918da7ee50b22b Guodong Xu       2025-08-15 @708  	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(dchan->device);
50440d74aae318 Daniel Mack      2013-08-21  709  	struct mmp_pdma_desc_sw *first = NULL, *prev = NULL, *new;
50440d74aae318 Daniel Mack      2013-08-21  710  	dma_addr_t dma_src, dma_dst;
50440d74aae318 Daniel Mack      2013-08-21  711  
50440d74aae318 Daniel Mack      2013-08-21 @712  	if (!dchan || !len || !period_len)
50440d74aae318 Daniel Mack      2013-08-21  713  		return NULL;
50440d74aae318 Daniel Mack      2013-08-21  714  
50440d74aae318 Daniel Mack      2013-08-21  715  	/* the buffer length must be a multiple of period_len */
50440d74aae318 Daniel Mack      2013-08-21  716  	if (len % period_len != 0)
50440d74aae318 Daniel Mack      2013-08-21  717  		return NULL;
50440d74aae318 Daniel Mack      2013-08-21  718  
50440d74aae318 Daniel Mack      2013-08-21  719  	if (period_len > PDMA_MAX_DESC_BYTES)
50440d74aae318 Daniel Mack      2013-08-21  720  		return NULL;
50440d74aae318 Daniel Mack      2013-08-21  721  
50440d74aae318 Daniel Mack      2013-08-21  722  	chan = to_mmp_pdma_chan(dchan);
56b94b02cb079a Vinod Koul       2018-10-25  723  	mmp_pdma_config_write(dchan, &chan->slave_config, direction);
50440d74aae318 Daniel Mack      2013-08-21  724  
50440d74aae318 Daniel Mack      2013-08-21  725  	switch (direction) {
50440d74aae318 Daniel Mack      2013-08-21  726  	case DMA_MEM_TO_DEV:
50440d74aae318 Daniel Mack      2013-08-21  727  		dma_src = buf_addr;
50440d74aae318 Daniel Mack      2013-08-21  728  		dma_dst = chan->dev_addr;
50440d74aae318 Daniel Mack      2013-08-21  729  		break;
50440d74aae318 Daniel Mack      2013-08-21  730  	case DMA_DEV_TO_MEM:
50440d74aae318 Daniel Mack      2013-08-21  731  		dma_dst = buf_addr;
50440d74aae318 Daniel Mack      2013-08-21  732  		dma_src = chan->dev_addr;
50440d74aae318 Daniel Mack      2013-08-21  733  		break;
50440d74aae318 Daniel Mack      2013-08-21  734  	default:
50440d74aae318 Daniel Mack      2013-08-21  735  		dev_err(chan->dev, "Unsupported direction for cyclic DMA\n");
50440d74aae318 Daniel Mack      2013-08-21  736  		return NULL;
50440d74aae318 Daniel Mack      2013-08-21  737  	}
50440d74aae318 Daniel Mack      2013-08-21  738  
50440d74aae318 Daniel Mack      2013-08-21  739  	chan->dir = direction;
50440d74aae318 Daniel Mack      2013-08-21  740  
50440d74aae318 Daniel Mack      2013-08-21  741  	do {
50440d74aae318 Daniel Mack      2013-08-21  742  		/* Allocate the link descriptor from DMA pool */
50440d74aae318 Daniel Mack      2013-08-21  743  		new = mmp_pdma_alloc_descriptor(chan);
50440d74aae318 Daniel Mack      2013-08-21  744  		if (!new) {
50440d74aae318 Daniel Mack      2013-08-21  745  			dev_err(chan->dev, "no memory for desc\n");
50440d74aae318 Daniel Mack      2013-08-21  746  			goto fail;
50440d74aae318 Daniel Mack      2013-08-21  747  		}
50440d74aae318 Daniel Mack      2013-08-21  748  
2b7f65b11d87f9 Joe Perches      2013-11-17  749  		new->desc.dcmd = (chan->dcmd | DCMD_ENDIRQEN |
2b7f65b11d87f9 Joe Perches      2013-11-17  750  				  (DCMD_LENGTH & period_len));
918da7ee50b22b Guodong Xu       2025-08-15  751  		pdev->ops->set_desc_src_addr(&new->desc, dma_src);
918da7ee50b22b Guodong Xu       2025-08-15  752  		pdev->ops->set_desc_dst_addr(&new->desc, dma_dst);
50440d74aae318 Daniel Mack      2013-08-21  753  
50440d74aae318 Daniel Mack      2013-08-21  754  		if (!first)
50440d74aae318 Daniel Mack      2013-08-21  755  			first = new;
50440d74aae318 Daniel Mack      2013-08-21  756  		else
918da7ee50b22b Guodong Xu       2025-08-15  757  			pdev->ops->set_desc_next_addr(&prev->desc,
918da7ee50b22b Guodong Xu       2025-08-15  758  						      new->async_tx.phys);
50440d74aae318 Daniel Mack      2013-08-21  759  
50440d74aae318 Daniel Mack      2013-08-21  760  		new->async_tx.cookie = 0;
50440d74aae318 Daniel Mack      2013-08-21  761  		async_tx_ack(&new->async_tx);
50440d74aae318 Daniel Mack      2013-08-21  762  
50440d74aae318 Daniel Mack      2013-08-21  763  		prev = new;
50440d74aae318 Daniel Mack      2013-08-21  764  		len -= period_len;
50440d74aae318 Daniel Mack      2013-08-21  765  
50440d74aae318 Daniel Mack      2013-08-21  766  		if (chan->dir == DMA_MEM_TO_DEV)
50440d74aae318 Daniel Mack      2013-08-21  767  			dma_src += period_len;
50440d74aae318 Daniel Mack      2013-08-21  768  		else
50440d74aae318 Daniel Mack      2013-08-21  769  			dma_dst += period_len;
50440d74aae318 Daniel Mack      2013-08-21  770  
50440d74aae318 Daniel Mack      2013-08-21  771  		/* Insert the link descriptor to the LD ring */
50440d74aae318 Daniel Mack      2013-08-21  772  		list_add_tail(&new->node, &first->tx_list);
50440d74aae318 Daniel Mack      2013-08-21  773  	} while (len);
50440d74aae318 Daniel Mack      2013-08-21  774  
50440d74aae318 Daniel Mack      2013-08-21  775  	first->async_tx.flags = flags; /* client is in control of this ack */
50440d74aae318 Daniel Mack      2013-08-21  776  	first->async_tx.cookie = -EBUSY;
50440d74aae318 Daniel Mack      2013-08-21  777  
50440d74aae318 Daniel Mack      2013-08-21  778  	/* make the cyclic link */
918da7ee50b22b Guodong Xu       2025-08-15  779  	pdev->ops->set_desc_next_addr(&new->desc, first->async_tx.phys);
50440d74aae318 Daniel Mack      2013-08-21  780  	chan->cyclic_first = first;
50440d74aae318 Daniel Mack      2013-08-21  781  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  782  	return &first->async_tx;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  783  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  784  fail:
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  785  	if (first)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  786  		mmp_pdma_free_desc_list(chan, &first->tx_list);
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  787  	return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  788  }
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  789  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
