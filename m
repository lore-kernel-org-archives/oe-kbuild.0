Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDCD7E6
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Apr 2023 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682361060; x=1713897060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHVDSEqTdJq2cFP3DqYdtI4IYd1NWzu1GoRa5Lz3d74=;
  b=bNIAaYYaThpdcT6UjtytEVhAeS3iNM63/JmLdMbVyI9YMD1JLeY31QIR
   qdgtpHbO8UnH5eeDcYrBpvCF04jQabbGcf1xb4bxWcIY21UADokeIjQmH
   iHQJQe5EZZYpYdbo8sPv9O6L+MZ/BC1G//gb+BZh+mNoP3artIzYeuJxn
   dL92mzKqrQbejum22ThRFn8mbfqKR7OPy3yvTCTuP4X7PUCvxiuNY2YKw
   VQB/JgV9b8FUy8JdsHDoIWBtD7idu+4ZQT0yvKZvzf7XDyHhXmdCvywTW
   xQkjConAEBncYLAR8mhI2EYSs2qjE+7umR6JsIrCxSx2qX7ixZuSCVgX6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349329131"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="349329131"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 11:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782490408"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="782490408"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2023 11:29:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr0wn-000iak-2V;
	Mon, 24 Apr 2023 18:29:57 +0000
Date: Tue, 25 Apr 2023 02:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 1/5] block: Don't invalidate pagecache for invalid
 falloc modes
Message-ID: <202304250244.7chpBySd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: block/fops.c:678:2: sparse: sparse: unused label 'fail'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230420004850.297045-2-sarthakkukreti@chromium.org>
References: <20230420004850.297045-2-sarthakkukreti@chromium.org>
TO: Sarthak Kukreti <sarthakkukreti@chromium.org>
TO: dm-devel@redhat.com
TO: linux-block@vger.kernel.org
TO: linux-ext4@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-fsdevel@vger.kernel.org
CC: Jens Axboe <axboe@kernel.dk>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Alasdair Kergon <agk@redhat.com>
CC: Mike Snitzer <snitzer@kernel.org>
CC: Christoph Hellwig <hch@infradead.org>
CC: Brian Foster <bfoster@redhat.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Andreas Dilger <adilger.kernel@dilger.ca>
CC: Bart Van Assche <bvanassche@google.com>
CC: Daniil Lunev <dlunev@google.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

