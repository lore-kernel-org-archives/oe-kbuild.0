Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756418EA0
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 04:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ij/SyWjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702701843; x=1734237843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V7DLDHlXGmtIzGKfbpfWCaZWaDP4RIheZxG9YybE+zU=;
  b=Ij/SyWjY0LanC5UzUBwpydnG3wyQ2YoHDjwHMAvSRsoJjsTGOQ///tai
   d16t1itUuvn5nwYmGWhPOmBFqA5sBVoklYp6LAkUxIQMNtFrkyiVMgBQN
   QYnCIIVSg3tTFJQ5E0Dg41xXltCbQM2woSJg/FkyKIAc1CIKc2OATs3ij
   uCYwd9IjLe1uASlyUJP3PeEOedlIxTT5lIf3S1ACrLuVTYsDT4l3guGPW
   Eyno3XzEjDBqleO0NwS9ZjC8xB1/N7OWgDuc3E+Gm7SimSHc5MfcxLGt7
   nPDkZnyvLy/fEslPFt8I1s0ZsqUv/BHa23cuDUBmkPdudqu/U2Lkc4wVv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="8779011"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="8779011"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 20:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="803922680"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="803922680"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2023 20:44:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEMWt-0001AM-0j;
	Sat, 16 Dec 2023 04:43:59 +0000
Date: Sat, 16 Dec 2023 12:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 113/208] fs/xfs/scrub/trace.c:
 xfs_da_format.h is included more than once.
Message-ID: <202312161233.35VETvh5-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   a040f4e3129669cf8ac70b7d3518a21e27e212c2
commit: c729d275332b258f6e328a1bec1aedf9cf68ea7b [113/208] xfs: connect in-memory btrees to xfiles
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312161233.35VETvh5-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/trace.c: xfs_da_format.h is included more than once.

vim +20 fs/xfs/scrub/trace.c

  > 20	#include "xfs_da_format.h"
    21	#include "xfs_dir2.h"
  > 22	#include "xfs_da_format.h"
    23	#include "scrub/scrub.h"
    24	#include "scrub/xfile.h"
    25	#include "scrub/xfarray.h"
    26	#include "scrub/quota.h"
    27	#include "scrub/iscan.h"
    28	#include "scrub/nlinks.h"
    29	#include "scrub/fscounters.h"
    30	#include "scrub/xfbtree.h"
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
