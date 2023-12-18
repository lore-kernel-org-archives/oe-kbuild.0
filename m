Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6535228
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 03:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lv+6eu/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702871421; x=1734407421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Xk3XLnVu2nutChgkGbsxBkRZQQFUnaruKxn1W5dVn0=;
  b=Lv+6eu/mgKh7SHGKxEfI141qEoHt++i4bodnkjTX3hsm7iIZ75/0sZBd
   1BxBZKsw7IbyPOc0Z+DltY00ycww84+RA3hsbgVbp1QZF40o0WeyoqK5r
   3eKAXtaY7hrBT4rwXMQxrRNuFUmYUBSqNJbXKHQi/K4Az/tZQJ77/7xWW
   HmCxACvQjw1Z9+VeFSmtjfaqfs4nuJF5iXNAYf7pO3eRF10dOZfrqeR7B
   NK8iB/zu3vcmJVUi6uERMt6E6PaExj8zBVOBtIsBnLgtp3fyLP3wSR2f6
   4WqhvPAtKS3SX/FwbPDQel2LNiqpqe5PGRgaVe0B1j66QeV0vtv09KlGD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="459777116"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="459777116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 19:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="725165223"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="725165223"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Dec 2023 19:50:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF4e1-0003jJ-2j;
	Mon, 18 Dec 2023 03:50:17 +0000
Date: Mon, 18 Dec 2023 11:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/dma/at_hdmac.c:243: warning: Excess struct member 'sg'
 description in 'at_desc'
Message-ID: <202312181103.SGoIv7HS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ceb6a6f023fd3e8b07761ed900352ef574010bcb
commit: 81cd3cb3b3dd37df1fc45c5b6443a07bc2a7fee4 dmaengine: at_hdmac: Annotate struct at_desc with __counted_by
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231218/202312181103.SGoIv7HS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181103.SGoIv7HS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312181103.SGoIv7HS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/at_hdmac.c:243: warning: Function parameter or member 'sglen' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or member 'boundary' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or member 'dst_hole' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or member 'src_hole' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or member 'memset_buffer' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or member 'memset_paddr' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Function parameter or member 'memset_vaddr' not described in 'at_desc'
   drivers/dma/at_hdmac.c:243: warning: Excess struct member 'sg_len' description in 'at_desc'
>> drivers/dma/at_hdmac.c:243: warning: Excess struct member 'sg' description in 'at_desc'
   drivers/dma/at_hdmac.c:252: warning: cannot understand function prototype: 'enum atc_status '
   drivers/dma/at_hdmac.c:287: warning: Function parameter or member 'cyclic' not described in 'at_dma_chan'
   drivers/dma/at_hdmac.c:351: warning: Function parameter or member 'regs' not described in 'at_dma'
   drivers/dma/at_hdmac.c:351: warning: Function parameter or member 'memset_pool' not described in 'at_dma'
   drivers/dma/at_hdmac.c:351: warning: Excess struct member 'atdma_devtype' description in 'at_dma'
   drivers/dma/at_hdmac.c:351: warning: Excess struct member 'ch_regs' description in 'at_dma'


vim +243 drivers/dma/at_hdmac.c

ac803b56860f65 Tudor Ambarus 2022-10-25  219  
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  220  /**
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  221   * struct at_desc - software descriptor
ac803b56860f65 Tudor Ambarus 2022-10-25  222   * @vd: pointer to the virtual dma descriptor.
ac803b56860f65 Tudor Ambarus 2022-10-25  223   * @atchan: pointer to the atmel dma channel.
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  224   * @total_len: total transaction byte count
ac803b56860f65 Tudor Ambarus 2022-10-25  225   * @sg_len: number of sg entries.
ac803b56860f65 Tudor Ambarus 2022-10-25  226   * @sg: array of sgs.
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  227   */
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  228  struct at_desc {
ac803b56860f65 Tudor Ambarus 2022-10-25  229  	struct				virt_dma_desc vd;
ac803b56860f65 Tudor Ambarus 2022-10-25  230  	struct				at_dma_chan *atchan;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  231  	size_t				total_len;
ac803b56860f65 Tudor Ambarus 2022-10-25  232  	unsigned int			sglen;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  233  	/* Interleaved data */
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  234  	size_t				boundary;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  235  	size_t				dst_hole;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  236  	size_t				src_hole;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  237  
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  238  	/* Memset temporary buffer */
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  239  	bool				memset_buffer;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  240  	dma_addr_t			memset_paddr;
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  241  	int				*memset_vaddr;
81cd3cb3b3dd37 Kees Cook     2023-08-17  242  	struct atdma_sg			sg[] __counted_by(sglen);
5cecadc3e2a4fb Tudor Ambarus 2022-10-25 @243  };
5cecadc3e2a4fb Tudor Ambarus 2022-10-25  244  

:::::: The code at line 243 was first introduced by commit
:::::: 5cecadc3e2a4fb72ab37d9420df0a9e1179b8a3e dmaengine: at_hdmac: Keep register definitions and structures private to at_hdmac.c

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
