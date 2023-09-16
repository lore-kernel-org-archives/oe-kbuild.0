Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A020E4
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Sep 2023 12:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694865818; x=1726401818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+4tgQShS90ezVa6c9o8ykrt3GQqLUUhMWA3Y1yqJlE=;
  b=dzIoYxHS0mbyUIucejnYcUuAzase9HoCvEytOt7mleLRxObbA2sso5JD
   aUtp3jQqJ6+1r/8rOnysULkRoo/8fJMQ6kx+Om3owjj5vuIFkfBGBmlj5
   aRZuO7d6P5d3t5lfhxozKmD7A5Nx4vSBH9kHwUggapCqG2KqAO1zVemzk
   yLLU7x0bDKfSlwDziNv5NWHmdnzrla218sWARSkB5RyRrUDlWdYDoUzHr
   bty3EANMkA97HiIlewpeWstAqXB5ZHqer40lAZA9zEKZOgMDexxzr0Heh
   DJDkI1J5IbdA2P0hWHYJXJ7lsfDTOo4Gepd1o11TkJDGELXewe1b5ASxG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="382142466"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="382142466"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 05:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="695019470"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="695019470"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2023 05:03:36 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhU1O-0004Gc-15;
	Sat, 16 Sep 2023 12:03:34 +0000
Date: Sat, 16 Sep 2023 20:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:rmap-intent-cleanups 323/433] fs/xfs/scrub/scrub.c:
 xfs_dir2.h is included more than once.
Message-ID: <202309161952.xAswNS42-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups
head:   b406c1d86e7c84ed8d2553c0b4dabd40d6648737
commit: 892a798420f98a10bcdcb3ad27b43ddecc620ad4 [323/433] xfs: move dirent update hooks to xfs_dir2.c
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230916/202309161952.xAswNS42-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309161952.xAswNS42-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/scrub.c: xfs_dir2.h is included more than once.

vim +24 fs/xfs/scrub/scrub.c

  > 24	#include "xfs_dir2.h"
    25	#include "xfs_parent.h"
    26	#include "xfs_icache.h"
  > 27	#include "xfs_dir2.h"
    28	#include "scrub/scrub.h"
    29	#include "scrub/common.h"
    30	#include "scrub/trace.h"
    31	#include "scrub/repair.h"
    32	#include "scrub/health.h"
    33	#include "scrub/stats.h"
    34	#include "scrub/xfile.h"
    35	#include "scrub/tempfile.h"
    36	#include "scrub/orphanage.h"
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
