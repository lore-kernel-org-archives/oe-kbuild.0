Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE3624
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 08:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676795613; x=1708331613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6/cFfEO0xTUnKqqL6N0F1UjfpagD5KKOaBRX4d3iTk=;
  b=AELifYMfvgAxrzixLUn740lXLom2nOKU2daDA76W0VV2KoE8WMuuATbb
   QNmORKw4+YVsGMCq4h2i5QVDLvjGHiRfojJujLqOuQ1L5uI55Lfb8tZhx
   GzxUuW8a6Ml59Qal7dZGnPrHkmOKQSujWdb/xTBRDtAOf7EIsJthxJGB0
   VTIv38kYZuGvfAJcE7f3rdkj2FNhD/hLE38VpQOZ43a0vPAHiDbgPwpzJ
   UadAJ0PoDrXHtt3P+PuZvJOibbzjUloqmdi/zna8ezPfQ1rvvBP2z+kQh
   2xn+/4ya7zs7srDVLkZxy2abtTaE020r3L2gpV7fr9FZ54gHk+tevmbZQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="329947943"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="329947943"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 00:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="780288535"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="780288535"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2023 00:33:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTf8U-000DBJ-1c;
	Sun, 19 Feb 2023 08:33:30 +0000
Date: Sun, 19 Feb 2023 16:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/include/asm/bitops.h:56:5: warning: The left expression of
 the compound assignment is an uninitialized value. The computed value will
 also be garbage [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202302191623.InEXt4iV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/include/asm/bitops.h:56:5: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: db21370bffbc966253ba32edb112f4beec1531cc btrfs: drop extent map range more efficiently
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20230217 (https://download.01.org/0day-ci/archive/20230219/202302191623.InEXt4iV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=db21370bffbc966253ba32edb112f4beec1531cc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout db21370bffbc966253ba32edb112f4beec1531cc
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302191623.InEXt4iV-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                                   ^
   drivers/gpu/drm/drm_syncobj.c:506:6: note: Assuming the condition is false
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:506:2: note: Taking false branch
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
           ^
   drivers/gpu/drm/drm_syncobj.c:514:6: note: 'fence' is null
           if (fence)
               ^~~~~
   drivers/gpu/drm/drm_syncobj.c:514:2: note: Taking false branch
           if (fence)
           ^
   drivers/gpu/drm/drm_syncobj.c:564:8: note: Returning from 'drm_syncobj_create'
           ret = drm_syncobj_create(&syncobj, flags, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:565:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_syncobj.c:565:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_syncobj.c:568:8: note: Calling 'drm_syncobj_get_handle'
           ret = drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:548:6: note: Assuming 'ret' is < 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/drm_syncobj.c:548:2: note: Taking true branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/drm_syncobj.c:549:3: note: Calling 'drm_syncobj_put'
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Calling 'kref_put'
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'drm_syncobj_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:476:2: note: Memory is released
           kfree(syncobj);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Returning; memory was released
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:549:3: note: Returning; memory was released via 1st parameter
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:568:8: note: Returning; memory was released via 2nd parameter
           ret = drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:569:2: note: Use of memory after it is freed
           drm_syncobj_put(syncobj);
           ^               ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/btrfs/file.c:1255:5: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                                   err = 0;
                                   ^     ~
   fs/btrfs/file.c:1255:5: note: Value stored to 'err' is never read
                                   err = 0;
                                   ^     ~
   fs/btrfs/file.c:3244:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = 0;
                           ^     ~
   fs/btrfs/file.c:3244:4: note: Value stored to 'ret' is never read
                           ret = 0;
                           ^     ~
   fs/btrfs/file.c:3250:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = 0;
                           ^     ~
   fs/btrfs/file.c:3250:4: note: Value stored to 'ret' is never read
                           ret = 0;
                           ^     ~
   fs/btrfs/file.c:3261:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = 0;
                           ^     ~
   fs/btrfs/file.c:3261:4: note: Value stored to 'ret' is never read
                           ret = 0;
                           ^     ~
   fs/btrfs/file.c:3268:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = 0;
                           ^     ~
   fs/btrfs/file.c:3268:4: note: Value stored to 'ret' is never read
                           ret = 0;
                           ^     ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> arch/arm/include/asm/bitops.h:56:5: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p &= ~mask;
              ^
   fs/btrfs/extent_map.c:711:10: note: Assuming 'end' is >= 'start'
           WARN_ON(end < start);
                   ^
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   fs/btrfs/extent_map.c:712:6: note: Assuming the condition is false
           if (end == (u64)-1) {
               ^~~~~~~~~~~~~~
   fs/btrfs/extent_map.c:712:2: note: Taking false branch
           if (end == (u64)-1) {
           ^
   fs/btrfs/extent_map.c:734:2: note: Loop condition is false.  Exiting loop
           write_lock(&em_tree->lock);
           ^
   include/linux/rwlock.h:55:26: note: expanded from macro 'write_lock'
   #define write_lock(lock)        _raw_write_lock(lock)
                                   ^
   include/linux/spinlock_api_up.h:61:33: note: expanded from macro '_raw_write_lock'
   #define _raw_write_lock(lock)                   __LOCK(lock)
                                                   ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   fs/btrfs/extent_map.c:734:2: note: Loop condition is false.  Exiting loop
           write_lock(&em_tree->lock);
           ^
   include/linux/rwlock.h:55:26: note: expanded from macro 'write_lock'
   #define write_lock(lock)        _raw_write_lock(lock)
                                   ^
   include/linux/spinlock_api_up.h:61:33: note: expanded from macro '_raw_write_lock'
   #define _raw_write_lock(lock)                   __LOCK(lock)
                                                   ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   fs/btrfs/extent_map.c:737:2: note: Loop condition is true.  Entering loop body
           while (em) {
           ^
   fs/btrfs/extent_map.c:742:3: note: 'flags' declared without an initial value
                   unsigned long flags;
                   ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_map.c:746:7: note: Assuming 'em_end' is >= 'end'
                   if (em_end < end) {
                       ^~~~~~~~~~~~
   fs/btrfs/extent_map.c:746:3: note: Taking false branch
                   if (em_end < end) {
                   ^
   fs/btrfs/extent_map.c:756:7: note: Assuming 'skip_pinned' is false
                   if (skip_pinned && test_bit(EXTENT_FLAG_PINNED, &em->flags)) {
                       ^~~~~~~~~~~
   fs/btrfs/extent_map.c:756:19: note: Left side of '&&' is false
                   if (skip_pinned && test_bit(EXTENT_FLAG_PINNED, &em->flags)) {
                                   ^
   fs/btrfs/extent_map.c:763:3: note: '?' condition is true
                   clear_bit(EXTENT_FLAG_PINNED, &em->flags);
                   ^
   arch/arm/include/asm/bitops.h:192:27: note: expanded from macro 'clear_bit'
   #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:183:3: note: expanded from macro 'ATOMIC_BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
            ^
   fs/btrfs/extent_map.c:764:3: note: '?' condition is true
                   clear_bit(EXTENT_FLAG_LOGGING, &flags);
                   ^
   arch/arm/include/asm/bitops.h:192:27: note: expanded from macro 'clear_bit'
   #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:183:3: note: expanded from macro 'ATOMIC_BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
            ^
   fs/btrfs/extent_map.c:764:3: note: Calling '____atomic_clear_bit'
                   clear_bit(EXTENT_FLAG_LOGGING, &flags);
                   ^
   arch/arm/include/asm/bitops.h:192:27: note: expanded from macro 'clear_bit'
   #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:183:30: note: expanded from macro 'ATOMIC_BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   arch/arm/include/asm/bitops.h:55:2: note: Loop condition is false.  Exiting loop
           raw_local_irq_save(flags);
           ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq_save'
           do {                                            \
           ^
   arch/arm/include/asm/bitops.h:56:5: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
           *p &= ~mask;
           ~~ ^
   fs/btrfs/extent_map.c:624:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = 0;
                   ^     ~
   fs/btrfs/extent_map.c:624:3: note: Value stored to 'ret' is never read

vim +56 arch/arm/include/asm/bitops.h

^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  47  
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  48  static inline void ____atomic_clear_bit(unsigned int bit, volatile unsigned long *p)
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  49  {
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  50  	unsigned long flags;
8901925d32232a arch/arm/include/asm/bitops.h Masahiro Yamada   2015-08-17  51  	unsigned long mask = BIT_MASK(bit);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  52  
8901925d32232a arch/arm/include/asm/bitops.h Masahiro Yamada   2015-08-17  53  	p += BIT_WORD(bit);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  54  
e7cc2c59cc8355 include/asm-arm/bitops.h      Lennert Buytenhek 2006-09-21  55  	raw_local_irq_save(flags);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16 @56  	*p &= ~mask;
e7cc2c59cc8355 include/asm-arm/bitops.h      Lennert Buytenhek 2006-09-21  57  	raw_local_irq_restore(flags);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  58  }
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  59  

:::::: The code at line 56 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
