Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9EE6ABD
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679874538; x=1711410538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7peHcGrWB6YIeI8DoskSiClc1VeLQK0c5CPRuOuq6n0=;
  b=eLTCZ9DRl/3q7rpY6iZ6q0Fujz18ahlEBzQGDbAcKi1tB7wL8VM/YdeO
   6HjaEb9bg+sJPGJQHepudb8jJlzY+vr+he0+HpjAGubodIIjNwMWK2vrA
   iRFHbcl2JVo0LSFGoSdGJOXdupsFs1kf0LqbXbx5oIAqjFPBhsRaavpCO
   ryiL7fby9EzcVSx/iHLNKCDsk4tsY+FvpVUlyTeQeAoGk1U6hNmomDgf5
   iN3K2baJ+vzpBwZGM20Chahg4X7h+ZW+drf+9vCZezABEwJH+0UT+kymP
   enxLJFF/l1D1f4ZgRvae4fkGdm7/CJ2a0gOHMPnBZXzvbVHehQ961yIGK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="324029384"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="324029384"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 16:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="794109309"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="794109309"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2023 16:48:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pga6Z-000HPj-1n;
	Sun, 26 Mar 2023 23:48:55 +0000
Date: Mon, 27 Mar 2023 07:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:rk3588 9/27] drivers/pinctrl/pinctrl-rk805.c:415:6:
 warning: Assigned value is garbage or undefined
 [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202303270742.Wal21p6i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/pinctrl-rk805.c:415:6: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: shengfei Xu <xsf@rock-chips.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   02c4e267f34f8166d3fb2fb681b865a9b66e2dfb
commit: 22ca4cdaaf4e07661723b2aab606a3012d830b29 [9/27] pinctrl: rk805: add rk806 pinctrl support
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20230322 (https://download.01.org/0day-ci/archive/20230327/202303270742.Wal21p6i-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/commit/?id=22ca4cdaaf4e07661723b2aab606a3012d830b29
        git remote add sre-misc https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git
        git fetch --no-tags sre-misc rk3588
        git checkout 22ca4cdaaf4e07661723b2aab606a3012d830b29
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303270742.Wal21p6i-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/tty/serial/8250/8250_mid.c:158:8: note: '?' condition is true
                   else if (err == 0)
                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/tty/serial/8250/8250_mid.c:158:8: note: Taking true branch
                   else if (err == 0)
                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/tty/serial/8250/8250_mid.c:159:11: note: 3rd function call argument is an uninitialized value
                           ret |= hsu_dma_do_irq(&mid->dma_chip, 0, status);
                                  ^                                 ~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/tty/serial/8250/8250_mid.c:220:10: note: Assuming 'fuart' is 0
           fuart = fuart ? fuart : 9600 * 16;
                   ^~~~~
   drivers/tty/serial/8250/8250_mid.c:220:10: note: '?' condition is false
   drivers/tty/serial/8250/8250_mid.c:222:6: note: Assuming 'fuart' is <= field 'freq'
           if (mid->board->freq < fuart) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/tty/serial/8250/8250_mid.c:222:2: note: '?' condition is false
           if (mid->board->freq < fuart) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/tty/serial/8250/8250_mid.c:222:25: note: 'fuart' is <= field 'freq'
           if (mid->board->freq < fuart) {
                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/tty/serial/8250/8250_mid.c:222:2: note: '?' condition is false
           if (mid->board->freq < fuart) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/tty/serial/8250/8250_mid.c:222:2: note: Taking false branch
           if (mid->board->freq < fuart) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/tty/serial/8250/8250_mid.c:231:12: note: '?' condition is false
                   fuart *= rounddown_pow_of_two(mid->board->freq / fuart);
                            ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/tty/serial/8250/8250_mid.c:231:12: note: Calling '__rounddown_pow_of_two'
                   fuart *= rounddown_pow_of_two(mid->board->freq / fuart);
                            ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/pinctrl/pinctrl-rk805.c:415:6: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           mux <<= ffs(pci->pin_cfg[offset].fun_msk) - 1;
               ^
   drivers/pinctrl/pinctrl-rk805.c:443:2: note: Control jumps to 'case RK806_ID:'  at line 446
           switch (pci->rk808->variant) {
           ^
   drivers/pinctrl/pinctrl-rk805.c:447:10: note: Calling '_rk805_pinctrl_set_mux'
                   return _rk805_pinctrl_set_mux(pctldev, offset, RK806_PINMUX_FUN5);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-rk805.c:412:6: note: Assuming field 'fun_msk' is not equal to 0
           if (!pci->pin_cfg[offset].fun_msk)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/pinctrl/pinctrl-rk805.c:412:2: note: '?' condition is false
           if (!pci->pin_cfg[offset].fun_msk)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/pinctrl/pinctrl-rk805.c:412:28: note: Field 'fun_msk' is not equal to 0
           if (!pci->pin_cfg[offset].fun_msk)
                                     ^
   drivers/pinctrl/pinctrl-rk805.c:412:2: note: '?' condition is false
           if (!pci->pin_cfg[offset].fun_msk)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/pinctrl/pinctrl-rk805.c:412:2: note: Taking false branch
           if (!pci->pin_cfg[offset].fun_msk)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pinctrl/pinctrl-rk805.c:415:6: note: Assigned value is garbage or undefined
           mux <<= ffs(pci->pin_cfg[offset].fun_msk) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   block/bfq-wf2q.c:274:7: warning: Access to field 'my_sched_data' results in a dereference of a null pointer (loaded from variable 'entity') [clang-analyzer-core.NullDereference]
           if (!entity->my_sched_data)
                ^
   block/bfq-wf2q.c:1456:2: note: 'entity' initialized to a null pointer value
           struct bfq_entity *entity = NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1460:6: note: Assuming the condition is false
           if (bfq_tot_busy_queues(bfqd) == 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   block/bfq-wf2q.c:1460:2: note: '?' condition is false
           if (bfq_tot_busy_queues(bfqd) == 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   block/bfq-wf2q.c:1460:2: note: '?' condition is false
           if (bfq_tot_busy_queues(bfqd) == 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   block/bfq-wf2q.c:1460:2: note: Taking false branch
           if (bfq_tot_busy_queues(bfqd) == 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   block/bfq-wf2q.c:1469:2: note: Loop condition is false. Execution continues on line 1530
           for (; sd ; sd = entity->my_sched_data) {
           ^
   block/bfq-wf2q.c:1530:28: note: Passing null pointer value via 1st parameter 'entity'
           bfqq = bfq_entity_to_bfqq(entity);

vim +415 drivers/pinctrl/pinctrl-rk805.c

ea479996c79bbd Joseph Chen       2017-08-21  404  
ea479996c79bbd Joseph Chen       2017-08-21  405  static int _rk805_pinctrl_set_mux(struct pinctrl_dev *pctldev,
ea479996c79bbd Joseph Chen       2017-08-21  406  				  unsigned int offset,
ea479996c79bbd Joseph Chen       2017-08-21  407  				  int mux)
ea479996c79bbd Joseph Chen       2017-08-21  408  {
ea479996c79bbd Joseph Chen       2017-08-21  409  	struct rk805_pctrl_info *pci = pinctrl_dev_get_drvdata(pctldev);
ea479996c79bbd Joseph Chen       2017-08-21  410  	int ret;
ea479996c79bbd Joseph Chen       2017-08-21  411  
ea479996c79bbd Joseph Chen       2017-08-21  412  	if (!pci->pin_cfg[offset].fun_msk)
ea479996c79bbd Joseph Chen       2017-08-21  413  		return 0;
ea479996c79bbd Joseph Chen       2017-08-21  414  
22ca4cdaaf4e07 Sebastian Reichel 2022-07-04 @415  	mux <<= ffs(pci->pin_cfg[offset].fun_msk) - 1;
ea479996c79bbd Joseph Chen       2017-08-21  416  	ret = regmap_update_bits(pci->rk808->regmap,
22ca4cdaaf4e07 Sebastian Reichel 2022-07-04  417  				 pci->pin_cfg[offset].fun_reg,
22ca4cdaaf4e07 Sebastian Reichel 2022-07-04  418  				 pci->pin_cfg[offset].fun_msk, mux);
22ca4cdaaf4e07 Sebastian Reichel 2022-07-04  419  
22ca4cdaaf4e07 Sebastian Reichel 2022-07-04  420  	if (ret)
22ca4cdaaf4e07 Sebastian Reichel 2022-07-04  421  		dev_err(pci->dev, "set gpio%d func%d failed\n", offset, mux);
ea479996c79bbd Joseph Chen       2017-08-21  422  
ea479996c79bbd Joseph Chen       2017-08-21  423  	return 0;
ea479996c79bbd Joseph Chen       2017-08-21  424  }
ea479996c79bbd Joseph Chen       2017-08-21  425  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
