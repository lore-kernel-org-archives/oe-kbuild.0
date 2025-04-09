Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988A270EBF
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Apr 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217913; cv=none; b=dVHm7tAYXTw+QduabqSIWy4fG0tkm/oFEphtJLXDmgmzr73XdLbYWPWg6PnTz2mv1ReSG+QRewF9gsRbOxjKdKF1kLPYA11J6VJkMCBxqU7f9I1A2ZQ/u+ndsKBZX+uT64uhN0NY7Cz33VlyeKeh2B8ZcDFTsGEVXgKHnMSA+RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217913; c=relaxed/simple;
	bh=QmsEPnnAjuVeBQkUtSYQ95B1sVb1xjA54xixdL2MaTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8ToH+T4557OrSo8MdxIV+PdfdHFlg5Rf4JZzs3qjj5HgajKWlnh74tUG0pTyen6eA0tA5CqILrzpWRblKDERj2h0UzpXW0D0R5aJiQkiwT9jjM5JTqjACOcuGUL8YbFIGP2NqUCxirz38J9WwZC38IvjvNsXMUxlTpv0H20JkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3Yq1EB6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3Yq1EB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744217911; x=1775753911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QmsEPnnAjuVeBQkUtSYQ95B1sVb1xjA54xixdL2MaTc=;
  b=n3Yq1EB6nauQaNbfxGXSbmaPQoYEG0049DkqlCnStCdVLC71d6gTsarf
   KW0AekA/gyuI0gQoedW4ExouIRNG/8YtLOwy+gR97O68cfm5OIaK0yy4f
   oZ7dZ6zI4U8MIf0IFeXRX/L/QeYiNhxskdWUhugr0+Amp2N1h1aAndbdN
   ajjW5F+yQHwuETVqpvv0x6ZjuSltoroRYeYy+rNkoBkKayWQCiWGg4zth
   qS8DyEIGyrrAKZnCyFh3G0a3TnE54cXTYAFl6GbbEUTLqgEnO1yKjo2sh
   ZfUjIoPON6sIgn7O1uXdvw5hJNukziBM8BOlsFEsT9UUNnJJ4GG/jvQrx
   Q==;
X-CSE-ConnectionGUID: BbG4yI+CQ3GLS1yuydDwMA==
X-CSE-MsgGUID: WqWW9SF8TGmXyRbH54JD/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49369358"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="49369358"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:58:28 -0700
X-CSE-ConnectionGUID: yc6RrM5BRByMReYaNmam5w==
X-CSE-MsgGUID: qm2mkNKUQJ+hoTLEhJHjoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="132783578"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Apr 2025 09:58:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Ykp-00097r-2B;
	Wed, 09 Apr 2025 16:58:23 +0000
Date: Thu, 10 Apr 2025 00:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2141/2762] drivers/block/zram/zram_drv.c:840
 zram_writeback_slots() error: uninitialized symbol 'ret'.
