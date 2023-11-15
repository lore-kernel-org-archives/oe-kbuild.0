Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4D3A8F1
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 23:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrbLPxLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700091808; x=1731627808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVikp8R/DEdfgM7T7lt1ZotYMcyVP7H3TN9ln5trxiM=;
  b=OrbLPxLLOgn0NtOjfNQjkjMxZDjWMxix5iw7M7Zi/ofRC5zBWiW3+tjJ
   deGV2UR/7GbZOOxiUP8H7JemFWmOj97GhnMPeW+Fxc0s5oVg7ZVLlrSkk
   ZqUNBOa2/a4Fqdc0RjIWFV0WYHQ2dKHuGqAMK5ZHTCKvEDhfXpDmUMHcU
   oBhPFNYRqEdOfKP6DNndVRyQqZ2hc8rEcFACYcb50PnteJ2WKp09Me+9e
   DhOW6GlMqLFgZ4rAT3+7yHXZ1Obq+2jS6h/OdvJPh0gQ6jJ+duyEBdSNr
   IJHkwlly6Q5Kut4MdyyEJXLbV9t3nEdE6K99/j+0kZATsGsIekDOXQ/N4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455269536"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="455269536"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 15:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768740462"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="768740462"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2023 15:43:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3PXX-0000yx-0r;
	Wed, 15 Nov 2023 23:43:23 +0000
Date: Thu, 16 Nov 2023 07:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwtracing/intel_th/msu.c:60: warning: Function parameter or
 member 'msc' not described in 'msc_window'
