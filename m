Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819310E6
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 02:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680229942; x=1711765942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+nVQOse/Ql8GciRv5DXVXRaNqa0LQDi3Pogz3iWui3Q=;
  b=XFsTNnXRbs3EJijS8yZb56gfiTWNmEJiEKM1U3ROWKcJ4eR6I2CVhLW2
   zt6oqT7wuU5fBQsHI/KADzgnf6Y6QuiLWddq2GsPnCyZ1xXFhEdhVYdKJ
   n73Px7z+OKTGarMSbz611owocTiPowa7/0KcILkVXNMKr8oWrHTFU7YOf
   caw27meuAcOBWrLM0FupnKhcn2joz6XGw065pO2ARLJdbo6N/Mh4oiHaJ
   MSOJoJpsuHDAy5m9IjaX3Fyq5oWt4EdFKK4aP/ji8RKU2JkyPIxcym+37
   5bcV3+0FW6tjytD/Ehmbj3ZFoulJIbjWqZlXEJTVuMKbj55rYfvKmqy/w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342985489"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="342985489"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 19:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="1014665246"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="1014665246"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2023 19:32:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi4Yt-000LQQ-2P;
	Fri, 31 Mar 2023 02:32:19 +0000
Date: Fri, 31 Mar 2023 10:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/video/fbdev/omap/omapfb_main.c:1811:16: warning: Use of
 memory after it is freed [clang-analyzer-unix.Malloc]
Message-ID: <202303311047.2rVOzYjo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/video/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62bad54b26db8bc98e28749cd76b2d890edb4258
commit: 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b fbdev: omap: avoid using mach/*.h files
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311047.2rVOzYjo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=804f7f19c2e2928aeb8eafef8379fe8b8d13f98b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303311047.2rVOzYjo-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   fs/namespace.c:3868:1: note: Calling '__do_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFINE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DEFINEx'
                   long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3876:2: note: Taking false branch
           if (!may_mount())
           ^
   fs/namespace.c:3881:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3881:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3886:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3886:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3890:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3890:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3894:11: note: Calling 'lock_mount'
           old_mp = lock_mount(&old);
                    ^~~~~~~~~~~~~~~~
   fs/namespace.c:2293:6: note: Assuming the condition is true
           if (unlikely(cant_mount(dentry))) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                       ^~~~
   fs/namespace.c:2293:2: note: Taking false branch
           if (unlikely(cant_mount(dentry))) {
           ^
   fs/namespace.c:2299:14: note: 'mnt' is non-null
           if (likely(!mnt)) {
                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   fs/namespace.c:2299:14: note: 'mnt' is non-null
           if (likely(!mnt)) {
                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/namespace.c:2299:2: note: Taking false branch
           if (likely(!mnt)) {
           ^
   fs/namespace.c:2312:2: note: Null pointer value stored to 'dentry'
           dentry = path->dentry = dget(mnt->mnt_root);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:2313:2: note: Control jumps to line 2292
           goto retry;
           ^
   fs/namespace.c:2292:13: note: Access to field 'd_inode' results in a dereference of a null pointer (loaded from variable 'dentry')
           inode_lock(dentry->d_inode);
                      ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/video/fbdev/omap/omapfb_main.c:1334:7: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(buf, "%10d", &level) == 1) {
                       ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1334:7: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(buf, "%10d", &level) == 1) {
                       ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1451:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(fix->id, MODULE_NAME, sizeof(fix->id));
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1451:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(fix->id, MODULE_NAME, sizeof(fix->id));
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1577:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(name, conf->lcd.ctrl_name, sizeof(name) - 1);
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1577:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(name, conf->lcd.ctrl_name, sizeof(name) - 1);
           ^~~~~~~
>> drivers/video/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           fbdev->dssdev = NULL;
           ~~~~~~~~~~~~~ ^
   drivers/video/fbdev/omap/omapfb_main.c:1808:2: note: Calling 'omapfb_free_resources'
           omapfb_free_resources(fbdev, saved_state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1530:2: note: Control jumps to 'case 1:'  at line 1555
           switch (state) {
           ^
   drivers/video/fbdev/omap/omapfb_main.c:1557:3: note: Memory is released
                   kfree(fbdev);
                   ^~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1558:3: note:  Execution continues on line 1557
                   break;
                   ^
   drivers/video/fbdev/omap/omapfb_main.c:1808:2: note: Returning; memory was released via 1st parameter
           omapfb_free_resources(fbdev, saved_state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1811:16: note: Use of memory after it is freed
           fbdev->dssdev = NULL;
           ~~~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/zstd/compress/zstd_compress_sequences.c:260:9: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(nextCTable, prevCTable, prevCTableSize);
           ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_sequences.c:260:9: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(nextCTable, prevCTable, prevCTableSize);
           ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   lib/zstd/compress/zstd_compress_superblock.c:82:5: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:82:5: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:121:5: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(nextHuf->CTable, 0, sizeof(nextHuf->CTable));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:121:5: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(nextHuf->CTable, 0, sizeof(nextHuf->CTable));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:141:21: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                       ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
                       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:141:21: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                       ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
                       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:148:17: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
                   ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:148:17: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   ZSTD_memcpy(nextHuf, prevHuf, sizeof(*prevHuf));
                   ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:192:5: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(workspace, 0, wkspSize);
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:192:5: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(workspace, 0, wkspSize);
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_superblock.c:352:9: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(op, hufMetadata->hufDesBuffer, hufMetadata->hufDesSize);

vim +1811 drivers/video/fbdev/omap/omapfb_main.c

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1798  
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1799  /* Called when the device is being detached from the driver */
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1800  static int omapfb_remove(struct platform_device *pdev)
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1801  {
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1802  	struct omapfb_device *fbdev = platform_get_drvdata(pdev);
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1803  	enum omapfb_state saved_state = fbdev->state;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1804  
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1805  	/* FIXME: wait till completion of pending events */
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1806  
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1807  	fbdev->state = OMAPFB_DISABLED;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1808  	omapfb_free_resources(fbdev, saved_state);
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1809  
f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16  1810  	platform_device_unregister(&omapdss_device);
f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16 @1811  	fbdev->dssdev = NULL;
f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16  1812  
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1813  	return 0;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1814  }
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  1815  

:::::: The code at line 1811 was first introduced by commit
:::::: f778a12dd33200513596a0d4d3ba4d5f09e79c09 OMAP: OMAPFB: fix clk_get for RFBI

:::::: TO: Tomi Valkeinen <tomi.valkeinen@nokia.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
