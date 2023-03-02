Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256355381
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Mar 2023 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677756992; x=1709292992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRy7t1Yh1PPbrhDIndk0by2qdGa0Qr6iSdbEEsAENOg=;
  b=lh7uuj+MYgYZ8AoOlTEX/nlQKhkcp74+8Z4r9AsFyA38jYBQ+jIhrIIo
   djYXKomOcyDvf5iXt9a+nezsUCkoGsTI6vhGGuqEZz301IWkJH/gRC+qq
   /gJbLwHLQDLlo7lLtmGDyXgQAcCjr/qAbG6bGNUMtxvQrDYtPj5f7noHc
   YGyMpeWlPJrUgujKkftfX+RNAHEj0T3y1DcFEbKdmIeHs2pK/ong3aLP3
   8iKPRnR2rHglIqTOdwm98weVcWixSz9WcCvfajOAThICRa8oPyQ7YvEZ1
   t0KM7Kj7GIngm9Geejzg+zfk4PJpHnv0yIRFrREEXaD/pZyWmUxGNogEq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399484823"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="399484823"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 03:35:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="784779204"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="784779204"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2023 03:35:12 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXhDL-0000RI-2b;
	Thu, 02 Mar 2023 11:35:11 +0000
Date: Thu, 2 Mar 2023 19:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/common/saa7146/saa7146_hlp.c:122:2: warning: Value
 stored to 'xacm' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303021949.gIsbH0Ea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/common/saa7146/saa7146_hlp.c:122:2: warning: Value stored to 'xacm' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ee3f96b164688dae21e2466a57f2e806b64e8a37
