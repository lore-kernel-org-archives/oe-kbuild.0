Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AD97B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676572656; x=1708108656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXXuM23eSVLZZTef+eVb93dLJpeP4N48G8LskTZ20fk=;
  b=TqTFSwwAO4DkeAsZXIwXuNLw4cs2PlBv0Btyvd6eX2NlFPKmqFqR0NW4
   +VABOsjpmyFblMXzUSXwQ4nfS3X3t2exlZfRDTyeBQjrvEGi1Qi3J1grF
   CL/zPi9BwaSQMStFh6VpWBJO2SS4hua3xCQGoSOOwgZIcAXKAdgMdkym1
   l5la6g401zMc3/DPiW+58kD4oKF9bSUGTUd/UtHFxHFqvnt1mk3l6anFQ
   /HB0s2YlJtPAQyFWaJL3HUG12t3L7pz9VhBLoc1IT2z1VGjP9vEXZmJ8l
   KXaQTuuKpu23oR2BbVkNE2Xu2wpj4rXbieiKqjJbLqGmJRVp4bgTZ1zt0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="319896095"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="319896095"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 10:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="794152207"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="794152207"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2023 10:37:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSj8Q-000ARF-02;
	Thu, 16 Feb 2023 18:37:34 +0000
Date: Fri, 17 Feb 2023 02:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:pptrs-online-parent-repair 16/84]
 fs/xfs/libxfs/xfs_defer.c:846:24-25: WARNING opportunity for swap()
Message-ID: <202302170239.Cgz0r1LJ-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   3d6a7fbcc79ebb1a96479c8b10d26de1c3591f36
commit: cf8991f3c4f01b0a21fce8683ae1773b2fae4437 [16/84] xfs: Increase XFS_DEFER_OPS_NR_INODES to 5
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20230217/202302170239.Cgz0r1LJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302170239.Cgz0r1LJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_defer.c:846:24-25: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
