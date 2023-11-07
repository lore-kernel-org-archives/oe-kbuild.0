Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310CC2F849
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 21:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZ1QId5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699393775; x=1730929775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULlQIJr0uf0BZRSmSWw7Zds2/+QbebU98IkmauQwaEc=;
  b=CZ1QId5xpunSd3eRJZiKrpTf/+e5pYGBttD6W+zWiXbb5pHMWy3vb6oO
   HdYjed4QLOkjVhuSqhJP75CqqxV0N4OSDvY2OciZDHhnkZtasykXi9hRN
   jpR58KqutKVFqBiOZPmeP/ohKaraFcWCZrxtWdksYstoOaU3dqfcWjbvN
   t+jx6eUWlrVbMJRZ45usZ7EZ1OhjsNtTTSQTKUKsJsWP2dx/6zQorB2hH
   ajrI6y2TUtypyZAqmwpm6MmWFoGGw+PwA+zKF8Sd4Y9S3BuR0wF/syM5Y
   mw4TVBQvU5oO0+JJCnmUk+GvK318g14mp8zHRNLWMKJqPMcJfSPauH68i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="453935083"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="453935083"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 13:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762852437"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="762852437"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2023 13:49:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Twx-0007Pr-1c;
	Tue, 07 Nov 2023 21:49:31 +0000
Date: Wed, 8 Nov 2023 05:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/include/uapi/linux/fscrypt.h
 include/uapi/linux/fscrypt.h
Message-ID: <202311080456.Jz4cshIS-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
CC: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: e0cefada1383c5ceb5a35f08369d0d40a6629c18 fscrypt: Add SM4 XTS/CTS symmetric algorithm support
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080456.Jz4cshIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311080456.Jz4cshIS-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' differs from latest version at 'include/uapi/linux/fscrypt.h'
>> diff -u tools/include/uapi/linux/fscrypt.h include/uapi/linux/fscrypt.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/syscall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/syscall.tbl'
   diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
     PERF_VERSION = 6.1.rc4.ge0cefada1383

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
