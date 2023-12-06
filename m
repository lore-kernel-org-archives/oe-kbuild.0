Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1DF5697
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhjZGo0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701829580; x=1733365580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C4v8cxEI23wdX6XbXOIqbX66g7QhVib2367zRGSFpLc=;
  b=EhjZGo0V+0aINvXnRYTUwndXhwRhG1z9yVnvQk5sGNIxdAtxAEUAIary
   dBk+ZSm7iavTqZMo/RGZapolNut7lUh4ZNecj48IE682Q3HmkcOLboN+x
   KgDW+drQTZ1ahePsiZkGOxgmMiCmSHwX0JQTtr6AR4cFURAAU8OTukMDq
   8Dsaj1jTWPZUhoHUWaC0AdPH+wSWMJt3vDvwZqWe7EFDYPZJHyi7JjY9V
   9Ih6dRyvyYjEEk9A9hGWUyYgZkJ49bDxAmagRSvYgyR9NzkVYfXkogebI
   icgbX9BAUozxhcJTXUaWM/8hJwon/O1leWFfhUqY3Ddhcr7yMSecf3zfD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384396862"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="384396862"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:26:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018415936"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1018415936"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 18:26:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhc6-000A5K-30;
	Wed, 06 Dec 2023 02:26:14 +0000
Date: Wed, 6 Dec 2023 10:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: io_uring/kbuf.c:766 io_pbuf_get_address() warn: variable
 dereferenced before check 'bl' (see line 764)
Message-ID: <202312061050.HE448Ovb-lkp@intel.com>
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
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 5cf4f52e6d8aa2d3b7728f568abbf9d42a3af252 io_uring: free io_buffer_list entries via RCU
date:   7 days ago
:::::: branch date: 28 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20231202 (https://download.01.org/0day-ci/archive/20231206/202312061050.HE448Ovb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061050.HE448Ovb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312061050.HE448Ovb-lkp@intel.com/

smatch warnings:
io_uring/kbuf.c:766 io_pbuf_get_address() warn: variable dereferenced before check 'bl' (see line 764)

vim +/bl +766 io_uring/kbuf.c

c56e022c0a2714 Jens Axboe 2023-03-14  752  
c56e022c0a2714 Jens Axboe 2023-03-14  753  void *io_pbuf_get_address(struct io_ring_ctx *ctx, unsigned long bgid)
c56e022c0a2714 Jens Axboe 2023-03-14  754  {
c56e022c0a2714 Jens Axboe 2023-03-14  755  	struct io_buffer_list *bl;
c56e022c0a2714 Jens Axboe 2023-03-14  756  
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  757  	bl = __io_buffer_get_list(ctx, smp_load_acquire(&ctx->io_bl), bgid);
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  758  
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  759  	/*
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  760  	 * Ensure the list is fully setup. Only strictly needed for RCU lookup
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  761  	 * via mmap, and in that case only for the array indexed groups. For
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  762  	 * the xarray lookups, it's either visible and ready, or not at all.
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  763  	 */
5cf4f52e6d8aa2 Jens Axboe 2023-11-27 @764  	if (!smp_load_acquire(&bl->is_ready))
5cf4f52e6d8aa2 Jens Axboe 2023-11-27  765  		return NULL;
c56e022c0a2714 Jens Axboe 2023-03-14 @766  	if (!bl || !bl->is_mmap)
c56e022c0a2714 Jens Axboe 2023-03-14  767  		return NULL;
c56e022c0a2714 Jens Axboe 2023-03-14  768  
c56e022c0a2714 Jens Axboe 2023-03-14  769  	return bl->buf_ring;
c56e022c0a2714 Jens Axboe 2023-03-14  770  }
c392cbecd8eca4 Jens Axboe 2023-11-27  771  

:::::: The code at line 766 was first introduced by commit
:::::: c56e022c0a27142b7b59ae6bdf45f86bf4b298a1 io_uring: add support for user mapped provided buffer ring

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
