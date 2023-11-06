Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D54229CF6
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjbAQOtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699303712; x=1730839712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xvRCnBY3FjXoO7B7mxzYPO0/IK1RvZwvI12IPvNmHGk=;
  b=MjbAQOtBEcWgRrBQ8dXPlq6LmAQ2D7gWtWBGlsPWMhxp1EoGGihqdc4z
   aRekKtQQepZL+CybAxkehA4qmFyrN9R7wjgMEXo1HFuHJsqlraJxLx6NW
   vndNwzZ6hOuTK8BXKLgN5Ju+KjpSWa5TU1uwvkeOY7cR13BTfuX+hr9oO
   PtY/G0hLIFf6/JybqY8gMePzSnYKRn4e+lkwsG1YDu4pKeQzV8LTK/B19
   TiFmUCVpOO17MlcYz4RCUqIORyKkLP9E5YjKnz5vhabriD3nUw4a0pmu/
   l9+28Xw0g631PZpthzA3MXZf5MXQsJHjulo4Rf5KuR8aIyuoGWyxOB6NX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393258056"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="393258056"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 12:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="853131997"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="853131997"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2023 12:48:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r06WK-0006ii-13;
	Mon, 06 Nov 2023 20:48:28 +0000
Date: Tue, 7 Nov 2023 04:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
Message-ID: <202311070416.8nPv4n6G-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 8 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070416.8nPv4n6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311070416.8nPv4n6G-lkp@intel.com/

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
