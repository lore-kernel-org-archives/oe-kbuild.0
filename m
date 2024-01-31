Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF802134F
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706728071; cv=none; b=NLLINjop0bHE6xeV2wK2Go9TOxLblxhVb/gvFbL2/e2xwaF5YdbCSCjFejpc0qHrK+PgFl/yK0ziB0t+Eqj4n/spRh+s4S8wiljLj0r/f2pyDaytuuo35I/Y6FV3C6RNyLCMi0jwxcHM1nVtqdDJURIKJikAB23PJ66ZpTIZWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706728071; c=relaxed/simple;
	bh=Izf6KSyYfKC7lL/FPo5Hrjm8OKPVls5juolPQt/jcVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gm1JdbqA3Tem4NiZaYSpA7CkhKrSrbDJYs7eQfSWHapoSRXwkTmvXE4+YP0ZnpDPnEjfJweUUZ/OvCkWXoM+0ESPOhGtivHCGmL4ff1tq02rhsvXn+VscW3lkd4Dc+UVV24hYwuL4/STw6p+sGjUAx5UlBT/vAJUejLzGrsQmn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHKMbX7c; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHKMbX7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706728069; x=1738264069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Izf6KSyYfKC7lL/FPo5Hrjm8OKPVls5juolPQt/jcVM=;
  b=QHKMbX7ccMWc81WC1++qIDkSy/bUvhk2Ch+r8cByDTcO6qEtV43xuSq1
   4AbqIugrcQ0Ucp3PgqLcwFDaMM9JC/wU+FjwmA81Xav4yC2Y1K1OIz2Ww
   A8PZRVSf7jHciW0xUWuclpeFj3afEwy5Z3A6iXHKnRSCNLjMlNpNrQei1
   UoMdZxfMcT9LIkqsnnFOH9yFiPWgvVBnI/DV1fLeHuMY7/aZ+Qy6rE+wr
   jyt+4zHIxgMXCf0t1WvgpE1EKBLKhWcVtWDzsfJWyun5bvo4ELgr+OWsQ
   o2dZjjNy8q4M96cZh0txL8zFhDrIAxxxOVtXC0DRphLdaIV9RjGW+2/72
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434868322"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="434868322"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 11:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119707807"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="1119707807"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2024 11:07:47 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVFw1-0001vA-2r;
	Wed, 31 Jan 2024 19:07:45 +0000
Date: Thu, 1 Feb 2024 03:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/26476]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more
 than once.
Message-ID: <202402010357.AzCriYCk-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 4 years, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402010357.AzCriYCk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.

vim +7 drivers/gpu/drm/mediatek/mtk_drm_drv.c

   > 7	#include <linux/component.h>
     8	#include <linux/iommu.h>
     9	#include <linux/module.h>
    10	#include <linux/of_address.h>
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
  > 24	#include <linux/component.h>
    25	#include <linux/iommu.h>
    26	#include <linux/of.h>
    27	#include <linux/of_address.h>
    28	#include <linux/of_graph.h>
    29	#include <linux/of_platform.h>
    30	#include <linux/pm_runtime.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
