Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C97B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674060012; x=1705596012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5dbZb/iHll4VZSxIAY8oq2Mkj9ffXmPh+hg7+dMVRQ=;
  b=QyzkIJr+U6NYa4lDaHb7d7d+D4/dcusqEiOFJJcji+xzlQ8lq6jp8XzE
   EfAz3FPbXIyqx0gfS6LAUJflxf4jiaox8zVmfN6jFdYJ3HIKtfuvexJag
   6Wtvm/gVwZcg6vumQgwHKmTY9SVcQpJKRcPru2rMHAMSQ3Qhaz84o3Sm3
   aQp4JwTQKjn7cYfD+GkQ8e7KLnISREzPmrbiTRlDTgiIWVdnjD5FdNi3h
   WsMqU6D+hLOvTkTElW9SlTvF6SKu5bL/bOxckiZhhyisLpTer6nMmP9Vn
   lrDbOZPmLuyXSOFRwwKmyJiz034Mj8cqwX3LT+vwWXnuBWeeUlmLoVH6L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308589357"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308589357"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:39:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783741419"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="783741419"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Jan 2023 08:39:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBTg-0000WK-0V;
	Wed, 18 Jan 2023 16:39:56 +0000
Date: Thu, 19 Jan 2023 00:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/mach-mxs/mach-mxs.c:73:20: warning: unused function
 '__mxs_togl'
Message-ID: <202301190011.cKNlCGNa-lkp@intel.com>
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
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 7036440eab3e2d47a775d4616909f8235488d714 ARM: omap1: enable multiplatform
date:   8 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r032-20230115 (https://download.01.org/0day-ci/archive/20230119/202301190011.cKNlCGNa-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7036440eab3e2d47a775d4616909f8235488d714
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7036440eab3e2d47a775d4616909f8235488d714
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-mxs/mach-mxs.c:73:20: warning: unused function '__mxs_togl' [-Wunused-function]
   static inline void __mxs_togl(u32 mask, void __iomem *reg)
                      ^
   1 warning generated.


vim +/__mxs_togl +73 arch/arm/mach-mxs/mach-mxs.c

0b48d3a6fbac641 Shawn Guo    2013-03-29  72  
0b48d3a6fbac641 Shawn Guo    2013-03-29 @73  static inline void __mxs_togl(u32 mask, void __iomem *reg)
0b48d3a6fbac641 Shawn Guo    2013-03-29  74  {
0b48d3a6fbac641 Shawn Guo    2013-03-29  75  	__raw_writel(mask, reg + MXS_TOG_ADDR);
0b48d3a6fbac641 Shawn Guo    2013-03-29  76  }
bc3a59c1b7b1c36 Dong Aisheng 2012-03-31  77  

:::::: The code at line 73 was first introduced by commit
:::::: 0b48d3a6fbac641d1da12bbe202ec82ff0c89148 ARM: mxs: remove unused headers

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
