Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368EAD4A
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 22:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691188853; x=1722724853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmWSs+ZEalTkUQLFsP6CLRZwDcXzIGo458W8k742bNs=;
  b=LhkXdG+3M6snaKirpb2qZQkkGqMEdWpNFN1GLhuExflmU/ZPxAqrNQbi
   8gIbbn7Ot6C8bUvvLDx0kkvSX3v9hgunoJHRobqr2WbtEVx+h/t8NbqkR
   sD3WNOAB0Wpwk4fO6SULl8nEPye7eqQh7sukiWQocfs4nDp5fVjpcdL8n
   6u2PxQx3K3ecO94qCwux3BS3lrTtXeTqMkXCWnhZYkloCIyqfYDVvgv4d
   88p7tzSr3FlErIYQNChISpSMuaerAJKbNULQ2Tyha2eCzXiwvGrdEJtVW
   GEF3LIsXVP4nB46oq0okhnA8KWHcP/XhESrioUpQD+/FZ2naOsqdXoYx2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373916913"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="373916913"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 15:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="844286845"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="844286845"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2023 15:40:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS3TW-00039l-1h;
	Fri, 04 Aug 2023 22:40:50 +0000
Date: Sat, 5 Aug 2023 06:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050627.7U2kjLgn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: block/blk-crypto.c:220:9: sparse: sparse: too long token expansion"
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
config: m68k-randconfig-r083-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050627.7U2kjLgn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050627.7U2kjLgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050627.7U2kjLgn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-crypto.c: note: in included file:
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-crypto.c: note: in included file (through block/blk-crypto-internal.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> block/blk-crypto.c:220:9: sparse: sparse: too long token expansion
>> block/blk-crypto.c:220:9: sparse: sparse: too long token expansion
--
   block/blk-crypto-fallback.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-crypto.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-crypto-fallback.c: note: in included file (through block/blk-cgroup.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> block/blk-crypto-fallback.c:178:9: sparse: sparse: too long token expansion
>> block/blk-crypto-fallback.c:178:9: sparse: sparse: too long token expansion
   block/blk-crypto-fallback.c:218:9: sparse: sparse: too long token expansion
   block/blk-crypto-fallback.c:218:9: sparse: sparse: too long token expansion
   block/blk-crypto-fallback.c:417:9: sparse: sparse: too long token expansion
   block/blk-crypto-fallback.c:417:9: sparse: sparse: too long token expansion
--
   block/bfq-iosched.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/bfq-iosched.c: note: in included file (through include/linux/blktrace_api.h, include/trace/events/block.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> block/bfq-iosched.c:1081:22: sparse: sparse: too long token expansion
>> block/bfq-iosched.c:1081:22: sparse: sparse: too long token expansion
   block/bfq-iosched.c:4304:16: sparse: sparse: too long token expansion
   block/bfq-iosched.c:4304:16: sparse: sparse: too long token expansion
--
   fs/btrfs/check-integrity.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> fs/btrfs/check-integrity.c:2663:9: sparse: sparse: too long token expansion
>> fs/btrfs/check-integrity.c:2663:9: sparse: sparse: too long token expansion
--
   drivers/md/dm.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-mq.h, drivers/md/dm-core.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/md/dm.c: note: in included file (through drivers/md/dm-core.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/md/dm.c:1194:16: sparse: sparse: too long token expansion
>> drivers/md/dm.c:1194:16: sparse: sparse: too long token expansion
--
   drivers/md/dm-io.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-mq.h, drivers/md/dm-core.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/md/dm-io.c: note: in included file (through drivers/md/dm-core.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/md/dm-io.c:219:31: sparse: sparse: too long token expansion
>> drivers/md/dm-io.c:219:31: sparse: sparse: too long token expansion
--
   drivers/md/raid5.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/md/raid5.c: note: in included file (through include/linux/blktrace_api.h, include/trace/events/block.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/md/raid5.c:1398:9: sparse: sparse: too long token expansion
>> drivers/md/raid5.c:1398:9: sparse: sparse: too long token expansion
--
   drivers/md/dm-flakey.c: note: in included file (through include/linux/device-mapper.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/md/dm-flakey.c:351:9: sparse: sparse: too long token expansion
>> drivers/md/dm-flakey.c:351:9: sparse: sparse: too long token expansion
   drivers/md/dm-flakey.c:352:21: sparse: sparse: too long token expansion
   drivers/md/dm-flakey.c:352:21: sparse: sparse: too long token expansion
   drivers/md/dm-flakey.c:364:37: sparse: sparse: too long token expansion
   drivers/md/dm-flakey.c:364:37: sparse: sparse: too long token expansion
   drivers/md/dm-flakey.c:460:47: sparse: sparse: too long token expansion
   drivers/md/dm-flakey.c:460:47: sparse: sparse: too long token expansion
--
   drivers/md/dm-crypt.c: note: in included file:
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/md/dm-crypt.c: note: in included file (through include/linux/blk-integrity.h):
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
   include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/md/dm-crypt.c:1302:32: sparse: sparse: too long token expansion
>> drivers/md/dm-crypt.c:1302:32: sparse: sparse: too long token expansion
   drivers/md/dm-crypt.c:1303:33: sparse: sparse: too long token expansion
   drivers/md/dm-crypt.c:1303:33: sparse: sparse: too long token expansion
   drivers/md/dm-crypt.c:1401:32: sparse: sparse: too long token expansion
   drivers/md/dm-crypt.c:1401:32: sparse: sparse: too long token expansion
   drivers/md/dm-crypt.c:1402:33: sparse: sparse: too long token expansion
   drivers/md/dm-crypt.c:1402:33: sparse: sparse: too long token expansion
--
   drivers/md/dm-log-writes.c: note: in included file (through include/linux/device-mapper.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/md/dm-log-writes.c:732:9: sparse: sparse: too long token expansion
>> drivers/md/dm-log-writes.c:732:9: sparse: sparse: too long token expansion
--
   drivers/md/dm-verity-target.c: note: in included file (through include/linux/blkdev.h, include/linux/dm-bufio.h, drivers/md/dm-verity.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/md/dm-verity-target.c:417:37: sparse: sparse: too long token expansion
>> drivers/md/dm-verity-target.c:417:37: sparse: sparse: too long token expansion
   drivers/md/dm-verity-target.c:463:37: sparse: sparse: too long token expansion
   drivers/md/dm-verity-target.c:463:37: sparse: sparse: too long token expansion
--
   drivers/md/dm-writecache.c: note: in included file (through include/linux/device-mapper.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/md/dm-writecache.c:1255:37: sparse: sparse: too long token expansion
>> drivers/md/dm-writecache.c:1255:37: sparse: sparse: too long token expansion
--
   drivers/md/bcache/debug.c: note: in included file (through drivers/md/bcache/bcache.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/md/bcache/debug.c:130:9: sparse: sparse: too long token expansion
>> drivers/md/bcache/debug.c:130:9: sparse: sparse: too long token expansion
   drivers/md/bcache/debug.c:134:23: sparse: sparse: too long token expansion
   drivers/md/bcache/debug.c:134:23: sparse: sparse: too long token expansion
--
   drivers/md/bcache/btree.c: note: in included file (through drivers/md/bcache/bcache.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/md/bcache/btree.c:698:14: sparse: sparse: too long token expansion
>> drivers/md/bcache/btree.c:698:14: sparse: sparse: too long token expansion
--
   drivers/md/bcache/request.c: note: in included file (through drivers/md/bcache/bcache.h):
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> drivers/md/bcache/request.c:46:9: sparse: sparse: too long token expansion
>> drivers/md/bcache/request.c:46:9: sparse: sparse: too long token expansion

vim +220 block/blk-crypto.c

a892c8d52c02284 Satya Tangirala 2020-05-14  211  
a892c8d52c02284 Satya Tangirala 2020-05-14  212  /* Check that all I/O segments are data unit aligned. */
a892c8d52c02284 Satya Tangirala 2020-05-14  213  static bool bio_crypt_check_alignment(struct bio *bio)
a892c8d52c02284 Satya Tangirala 2020-05-14  214  {
a892c8d52c02284 Satya Tangirala 2020-05-14  215  	const unsigned int data_unit_size =
a892c8d52c02284 Satya Tangirala 2020-05-14  216  		bio->bi_crypt_context->bc_key->crypto_cfg.data_unit_size;
a892c8d52c02284 Satya Tangirala 2020-05-14  217  	struct bvec_iter iter;
a892c8d52c02284 Satya Tangirala 2020-05-14  218  	struct bio_vec bv;
a892c8d52c02284 Satya Tangirala 2020-05-14  219  
a892c8d52c02284 Satya Tangirala 2020-05-14 @220  	bio_for_each_segment(bv, bio, iter) {
a892c8d52c02284 Satya Tangirala 2020-05-14  221  		if (!IS_ALIGNED(bv.bv_len | bv.bv_offset, data_unit_size))
a892c8d52c02284 Satya Tangirala 2020-05-14  222  			return false;
a892c8d52c02284 Satya Tangirala 2020-05-14  223  	}
a892c8d52c02284 Satya Tangirala 2020-05-14  224  
a892c8d52c02284 Satya Tangirala 2020-05-14  225  	return true;
a892c8d52c02284 Satya Tangirala 2020-05-14  226  }
a892c8d52c02284 Satya Tangirala 2020-05-14  227  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
