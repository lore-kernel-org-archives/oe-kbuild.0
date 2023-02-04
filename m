Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE523A9
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675518828; x=1707054828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AxfXAFcmndCPUaN7re6vE/QejHB4u466zmq5I4F9srU=;
  b=HzYrcB3Ym9af2njPR8qODBhNPUhfISahEUpBSa4l1QwtCLTzpm2rASHn
   Z4hdhRLj27Dr613944POFteN4qjYXnH+ObDG1/VwG2DX+LAOYwavJfDb8
   dF3khXv1MaRoUGrpjfp+8QCqYD3Ym83cMgoaZDs4GZacM0kmPUX8cnhYc
   zzdq5Kp2nFw3Gz8tiAzPe7mvWaCAKt/G9fK0FAiGqlgdrA//fXzx5GjpB
   2G2wwMKD2BiJvjAAP80nn5x/kM7sCPEOBnYQfpwQD+Q5qu0Fsd2WsY4dE
   5bJP8qC1DwOdkivTg38i8ASJKlEJPlgWbGvV7mzmebT2lc6pWitzjYMbG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309279242"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309279242"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 05:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643564025"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="643564025"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 05:53:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOIzA-0001L6-3A;
	Sat, 04 Feb 2023 13:53:44 +0000
Date: Sat, 4 Feb 2023 21:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rt-devel:linux-6.2.y-rt-rebase 15/46]
 kernel/printk/printk.c:3131:2: warning: Value stored to 'seq' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302042129.5b29yxOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/printk/printk.c:3131:2: warning: Value stored to 'seq' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.2.y-rt-rebase
