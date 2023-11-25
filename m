Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF0944E
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCWACB72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700903424; x=1732439424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ilpE1fC4/rGWJibDEo8eEmgZhqO4Bulqim557iDkxNI=;
  b=YCWACB72ujrqtk5+bUKrPkXemi7tHiyHOiseO+6yJE9trG3GcyLcrbd7
   fd1ok2NKbu1wJ3pTA6XgYjsuXA0KH4noL65lmuuApfHlDmOQso4FETTsC
   sR3y0yUrg6+0TE0b+lOZqTHOgk9e3hpysE611apJO2uUIrZ7WXi7nHrCQ
   Daa3OcoC2NIW+nSMfOw6kON5Vak3zXQTl7iWXhKMMwi2DlqmEZ29K9kw2
   2k4WQ9ogJoLsjk9g2Yeo+WSjttS0i+GQIpjxOPRAvBBcMEoNAq79cK9cb
   TY6fB99E59GzUMrRV13kkykQoTcHUrIcPnCO0UuOIwvaH/4hj6Co/siMp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392268721"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="392268721"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 01:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1099303472"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="1099303472"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2023 01:10:18 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6og3-0003p0-34;
	Sat, 25 Nov 2023 09:10:15 +0000
Date: Sat, 25 Nov 2023 17:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dhowells-fs:netfs-lib 1/56] fs/netfs/fscache_io.c: linux/uio.h is
 included more than once.
Message-ID: <202311251612.fhxgKB5U-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   69448342f13a737a392c45f17205bc3eaf242e9d
commit: 8baff6a0534a09984aeaa6f70069cfc68ad12a1e [1/56] netfs, fscache: Move fs/fscache/* into fs/netfs/
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251612.fhxgKB5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311251612.fhxgKB5U-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/netfs/fscache_io.c: linux/uio.h is included more than once.

vim +9 fs/netfs/fscache_io.c

   > 9	#include <linux/uio.h>
    10	#include <linux/bvec.h>
    11	#include <linux/slab.h>
  > 12	#include <linux/uio.h>
    13	#include "internal.h"
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
