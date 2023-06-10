Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DE7290B
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 22:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686436850; x=1717972850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSplMjL7ay0j0/mtogLS1HUnsskFUY+6qVzibX1++kE=;
  b=KiFi5PmEW84jWPYBVNjO+16s2uUb7HjBllqEZFIHbtiRAxHVdwpodStw
   1u0iXbaSRxfj4HlFurIjxS60X9rBTYj/5PsF/6eIFEdQJSIyDrsgDrvHI
   grykOA3RDb9ZySKdNSedqBwUl+o2y9P3AZC8lb2mrgMs94xDSRsZpnv+F
   WsSdc6JEUi71YczCThILemPBITzzBtbZI9UNloSrMTi9DkHpysPAdnK4N
   3/TJ2QzWkSX9s2j6CDvIGxRR+uTYdVwulVP49KyGDQ9JBfA6HJRMivCTB
   zJe2Qq2A7+Hs81/3qy0byy+jwBogPhQeNZCwkWD0N7pxQcjEJzz456SOQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="421402411"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="421402411"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 15:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="823471106"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="823471106"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2023 15:40:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q87GJ-000ATM-1e;
	Sat, 10 Jun 2023 22:40:47 +0000
Date: Sun, 11 Jun 2023 06:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [acme:tmp.perf/core 89/117] tools/perf/util/pfm.c: util/cpumap.h is
 included more than once.
Message-ID: <202306110636.2sTsiAcl-lkp@intel.com>
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
CC: linux-perf-users@vger.kernel.org
TO: Namhyung Kim <namhyung@kernel.org>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tmp.perf/core
head:   fa9f16805e705fbb243a74b60f803cb33f1ce787
commit: 975b6a641af18e471f9a8b764e26d202808cac16 [89/117] perf list: Check if libpfm4 event is supported
:::::: branch date: 27 hours ago
:::::: commit date: 32 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306110636.2sTsiAcl-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/perf/util/pfm.c: util/cpumap.h is included more than once.

vim +7 tools/perf/util/pfm.c

   > 7	#include "util/cpumap.h"
     8	#include "util/debug.h"
     9	#include "util/event.h"
    10	#include "util/evlist.h"
    11	#include "util/evsel.h"
    12	#include "util/parse-events.h"
    13	#include "util/pmus.h"
    14	#include "util/pfm.h"
    15	#include "util/strbuf.h"
  > 16	#include "util/cpumap.h"
    17	#include "util/thread_map.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