Hi Sarthak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on linus/master v6.3 next-20230421]
[cannot apply to axboe-block/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarthak-Kukreti/block-Introduce-provisioning-primitives/20230420-095025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20230420004850.297045-2-sarthakkukreti%40chromium.org
patch subject: [PATCH v5 1/5] block: Don't invalidate pagecache for invalid falloc modes
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: alpha-randconfig-s032-20230423 (https://download.01.org/0day-ci/archive/20230425/202304250244.7chpBySd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/8bd0744b438be1722c5f8c1fe077e9dcef0e81b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sarthak-Kukreti/block-Introduce-provisioning-primitives/20230420-095025
        git checkout 8bd0744b438be1722c5f8c1fe077e9dcef0e81b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304250244.7chpBySd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/fops.c:678:2: sparse: sparse: unused label 'fail'

vim +/fail +678 block/fops.c

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  613  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  614  #define	BLKDEV_FALLOC_FL_SUPPORTED					\
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  615  		(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |		\
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  616  		 FALLOC_FL_ZERO_RANGE | FALLOC_FL_NO_HIDE_STALE)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  617  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  618  static long blkdev_fallocate(struct file *file, int mode, loff_t start,
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  619  			     loff_t len)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  620  {
f278eb3d8178f9 Ming Lei          2021-09-23  621  	struct inode *inode = bdev_file_inode(file);
f278eb3d8178f9 Ming Lei          2021-09-23  622  	struct block_device *bdev = I_BDEV(inode);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  623  	loff_t end = start + len - 1;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  624  	loff_t isize;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  625  	int error;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  626  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  627  	/* Fail if we don't recognize the flags. */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  628  	if (mode & ~BLKDEV_FALLOC_FL_SUPPORTED)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  629  		return -EOPNOTSUPP;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  630  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  631  	/* Don't go off the end of the device. */
2a93ad8fcb377b Christoph Hellwig 2021-10-18  632  	isize = bdev_nr_bytes(bdev);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  633  	if (start >= isize)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  634  		return -EINVAL;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  635  	if (end >= isize) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  636  		if (mode & FALLOC_FL_KEEP_SIZE) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  637  			len = isize - start;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  638  			end = start + len - 1;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  639  		} else
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  640  			return -EINVAL;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  641  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  642  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  643  	/*
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  644  	 * Don't allow IO that isn't aligned to logical block size.
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  645  	 */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  646  	if ((start | len) & (bdev_logical_block_size(bdev) - 1))
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  647  		return -EINVAL;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  648  
f278eb3d8178f9 Ming Lei          2021-09-23  649  	filemap_invalidate_lock(inode->i_mapping);
f278eb3d8178f9 Ming Lei          2021-09-23  650  
8bd0744b438be1 Sarthak Kukreti   2023-04-19  651  	/*
8bd0744b438be1 Sarthak Kukreti   2023-04-19  652  	 * Invalidate the page cache, including dirty pages, for valid
8bd0744b438be1 Sarthak Kukreti   2023-04-19  653  	 * de-allocate mode calls to fallocate().
8bd0744b438be1 Sarthak Kukreti   2023-04-19  654  	 */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  655  	switch (mode) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  656  	case FALLOC_FL_ZERO_RANGE:
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  657  	case FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE:
8bd0744b438be1 Sarthak Kukreti   2023-04-19  658  		error = truncate_bdev_range(bdev, file->f_mode, start, end) ||
8bd0744b438be1 Sarthak Kukreti   2023-04-19  659  			blkdev_issue_zeroout(bdev, start >> SECTOR_SHIFT,
6549a874fb65e7 Pavel Begunkov    2021-10-20  660  					     len >> SECTOR_SHIFT, GFP_KERNEL,
6549a874fb65e7 Pavel Begunkov    2021-10-20  661  					     BLKDEV_ZERO_NOUNMAP);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  662  		break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  663  	case FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE:
8bd0744b438be1 Sarthak Kukreti   2023-04-19  664  		error = truncate_bdev_range(bdev, file->f_mode, start, end) ||
8bd0744b438be1 Sarthak Kukreti   2023-04-19  665  			blkdev_issue_zeroout(bdev, start >> SECTOR_SHIFT,
6549a874fb65e7 Pavel Begunkov    2021-10-20  666  					     len >> SECTOR_SHIFT, GFP_KERNEL,
6549a874fb65e7 Pavel Begunkov    2021-10-20  667  					     BLKDEV_ZERO_NOFALLBACK);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  668  		break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  669  	case FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE | FALLOC_FL_NO_HIDE_STALE:
8bd0744b438be1 Sarthak Kukreti   2023-04-19  670  		error = truncate_bdev_range(bdev, file->f_mode, start, end) ||
8bd0744b438be1 Sarthak Kukreti   2023-04-19  671  			blkdev_issue_discard(bdev, start >> SECTOR_SHIFT,
44abff2c0b970a Christoph Hellwig 2022-04-15  672  					     len >> SECTOR_SHIFT, GFP_KERNEL);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  673  		break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  674  	default:
f278eb3d8178f9 Ming Lei          2021-09-23  675  		error = -EOPNOTSUPP;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  676  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  677  
f278eb3d8178f9 Ming Lei          2021-09-23 @678   fail:
f278eb3d8178f9 Ming Lei          2021-09-23  679  	filemap_invalidate_unlock(inode->i_mapping);
f278eb3d8178f9 Ming Lei          2021-09-23  680  	return error;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  681  }
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  682  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
