Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699529403
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Feb 2024 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706820922; cv=none; b=tDQ1n72k+oVQmjKzWtB6MEaXvWK83Y+AqnHcVk64iCpFAj/V9clL08UMJWAJofQGXcLTAtAu0FpkSBKuv8G2GQbCFe2L7nwKwoAt5ojB33+gbV7E/W4ZwMZBNIzEPVz36M7zCfNkeyYEkGwPg5eaPo3/ND6VWithM/zKEHgJvw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706820922; c=relaxed/simple;
	bh=Iu9DMHxw3nofqzDNU5J8O0LHj3aljNIj6ODvw06hk2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7ZI5dJPMqVIDK4AZQYeRe48cTxYU+IIKUYW9HwR5QTFEd50z+1QaEGpqcLM5LyBxYpJ2/HNgQs0vtRX+6EDmFQynN/tCpbqMzl/ElmDwZSjdV9gJTe1i19wo5SXJDtcySWqr49nDximF2uCdLZB731dGuxQfHDvfaSLk6+SzhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YS3KlO0h; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YS3KlO0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706820918; x=1738356918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iu9DMHxw3nofqzDNU5J8O0LHj3aljNIj6ODvw06hk2o=;
  b=YS3KlO0hW3OddERKgckWBuDLuYW7yo0DnpSjY7gPqpCQNu76kp/GOVQt
   tIm78tLdXFl1VO60xl81w8jNy4KAM113Va+VVJZRZShWHIvh7A+2XuG/S
   Yp4Weo1dOdadNU8evsnM2kf0CIxoCAqRjgDpAl5KnHlVIsgNhMJbwIqgm
   vqKw3OPuSRRiiIynkiAQH33jQQjruqpI3lnzzEnxMVbIpXgdVa5oEPc4o
   ILF6AJPsU+Vch5IzdZ7Y6rRVQVdw+j5uTE2GhwydnPh6vpi4cOOc5rTFc
   jHNhrqg6Mj0DfZ7gYA4Fmit8TyY1k9U4pivtzHn62mValxKKmjYHOXdtg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11373588"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="11373588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:55:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="879212554"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="879212554"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2024 12:55:15 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVe5Z-0003Bt-2a;
	Thu, 01 Feb 2024 20:55:13 +0000
Date: Fri, 2 Feb 2024 04:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/26476]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more
 than once.
Message-ID: <202402020457.KZJ1vUKZ-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 4 years, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402020457.KZJ1vUKZ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.

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
