Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64E0184E
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679138809; x=1710674809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QfBQHkbTw7r0jpbqOr/Vd404NBTLJYC+OSELSESFos=;
  b=DP78BUT+glI5HBhJ/xBJk68VsfVycJt2XlS0QlxiF5bMIt8IyG4FulAS
   Qwl3cT4n/7AB+Gs86Gay6l9zAtW2asLu+5T1n/l0OsvMb10yG97sMpF1B
   sezKBlJh2DuFUXpmi+J27+xRvN5jFVW4hPQwaMfAbzb9AknlFsOAbNp9w
   PtLFqaU4Ji9c6FZl2I92giZNumSyE2k5MRRZ9x7q6n8ALkHdYRtEHhuBM
   ug6OhnX1eUvc/fE0CMtjV0+DMnMF7ztAfFADHA6H2lQNHt9o+Bbr3yMeh
   vL+AQIrhfnaD/FpIDhHemh/ZMmZQRST10odgMYgi3/4ypBDYlSH5wy/Pj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338446382"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="338446382"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 04:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854759578"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="854759578"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2023 04:26:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdUhu-000A1w-1A;
	Sat, 18 Mar 2023 11:26:42 +0000
Date: Sat, 18 Mar 2023 19:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 454/4413]
 drivers/video/fbdev/core/modedb.c:777:9: warning: Use of memory after it is
 freed [clang-analyzer-unix.Malloc]
