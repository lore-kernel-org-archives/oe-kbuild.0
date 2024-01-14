Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF69290D
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jan 2024 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exHGKqPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705250871; x=1736786871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddzHereNbMcr2XVgbBl4ncGWM9rsegONwpSdV4fOqKU=;
  b=exHGKqPTiLy4T8XNWL4uFU4ix5eYGRTbpduIzkp1jQSkteOcUfQzUAUV
   nZA4uyhadU7PQ0QsLf4gfrPxtxDr9QBIcjW6HRAmVsp1k1t4RA5lVe6pc
   fX7UdzYk+4lasusAnEz/uXNXn+LWSp2HvQmfFNLol5pDlXzrlexD9tyJL
   4x3cnKpQmd18T4+MVXJrmWUoCTNjs0QBC/nK84z5WjvoEZ+YnWhTcBJ0u
   5NtADemfGCv/fP5sv2DdpHHF+eyV/XAIxcoLTeUgD0ynJY1mNoK+klMPU
   uZvRLni0vGFSvwE8gOjrIXPKAisBDVvdFg7qUxfwAVwaA2L41pEgEr1R8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="463757680"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="463757680"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 08:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="31911544"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Jan 2024 08:47:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP3eC-000Bfw-1i;
	Sun, 14 Jan 2024 16:47:44 +0000
Date: Mon, 15 Jan 2024 00:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.1/dovetail-xenomai 15661/15708]
 arch/arm/vfp/vfpmodule.c: linux/smp.h is included more than once.
Message-ID: <202401150045.Mx2uvYjc-lkp@intel.com>
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
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: e208bb70a0c75a7032385d20e533bb1498e09dca [15661/15708] ARM: vfp: dovetail: enable alternate scheduling
:::::: branch date: 12 days ago
:::::: commit date: 5 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401150045.Mx2uvYjc-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm/vfp/vfpmodule.c: linux/smp.h is included more than once.

vim +16 arch/arm/vfp/vfpmodule.c

  > 16	#include <linux/smp.h>
    17	#include <linux/dovetail.h>
    18	#include <linux/init.h>
    19	#include <linux/uaccess.h>
    20	#include <linux/user.h>
    21	#include <linux/export.h>
  > 22	#include <linux/smp.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
