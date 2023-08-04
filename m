Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850CC1AA9F
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691185792; x=1722721792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOXsP2eTCpeL2MM7CyzO+QuKkImIRLUnhvlQW7lLqVI=;
  b=V7dgpbVMokisB0QYADW79GnNjs+eRvaP+H52x3UbyH2e/B+8OUl9FCzd
   5OYzToj+zK5LVFbsi6Gfv3yIObIe40+XSSQ4iJ6mGKgWMLbw5jXlyd8W+
   1hB57JxUD4PQqZAW9X/qSn5vSK1LhiTw6ahmSIlXS/dbBnBhYDY77SnZh
   2QmtM21bEyEXp4XhYl1qIUuW2j/FMv3Tz6X58uyVWiYPxAEHL18dB49fc
   us/ElKxVrZLnf2KFEkWvFqickkYRovJCo7SwHE24AKKqdVgUknFfLrq1j
   JOLJKSqB3aQBKMJsHUkU6HlAmXJjxyBonLpVKy7qdk4gJ8Clb4brrmhyk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350561963"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="350561963"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 14:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="1060938807"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="1060938807"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2023 14:49:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS2g6-00037p-2g;
	Fri, 04 Aug 2023 21:49:46 +0000
Date: Sat, 5 Aug 2023 05:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050547.8t3vOO6f-lkp@intel.com>
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
[also build test WARNING on crng-random/master v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-r092-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050547.8t3vOO6f-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050547.8t3vOO6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050547.8t3vOO6f-lkp@intel.com/

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

b158935f70b9c15 Mark Brown         2013-10-05  1023  
2de440f59ca9615 Geert Uytterhoeven 2014-05-02  1024  #ifdef CONFIG_HAS_DMA
0c17ba73c08ff26 Vincent Whitchurch 2022-09-27  1025  static int spi_map_buf_attrs(struct spi_controller *ctlr, struct device *dev,
6ad45a27cbe343e Mark Brown         2014-02-02  1026  			     struct sg_table *sgt, void *buf, size_t len,
0c17ba73c08ff26 Vincent Whitchurch 2022-09-27  1027  			     enum dma_data_direction dir, unsigned long attrs)
6ad45a27cbe343e Mark Brown         2014-02-02  1028  {
6ad45a27cbe343e Mark Brown         2014-02-02  1029  	const bool vmalloced_buf = is_vmalloc_addr(buf);
df88e91bbfd1666 Andy Shevchenko    2016-03-09  1030  	unsigned int max_seg_size = dma_get_max_seg_size(dev);
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1031  #ifdef CONFIG_HIGHMEM
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1032  	const bool kmap_buf = ((unsigned long)buf >= PKMAP_BASE &&
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1033  				(unsigned long)buf < (PKMAP_BASE +
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1034  					(LAST_PKMAP * PAGE_SIZE)));
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1035  #else
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1036  	const bool kmap_buf = false;
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1037  #endif
65598c13fd66c3b Andrew Gabbasov    2015-06-30  1038  	int desc_len;
65598c13fd66c3b Andrew Gabbasov    2015-06-30  1039  	int sgs;
6ad45a27cbe343e Mark Brown         2014-02-02  1040  	struct page *vm_page;
8dd4a0163e7315d Juan Gutierrez     2016-11-21  1041  	struct scatterlist *sg;
6ad45a27cbe343e Mark Brown         2014-02-02  1042  	void *sg_buf;
6ad45a27cbe343e Mark Brown         2014-02-02  1043  	size_t min;
6ad45a27cbe343e Mark Brown         2014-02-02  1044  	int i, ret;
6ad45a27cbe343e Mark Brown         2014-02-02  1045  
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1046  	if (vmalloced_buf || kmap_buf) {
ebc4cb43ea5ada3 Biju Das           2022-03-16  1047  		desc_len = min_t(unsigned long, max_seg_size, PAGE_SIZE);
65598c13fd66c3b Andrew Gabbasov    2015-06-30  1048  		sgs = DIV_ROUND_UP(len + offset_in_page(buf), desc_len);
0569a88f3d1ffed Vignesh R          2016-04-25  1049  	} else if (virt_addr_valid(buf)) {
ebc4cb43ea5ada3 Biju Das           2022-03-16  1050  		desc_len = min_t(size_t, max_seg_size, ctlr->max_dma_len);
65598c13fd66c3b Andrew Gabbasov    2015-06-30  1051  		sgs = DIV_ROUND_UP(len, desc_len);
0569a88f3d1ffed Vignesh R          2016-04-25  1052  	} else {
0569a88f3d1ffed Vignesh R          2016-04-25  1053  		return -EINVAL;
65598c13fd66c3b Andrew Gabbasov    2015-06-30  1054  	}
65598c13fd66c3b Andrew Gabbasov    2015-06-30  1055  
6ad45a27cbe343e Mark Brown         2014-02-02  1056  	ret = sg_alloc_table(sgt, sgs, GFP_KERNEL);
6ad45a27cbe343e Mark Brown         2014-02-02  1057  	if (ret != 0)
6ad45a27cbe343e Mark Brown         2014-02-02  1058  		return ret;
6ad45a27cbe343e Mark Brown         2014-02-02  1059  
8dd4a0163e7315d Juan Gutierrez     2016-11-21  1060  	sg = &sgt->sgl[0];
6ad45a27cbe343e Mark Brown         2014-02-02  1061  	for (i = 0; i < sgs; i++) {
6ad45a27cbe343e Mark Brown         2014-02-02  1062  
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1063  		if (vmalloced_buf || kmap_buf) {
ce99319a182fe76 Maxime Chevallier  2018-03-02  1064  			/*
ce99319a182fe76 Maxime Chevallier  2018-03-02  1065  			 * Next scatterlist entry size is the minimum between
ce99319a182fe76 Maxime Chevallier  2018-03-02  1066  			 * the desc_len and the remaining buffer length that
ce99319a182fe76 Maxime Chevallier  2018-03-02  1067  			 * fits in a page.
ce99319a182fe76 Maxime Chevallier  2018-03-02  1068  			 */
ce99319a182fe76 Maxime Chevallier  2018-03-02 @1069  			min = min_t(size_t, desc_len,
ce99319a182fe76 Maxime Chevallier  2018-03-02  1070  				    min_t(size_t, len,
ce99319a182fe76 Maxime Chevallier  2018-03-02  1071  					  PAGE_SIZE - offset_in_page(buf)));
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1072  			if (vmalloced_buf)
6ad45a27cbe343e Mark Brown         2014-02-02  1073  				vm_page = vmalloc_to_page(buf);
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1074  			else
b1b8153cf0aeeb7 Vignesh R          2016-08-17  1075  				vm_page = kmap_to_page(buf);
6ad45a27cbe343e Mark Brown         2014-02-02  1076  			if (!vm_page) {
6ad45a27cbe343e Mark Brown         2014-02-02  1077  				sg_free_table(sgt);
6ad45a27cbe343e Mark Brown         2014-02-02  1078  				return -ENOMEM;
6ad45a27cbe343e Mark Brown         2014-02-02  1079  			}
8dd4a0163e7315d Juan Gutierrez     2016-11-21  1080  			sg_set_page(sg, vm_page,
c1aefbdd050e1fb Charles Keepax     2014-11-17  1081  				    min, offset_in_page(buf));
6ad45a27cbe343e Mark Brown         2014-02-02  1082  		} else {
65598c13fd66c3b Andrew Gabbasov    2015-06-30  1083  			min = min_t(size_t, len, desc_len);
6ad45a27cbe343e Mark Brown         2014-02-02  1084  			sg_buf = buf;
8dd4a0163e7315d Juan Gutierrez     2016-11-21  1085  			sg_set_buf(sg, sg_buf, min);
6ad45a27cbe343e Mark Brown         2014-02-02  1086  		}
6ad45a27cbe343e Mark Brown         2014-02-02  1087  
6ad45a27cbe343e Mark Brown         2014-02-02  1088  		buf += min;
6ad45a27cbe343e Mark Brown         2014-02-02  1089  		len -= min;
8dd4a0163e7315d Juan Gutierrez     2016-11-21  1090  		sg = sg_next(sg);
6ad45a27cbe343e Mark Brown         2014-02-02  1091  	}
6ad45a27cbe343e Mark Brown         2014-02-02  1092  
0c17ba73c08ff26 Vincent Whitchurch 2022-09-27  1093  	ret = dma_map_sgtable(dev, sgt, dir, attrs);
6ad45a27cbe343e Mark Brown         2014-02-02  1094  	if (ret < 0) {
6ad45a27cbe343e Mark Brown         2014-02-02  1095  		sg_free_table(sgt);
6ad45a27cbe343e Mark Brown         2014-02-02  1096  		return ret;
6ad45a27cbe343e Mark Brown         2014-02-02  1097  	}
6ad45a27cbe343e Mark Brown         2014-02-02  1098  
6ad45a27cbe343e Mark Brown         2014-02-02  1099  	return 0;
6ad45a27cbe343e Mark Brown         2014-02-02  1100  }
6ad45a27cbe343e Mark Brown         2014-02-02  1101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
