Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E072F22
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Dec 2022 23:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670369545; x=1701905545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGNcLbK1Re9Jg1Bc20PfNgcHRAvSgZEsY50/p6dwD4g=;
  b=L8v5yizRu9Zk4ImyoLBIhGCxIv8AoFXT7YCuH/SHC5FNmWILqXk7VrvM
   bPTzqiY5sefT/zFalv8ZWF2ZaT3tMkbMhgZ3RfiJiEztiaoiQV43dderE
   NeUnwhkVwmSaT4VV07SvCB8MXbQMXj3eImEd1v1ouO9Hhcb61VljMBWFa
   agkObgWTeaOJUIMU13pWmt+gDjLl4sY9UTOkawgM/gwdr+cZT5QUPFabf
   JJgW3L4FImp4hg5aDzwk7Xf6VwvJjI88S4OnjTtO2N0fIr6wDeRUERoip
   nwBA+uwc6YEla8Vfuf/pk19iaKP6fKd/61pCZrROmDA0bwqNGKHo8tUy2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="297114251"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="297114251"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 15:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="891571132"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="891571132"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2022 15:32:23 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2hQE-0001Kf-2q;
	Tue, 06 Dec 2022 23:32:22 +0000
Date: Wed, 7 Dec 2022 07:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 02/10] block: Add copy offload support infrastructure
Message-ID: <202212070713.93ZTSWtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: block/blk-lib.c:464:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20221123055827.26996-3-nj.shetty@samsung.com>
References: <20221123055827.26996-3-nj.shetty@samsung.com>
TO: Nitesh Shetty <nj.shetty@samsung.com>
TO: axboe@kernel.dk
TO: agk@redhat.com
TO: snitzer@kernel.org
TO: dm-devel@redhat.com
TO: kbusch@kernel.org
TO: hch@lst.de
TO: sagi@grimberg.me
TO: james.smart@broadcom.com
TO: kch@nvidia.com
TO: damien.lemoal@opensource.wdc.com
TO: naohiro.aota@wdc.com
TO: jth@kernel.org
TO: viro@zeniv.linux.org.uk
CC: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-fsdevel@vger.kernel.org
CC: anuj20.g@samsung.com
CC: joshi.k@samsung.com
CC: p.raghav@samsung.com
CC: nitheshshetty@gmail.com
CC: gost.dev@samsung.com
CC: Nitesh Shetty <nj.shetty@samsung.com>

Hi Nitesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20221206]
[cannot apply to device-mapper-dm/for-next linus/master v6.1-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitesh-Shetty/block-Introduce-queue-limits-for-copy-offload-support/20221123-145837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20221123055827.26996-3-nj.shetty%40samsung.com
patch subject: [PATCH v5 02/10] block: Add copy offload support infrastructure
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 101fd213e34571287d11546f15a89f06ae9b9746
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-lib.c:464:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = blk_copy_sanity_check(src_bdev, dst_bdev, ranges, nr);
        ^
   block/blk-lib.c:462:10: note: ret is initialized
    int ret = -EINVAL;
            ^
   block/blk-lib.c:464:6: note: ret is overwritten
    ret = blk_copy_sanity_check(src_bdev, dst_bdev, ranges, nr);
        ^

vim +/ret +464 block/blk-lib.c

101fd213e34571 Nitesh Shetty 2022-11-23  436  
101fd213e34571 Nitesh Shetty 2022-11-23  437  /*
101fd213e34571 Nitesh Shetty 2022-11-23  438   * blkdev_issue_copy - queue a copy
101fd213e34571 Nitesh Shetty 2022-11-23  439   * @src_bdev:	source block device
101fd213e34571 Nitesh Shetty 2022-11-23  440   * @dst_bdev:	destination block device
101fd213e34571 Nitesh Shetty 2022-11-23  441   * @ranges:	array of source/dest/len,
101fd213e34571 Nitesh Shetty 2022-11-23  442   *		ranges are expected to be allocated/freed by caller
101fd213e34571 Nitesh Shetty 2022-11-23  443   * @nr:		number of source ranges to copy
101fd213e34571 Nitesh Shetty 2022-11-23  444   * @end_io:	end_io function to be called on completion of copy operation,
101fd213e34571 Nitesh Shetty 2022-11-23  445   *		for synchronous operation this should be NULL
101fd213e34571 Nitesh Shetty 2022-11-23  446   * @private:	end_io function will be called with this private data, should be
101fd213e34571 Nitesh Shetty 2022-11-23  447   *		NULL, if operation is synchronous in nature
101fd213e34571 Nitesh Shetty 2022-11-23  448   * @gfp_mask:   memory allocation flags (for bio_alloc)
101fd213e34571 Nitesh Shetty 2022-11-23  449   *
101fd213e34571 Nitesh Shetty 2022-11-23  450   * Description:
101fd213e34571 Nitesh Shetty 2022-11-23  451   *	Copy source ranges from source block device to destination block
101fd213e34571 Nitesh Shetty 2022-11-23  452   *	device. length of a source range cannot be zero. Max total length of
101fd213e34571 Nitesh Shetty 2022-11-23  453   *	copy is limited to MAX_COPY_TOTAL_LENGTH and also maximum number of
101fd213e34571 Nitesh Shetty 2022-11-23  454   *	entries is limited to MAX_COPY_NR_RANGE
101fd213e34571 Nitesh Shetty 2022-11-23  455   */
101fd213e34571 Nitesh Shetty 2022-11-23  456  int blkdev_issue_copy(struct block_device *src_bdev,
101fd213e34571 Nitesh Shetty 2022-11-23  457  	struct block_device *dst_bdev, struct range_entry *ranges, int nr,
101fd213e34571 Nitesh Shetty 2022-11-23  458  	cio_iodone_t end_io, void *private, gfp_t gfp_mask)
101fd213e34571 Nitesh Shetty 2022-11-23  459  {
101fd213e34571 Nitesh Shetty 2022-11-23  460  	struct request_queue *src_q = bdev_get_queue(src_bdev);
101fd213e34571 Nitesh Shetty 2022-11-23  461  	struct request_queue *dst_q = bdev_get_queue(dst_bdev);
101fd213e34571 Nitesh Shetty 2022-11-23  462  	int ret = -EINVAL;
101fd213e34571 Nitesh Shetty 2022-11-23  463  
101fd213e34571 Nitesh Shetty 2022-11-23 @464  	ret = blk_copy_sanity_check(src_bdev, dst_bdev, ranges, nr);
101fd213e34571 Nitesh Shetty 2022-11-23  465  	if (ret)
101fd213e34571 Nitesh Shetty 2022-11-23  466  		return ret;
101fd213e34571 Nitesh Shetty 2022-11-23  467  
101fd213e34571 Nitesh Shetty 2022-11-23  468  	if (blk_check_copy_offload(src_q, dst_q))
101fd213e34571 Nitesh Shetty 2022-11-23  469  		ret = blk_copy_offload(src_bdev, dst_bdev, ranges, nr,
101fd213e34571 Nitesh Shetty 2022-11-23  470  				end_io, private, gfp_mask);
101fd213e34571 Nitesh Shetty 2022-11-23  471  
101fd213e34571 Nitesh Shetty 2022-11-23  472  	return ret;
101fd213e34571 Nitesh Shetty 2022-11-23  473  }
101fd213e34571 Nitesh Shetty 2022-11-23  474  EXPORT_SYMBOL_GPL(blkdev_issue_copy);
101fd213e34571 Nitesh Shetty 2022-11-23  475  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
