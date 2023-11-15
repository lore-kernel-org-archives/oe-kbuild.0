Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394361EB34
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbohYsbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700070078; x=1731606078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bbo2NEZrmlDFYiDALwIcLOltqbWEBGMmxWwExXF7L7c=;
  b=CbohYsbp61HAFZ3hvHfsCy5/DuNg4vcXfF6VEna7QMh2OO4ijG8r1f71
   jX2OmvhNIUBKYSPB6yfUGTPyZqUy0kSCp666iL0C7sb8HGhrsopHtB8eV
   uTh66BSeO+IXI4ewaLzGb8xqj4KAMg3Yl6jO4GG7GiXPFE3vR4SK6BJyj
   z6VYtOnwlrZ4bwT03rWzXsHywtIutr9AOpWkmMZlN5L3gcZZ1PX0AGMdY
   4XTxlyoCokrohoTBgNzJa2c1i08Q4ISLG/2DI0uGv0iI0nKqzzC4JnE97
   3CFjVumAuihYlvy6IDGj+OyXLaQHXy0gzC3ayvGFewRo2KN/dq9kuWimN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4001259"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="4001259"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 09:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888656183"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="888656183"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 09:41:15 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Jt3-0000fI-02;
	Wed, 15 Nov 2023 17:41:13 +0000
Date: Thu, 16 Nov 2023 01:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/unaligned.h:119:16: sparse: sparse: cast
 truncates bits from constant value (aa01a0 becomes a0)
Message-ID: <202311160124.gAKUkd4c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "fbc 66603243f5283f7f28c795f09e7c2167233df0bd and parent 86a7d13c9afaa6a223a0ef3234a75e4135e1f0bf have different kconfig"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chris Morgan <macromorgan@hotmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 66603243f5283f7f28c795f09e7c2167233df0bd Input: add driver for Hynitron cstxxx touchscreens
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/archive/20231116/202311160124.gAKUkd4c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160124.gAKUkd4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160124.gAKUkd4c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/input/touchscreen/hynitron_cstxxx.c: note: in included file (through arch/x86/include/generated/asm/unaligned.h):
>> include/asm-generic/unaligned.h:119:16: sparse: sparse: cast truncates bits from constant value (aa01a0 becomes a0)
   include/asm-generic/unaligned.h:120:20: sparse: sparse: cast truncates bits from constant value (aa01 becomes 1)
>> include/asm-generic/unaligned.h:119:16: sparse: sparse: cast truncates bits from constant value (ab00d0 becomes d0)
   include/asm-generic/unaligned.h:120:20: sparse: sparse: cast truncates bits from constant value (ab00 becomes 0)

vim +119 include/asm-generic/unaligned.h

803f4e1eab7a89 Arnd Bergmann 2021-05-08  116  
803f4e1eab7a89 Arnd Bergmann 2021-05-08  117  static inline void __put_unaligned_le24(const u32 val, u8 *p)
803f4e1eab7a89 Arnd Bergmann 2021-05-08  118  {
803f4e1eab7a89 Arnd Bergmann 2021-05-08 @119  	*p++ = val;
803f4e1eab7a89 Arnd Bergmann 2021-05-08  120  	*p++ = val >> 8;
803f4e1eab7a89 Arnd Bergmann 2021-05-08  121  	*p++ = val >> 16;
803f4e1eab7a89 Arnd Bergmann 2021-05-08  122  }
803f4e1eab7a89 Arnd Bergmann 2021-05-08  123  

:::::: The code at line 119 was first introduced by commit
:::::: 803f4e1eab7a8938ba3a3c30dd4eb5e9eeef5e63 asm-generic: simplify asm/unaligned.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