Message-ID: <202311160709.39OzBNLo-lkp@intel.com>
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
CC: Laurent Fert <laurent.fert@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver
date:   8 years ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 years ago
config: x86_64-randconfig-x011-20230813 (https://download.01.org/0day-ci/archive/20231116/202311160709.39OzBNLo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160709.39OzBNLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160709.39OzBNLo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:17,
                    from drivers/hwtracing/intel_th/msu.c:19:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:428:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     428 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/hwtracing/intel_th/msu.c: At top level:
   include/linux/module.h:130:13: warning: 'init_module' specifies less restrictive attribute than its target 'intel_th_msc_driver_init': 'cold' [-Wmissing-attributes]
     130 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1321:1: note: in expansion of macro 'module_init'
    1321 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1503:1: note: in expansion of macro 'module_driver'
    1503 | module_driver(intel_th_msc_driver,
         | ^~~~~~~~~~~~~
   In file included from drivers/hwtracing/intel_th/msu.c:20:
   drivers/hwtracing/intel_th/msu.c:1503:15: note: 'init_module' target declared here
    1503 | module_driver(intel_th_msc_driver,
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1317:19: note: in definition of macro 'module_driver'
    1317 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   include/linux/module.h:136:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'intel_th_msc_driver_exit': 'cold' [-Wmissing-attributes]
     136 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1326:1: note: in expansion of macro 'module_exit'
    1326 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1503:1: note: in expansion of macro 'module_driver'
    1503 | module_driver(intel_th_msc_driver,
         | ^~~~~~~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1503:15: note: 'cleanup_module' target declared here
    1503 | module_driver(intel_th_msc_driver,
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1322:20: note: in definition of macro 'module_driver'
    1322 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
>> drivers/hwtracing/intel_th/msu.c:60: warning: Function parameter or member 'msc' not described in 'msc_window'
>> drivers/hwtracing/intel_th/msu.c:101: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:134: warning: Function parameter or member 'iter_mutex' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:134: warning: Function parameter or member 'iter_list' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:894: warning: Function parameter or member 'nr_pages' not described in 'msc_buffer_alloc'
>> drivers/hwtracing/intel_th/msu.c:894: warning: Function parameter or member 'nr_wins' not described in 'msc_buffer_alloc'
>> drivers/hwtracing/intel_th/msu.c:894: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'


vim +60 drivers/hwtracing/intel_th/msu.c

ba82664c134ef7a Alexander Shishkin 2015-09-22   46  
ba82664c134ef7a Alexander Shishkin 2015-09-22   47  /**
ba82664c134ef7a Alexander Shishkin 2015-09-22   48   * struct msc_window - multiblock mode window descriptor
ba82664c134ef7a Alexander Shishkin 2015-09-22   49   * @entry:	window list linkage (msc::win_list)
ba82664c134ef7a Alexander Shishkin 2015-09-22   50   * @pgoff:	page offset into the buffer that this window starts at
ba82664c134ef7a Alexander Shishkin 2015-09-22   51   * @nr_blocks:	number of blocks (pages) in this window
ba82664c134ef7a Alexander Shishkin 2015-09-22   52   * @block:	array of block descriptors
ba82664c134ef7a Alexander Shishkin 2015-09-22   53   */
ba82664c134ef7a Alexander Shishkin 2015-09-22   54  struct msc_window {
ba82664c134ef7a Alexander Shishkin 2015-09-22   55  	struct list_head	entry;
ba82664c134ef7a Alexander Shishkin 2015-09-22   56  	unsigned long		pgoff;
ba82664c134ef7a Alexander Shishkin 2015-09-22   57  	unsigned int		nr_blocks;
ba82664c134ef7a Alexander Shishkin 2015-09-22   58  	struct msc		*msc;
ba82664c134ef7a Alexander Shishkin 2015-09-22   59  	struct msc_block	block[0];
ba82664c134ef7a Alexander Shishkin 2015-09-22  @60  };
ba82664c134ef7a Alexander Shishkin 2015-09-22   61  
ba82664c134ef7a Alexander Shishkin 2015-09-22   62  /**
ba82664c134ef7a Alexander Shishkin 2015-09-22   63   * struct msc_iter - iterator for msc buffer
ba82664c134ef7a Alexander Shishkin 2015-09-22   64   * @entry:		msc::iter_list linkage
ba82664c134ef7a Alexander Shishkin 2015-09-22   65   * @msc:		pointer to the MSC device
ba82664c134ef7a Alexander Shishkin 2015-09-22   66   * @start_win:		oldest window
ba82664c134ef7a Alexander Shishkin 2015-09-22   67   * @win:		current window
ba82664c134ef7a Alexander Shishkin 2015-09-22   68   * @offset:		current logical offset into the buffer
ba82664c134ef7a Alexander Shishkin 2015-09-22   69   * @start_block:	oldest block in the window
ba82664c134ef7a Alexander Shishkin 2015-09-22   70   * @block:		block number in the window
ba82664c134ef7a Alexander Shishkin 2015-09-22   71   * @block_off:		offset into current block
ba82664c134ef7a Alexander Shishkin 2015-09-22   72   * @wrap_count:		block wrapping handling
ba82664c134ef7a Alexander Shishkin 2015-09-22   73   * @eof:		end of buffer reached
ba82664c134ef7a Alexander Shishkin 2015-09-22   74   */
ba82664c134ef7a Alexander Shishkin 2015-09-22   75  struct msc_iter {
ba82664c134ef7a Alexander Shishkin 2015-09-22   76  	struct list_head	entry;
ba82664c134ef7a Alexander Shishkin 2015-09-22   77  	struct msc		*msc;
ba82664c134ef7a Alexander Shishkin 2015-09-22   78  	struct msc_window	*start_win;
ba82664c134ef7a Alexander Shishkin 2015-09-22   79  	struct msc_window	*win;
ba82664c134ef7a Alexander Shishkin 2015-09-22   80  	unsigned long		offset;
ba82664c134ef7a Alexander Shishkin 2015-09-22   81  	int			start_block;
ba82664c134ef7a Alexander Shishkin 2015-09-22   82  	int			block;
ba82664c134ef7a Alexander Shishkin 2015-09-22   83  	unsigned int		block_off;
ba82664c134ef7a Alexander Shishkin 2015-09-22   84  	unsigned int		wrap_count;
ba82664c134ef7a Alexander Shishkin 2015-09-22   85  	unsigned int		eof;
ba82664c134ef7a Alexander Shishkin 2015-09-22   86  };
ba82664c134ef7a Alexander Shishkin 2015-09-22   87  
ba82664c134ef7a Alexander Shishkin 2015-09-22   88  /**
ba82664c134ef7a Alexander Shishkin 2015-09-22   89   * struct msc - MSC device representation
ba82664c134ef7a Alexander Shishkin 2015-09-22   90   * @reg_base:		register window base address
ba82664c134ef7a Alexander Shishkin 2015-09-22   91   * @thdev:		intel_th_device pointer
ba82664c134ef7a Alexander Shishkin 2015-09-22   92   * @win_list:		list of windows in multiblock mode
ba82664c134ef7a Alexander Shishkin 2015-09-22   93   * @nr_pages:		total number of pages allocated for this buffer
ba82664c134ef7a Alexander Shishkin 2015-09-22   94   * @single_sz:		amount of data in single mode
ba82664c134ef7a Alexander Shishkin 2015-09-22   95   * @single_wrap:	single mode wrap occurred
ba82664c134ef7a Alexander Shishkin 2015-09-22   96   * @base:		buffer's base pointer
ba82664c134ef7a Alexander Shishkin 2015-09-22   97   * @base_addr:		buffer's base address
ba82664c134ef7a Alexander Shishkin 2015-09-22   98   * @user_count:		number of users of the buffer
ba82664c134ef7a Alexander Shishkin 2015-09-22   99   * @mmap_count:		number of mappings
ba82664c134ef7a Alexander Shishkin 2015-09-22  100   * @buf_mutex:		mutex to serialize access to buffer-related bits
ba82664c134ef7a Alexander Shishkin 2015-09-22 @101  
ba82664c134ef7a Alexander Shishkin 2015-09-22  102   * @enabled:		MSC is enabled
ba82664c134ef7a Alexander Shishkin 2015-09-22  103   * @wrap:		wrapping is enabled
ba82664c134ef7a Alexander Shishkin 2015-09-22  104   * @mode:		MSC operating mode
ba82664c134ef7a Alexander Shishkin 2015-09-22  105   * @burst_len:		write burst length
ba82664c134ef7a Alexander Shishkin 2015-09-22  106   * @index:		number of this MSC in the MSU
ba82664c134ef7a Alexander Shishkin 2015-09-22  107   */
ba82664c134ef7a Alexander Shishkin 2015-09-22  108  struct msc {
ba82664c134ef7a Alexander Shishkin 2015-09-22  109  	void __iomem		*reg_base;
ba82664c134ef7a Alexander Shishkin 2015-09-22  110  	struct intel_th_device	*thdev;
ba82664c134ef7a Alexander Shishkin 2015-09-22  111  
ba82664c134ef7a Alexander Shishkin 2015-09-22  112  	struct list_head	win_list;
ba82664c134ef7a Alexander Shishkin 2015-09-22  113  	unsigned long		nr_pages;
ba82664c134ef7a Alexander Shishkin 2015-09-22  114  	unsigned long		single_sz;
ba82664c134ef7a Alexander Shishkin 2015-09-22  115  	unsigned int		single_wrap : 1;
ba82664c134ef7a Alexander Shishkin 2015-09-22  116  	void			*base;
ba82664c134ef7a Alexander Shishkin 2015-09-22  117  	dma_addr_t		base_addr;
ba82664c134ef7a Alexander Shishkin 2015-09-22  118  
ba82664c134ef7a Alexander Shishkin 2015-09-22  119  	/* <0: no buffer, 0: no users, >0: active users */
ba82664c134ef7a Alexander Shishkin 2015-09-22  120  	atomic_t		user_count;
ba82664c134ef7a Alexander Shishkin 2015-09-22  121  
ba82664c134ef7a Alexander Shishkin 2015-09-22  122  	atomic_t		mmap_count;
ba82664c134ef7a Alexander Shishkin 2015-09-22  123  	struct mutex		buf_mutex;
ba82664c134ef7a Alexander Shishkin 2015-09-22  124  
ba82664c134ef7a Alexander Shishkin 2015-09-22  125  	struct mutex		iter_mutex;
ba82664c134ef7a Alexander Shishkin 2015-09-22  126  	struct list_head	iter_list;
ba82664c134ef7a Alexander Shishkin 2015-09-22  127  
ba82664c134ef7a Alexander Shishkin 2015-09-22  128  	/* config */
ba82664c134ef7a Alexander Shishkin 2015-09-22  129  	unsigned int		enabled : 1,
ba82664c134ef7a Alexander Shishkin 2015-09-22  130  				wrap	: 1;
ba82664c134ef7a Alexander Shishkin 2015-09-22  131  	unsigned int		mode;
ba82664c134ef7a Alexander Shishkin 2015-09-22  132  	unsigned int		burst_len;
ba82664c134ef7a Alexander Shishkin 2015-09-22  133  	unsigned int		index;
ba82664c134ef7a Alexander Shishkin 2015-09-22 @134  };
ba82664c134ef7a Alexander Shishkin 2015-09-22  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
