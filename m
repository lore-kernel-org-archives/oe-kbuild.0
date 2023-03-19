Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBE8A46
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 04:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679201464; x=1710737464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTBDxcOIdOSgyCApVIVL+D/fJZIH2Hp0RA0ujqnq6EI=;
  b=T+4igBy77lvk6Fuu2M1c5dHWDQS9xPh/SsVlgig+GtfrT3kLwIBl2a3k
   Y/jf4Wl4HBqNFlPxzYn+V0G9W6iqXNPBWVzr1gP6gkZWxvjYzlZXzQyve
   eoWU5TOnVyig2fzCHciuAvUHGkcfjqq3weM0j7wRZZ/LSbNSUUr2+pTJQ
   VbJRXYrm92GMWGK0zMR2TyjGPkHSgQsF8qS44Bno5sfMQq7/lkF3lwMXh
   8Lvkbem5oWkw2y5uwY65ACR8zaF9PONRcRpQ5tdQDFRqKRNezyhJmcOMr
   x9/64Qalxj5mG+zTBxB3rjkMcZHAuQpRyReBlzmCTEqinUEqm2Hkx02oZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="424757497"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="424757497"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 21:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="673981636"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="673981636"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2023 21:51:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdl0X-000AP0-0N;
	Sun, 19 Mar 2023 04:51:01 +0000
Date: Sun, 19 Mar 2023 12:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/zonefs/file.c:441 zonefs_file_dio_append() error: uninitialized
 symbol 'size'.
Message-ID: <202303191227.GL8Dprbi-lkp@intel.com>
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
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 4008e2a0b01aba982356fd15b128a47bf11bd9c7 zonefs: Reorganize code
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191227.GL8Dprbi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303191227.GL8Dprbi-lkp@intel.com/

New smatch warnings:
fs/zonefs/file.c:441 zonefs_file_dio_append() error: uninitialized symbol 'size'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/size +441 fs/zonefs/file.c

