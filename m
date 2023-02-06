Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F6322A
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675678435; x=1707214435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xjbkfjVetUxu/K5yipMJzIy1CpwzF+O6TyD3c6oNofw=;
  b=Dv1yThnqkkBqip7UfxNccle6F/S6ZPtjUjHRYKa+RwSdKL1zz/RbLXJ+
   9v2EHhA2XZ560c8A1zlWwbwRaAKvSV9hKJDlL5XcPD0c8TclMr+SSxeRW
   sF7dCVPE1u+OeonNA+qnk3NWONGbQuJI+QvjXt59DiYnkjCni6DOy38g0
   HjPpMqCXZnIwJo/E+Y3Pwy+LZTryIcG12/gyzyIFDLYLqNVIQfoUukWPP
   hbL/MZp1T1rxPtvP87dJ6FIRk8d7f+mVfm3az0OdhBjKck1Trc4zkjUIY
   6z3X94MXhFTiNLnX74WZUI/8fULgdx40J/bTmtpMhl3AZmxeYiw4oOw0w
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="312825979"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="312825979"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 02:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="809073353"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809073353"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 02:13:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOyVV-0002UK-1M;
	Mon, 06 Feb 2023 10:13:53 +0000
Date: Mon, 6 Feb 2023 18:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:vectorized-scrub 409/495]
 fs/xfs/libxfs/xfs_rtrmap_btree.c: xfs_imeta.h is included more than once.
Message-ID: <202302061835.Bewqm0Tn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   4315ec0cda3c70a7df76c2516694e6d1219b2995
commit: a11cffb94df7caa5fb43d3955823fd07d9113b16 [409/495] xfs: create routine to allocate and initialize a realtime rmap btree inode
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_rtrmap_btree.c: xfs_imeta.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
