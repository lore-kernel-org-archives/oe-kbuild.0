Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9B11848
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 02:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677032817; x=1708568817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dw8+P80bcFGWx78bESdErLkVVntgCjGiSD7v15tRs2A=;
  b=MM1Bmtm+NcpzBTrWiUdp2KKNvwo+kkgRTMs0bRjRIeoScBzCHuOu+W/M
   6mjqZsgd1xOdoHdAgmPMq9EWZzVb07KzGLxfxCdI8afDmEgEoZQcktMbO
   Zs/tZPxpKRodWcIg725ji+hTPdjDDMU240A2BaRhcq1O9/gMHwCIWw2Vy
   Mkug7/QpTiPdjkSWzW7u0BNflbQ+i2gUuN8aHKq3lw+RfjlGMnvTz+Yow
   ZzUro7M6AcUyVMYpdhQ/EvXiud3k6OQ5y8KzkQT5JvIfro4k0tQ4oNA/L
   Lbn+UcSJBrhVmxaM2YgQuMLuqqcPq7kJIRneVTDtg3+S8T3xoH6e7YeIk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313188733"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="313188733"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 18:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="649396772"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="649396772"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 18:26:55 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUeqN-0000Ur-0y;
	Wed, 22 Feb 2023 02:26:55 +0000
Date: Wed, 22 Feb 2023 10:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/5] drivers: mmc: sdhci-cadence: SD6 controller
 support
Message-ID: <202302221028.d3j2yIaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mmc/host/sdhci-cadence.c:517:2: warning: Value stored to 'clk_wr_delay' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230123192735.21136-3-pmalgujar@marvell.com>
References: <20230123192735.21136-3-pmalgujar@marvell.com>
TO: Piyush Malgujar <pmalgujar@marvell.com>
TO: linux-mmc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: adrian.hunter@intel.com
TO: ulf.hansson@linaro.org
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: yamada.masahiro@socionext.com
TO: devicetree@vger.kernel.org
CC: jannadurai@marvell.com
CC: cchavva@marvell.com
CC: Dhananjay Kangude <dkangude@cadence.com>
CC: Piyush Malgujar <pmalgujar@marvell.com>

