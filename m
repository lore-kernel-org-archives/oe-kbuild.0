Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F78BD1E
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 05:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675747179; x=1707283179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RD2T6l6Jf+VwOPWuA+NoSr5aextbn2nCIy475g1SNHo=;
  b=lU7j1Rz40yCFQi7QdRahUphkQuOEJuJhx88Ape5FC/aWDVfcWLSirGAe
   jPm4maHtLdyQ1/fYWeKLBivnt+kCBcPgBhODdk7TIFEeOUy+4CMajLIYZ
   w9DEwfFYTF1YDcu7Issmr1Emki/YIPmb8RTpsgk22Z7+tNc04omQ7D9se
   pCkj5wpjU48V60Jb8GxtK53FpOIxZDRFGICfb7Irz7KjeCSqoRxWCdbn0
   Rom7RteLRGQb78ecBOvrJWQs/GkgLmJ5PSe2si5EgbYH3DJhdtYMbruPU
   W/afc34XUVf3rRYfOWZTHjDX5jI1+Xt8Dqp3Q251YCnENkxiYi4m2rUAx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309742796"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="309742796"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 21:19:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="660088937"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="660088937"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Feb 2023 21:19:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPGOG-00037G-2H;
	Tue, 07 Feb 2023 05:19:36 +0000
Date: Tue, 7 Feb 2023 13:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:vectorized-scrub 426/495] fs/xfs/scrub/rtbitmap.c:
 scrub/repair.h is included more than once.
Message-ID: <202302071301.H7hSb7UY-lkp@intel.com>
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
commit: f8451880356773abd2792811580114190db35bd2 [426/495] xfs: online repair of realtime bitmaps for a realtime group
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/rtbitmap.c: scrub/repair.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
