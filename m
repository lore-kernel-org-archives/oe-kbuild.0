Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD963F
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 05:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688447256; x=1719983256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5Vfiqz/+ujk1B9xt/5zh6LstODxKXwCjH1mPAJhKnE=;
  b=Y1beRBqJmTfKW+JXEtp8Osu6+DVmCWzXuDw4vrt2ItPmMW6PmXUfZBs+
   HbNH9SokWuxR0yFAt91lTFFLlP3BxJLZ6OQi9gGQAdChwchTumjnQ9W83
   P+NP10UF87LabRvkBw+0+xXTeZFallR+zgTdx75jLuHFoyCd9qhRhHVKV
   mamYOWENUxxaP4n/VXEsMlHOpqsrxU5Q786XP+ByyAUD6qVc/GtAhX6IX
   XG4Xw1EqyATL84gyCg7zNBhP6Inl6J6UlbyuvpK+EalPwpZDX7v5Y/Crf
   LLf+R0M1G+1n5q40iMtA+B9LNqxBYsfQuBjelJvnN70bdHpdZ2+tEk0Kw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361896047"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="361896047"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 22:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788739402"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="788739402"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2023 22:07:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGYGE-000HtT-17;
	Tue, 04 Jul 2023 05:07:34 +0000
Date: Tue, 4 Jul 2023 13:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 1/65]
 drivers/iommu/iommu.c: iommu-priv.h is included more than once.
Message-ID: <202307041358.GYSRSU6S-lkp@intel.com>
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
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-07032023-yi
head:   ac623a6f5d61ed4f4d90a3f835c668728b07ab95
commit: 8b5b28620d75c74b41568767094059fbf9529563 [1/65] iommu: Move dev_iommu_ops() to private header
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041358.GYSRSU6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307041358.GYSRSU6S-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/iommu.c: iommu-priv.h is included more than once.

vim +37 drivers/iommu/iommu.c

    35	
    36	#include "dma-iommu.h"
  > 37	#include "iommu-priv.h"
    38	
    39	#include "iommu-sva.h"
    40	
  > 41	#include "iommu-priv.h"
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