Message-ID: <202504100035.FTgPBbag-lkp@intel.com>
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
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Brian Geffon <bgeffon@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46086739de22d72319e37c37a134d32db52e1c5c
commit: 4529d2d13fd12ebe65cb78a8b888575ececde98f [2141/2762] zram: modernize writeback interface
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250409 (https://download.01.org/0day-ci/archive/20250410/202504100035.FTgPBbag-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504100035.FTgPBbag-lkp@intel.com/

New smatch warnings:
drivers/block/zram/zram_drv.c:840 zram_writeback_slots() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/block/zram/zram_drv.c:1364 algorithm_params_store() warn: error code type promoted to positive: 'prio'

vim +/ret +840 drivers/block/zram/zram_drv.c

8e654f8fbff52a Minchan Kim        2017-09-06  736  
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  737  static int zram_writeback_slots(struct zram *zram, struct zram_pp_ctl *ctl)
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  738  {
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  739  	unsigned long blk_idx = 0;
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  740  	struct page *page = NULL;
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  741  	struct zram_pp_slot *pps;
a939888ec38bf1 Minchan Kim        2018-12-28  742  	struct bio_vec bio_vec;
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  743  	struct bio bio;
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  744  	int ret, err;
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  745  	u32 index;
a939888ec38bf1 Minchan Kim        2018-12-28  746  
a939888ec38bf1 Minchan Kim        2018-12-28  747  	page = alloc_page(GFP_KERNEL);
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  748  	if (!page)
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  749  		return -ENOMEM;
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  750  
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  751  	while ((pps = select_pp_slot(ctl))) {
1d69a3f8ae77e3 Minchan Kim        2019-01-08  752  		spin_lock(&zram->wb_limit_lock);
1d69a3f8ae77e3 Minchan Kim        2019-01-08  753  		if (zram->wb_limit_enable && !zram->bd_wb_limit) {
1d69a3f8ae77e3 Minchan Kim        2019-01-08  754  			spin_unlock(&zram->wb_limit_lock);
bb416d18b850fa Minchan Kim        2018-12-28  755  			ret = -EIO;
bb416d18b850fa Minchan Kim        2018-12-28  756  			break;
bb416d18b850fa Minchan Kim        2018-12-28  757  		}
1d69a3f8ae77e3 Minchan Kim        2019-01-08  758  		spin_unlock(&zram->wb_limit_lock);
bb416d18b850fa Minchan Kim        2018-12-28  759  
a939888ec38bf1 Minchan Kim        2018-12-28  760  		if (!blk_idx) {
a939888ec38bf1 Minchan Kim        2018-12-28  761  			blk_idx = alloc_block_bdev(zram);
a939888ec38bf1 Minchan Kim        2018-12-28  762  			if (!blk_idx) {
a939888ec38bf1 Minchan Kim        2018-12-28  763  				ret = -ENOSPC;
a939888ec38bf1 Minchan Kim        2018-12-28  764  				break;
a939888ec38bf1 Minchan Kim        2018-12-28  765  			}
a939888ec38bf1 Minchan Kim        2018-12-28  766  		}
a939888ec38bf1 Minchan Kim        2018-12-28  767  
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  768  		index = pps->index;
a939888ec38bf1 Minchan Kim        2018-12-28  769  		zram_slot_lock(zram, index);
a939888ec38bf1 Minchan Kim        2018-12-28  770  		/*
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  771  		 * scan_slots() sets ZRAM_PP_SLOT and relases slot lock, so
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  772  		 * slots can change in the meantime. If slots are accessed or
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  773  		 * freed they lose ZRAM_PP_SLOT flag and hence we don't
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  774  		 * post-process them.
a939888ec38bf1 Minchan Kim        2018-12-28  775  		 */
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  776  		if (!zram_test_flag(zram, index, ZRAM_PP_SLOT))
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  777  			goto next;
b8d3ff7bb5111c Sergey Senozhatsky 2024-12-18  778  		if (zram_read_from_zspool(zram, page, index))
b8d3ff7bb5111c Sergey Senozhatsky 2024-12-18  779  			goto next;
a939888ec38bf1 Minchan Kim        2018-12-28  780  		zram_slot_unlock(zram, index);
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  781  
ebb0173df20151 Al Viro            2024-04-28  782  		bio_init(&bio, zram->bdev, &bio_vec, 1,
49add4966d7924 Christoph Hellwig  2022-01-24  783  			 REQ_OP_WRITE | REQ_SYNC);
a939888ec38bf1 Minchan Kim        2018-12-28  784  		bio.bi_iter.bi_sector = blk_idx * (PAGE_SIZE >> 9);
34848c910b9118 Johannes Thumshirn 2023-05-31  785  		__bio_add_page(&bio, page, PAGE_SIZE, 0);
a939888ec38bf1 Minchan Kim        2018-12-28  786  
a939888ec38bf1 Minchan Kim        2018-12-28  787  		/*
a939888ec38bf1 Minchan Kim        2018-12-28  788  		 * XXX: A single page IO would be inefficient for write
a939888ec38bf1 Minchan Kim        2018-12-28  789  		 * but it would be not bad as starter.
a939888ec38bf1 Minchan Kim        2018-12-28  790  		 */
57e0076e6575a7 Minchan Kim        2021-03-12  791  		err = submit_bio_wait(&bio);
57e0076e6575a7 Minchan Kim        2021-03-12  792  		if (err) {
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  793  			release_pp_slot(zram, pps);
57e0076e6575a7 Minchan Kim        2021-03-12  794  			/*
9fda785dbd14cf Sergey Senozhatsky 2022-11-09  795  			 * BIO errors are not fatal, we continue and simply
9fda785dbd14cf Sergey Senozhatsky 2022-11-09  796  			 * attempt to writeback the remaining objects (pages).
9fda785dbd14cf Sergey Senozhatsky 2022-11-09  797  			 * At the same time we need to signal user-space that
9fda785dbd14cf Sergey Senozhatsky 2022-11-09  798  			 * some writes (at least one, but also could be all of
9fda785dbd14cf Sergey Senozhatsky 2022-11-09  799  			 * them) were not successful and we do so by returning
9fda785dbd14cf Sergey Senozhatsky 2022-11-09  800  			 * the most recent BIO error.
57e0076e6575a7 Minchan Kim        2021-03-12  801  			 */
57e0076e6575a7 Minchan Kim        2021-03-12  802  			ret = err;
a939888ec38bf1 Minchan Kim        2018-12-28  803  			continue;
a939888ec38bf1 Minchan Kim        2018-12-28  804  		}
a939888ec38bf1 Minchan Kim        2018-12-28  805  
23eddf39b2c28c Minchan Kim        2018-12-28  806  		atomic64_inc(&zram->stats.bd_writes);
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  807  		zram_slot_lock(zram, index);
a939888ec38bf1 Minchan Kim        2018-12-28  808  		/*
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  809  		 * Same as above, we release slot lock during writeback so
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  810  		 * slot can change under us: slot_free() or slot_free() and
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  811  		 * reallocation (zram_write_page()). In both cases slot loses
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  812  		 * ZRAM_PP_SLOT flag. No concurrent post-processing can set
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  813  		 * ZRAM_PP_SLOT on such slots until current post-processing
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  814  		 * finishes.
a939888ec38bf1 Minchan Kim        2018-12-28  815  		 */
5e99893444a0e0 Sergey Senozhatsky 2024-09-17  816  		if (!zram_test_flag(zram, index, ZRAM_PP_SLOT))
a939888ec38bf1 Minchan Kim        2018-12-28  817  			goto next;
a939888ec38bf1 Minchan Kim        2018-12-28  818  
a939888ec38bf1 Minchan Kim        2018-12-28  819  		zram_free_page(zram, index);
a939888ec38bf1 Minchan Kim        2018-12-28  820  		zram_set_flag(zram, index, ZRAM_WB);
b4444a849f1827 Sergey Senozhatsky 2024-12-18  821  		zram_set_handle(zram, index, blk_idx);
a939888ec38bf1 Minchan Kim        2018-12-28  822  		blk_idx = 0;
a939888ec38bf1 Minchan Kim        2018-12-28  823  		atomic64_inc(&zram->stats.pages_stored);
1d69a3f8ae77e3 Minchan Kim        2019-01-08  824  		spin_lock(&zram->wb_limit_lock);
1d69a3f8ae77e3 Minchan Kim        2019-01-08  825  		if (zram->wb_limit_enable && zram->bd_wb_limit > 0)
1d69a3f8ae77e3 Minchan Kim        2019-01-08  826  			zram->bd_wb_limit -=  1UL << (PAGE_SHIFT - 12);
1d69a3f8ae77e3 Minchan Kim        2019-01-08  827  		spin_unlock(&zram->wb_limit_lock);
a939888ec38bf1 Minchan Kim        2018-12-28  828  next:
a939888ec38bf1 Minchan Kim        2018-12-28  829  		zram_slot_unlock(zram, index);
330edc2bc059a4 Sergey Senozhatsky 2024-09-17  830  		release_pp_slot(zram, pps);
424d0e5828ada9 Sergey Senozhatsky 2024-12-18  831  
424d0e5828ada9 Sergey Senozhatsky 2024-12-18  832  		cond_resched();
a939888ec38bf1 Minchan Kim        2018-12-28  833  	}
a939888ec38bf1 Minchan Kim        2018-12-28  834  
a939888ec38bf1 Minchan Kim        2018-12-28  835  	if (blk_idx)
a939888ec38bf1 Minchan Kim        2018-12-28  836  		free_block_bdev(zram, blk_idx);
a6d2193b3ef53d Sergey Senozhatsky 2025-03-03  837  	if (page)
a6d2193b3ef53d Sergey Senozhatsky 2025-03-03  838  		__free_page(page);
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  839  
4529d2d13fd12e Sergey Senozhatsky 2025-03-27 @840  	return ret;
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  841  }
4529d2d13fd12e Sergey Senozhatsky 2025-03-27  842  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
