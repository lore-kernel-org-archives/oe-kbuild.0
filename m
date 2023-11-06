Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3D92C86F
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqB0nao4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699294775; x=1730830775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tCs3K7ChBdYvUd1XB+VY9m0OplKrpl+R088rUUId40=;
  b=WqB0nao4szpzGzx70535dngwrb3RPklUZNzyBYaBB8gRs10I6+k7srx4
   rpHoetwpE7oXa5VN7pdzYnS3NJYS8Lq/Ri1GFYL3HYI8o/4SaL511DYAi
   xtJRTLOXz6CDpi0vPxpF1wQapOYTBTc3lNWObBaGyogwafNSQ59+QJnjY
   b4Ym15DgZeDGAOWmtzV/zJaTOQZabl18LqNQE8eSb/+3Os5p0DI06N4nK
   as++b6rbBjEgR8VDX49u8QP/J5Sgv2y4MwzWFGiaeo9XDMoQrhT41wiMo
   FFIxaVcT1c/w0EKJOuMmohBaGMr8VuGT9JF9sHSBxRvw0QUkQJFgM/Cg/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2328435"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="2328435"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 10:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="935870417"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="935870417"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Nov 2023 10:19:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r04CB-0006dQ-0z;
	Mon, 06 Nov 2023 18:19:31 +0000
Date: Tue, 7 Nov 2023 02:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or
 member 'msu_base' not described in 'msc'
