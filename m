Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28933E1
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6t2Kqsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702192115; x=1733728115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FD5rRz4bTzOnNSaJD7F4UtvkzDOOs0iGws63He98Vjw=;
  b=N6t2Kqsz92VtGRkx0uXdETyTq4X2B+kncsBYfTcXPkEGPV4N0EGH05Eo
   VofqTrQByoL6E2W/rzzJogO0ZnDlV4oyrapMMf7DYrCXa0kkj8jxKoFrS
   JH/nY+JjToHTkhDwerGIsxhp3x9wZw2FZHNXp9by+Au6rMx5mrrFW9JjK
   fF12E13QozN1Y/1E2j6vSbBHvJarQ+eKKFrGbOVrxgb2dqlREm81dLyLW
   OYZtTazYda0+hJF/j3yfZlgmVyqgUhtjefDjoEAR9Dq5ZbHuSjPNzti9i
   nwG1Z+yUEQikE46LrfkO0u/echj84ecQo0FdrjWpR2+YiJRRThoRjuljK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374701056"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="374701056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 23:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="801586678"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="801586678"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2023 23:08:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCDvS-000GVw-2u;
	Sun, 10 Dec 2023 07:08:30 +0000
Date: Sun, 10 Dec 2023 15:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/btrfs/bio.c:94:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 96.
Message-ID: <202312101543.FmIiAmKR-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 7609afac677546b225d8327d726cc558d3666496 btrfs: handle checksum validation and repair at the storage layer
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-104-20231210 (https://download.01.org/0day-ci/archive/20231210/202312101543.FmIiAmKR-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101543.FmIiAmKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312101543.FmIiAmKR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/bio.c:94:5-24: WARNING: atomic_dec_and_test variation before object free at line 96.

vim +94 fs/btrfs/bio.c

7609afac677546 Christoph Hellwig 2023-01-21  91  
7609afac677546 Christoph Hellwig 2023-01-21  92  static void btrfs_repair_done(struct btrfs_failed_bio *fbio)
7609afac677546 Christoph Hellwig 2023-01-21  93  {
7609afac677546 Christoph Hellwig 2023-01-21 @94  	if (atomic_dec_and_test(&fbio->repair_count)) {
7609afac677546 Christoph Hellwig 2023-01-21  95  		fbio->bbio->end_io(fbio->bbio);
7609afac677546 Christoph Hellwig 2023-01-21 @96  		mempool_free(fbio, &btrfs_failed_bio_pool);
7609afac677546 Christoph Hellwig 2023-01-21  97  	}
7609afac677546 Christoph Hellwig 2023-01-21  98  }
7609afac677546 Christoph Hellwig 2023-01-21  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
