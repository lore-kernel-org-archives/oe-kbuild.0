Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C630AD58
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Feb 2023 19:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677267670; x=1708803670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P31nZ7PvQ56fRLHd6dtz8thps3sRZ78UQ26ig9n5VpU=;
  b=dhJqWCpfBQr0hhhzLsO2kIGiabpeSWCcVQVLyIQvB8FbxqZiKTozLM5K
   UBEHMgKXDV/ybQEsyNKYxkD8IkMbBPMmYhTIeueICLHBCP+CiO2ZRmCOl
   1MERU0gQqkN7vx9T7ChKdTY+ilXjeWiw3Rmn8+zc/CDZvLOCJlsyjyR7z
   VRxjHyERqICnAVObizl6rg7b1HgG58PvlfZMpJziK0cwVONyohUWLRYly
   HuPU1qAGuMsTAdVVBAiUqgCzEOlderHQoGocJ65mZdr0MOak0DYWKq9sH
   rHDBsaXD9s5GK37QUdrqzJY53fIJM/cLsEeiiiuNvhrWk7DB0y/IwwGME
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="334993550"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="334993550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 11:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="736918451"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="736918451"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2023 11:41:06 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVdwH-0002gh-1M;
	Fri, 24 Feb 2023 19:41:05 +0000
Date: Sat, 25 Feb 2023 03:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/phy/phy-c45.c:712:2: warning: Undefined or garbage value
 returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Message-ID: <202302250318.305zLwFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/phy/phy-c45.c:712:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oleksij Rempel <o.rempel@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2980d8d826554fa6981d621e569a453787472f8
