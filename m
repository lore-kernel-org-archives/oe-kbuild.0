Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547CB10A00
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 04:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GM2Avkej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702699982; x=1734235982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtbuNGCg1Yd7sBnDHLo/GePSbPdArRwoqqCOomcMKcs=;
  b=GM2AvkejhlumN2WNCMbOlGh8JjZo++70gb2H0ZiwLfV/yvzX0zdZLrgH
   XI3YkIOxcbcGsnPz6tEYyMnR5rqZu3WGns4DpaX9tH7bycs3g2zAS8A7T
   aGnh4h0PgCbOV27ZRDb6M5QMt02Xv5dwr3H0GsjFjbJW/ABN9Uy1SSIe8
   7Z3kBwOtDMGtRzIMuF0kgig9FaubrwvSny1OYaO8w8RoKZUjYMgTnuh01
   +Ud9rsc/ONLAKXfyZCsq/yIpa31za5z88kwYKYmczjQ9ianZACTxcVXS6
   2I/JytHAxOD5bw8EMd0FPypOxOSGerDRsBHsl6y8KKdxLe4tebpANTJyY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="459683116"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="459683116"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 20:13:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="774976635"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="774976635"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2023 20:13:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEM2s-00019C-1Z;
	Sat, 16 Dec 2023 04:12:58 +0000
Date: Sat, 16 Dec 2023 12:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-xfs:xfs-zoned 62/62] fs/xfs/libxfs/xfs_sb.c: xfs_rtbitmap.h is
 included more than once.
Message-ID: <202312161220.XGWw0Crc-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   60b5c8af1e240372d2e077071f06662efdccec3a
commit: 60b5c8af1e240372d2e077071f06662efdccec3a [62/62] xfs: support zoned RT devices
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312161220.XGWw0Crc-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_sb.c: xfs_rtbitmap.h is included more than once.

vim +28 fs/xfs/libxfs/xfs_sb.c

  > 28	#include "xfs_rtbitmap.h"
    29	#include "xfs_swapext.h"
    30	#include "xfs_rtgroup.h"
    31	#include "xfs_rtrmap_btree.h"
    32	#include "xfs_rtrefcount_btree.h"
  > 33	#include "xfs_rtbitmap.h"
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
