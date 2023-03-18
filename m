Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00A377
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679106631; x=1710642631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SozL8NlyLe+iBSi05d3C/tAA7+z8Te4voaNWLFaB9hI=;
  b=dZ2YNw3Fei/k/GfjnLDOI8xmnRX2zZKplg2cFpTH55er3jfOE+uX9rUZ
   erotQaEzogJpIZjqieAG9WnqDblaKWHeguNxAhpS7nC4CoQZ0oecIOJT8
   WEmImIIZhuYGjNylRt5lIl2HEHgQWhDzUQXrk7pcMDVo2kJaDaBQdYNrg
   LG+mCaOr3njl5PKDqzlHMm3BorPQJse2DTh4liGW4l+ScoGlCz9KsExE/
   AA4pIyNuwJ6y4sz+YugCZjatKQaNggJ8AuJJaOu1WUqpbgPUM0QHRGKIO
   BnYkull8RZtNHA2tFXrORFsr9NDV4k/gcHUAMOOvet1tkHP7NHZH/8p0d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337105641"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="337105641"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 19:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="823868634"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="823868634"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 19:30:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdMKy-0009jq-29;
	Sat, 18 Mar 2023 02:30:28 +0000
Date: Sat, 18 Mar 2023 10:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/phy/microchip.c:367:3: warning: Value stored to 'temp'
 is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303181037.cdGQyc8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/phy/microchip.c:367:3: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yuiko Oshino <yuiko.oshino@microchip.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   478a351ce0d69cef2d2bf2a686a09b356b63a66c
