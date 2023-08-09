Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A313A1AA83
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Aug 2023 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691605185; x=1723141185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQjotq/35OgwQHIOeabdIjAwaGlExWlWojpyF6A8ioM=;
  b=OLqH1zZ4eQA7qaGR1xeZWbcXX8tj8H4Bo4oou58Yng0xW4/Li4dBlwbk
   svkUee0Vmj3Sfj/yA1/WEIJkmUT65addkT7XPviucDkWblCghGjRkKhNI
   Opmgn5JUxKWWGxHVsHxQ0v2EK4reIwa/e6tuDvdS87cycXN0khisKx8M6
   CWxe/tzi4TNbdjf6zITMGsmSaWbGNs6riBi8ScQK+ysRVVOY5ccNMm3WT
   oQT6hI9iP6T6ZsL5iau9HWav02ve8kHl2qiQb96MbmRuIO5AkAXT+L9bg
   Jakj6wvbdMXM5vftFqNlMAzOhq5/Vmt+MfUswuzNrJEK7EKcDP9IiCTLh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350774568"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="350774568"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 11:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905755323"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="905755323"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Aug 2023 11:19:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTnmW-0006Jm-3D;
	Wed, 09 Aug 2023 18:19:41 +0000
Date: Thu, 10 Aug 2023 02:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8194/8441] drivers/block/ublk_drv.c:445
 ublk_setup_iod_zoned() warn: signedness bug returning '(-95)'
Message-ID: <202308100201.TCRhgdvN-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andreas Hindborg <a.hindborg@samsung.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Ming Lei <ming.lei@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 29802d7ca33bc0a75c9da2a143eeed4f9e99fca4 [8194/8441] ublk: enable zoned storage support
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
config: s390-randconfig-m041-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100201.TCRhgdvN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100201.TCRhgdvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308100201.TCRhgdvN-lkp@intel.com/

New smatch warnings:
drivers/block/ublk_drv.c:445 ublk_setup_iod_zoned() warn: signedness bug returning '(-95)'

Old smatch warnings:
drivers/block/ublk_drv.c:963 ublk_setup_iod() warn: signedness bug returning '(-5)'
drivers/block/ublk_drv.c:1404 ublk_commit_completion() warn: variable dereferenced before check 'req' (see line 1401)

vim +445 drivers/block/ublk_drv.c

29802d7ca33bc0 Andreas Hindborg 2023-08-04  441  
29802d7ca33bc0 Andreas Hindborg 2023-08-04  442  static blk_status_t ublk_setup_iod_zoned(struct ublk_queue *ubq,
29802d7ca33bc0 Andreas Hindborg 2023-08-04  443  					 struct request *req)
29802d7ca33bc0 Andreas Hindborg 2023-08-04  444  {
29802d7ca33bc0 Andreas Hindborg 2023-08-04 @445  	return -EOPNOTSUPP;
29802d7ca33bc0 Andreas Hindborg 2023-08-04  446  }
29802d7ca33bc0 Andreas Hindborg 2023-08-04  447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
