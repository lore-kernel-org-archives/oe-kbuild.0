Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D3C6ADB
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Mar 2023 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680115629; x=1711651629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qr4VJF+TguXemwvpVIMlPFU0cdlRTTVW5bww7+BEbig=;
  b=HHBGp7UxROEPyiSdHUPQpIUHCXcSFVShZzzCESEHQTRRDz3C1aOr9AtD
   YviVkRdFMGLwuf2qqirMBgbvuZZHSJ42MFSSk/hW52CMJXcl6XjjOARcg
   a9Jn5LM6lcJRl+mEJ347qMZvTJQ3Rqf79h5G7FYQ7x66ewVVPgNzQc0ul
   6GnixPzcOOXj4Xerby1/tImo0bB29wRA4TBJeHtuwdEeFmFru9OAHspgv
   57lSiyvSbjAds2TZ855GscjSdkZQI+yuJLjQiJvjKyEyY04JPw21ZD4Uq
   2FL7F3aBsiAtI9ResKxjI1mDnwJiPiN5joKegrtrPIkBOQOhZDyqVp2mi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427246139"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427246139"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 11:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014144476"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="1014144476"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2023 11:47:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phap9-000Jpk-0D;
	Wed, 29 Mar 2023 18:47:07 +0000
Date: Thu, 30 Mar 2023 02:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 2/9] block: Add copy offload support infrastructure
Message-ID: <202303300206.mamLH2Ps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: block/blk-lib.c:342:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230327084103.21601-3-anuj20.g@samsung.com>
References: <20230327084103.21601-3-anuj20.g@samsung.com>
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
patch link:    https://lore.kernel.org/r/20230327084103.21601-3-anuj20.g%40samsung.com
patch subject: [PATCH v8 2/9] block: Add copy offload support infrastructure
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f1e67115ee4c790bb5abd365c7e126bb09752ef1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303300206.mamLH2Ps-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-lib.c:342:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = blk_copy_sanity_check(bdev_in, pos_in, bdev_out, pos_out, len);
        ^
   block/blk-lib.c:340:10: note: ret is initialized
    int ret = -EINVAL;
            ^
   block/blk-lib.c:342:6: note: ret is overwritten
    ret = blk_copy_sanity_check(bdev_in, pos_in, bdev_out, pos_out, len);
        ^

vim +/ret +342 block/blk-lib.c

f1e67115ee4c790 Nitesh Shetty 2023-03-27  314  
f1e67115ee4c790 Nitesh Shetty 2023-03-27  315  /*
f1e67115ee4c790 Nitesh Shetty 2023-03-27  316   * @bdev_in:	source block device
f1e67115ee4c790 Nitesh Shetty 2023-03-27  317   * @pos_in:	source offset
f1e67115ee4c790 Nitesh Shetty 2023-03-27  318   * @bdev_out:	destination block device
f1e67115ee4c790 Nitesh Shetty 2023-03-27  319   * @pos_out:	destination offset
f1e67115ee4c790 Nitesh Shetty 2023-03-27  320   * @len:	length in bytes to be copied
f1e67115ee4c790 Nitesh Shetty 2023-03-27  321   * @end_io:	end_io function to be called on completion of copy operation,
f1e67115ee4c790 Nitesh Shetty 2023-03-27  322   *		for synchronous operation this should be NULL
f1e67115ee4c790 Nitesh Shetty 2023-03-27  323   * @private:	end_io function will be called with this private data, should be
f1e67115ee4c790 Nitesh Shetty 2023-03-27  324   *		NULL, if operation is synchronous in nature
f1e67115ee4c790 Nitesh Shetty 2023-03-27  325   * @gfp_mask:   memory allocation flags (for bio_alloc)
f1e67115ee4c790 Nitesh Shetty 2023-03-27  326   *
f1e67115ee4c790 Nitesh Shetty 2023-03-27  327   * Returns the length of bytes copied or a negative error value
f1e67115ee4c790 Nitesh Shetty 2023-03-27  328   *
f1e67115ee4c790 Nitesh Shetty 2023-03-27  329   * Description:
f1e67115ee4c790 Nitesh Shetty 2023-03-27  330   *	Copy source offset from source block device to destination block
f1e67115ee4c790 Nitesh Shetty 2023-03-27  331   *	device. length of a source range cannot be zero. Max total length of
f1e67115ee4c790 Nitesh Shetty 2023-03-27  332   *	copy is limited to MAX_COPY_TOTAL_LENGTH
f1e67115ee4c790 Nitesh Shetty 2023-03-27  333   */
f1e67115ee4c790 Nitesh Shetty 2023-03-27  334  int blkdev_issue_copy(struct block_device *bdev_in, loff_t pos_in,
f1e67115ee4c790 Nitesh Shetty 2023-03-27  335  		      struct block_device *bdev_out, loff_t pos_out, size_t len,
f1e67115ee4c790 Nitesh Shetty 2023-03-27  336  		      cio_iodone_t end_io, void *private, gfp_t gfp_mask)
f1e67115ee4c790 Nitesh Shetty 2023-03-27  337  {
f1e67115ee4c790 Nitesh Shetty 2023-03-27  338  	struct request_queue *q_in = bdev_get_queue(bdev_in);
f1e67115ee4c790 Nitesh Shetty 2023-03-27  339  	struct request_queue *q_out = bdev_get_queue(bdev_out);
f1e67115ee4c790 Nitesh Shetty 2023-03-27  340  	int ret = -EINVAL;
f1e67115ee4c790 Nitesh Shetty 2023-03-27  341  
f1e67115ee4c790 Nitesh Shetty 2023-03-27 @342  	ret = blk_copy_sanity_check(bdev_in, pos_in, bdev_out, pos_out, len);
f1e67115ee4c790 Nitesh Shetty 2023-03-27  343  	if (ret)
f1e67115ee4c790 Nitesh Shetty 2023-03-27  344  		return ret;
f1e67115ee4c790 Nitesh Shetty 2023-03-27  345  
f1e67115ee4c790 Nitesh Shetty 2023-03-27  346  	if (blk_check_copy_offload(q_in, q_out))
f1e67115ee4c790 Nitesh Shetty 2023-03-27  347  		ret = __blk_copy_offload(bdev_in, pos_in, bdev_out, pos_out,
f1e67115ee4c790 Nitesh Shetty 2023-03-27  348  			   len, end_io, private, gfp_mask);
f1e67115ee4c790 Nitesh Shetty 2023-03-27  349  
f1e67115ee4c790 Nitesh Shetty 2023-03-27  350  	return ret;
f1e67115ee4c790 Nitesh Shetty 2023-03-27  351  }
f1e67115ee4c790 Nitesh Shetty 2023-03-27  352  EXPORT_SYMBOL_GPL(blkdev_issue_copy);
f1e67115ee4c790 Nitesh Shetty 2023-03-27  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
