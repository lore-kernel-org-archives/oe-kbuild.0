Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43782565
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667809534; x=1699345534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W5BTgmyAkYLeDylsVp5Ua+fUjqJNFpuOWG17tNWbq+M=;
  b=axKv5jXZYexL8fez7MJ6k3JQaOXK/LHvHeu2XObqNjT/K+5rMYyJ3b7a
   AUU/pvgZbpMkMsztycPe9WbSkF6VG0BO8m3atgWhEijOMlCNQp/pKWFpu
   /0lsW9HusRuJzZ8N3uG+9OWlhEzeaUB4Cx8etW/3rUftIBRV1fMZOCyMC
   xU4UZufrjs1zT2IMigJdauswSH2cNj3giU9BMWtoh2W+iP/vNnRgYj47J
   QHMB25syLolEc8Qwtr9Yla5zcYodtZ4g56batOoCfBib7KQv7sx9Pe7ZM
   C9fEYnFnqwnsW4BpkLCbmB1gMCFiv6hyTaov6qOpXkhris+epdgmgAUM1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="297848229"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="297848229"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 00:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="613783420"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="613783420"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Nov 2022 00:25:33 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orxRk-0000SG-1v;
	Mon, 07 Nov 2022 08:25:32 +0000
Date: Mon, 7 Nov 2022 16:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/block/brd.c:443:18: warning: Uninitialized variables:
 brd.brd_number, brd.brd_list, brd.brd_lock, brd.brd_pages, brd.brd_nr_pages
 [uninitvar]
Message-ID: <202211071608.SpbXUh9K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/block/brd.c:443:18: warning: Uninitialized variables: brd.brd_number, brd.brd_list, brd.brd_lock, brd.brd_pages, brd.brd_nr_pages [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: 00358933f66c44d511368a57eb421e172447cfb9 brd: remove brd_devices_mutex mutex
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 00358933f66c44d511368a57eb421e172447cfb9
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/block/brd.c:443:18: warning: Uninitialized variables: brd.brd_number, brd.brd_list, brd.brd_lock, brd.brd_pages, brd.brd_nr_pages [uninitvar]
     brd_free_pages(brd);
                    ^

vim +443 drivers/block/brd.c

9db5579be4bb53 Nicholas Piggin   2008-02-08  433  
00358933f66c44 Tetsuo Handa      2022-01-06  434  static void brd_cleanup(void)
9db5579be4bb53 Nicholas Piggin   2008-02-08  435  {
00358933f66c44 Tetsuo Handa      2022-01-06  436  	struct brd_device *brd, *next;
00358933f66c44 Tetsuo Handa      2022-01-06  437  
00358933f66c44 Tetsuo Handa      2022-01-06  438  	debugfs_remove_recursive(brd_debugfs_dir);
00358933f66c44 Tetsuo Handa      2022-01-06  439  
00358933f66c44 Tetsuo Handa      2022-01-06  440  	list_for_each_entry_safe(brd, next, &brd_devices, brd_list) {
9db5579be4bb53 Nicholas Piggin   2008-02-08  441  		del_gendisk(brd->brd_disk);
7f9b348cb5e942 Christoph Hellwig 2021-05-21  442  		blk_cleanup_disk(brd->brd_disk);
7f9b348cb5e942 Christoph Hellwig 2021-05-21 @443  		brd_free_pages(brd);
f7bf35862477d6 Tetsuo Handa      2021-09-07  444  		list_del(&brd->brd_list);
7f9b348cb5e942 Christoph Hellwig 2021-05-21  445  		kfree(brd);
9db5579be4bb53 Nicholas Piggin   2008-02-08  446  	}
00358933f66c44 Tetsuo Handa      2022-01-06  447  }
9db5579be4bb53 Nicholas Piggin   2008-02-08  448  

:::::: The code at line 443 was first introduced by commit
:::::: 7f9b348cb5e94259acdcbafbcaed55d3bb515304 brd: convert to blk_alloc_disk/blk_cleanup_disk

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
