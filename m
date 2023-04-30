Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B25668
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 22:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682892889; x=1714428889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=se3OCmMv/v17hTeMRBbeTEYKT1LXJrC2vNOyNJS5sl4=;
  b=ZxmNJIgpF35XYh9imKgDDpg5I3t/9ugSB//Rl+3o5o6kvqBqCpnywubi
   rWaxJ4Aq8ucZkXoiOe+KNCf/9lGxJESamTWohx4nVqkGgXImpqMNCPaH/
   bD84tbEPyRORVipPzbwRwZBUMuz8fVf3WGrc6lJ0orbiliTu+gPzzelbA
   Kyod1noN/uLjALbxht6n304vwITW+HF35ZKLKSoCrEOeFEyKG6sVG1g/W
   PJSTz1nOuXsmNYD6D5LD2DmnYM+SJsGsPEFgt3yu7rwFe4P5BagsQCh4A
   LM4/RKjTpWQ5YMcXjYVjZQJagNgkKcPfY+3411L4p7GrZR/9eJh/G/I6R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350118721"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350118721"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 15:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="698346020"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="698346020"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Apr 2023 15:14:47 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptFJe-00009l-2B;
	Sun, 30 Apr 2023 22:14:46 +0000
Date: Mon, 1 May 2023 06:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: io_uring/kbuf.c:458 io_register_pbuf_ring() warn: comparison of a
 potentially tagged address (io_register_pbuf_ring, -2, reg.ring_addr)
Message-ID: <202305010641.IGzdAs0t-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
commit: 3b77495a97239faa27989f946d29b6be7dd091e9 io_uring: split provided buffers handling into its own file
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230501/202305010641.IGzdAs0t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305010641.IGzdAs0t-lkp@intel.com/

smatch warnings:
io_uring/kbuf.c:458 io_register_pbuf_ring() warn: comparison of a potentially tagged address (io_register_pbuf_ring, -2, reg.ring_addr)

vim +458 io_uring/kbuf.c

