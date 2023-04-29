Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414125672
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Apr 2023 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682797513; x=1714333513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XpFvtsUVC6oZGdUpGgcXfVA4alR0f/xK1vpGyRYuwM=;
  b=MPBHoRvxIkc1uonsuYzocS4fooWT6+YCsyJlUXyZyoSO8xVTPG2HRjGZ
   x+rir37/k4e7Sc3m7dCuU36Qq2IFRTp4RQXn7O6ZMB0XFBUaY5ToZeAdz
   FH9+QiacHQtWoFjecFB1Qn2tfJm85TgzcVk7X2GiUu1Zoq4nuXyWxTleV
   IINU3vDBhqv9uODvGil6Q7YEP4i+81te+bkUZjq60TcIilmGZkuvaSpMP
   7LRUry5yv9qQdB4xkDtrk1h2P/+dqQf4ueLI5A0llvsnEZfZ2xGbBDxJD
   YC7ozU7qg7FiHyfX5GHHlgzXdJwmjcvsR/dYVx0SGtX+DhgqNl3qWKNjJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="345424949"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="345424949"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 12:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="819483617"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="819483617"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Apr 2023 12:45:11 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psqVK-0001Jn-2A;
	Sat, 29 Apr 2023 19:45:10 +0000
Date: Sun, 30 Apr 2023 03:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/rockchip/dtpm.c:15:12: sparse: sparse: obsolete array
 initializer, use C99 syntax
Message-ID: <202304300340.Fi0vxfJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/soc/rockchip/dtpm.c:15:12: sparse: sparse: obsolete array initializer, use C99 syntax"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Brian Norris <briannorris@chromium.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1ae78a14516b9372e4c90a89ac21b259339a3a3a
commit: add9f6f30e54b5c07e7a0260cda459ef1d9646b7 soc: rockchip: Fix compile-testing SoC drivers
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: nios2-randconfig-s051-20230430 (https://download.01.org/0day-ci/archive/20230430/202304300340.Fi0vxfJf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=add9f6f30e54b5c07e7a0260cda459ef1d9646b7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout add9f6f30e54b5c07e7a0260cda459ef1d9646b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/soc/rockchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304300340.Fi0vxfJf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/rockchip/dtpm.c:15:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:17:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:20:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:23:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:26:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:29:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:32:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:35:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:38:12: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:41:12: sparse: sparse: obsolete array initializer, use C99 syntax

vim +15 drivers/soc/rockchip/dtpm.c

b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  13  
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  14  static struct dtpm_node __initdata rk3399_hierarchy[] = {
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28 @15  	[0]{ .name = "rk3399",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  16  	     .type = DTPM_NODE_VIRTUAL },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  17  	[1]{ .name = "package",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  18  	     .type = DTPM_NODE_VIRTUAL,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  19  	     .parent = &rk3399_hierarchy[0] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  20  	[2]{ .name = "/cpus/cpu@0",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  21  	     .type = DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  22  	     .parent = &rk3399_hierarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  23  	[3]{ .name = "/cpus/cpu@1",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  24  	     .type = DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  25  	     .parent = &rk3399_hierarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  26  	[4]{ .name = "/cpus/cpu@2",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  27  	     .type = DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  28  	     .parent = &rk3399_hierarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  29  	[5]{ .name = "/cpus/cpu@3",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  30  	     .type = DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  31  	     .parent = &rk3399_hierarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  32  	[6]{ .name = "/cpus/cpu@100",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  33  	     .type = DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  34  	     .parent = &rk3399_hierarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  35  	[7]{ .name = "/cpus/cpu@101",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  36  	     .type = DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  37  	     .parent = &rk3399_hierarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  38  	[8]{ .name = "/gpu@ff9a0000",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  39  	     .type = DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  40  	     .parent = &rk3399_hierarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  41  	[9]{ /* sentinel */ }
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  42  };
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  43  

:::::: The code at line 15 was first introduced by commit
:::::: b9d6c47a2be8d273ecc063afda6e9fd66a35116d rockchip/soc/drivers: Add DTPM description for rk3399

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
