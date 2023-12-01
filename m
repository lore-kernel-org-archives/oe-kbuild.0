Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B9054FBB
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjGPkBlv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701461403; x=1732997403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFOMRm1NMtfp+lmBetjX75w9qaRWjQ9RR00A/PZTMRA=;
  b=CjGPkBlvEPEXv35w7PJPz9stRI1MQKiW1ff41QPVRPnQDdYR1mlgMHaI
   xPjUtQ1HymWfwIwi7bx0tJGNviaG+vjuN9sC7LGEn0qoinEQZJHI+4vJX
   UnTMkxjhOYd2pfeLf63Ws4LtXSt0Iu37GaQyPo+9bcId6Vz13lCg+IIkQ
   nFeT7xlI1VocorThZtJH+6dm2LtiAKFtDO6S6VpEOvPQLNKwImoEQTfMw
   2JD8K2/EXuU2r6IRpC1S5FuzUR0R4cLKLuOCtRRcZ8nlhnxAyUxyglzXN
   TWG+yK76+hEew1+UZTRjs9n+cnmJnuWQfd3PDsrYJ9znJhelxAQl28agu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="397146"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="397146"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 12:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="763246786"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="763246786"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 01 Dec 2023 12:10:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r99pm-0004FE-1E;
	Fri, 01 Dec 2023 20:09:58 +0000
Date: Sat, 2 Dec 2023 04:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
Message-ID: <202312020446.Ej5Bl61f-lkp@intel.com>
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
CC: intel-xe@lists.freedesktop.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: 304baa8c20cfad330a6c7cad47d86043e968642c [2911/3055] FIXME: drm/i915: add a lot of includes in intel_display_power.h
:::::: branch date: 4 weeks ago
:::::: commit date: 3 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020446.Ej5Bl61f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020446.Ej5Bl61f-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is included more than once.
>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/workqueue.h is included more than once.

vim +9 drivers/gpu/drm/i915/display/intel_display_power.h

     8	
   > 9	#include <linux/mutex.h>
    10	#include <linux/workqueue.h>
    11	
    12	#include "intel_wakeref.h"
    13	#include <linux/types.h>
    14	#include <linux/bitops.h>
  > 15	#include <linux/mutex.h>
    16	#include <linux/workqueue.h>
    17	#include "intel_runtime_pm.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
