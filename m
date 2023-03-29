Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C126882B
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Mar 2023 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680126260; x=1711662260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ATtzqSz+6GKmWG91w7FV006pbjbUb6FYRdBV2onE7yo=;
  b=XaQ3/NecX4lr9pPVsEt1ZmREo/oU9XLBmplPPuQmPmxbRd6QlfDRRPv5
   3OPd2KIL6JMMVlh6kaGOCqfUbrEkqjx72Gy86uGqVPWhhQSsb+QFronRe
   flFMszk51ylSIesogmffTMNGsY4rAMBDJt7nZcGCLyD0Q+5PRLW1FaSc/
   O0FSRM6SGQnELc5UGIcSTa+d0ADk0fJ64lnhnFaGslAoC58nYECU/JMvl
   cczYvo6O2p+eceUOcTHItkmRusiHqyxuyMjnJGx1HKVrbA3AyF4NtlERN
   UjoPjxdrstlCW9gCYcgS+RuK9NMZE01ayQzgyIe/4S3BWeN1xh+FW3Pml
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405960352"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="405960352"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 14:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808387665"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="808387665"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2023 14:44:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phdaX-000JzI-2c;
	Wed, 29 Mar 2023 21:44:13 +0000
Date: Thu, 30 Mar 2023 05:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v8 3/9] block: add emulation for copy
Message-ID: <202303300516.Sawo4yuV-lkp@intel.com>
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
In-Reply-To: <20230327084103.21601-4-anuj20.g@samsung.com>
References: <20230327084103.21601-4-anuj20.g@samsung.com>
TO: Anuj Gupta <anuj20.g@samsung.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: Alasdair Kergon <agk@redhat.com>
TO: Mike Snitzer <snitzer@kernel.org>
TO: dm-devel@redhat.com
TO: Keith Busch <kbusch@kernel.org>
TO: Christoph Hellwig <hch@lst.de>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: James Smart <james.smart@broadcom.com>
TO: Chaitanya Kulkarni <kch@nvidia.com>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
CC: bvanassche@acm.org
CC: hare@suse.de
CC: ming.lei@redhat.com
CC: damien.lemoal@opensource.wdc.com
CC: anuj20.g@samsung.com
CC: joshi.k@samsung.com
CC: nitheshshetty@gmail.com
CC: gost.dev@samsung.com
CC: Nitesh Shetty <nj.shetty@samsung.com>
CC: Vincent Fu <vincent.fu@samsung.com>
CC: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-fsdevel@vger.kernel.org

Hi Anuj,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on device-mapper-dm/for-next linus/master v6.3-rc4 next-20230329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anuj-Gupta/block-Add-copy-offload-support-infrastructure/20230329-162018
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230327084103.21601-4-anuj20.g%40samsung.com
patch subject: [PATCH v8 3/9] block: add emulation for copy
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: csky-randconfig-c032-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300516.Sawo4yuV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303300516.Sawo4yuV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/blk-lib.c:355:16-19: ERROR: reference preceded by free on line 345

vim +355 block/blk-lib.c

ba285db34f82bb Nitesh Shetty 2023-03-27  332  
ba285db34f82bb Nitesh Shetty 2023-03-27  333  static void blk_copy_emulate_read_end_io(struct bio *read_bio)
ba285db34f82bb Nitesh Shetty 2023-03-27  334  {
ba285db34f82bb Nitesh Shetty 2023-03-27  335  	struct copy_ctx *ctx = read_bio->bi_private;
ba285db34f82bb Nitesh Shetty 2023-03-27  336  	struct cio *cio = ctx->cio;
ba285db34f82bb Nitesh Shetty 2023-03-27  337  	sector_t clen;
ba285db34f82bb Nitesh Shetty 2023-03-27  338  
ba285db34f82bb Nitesh Shetty 2023-03-27  339  	if (read_bio->bi_status) {
ba285db34f82bb Nitesh Shetty 2023-03-27  340  		clen = (read_bio->bi_iter.bi_sector << SECTOR_SHIFT) -
ba285db34f82bb Nitesh Shetty 2023-03-27  341  						cio->pos_in;
ba285db34f82bb Nitesh Shetty 2023-03-27  342  		cio->comp_len = min_t(sector_t, clen, cio->comp_len);
ba285db34f82bb Nitesh Shetty 2023-03-27  343  		__free_page(read_bio->bi_io_vec[0].bv_page);
ba285db34f82bb Nitesh Shetty 2023-03-27  344  		bio_map_kern_endio(read_bio);
ba285db34f82bb Nitesh Shetty 2023-03-27 @345  		kfree(ctx);
ba285db34f82bb Nitesh Shetty 2023-03-27  346  
ba285db34f82bb Nitesh Shetty 2023-03-27  347  		if (atomic_dec_and_test(&cio->refcount)) {
ba285db34f82bb Nitesh Shetty 2023-03-27  348  			if (cio->endio) {
ba285db34f82bb Nitesh Shetty 2023-03-27  349  				cio->endio(cio->private, cio->comp_len);
ba285db34f82bb Nitesh Shetty 2023-03-27  350  				kfree(cio);
ba285db34f82bb Nitesh Shetty 2023-03-27  351  			} else
ba285db34f82bb Nitesh Shetty 2023-03-27  352  				blk_wake_io_task(cio->waiter);
ba285db34f82bb Nitesh Shetty 2023-03-27  353  		}
ba285db34f82bb Nitesh Shetty 2023-03-27  354  	}
ba285db34f82bb Nitesh Shetty 2023-03-27 @355  	schedule_work(&ctx->dispatch_work);
ba285db34f82bb Nitesh Shetty 2023-03-27  356  	kfree(read_bio);
ba285db34f82bb Nitesh Shetty 2023-03-27  357  }
ba285db34f82bb Nitesh Shetty 2023-03-27  358  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
