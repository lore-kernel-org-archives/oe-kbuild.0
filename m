Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573112B86
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706560397; cv=none; b=NavL1ynN7hki7VmW/8xBVfKpdsFp8CBiQVgt31W38EsM4zG48ssuL8M6R3PcGxuSViObVNVzan+OKG4shEzm/DMsZSnnMh9qjqsy3t5Cnyk8bg5X23ss3qvj2QpIo7bLNpB+3tZX64XqTYZtkz8gHzAFclC2NXIZ+sMz4WsFIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706560397; c=relaxed/simple;
	bh=Tpmzn6YsrdupP7566ik4lMoKVqKucFf9Fh9RcFFuDI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PlK7C/dnDez/gFl0XiQy16v5eVNR2D6uRnTLHmjuG45T/nH8kgOT7flJrUNFPnwhaasYs0Z7TcO4rvwMZ+oc8MALTXB/Qpo+GJ2QjOwn+SEMzPKNX+/glOue83enDnYLfO39P7lZDVpVd8x7Q0KgCySnumyc+XMnq/OZxPrfYlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnqUpCnC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnqUpCnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706560396; x=1738096396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tpmzn6YsrdupP7566ik4lMoKVqKucFf9Fh9RcFFuDI4=;
  b=LnqUpCnCEju4CjfEAHfdIj0/qJuCqMrQSK/dVvZsz6YbPGhDCxlDKf1M
   GXScZcWaZyVRX08CROltwTlvFNZv8VYh295zRAZWTANhqGEO/pN9D5dzW
   li0fPu4gQi6dfT8ZsUWSwZof5a5lGue4AT1GfheSIwifOVtNh1/Qsc7YT
   TMCsRyCbGFfNeF1po5X19uP1aDr7XXZ9Y2bvzCpitr2s5v+VC1UTXBz66
   x8CS7dcM1QIDpEo2tdPKQ4aIPrjWZmcP5tuCPSV8mBJ80SpZ8Axb/ZnOe
   ZSrDo2ztOQDvLxEyQ76xYD53ZZ4qCfls7yHQ25krK+fRGk+YG4vAckgbT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24554833"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="24554833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 12:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29912743"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2024 12:33:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUYJc-0004ck-0F;
	Mon, 29 Jan 2024 20:33:12 +0000
Date: Tue, 30 Jan 2024 04:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/26476]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more
 than once.
Message-ID: <202401300410.LTlB4Pi7-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: 6e3f7375acdcf714d1fcbae1238cd39cc9391560 [1511/26476] drm/mediatek: config component output by device node port
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401300410.LTlB4Pi7-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.

vim +10 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  > 10	#include <linux/of_address.h>
    11	#include <linux/of_platform.h>
    12	#include <linux/pm_runtime.h>
    13	#include <linux/dma-mapping.h>
    14	
    15	#include <drm/drm_atomic.h>
    16	#include <drm/drm_atomic_helper.h>
    17	#include <drm/drm_drv.h>
    18	#include <drm/drm_fb_helper.h>
    19	#include <drm/drm_gem.h>
    20	#include <drm/drm_gem_cma_helper.h>
    21	#include <drm/drm_of.h>
    22	#include <drm/drm_probe_helper.h>
    23	#include <drm/drm_vblank.h>
    24	#include <linux/component.h>
    25	#include <linux/iommu.h>
    26	#include <linux/of.h>
  > 27	#include <linux/of_address.h>
    28	#include <linux/of_graph.h>
    29	#include <linux/of_platform.h>
    30	#include <linux/pm_runtime.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
