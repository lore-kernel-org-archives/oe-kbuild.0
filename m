Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB8F181
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 02:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688438492; x=1719974492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=885dFIgh7wAAUabDDRDxa5C5PCyYbgBzNYXfDSoy/34=;
  b=nMb3+cKJDuUZ9D/3WYpjkwTlP+89vkiwYuqpv3pbHWun40o8BOaIWbGQ
   oiUmerlOyo/BCwioL7xg+my634DrCeGRj78N2A+HHjPmBx6X5VehW0itg
   /qGSr0/YCJq4FSkpdUZYbuiwg04VpON7GEJvm8ds66j/l/Eb/6plu7brY
   AuR11QZN+SJxwD4LglRl7NDrBGONyapq4DjuiJaBtBet3jv0uW+oVc0oK
   AiXOpBqJp7BmexGTD7Qx8qbxaU0rrkL739oXfAZ/mX9TtEruj1R+qU04F
   qkGRrS6TgTBvnbiz65VjdJNNBty9Z6w14Thq/0GO31YjCCcdNYVeT4JWJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347803813"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="347803813"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 19:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="832005657"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="832005657"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 19:41:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGVyr-000HoN-2x;
	Tue, 04 Jul 2023 02:41:29 +0000
Date: Tue, 4 Jul 2023 10:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 119/217] fs/xfs/xfs_buf.c:2061:11-12:
 WARNING kmalloc is used to allocate this memory at line 2027
Message-ID: <202307041058.jhI8dkwQ-lkp@intel.com>
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

Hi Darrick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: 711eb945c25bc477a065a39831bd71e0412fed43 [119/217] xfs: make GFP_ usage consistent when allocating buftargs
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: xtensa-randconfig-r053-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041058.jhI8dkwQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041058.jhI8dkwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307041058.jhI8dkwQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_buf.c:2061:11-12: WARNING kmalloc is used to allocate this memory at line 2027

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
