Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F4F257F
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674107260; x=1705643260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7BGsMVhF32kNLLhROz5DSq+tSbKb6C+okM7bPD2GlRg=;
  b=n8zZ2dNvHkIDZwOt6zMGLPgL3xTJ7CWDMSP+dU2QoxeTMPohmqBWulJL
   RS7w6iaor1aNDUAN0V6Qx56U4Utt2hvTKivlLg7kj1S1vMGJFlsv9Ealg
   elvMaW8H6QoireOvc9GpJ59yTe97RfNsvQM5thY9P95m86ah5gaN3WEMU
   3/aDE8qvCbmsBTbw2755FqIxRGibtWaVbK7swyDnvi8kk/nQnYXdT5ilh
   H6wBB4ts52rXocNQmoGx6JY3aKCI/euhSZsEg0rLYT7hFLnj271RIQv09
   SNCUyQRGAMW2XrAxH8dT7nGvTA1+K2bTq9OATwwSfRmbhsM20iYEc55cJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352457252"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="352457252"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 21:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="660069798"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="660069798"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 21:47:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pINlu-00019E-39;
	Thu, 19 Jan 2023 05:47:34 +0000
Date: Thu, 19 Jan 2023 13:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:5.15/linux 16/16]
 drivers/i2c/busses/i2c-designware-pcidrv.c:69:12: warning: unused function
 'dw_reg_read'
Message-ID: <202301191334.w0M07yQz-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
CC: nanli2x <nanx.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   4e26912f977bc8d60339bfcd56a777a08ded493d
commit: 1ec5959a8f6dbfbb47057317bc935924cd8d6977 [16/16] i2c: Add read and write functions in pcidrv
:::::: branch date: 7 days ago
:::::: commit date: 8 months ago
config: s390-randconfig-r004-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191334.w0M07yQz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/1ec5959a8f6dbfbb47057317bc935924cd8d6977
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 1ec5959a8f6dbfbb47057317bc935924cd8d6977
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-designware-pcidrv.c:18:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/i2c/busses/i2c-designware-pcidrv.c:18:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/i2c/busses/i2c-designware-pcidrv.c:18:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-designware-pcidrv.c:69:12: warning: unused function 'dw_reg_read' [-Wunused-function]
   static int dw_reg_read(struct dw_i2c_dev *dev, unsigned int reg, unsigned int *val)
              ^
>> drivers/i2c/busses/i2c-designware-pcidrv.c:75:12: warning: unused function 'dw_reg_write' [-Wunused-function]
   static int dw_reg_write(struct dw_i2c_dev *dev, unsigned int reg, unsigned int val)
              ^
   14 warnings generated.


vim +/dw_reg_read +69 drivers/i2c/busses/i2c-designware-pcidrv.c

fe20ff5c7e9ca7f Dirk Brandewie      2011-10-06  68  
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03 @69  static int dw_reg_read(struct dw_i2c_dev *dev, unsigned int reg, unsigned int *val)
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  70  {
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  71  	*val = readl_relaxed(dev->base + reg);
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  72  	return 0;
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  73  }
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  74  
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03 @75  static int dw_reg_write(struct dw_i2c_dev *dev, unsigned int reg, unsigned int val)
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  76  {
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  77  	writel_relaxed(val, dev->base + reg);
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  78  	return 0;
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  79  }
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
