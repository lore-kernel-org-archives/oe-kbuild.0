Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934B1FD2
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 04:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695358567; x=1726894567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpWXnHYeLQfNAukQahz9Y/z0kvMjkkdBc8Wzy/ciH4E=;
  b=Wwy9AyvatIs2f/Z0rdsFlxvnlqO17Te8DZ5U2GNN4eqDnZXH+R+zF8Ls
   LYOJMKh4PH/4vwt1W5ZiTqRYi75rDUIuC/yHjlGwAGs2BGfVYmMfyIQm2
   1JjpH88J2iD/Rdu1Jx8SUm4Y57rR7thaMGsUMjoQj2NGVk1yCGh3I8UHO
   x+YEg/vw2CijnWGMvozu+k90+w9xsD0BegndYLR9KZkwurKSSILl/3oyA
   5zEnZle3ipCOhrA+N4yFPy3xXgeREeIU9K3k25SIUzz9sf5Uc9AXqHKnE
   82dg7HTGkGWYNnT3xFYRducF09bOboJwAgediuuIhGdSAobqFsZwSfBwZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411681138"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="411681138"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 21:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="724039946"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="724039946"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Sep 2023 21:56:04 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjYCw-00005x-2N;
	Fri, 22 Sep 2023 04:56:02 +0000