4008e2a0b01aba Damien Le Moal 2022-11-25  377  
4008e2a0b01aba Damien Le Moal 2022-11-25  378  static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
4008e2a0b01aba Damien Le Moal 2022-11-25  379  {
4008e2a0b01aba Damien Le Moal 2022-11-25  380  	struct inode *inode = file_inode(iocb->ki_filp);
4008e2a0b01aba Damien Le Moal 2022-11-25  381  	struct zonefs_inode_info *zi = ZONEFS_I(inode);
4008e2a0b01aba Damien Le Moal 2022-11-25  382  	struct block_device *bdev = inode->i_sb->s_bdev;
4008e2a0b01aba Damien Le Moal 2022-11-25  383  	unsigned int max = bdev_max_zone_append_sectors(bdev);
4008e2a0b01aba Damien Le Moal 2022-11-25  384  	struct bio *bio;
4008e2a0b01aba Damien Le Moal 2022-11-25  385  	ssize_t size;
4008e2a0b01aba Damien Le Moal 2022-11-25  386  	int nr_pages;
4008e2a0b01aba Damien Le Moal 2022-11-25  387  	ssize_t ret;
4008e2a0b01aba Damien Le Moal 2022-11-25  388  
4008e2a0b01aba Damien Le Moal 2022-11-25  389  	max = ALIGN_DOWN(max << SECTOR_SHIFT, inode->i_sb->s_blocksize);
4008e2a0b01aba Damien Le Moal 2022-11-25  390  	iov_iter_truncate(from, max);
4008e2a0b01aba Damien Le Moal 2022-11-25  391  
4008e2a0b01aba Damien Le Moal 2022-11-25  392  	nr_pages = iov_iter_npages(from, BIO_MAX_VECS);
4008e2a0b01aba Damien Le Moal 2022-11-25  393  	if (!nr_pages)
4008e2a0b01aba Damien Le Moal 2022-11-25  394  		return 0;
4008e2a0b01aba Damien Le Moal 2022-11-25  395  
4008e2a0b01aba Damien Le Moal 2022-11-25  396  	bio = bio_alloc(bdev, nr_pages,
4008e2a0b01aba Damien Le Moal 2022-11-25  397  			REQ_OP_ZONE_APPEND | REQ_SYNC | REQ_IDLE, GFP_NOFS);
4008e2a0b01aba Damien Le Moal 2022-11-25  398  	bio->bi_iter.bi_sector = zi->i_zsector;
4008e2a0b01aba Damien Le Moal 2022-11-25  399  	bio->bi_ioprio = iocb->ki_ioprio;
4008e2a0b01aba Damien Le Moal 2022-11-25  400  	if (iocb_is_dsync(iocb))
4008e2a0b01aba Damien Le Moal 2022-11-25  401  		bio->bi_opf |= REQ_FUA;
4008e2a0b01aba Damien Le Moal 2022-11-25  402  
4008e2a0b01aba Damien Le Moal 2022-11-25  403  	ret = bio_iov_iter_get_pages(bio, from);
4008e2a0b01aba Damien Le Moal 2022-11-25  404  	if (unlikely(ret))
4008e2a0b01aba Damien Le Moal 2022-11-25  405  		goto out_release;
4008e2a0b01aba Damien Le Moal 2022-11-25  406  
4008e2a0b01aba Damien Le Moal 2022-11-25  407  	size = bio->bi_iter.bi_size;
4008e2a0b01aba Damien Le Moal 2022-11-25  408  	task_io_account_write(size);
4008e2a0b01aba Damien Le Moal 2022-11-25  409  
4008e2a0b01aba Damien Le Moal 2022-11-25  410  	if (iocb->ki_flags & IOCB_HIPRI)
4008e2a0b01aba Damien Le Moal 2022-11-25  411  		bio_set_polled(bio, iocb);
4008e2a0b01aba Damien Le Moal 2022-11-25  412  
4008e2a0b01aba Damien Le Moal 2022-11-25  413  	ret = submit_bio_wait(bio);
4008e2a0b01aba Damien Le Moal 2022-11-25  414  
4008e2a0b01aba Damien Le Moal 2022-11-25  415  	/*
4008e2a0b01aba Damien Le Moal 2022-11-25  416  	 * If the file zone was written underneath the file system, the zone
4008e2a0b01aba Damien Le Moal 2022-11-25  417  	 * write pointer may not be where we expect it to be, but the zone
4008e2a0b01aba Damien Le Moal 2022-11-25  418  	 * append write can still succeed. So check manually that we wrote where
4008e2a0b01aba Damien Le Moal 2022-11-25  419  	 * we intended to, that is, at zi->i_wpoffset.
4008e2a0b01aba Damien Le Moal 2022-11-25  420  	 */
4008e2a0b01aba Damien Le Moal 2022-11-25  421  	if (!ret) {
4008e2a0b01aba Damien Le Moal 2022-11-25  422  		sector_t wpsector =
4008e2a0b01aba Damien Le Moal 2022-11-25  423  			zi->i_zsector + (zi->i_wpoffset >> SECTOR_SHIFT);
4008e2a0b01aba Damien Le Moal 2022-11-25  424  
4008e2a0b01aba Damien Le Moal 2022-11-25  425  		if (bio->bi_iter.bi_sector != wpsector) {
4008e2a0b01aba Damien Le Moal 2022-11-25  426  			zonefs_warn(inode->i_sb,
4008e2a0b01aba Damien Le Moal 2022-11-25  427  				"Corrupted write pointer %llu for zone at %llu\n",
4008e2a0b01aba Damien Le Moal 2022-11-25  428  				wpsector, zi->i_zsector);
4008e2a0b01aba Damien Le Moal 2022-11-25  429  			ret = -EIO;
4008e2a0b01aba Damien Le Moal 2022-11-25  430  		}
4008e2a0b01aba Damien Le Moal 2022-11-25  431  	}
4008e2a0b01aba Damien Le Moal 2022-11-25  432  
4008e2a0b01aba Damien Le Moal 2022-11-25  433  	zonefs_file_write_dio_end_io(iocb, size, ret, 0);
4008e2a0b01aba Damien Le Moal 2022-11-25  434  	trace_zonefs_file_dio_append(inode, size, ret);
4008e2a0b01aba Damien Le Moal 2022-11-25  435  
4008e2a0b01aba Damien Le Moal 2022-11-25  436  out_release:
4008e2a0b01aba Damien Le Moal 2022-11-25  437  	bio_release_pages(bio, false);
4008e2a0b01aba Damien Le Moal 2022-11-25  438  	bio_put(bio);
4008e2a0b01aba Damien Le Moal 2022-11-25  439  
4008e2a0b01aba Damien Le Moal 2022-11-25  440  	if (ret >= 0) {
4008e2a0b01aba Damien Le Moal 2022-11-25 @441  		iocb->ki_pos += size;
4008e2a0b01aba Damien Le Moal 2022-11-25  442  		return size;
4008e2a0b01aba Damien Le Moal 2022-11-25  443  	}
4008e2a0b01aba Damien Le Moal 2022-11-25  444  
4008e2a0b01aba Damien Le Moal 2022-11-25  445  	return ret;
4008e2a0b01aba Damien Le Moal 2022-11-25  446  }
4008e2a0b01aba Damien Le Moal 2022-11-25  447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
