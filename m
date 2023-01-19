Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59579257E
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 06:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674109119; x=1705645119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RvaCgniqO9K84nVi7HeC2QS/fE+z1XVqp4BjBqqDnBY=;
  b=Opx/SmWg6xNI3nvhgFdIcg1OETFwAqZ70E2FmFiUUI29HZfOgJJKjT+O
   juoSWCOMWairxoBHeJ9bIsaVGQx5zZAzRGRTJqRFH2rksGe7xb4tgKoVZ
   FEWBNOUoAyTVmp87mdHIxYk4pEuhuB5rSvcGytT/TaRgHbV0dbHJKP5RA
   YpSgXEtqXDXk4AkMlaA+iifclMeaAs2zo0zA4NRrRnWyH3kL0PyRA630h
   r5hxvBvfroBj+aqMgI2tWoHPpqFn0CpHwIQFSBvCZtUMOMPUDnS4I0RP4
   oM8R8xCdWJ2icYisaPb6ZAAhP18zZUqWSLagwjfkQJvdJ1NEKthFbYOn8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326470853"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="326470853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 22:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723381015"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="723381015"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 22:18:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIOFx-0001Cm-02;
	Thu, 19 Jan 2023 06:18:37 +0000
Date: Thu, 19 Jan 2023 14:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/mach-pxa/pxa3xx-ulpi.c:39:19: warning: unused function
 'u2d_readl'
Message-ID: <202301191430.WcMxtd78-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 8c1fb11b8a77dc489a8ef6d96c38c1297b629d06 ARM: s3c: enable s3c24xx multiplatform support
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r032-20230115 (https://download.01.org/0day-ci/archive/20230119/202301191430.WcMxtd78-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8c1fb11b8a77dc489a8ef6d96c38c1297b629d06
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8c1fb11b8a77dc489a8ef6d96c38c1297b629d06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-pxa/pxa3xx-ulpi.c:39:19: warning: unused function 'u2d_readl' [-Wunused-function]
   static inline u32 u2d_readl(u32 reg)
                     ^
>> arch/arm/mach-pxa/pxa3xx-ulpi.c:44:20: warning: unused function 'u2d_writel' [-Wunused-function]
   static inline void u2d_writel(u32 reg, u32 val)
                      ^
   2 warnings generated.


vim +/u2d_readl +39 arch/arm/mach-pxa/pxa3xx-ulpi.c

69f22be7b10684a Igor Grinberg 2010-07-27  38  
69f22be7b10684a Igor Grinberg 2010-07-27 @39  static inline u32 u2d_readl(u32 reg)
69f22be7b10684a Igor Grinberg 2010-07-27  40  {
69f22be7b10684a Igor Grinberg 2010-07-27  41  	return __raw_readl(u2d->mmio_base + reg);
69f22be7b10684a Igor Grinberg 2010-07-27  42  }
69f22be7b10684a Igor Grinberg 2010-07-27  43  
69f22be7b10684a Igor Grinberg 2010-07-27 @44  static inline void u2d_writel(u32 reg, u32 val)
69f22be7b10684a Igor Grinberg 2010-07-27  45  {
69f22be7b10684a Igor Grinberg 2010-07-27  46  	__raw_writel(val, u2d->mmio_base + reg);
69f22be7b10684a Igor Grinberg 2010-07-27  47  }
69f22be7b10684a Igor Grinberg 2010-07-27  48  

:::::: The code at line 39 was first introduced by commit
:::::: 69f22be7b10684ade3808de22db87c536ed135f3 ARM: pxa: add U2D controller and ULPI driver for pxa3xx

:::::: TO: Igor Grinberg <grinberg@compulab.co.il>
:::::: CC: Eric Miao <eric.y.miao@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