Message-ID: <202311070100.aVGO5Ve3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: aac8da65174a35749fcf21dbca4c1be314b562b5 intel_th: msu: Start handling IRQs
date:   4 years, 6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 years, 6 months ago
config: x86_64-randconfig-r054-20230808 (https://download.01.org/0day-ci/archive/20231107/202311070100.aVGO5Ve3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070100.aVGO5Ve3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311070100.aVGO5Ve3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c:54: warning: Function parameter or member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:96: warning: bad line: 
>> drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or member 'msu_base' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or member 'iter_list' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or member 'do_irq' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:966: warning: Function parameter or member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:966: warning: Function parameter or member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:966: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'


vim +131 drivers/hwtracing/intel_th/msu.c

ba82664c134ef7 Alexander Shishkin 2015-09-22   40  
ba82664c134ef7 Alexander Shishkin 2015-09-22   41  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   42   * struct msc_window - multiblock mode window descriptor
ba82664c134ef7 Alexander Shishkin 2015-09-22   43   * @entry:	window list linkage (msc::win_list)
ba82664c134ef7 Alexander Shishkin 2015-09-22   44   * @pgoff:	page offset into the buffer that this window starts at
ba82664c134ef7 Alexander Shishkin 2015-09-22   45   * @nr_blocks:	number of blocks (pages) in this window
ba82664c134ef7 Alexander Shishkin 2015-09-22   46   * @block:	array of block descriptors
ba82664c134ef7 Alexander Shishkin 2015-09-22   47   */
ba82664c134ef7 Alexander Shishkin 2015-09-22   48  struct msc_window {
ba82664c134ef7 Alexander Shishkin 2015-09-22   49  	struct list_head	entry;
ba82664c134ef7 Alexander Shishkin 2015-09-22   50  	unsigned long		pgoff;
ba82664c134ef7 Alexander Shishkin 2015-09-22   51  	unsigned int		nr_blocks;
ba82664c134ef7 Alexander Shishkin 2015-09-22   52  	struct msc		*msc;
ba82664c134ef7 Alexander Shishkin 2015-09-22   53  	struct msc_block	block[0];
ba82664c134ef7 Alexander Shishkin 2015-09-22  @54  };
ba82664c134ef7 Alexander Shishkin 2015-09-22   55  
ba82664c134ef7 Alexander Shishkin 2015-09-22   56  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   57   * struct msc_iter - iterator for msc buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   58   * @entry:		msc::iter_list linkage
ba82664c134ef7 Alexander Shishkin 2015-09-22   59   * @msc:		pointer to the MSC device
ba82664c134ef7 Alexander Shishkin 2015-09-22   60   * @start_win:		oldest window
ba82664c134ef7 Alexander Shishkin 2015-09-22   61   * @win:		current window
ba82664c134ef7 Alexander Shishkin 2015-09-22   62   * @offset:		current logical offset into the buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   63   * @start_block:	oldest block in the window
ba82664c134ef7 Alexander Shishkin 2015-09-22   64   * @block:		block number in the window
ba82664c134ef7 Alexander Shishkin 2015-09-22   65   * @block_off:		offset into current block
ba82664c134ef7 Alexander Shishkin 2015-09-22   66   * @wrap_count:		block wrapping handling
ba82664c134ef7 Alexander Shishkin 2015-09-22   67   * @eof:		end of buffer reached
ba82664c134ef7 Alexander Shishkin 2015-09-22   68   */
ba82664c134ef7 Alexander Shishkin 2015-09-22   69  struct msc_iter {
ba82664c134ef7 Alexander Shishkin 2015-09-22   70  	struct list_head	entry;
ba82664c134ef7 Alexander Shishkin 2015-09-22   71  	struct msc		*msc;
ba82664c134ef7 Alexander Shishkin 2015-09-22   72  	struct msc_window	*start_win;
ba82664c134ef7 Alexander Shishkin 2015-09-22   73  	struct msc_window	*win;
ba82664c134ef7 Alexander Shishkin 2015-09-22   74  	unsigned long		offset;
ba82664c134ef7 Alexander Shishkin 2015-09-22   75  	int			start_block;
ba82664c134ef7 Alexander Shishkin 2015-09-22   76  	int			block;
ba82664c134ef7 Alexander Shishkin 2015-09-22   77  	unsigned int		block_off;
ba82664c134ef7 Alexander Shishkin 2015-09-22   78  	unsigned int		wrap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22   79  	unsigned int		eof;
ba82664c134ef7 Alexander Shishkin 2015-09-22   80  };
ba82664c134ef7 Alexander Shishkin 2015-09-22   81  
ba82664c134ef7 Alexander Shishkin 2015-09-22   82  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   83   * struct msc - MSC device representation
ba82664c134ef7 Alexander Shishkin 2015-09-22   84   * @reg_base:		register window base address
ba82664c134ef7 Alexander Shishkin 2015-09-22   85   * @thdev:		intel_th_device pointer
ba82664c134ef7 Alexander Shishkin 2015-09-22   86   * @win_list:		list of windows in multiblock mode
4e0eaf239fb33e Alexander Shishkin 2019-05-03   87   * @single_sgt:		single mode buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   88   * @nr_pages:		total number of pages allocated for this buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   89   * @single_sz:		amount of data in single mode
ba82664c134ef7 Alexander Shishkin 2015-09-22   90   * @single_wrap:	single mode wrap occurred
ba82664c134ef7 Alexander Shishkin 2015-09-22   91   * @base:		buffer's base pointer
ba82664c134ef7 Alexander Shishkin 2015-09-22   92   * @base_addr:		buffer's base address
ba82664c134ef7 Alexander Shishkin 2015-09-22   93   * @user_count:		number of users of the buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   94   * @mmap_count:		number of mappings
ba82664c134ef7 Alexander Shishkin 2015-09-22   95   * @buf_mutex:		mutex to serialize access to buffer-related bits
ba82664c134ef7 Alexander Shishkin 2015-09-22   96  
ba82664c134ef7 Alexander Shishkin 2015-09-22   97   * @enabled:		MSC is enabled
ba82664c134ef7 Alexander Shishkin 2015-09-22   98   * @wrap:		wrapping is enabled
ba82664c134ef7 Alexander Shishkin 2015-09-22   99   * @mode:		MSC operating mode
ba82664c134ef7 Alexander Shishkin 2015-09-22  100   * @burst_len:		write burst length
ba82664c134ef7 Alexander Shishkin 2015-09-22  101   * @index:		number of this MSC in the MSU
ba82664c134ef7 Alexander Shishkin 2015-09-22  102   */
ba82664c134ef7 Alexander Shishkin 2015-09-22  103  struct msc {
ba82664c134ef7 Alexander Shishkin 2015-09-22  104  	void __iomem		*reg_base;
aac8da65174a35 Alexander Shishkin 2019-05-03  105  	void __iomem		*msu_base;
ba82664c134ef7 Alexander Shishkin 2015-09-22  106  	struct intel_th_device	*thdev;
ba82664c134ef7 Alexander Shishkin 2015-09-22  107  
ba82664c134ef7 Alexander Shishkin 2015-09-22  108  	struct list_head	win_list;
4e0eaf239fb33e Alexander Shishkin 2019-05-03  109  	struct sg_table		single_sgt;
ba82664c134ef7 Alexander Shishkin 2015-09-22  110  	unsigned long		nr_pages;
ba82664c134ef7 Alexander Shishkin 2015-09-22  111  	unsigned long		single_sz;
ba82664c134ef7 Alexander Shishkin 2015-09-22  112  	unsigned int		single_wrap : 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  113  	void			*base;
ba82664c134ef7 Alexander Shishkin 2015-09-22  114  	dma_addr_t		base_addr;
ba82664c134ef7 Alexander Shishkin 2015-09-22  115  
ba82664c134ef7 Alexander Shishkin 2015-09-22  116  	/* <0: no buffer, 0: no users, >0: active users */
ba82664c134ef7 Alexander Shishkin 2015-09-22  117  	atomic_t		user_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  118  
ba82664c134ef7 Alexander Shishkin 2015-09-22  119  	atomic_t		mmap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  120  	struct mutex		buf_mutex;
ba82664c134ef7 Alexander Shishkin 2015-09-22  121  
ba82664c134ef7 Alexander Shishkin 2015-09-22  122  	struct list_head	iter_list;
ba82664c134ef7 Alexander Shishkin 2015-09-22  123  
ba82664c134ef7 Alexander Shishkin 2015-09-22  124  	/* config */
ba82664c134ef7 Alexander Shishkin 2015-09-22  125  	unsigned int		enabled : 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  126  				wrap	: 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  127  				do_irq	: 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  128  	unsigned int		mode;
ba82664c134ef7 Alexander Shishkin 2015-09-22  129  	unsigned int		burst_len;
ba82664c134ef7 Alexander Shishkin 2015-09-22  130  	unsigned int		index;
ba82664c134ef7 Alexander Shishkin 2015-09-22 @131  };
ba82664c134ef7 Alexander Shishkin 2015-09-22  132  

:::::: The code at line 131 was first introduced by commit
:::::: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
