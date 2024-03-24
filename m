Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF002CA4
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Mar 2024 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711270895; cv=none; b=tqhwnrkDzHbYH0L61LnCcADT++qVtazA6VnGGWaF9pb0+Luq29ngVPvWBMm1zQmWj5hVcebp71NtmDaf8JXYX6VrEweBPwTOyBC5aMgLZVnm7KBHYhZtQgYSErVG2I6azEB4ZwVNKe6ZOR++P9wGC0O5OaSjnWLPNzrt+3EornY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711270895; c=relaxed/simple;
	bh=iS+z37/q14xxwcnLahaoKv/00+uKZzYXw13fM2hdb7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rc3lIk/ieohphuc7t+N+npwIXRcODbv9YMqrnXPoYGivOPlblsaIRSt3ntYUYmWEVYgEHmeFwYAVpby9c2B7N3KBWvIJ8LsE9Bm05AvhC/MnDTjLXX6rF19XfFz1SGsDPYEsj3uDOoFT2JIOIewKrCUTxQo3qpUTJNJ4ywWRvvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQskhfj3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQskhfj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711270893; x=1742806893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iS+z37/q14xxwcnLahaoKv/00+uKZzYXw13fM2hdb7E=;
  b=SQskhfj3LnxBONUqGuqawAw2AKjP08NJMlzXglqltiSgZ0gxMMUAlzUp
   T57N8dF3x5rlnAdG/L50YooNcVuhgSwVr4JgIfdlCsM4F5dgkkDWut29q
   Q0FrJKjBJ6eF595LjlWESPXNA4DU5Y5oAD1Xcg8ijpp7qnzHgYWHpPXBi
   qvmf8Am8zL1Phs4LlaeEUBKSJT5Xy9styVMztqSzXR1EAlwtRJH0m1Kka
   vjDRy0N8+YJw19Xb1Lf49pAOBBohKKBwMqeL2a5+0r6Pea2kaXETok65L
   7OE1Ry3J72loY8TWZC8ihyAY7oyduqmrdGzGVlVur3A6zqgwOX5/NFs/7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="10068892"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="10068892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 02:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="15216374"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2024 02:01:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roJjL-000LjT-1n;
	Sun, 24 Mar 2024 09:01:27 +0000
Date: Sun, 24 Mar 2024 17:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mtd/nand/raw/marvell_nand.c:2870 marvell_nfc_init_dma()
 warn: Please consider using kzalloc instead of kmalloc
Message-ID: <202403241656.OBJEk2rO-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70293240c5ce675a67bfc48f419b093023b862b3
commit: 772dd0342727cc3c3b676b5d97c99708e75730a2 mm: enumerate all gfp flags
date:   3 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
config: xtensa-randconfig-r071-20240323 (https://download.01.org/0day-ci/archive/20240324/202403241656.OBJEk2rO-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403241656.OBJEk2rO-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/marvell_nand.c:2870 marvell_nfc_init_dma() warn: Please consider using kzalloc instead of kmalloc

vim +2870 drivers/mtd/nand/raw/marvell_nand.c

02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2819  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2820  static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2821  {
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2822  	struct platform_device *pdev = container_of(nfc->dev,
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2823  						    struct platform_device,
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2824  						    dev);
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2825  	struct dma_slave_config config = {};
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2826  	struct resource *r;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2827  	int ret;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2828  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2829  	if (!IS_ENABLED(CONFIG_PXA_DMA)) {
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2830  		dev_warn(nfc->dev,
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2831  			 "DMA not enabled in configuration\n");
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2832  		return -ENOTSUPP;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2833  	}
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2834  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2835  	ret = dma_set_mask_and_coherent(nfc->dev, DMA_BIT_MASK(32));
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2836  	if (ret)
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2837  		return ret;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2838  
cf9e2389482179 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2839  	nfc->dma_chan =	dma_request_chan(nfc->dev, "data");
cf9e2389482179 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2840  	if (IS_ERR(nfc->dma_chan)) {
cf9e2389482179 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2841  		ret = PTR_ERR(nfc->dma_chan);
cf9e2389482179 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2842  		nfc->dma_chan = NULL;
6ce92faeefc018 drivers/mtd/nand/raw/marvell_nand.c Krzysztof Kozlowski 2020-09-01  2843  		return dev_err_probe(nfc->dev, ret, "DMA channel request failed\n");
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2844  	}
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2845  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2846  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2847  	if (!r) {
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2848  		ret = -ENXIO;
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2849  		goto release_channel;
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2850  	}
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2851  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2852  	config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2853  	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2854  	config.src_addr = r->start + NDDB;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2855  	config.dst_addr = r->start + NDDB;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2856  	config.src_maxburst = 32;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2857  	config.dst_maxburst = 32;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2858  	ret = dmaengine_slave_config(nfc->dma_chan, &config);
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2859  	if (ret < 0) {
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2860  		dev_err(nfc->dev, "Failed to configure DMA channel\n");
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2861  		goto release_channel;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2862  	}
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2863  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2864  	/*
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2865  	 * DMA must act on length multiple of 32 and this length may be
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2866  	 * bigger than the destination buffer. Use this buffer instead
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2867  	 * for DMA transfers and then copy the desired amount of data to
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2868  	 * the provided buffer.
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2869  	 */
c495a9275eeca0 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-19 @2870  	nfc->dma_buf = kmalloc(MAX_CHUNK_SIZE, GFP_KERNEL | GFP_DMA);
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2871  	if (!nfc->dma_buf) {
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2872  		ret = -ENOMEM;
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2873  		goto release_channel;
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2874  	}
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2875  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2876  	nfc->use_dma = true;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2877  
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2878  	return 0;
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2879  
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2880  release_channel:
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2881  	dma_release_channel(nfc->dma_chan);
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2882  	nfc->dma_chan = NULL;
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2883  
aafe30baf4ad13 drivers/mtd/nand/raw/marvell_nand.c Peter Ujfalusi      2020-02-27  2884  	return ret;
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2885  }
02f26ecf8c7727 drivers/mtd/nand/marvell_nand.c     Miquel Raynal       2018-01-09  2886  

:::::: The code at line 2870 was first introduced by commit
:::::: c495a9275eeca0bbc9358de7200e58184e864aeb mtd: nand: marvell: Fix missing memory allocation modifier

:::::: TO: Miquel Raynal <miquel.raynal@free-electrons.com>
:::::: CC: Boris Brezillon <boris.brezillon@free-electrons.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