commit: 39d08ab979b7995d22dd6b3ce74d3179f02847a1 media: Revert "media: saa7146: deprecate hexium_gemini/orion, mxb and ttpci"
date:   3 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230226 (https://download.01.org/0day-ci/archive/20230302/202303021949.gIsbH0Ea-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=39d08ab979b7995d22dd6b3ce74d3179f02847a1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 39d08ab979b7995d22dd6b3ce74d3179f02847a1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303021949.gIsbH0Ea-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:390:12: note: expanded from macro '__printk_index_emit'
                                   .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
                                          ^
   drivers/mtd/ubi/eba.c:1583:5: note: '?' condition is true
                                   ubi_assert(0);
                                   ^
   drivers/mtd/ubi/debug.h:19:3: note: expanded from macro 'ubi_assert'
                   pr_crit("UBI assert failed in %s at %u (pid %d)\n",          \
                   ^
   include/linux/printk.h:490:2: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:394:14: note: expanded from macro '__printk_index_emit'
                                   .level = __builtin_constant_p(_level) ? (_level) : NULL, \
                                            ^
   drivers/mtd/ubi/eba.c:1583:5: note: Loop condition is false.  Exiting loop
                                   ubi_assert(0);
                                   ^
   drivers/mtd/ubi/debug.h:19:3: note: expanded from macro 'ubi_assert'
                   pr_crit("UBI assert failed in %s at %u (pid %d)\n",          \
                   ^
   include/linux/printk.h:490:2: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:380:2: note: expanded from macro '__printk_index_emit'
           do {                                                            \
           ^
   drivers/mtd/ubi/eba.c:1583:5: note: Dereference of null pointer
                                   ubi_assert(0);
                                   ^
   drivers/mtd/ubi/debug.h:20:30: note: expanded from macro 'ubi_assert'
                          __func__, __LINE__, current->pid);                    \
                                              ^~~~~~~
   include/linux/printk.h:490:34: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/regulator/palmas-regulator.c:1598:36: warning: Value stored to 'pdata' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct palmas_pmic_platform_data *pdata = dev_get_platdata(&pdev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/palmas-regulator.c:1598:36: note: Value stored to 'pdata' during its initialization is never read
           struct palmas_pmic_platform_data *pdata = dev_get_platdata(&pdev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
>> drivers/media/common/saa7146/saa7146_hlp.c:122:2: warning: Value stored to 'xacm' is never read [clang-analyzer-deadcode.DeadStores]
           xacm = 0;
           ^      ~
   drivers/media/common/saa7146/saa7146_hlp.c:122:2: note: Value stored to 'xacm' is never read
           xacm = 0;
           ^      ~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   sound/soc/fsl/fsl_micfil.c:694:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_micfil.c:694:2: note: Value stored to 'ret' is never read
           ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/char/pcmcia/cm4000_cs.c:1570:4: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                           rc = 0;
                           ^    ~
   drivers/char/pcmcia/cm4000_cs.c:1570:4: note: Value stored to 'rc' is never read
                           rc = 0;
                           ^    ~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (5 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/firewire/dice/dice-pcm.c:444:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pcm->name, dice->card->shortname);
                   ^~~~~~
   sound/firewire/dice/dice-pcm.c:444:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(pcm->name, dice->card->shortname);
                   ^~~~~~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/media/cec/core/cec-adap.c:410:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED, 0);
                   ^
   drivers/media/cec/core/cec-adap.c:1727:6: note: Assuming field 'unregistered' is false
           if (adap->devnode.unregistered)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1727:2: note: Taking false branch
           if (adap->devnode.unregistered)
           ^
   drivers/media/cec/core/cec-adap.c:1730:6: note: Assuming 'log_addrs' is null
           if (!log_addrs || log_addrs->num_log_addrs == 0) {
               ^~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1730:17: note: Left side of '||' is true
           if (!log_addrs || log_addrs->num_log_addrs == 0) {
                          ^
   drivers/media/cec/core/cec-adap.c:1731:7: note: Assuming field 'num_log_addrs' is not equal to 0
                   if (!adap->log_addrs.num_log_addrs)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1731:3: note: Taking false branch
                   if (!adap->log_addrs.num_log_addrs)
                   ^
   drivers/media/cec/core/cec-adap.c:1733:7: note: Assuming field 'is_configuring' is false
                   if (adap->is_configuring || adap->is_configured)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1733:7: note: Left side of '||' is false
   drivers/media/cec/core/cec-adap.c:1733:31: note: Assuming field 'is_configured' is true
                   if (adap->is_configuring || adap->is_configured)
                                               ^~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1733:3: note: Taking true branch
                   if (adap->is_configuring || adap->is_configured)
                   ^
   drivers/media/cec/core/cec-adap.c:1734:4: note: Calling 'cec_adap_unconfigure'
                           cec_adap_unconfigure(adap);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1340:6: note: Assuming field 'needs_hpd' is true
           if (!adap->needs_hpd || adap->phys_addr != CEC_PHYS_ADDR_INVALID)
               ^~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1340:6: note: Left side of '||' is false
--
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/core/sock.c:2966:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/core/sock.c:2966:2: note: Dereference of null pointer
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1203:14: note: expanded from macro 'DEFINE_WAIT_FUNC'
                   .private        = current,                                      \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/media/dvb-frontends/stv090x.c:2289:23: warning: The result of the '/' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
           steps_max = (car_max / inc) + 1; /* min steps = 3 */
                                ^
   drivers/media/dvb-frontends/stv090x.c:2405:2: note: Calling 'stv090x_get_loop_params'
           stv090x_get_loop_params(state, &inc, &timeout_step, &steps_max);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2251:6: note: Assuming 'car_max' is <= 16384
           if (car_max > 0x4000)
               ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2251:2: note: Taking false branch
           if (car_max > 0x4000)
           ^
   drivers/media/dvb-frontends/stv090x.c:2260:2: note: Control jumps to 'case STV090x_SEARCH_DVBS2:'  at line 2267
           switch (state->search_mode) {
           ^
   drivers/media/dvb-frontends/stv090x.c:2270:3: note:  Execution continues on line 2278
                   break;
                   ^
   drivers/media/dvb-frontends/stv090x.c:2279:7: note: Assuming 'inc' is <= 'car_max'
           if ((inc > car_max) || (inc < 0))
                ^~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2279:6: note: Left side of '||' is false
           if ((inc > car_max) || (inc < 0))
               ^
   drivers/media/dvb-frontends/stv090x.c:2279:26: note: Assuming 'inc' is >= 0
           if ((inc > car_max) || (inc < 0))
                                   ^~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2279:2: note: Taking false branch
           if ((inc > car_max) || (inc < 0))
           ^
   drivers/media/dvb-frontends/stv090x.c:2283:6: note: Assuming 'srate' is <= 0
           if (srate > 0)
               ^~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2283:2: note: Taking false branch
           if (srate > 0)
           ^
   drivers/media/dvb-frontends/stv090x.c:2286:7: note: 'timeout' is > 100
           if ((timeout > 100) || (timeout < 0))
                ^~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2286:22: note: Left side of '||' is true
           if ((timeout > 100) || (timeout < 0))
                               ^
   drivers/media/dvb-frontends/stv090x.c:2289:23: note: The result of the '/' expression is undefined
           steps_max = (car_max / inc) + 1; /* min steps = 3 */
                        ~~~~~~~~^~~~~
   drivers/media/dvb-frontends/stv090x.c:2960:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg = STV090x_READ_DEMOD(state, TMGOBS);
           ^
   drivers/media/dvb-frontends/stv090x.c:2960:2: note: Value stored to 'reg' is never read
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/media/common/saa7146/saa7146_vbi.c:16:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
   drivers/media/common/saa7146/saa7146_vbi.c:16:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name = __WAITQUEUE_INITIALIZER(name, tsk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITIALIZER'
           .private        = tsk,                                                  \
                             ^~~
>> drivers/media/common/saa7146/saa7146_vbi.c:414:13: warning: Although the value stored to 'ret' is used in the enclosing expression, the value is never actually read from 'ret' [clang-analyzer-deadcode.DeadStores]
                   if (0 != (ret = vbi_workaround(dev))) {
                             ^     ~~~~~~~~~~~~~~~~~~~
   drivers/media/common/saa7146/saa7146_vbi.c:414:13: note: Although the value stored to 'ret' is used in the enclosing expression, the value is never actually read from 'ret'
                   if (0 != (ret = vbi_workaround(dev))) {
                             ^     ~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   drivers/media/common/videobuf2/videobuf2-core.c:1950:10: warning: Access to field 'state' results in a dereference of a null pointer (loaded from variable 'vb') [clang-analyzer-core.NullDereference]
           switch (vb->state) {
                   ^~
   drivers/media/common/videobuf2/videobuf2-core.c:1943:2: note: 'vb' initialized to a null pointer value
           struct vb2_buffer *vb = NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1946:8: note: Calling '__vb2_get_done_vb'
           ret = __vb2_get_done_vb(q, &vb, pb, nonblocking);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1888:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/media/common/videobuf2/videobuf2-core.c:1888:2: note: Taking true branch
           if (ret)
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:1889:3: note: Returning without writing to '*vb'
                   return ret;
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:1946:8: note: Returning from '__vb2_get_done_vb'
           ret = __vb2_get_done_vb(q, &vb, pb, nonblocking);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1947:6: note: Assuming 'ret' is >= 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1947:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:1950:10: note: Access to field 'state' results in a dereference of a null pointer (loaded from variable 'vb')
           switch (vb->state) {
                   ^~
   drivers/media/common/videobuf2/videobuf2-core.c:3004:3: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:219:3: note: expanded from macro 'set_current_state'
                   debug_normal_state_change((state_value));               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:147:3: note: expanded from macro 'debug_normal_state_change'
                   current->task_state_change = _THIS_IP_;                 \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/media/common/videobuf2/videobuf2-core.c:2960:6: note: Assuming field 'is_output' is not equal to 0
           if (q->is_output) {
               ^~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:2960:2: note: Taking true branch
           if (q->is_output) {
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:2967:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:2973:7: note: Assuming 'prequeue' is not equal to 0
                   if (prequeue) {
                       ^~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:2973:3: note: Taking true branch
                   if (prequeue) {
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:2985:7: note: 'ret' is 0
                   if (ret || threadio->stop)
                       ^~~
   drivers/media/common/videobuf2/videobuf2-core.c:2985:7: note: Left side of '||' is false
   drivers/media/common/videobuf2/videobuf2-core.c:2985:14: note: Assuming field 'stop' is true
                   if (ret || threadio->stop)
                              ^~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:2985:3: note: Taking true branch
                   if (ret || threadio->stop)
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:2986:4: note:  Execution continues on line 3003
                           break;
                           ^
   drivers/media/common/videobuf2/videobuf2-core.c:3003:9: note: Assuming the condition is true
           while (!kthread_should_stop()) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:3003:2: note: Loop condition is true.  Entering loop body
           while (!kthread_should_stop()) {
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:3004:3: note: Taking false branch
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:219:3: note: expanded from macro 'set_current_state'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:146:3: note: expanded from macro 'debug_normal_state_change'
                   WARN_ON_ONCE(is_special_task_state(state_value));       \
                   ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:3004:3: note: Dereference of null pointer

vim +/xacm +122 drivers/media/common/saa7146/saa7146_hlp.c

^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   65  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   66  /* calculate horizontal scale registers */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   67  static int calculate_h_scale_registers(struct saa7146_dev *dev,
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   68  	int in_x, int out_x, int flip_lr,
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   69  	u32* hps_ctrl, u32* hps_v_gain, u32* hps_h_prescale, u32* hps_h_scale)
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   70  {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   71  	/* horizontal prescaler */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   72  	u32 dcgx = 0, xpsc = 0, xacm = 0, cxy = 0, cxuv = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   73  	/* horizontal scaler */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   74  	u32 xim = 0, xp = 0, xsci =0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   75  	/* vertical scale & gain */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   76  	u32 pfuv = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   77  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   78  	/* helper variables */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   79  	u32 h_atten = 0, i = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   80  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   81  	if ( 0 == out_x ) {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   82  		return -EINVAL;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   83  	}
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   84  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   85  	/* mask out vanity-bit */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   86  	*hps_ctrl &= ~MASK_29;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   87  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   88  	/* calculate prescale-(xspc)-value:	[n   .. 1/2) : 1
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   89  						[1/2 .. 1/3) : 2
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   90  						[1/3 .. 1/4) : 3
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   91  						...		*/
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   92  	if (in_x > out_x) {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   93  		xpsc = in_x / out_x;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   94  	}
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   95  	else {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   96  		/* zooming */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   97  		xpsc = 1;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   98  	}
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16   99  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  100  	/* if flip_lr-bit is set, number of pixels after
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  101  	   horizontal prescaling must be < 384 */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  102  	if ( 0 != flip_lr ) {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  103  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  104  		/* set vanity bit */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  105  		*hps_ctrl |= MASK_29;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  106  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  107  		while (in_x / xpsc >= 384 )
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  108  			xpsc++;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  109  	}
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  110  	/* if zooming is wanted, number of pixels after
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  111  	   horizontal prescaling must be < 768 */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  112  	else {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  113  		while ( in_x / xpsc >= 768 )
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  114  			xpsc++;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  115  	}
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  116  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  117  	/* maximum prescale is 64 (p.69) */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  118  	if ( xpsc > 64 )
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  119  		xpsc = 64;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  120  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  121  	/* keep xacm clear*/
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16 @122  	xacm = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  123  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  124  	/* set horizontal filter parameters (CXY = CXUV) */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  125  	cxy = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].hps_coeff;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  126  	cxuv = cxy;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  127  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  128  	/* calculate and set horizontal fine scale (xsci) */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  129  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  130  	/* bypass the horizontal scaler ? */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  131  	if ( (in_x == out_x) && ( 1 == xpsc ) )
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  132  		xsci = 0x400;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  133  	else
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  134  		xsci = ( (1024 * in_x) / (out_x * xpsc) ) + xpsc;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  135  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  136  	/* set start phase for horizontal fine scale (xp) to 0 */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  137  	xp = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  138  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  139  	/* set xim, if we bypass the horizontal scaler */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  140  	if ( 0x400 == xsci )
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  141  		xim = 1;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  142  	else
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  143  		xim = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  144  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  145  	/* if the prescaler is bypassed, enable horizontal
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  146  	   accumulation mode (xacm) and clear dcgx */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  147  	if( 1 == xpsc ) {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  148  		xacm = 1;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  149  		dcgx = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  150  	} else {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  151  		xacm = 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  152  		/* get best match in the table of attenuations
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  153  		   for horizontal scaling */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  154  		h_atten = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].weight_sum;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  155  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  156  		for (i = 0; h_attenuation[i] != 0; i++) {
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  157  			if (h_attenuation[i] >= h_atten)
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  158  				break;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  159  		}
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  160  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  161  		dcgx = i;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  162  	}
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  163  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  164  	/* the horizontal scaling increment controls the UV filter
9aaeded72f9232 drivers/media/common/saa7146_hlp.c Adrian Bunk    2006-06-30  165  	   to reduce the bandwidth to improve the display quality,
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  166  	   so set it ... */
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  167  	if ( xsci == 0x400)
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  168  		pfuv = 0x00;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  169  	else if ( xsci < 0x600)
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  170  		pfuv = 0x01;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  171  	else if ( xsci < 0x680)
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  172  		pfuv = 0x11;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  173  	else if ( xsci < 0x700)
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  174  		pfuv = 0x22;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  175  	else
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  176  		pfuv = 0x33;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  177  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  178  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  179  	*hps_v_gain  &= MASK_W0|MASK_B2;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  180  	*hps_v_gain  |= (pfuv << 24);
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  181  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  182  	*hps_h_scale	&= ~(MASK_W1 | 0xf000);
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  183  	*hps_h_scale	|= (xim << 31) | (xp << 24) | (xsci << 12);
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  184  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  185  	*hps_h_prescale	|= (dcgx << 27) | ((xpsc-1) << 18) | (xacm << 17) | (cxy << 8) | (cxuv << 0);
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  186  
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  187  	return 0;
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  188  }
^1da177e4c3f41 drivers/media/common/saa7146_hlp.c Linus Torvalds 2005-04-16  189  

:::::: The code at line 122 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