Hi Piyush,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on v6.2 next-20230221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Piyush-Malgujar/drivers-mmc-sdhci-cadence-Reformat-the-code/20230124-033018
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230123192735.21136-3-pmalgujar%40marvell.com
patch subject: [PATCH v2 2/5] drivers: mmc: sdhci-cadence: SD6 controller support
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-c004-20230219 (https://download.01.org/0day-ci/archive/20230222/202302221028.d3j2yIaZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f5412b4632762b21dc57b4ad59e41880a0ffad53
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Piyush-Malgujar/drivers-mmc-sdhci-cadence-Reformat-the-code/20230124-033018
        git checkout f5412b4632762b21dc57b4ad59e41880a0ffad53
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302221028.d3j2yIaZ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fcntl.c:291:2: note: 'h' declared without an initial value
           u64 h;
           ^~~~~
   fs/fcntl.c:293:2: note: Control jumps to 'case 1036:'  at line 299
           switch (cmd) {
           ^
   fs/fcntl.c:300:7: note: Calling 'copy_from_user'
                   if (copy_from_user(&h, argp, sizeof(h)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   include/asm-generic/access_ok.h:45:31: note: expanded from macro 'access_ok'
   #define access_ok(addr, size) likely(__access_ok(addr, size))
                                 ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   include/linux/uaccess.h:125:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   include/asm-generic/access_ok.h:45:31: note: expanded from macro 'access_ok'
   #define access_ok(addr, size) likely(__access_ok(addr, size))
                                 ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                       ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to '*to'
           return n;
           ^
   fs/fcntl.c:300:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(&h, argp, sizeof(h)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fcntl.c:300:3: note: Taking false branch
                   if (copy_from_user(&h, argp, sizeof(h)))
                   ^
   fs/fcntl.c:302:8: note: Assigned value is garbage or undefined
                   hint = (enum rw_hint) h;
                        ^ ~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/mmc/host/sdhci-cadence.c:517:2: warning: Value stored to 'clk_wr_delay' is never read [clang-analyzer-deadcode.DeadStores]
           clk_wr_delay = 0;
           ^              ~
   drivers/mmc/host/sdhci-cadence.c:517:2: note: Value stored to 'clk_wr_delay' is never read
           clk_wr_delay = 0;
           ^              ~
>> drivers/mmc/host/sdhci-cadence.c:996:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg = 0x0;
           ^     ~~~
   drivers/mmc/host/sdhci-cadence.c:996:2: note: Value stored to 'reg' is never read
           reg = 0x0;
           ^     ~~~
   drivers/mmc/host/sdhci-cadence.c:1065:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg = 0x0;
           ^     ~~~
   drivers/mmc/host/sdhci-cadence.c:1065:2: note: Value stored to 'reg' is never read
           reg = 0x0;
           ^     ~~~
   drivers/mmc/host/sdhci-cadence.c:1070:3: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
                   reg = 0x0;
                   ^     ~~~
   drivers/mmc/host/sdhci-cadence.c:1070:3: note: Value stored to 'reg' is never read
                   reg = 0x0;
                   ^     ~~~
   drivers/mmc/host/sdhci-cadence.c:1093:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg = 0x0;
           ^     ~~~
   drivers/mmc/host/sdhci-cadence.c:1093:2: note: Value stored to 'reg' is never read
           reg = 0x0;
           ^     ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/mmc/host/sdhci-of-aspeed.c:283:2: warning: 2nd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           aspeed_sdhci_configure_phase(host, bus);
           ^                                  ~~~
   drivers/mmc/host/sdhci-of-aspeed.c:239:24: note: 'bus' declared without an initial value
           unsigned long parent, bus;
                                 ^~~
   drivers/mmc/host/sdhci-of-aspeed.c:251:6: note: Assuming 'clock' is not equal to 0
           if (clock == 0)
               ^~~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:251:2: note: Taking false branch
           if (clock == 0)
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:254:14: note: Assuming 'clock' is <= field 'max_clk'
           if (WARN_ON(clock > host->max_clk))
                       ^
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:254:2: note: Taking false branch
           if (WARN_ON(clock > host->max_clk))
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:273:42: note: Assuming 'div' is >= 256
           for (div = sdhci->pdata->clk_div_start; div < 256; div *= 2) {
                                                   ^~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c:273:2: note: Loop condition is false. Execution continues on line 279
           for (div = sdhci->pdata->clk_div_start; div < 256; div *= 2) {
           ^
   drivers/mmc/host/sdhci-of-aspeed.c:283:2: note: 2nd function call argument is an uninitialized value
           aspeed_sdhci_configure_phase(host, bus);
           ^                                  ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mmc/host/dw_mmc.c:1206:24: warning: Access to field 'host' results in a dereference of a null pointer (loaded from variable 'slot') [clang-analyzer-core.NullDereference]
           struct dw_mci *host = slot->host;
                                 ^
   drivers/mmc/host/dw_mmc.c:3536:6: note: Assuming field 'slot' is null
           if (host->slot &&
               ^~~~~~~~~~
   drivers/mmc/host/dw_mmc.c:3536:17: note: Left side of '&&' is false
           if (host->slot &&
                          ^
   drivers/mmc/host/dw_mmc.c:3544:8: note: Calling 'clk_prepare_enable'
           ret = clk_prepare_enable(host->ciu_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:1073:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:1073:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:1076:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:1076:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:1079:2: note: Returning zero (loaded from 'ret'), which participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/mmc/host/dw_mmc.c:3544:8: note: Returning from 'clk_prepare_enable'
           ret = clk_prepare_enable(host->ciu_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/dw_mmc.c:3545:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mmc/host/dw_mmc.c:3545:2: note: Taking false branch
           if (ret)
           ^
   drivers/mmc/host/dw_mmc.c:3548:7: note: Calling 'dw_mci_ctrl_reset'
           if (!dw_mci_ctrl_reset(host, SDMMC_CTRL_ALL_RESET_FLAGS)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/dw_mmc.c:201:6: note: Left side of '&&' is false
           if (readl_poll_timeout_atomic(host->regs + SDMMC_CTRL, ctrl,

vim +/clk_wr_delay +517 drivers/mmc/host/sdhci-cadence.c

f5412b4632762b2 Dhananjay Kangude 2023-01-23  498  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  499  static void sdhci_cdns_sd6_phy_calc_out(struct sdhci_cdns_sd6_phy *phy,
f5412b4632762b2 Dhananjay Kangude 2023-01-23  500  					bool cmd_not_dat)
f5412b4632762b2 Dhananjay Kangude 2023-01-23  501  {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  502  	u32 wr0_dly = 0, wr1_dly = 0, output_min, output_max, phy_o_delay,
f5412b4632762b2 Dhananjay Kangude 2023-01-23  503  	    clk_wr_delay = 0, wr0_sdclk_dly = 0, wr1_sdclk_dly = 0;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  504  	bool data_ddr = phy->ddr && !cmd_not_dat;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  505  	int t;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  506  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  507  	if (cmd_not_dat) {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  508  		output_min = phy->t.t_cmd_output_min;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  509  		output_max = phy->t.t_cmd_output_max;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  510  		phy_o_delay = phy->d.phy_cmd_o_delay;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  511  	} else {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  512  		output_min = phy->t.t_dat_output_min;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  513  		output_max = phy->t.t_dat_output_max;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  514  		phy_o_delay = phy->d.phy_dat_o_delay;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  515  	}
f5412b4632762b2 Dhananjay Kangude 2023-01-23  516  
f5412b4632762b2 Dhananjay Kangude 2023-01-23 @517  	clk_wr_delay = 0;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  518  	if (data_ddr) {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  519  		wr0_sdclk_dly = 1;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  520  		wr1_sdclk_dly = 1;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  521  	}
f5412b4632762b2 Dhananjay Kangude 2023-01-23  522  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  523  	t = phy_o_delay - phy->d.phy_sdclk_delay - output_min;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  524  	if (t < 0 && phy->settings.sdhc_extended_wr_mode == 1) {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  525  		u32 n_half_cycle = DIV_ROUND_UP(-t * 2, phy->t_sdmclk);
f5412b4632762b2 Dhananjay Kangude 2023-01-23  526  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  527  		wr0_dly = (n_half_cycle + 1) / 2;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  528  		if (data_ddr)
f5412b4632762b2 Dhananjay Kangude 2023-01-23  529  			wr1_dly = (n_half_cycle + 1) / 2;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  530  		else
f5412b4632762b2 Dhananjay Kangude 2023-01-23  531  			wr1_dly = (n_half_cycle + 1) % 2 + wr0_dly - 1;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  532  	}
f5412b4632762b2 Dhananjay Kangude 2023-01-23  533  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  534  	if (phy->settings.sdhc_extended_wr_mode == 0) {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  535  		u32 out_hold, out_setup, out_hold_margin;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  536  		u32 n;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  537  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  538  		if (!data_ddr)
f5412b4632762b2 Dhananjay Kangude 2023-01-23  539  			wr0_dly = 1;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  540  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  541  		out_setup = output_max;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  542  		out_hold = output_min;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  543  		out_hold_margin = DIV_ROUND_UP(out_setup - out_hold, 4);
f5412b4632762b2 Dhananjay Kangude 2023-01-23  544  		out_hold += out_hold_margin;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  545  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  546  		if (phy->settings.cp_dll_bypass_mode == 0)
f5412b4632762b2 Dhananjay Kangude 2023-01-23  547  			n = DIV_ROUND_UP(256 * out_hold, phy->vars.t_sdmclk_calc);
f5412b4632762b2 Dhananjay Kangude 2023-01-23  548  		else
f5412b4632762b2 Dhananjay Kangude 2023-01-23  549  			n = DIV_ROUND_UP(out_hold, phy->d.delay_element) - 1;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  550  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  551  		if (n <= phy->vars.dll_max_value)
f5412b4632762b2 Dhananjay Kangude 2023-01-23  552  			clk_wr_delay = n;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  553  		else
f5412b4632762b2 Dhananjay Kangude 2023-01-23  554  			clk_wr_delay = 255;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  555  	} else {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  556  		/*  sdhc_extended_wr_mode = 1 - PHY IO cell work in SDR mode */
f5412b4632762b2 Dhananjay Kangude 2023-01-23  557  		clk_wr_delay = 0;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  558  	}
f5412b4632762b2 Dhananjay Kangude 2023-01-23  559  
f5412b4632762b2 Dhananjay Kangude 2023-01-23  560  	if (cmd_not_dat) {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  561  		phy->settings.sdhc_wrcmd0_dly = wr0_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  562  		phy->settings.sdhc_wrcmd1_dly = wr1_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  563  		phy->settings.cp_clk_wrdqs_delay = clk_wr_delay;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  564  		phy->settings.sdhc_wrcmd0_sdclk_dly = wr0_sdclk_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  565  		phy->settings.sdhc_wrcmd1_sdclk_dly = wr1_sdclk_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  566  	} else {
f5412b4632762b2 Dhananjay Kangude 2023-01-23  567  		phy->settings.sdhc_wrdata0_dly = wr0_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  568  		phy->settings.sdhc_wrdata1_dly = wr1_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  569  		phy->settings.cp_clk_wr_delay = clk_wr_delay;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  570  		phy->settings.sdhc_wrdata0_sdclk_dly = wr0_sdclk_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  571  		phy->settings.sdhc_wrdata1_sdclk_dly = wr1_sdclk_dly;
f5412b4632762b2 Dhananjay Kangude 2023-01-23  572  	}
f5412b4632762b2 Dhananjay Kangude 2023-01-23  573  }
f5412b4632762b2 Dhananjay Kangude 2023-01-23  574  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