3b77495a97239f Jens Axboe 2022-06-13  442  
3b77495a97239f Jens Axboe 2022-06-13  443  int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
3b77495a97239f Jens Axboe 2022-06-13  444  {
3b77495a97239f Jens Axboe 2022-06-13  445  	struct io_uring_buf_ring *br;
3b77495a97239f Jens Axboe 2022-06-13  446  	struct io_uring_buf_reg reg;
3b77495a97239f Jens Axboe 2022-06-13  447  	struct io_buffer_list *bl, *free_bl = NULL;
3b77495a97239f Jens Axboe 2022-06-13  448  	struct page **pages;
3b77495a97239f Jens Axboe 2022-06-13  449  	int nr_pages;
3b77495a97239f Jens Axboe 2022-06-13  450  
3b77495a97239f Jens Axboe 2022-06-13  451  	if (copy_from_user(&reg, arg, sizeof(reg)))
3b77495a97239f Jens Axboe 2022-06-13  452  		return -EFAULT;
3b77495a97239f Jens Axboe 2022-06-13  453  
3b77495a97239f Jens Axboe 2022-06-13  454  	if (reg.pad || reg.resv[0] || reg.resv[1] || reg.resv[2])
3b77495a97239f Jens Axboe 2022-06-13  455  		return -EINVAL;
3b77495a97239f Jens Axboe 2022-06-13  456  	if (!reg.ring_addr)
3b77495a97239f Jens Axboe 2022-06-13  457  		return -EFAULT;
3b77495a97239f Jens Axboe 2022-06-13 @458  	if (reg.ring_addr & ~PAGE_MASK)
3b77495a97239f Jens Axboe 2022-06-13  459  		return -EINVAL;
3b77495a97239f Jens Axboe 2022-06-13  460  	if (!is_power_of_2(reg.ring_entries))
3b77495a97239f Jens Axboe 2022-06-13  461  		return -EINVAL;
3b77495a97239f Jens Axboe 2022-06-13  462  
3b77495a97239f Jens Axboe 2022-06-13  463  	/* cannot disambiguate full vs empty due to head/tail size */
3b77495a97239f Jens Axboe 2022-06-13  464  	if (reg.ring_entries >= 65536)
3b77495a97239f Jens Axboe 2022-06-13  465  		return -EINVAL;
3b77495a97239f Jens Axboe 2022-06-13  466  
3b77495a97239f Jens Axboe 2022-06-13  467  	if (unlikely(reg.bgid < BGID_ARRAY && !ctx->io_bl)) {
3b77495a97239f Jens Axboe 2022-06-13  468  		int ret = io_init_bl_list(ctx);
3b77495a97239f Jens Axboe 2022-06-13  469  		if (ret)
3b77495a97239f Jens Axboe 2022-06-13  470  			return ret;
3b77495a97239f Jens Axboe 2022-06-13  471  	}
3b77495a97239f Jens Axboe 2022-06-13  472  
3b77495a97239f Jens Axboe 2022-06-13  473  	bl = io_buffer_get_list(ctx, reg.bgid);
3b77495a97239f Jens Axboe 2022-06-13  474  	if (bl) {
3b77495a97239f Jens Axboe 2022-06-13  475  		/* if mapped buffer ring OR classic exists, don't allow */
3b77495a97239f Jens Axboe 2022-06-13  476  		if (bl->buf_nr_pages || !list_empty(&bl->buf_list))
3b77495a97239f Jens Axboe 2022-06-13  477  			return -EEXIST;
3b77495a97239f Jens Axboe 2022-06-13  478  	} else {
3b77495a97239f Jens Axboe 2022-06-13  479  		free_bl = bl = kzalloc(sizeof(*bl), GFP_KERNEL);
3b77495a97239f Jens Axboe 2022-06-13  480  		if (!bl)
3b77495a97239f Jens Axboe 2022-06-13  481  			return -ENOMEM;
3b77495a97239f Jens Axboe 2022-06-13  482  	}
3b77495a97239f Jens Axboe 2022-06-13  483  
3b77495a97239f Jens Axboe 2022-06-13  484  	pages = io_pin_pages(reg.ring_addr,
3b77495a97239f Jens Axboe 2022-06-13  485  			     struct_size(br, bufs, reg.ring_entries),
3b77495a97239f Jens Axboe 2022-06-13  486  			     &nr_pages);
3b77495a97239f Jens Axboe 2022-06-13  487  	if (IS_ERR(pages)) {
3b77495a97239f Jens Axboe 2022-06-13  488  		kfree(free_bl);
3b77495a97239f Jens Axboe 2022-06-13  489  		return PTR_ERR(pages);
3b77495a97239f Jens Axboe 2022-06-13  490  	}
3b77495a97239f Jens Axboe 2022-06-13  491  
3b77495a97239f Jens Axboe 2022-06-13  492  	br = page_address(pages[0]);
3b77495a97239f Jens Axboe 2022-06-13  493  	bl->buf_pages = pages;
3b77495a97239f Jens Axboe 2022-06-13  494  	bl->buf_nr_pages = nr_pages;
3b77495a97239f Jens Axboe 2022-06-13  495  	bl->nr_entries = reg.ring_entries;
3b77495a97239f Jens Axboe 2022-06-13  496  	bl->buf_ring = br;
3b77495a97239f Jens Axboe 2022-06-13  497  	bl->mask = reg.ring_entries - 1;
3b77495a97239f Jens Axboe 2022-06-13  498  	io_buffer_add_list(ctx, bl, reg.bgid);
3b77495a97239f Jens Axboe 2022-06-13  499  	return 0;
3b77495a97239f Jens Axboe 2022-06-13  500  }
3b77495a97239f Jens Axboe 2022-06-13  501  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
