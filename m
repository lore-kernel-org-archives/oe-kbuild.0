Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BABF23AE
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 05:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674105396; x=1705641396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSbfw7UmGcKyyzEi1yoRTlpYEsqOzgRZ7eaveiaXg6g=;
  b=m33kxGDERtI5EMFlJKaap6Vl1PzRLQ0bRp4+WSd1CsiAJrtBGJPie6st
   uq8GR79BknTZi+WksZQ9GwXiySMJ4d58ZUm4ySdql6Sa1DRONFWHjcHWW
   +o4ePM6pPay2moiiwUpI8bhLwt06dagfr2fhZWk31Ug71TPV3tLQjtcMW
   5tsZB30Gj/PtlETIdibcybE/T7zDL8KR2qVvOSsRSGdJtf7gWTgMmX85s
   8wqbDV4uPuG/p3+n6HO0EH3AmQHS7hEpgiUmU7ddwxQxHEE6VzYqs1xg7
   RL+kLl5Oqc9+9M+QRbbA1RnFJ90ctFZYtP+H+2jRiBnO3n70ftgIKea0e
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387548661"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="387548661"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 21:16:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768058004"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="768058004"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 21:16:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pINHt-00017i-1R;
	Thu, 19 Jan 2023 05:16:33 +0000
Date: Thu, 19 Jan 2023 13:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:guest-hardening-rebased 15/38] lib/iomap.c:62:29:
 warning: unused function 'iomap_readb'
Message-ID: <202301191312.VT4FdfJD-lkp@intel.com>
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
commit: 2de38c125a97d941d1e1396b035dc3cc40553a0d [15/38] x86/tdx: Enable direct iomap MMIO optimizations
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230119/202301191312.VT4FdfJD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/2de38c125a97d941d1e1396b035dc3cc40553a0d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-hardening-rebased
        git checkout 2de38c125a97d941d1e1396b035dc3cc40553a0d
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

2c2eed3f104d85 Andi Kleen 2021-08-20  55  
2c2eed3f104d85 Andi Kleen 2021-08-20  56  #define COND_MMIO_READ(func, addr)			\
2c2eed3f104d85 Andi Kleen 2021-08-20  57  	(iomap_mmio ? iomap_mmio->i ## func(addr) : func(addr))
2c2eed3f104d85 Andi Kleen 2021-08-20  58  
2c2eed3f104d85 Andi Kleen 2021-08-20  59  #define COND_MMIO_WRITE(func, val, addr)		\
2c2eed3f104d85 Andi Kleen 2021-08-20  60  	(iomap_mmio ? iomap_mmio->i ## func(val, addr) : func(val, addr))
2c2eed3f104d85 Andi Kleen 2021-08-20  61  
2c2eed3f104d85 Andi Kleen 2021-08-20 @62  static inline unsigned char iomap_readb(void __iomem *addr)
2c2eed3f104d85 Andi Kleen 2021-08-20  63  {
2c2eed3f104d85 Andi Kleen 2021-08-20  64  	return COND_MMIO_READ(readb, addr);
2c2eed3f104d85 Andi Kleen 2021-08-20  65  }
2c2eed3f104d85 Andi Kleen 2021-08-20  66  
2c2eed3f104d85 Andi Kleen 2021-08-20 @67  static inline unsigned short iomap_readw(void __iomem *addr)
2c2eed3f104d85 Andi Kleen 2021-08-20  68  {
2c2eed3f104d85 Andi Kleen 2021-08-20  69  	return COND_MMIO_READ(readw, addr);
2c2eed3f104d85 Andi Kleen 2021-08-20  70  }
2c2eed3f104d85 Andi Kleen 2021-08-20  71  
2c2eed3f104d85 Andi Kleen 2021-08-20 @72  static inline unsigned int iomap_readl(void __iomem *addr)
2c2eed3f104d85 Andi Kleen 2021-08-20  73  {
2c2eed3f104d85 Andi Kleen 2021-08-20  74  	return COND_MMIO_READ(readl, addr);
2c2eed3f104d85 Andi Kleen 2021-08-20  75  }
2c2eed3f104d85 Andi Kleen 2021-08-20  76  
2c2eed3f104d85 Andi Kleen 2021-08-20 @77  static inline unsigned long iomap_readq(void __iomem *addr)
2c2eed3f104d85 Andi Kleen 2021-08-20  78  {
2c2eed3f104d85 Andi Kleen 2021-08-20  79  	return COND_MMIO_READ(readq, addr);
2c2eed3f104d85 Andi Kleen 2021-08-20  80  }
2c2eed3f104d85 Andi Kleen 2021-08-20  81  

:::::: The code at line 62 was first introduced by commit
:::::: 2c2eed3f104d85c2cba40ddc00e11f59b351879a iomap: Add support for indirect MMIO

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
