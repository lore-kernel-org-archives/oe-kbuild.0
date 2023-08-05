Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE29010EA
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Aug 2023 23:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691276586; x=1722812586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X45kSQpYJPiIZp40A/3d8muKa/skvUHq5ROvIujhSuU=;
  b=RGlDIY2v6Eq/a4U0F46wmjmaSP5JJgEpoUmoi0HJSxlmnQ/8pWz2jH0u
   h3PbCnk1MkAQNBSjV2cdqKwcTU9SniwMRPMR1NRgg43t3dMRQBUfgkj/p
   r3X3PvdlXDG9NvOrlYfwIUSP165U65OoZz9P2q2b7bU9ExRH0uZEuxm0v
   LCuk+SKltfV7Y64EMqb9SivuiF4qcJy8yD1E2cjK4oYIv6MV5ps3JhEAd
   DOzW22UvNEeJur72IeiWcO1umYqFsDdI78TDXHymGagLNDQSW/DCErwjX
   RhlnFMMmntdimtiK1yFRqZoyFF8y2uoMZtpeHMXM0tM9fxxfr5dkwFx2k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="434183559"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="434183559"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 16:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="765536326"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="765536326"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Aug 2023 16:02:58 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSQIT-0003wF-0q;
	Sat, 05 Aug 2023 23:02:57 +0000
Date: Sun, 6 Aug 2023 07:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 28/28] drivers/gpu/drm/evdi/evdi_drm_drv.h:
 drm/drm_framebuffer.h is included more than once.
Message-ID: <202308060735.Q4X7kqjf-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   0ee9b91ba1abb722c6a2b8846775f2db048f6a1d
commit: 0ee9b91ba1abb722c6a2b8846775f2db048f6a1d [28/28] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060735.Q4X7kqjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308060735.Q4X7kqjf-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/evdi/evdi_drm_drv.h: drm/drm_framebuffer.h is included more than once.

vim +24 drivers/gpu/drm/evdi/evdi_drm_drv.h

    15	
    16	#include <linux/module.h>
    17	#include <linux/mutex.h>
    18	#include <linux/device.h>
    19	#include <linux/i2c.h>
    20	#include <drm/drm_drv.h>
    21	#include <drm/drm_fourcc.h>
    22	#include <drm/drm_ioctl.h>
    23	#include <drm/drm_vblank.h>
  > 24	#include <drm/drm_framebuffer.h>
    25	#include <drm/drm_crtc.h>
    26	#include <drm/drm_crtc_helper.h>
    27	#include <drm/drm_rect.h>
    28	#include <drm/drm_gem.h>
  > 29	#include <drm/drm_framebuffer.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
