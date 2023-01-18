Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88BB539E
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674065661; x=1705601661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4H5xb4WcoPSsxHIAIXJUgpzPGQ9gVneTbej30UifHo=;
  b=Zw/U1o9J8x5vgZ7sEQwod8RbpIXb6ybA9dyjk5a3MKGygP2pAFUMHkwx
   euTlRDrj3mmDGt1Oj9BrYqwlBD/69zL2drqIulnL4WpytQjreGjQaJFpO
   jI5K3li4aw1R6rNz7X5LdwND2OnB5QEeC7X5AKkowUsU561vm70pY9ykR
   CvudGKBvRocpE+Y1PAALF5/YJ93dk6BsutcUlCf08PFNQXJ5nzfvAbqmJ
   LCmWJ9dWMKJbpYfKKw+OY337o9qeLfz73EqtgOtgDgtzsvENLnmdjOuTJ
   AK0Cu2CrafFSIK8RWolTLS45dRqkIZw5e88LJd3jF+BSoFWCCDEJe7TGk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304742435"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="304742435"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 10:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="653051299"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="653051299"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jan 2023 10:14:08 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pICwp-0000c2-2u;
	Wed, 18 Jan 2023 18:14:07 +0000
Date: Thu, 19 Jan 2023 02:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/pinctrl-at91.c:1650:12: warning: unused function
 'at91_gpio_suspend'
Message-ID: <202301190231.oWPtSJ5A-lkp@intel.com>
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
TO: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: a575207583676298f3999d41d86d81f7172fe950 pinctrl: at91: move gpio suspend/resume calls to driver's context
date:   5 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-r046-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190231.oWPtSJ5A-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a575207583676298f3999d41d86d81f7172fe950
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a575207583676298f3999d41d86d81f7172fe950
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pinctrl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-at91.c:1650:12: warning: unused function 'at91_gpio_suspend' [-Wunused-function]
   static int at91_gpio_suspend(struct device *dev)
              ^
>> drivers/pinctrl/pinctrl-at91.c:1668:12: warning: unused function 'at91_gpio_resume' [-Wunused-function]
   static int at91_gpio_resume(struct device *dev)
              ^
   2 warnings generated.


vim +/at91_gpio_suspend +1650 drivers/pinctrl/pinctrl-at91.c

647f8d94a4e69d Ludovic Desroches 2013-03-08  1649  
a5752075836762 Claudiu Beznea    2022-08-31 @1650  static int at91_gpio_suspend(struct device *dev)
647f8d94a4e69d Ludovic Desroches 2013-03-08  1651  {
a5752075836762 Claudiu Beznea    2022-08-31  1652  	struct at91_gpio_chip *at91_chip = dev_get_drvdata(dev);
a5752075836762 Claudiu Beznea    2022-08-31  1653  	void __iomem *pio = at91_chip->regbase;
647f8d94a4e69d Ludovic Desroches 2013-03-08  1654  
a5752075836762 Claudiu Beznea    2022-08-31  1655  	at91_chip->backups = readl_relaxed(pio + PIO_IMR);
a5752075836762 Claudiu Beznea    2022-08-31  1656  	writel_relaxed(at91_chip->backups, pio + PIO_IDR);
a5752075836762 Claudiu Beznea    2022-08-31  1657  	writel_relaxed(at91_chip->wakeups, pio + PIO_IER);
647f8d94a4e69d Ludovic Desroches 2013-03-08  1658  
a5752075836762 Claudiu Beznea    2022-08-31  1659  	if (!at91_chip->wakeups)
a5752075836762 Claudiu Beznea    2022-08-31  1660  		clk_disable_unprepare(at91_chip->clock);
795f9953eaccf9 Boris Brezillon   2013-12-15  1661  	else
647f8d94a4e69d Ludovic Desroches 2013-03-08  1662  		printk(KERN_DEBUG "GPIO-%c may wake for %08x\n",
a5752075836762 Claudiu Beznea    2022-08-31  1663  		       'A' + at91_chip->id, at91_chip->wakeups);
a5752075836762 Claudiu Beznea    2022-08-31  1664  
a5752075836762 Claudiu Beznea    2022-08-31  1665  	return 0;
647f8d94a4e69d Ludovic Desroches 2013-03-08  1666  }
647f8d94a4e69d Ludovic Desroches 2013-03-08  1667  
a5752075836762 Claudiu Beznea    2022-08-31 @1668  static int at91_gpio_resume(struct device *dev)
647f8d94a4e69d Ludovic Desroches 2013-03-08  1669  {
a5752075836762 Claudiu Beznea    2022-08-31  1670  	struct at91_gpio_chip *at91_chip = dev_get_drvdata(dev);
a5752075836762 Claudiu Beznea    2022-08-31  1671  	void __iomem *pio = at91_chip->regbase;
647f8d94a4e69d Ludovic Desroches 2013-03-08  1672  
a5752075836762 Claudiu Beznea    2022-08-31  1673  	if (!at91_chip->wakeups)
a5752075836762 Claudiu Beznea    2022-08-31  1674  		clk_prepare_enable(at91_chip->clock);
647f8d94a4e69d Ludovic Desroches 2013-03-08  1675  
a5752075836762 Claudiu Beznea    2022-08-31  1676  	writel_relaxed(at91_chip->wakeups, pio + PIO_IDR);
a5752075836762 Claudiu Beznea    2022-08-31  1677  	writel_relaxed(at91_chip->backups, pio + PIO_IER);
647f8d94a4e69d Ludovic Desroches 2013-03-08  1678  
a5752075836762 Claudiu Beznea    2022-08-31  1679  	return 0;
647f8d94a4e69d Ludovic Desroches 2013-03-08  1680  }
647f8d94a4e69d Ludovic Desroches 2013-03-08  1681  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
