Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95548BED
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678301277; x=1709837277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZPJJx8ZyiC7qyjmcKUroUWGv6XZYUBxWVgi/eS083Y=;
  b=JzsmJ+AzM0xt1Fc90t7h+hsCtRJi2d7U1TyLzvqrlHqNCIbJq/xznNIA
   4lX9eJ9hH3Z/tV5zK5aNzkP0BBGrQuT24xENAQwPn/pfa2p1Maezv5Gcz
   mU6eAImcUAH8gLDHhwZsz7iIepwKdY1Fwh2UY8Jlj49PGUFtW3HoXQqyX
   +uKK9YsljVQfx5eA34IRzuc7SZ1Y2tG4dvBeHnDzlhwAAkvBNMXlFUgdo
   B0SnW7PA5npYq6uMgwTvoz0HoQ4VXT+3IO0iqfG/CDZHrFld/7W33n2JH
   4jDbPMl0JioV1qw7tzaO2srNsPJEbcfbcbElr3izhOgoOlea/5gxNtglP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316640985"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="316640985"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 10:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006432658"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="1006432658"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 10:47:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZypP-0002LR-1Z;
	Wed, 08 Mar 2023 18:47:55 +0000
Date: Thu, 9 Mar 2023 02:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 896/1915] ERROR: modpost: "fsi_driver_register"
 [drivers/spi/spi-fsi.ko] undefined!
Message-ID: <202303090232.opOTPBM1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ERROR: modpost: "fsi_driver_register" [drivers/spi/spi-fsi.ko] undefined!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mark Brown <broonie@kernel.org>

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc31900c948610e7b5c2f15fb7795832c8325327
commit: f916c7080d28831493518364492e33fc6a437907 [896/1915] spi: fsi: Make available for build test
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: mips-randconfig-s043-20230308 (https://download.01.org/0day-ci/archive/20230309/202303090232.opOTPBM1-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f916c7080d28831493518364492e33fc6a437907
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f916c7080d28831493518364492e33fc6a437907
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303090232.opOTPBM1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fsi_driver_register" [drivers/spi/spi-fsi.ko] undefined!
>> ERROR: modpost: "fsi_driver_unregister" [drivers/spi/spi-fsi.ko] undefined!
>> ERROR: modpost: "fsi_slave_read" [drivers/spi/spi-fsi.ko] undefined!
>> ERROR: modpost: "fsi_bus_type" [drivers/spi/spi-fsi.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
