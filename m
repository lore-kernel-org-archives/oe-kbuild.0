Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816F1367
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk2SOJoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701583665; x=1733119665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1P2iQ+n4bEFYcOPzeybtbQTShHDWpQi7VOeBdASOwE=;
  b=Zk2SOJoLOxaeY4PAsBF0dHMF0ikw3wB+ft9iDBzbzOGqq5UpKczQyy08
   99LqmJx5x7R1tcY6wYYHgItWkixbTTaUZW0dBBSDs2y1qQGjjQuMLa4jk
   mFFP1rbmuypmJ61T8mj8dZj9LA6PlIHiWvRV196O92AwrLAOkKP2vzn2i
   evBM3TVtP48YGKTIuRKUXaS2xnF1ckRm0u3neCZy51i1RcFf9/x3/Zbr1
   y2EfH1G0pdcKaqgnWODVjh89Q9yEo02Jt+yProFMd5uIisdTwRCJNnJiX
   X3tljN+coQGGbKJP0Anf6a6GSYLbD7V7f0WSK5ZABz189TAXOIfZ6QRLs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="396443723"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="396443723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943553421"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="943553421"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2023 22:07:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9fdk-0006I2-2i;
	Sun, 03 Dec 2023 06:07:40 +0000
Date: Sun, 3 Dec 2023 14:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is
 included more than once.
Message-ID: <202312021245.VaX0hEIJ-lkp@intel.com>
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
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git new
head:   f30cae3de3b138849010f4e54d8800eb1cc080b9
commit: 088b462e322c581d33261a814abef7f09fc59984 FIXME: drm/i915/display: Remaining changes to make xe compile
date:   6 weeks ago
:::::: branch date: 5 weeks ago
:::::: commit date: 6 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021245.VaX0hEIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312021245.VaX0hEIJ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is included more than once.

vim +19 drivers/gpu/drm/i915/display/intel_fb.c

    13	
    14	#include "i915_drv.h"
    15	#include "intel_display.h"
    16	#include "intel_display_types.h"
    17	#include "intel_dpt.h"
    18	#include "intel_fb.h"
  > 19	#include "intel_frontbuffer.h"
  > 20	#include "intel_frontbuffer.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
