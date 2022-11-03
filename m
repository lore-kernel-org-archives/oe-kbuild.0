Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FEBA23
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Nov 2022 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667465149; x=1699001149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AuOnXmyGob245PDpJJyyp4+qWVK9D/unItnu7/aUOgw=;
  b=O0d9RjZzJn19vgcPkcDmvVEzrfvi0NE4XPP3LCBbpHBUdOl93pHNPp/X
   rYvhtyATJWym/UVb8mx5R73a0+L4Y9gxReZPoY6NTn4ZgJdPZ+Kgx8Vo3
   sqxigD1JRu+4izE05ZGhwy/WyWd2I+2mxx5m23XhZ1KEuYEeiyzSiTVjV
   PQ88cNU8JrLJynVic74uxg2ITSsyCp0xX0hl6rDvz8x2z8QTHclHVQwj8
   x3BuMrRwv3rKDVZbxQk1iRSgygGuFA0A+pgOxSSCiPPChvAHTcK0SW8Q2
   hL8bfkjWt9hXYt1/Qh96hKIN8tg6fjZfTqQKV6CBBNj7z2mBxyseGxgWL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="292945607"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="292945607"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 01:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="665885891"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="665885891"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 01:45:48 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqVr9-000Fii-1N;
	Thu, 03 Nov 2022 08:45:47 +0000
Date: Thu, 3 Nov 2022 16:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/bdev.c:543:11: warning: Parameter 'holder' can be declared as
 pointer to const [constParameter]
Message-ID: <202211040055.r7nq5JG6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: block/bdev.c:543:11: warning: Parameter 'holder' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e5423e991e8cd0988d0c4a3f4ac4ca1af7d148a
commit: e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b block: don't include blk-mq.h in blk.h
date:   11 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 11 months ago
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/bdev.c:543:11: warning: Parameter 'holder' can be declared as pointer to const [constParameter]
       void *holder)
             ^
   block/bdev.c:605:65: warning: Parameter 'holder' can be declared as pointer to const [constParameter]
   static void bd_clear_claiming(struct block_device *whole, void *holder)
                                                                   ^

vim +/holder +543 block/bdev.c

^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  527  
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  528  /**
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  529   * bd_may_claim - test whether a block device can be claimed
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  530   * @bdev: block device of interest
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  531   * @whole: whole block device containing @bdev, may equal @bdev
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  532   * @holder: holder trying to claim @bdev
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  533   *
25985edcedea63 fs/block_dev.c Lucas De Marchi 2011-03-30  534   * Test whether @bdev can be claimed by @holder.
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  535   *
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  536   * CONTEXT:
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  537   * spin_lock(&bdev_lock).
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  538   *
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  539   * RETURNS:
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  540   * %true if @bdev can be claimed, %false otherwise.
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  541   */
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  542  static bool bd_may_claim(struct block_device *bdev, struct block_device *whole,
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07 @543  			 void *holder)
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  544  {
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  545  	if (bdev->bd_holder == holder)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  546  		return true;	 /* already a holder */
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  547  	else if (bdev->bd_holder != NULL)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  548  		return false; 	 /* held by someone else */
bcc7f5b4bee8e3 fs/block_dev.c NeilBrown       2016-12-12  549  	else if (whole == bdev)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  550  		return true;  	 /* is a whole device which isn't held */
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  551  
e525fd89d380c4 fs/block_dev.c Tejun Heo       2010-11-13  552  	else if (whole->bd_holder == bd_may_claim)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  553  		return true; 	 /* is a partition of a device that is being partitioned */
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  554  	else if (whole->bd_holder != NULL)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  555  		return false;	 /* is a partition of a held device */
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  556  	else
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  557  		return true;	 /* is a partition of an un-held device */
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  558  }
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  559  

:::::: The code at line 543 was first introduced by commit
:::::: 1a3cbbc5a5e8a66934aa0947896a4aca6fd77298 block: factor out bd_may_claim()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
