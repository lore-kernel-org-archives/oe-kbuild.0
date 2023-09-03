Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA681369
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 06:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693721988; x=1725257988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBI8tWHvmNCL+YyqCsAt5qjD45g9ltfXnUmtlIuXP6c=;
  b=hvydMk8VOv6TGaCMVcQnZrPhkOgsU/kPg2ii56DrdRt+GXQ35nUWrL9l
   wmmDA5IgcaM0rE0aWIpR88sKZvqZklfx81Tkd+YwHJ5bFWGsHxOs14OUx
   ll5rORtV2TStROUf9vxP747Si310i8HBcG+j1OhlW3S8TuZ7i0I/y3tys
   lShZUgpnSI4c9Pj9gCisyumwlQJmTm704cbzmQSWc7+7wqXZkSlE1pXUM
   F1PaQOpLraJ3zxz3G5VeVtbRaDBPfv+gTe3djTFEKoRFwqjav3ge4Apve
   izXRWeHGiDsH/I8ad9HludHDziJOpltzVUpHTr9yKFA/QYWTW0c4UySkM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="376358952"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="376358952"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 23:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="717228715"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="717228715"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Sep 2023 23:19:45 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcgSV-0002xN-1U;
	Sun, 03 Sep 2023 06:19:43 +0000
Date: Sun, 3 Sep 2023 14:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-kernelci 5/68] sound/soc/fsl/fsl_mqs.c: linux/of.h is
 included more than once.
Message-ID: <202309031400.lChpIxaI-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: 464bd291819a7bb45d817c915bab8f126fbd7191 [5/68] ASoC: Clean-up DT includes
:::::: branch date: 29 hours ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031400.lChpIxaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309031400.lChpIxaI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_mqs.c: linux/of.h is included more than once.

vim +13 sound/soc/fsl/fsl_mqs.c

     7	
     8	#include <linux/clk.h>
     9	#include <linux/module.h>
    10	#include <linux/moduleparam.h>
    11	#include <linux/mfd/syscon.h>
    12	#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
  > 13	#include <linux/of.h>
    14	#include <linux/pm_runtime.h>
  > 15	#include <linux/of.h>
    16	#include <linux/pm.h>
    17	#include <linux/slab.h>
    18	#include <sound/soc.h>
    19	#include <sound/pcm.h>
    20	#include <sound/initval.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
