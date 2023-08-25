Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210B198B2
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Aug 2023 23:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693005250; x=1724541250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOxrPWSNocVsoCCSop0M0hDA4H7NF1p+2HmxXeO6XVE=;
  b=EpTE6m9U4IdDbJKsuG6PAortS9ZUvmx5Qch3JbIjPLxtoYzsqUvc8+vD
   srm6JDtdtkzbfJ6jIa4jjJ8J1HK0+p8w9cz2VMRhGIj7EmCaBLqgkmqY5
   +AtYaWYtHKehMwEb8+khDPPu/5TWCbow9b6P5ZZYkc4i5aAYG6XORaO/e
   deuw7kCqHQYYXihBr0ewS8wHr9E1Ehdf1/aldButwS9mc4AGl/+b07kU4
   sIABaB4W2XW35XgkMJVC23B5UZE0SaQJOEGy06t1tbzF4xBtErtamhQeW
   z0hlBZN30PHDlee6in3MZpz4/ORMGWmQwAnXjmC7EmBTQN8jTZYqr/pae
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="441169891"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="441169891"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 16:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714494239"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="714494239"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 16:14:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZg0F-00046l-2y;
	Fri, 25 Aug 2023 23:14:07 +0000
Date: Sat, 26 Aug 2023 07:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 152/203]
 fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
Message-ID: <202308260732.Sh7r6xIY-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   3a75294b1e898d6439eb60de137d003f3a112b58
commit: 3a6c2d4729b6d989d66dab0ebf27ab390033eeec [152/203] xfs: bind the xfs-specific extent swap code to the vfs-generic file exchange code
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-054-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260732.Sh7r6xIY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260732.Sh7r6xIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308260732.Sh7r6xIY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:587:11-12: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