Date: Fri, 22 Sep 2023 12:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202309221200.1Nv5LACu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/spi/spi.c:1069:31: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
References: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on crng-random/master v6.6-rc2]
[cannot apply to next-20230804 akpm-mm/mm-everything next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
config: csky-randconfig-r092-20230730 (https://download.01.org/0day-ci/archive/20230922/202309221200.1Nv5LACu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309221200.1Nv5LACu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309221200.1Nv5LACu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi.c:1069:31: sparse: sparse: too long token expansion
>> drivers/spi/spi.c:1069:31: sparse: sparse: too long token expansion
--
   drivers/block/null_blk/main.c: note: in included file (through include/linux/blkdev.h, drivers/block/null_blk/null_blk.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/block/null_blk/main.c: note: in included file (through drivers/block/null_blk/null_blk.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/block/null_blk/main.c:1285:9: sparse: sparse: too long token expansion
>> drivers/block/null_blk/main.c:1285:9: sparse: sparse: too long token expansion
   drivers/block/null_blk/main.c:1312:9: sparse: sparse: too long token expansion
   drivers/block/null_blk/main.c:1312:9: sparse: sparse: too long token expansion
--
   drivers/block/zram/zram_drv.c: note: in included file:
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/block/zram/zram_drv.c:1878:9: sparse: sparse: too long token expansion
>> drivers/block/zram/zram_drv.c:1878:9: sparse: sparse: too long token expansion
   drivers/block/zram/zram_drv.c:1905:9: sparse: sparse: too long token expansion
   drivers/block/zram/zram_drv.c:1905:9: sparse: sparse: too long token expansion

vim +1069 drivers/spi/spi.c

b158935f70b9c1 Mark Brown         2013-10-05  1023  
2de440f59ca961 Geert Uytterhoeven 2014-05-02  1024  #ifdef CONFIG_HAS_DMA
0c17ba73c08ff2 Vincent Whitchurch 2022-09-27  1025  static int spi_map_buf_attrs(struct spi_controller *ctlr, struct device *dev,
6ad45a27cbe343 Mark Brown         2014-02-02  1026  			     struct sg_table *sgt, void *buf, size_t len,
0c17ba73c08ff2 Vincent Whitchurch 2022-09-27  1027  			     enum dma_data_direction dir, unsigned long attrs)
6ad45a27cbe343 Mark Brown         2014-02-02  1028  {
6ad45a27cbe343 Mark Brown         2014-02-02  1029  	const bool vmalloced_buf = is_vmalloc_addr(buf);
df88e91bbfd166 Andy Shevchenko    2016-03-09  1030  	unsigned int max_seg_size = dma_get_max_seg_size(dev);
b1b8153cf0aeeb Vignesh R          2016-08-17  1031  #ifdef CONFIG_HIGHMEM
b1b8153cf0aeeb Vignesh R          2016-08-17  1032  	const bool kmap_buf = ((unsigned long)buf >= PKMAP_BASE &&
b1b8153cf0aeeb Vignesh R          2016-08-17  1033  				(unsigned long)buf < (PKMAP_BASE +
b1b8153cf0aeeb Vignesh R          2016-08-17  1034  					(LAST_PKMAP * PAGE_SIZE)));
b1b8153cf0aeeb Vignesh R          2016-08-17  1035  #else
b1b8153cf0aeeb Vignesh R          2016-08-17  1036  	const bool kmap_buf = false;
b1b8153cf0aeeb Vignesh R          2016-08-17  1037  #endif
65598c13fd66c3 Andrew Gabbasov    2015-06-30  1038  	int desc_len;
65598c13fd66c3 Andrew Gabbasov    2015-06-30  1039  	int sgs;
6ad45a27cbe343 Mark Brown         2014-02-02  1040  	struct page *vm_page;
8dd4a0163e7315 Juan Gutierrez     2016-11-21  1041  	struct scatterlist *sg;
6ad45a27cbe343 Mark Brown         2014-02-02  1042  	void *sg_buf;
6ad45a27cbe343 Mark Brown         2014-02-02  1043  	size_t min;
6ad45a27cbe343 Mark Brown         2014-02-02  1044  	int i, ret;
6ad45a27cbe343 Mark Brown         2014-02-02  1045  
b1b8153cf0aeeb Vignesh R          2016-08-17  1046  	if (vmalloced_buf || kmap_buf) {
ebc4cb43ea5ada Biju Das           2022-03-16  1047  		desc_len = min_t(unsigned long, max_seg_size, PAGE_SIZE);
65598c13fd66c3 Andrew Gabbasov    2015-06-30  1048  		sgs = DIV_ROUND_UP(len + offset_in_page(buf), desc_len);
0569a88f3d1ffe Vignesh R          2016-04-25  1049  	} else if (virt_addr_valid(buf)) {
ebc4cb43ea5ada Biju Das           2022-03-16  1050  		desc_len = min_t(size_t, max_seg_size, ctlr->max_dma_len);
65598c13fd66c3 Andrew Gabbasov    2015-06-30  1051  		sgs = DIV_ROUND_UP(len, desc_len);
0569a88f3d1ffe Vignesh R          2016-04-25  1052  	} else {
0569a88f3d1ffe Vignesh R          2016-04-25  1053  		return -EINVAL;
65598c13fd66c3 Andrew Gabbasov    2015-06-30  1054  	}
65598c13fd66c3 Andrew Gabbasov    2015-06-30  1055  
6ad45a27cbe343 Mark Brown         2014-02-02  1056  	ret = sg_alloc_table(sgt, sgs, GFP_KERNEL);
6ad45a27cbe343 Mark Brown         2014-02-02  1057  	if (ret != 0)
6ad45a27cbe343 Mark Brown         2014-02-02  1058  		return ret;
6ad45a27cbe343 Mark Brown         2014-02-02  1059  
8dd4a0163e7315 Juan Gutierrez     2016-11-21  1060  	sg = &sgt->sgl[0];
6ad45a27cbe343 Mark Brown         2014-02-02  1061  	for (i = 0; i < sgs; i++) {
6ad45a27cbe343 Mark Brown         2014-02-02  1062  
b1b8153cf0aeeb Vignesh R          2016-08-17  1063  		if (vmalloced_buf || kmap_buf) {
ce99319a182fe7 Maxime Chevallier  2018-03-02  1064  			/*
ce99319a182fe7 Maxime Chevallier  2018-03-02  1065  			 * Next scatterlist entry size is the minimum between
ce99319a182fe7 Maxime Chevallier  2018-03-02  1066  			 * the desc_len and the remaining buffer length that
ce99319a182fe7 Maxime Chevallier  2018-03-02  1067  			 * fits in a page.
ce99319a182fe7 Maxime Chevallier  2018-03-02  1068  			 */
ce99319a182fe7 Maxime Chevallier  2018-03-02 @1069  			min = min_t(size_t, desc_len,
ce99319a182fe7 Maxime Chevallier  2018-03-02  1070  				    min_t(size_t, len,
ce99319a182fe7 Maxime Chevallier  2018-03-02  1071  					  PAGE_SIZE - offset_in_page(buf)));
b1b8153cf0aeeb Vignesh R          2016-08-17  1072  			if (vmalloced_buf)
6ad45a27cbe343 Mark Brown         2014-02-02  1073  				vm_page = vmalloc_to_page(buf);
b1b8153cf0aeeb Vignesh R          2016-08-17  1074  			else
b1b8153cf0aeeb Vignesh R          2016-08-17  1075  				vm_page = kmap_to_page(buf);
6ad45a27cbe343 Mark Brown         2014-02-02  1076  			if (!vm_page) {
6ad45a27cbe343 Mark Brown         2014-02-02  1077  				sg_free_table(sgt);
6ad45a27cbe343 Mark Brown         2014-02-02  1078  				return -ENOMEM;
6ad45a27cbe343 Mark Brown         2014-02-02  1079  			}
8dd4a0163e7315 Juan Gutierrez     2016-11-21  1080  			sg_set_page(sg, vm_page,
c1aefbdd050e1f Charles Keepax     2014-11-17  1081  				    min, offset_in_page(buf));
6ad45a27cbe343 Mark Brown         2014-02-02  1082  		} else {
65598c13fd66c3 Andrew Gabbasov    2015-06-30  1083  			min = min_t(size_t, len, desc_len);
6ad45a27cbe343 Mark Brown         2014-02-02  1084  			sg_buf = buf;
8dd4a0163e7315 Juan Gutierrez     2016-11-21  1085  			sg_set_buf(sg, sg_buf, min);
6ad45a27cbe343 Mark Brown         2014-02-02  1086  		}
6ad45a27cbe343 Mark Brown         2014-02-02  1087  
6ad45a27cbe343 Mark Brown         2014-02-02  1088  		buf += min;
6ad45a27cbe343 Mark Brown         2014-02-02  1089  		len -= min;
8dd4a0163e7315 Juan Gutierrez     2016-11-21  1090  		sg = sg_next(sg);
6ad45a27cbe343 Mark Brown         2014-02-02  1091  	}
6ad45a27cbe343 Mark Brown         2014-02-02  1092  
0c17ba73c08ff2 Vincent Whitchurch 2022-09-27  1093  	ret = dma_map_sgtable(dev, sgt, dir, attrs);
6ad45a27cbe343 Mark Brown         2014-02-02  1094  	if (ret < 0) {
6ad45a27cbe343 Mark Brown         2014-02-02  1095  		sg_free_table(sgt);
6ad45a27cbe343 Mark Brown         2014-02-02  1096  		return ret;
6ad45a27cbe343 Mark Brown         2014-02-02  1097  	}
6ad45a27cbe343 Mark Brown         2014-02-02  1098  
6ad45a27cbe343 Mark Brown         2014-02-02  1099  	return 0;
6ad45a27cbe343 Mark Brown         2014-02-02  1100  }
6ad45a27cbe343 Mark Brown         2014-02-02  1101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