commit: 022c3f87f88e2d68e90be7687d981c9cb893a3b1 net: phy: add genphy_c45_ethtool_get/set_eee() support
date:   11 days ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 days ago
config: s390-randconfig-c005-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250318.305zLwFv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=022c3f87f88e2d68e90be7687d981c9cb893a3b1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 022c3f87f88e2d68e90be7687d981c9cb893a3b1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302250318.305zLwFv-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/comedi/comedi_fops.c:1542:25: note: Assuming '__UNIQUE_ID___x275' is <= '__UNIQUE_ID___y276'
                   max_n_data_required = max(max_n_data_required, insns[i].n);
                                         ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/comedi/comedi_fops.c:1542:25: note: '?' condition is false
                   max_n_data_required = max(max_n_data_required, insns[i].n);
                                         ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/comedi/comedi_fops.c:1535:14: note: Assuming 'i' is >= 'n_insns'
           for (i = 0; i < n_insns; ++i) {
                       ^~~~~~~~~~~
   drivers/comedi/comedi_fops.c:1535:2: note: Loop condition is false. Execution continues on line 1546
           for (i = 0; i < n_insns; ++i) {
           ^
   drivers/comedi/comedi_fops.c:1548:6: note: Assuming 'data' is non-null
           if (!data) {
               ^~~~~
   drivers/comedi/comedi_fops.c:1548:2: note: Taking false branch
           if (!data) {
           ^
   drivers/comedi/comedi_fops.c:1553:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < n_insns; ++i) {
           ^
   drivers/comedi/comedi_fops.c:1554:7: note: Assuming the condition is false
                   if (insns[i].insn & INSN_MASK_WRITE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/comedi_fops.c:1554:3: note: Taking false branch
                   if (insns[i].insn & INSN_MASK_WRITE) {
                   ^
   drivers/comedi/comedi_fops.c:1564:7: note: Assuming 'ret' is >= 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/comedi/comedi_fops.c:1564:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/comedi/comedi_fops.c:1566:7: note: Assuming the condition is false
                   if (insns[i].insn & INSN_MASK_READ) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/comedi_fops.c:1566:3: note: Taking false branch
                   if (insns[i].insn & INSN_MASK_READ) {
                   ^
   drivers/comedi/comedi_fops.c:1575:7: note: Calling 'need_resched'
                   if (need_resched())
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:2223:18: note: Dereference of null pointer
           return unlikely(tif_need_resched());
                           ^
   include/linux/thread_info.h:180:28: note: expanded from macro 'tif_need_resched'
   #define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
                              ^
   include/linux/thread_info.h:141:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_thread_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/net/phy/phy-c45.c:712:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return changed;
           ^
   drivers/net/phy/phy-c45.c:1418:6: note: Assuming field 'eee_enabled' is 0
           if (data->eee_enabled) {
               ^~~~~~~~~~~~~~~~~
   drivers/net/phy/phy-c45.c:1418:2: note: Taking false branch
           if (data->eee_enabled) {
           ^
   drivers/net/phy/phy-c45.c:1425:8: note: Calling 'genphy_c45_write_eee_adv'
           ret = genphy_c45_write_eee_adv(phydev, adv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/phy-c45.c:671:11: note: 'changed' declared without an initial value
           int val, changed;
                    ^~~~~~~
   drivers/net/phy/phy-c45.c:673:6: note: Assuming the condition is false
           if (linkmode_intersects(phydev->supported, PHY_EEE_CAP1_FEATURES)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/phy-c45.c:673:2: note: Taking false branch
           if (linkmode_intersects(phydev->supported, PHY_EEE_CAP1_FEATURES)) {
           ^
   drivers/net/phy/phy-c45.c:696:6: note: Assuming the condition is false
           if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/phy-c45.c:696:2: note: Taking false branch
           if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT,
           ^
   drivers/net/phy/phy-c45.c:712:2: note: Undefined or garbage value returned to caller
           return changed;
           ^      ~~~~~~~
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   include/linux/audit.h:314:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return current->audit_context;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/socket.c:2025:1: note: Calling '__do_sys_connect'
   SYSCALL_DEFINE3(connect, int, fd, struct sockaddr __user *, uservaddr,
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFINE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macro '__SYSCALL_DEFINEx'
                   long ret = __do_sys##name(SYSCALL_PT_ARGS(x, regs,                      \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   net/socket.c:2028:9: note: Calling '__sys_connect'
           return __sys_connect(fd, uservaddr, addrlen);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2013:6: note: Assuming field 'file' is non-null
           if (f.file) {
               ^~~~~~
   net/socket.c:2013:2: note: Taking true branch
           if (f.file) {
           ^
   net/socket.c:2016:9: note: Calling 'move_addr_to_kernel'
                   ret = move_addr_to_kernel(uservaddr, addrlen, &address);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:246:6: note: Assuming 'ulen' is >= 0
           if (ulen < 0 || ulen > sizeof(struct sockaddr_storage))
               ^~~~~~~~
   net/socket.c:246:6: note: Left side of '||' is false
   net/socket.c:246:18: note: Assuming the condition is false
           if (ulen < 0 || ulen > sizeof(struct sockaddr_storage))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:246:2: note: Taking false branch
           if (ulen < 0 || ulen > sizeof(struct sockaddr_storage))
           ^
   net/socket.c:248:6: note: Assuming 'ulen' is not equal to 0
           if (ulen == 0)
               ^~~~~~~~~
   net/socket.c:248:2: note: Taking false branch
           if (ulen == 0)
           ^
   net/socket.c:250:2: note: Taking false branch
           if (copy_from_user(kaddr, uaddr, ulen))
           ^
   net/socket.c:252:9: note: Calling 'audit_sockaddr'
           return audit_sockaddr(ulen, kaddr);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +712 drivers/net/phy/phy-c45.c

ea4efe25ec937a Russell King   2017-12-29  663  
022c3f87f88e2d Oleksij Rempel 2023-02-11  664  /**
022c3f87f88e2d Oleksij Rempel 2023-02-11  665   * genphy_c45_write_eee_adv - write advertised EEE link modes
022c3f87f88e2d Oleksij Rempel 2023-02-11  666   * @phydev: target phy_device struct
022c3f87f88e2d Oleksij Rempel 2023-02-11  667   * @adv: the linkmode advertisement settings
022c3f87f88e2d Oleksij Rempel 2023-02-11  668   */
022c3f87f88e2d Oleksij Rempel 2023-02-11  669  int genphy_c45_write_eee_adv(struct phy_device *phydev, unsigned long *adv)
022c3f87f88e2d Oleksij Rempel 2023-02-11  670  {
022c3f87f88e2d Oleksij Rempel 2023-02-11  671  	int val, changed;
022c3f87f88e2d Oleksij Rempel 2023-02-11  672  
022c3f87f88e2d Oleksij Rempel 2023-02-11  673  	if (linkmode_intersects(phydev->supported, PHY_EEE_CAP1_FEATURES)) {
022c3f87f88e2d Oleksij Rempel 2023-02-11  674  		val = linkmode_to_mii_eee_cap1_t(adv);
022c3f87f88e2d Oleksij Rempel 2023-02-11  675  
022c3f87f88e2d Oleksij Rempel 2023-02-11  676  		/* In eee_broken_modes are stored MDIO_AN_EEE_ADV specific raw
022c3f87f88e2d Oleksij Rempel 2023-02-11  677  		 * register values.
022c3f87f88e2d Oleksij Rempel 2023-02-11  678  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  679  		val &= ~phydev->eee_broken_modes;
022c3f87f88e2d Oleksij Rempel 2023-02-11  680  
022c3f87f88e2d Oleksij Rempel 2023-02-11  681  		/* IEEE 802.3-2018 45.2.7.13 EEE advertisement 1
022c3f87f88e2d Oleksij Rempel 2023-02-11  682  		 * (Register 7.60)
022c3f87f88e2d Oleksij Rempel 2023-02-11  683  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  684  		val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
022c3f87f88e2d Oleksij Rempel 2023-02-11  685  					     MDIO_AN_EEE_ADV,
022c3f87f88e2d Oleksij Rempel 2023-02-11  686  					     MDIO_EEE_100TX | MDIO_EEE_1000T |
022c3f87f88e2d Oleksij Rempel 2023-02-11  687  					     MDIO_EEE_10GT | MDIO_EEE_1000KX |
022c3f87f88e2d Oleksij Rempel 2023-02-11  688  					     MDIO_EEE_10GKX4 | MDIO_EEE_10GKR,
022c3f87f88e2d Oleksij Rempel 2023-02-11  689  					     val);
022c3f87f88e2d Oleksij Rempel 2023-02-11  690  		if (val < 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  691  			return val;
022c3f87f88e2d Oleksij Rempel 2023-02-11  692  		if (val > 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  693  			changed = 1;
022c3f87f88e2d Oleksij Rempel 2023-02-11  694  	}
022c3f87f88e2d Oleksij Rempel 2023-02-11  695  
022c3f87f88e2d Oleksij Rempel 2023-02-11  696  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT,
022c3f87f88e2d Oleksij Rempel 2023-02-11  697  			      phydev->supported_eee)) {
022c3f87f88e2d Oleksij Rempel 2023-02-11  698  		val = linkmode_adv_to_mii_10base_t1_t(adv);
022c3f87f88e2d Oleksij Rempel 2023-02-11  699  		/* IEEE 802.3cg-2019 45.2.7.25 10BASE-T1 AN control register
022c3f87f88e2d Oleksij Rempel 2023-02-11  700  		 * (Register 7.526)
022c3f87f88e2d Oleksij Rempel 2023-02-11  701  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  702  		val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
022c3f87f88e2d Oleksij Rempel 2023-02-11  703  					     MDIO_AN_10BT1_AN_CTRL,
022c3f87f88e2d Oleksij Rempel 2023-02-11  704  					     MDIO_AN_10BT1_AN_CTRL_ADV_EEE_T1L,
022c3f87f88e2d Oleksij Rempel 2023-02-11  705  					     val);
022c3f87f88e2d Oleksij Rempel 2023-02-11  706  		if (val < 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  707  			return val;
022c3f87f88e2d Oleksij Rempel 2023-02-11  708  		if (val > 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  709  			changed = 1;
022c3f87f88e2d Oleksij Rempel 2023-02-11  710  	}
022c3f87f88e2d Oleksij Rempel 2023-02-11  711  
022c3f87f88e2d Oleksij Rempel 2023-02-11 @712  	return changed;
022c3f87f88e2d Oleksij Rempel 2023-02-11  713  }
022c3f87f88e2d Oleksij Rempel 2023-02-11  714  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
