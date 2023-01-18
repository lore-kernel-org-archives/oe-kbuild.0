Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6802CAB
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 20:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674074295; x=1705610295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v3qz1Yk1cU1W2OikfQ0pfl//8+ByxXJ2DIUNi4Rw+Xc=;
  b=VieeSj4bSFqX6tBHTCm76M23T4FkCmRNtaMcl3t3vehDCdXHfDItX6Yy
   VFe8k9HlsJaaibL0Q6lF0XImj41GEA/fGaXB8Qw9m3qCqj/+16Kj/bqKD
   Keu7Ny0e4cIsHn6/VZYMxrKZ2BSSeff22AuZ74UpAS/XPx9ajGbmeRqF2
   J1IwIHRqwv6c/Z8X1zeUvi45PrqfdTiK8/diq0IiBwCHEJgdE5dunE+SS
   C15W6ucyjqGjpAaMSMjklQT9wzlUGph7ID1eXQuxDvJafzkaXp6+z6vwe
   jw9XmQp/jq5K/CBWWptES7fRzzZwEEQikD+FfJnR6uoQmVTIeiLCkC+ym
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387446033"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="387446033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 12:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723231078"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="723231078"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 12:38:13 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIFCG-0000hK-2x;
	Wed, 18 Jan 2023 20:38:12 +0000
Date: Thu, 19 Jan 2023 04:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:guest-hardening-rebased 13/38] lib/iomap.c:62:29:
 warning: unused function 'iomap_readb'
Message-ID: <202301190450.dskq03tX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Andi Kleen <ak@linux.intel.com>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   b47a6d251aaad2926b5947a5894556d58c0ba7e2
commit: 90d81f51300ed67de3e57f57f28f12366e1b20b9 [13/38] x86/tdx: Enable direct iomap MMIO optimizations
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-a005-20230116 (https://download.01.org/0day-ci/archive/20230119/202301190450.dskq03tX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/90d81f51300ed67de3e57f57f28f12366e1b20b9
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-hardening-rebased
        git checkout 90d81f51300ed67de3e57f57f28f12366e1b20b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/iomap.c:62:29: warning: unused function 'iomap_readb' [-Wunused-function]
   static inline unsigned char iomap_readb(void __iomem *addr)
                               ^
>> lib/iomap.c:67:30: warning: unused function 'iomap_readw' [-Wunused-function]
   static inline unsigned short iomap_readw(void __iomem *addr)
                                ^
>> lib/iomap.c:72:28: warning: unused function 'iomap_readl' [-Wunused-function]
   static inline unsigned int iomap_readl(void __iomem *addr)
                              ^
>> lib/iomap.c:77:29: warning: unused function 'iomap_readq' [-Wunused-function]
   static inline unsigned long iomap_readq(void __iomem *addr)
                               ^
   4 warnings generated.


vim +/iomap_readb +62 lib/iomap.c

ea8256f39e0f40 Andi Kleen 2021-08-20  55  
ea8256f39e0f40 Andi Kleen 2021-08-20  56  #define COND_MMIO_READ(func, addr)			\
ea8256f39e0f40 Andi Kleen 2021-08-20  57  	(iomap_mmio ? iomap_mmio->i ## func(addr) : func(addr))
ea8256f39e0f40 Andi Kleen 2021-08-20  58  
ea8256f39e0f40 Andi Kleen 2021-08-20  59  #define COND_MMIO_WRITE(func, val, addr)		\
ea8256f39e0f40 Andi Kleen 2021-08-20  60  	(iomap_mmio ? iomap_mmio->i ## func(val, addr) : func(val, addr))
ea8256f39e0f40 Andi Kleen 2021-08-20  61  
ea8256f39e0f40 Andi Kleen 2021-08-20 @62  static inline unsigned char iomap_readb(void __iomem *addr)
ea8256f39e0f40 Andi Kleen 2021-08-20  63  {
ea8256f39e0f40 Andi Kleen 2021-08-20  64  	return COND_MMIO_READ(readb, addr);
ea8256f39e0f40 Andi Kleen 2021-08-20  65  }
ea8256f39e0f40 Andi Kleen 2021-08-20  66  
ea8256f39e0f40 Andi Kleen 2021-08-20 @67  static inline unsigned short iomap_readw(void __iomem *addr)
ea8256f39e0f40 Andi Kleen 2021-08-20  68  {
ea8256f39e0f40 Andi Kleen 2021-08-20  69  	return COND_MMIO_READ(readw, addr);
ea8256f39e0f40 Andi Kleen 2021-08-20  70  }
ea8256f39e0f40 Andi Kleen 2021-08-20  71  
ea8256f39e0f40 Andi Kleen 2021-08-20 @72  static inline unsigned int iomap_readl(void __iomem *addr)
ea8256f39e0f40 Andi Kleen 2021-08-20  73  {
ea8256f39e0f40 Andi Kleen 2021-08-20  74  	return COND_MMIO_READ(readl, addr);
ea8256f39e0f40 Andi Kleen 2021-08-20  75  }
ea8256f39e0f40 Andi Kleen 2021-08-20  76  
ea8256f39e0f40 Andi Kleen 2021-08-20 @77  static inline unsigned long iomap_readq(void __iomem *addr)
ea8256f39e0f40 Andi Kleen 2021-08-20  78  {
ea8256f39e0f40 Andi Kleen 2021-08-20  79  	return COND_MMIO_READ(readq, addr);
ea8256f39e0f40 Andi Kleen 2021-08-20  80  }
ea8256f39e0f40 Andi Kleen 2021-08-20  81  

:::::: The code at line 62 was first introduced by commit
:::::: ea8256f39e0f4016b581dc94ce2d428a7584ec15 iomap: Add support for indirect MMIO

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
