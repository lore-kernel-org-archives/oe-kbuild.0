Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D8E53A7
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 19:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674069979; x=1705605979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JJoIjiM83hcoF3WTgcdPMJ7DvJNrGMpP37ViG2mnVng=;
  b=MfFi5WWAH7rA8xrgh8d130EyQ7W4w4D64sD1bwcwUK2uAUNvAJ66y61/
   +R3yQzTv001mAYmYSUiXcXIj53eXQQC66AqKCJdEFSert4OZijBJlN9z1
   xCb2kM7qhOd7+NfnbC8EQD+94iCgj9wun4xKUjFIu0OQnAyi64legNGJk
   SLHtbeo9y+wxDvZomfHpnGlWfcPdRNsyFrQ2js5Kns/z7UwFXr6h46+b3
   vQPJJXPT/KfLZF+Nr2v2yCW8wQVk+W3N+fL/4bxFQHH03e9QenJWfzhpg
   Has4Re7zl4m1yDoyoj1L2HjLjUluTrzJbMiRNR13kdQH4JVKHwp/5c2Ih
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326341920"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="326341920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723212969"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="723212969"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 11:26:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIE4Z-0000ek-0J;
	Wed, 18 Jan 2023 19:26:11 +0000
Date: Thu, 19 Jan 2023 03:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/sunplus/sppctl.c:393:12: warning: unused function
 'sppctl_gpio_inv_get'
Message-ID: <202301190311.jbodCg9L-lkp@intel.com>
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
TO: Qin Jian <qinjian@cqplus1.com>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Qin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 0aa94eea8d955c82014e5368a843da93f1dc58f8 ARM: sunplus: Add initial support for Sunplus SP7021 SoC
date:   6 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-r013-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190311.jbodCg9L-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0aa94eea8d955c82014e5368a843da93f1dc58f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0aa94eea8d955c82014e5368a843da93f1dc58f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pinctrl/nomadik/ drivers/pinctrl/sunplus/ drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/sunplus/sppctl.c:393:12: warning: unused function 'sppctl_gpio_inv_get' [-Wunused-function]
   static int sppctl_gpio_inv_get(struct gpio_chip *chip, unsigned int offset)
              ^
   1 warning generated.


vim +/sppctl_gpio_inv_get +393 drivers/pinctrl/sunplus/sppctl.c

aa74c44be19c8b1 Wells Lu 2022-01-16  392  
aa74c44be19c8b1 Wells Lu 2022-01-16 @393  static int sppctl_gpio_inv_get(struct gpio_chip *chip, unsigned int offset)
aa74c44be19c8b1 Wells Lu 2022-01-16  394  {
aa74c44be19c8b1 Wells Lu 2022-01-16  395  	struct sppctl_gpio_chip *spp_gchip = gpiochip_get_data(chip);
aa74c44be19c8b1 Wells Lu 2022-01-16  396  	u32 reg_off, bit_off, reg;
aa74c44be19c8b1 Wells Lu 2022-01-16  397  	unsigned long flags;
aa74c44be19c8b1 Wells Lu 2022-01-16  398  
aa74c44be19c8b1 Wells Lu 2022-01-16  399  	bit_off = sppctl_get_moon_reg_and_bit_offset(offset, &reg_off);
aa74c44be19c8b1 Wells Lu 2022-01-16  400  
aa74c44be19c8b1 Wells Lu 2022-01-16  401  	spin_lock_irqsave(&spp_gchip->lock, flags);
aa74c44be19c8b1 Wells Lu 2022-01-16  402  
aa74c44be19c8b1 Wells Lu 2022-01-16  403  	if (sppctl_gpio_get_direction(chip, offset))
aa74c44be19c8b1 Wells Lu 2022-01-16  404  		reg = sppctl_gpio_iinv_readl(spp_gchip, reg_off);
aa74c44be19c8b1 Wells Lu 2022-01-16  405  	else
aa74c44be19c8b1 Wells Lu 2022-01-16  406  		reg = sppctl_gpio_oinv_readl(spp_gchip, reg_off);
aa74c44be19c8b1 Wells Lu 2022-01-16  407  
aa74c44be19c8b1 Wells Lu 2022-01-16  408  	spin_unlock_irqrestore(&spp_gchip->lock, flags);
aa74c44be19c8b1 Wells Lu 2022-01-16  409  
aa74c44be19c8b1 Wells Lu 2022-01-16  410  	return (reg & BIT(bit_off)) ? 1 : 0;
aa74c44be19c8b1 Wells Lu 2022-01-16  411  }
aa74c44be19c8b1 Wells Lu 2022-01-16  412  

:::::: The code at line 393 was first introduced by commit
:::::: aa74c44be19c8b1de38d955c2c45c309991c805a pinctrl: Add driver for Sunplus SP7021

:::::: TO: Wells Lu <wellslutw@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