Message-ID: <202303181929.M7NTvn2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/video/fbdev/core/modedb.c:777:9: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: 089d924d03d5c17b05d02992f57671ccfba1c4f0 [454/4413] fbdev: Read video= option with fb_get_option() in modedb
:::::: branch date: 33 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181929.M7NTvn2s-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=089d924d03d5c17b05d02992f57671ccfba1c4f0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 089d924d03d5c17b05d02992f57671ccfba1c4f0
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303181929.M7NTvn2s-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:379:2: note: expanded from macro 'RCU_LOCKDEP_WARN'
           do {                                                            \
           ^
   security/commoncap.c:1409:18: note: Dereference of null pointer
           if (cap_capable(current_cred(), &init_user_ns,
                           ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   security/commoncap.c:1431:21: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   ret = cap_capable(current_cred(), &init_user_ns, CAP_SYS_RAWIO,
                                     ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   security/commoncap.c:1430:6: note: Assuming 'addr' is < 'dac_mmap_min_addr'
           if (addr < dac_mmap_min_addr) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   security/commoncap.c:1430:2: note: Taking true branch
           if (addr < dac_mmap_min_addr) {
           ^
   security/commoncap.c:1431:21: note: Left side of '&&' is false
                   ret = cap_capable(current_cred(), &init_user_ns, CAP_SYS_RAWIO,
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:381:11: note: expanded from macro 'RCU_LOCKDEP_WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   security/commoncap.c:1431:21: note: Loop condition is false.  Exiting loop
                   ret = cap_capable(current_cred(), &init_user_ns, CAP_SYS_RAWIO,
                                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:664:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:460:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:379:2: note: expanded from macro 'RCU_LOCKDEP_WARN'
           do {                                                            \
           ^
   security/commoncap.c:1431:21: note: Dereference of null pointer
                   ret = cap_capable(current_cred(), &init_user_ns, CAP_SYS_RAWIO,
                                     ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:664:31: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:35: note: expanded from macro '__rcu_dereference_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   Suppressed 23 warnings (11 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
>> drivers/video/fbdev/core/modedb.c:777:9: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
                           if ((name_matches(db[i], name, namelen) ||
                                ^
   drivers/video/fbdev/core/modedb.c:22:19: note: expanded from macro 'name_matches'
       ((v).name && !strncmp((s), (v).name, (l)) && strlen((v).name) == (l))
                     ^       ~~~
   drivers/video/fbdev/core/modedb.c:627:6: note: Assuming 'db' is non-null
           if (!db) {
               ^~~
   drivers/video/fbdev/core/modedb.c:627:2: note: Taking false branch
           if (!db) {
           ^
   drivers/video/fbdev/core/modedb.c:632:6: note: Assuming 'default_mode' is non-null
           if (!default_mode)
               ^~~~~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:632:2: note: Taking false branch
           if (!default_mode)
           ^
   drivers/video/fbdev/core/modedb.c:635:6: note: Assuming 'default_bpp' is not equal to 0
           if (!default_bpp)
               ^~~~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:635:2: note: Taking false branch
           if (!default_bpp)
           ^
   drivers/video/fbdev/core/modedb.c:639:6: note: Assuming 'mode_option' is null
           if (!mode_option) {
               ^~~~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:639:2: note: Taking true branch
           if (!mode_option) {
           ^
   drivers/video/fbdev/core/modedb.c:643:6: note: Assuming 'mode_option' is non-null
           if (mode_option) {
               ^~~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:643:2: note: Taking true branch
           if (mode_option) {
           ^
   drivers/video/fbdev/core/modedb.c:653:23: note: 'i' is >= 0
                   for (i = namelen-1; i >= 0; i--) {
                                       ^
   drivers/video/fbdev/core/modedb.c:653:3: note: Loop condition is true.  Entering loop body
                   for (i = namelen-1; i >= 0; i--) {
                   ^
   drivers/video/fbdev/core/modedb.c:654:4: note: Control jumps to the 'default' case at line 712
                           switch (name[i]) {
                           ^
   drivers/video/fbdev/core/modedb.c:713:5: note: Control jumps to line 721
                                   goto done;
                                   ^
   drivers/video/fbdev/core/modedb.c:721:3: note: Memory is released
                   kfree(mode_option_buf);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:722:7: note: 'cvt' is 0
                   if (cvt) {
                       ^~~
   drivers/video/fbdev/core/modedb.c:722:3: note: Taking false branch
                   if (cvt) {
                   ^
   drivers/video/fbdev/core/modedb.c:756:8: note: 'refresh_specified' is 0
                   if (!refresh_specified) {
                        ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:756:3: note: Taking true branch
                   if (!refresh_specified) {
                   ^
   drivers/video/fbdev/core/modedb.c:764:8: note: Assuming 'db' is equal to 'modedb'
                           if (db != modedb &&
                               ^~~~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:764:21: note: Left side of '&&' is false
                           if (db != modedb &&
                                            ^
   drivers/video/fbdev/core/modedb.c:776:15: note: Assuming 'i' is < 'dbsize'
                   for (i = 0; i < dbsize; i++) {
                               ^~~~~~~~~~
   drivers/video/fbdev/core/modedb.c:776:3: note: Loop condition is true.  Entering loop body
                   for (i = 0; i < dbsize; i++) {
                   ^
   drivers/video/fbdev/core/modedb.c:777:9: note: Assuming field 'name' is non-null
                           if ((name_matches(db[i], name, namelen) ||
                                ^
   drivers/video/fbdev/core/modedb.c:22:6: note: expanded from macro 'name_matches'
       ((v).name && !strncmp((s), (v).name, (l)) && strlen((v).name) == (l))
        ^~~~~~~~
   drivers/video/fbdev/core/modedb.c:777:9: note: Left side of '&&' is true
                           if ((name_matches(db[i], name, namelen) ||
                                ^
   drivers/video/fbdev/core/modedb.c:22:6: note: expanded from macro 'name_matches'
       ((v).name && !strncmp((s), (v).name, (l)) && strlen((v).name) == (l))
        ^
   drivers/video/fbdev/core/modedb.c:777:9: note: Use of memory after it is freed
                           if ((name_matches(db[i], name, namelen) ||
                                ^
   drivers/video/fbdev/core/modedb.c:22:19: note: expanded from macro 'name_matches'
       ((v).name && !strncmp((s), (v).name, (l)) && strlen((v).name) == (l))
                     ^       ~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   arch/s390/kvm/priv.c:62:3: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   current->thread.gs_cb = (struct gs_cb *)&vcpu->run->s.regs.gscb;
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)

vim +777 drivers/video/fbdev/core/modedb.c

^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  572  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  573  /**
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  574   * fb_find_mode - finds a valid video mode
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  575   * @var: frame buffer user defined part of display
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  576   * @info: frame buffer info structure
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  577   * @mode_option: string video mode to find
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  578   * @db: video mode database
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  579   * @dbsize: size of @db
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  580   * @default_mode: default video mode to fall back to
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  581   * @default_bpp: default color depth in bits per pixel
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  582   *
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  583   * Finds a suitable video mode, starting with the specified mode
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  584   * in @mode_option with fallback to @default_mode.  If
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  585   * @default_mode fails, all modes in the video mode database will
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  586   * be tried.
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  587   *
e32e2fe64a534c drivers/video/fbdev/core/modedb.c Daniel Vetter      2018-07-24  588   * Valid mode specifiers for @mode_option::
e32e2fe64a534c drivers/video/fbdev/core/modedb.c Daniel Vetter      2018-07-24  589   *
e32e2fe64a534c drivers/video/fbdev/core/modedb.c Daniel Vetter      2018-07-24  590   *     <xres>x<yres>[M][R][-<bpp>][@<refresh>][i][p][m]
e32e2fe64a534c drivers/video/fbdev/core/modedb.c Daniel Vetter      2018-07-24  591   *
e32e2fe64a534c drivers/video/fbdev/core/modedb.c Daniel Vetter      2018-07-24  592   * or ::
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  593   *
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  594   *     <name>[-<bpp>][@<refresh>]
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  595   *
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  596   * with <xres>, <yres>, <bpp> and <refresh> decimal numbers and
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  597   * <name> a string.
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  598   *
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  599   * If 'M' is present after yres (and before refresh/bpp if present),
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  600   * the function will compute the timings using VESA(tm) Coordinated
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  601   * Video Timings (CVT).  If 'R' is present after 'M', will compute with
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  602   * reduced blanking (for flatpanels).  If 'i' or 'p' are present, compute
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  603   * interlaced or progressive mode.  If 'm' is present, add margins equal
e32e2fe64a534c drivers/video/fbdev/core/modedb.c Daniel Vetter      2018-07-24  604   * to 1.8% of xres rounded down to 8 pixels, and 1.8% of yres. The char
e32e2fe64a534c drivers/video/fbdev/core/modedb.c Daniel Vetter      2018-07-24  605   * 'i', 'p' and 'm' must be after 'M' and 'R'. Example::
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  606   *
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  607   *     1024x768MR-8@60m - Reduced blank with margins at 60Hz.
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  608   *
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  609   * NOTE: The passed struct @var is _not_ cleared!  This allows you
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  610   * to supply values for e.g. the grayscale and accel_flags fields.
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  611   *
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  612   * Returns zero for failure, 1 if using specified @mode_option,
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  613   * 2 if using specified @mode_option with an ignored refresh rate,
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  614   * 3 if default mode is used, 4 if fall back to any valid mode.
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  615   */
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  616  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  617  int fb_find_mode(struct fb_var_screeninfo *var,
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  618  		 struct fb_info *info, const char *mode_option,
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  619  		 const struct fb_videomode *db, unsigned int dbsize,
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  620  		 const struct fb_videomode *default_mode,
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  621  		 unsigned int default_bpp)
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  622  {
089d924d03d5c1 drivers/video/fbdev/core/modedb.c Thomas Zimmermann  2023-02-09  623  	char *mode_option_buf = NULL;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  624  	int i;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  625  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  626  	/* Set up defaults */
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  627  	if (!db) {
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  628  		db = modedb;
d1ae418eef4ce7 drivers/video/modedb.c            Tobias Klauser     2006-03-27  629  		dbsize = ARRAY_SIZE(modedb);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  630  	}
c25623f5540694 drivers/video/modedb.c            Jordan Crouse      2006-12-08  631  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  632  	if (!default_mode)
c25623f5540694 drivers/video/modedb.c            Jordan Crouse      2006-12-08  633  		default_mode = &db[0];
c25623f5540694 drivers/video/modedb.c            Jordan Crouse      2006-12-08  634  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  635  	if (!default_bpp)
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  636  		default_bpp = 8;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  637  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  638  	/* Did the user specify a video mode? */
089d924d03d5c1 drivers/video/fbdev/core/modedb.c Thomas Zimmermann  2023-02-09  639  	if (!mode_option) {
089d924d03d5c1 drivers/video/fbdev/core/modedb.c Thomas Zimmermann  2023-02-09  640  		fb_get_options(NULL, &mode_option_buf);
089d924d03d5c1 drivers/video/fbdev/core/modedb.c Thomas Zimmermann  2023-02-09  641  		mode_option = mode_option_buf;
089d924d03d5c1 drivers/video/fbdev/core/modedb.c Thomas Zimmermann  2023-02-09  642  	}
c40eea98cd723a drivers/video/modedb.c            Geert Uytterhoeven 2007-10-18  643  	if (mode_option) {
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  644  		const char *name = mode_option;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  645  		unsigned int namelen = strlen(name);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  646  		int res_specified = 0, bpp_specified = 0, refresh_specified = 0;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  647  		unsigned int xres = 0, yres = 0, bpp = default_bpp, refresh = 0;
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  648  		int yres_specified = 0, cvt = 0, rb = 0;
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  649  		int interlace_specified = 0, interlace = 0;
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  650  		int margins = 0;
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  651  		u32 best, diff, tdiff;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  652  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  653  		for (i = namelen-1; i >= 0; i--) {
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  654  			switch (name[i]) {
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  655  			case '@':
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  656  				namelen = i;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  657  				if (!refresh_specified && !bpp_specified &&
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  658  				    !yres_specified) {
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  659  					refresh = simple_strtol(&name[i+1], NULL,
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  660  								10);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  661  					refresh_specified = 1;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  662  					if (cvt || rb)
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  663  						cvt = 0;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  664  				} else
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  665  					goto done;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  666  				break;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  667  			case '-':
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  668  				namelen = i;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  669  				if (!bpp_specified && !yres_specified) {
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  670  					bpp = simple_strtol(&name[i+1], NULL,
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  671  							    10);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  672  					bpp_specified = 1;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  673  					if (cvt || rb)
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  674  						cvt = 0;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  675  				} else
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  676  					goto done;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  677  				break;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  678  			case 'x':
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  679  				if (!yres_specified) {
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  680  					yres = simple_strtol(&name[i+1], NULL,
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  681  							     10);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  682  					yres_specified = 1;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  683  				} else
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  684  					goto done;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  685  				break;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  686  			case '0' ... '9':
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  687  				break;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  688  			case 'M':
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  689  				if (!yres_specified)
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  690  					cvt = 1;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  691  				break;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  692  			case 'R':
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  693  				if (!cvt)
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  694  					rb = 1;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  695  				break;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  696  			case 'm':
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  697  				if (!cvt)
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  698  					margins = 1;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  699  				break;
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  700  			case 'p':
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  701  				if (!cvt) {
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  702  					interlace = 0;
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  703  					interlace_specified = 1;
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  704  				}
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  705  				break;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  706  			case 'i':
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  707  				if (!cvt) {
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  708  					interlace = 1;
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  709  					interlace_specified = 1;
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  710  				}
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  711  				break;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  712  			default:
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  713  				goto done;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  714  			}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  715  		}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  716  		if (i < 0 && yres_specified) {
2cb96f86628d6e drivers/video/modedb.c            Andy Shevchenko    2009-12-15  717  			xres = simple_strtol(name, NULL, 10);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  718  			res_specified = 1;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  719  		}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  720  done:
089d924d03d5c1 drivers/video/fbdev/core/modedb.c Thomas Zimmermann  2023-02-09  721  		kfree(mode_option_buf);
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  722  		if (cvt) {
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  723  			struct fb_videomode cvt_mode;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  724  			int ret;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  725  
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  726  			DPRINTK("CVT mode %dx%d@%dHz%s%s%s\n", xres, yres,
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  727  				(refresh) ? refresh : 60,
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  728  				(rb) ? " reduced blanking" : "",
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  729  				(margins) ? " with margins" : "",
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  730  				(interlace) ? " interlaced" : "");
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  731  
e2d4ecafd24d6e drivers/video/modedb.c            Krzysztof Helt     2008-06-05  732  			memset(&cvt_mode, 0, sizeof(cvt_mode));
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  733  			cvt_mode.xres = xres;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  734  			cvt_mode.yres = yres;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  735  			cvt_mode.refresh = (refresh) ? refresh : 60;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  736  
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  737  			if (interlace)
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  738  				cvt_mode.vmode |= FB_VMODE_INTERLACED;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  739  			else
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  740  				cvt_mode.vmode &= ~FB_VMODE_INTERLACED;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  741  
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  742  			ret = fb_find_mode_cvt(&cvt_mode, margins, rb);
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  743  
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  744  			if (!ret && !fb_try_mode(var, info, &cvt_mode, bpp)) {
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  745  				DPRINTK("modedb CVT: CVT mode ok\n");
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  746  				return 1;
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  747  			}
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  748  
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  749  			DPRINTK("CVT mode invalid, getting mode from database\n");
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  750  		}
96fe6a2109db29 drivers/video/modedb.c            Antonino A. Daplas 2005-09-09  751  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  752  		DPRINTK("Trying specified video mode%s %ix%i\n",
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  753  			refresh_specified ? "" : " (ignoring refresh rate)",
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  754  			xres, yres);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  755  
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  756  		if (!refresh_specified) {
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  757  			/*
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  758  			 * If the caller has provided a custom mode database and
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  759  			 * a valid monspecs structure, we look for the mode with
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  760  			 * the highest refresh rate.  Otherwise we play it safe
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  761  			 * it and try to find a mode with a refresh rate closest
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  762  			 * to the standard 60 Hz.
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  763  			 */
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  764  			if (db != modedb &&
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  765  			    info->monspecs.vfmin && info->monspecs.vfmax &&
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  766  			    info->monspecs.hfmin && info->monspecs.hfmax &&
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  767  			    info->monspecs.dclkmax) {
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  768  				refresh = 1000;
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  769  			} else {
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  770  				refresh = 60;
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  771  			}
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  772  		}
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  773  
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  774  		diff = -1;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  775  		best = -1;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  776  		for (i = 0; i < dbsize; i++) {
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16 @777  			if ((name_matches(db[i], name, namelen) ||
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  778  			     (res_specified && res_matches(db[i], xres, yres))) &&
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  779  			    !fb_try_mode(var, info, &db[i], bpp)) {
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  780  				const int db_interlace = (db[i].vmode &
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  781  					FB_VMODE_INTERLACED ? 1 : 0);
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  782  				int score = abs(db[i].refresh - refresh);
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  783  
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  784  				if (interlace_specified)
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  785  					score += abs(db_interlace - interlace);
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  786  
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  787  				if (!interlace_specified ||
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  788  				    db_interlace == interlace)
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  789  					if (refresh_specified &&
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  790  					    db[i].refresh == refresh)
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  791  						return 1;
f92d39e926003f drivers/video/modedb.c            Timur Tabi         2011-09-13  792  
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  793  				if (score < diff) {
1ba0a59cea41ea drivers/video/fbdev/core/modedb.c Fredrik Noring     2018-07-24  794  					diff = score;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  795  					best = i;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  796  				}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  797  			}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  798  		}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  799  		if (best != -1) {
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  800  			fb_try_mode(var, info, &db[best], bpp);
1c5dd170927b1a drivers/video/modedb.c            Michal Januszewski 2007-10-16  801  			return (refresh_specified) ? 2 : 1;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  802  		}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  803  
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  804  		diff = 2 * (xres + yres);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  805  		best = -1;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  806  		DPRINTK("Trying best-fit modes\n");
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  807  		for (i = 0; i < dbsize; i++) {
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  808  			DPRINTK("Trying %ix%i\n", db[i].xres, db[i].yres);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  809  			if (!fb_try_mode(var, info, &db[i], bpp)) {
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  810  				tdiff = abs(db[i].xres - xres) +
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  811  					abs(db[i].yres - yres);
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  812  
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  813  				/*
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  814  				 * Penalize modes with resolutions smaller
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  815  				 * than requested.
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  816  				 */
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  817  				if (xres > db[i].xres || yres > db[i].yres)
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  818  					tdiff += xres + yres;
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  819  
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  820  				if (diff > tdiff) {
6b745b6fd02213 drivers/video/modedb.c            Michal Januszewski 2008-04-28  821  					diff = tdiff;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  822  					best = i;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  823  				}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  824  			}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  825  		}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  826  		if (best != -1) {
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  827  			fb_try_mode(var, info, &db[best], bpp);
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  828  			return 5;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  829  		}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  830  	}
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  831  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  832  	DPRINTK("Trying default video mode\n");
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  833  	if (!fb_try_mode(var, info, default_mode, default_bpp))
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  834  		return 3;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  835  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  836  	DPRINTK("Trying all modes\n");
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  837  	for (i = 0; i < dbsize; i++)
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  838  		if (!fb_try_mode(var, info, &db[i], default_bpp))
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  839  			return 4;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  840  
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  841  	DPRINTK("No valid mode found\n");
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  842  	return 0;
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  843  }
^1da177e4c3f41 drivers/video/modedb.c            Linus Torvalds     2005-04-16  844  

:::::: The code at line 777 was first introduced by commit
:::::: 1c5dd170927b1aa8e3a01d43d611b840336cdaf2 fbdev: find mode with the highest/safest refresh rate in fb_find_mode()

:::::: TO: Michal Januszewski <spock@gentoo.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
