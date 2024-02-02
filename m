Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C247A60
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Feb 2024 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706883342; cv=none; b=opppn3wmy8ANiHbV44nCmgAU0jfSAFQP9TmkSrwNKIKRcDGjsjTw2jVNARayTD35XMOTx01G8LSZ9F0zwnLdNWZzkzVQLXVq5ar5K8vcbAkCwI/c02+0LrIds3U9nbwXKvE05QxxWD2H5B/qfo7HSW3o3aou4PFPWcPSWqXRZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706883342; c=relaxed/simple;
	bh=DMVmoD3KwtIiFsN3QTJr+FwelaJMwc+lXb6x8JbkUyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIG437knXamywr6GC0n+O4sRCztbh8ygtnidHQeh0yTc8bRn/Ode33AN/kNYxUHsOu6znbe8/brwpkbpb3SJqD+dro1/XOLx+uOeqeysiXE/4ChDnATFscdY9u8DonJCyPDsQDBppNymb77i3CSrA7H+vQ3uwxzA69cAglhQV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsJBThpQ; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsJBThpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706883340; x=1738419340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DMVmoD3KwtIiFsN3QTJr+FwelaJMwc+lXb6x8JbkUyI=;
  b=XsJBThpQ3kBwsxQ0kKfLitMqfachahgDfFytOkmiHOA/eojJqUwCrgxU
   0iOh7uqapjIsQMVikADqMaR2yn3WmTUjd+G+8qpgM4bEKYZXMlmAd4WAp
   wBacdF8UqfBweNERYJSp8g+yZIc79pceSTNYxXMBCGAACXeEfT4F0+765
   HzoKRAiz87AeZj22YelNmoXpU5YXEkAV3MZNPgCd6nDc6KuMtdkxIzdFN
   7Z0ipXgMONYFQWADeecTSYNAkrTA9vkJBZia1Qp8Z0FbxWZ3guI2GoBHc
   Ki6UBS+qRhq95qOpwFm371tTrLVVYK63Cyde0w2abGq+yKvWQJkD/uK2z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="394598737"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="394598737"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 06:15:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4830023"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Feb 2024 06:15:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVuKO-0003v4-1n;
	Fri, 02 Feb 2024 14:15:36 +0000
Date: Fri, 2 Feb 2024 22:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/26476]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more
 than once.
Message-ID: <202402022244.9ZolI7Bt-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 4 years, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402022244.9ZolI7Bt-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.

vim +11 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  > 11	#include <linux/of_platform.h>
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
    27	#include <linux/of_address.h>
    28	#include <linux/of_graph.h>
  > 29	#include <linux/of_platform.h>
    30	#include <linux/pm_runtime.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