head:   bee0efc1fe1add1df7d677cee5a9c4c325196403
commit: 0886be6b20e6af53d466e32232af9a950ea95df8 [15/46] printk: add infrastucture for atomic consoles
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20230202 (https://download.01.org/0day-ci/archive/20230204/202302042129.5b29yxOi-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=0886be6b20e6af53d466e32232af9a950ea95df8
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.2.y-rt-rebase
        git checkout 0886be6b20e6af53d466e32232af9a950ea95df8
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:84:6: note: Assuming the condition is false
           if (*ppos)
               ^~~~~
   fs/fuse/control.c:84:2: note: Taking false branch
           if (*ppos)
           ^
   fs/fuse/control.c:88:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   fs/fuse/control.c:88:2: note: Taking true branch
           if (err)
           ^
   fs/fuse/control.c:89:3: note: Returning without writing to '*val'
                   return err;
                   ^
   fs/fuse/control.c:169:8: note: Returning from 'fuse_conn_limit_write'
           ret = fuse_conn_limit_write(file, buf, count, ppos, &val,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:171:6: note: Assuming 'ret' is > 0
           if (ret <= 0)
               ^~~~~~~~
   fs/fuse/control.c:171:2: note: Taking false branch
           if (ret <= 0)
           ^
   fs/fuse/control.c:173:7: note: Calling 'fuse_ctl_file_conn_get'
           fc = fuse_ctl_file_conn_get(file);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:28:6: note: Assuming 'fc' is non-null
           if (fc)
               ^~
   fs/fuse/control.c:28:2: note: Taking true branch
           if (fc)
           ^
   fs/fuse/control.c:31:2: note: Returning pointer (loaded from 'fc'), which participates in a condition later
           return fc;
           ^~~~~~~~~
   fs/fuse/control.c:173:7: note: Returning from 'fuse_ctl_file_conn_get'
           fc = fuse_ctl_file_conn_get(file);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:174:6: note: Assuming 'fc' is non-null
           if (!fc)
               ^~~
   fs/fuse/control.c:174:2: note: Taking false branch
           if (!fc)
           ^
   fs/fuse/control.c:179:27: note: Assigned value is garbage or undefined
           fc->congestion_threshold = val;
                                    ^ ~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: warning: Value stored to 'base' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem *base = mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: note: Value stored to 'base' during its initialization is never read
           void __iomem *base = mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   kernel/printk/printk.c:185:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:185:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:187:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:187:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
>> kernel/printk/printk.c:3131:2: warning: Value stored to 'seq' is never read [clang-analyzer-deadcode.DeadStores]
           seq = read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:3131:2: note: Value stored to 'seq' is never read
           seq = read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   kernel/irq/manage.c:201:19: warning: Value stored to 'chip' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct irq_chip *chip = irq_data_get_irq_chip(data);
                            ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c:201:19: note: Value stored to 'chip' during its initialization is never read
           struct irq_chip *chip = irq_data_get_irq_chip(data);
                            ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpio/gpio-brcmstb.c:327:26: warning: Value stored to 'pdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev = priv->pdev;
                                   ^~~~   ~~~~~~~~~~
   drivers/gpio/gpio-brcmstb.c:327:26: note: Value stored to 'pdev' during its initialization is never read
           struct platform_device *pdev = priv->pdev;
                                   ^~~~   ~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpio/gpio-xilinx.c:101:13: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
           map[index] &= ~(0xFFFFFFFFul << offset);
                      ^
   drivers/gpio/gpio-xilinx.c:520:2: note: Calling 'xgpio_read_ch_all'
           xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:135:16: note: Assuming 'bit' is <= 'lastbit'
           for (bit = 0; bit <= lastbit ; bit += 32)
                         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:135:2: note: Loop condition is true.  Entering loop body
           for (bit = 0; bit <= lastbit ; bit += 32)

vim +/seq +3131 kernel/printk/printk.c

0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3088  
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3089  /*
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3090   * Print one record for the given console. The record printed is whatever
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3091   * record is the next available record for the given console.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds            2005-04-16  3092   *
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3093   * @text is a buffer of size CONSOLE_LOG_MAX.
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3094   *
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3095   * If extended messages should be printed, @ext_text is a buffer of size
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3096   * CONSOLE_EXT_LOG_MAX. Otherwise @ext_text must be NULL.
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3097   *
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3098   * If dropped messages should be printed, @dropped_text is a buffer of size
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3099   * DROPPED_TEXT_MAX. Otherwise @dropped_text must be NULL.
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3100   *
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3101   * @atomic_printing specifies if atomic printing should be used.
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3102   *
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3103   * @handover will be set to true if a printk waiter has taken over the
fc956ae0de7fa2 kernel/printk/printk.c John Ogness               2022-11-16  3104   * console_lock, in which case the caller is no longer holding both the
fc956ae0de7fa2 kernel/printk/printk.c John Ogness               2022-11-16  3105   * console_lock and the SRCU read lock. Otherwise it is set to false.
fc956ae0de7fa2 kernel/printk/printk.c John Ogness               2022-11-16  3106   *
fc956ae0de7fa2 kernel/printk/printk.c John Ogness               2022-11-16  3107   * @cookie is the cookie from the SRCU read lock.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds            2005-04-16  3108   *
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3109   * Returns false if the given console has no next record to print, otherwise
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3110   * true.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds            2005-04-16  3111   *
fc956ae0de7fa2 kernel/printk/printk.c John Ogness               2022-11-16  3112   * Requires the console_lock and the SRCU read lock.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds            2005-04-16  3113   */
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3114  static bool __console_emit_next_record(struct console *con, char *text, char *ext_text,
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3115  				       char *dropped_text, bool atomic_printing,
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3116  				       bool *handover, int cookie)
^1da177e4c3f41 kernel/printk.c        Linus Torvalds            2005-04-16  3117  {
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3118  	static atomic_t panic_console_dropped = ATOMIC_INIT(0);
896fbe20b4e233 kernel/printk/printk.c John Ogness               2020-07-09  3119  	struct printk_info info;
896fbe20b4e233 kernel/printk/printk.c John Ogness               2020-07-09  3120  	struct printk_record r;
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3121  	unsigned long flags;
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3122  	char *write_text;
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3123  	size_t len;
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3124  	u64 seq;
78944e549d3667 kernel/printk.c        Antonino A. Daplas        2006-08-05  3125  
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3126  	prb_rec_init_rd(&r, &info, text, CONSOLE_LOG_MAX);
896fbe20b4e233 kernel/printk/printk.c John Ogness               2020-07-09  3127  
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3128  	if (handover)
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3129  		*handover = false;
78944e549d3667 kernel/printk.c        Antonino A. Daplas        2006-08-05  3130  
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04 @3131  	seq = read_console_seq(con);
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3132  
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3133  	if (!prb_read_valid(prb, seq, &r))
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3134  		return false;
7ff9554bb578ba kernel/printk.c        Kay Sievers               2012-05-03  3135  
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3136  	if (seq != r.info->seq) {
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3137  		atomic_long_add((unsigned long)(r.info->seq - seq), &con->dropped);
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3138  		write_console_seq(con, r.info->seq, atomic_printing);
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3139  		seq = r.info->seq;
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3140  		if (panic_in_progress() &&
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3141  		    atomic_fetch_inc_relaxed(&panic_console_dropped) > 10) {
13fb0f74d7029d kernel/printk/printk.c Stephen Brennan           2022-02-02  3142  			suppress_panic_printk = 1;
13fb0f74d7029d kernel/printk/printk.c Stephen Brennan           2022-02-02  3143  			pr_warn_once("Too many dropped messages. Suppress messages on non-panic CPUs to prevent livelock.\n");
13fb0f74d7029d kernel/printk/printk.c Stephen Brennan           2022-02-02  3144  		}
896fbe20b4e233 kernel/printk/printk.c John Ogness               2020-07-09  3145  	}
896fbe20b4e233 kernel/printk/printk.c John Ogness               2020-07-09  3146  
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3147  	/* Skip record that has level above the console loglevel. */
896fbe20b4e233 kernel/printk/printk.c John Ogness               2020-07-09  3148  	if (suppress_message_printing(r.info->level)) {
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3149  		write_console_seq(con, seq + 1, atomic_printing);
084681d14e429c kernel/printk.c        Kay Sievers               2012-06-28  3150  		goto skip;
084681d14e429c kernel/printk.c        Kay Sievers               2012-06-28  3151  	}
649e6ee33f73ba kernel/printk.c        Kay Sievers               2012-05-10  3152  
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3153  	if (ext_text) {
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3154  		write_text = ext_text;
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3155  		len = info_print_ext_header(ext_text, CONSOLE_EXT_LOG_MAX, r.info);
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3156  		len += msg_print_ext_body(ext_text + len, CONSOLE_EXT_LOG_MAX - len,
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3157  					  &r.text_buf[0], r.info->text_len, &r.info->dev_info);
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3158  	} else {
03a749e628fdbc kernel/printk/printk.c John Ogness               2022-04-21  3159  		write_text = text;
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3160  		len = record_print_text(&r, console_msg_format & MSG_FORMAT_SYSLOG, printk_time);
6fe29354befe4c kernel/printk/printk.c Tejun Heo                 2015-06-25  3161  	}
7ff9554bb578ba kernel/printk.c        Kay Sievers               2012-05-03  3162  
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3163  	if (handover) {
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware    2018-01-10  3164) 		/*
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware    2018-01-10  3165) 		 * While actively printing out messages, if another printk()
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware    2018-01-10  3166) 		 * were to occur on another CPU, it may wait for this one to
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware    2018-01-10  3167) 		 * finish. This task can not be preempted if there is a
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware    2018-01-10  3168) 		 * waiter waiting to take over.
93d102f094be9b kernel/printk/printk.c John Ogness               2021-07-15  3169  		 *
93d102f094be9b kernel/printk/printk.c John Ogness               2021-07-15  3170  		 * Interrupts are disabled because the hand over to a waiter
93d102f094be9b kernel/printk/printk.c John Ogness               2021-07-15  3171  		 * must not be interrupted until the hand over is completed
93d102f094be9b kernel/printk/printk.c John Ogness               2021-07-15  3172  		 * (@console_waiter is cleared).
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware    2018-01-10  3173) 		 */
93d102f094be9b kernel/printk/printk.c John Ogness               2021-07-15  3174  		printk_safe_enter_irqsave(flags);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek               2018-01-12  3175  		console_lock_spinning_enable();
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware    2018-01-10  3176) 
2d9ef940f89e0a kernel/printk/printk.c Petr Mladek               2022-06-23  3177  		stop_critical_timings();	/* don't trace print latency */
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3178  	}
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3179  	call_console_driver(con, write_text, len, dropped_text, atomic_printing);
0886be6b20e6af kernel/printk/printk.c John Ogness               2022-02-04  3180  	write_console_seq(con, seq + 1, atomic_printing);
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3181  	if (handover) {
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3182  		start_critical_timings();
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3183  
fc956ae0de7fa2 kernel/printk/printk.c John Ogness               2022-11-16  3184  		*handover = console_lock_spinning_disable_and_check(cookie);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek               2018-01-12  3185  		printk_safe_exit_irqrestore(flags);
5342b8e20b15e5 kernel/printk/printk.c Sebastian Andrzej Siewior 2022-07-19  3186  	}
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3187  skip:
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3188  	return true;
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3189  }
a699449bb13b70 kernel/printk/printk.c John Ogness               2022-04-21  3190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