commit: e57cf3639c323eeed05d3725fd82f91b349adca8 net: lan78xx: fix accessing the LAN7800's internal phy specific registers from the MAC driver
date:   2 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20230310 (https://download.01.org/0day-ci/archive/20230318/202303181037.cdGQyc8a-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e57cf3639c323eeed05d3725fd82f91b349adca8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e57cf3639c323eeed05d3725fd82f91b349adca8
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303181037.cdGQyc8a-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                ^
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is false
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is false
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is false
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is false
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is false
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loaded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:206:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:206:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/scsi/scsi_transport_iscsi.c:3348:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = transport->get_chap(shost, ev->u.get_chap.chap_tbl_idx,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_transport_iscsi.c:3348:3: note: Value stored to 'err' is never read
                   err = transport->get_chap(shost, ev->u.get_chap.chap_tbl_idx,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/net/phy/microchip.c:40:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = phy_write(phydev, LAN88XX_INT_MASK, 0x7FFF);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:40:3: note: Value stored to 'rc' is never read
                   rc = phy_write(phydev, LAN88XX_INT_MASK, 0x7FFF);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:41:3: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc = phy_read(phydev, LAN88XX_INT_STS);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:41:3: note: Value stored to 'rc' is never read
                   rc = phy_read(phydev, LAN88XX_INT_STS);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/microchip.c:367:3: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                   temp = phy_read(phydev, LAN88XX_INT_STS);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/microchip.c:367:3: note: Value stored to 'temp' is never read
                   temp = phy_read(phydev, LAN88XX_INT_STS);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/phy/mscc/mscc_main.c:344:2: warning: Value stored to 'reg_val' is never read [clang-analyzer-deadcode.DeadStores]
           reg_val = phy_read(phydev, MII_VSC85XX_INT_STATUS);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:344:2: note: Value stored to 'reg_val' is never read
           reg_val = phy_read(phydev, MII_VSC85XX_INT_STATUS);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:461:9: warning: 3rd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   ret = vsc85xx_dt_led_mode_get(phydev, led_dt_prop,
                         ^
   drivers/net/phy/mscc/mscc_main.c:2303:6: note: Assuming 'rate_magic' is >= 0
           if (rate_magic < 0)
               ^~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:2303:2: note: Taking false branch
           if (rate_magic < 0)
           ^
   drivers/net/phy/mscc/mscc_main.c:2307:6: note: Assuming 'vsc8531' is non-null
           if (!vsc8531)
               ^~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:2307:2: note: Taking false branch
           if (!vsc8531)
           ^
   drivers/net/phy/mscc/mscc_main.c:2319:6: note: Assuming field 'stats' is non-null
           if (!vsc8531->stats)
               ^~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:2319:2: note: Taking false branch
           if (!vsc8531->stats)
           ^
   drivers/net/phy/mscc/mscc_main.c:2322:9: note: Calling 'vsc85xx_dt_led_modes_get'
           return vsc85xx_dt_led_modes_get(phydev, default_mode);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:456:14: note: Assuming 'i' is < field 'nleds'
           for (i = 0; i < priv->nleds; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:456:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < priv->nleds; i++) {
           ^
   drivers/net/phy/mscc/mscc_main.c:458:7: note: Assuming 'ret' is >= 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/net/phy/mscc/mscc_main.c:458:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/net/phy/mscc/mscc_main.c:463:7: note: Assuming 'ret' is >= 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/net/phy/mscc/mscc_main.c:463:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/net/phy/mscc/mscc_main.c:456:14: note: Assuming 'i' is < field 'nleds'
           for (i = 0; i < priv->nleds; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:456:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < priv->nleds; i++) {
           ^
   drivers/net/phy/mscc/mscc_main.c:458:7: note: Assuming 'ret' is >= 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/net/phy/mscc/mscc_main.c:458:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/net/phy/mscc/mscc_main.c:463:7: note: Assuming 'ret' is >= 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/net/phy/mscc/mscc_main.c:463:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/net/phy/mscc/mscc_main.c:456:31: note: The value 2 is assigned to 'i'
           for (i = 0; i < priv->nleds; i++) {
                                        ^~~
   drivers/net/phy/mscc/mscc_main.c:456:14: note: Assuming 'i' is < field 'nleds'
           for (i = 0; i < priv->nleds; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:456:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < priv->nleds; i++) {
           ^
   drivers/net/phy/mscc/mscc_main.c:458:7: note: Assuming 'ret' is >= 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/net/phy/mscc/mscc_main.c:458:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/net/phy/mscc/mscc_main.c:461:9: note: 3rd function call argument is an uninitialized value
                   ret = vsc85xx_dt_led_mode_get(phydev, led_dt_prop,
                         ^
   drivers/net/phy/mscc/mscc_main.c:1944:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = phy_base_write(phydev, MSCC_INT_MEM_CNTL, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/mscc/mscc_main.c:1944:2: note: Value stored to 'ret' is never read
           ret = phy_base_write(phydev, MSCC_INT_MEM_CNTL, val);

vim +/temp +367 drivers/net/phy/microchip.c

f6e3ef3e4d3546 Woojung Huh  2016-11-17  344  
e57cf3639c323e Yuiko Oshino 2023-03-01  345  static void lan88xx_link_change_notify(struct phy_device *phydev)
e57cf3639c323e Yuiko Oshino 2023-03-01  346  {
e57cf3639c323e Yuiko Oshino 2023-03-01  347  	int temp;
e57cf3639c323e Yuiko Oshino 2023-03-01  348  
e57cf3639c323e Yuiko Oshino 2023-03-01  349  	/* At forced 100 F/H mode, chip may fail to set mode correctly
e57cf3639c323e Yuiko Oshino 2023-03-01  350  	 * when cable is switched between long(~50+m) and short one.
e57cf3639c323e Yuiko Oshino 2023-03-01  351  	 * As workaround, set to 10 before setting to 100
e57cf3639c323e Yuiko Oshino 2023-03-01  352  	 * at forced 100 F/H mode.
e57cf3639c323e Yuiko Oshino 2023-03-01  353  	 */
e57cf3639c323e Yuiko Oshino 2023-03-01  354  	if (!phydev->autoneg && phydev->speed == 100) {
e57cf3639c323e Yuiko Oshino 2023-03-01  355  		/* disable phy interrupt */
e57cf3639c323e Yuiko Oshino 2023-03-01  356  		temp = phy_read(phydev, LAN88XX_INT_MASK);
e57cf3639c323e Yuiko Oshino 2023-03-01  357  		temp &= ~LAN88XX_INT_MASK_MDINTPIN_EN_;
e57cf3639c323e Yuiko Oshino 2023-03-01  358  		phy_write(phydev, LAN88XX_INT_MASK, temp);
e57cf3639c323e Yuiko Oshino 2023-03-01  359  
e57cf3639c323e Yuiko Oshino 2023-03-01  360  		temp = phy_read(phydev, MII_BMCR);
e57cf3639c323e Yuiko Oshino 2023-03-01  361  		temp &= ~(BMCR_SPEED100 | BMCR_SPEED1000);
e57cf3639c323e Yuiko Oshino 2023-03-01  362  		phy_write(phydev, MII_BMCR, temp); /* set to 10 first */
e57cf3639c323e Yuiko Oshino 2023-03-01  363  		temp |= BMCR_SPEED100;
e57cf3639c323e Yuiko Oshino 2023-03-01  364  		phy_write(phydev, MII_BMCR, temp); /* set to 100 later */
e57cf3639c323e Yuiko Oshino 2023-03-01  365  
e57cf3639c323e Yuiko Oshino 2023-03-01  366  		/* clear pending interrupt generated while workaround */
e57cf3639c323e Yuiko Oshino 2023-03-01 @367  		temp = phy_read(phydev, LAN88XX_INT_STS);
e57cf3639c323e Yuiko Oshino 2023-03-01  368  
e57cf3639c323e Yuiko Oshino 2023-03-01  369  		/* enable phy interrupt back */
e57cf3639c323e Yuiko Oshino 2023-03-01  370  		temp = phy_read(phydev, LAN88XX_INT_MASK);
e57cf3639c323e Yuiko Oshino 2023-03-01  371  		temp |= LAN88XX_INT_MASK_MDINTPIN_EN_;
e57cf3639c323e Yuiko Oshino 2023-03-01  372  		phy_write(phydev, LAN88XX_INT_MASK, temp);
e57cf3639c323e Yuiko Oshino 2023-03-01  373  	}
e57cf3639c323e Yuiko Oshino 2023-03-01  374  }
e57cf3639c323e Yuiko Oshino 2023-03-01  375  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
