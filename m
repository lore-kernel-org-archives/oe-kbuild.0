Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5064A3205
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674055075; x=1705591075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n68W51f867b5siB4gKqZXXW2HBUw1LJB/9tKlu00Vlw=;
  b=mXy8kJ/r29hQSrTlHNo199/4u4uA9kIQPPzIM8eloMbM9m81chiFJaSD
   75X8r7+iMxN3WpXziiP2nSILPYuDU3Dw2+8eKp2I9u8RBbJk6UZiM/jEd
   8vhU1XCvDoVawmTlJ5c40DItQQRtTgdpePSvO4y3P6wT3MOMf6cWTvs4E
   rFmaD47RkU04WCUI8Lk4sAIavoaz3JyRdjY6CSoLWlEfLHcJD5a77YOtM
   YVRNptMIQU9n9j9HBvR8BJRF9b2hNs2Qd0Epw4viXkbd2DW7nBquMsDhX
   8BD1fA0r0c4soBxLKS2E/dPZukDOEgFFMGMIr1cb9EDVHEzijHLeK2qMx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="325057393"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325057393"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="692030423"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="692030423"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 07:17:53 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIACG-0000SL-1U;
	Wed, 18 Jan 2023 15:17:52 +0000
Date: Wed, 18 Jan 2023 23:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/usb/phy/phy-isp1301-omap.c:126:20: warning: unused function
 'notresponding'
Message-ID: <202301182341.OHyk2eVP-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 11e002924ddb6f12638532331195a8ab09bbbf7e usb: omap: avoid mach/*.h headers
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-r034-20230117 (https://download.01.org/0day-ci/archive/20230118/202301182341.OHyk2eVP-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=11e002924ddb6f12638532331195a8ab09bbbf7e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 11e002924ddb6f12638532331195a8ab09bbbf7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/usb/ fs//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/phy/phy-isp1301-omap.c:126:20: warning: unused function 'notresponding' [-Wunused-function]
   static inline void notresponding(struct isp1301 *isp)
                      ^
   1 warning generated.


vim +/notresponding +126 drivers/usb/phy/phy-isp1301-omap.c

d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28  123  
d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28  124  
d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28  125  /* products will deliver OTG messages with LEDs, GUI, etc */
d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28 @126  static inline void notresponding(struct isp1301 *isp)
d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28  127  {
d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28  128  	printk(KERN_NOTICE "OTG device not responding.\n");
d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28  129  }
d1846b0e7a1dc2 drivers/i2c/chips/isp1301_omap.c David Brownell 2008-11-28  130  

:::::: The code at line 126 was first introduced by commit
:::::: d1846b0e7a1dc26f90fb0d75641aca9abb077ef9 i2c/isp1301_omap: Build fixes

:::::: TO: David Brownell <dbrownell@users.sourceforge.net>
:::::: CC: Jean Delvare <khali@linux-fr.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
