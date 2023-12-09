Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A79156EC
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnJ2XdLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702133984; x=1733669984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOIY/M/ihxqia5JGgs/+FHBpG82o/DunjQI78pRcKWI=;
  b=YnJ2XdLq95EaulhduppQ6qY3nS25NdnG4pJCzw3zSUar4D8tRkTNT4qA
   AdX4tTFcc/a0/MJ1roRdjYA3cRsSU/5hFhcjmvGVUrShHbtERCOHhFVwj
   ABfVscsRKWZ4Zv6uzVRuuyu+6Dv2ZMPsAJLkBSQB4NNVfNsN9GcAT0vV4
   G+mcCICBWSslER2kIDUPa9jl3bsS2xxsu9+jQ7GpltOFFhNM+Ilnz0EGj
   qIjXWFIkFgLlLlMjTAbI041hqgWzxfsasBjSSZHZviievK1lbtkGM+9d5
   yPv14rBuP0QoLV3CL8tadBrwU6/nKAgSPfjXHmDUTSpcb8VCWadAydNB7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374023190"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="374023190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 06:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="20437630"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Dec 2023 06:59:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBynp-000FT3-13;
	Sat, 09 Dec 2023 14:59:37 +0000
Date: Sat, 9 Dec 2023 22:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: io_uring/kbuf.c:458 io_register_pbuf_ring() warn: comparison of a
 potentially tagged address (io_register_pbuf_ring, -2, reg.ring_addr)
Message-ID: <202312092223.ToTy1ant-lkp@intel.com>
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
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 3b77495a97239faa27989f946d29b6be7dd091e9 io_uring: split provided buffers handling into its own file
date:   1 year, 5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 5 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231209/202312092223.ToTy1ant-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312092223.ToTy1ant-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312092223.ToTy1ant-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
