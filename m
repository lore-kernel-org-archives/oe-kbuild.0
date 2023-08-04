Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B3253A8
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691191980; x=1722727980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8dcamfdXJ5FNnLRYPkLlT6LngIUA4+xg13h/ER9OvE=;
  b=gfeDEKTd82Cy5OR+JUizQQXGLFba2vCJglPt4gPwYCFL2PDmmjijkyqF
   WYnlKHDnh30VPbDL3y/O+jh82nvFzA2VQtEH0IALwsU/ukZVSqdeZaUYJ
   +7C/Y5BA5mgd89PB0hPZIwVJE+e/iKu0sXe5Y8sv3j5ROBYyKantu5bSz
   HT6hVOVCxkeNN72YhB6w7Q4Y7GQE375A0xmgKQImmmw+KGLnQLUWpvUE9
   EsSmw+eHIHquLzkzAcDeV06Jt7qwO6rBmFYupjxVoIVQrMhltcvV+1kHr
   /x3S6wABnpC0AIbA5XExdrTgzfI+SraSTchSK5KsDAS7h8Hz+IdZGIHVs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350576756"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="350576756"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="680142347"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="680142347"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 16:32:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS4Hv-0003Bx-0A;
	Fri, 04 Aug 2023 23:32:55 +0000
Date: Sat, 5 Aug 2023 07:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050743.oh37xogm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/nvdimm/pmem.c:217:9: sparse: sparse: too long token expansion"
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
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-i063-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050743.oh37xogm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050743.oh37xogm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050743.oh37xogm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/nvdimm/pmem.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/nvdimm/pmem.c: note: in included file:
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/nvdimm/pmem.c:217:9: sparse: sparse: too long token expansion
>> drivers/nvdimm/pmem.c:217:9: sparse: sparse: too long token expansion

vim +217 drivers/nvdimm/pmem.c

9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  199  
3e08773c3841e9 drivers/nvdimm/pmem.c Christoph Hellwig 2021-10-12  200  static void pmem_submit_bio(struct bio *bio)
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  201  {
c5d4355d10d414 drivers/nvdimm/pmem.c Pankaj Gupta      2019-07-05  202  	int ret = 0;
4e4cbee93d5613 drivers/nvdimm/pmem.c Christoph Hellwig 2017-06-03  203  	blk_status_t rc = 0;
f0dc089ce217e7 drivers/nvdimm/pmem.c Dan Williams      2015-05-16  204  	bool do_acct;
f0dc089ce217e7 drivers/nvdimm/pmem.c Dan Williams      2015-05-16  205  	unsigned long start;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  206  	struct bio_vec bvec;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  207  	struct bvec_iter iter;
309dca309fc39a drivers/nvdimm/pmem.c Christoph Hellwig 2021-01-24  208  	struct pmem_device *pmem = bio->bi_bdev->bd_disk->private_data;
7e267a8c790edf drivers/nvdimm/pmem.c Dan Williams      2016-06-01  209  	struct nd_region *nd_region = to_region(pmem);
7e267a8c790edf drivers/nvdimm/pmem.c Dan Williams      2016-06-01  210  
d2d6364dcbf6af drivers/nvdimm/pmem.c Ross Zwisler      2018-06-06  211  	if (bio->bi_opf & REQ_PREFLUSH)
c5d4355d10d414 drivers/nvdimm/pmem.c Pankaj Gupta      2019-07-05  212  		ret = nvdimm_flush(nd_region, bio);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  213  
309dca309fc39a drivers/nvdimm/pmem.c Christoph Hellwig 2021-01-24  214  	do_acct = blk_queue_io_stat(bio->bi_bdev->bd_disk->queue);
0fd92f89a44d3b drivers/nvdimm/pmem.c Christoph Hellwig 2020-05-27  215  	if (do_acct)
0fd92f89a44d3b drivers/nvdimm/pmem.c Christoph Hellwig 2020-05-27  216  		start = bio_start_io_acct(bio);
e10624f8c09710 drivers/nvdimm/pmem.c Dan Williams      2016-01-06 @217  	bio_for_each_segment(bvec, bio, iter) {
5d64efe79703c4 drivers/nvdimm/pmem.c Vivek Goyal       2020-02-28  218  		if (op_is_write(bio_op(bio)))
5d64efe79703c4 drivers/nvdimm/pmem.c Vivek Goyal       2020-02-28  219  			rc = pmem_do_write(pmem, bvec.bv_page, bvec.bv_offset,
5d64efe79703c4 drivers/nvdimm/pmem.c Vivek Goyal       2020-02-28  220  				iter.bi_sector, bvec.bv_len);
5d64efe79703c4 drivers/nvdimm/pmem.c Vivek Goyal       2020-02-28  221  		else
5d64efe79703c4 drivers/nvdimm/pmem.c Vivek Goyal       2020-02-28  222  			rc = pmem_do_read(pmem, bvec.bv_page, bvec.bv_offset,
5d64efe79703c4 drivers/nvdimm/pmem.c Vivek Goyal       2020-02-28  223  				iter.bi_sector, bvec.bv_len);
e10624f8c09710 drivers/nvdimm/pmem.c Dan Williams      2016-01-06  224  		if (rc) {
4e4cbee93d5613 drivers/nvdimm/pmem.c Christoph Hellwig 2017-06-03  225  			bio->bi_status = rc;
e10624f8c09710 drivers/nvdimm/pmem.c Dan Williams      2016-01-06  226  			break;
e10624f8c09710 drivers/nvdimm/pmem.c Dan Williams      2016-01-06  227  		}
e10624f8c09710 drivers/nvdimm/pmem.c Dan Williams      2016-01-06  228  	}
f0dc089ce217e7 drivers/nvdimm/pmem.c Dan Williams      2015-05-16  229  	if (do_acct)
0fd92f89a44d3b drivers/nvdimm/pmem.c Christoph Hellwig 2020-05-27  230  		bio_end_io_acct(bio, start);
61031952f4c89d drivers/nvdimm/pmem.c Ross Zwisler      2015-06-25  231  
1eff9d322a4442 drivers/nvdimm/pmem.c Jens Axboe        2016-08-05  232  	if (bio->bi_opf & REQ_FUA)
c5d4355d10d414 drivers/nvdimm/pmem.c Pankaj Gupta      2019-07-05  233  		ret = nvdimm_flush(nd_region, bio);
c5d4355d10d414 drivers/nvdimm/pmem.c Pankaj Gupta      2019-07-05  234  
c5d4355d10d414 drivers/nvdimm/pmem.c Pankaj Gupta      2019-07-05  235  	if (ret)
c5d4355d10d414 drivers/nvdimm/pmem.c Pankaj Gupta      2019-07-05  236  		bio->bi_status = errno_to_blk_status(ret);
61031952f4c89d drivers/nvdimm/pmem.c Ross Zwisler      2015-06-25  237  
4246a0b63bd8f5 drivers/nvdimm/pmem.c Christoph Hellwig 2015-07-20  238  	bio_endio(bio);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  239  }
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
