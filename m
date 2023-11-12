Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA415ACA
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6lqmQnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699830931; x=1731366931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Htdh7hQoRKpKLTvUvJbk7kxymX8oBtGqdwzVJDExsxA=;
  b=W6lqmQnOPJ03L/OxzG5HRSzM4vBL2wkBxTC2p127DLdnC+9HJLjhvH58
   OB3k4di/kF+Vag+6c6QnYleCRdlewKbomn5uxwiMXZKBTnggQa1268eL+
   FenbV6QeLEKrSpbAxRvNbwnlZD4uAShxOJEsjpPo5Gdg7IIUbanHtKLwu
   9fE2HnjQYmnOiUfusZl1MqJvIbkuzbSmBaMjbXpBZRkdcWbmKUuHwRqSK
   WB3y22j9tTVgkYkcFmPwuw0i5LA9hnrANRc3kucoRJTanRKAOSbUboC6R
   Y96/WQbhrjiY1DZmB5Yih6e3nM6h4KL8ikhcgsKdU+HqogJD5tdFDoMEv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="380746916"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="380746916"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 15:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="937605825"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="937605825"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2023 15:15:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Jfs-000Bbj-0H;
	Sun, 12 Nov 2023 23:15:28 +0000
Date: Mon, 13 Nov 2023 07:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] riscv: Avoid code duplication with generic bitops
 implementation
Message-ID: <202311130605.zjOBT0zH-lkp@intel.com>
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
In-Reply-To: <20231112094421.4014931-1-xiao.w.wang@intel.com>
References: <20231112094421.4014931-1-xiao.w.wang@intel.com>
TO: Xiao Wang <xiao.w.wang@intel.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: arnd@arndb.de
CC: geert@linux-m68k.org
CC: haicheng.li@intel.com
CC: linux-arch@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Xiao Wang <xiao.w.wang@intel.com>

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20231110]
[cannot apply to arnd-asm-generic/master v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Avoid-code-duplication-with-generic-bitops-implementation/20231112-173655
base:   linus/master
patch link:    https://lore.kernel.org/r/20231112094421.4014931-1-xiao.w.wang%40intel.com
patch subject: [PATCH] riscv: Avoid code duplication with generic bitops implementation
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231113/202311130605.zjOBT0zH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311130605.zjOBT0zH-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/fls.h is included more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__fls.h is included more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/__ffs.h is included more than once.
>> arch/riscv/include/asm/bitops.h: asm-generic/bitops/ffs.h is included more than once.

vim +22 arch/riscv/include/asm/bitops.h

    17	
    18	#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
    19	#include <asm-generic/bitops/__ffs.h>
    20	#include <asm-generic/bitops/__fls.h>
    21	#include <asm-generic/bitops/ffs.h>
  > 22	#include <asm-generic/bitops/fls.h>
    23	
    24	#else
    25	#define __HAVE_ARCH___FFS
    26	#define __HAVE_ARCH___FLS
    27	#define __HAVE_ARCH_FFS
    28	#define __HAVE_ARCH_FLS
    29	
    30	#include <asm-generic/bitops/__ffs.h>
    31	#include <asm-generic/bitops/__fls.h>
    32	#include <asm-generic/bitops/ffs.h>
  > 33	#include <asm-generic/bitops/fls.h>
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
