Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED55625
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 04:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688444736; x=1719980736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pmB+UvZmW7NWcfHaa1k6dQ1fZz+rAK2YKgbwCoPtV3U=;
  b=AMqThKdN/vePrekRUIvxjBt22Dpv+iptzAqdz/53S6NWJVzeSwZwk3aV
   pFIH5NZQGyO18u5onDjBDTpaR5sxb6+LtFIClSvoZ+WCTklzgJp2O1vn6
   vHHz9pXVYNERQTy8frxHTDJ3KhvQm9tvMFkTev4SlyAokV2IQywF2U4tC
   yh4Zh+dnutAqhK2cKm9EYoytNNF4zUURAslcTp90f6gJIFJaDAyKZ6vTR
   zCpxjdlJuN4D9pLJeWNJOaZRR3O6f51BHOABhLHdpU0P+Zdxv/0ig/bLZ
   D/xT1/OLOUNRudVqu0PZDtGIklG8BOEzpAmYrog7Xt8ZniArkiyqF8x0R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="449399950"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="449399950"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 21:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="842848915"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="842848915"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2023 21:25:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGXbZ-000HsR-0E;
	Tue, 04 Jul 2023 04:25:33 +0000
Date: Tue, 4 Jul 2023 12:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 166/217]
 fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
Message-ID: <202307041204.n5JIkzID-lkp@intel.com>
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
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: 4885e2ac7dc43f02ff2a18bbec51e198086ab318 [166/217] xfs: bind the xfs-specific extent swape code to the vfs-generic file exchange code
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: xtensa-randconfig-r053-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041204.n5JIkzID-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041204.n5JIkzID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307041204.n5JIkzID-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:587:11-12: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
