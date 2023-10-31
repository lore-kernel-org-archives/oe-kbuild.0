Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47819442
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Oct 2023 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P35H9IHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698750549; x=1730286549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mMQkqa7Sm0YVxViBEy4RUfKeI3gOxNXyt493xc5kMGo=;
  b=P35H9IHvAARJeppkpNUgz+fGsXpHCuiM2yY3Wxspv8e3i4FpNgQqblN8
   lWBmfCq9aILFu5vSj081E9wQbOprBDiJuqk/pSUgPYZiEnOwN053RrOd6
   Hxxc4+iXfoWo27xY9gqFAkHXorWhazLJUTD4kIUcs+P2HyWKiRSqMqP7+
   AQbLI0XIo4D30JKn8skvq64GpLM4uN06KKwWIqLzvd5otqcehEkTzBwek
   6GnaafqXQVkh4F83+ORxRnFENjjzV2WhA7lLSYyPIQlZLbfYYu0trCb3m
   vn3NOVeciJSYSrsmT975vIGiGdDCzLYtJv+lz4hSJNTciHrRtU3Wk6Rqx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387143311"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="387143311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 04:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8665912"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2023 04:09:07 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxmcL-00007U-0v;
	Tue, 31 Oct 2023 11:09:05 +0000
Date: Tue, 31 Oct 2023 19:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-xe:drm-xe-next 1329/1427]
 drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is included
 more than once.
Message-ID: <202310311925.XhpqocMB-lkp@intel.com>
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

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   1e652bcf7cc139244f4f8c0cd1fc184029240050
commit: 088b462e322c581d33261a814abef7f09fc59984 [1329/1427] FIXME: drm/i915/display: Remaining changes to make xe compile
:::::: branch date: 17 hours ago
:::::: commit date: 13 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231031/202310311925.XhpqocMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310311925.XhpqocMB-lkp@intel.com/

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
