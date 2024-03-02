Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D906FC3
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Mar 2024 02:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709345050; cv=none; b=j0MALepLZh9rXdtotvI2or64K76HyHuCX4xtvpJ0Y5SWT8gfGFOaUTvIoBwgIflb38i4x9nsX9I8+wy7Om9wGY1iddavdnvgx8RQVMm9hC07i9R/yMStd58O2ar7G6GW/eR56QBmjr/AguGrcqpTkb2p4s/NMWkdLYIGCsNYlng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709345050; c=relaxed/simple;
	bh=Q8623P948MY/AQshZvE4rGsTkq1dZc+H4S1AZ+wC6Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1UkS4mwe19hClszbYJHV2bpcAcNNML31AXGbyeZPrxDaGJZ4j8e0j2h9GuaYVBgpPqCLx9Xix2Up7M18uMYdNO2aMl2M5dtVgheMAT5ncFH1FoVUxqusmlT7LtUOHn/qdbmzvx8uat2696mbIoTpWWX83bIh4sRfvvlKlck8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmA+/dbh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmA+/dbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709345048; x=1740881048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q8623P948MY/AQshZvE4rGsTkq1dZc+H4S1AZ+wC6Oc=;
  b=kmA+/dbhnlmXQlxiM6odwYWtVsbrbm7Zya9Vgi1q7I7TW+oSIiJmoUWf
   HHakVl/YPsx5uOI0v4ILNKb9Ip0gwXIxLh4uURqvCeKki/vVF1i/Ed2Op
   s3MLvLcMBM2GgXgbJBl/ehzCTjs8YY+54yblQ+C7HzzCY+h4qhKPo2csd
   cVxvGQWfJuLCHbAvamxmZvsu6hdFzIbXg6jTSTeL6OyqakRrnoyEK583O
   7DF36eMITSOIInINp6jBfMN6cR1i7TLyyGClqUUNyTYPoEsNBXpnTweuY
   sv8HwN4O0GvvB+GcFbAQknWKxKcLLVcWT7uXKoStVe1PR13/fM9+U1WFK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="26367943"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="26367943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 18:04:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8803719"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2024 18:04:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgEjL-000EFD-2b;
	Sat, 02 Mar 2024 02:04:03 +0000
Date: Sat, 2 Mar 2024 10:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11037/11394] drivers/usb/dwc2/hcd.c:2418
 dwc2_alloc_split_dma_aligned_buf() warn: Please consider using
 kmem_cache_zalloc instead of kmem_cache_alloc
Message-ID: <202403020932.w14NIOOC-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: d9886d99439ab03c75e2a736e6bc37d45e3af95f [11037/11394] mm: enumerate all gfp flags
:::::: branch date: 20 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20240301 (https://download.01.org/0day-ci/archive/20240302/202403020932.w14NIOOC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403020932.w14NIOOC-lkp@intel.com/

smatch warnings:
drivers/usb/dwc2/hcd.c:2418 dwc2_alloc_split_dma_aligned_buf() warn: Please consider using kmem_cache_zalloc instead of kmem_cache_alloc
drivers/mtd/devices/mchp48l640.c:175 mchp48l640_write_page() warn: Please consider using kzalloc instead of kmalloc
drivers/mtd/devices/mchp48l640.c:243 mchp48l640_read_page() warn: Please consider using kzalloc instead of kmalloc

vim +2418 drivers/usb/dwc2/hcd.c

3bc04e28a030a8b Douglas Anderson 2016-01-28  2408  
af424a410749ed7 William Wu       2018-05-11  2409  static int dwc2_alloc_split_dma_aligned_buf(struct dwc2_hsotg *hsotg,
af424a410749ed7 William Wu       2018-05-11  2410  					    struct dwc2_qh *qh,
af424a410749ed7 William Wu       2018-05-11  2411  					    struct dwc2_host_chan *chan)
af424a410749ed7 William Wu       2018-05-11  2412  {
af424a410749ed7 William Wu       2018-05-11  2413  	if (!hsotg->unaligned_cache ||
af424a410749ed7 William Wu       2018-05-11  2414  	    chan->max_packet > DWC2_KMEM_UNALIGNED_BUF_SIZE)
af424a410749ed7 William Wu       2018-05-11  2415  		return -ENOMEM;
af424a410749ed7 William Wu       2018-05-11  2416  
af424a410749ed7 William Wu       2018-05-11  2417  	if (!qh->dw_align_buf) {
af424a410749ed7 William Wu       2018-05-11 @2418  		qh->dw_align_buf = kmem_cache_alloc(hsotg->unaligned_cache,
af424a410749ed7 William Wu       2018-05-11  2419  						    GFP_ATOMIC | GFP_DMA);
af424a410749ed7 William Wu       2018-05-11  2420  		if (!qh->dw_align_buf)
af424a410749ed7 William Wu       2018-05-11  2421  			return -ENOMEM;
af424a410749ed7 William Wu       2018-05-11  2422  	}
af424a410749ed7 William Wu       2018-05-11  2423  
af424a410749ed7 William Wu       2018-05-11  2424  	qh->dw_align_buf_dma = dma_map_single(hsotg->dev, qh->dw_align_buf,
af424a410749ed7 William Wu       2018-05-11  2425  					      DWC2_KMEM_UNALIGNED_BUF_SIZE,
af424a410749ed7 William Wu       2018-05-11  2426  					      DMA_FROM_DEVICE);
af424a410749ed7 William Wu       2018-05-11  2427  
af424a410749ed7 William Wu       2018-05-11  2428  	if (dma_mapping_error(hsotg->dev, qh->dw_align_buf_dma)) {
af424a410749ed7 William Wu       2018-05-11  2429  		dev_err(hsotg->dev, "can't map align_buf\n");
af424a410749ed7 William Wu       2018-05-11  2430  		chan->align_buf = 0;
af424a410749ed7 William Wu       2018-05-11  2431  		return -EINVAL;
af424a410749ed7 William Wu       2018-05-11  2432  	}
af424a410749ed7 William Wu       2018-05-11  2433  
af424a410749ed7 William Wu       2018-05-11  2434  	chan->align_buf = qh->dw_align_buf_dma;
af424a410749ed7 William Wu       2018-05-11  2435  	return 0;
af424a410749ed7 William Wu       2018-05-11  2436  }
af424a410749ed7 William Wu       2018-05-11  2437  

:::::: The code at line 2418 was first introduced by commit
:::::: af424a410749ed7e0c2bffd3cedbc7c274d0ff6f usb: dwc2: alloc dma aligned buffer for isoc split in

:::::: TO: William Wu <william.wu@rock-chips.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
