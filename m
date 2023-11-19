Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42061103
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Nov 2023 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTJkFtP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700376613; x=1731912613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ga4TomQP836U5BEa00rUL4oPcQUbOE2HmmnBxFPapLw=;
  b=GTJkFtP2wiSNx3NW2OoBgxuO6SXwfquklM/cN2vxJUjfogYgnZias2N3
   qOOqx2lnQtiB7ifoi3Ld2i/BLd7bSYDNRARfr31/WObpfhXbPiWcnOqxe
   bxINYuZu8irv14PJEQZah3mQu+DWoqqUocnQGDappqhMkBYSOm5ax/TDJ
   wrAp45oVeoIIrhr7f8XE1bPt/41ElKqzYbS3fnThRRWTFaJUTvtR1njzp
   1C6N7LRobtbVxGu2UUtLQnYR8RHJJvcCQn88AUPsnmuyRgLEGFynXBl/U
   5m6BAltR+GnFnKu+VK453qoRvoNbwGYVUxW+2H/hGVPSNUNBgCNhX1mxT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="13026591"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="13026591"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 22:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="14276911"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2023 22:50:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4bdA-0004kF-31;
	Sun, 19 Nov 2023 06:50:08 +0000
Date: Sun, 19 Nov 2023 14:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/elevator.c:190:9: sparse: sparse: cast from restricted
 req_flags_t
Message-ID: <202311191404.68N0gvLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: aa9f10d57056cea51d41283d3785bccbbb9f459e hardening: Move BUG_ON_DATA_CORRUPTION to hardening options
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r112-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191404.68N0gvLE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191404.68N0gvLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311191404.68N0gvLE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/elevator.c:190:9: sparse: sparse: cast from restricted req_flags_t
   block/elevator.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +190 block/elevator.c

9817064b68fef7 Jens Axboe        2006-07-28  185  
70b3ea056f3074 Jens Axboe        2016-12-07  186  void elv_rqhash_add(struct request_queue *q, struct request *rq)
9817064b68fef7 Jens Axboe        2006-07-28  187  {
b374d18a4bfce7 Jens Axboe        2008-10-31  188  	struct elevator_queue *e = q->elevator;
9817064b68fef7 Jens Axboe        2006-07-28  189  
9817064b68fef7 Jens Axboe        2006-07-28 @190  	BUG_ON(ELV_ON_HASH(rq));
242d98f077ac0a Sasha Levin       2012-12-17  191  	hash_add(e->hash, &rq->hash, rq_hash_key(rq));
e806402130c9c4 Christoph Hellwig 2016-10-20  192  	rq->rq_flags |= RQF_HASHED;
9817064b68fef7 Jens Axboe        2006-07-28  193  }
bd166ef183c263 Jens Axboe        2017-01-17  194  EXPORT_SYMBOL_GPL(elv_rqhash_add);
9817064b68fef7 Jens Axboe        2006-07-28  195  

:::::: The code at line 190 was first introduced by commit
:::::: 9817064b68fef7e4580c6df1ea597e106b9ff88b [PATCH] elevator: move the backmerging logic into the elevator core

:::::: TO: Jens Axboe <axboe@suse.de>
:::::: CC: Jens Axboe <axboe@nelson.home.kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
