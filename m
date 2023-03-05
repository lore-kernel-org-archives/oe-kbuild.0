Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FEA15AA
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677981554; x=1709517554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IzpOdKElIJp2wAG3PgrK3poyT0hlfWVWDU23zt0OP88=;
  b=X6rAdCkPElddQAZEvn9xqzugdvBHrotFNXGjOUl9z7XceYIq/5BCxvBL
   cvAGhiZPJIhea1d7kk8haGxg4OZTLJTO/ZM2Lu4f19UgoUlRtYkceUV2L
   5eEy/7ZeNB1sKk3hinvvpax1bPibcOPOGHAXv+gg1RKEu8YrJTcoDFdz1
   MHD8DtgdlGSXGZeR0zjlXVnstWCUDepojjGW43OqKkgwbSREBBYLM3kGM
   zmdm4CRTJ/DULIS/I0uaOdQBFFQlkB2FDrdTWowRHmcaa2zhj4r3/d/Xy
   FZtIULcIloru0rJEwwIpaxP0C+J0yqjIjeikI94GX9CzcQw9cpxE6tF7p
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="337648292"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="337648292"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 17:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="678094743"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="678094743"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Mar 2023 17:59:12 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYdea-0002Un-15;
	Sun, 05 Mar 2023 01:59:12 +0000
Date: Sun, 5 Mar 2023 09:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/kunit/static_stub.c:118:3: warning: Value stored to 'res' is
 never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303050916.mcRDtxWE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/kunit/static_stub.c:118:3: warning: Value stored to 'res' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Gow <davidgow@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Daniel Latypov <dlatypov@google.com>
CC: Brendan Higgins <brendanhiggins@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b01fe98d34f3bed944a93bd8119fed80c856fad8
commit: e047c5eaa76324575e1f95664be4c74ce0e2571b kunit: Expose 'static stub' API to redirect functions
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050916.mcRDtxWE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e047c5eaa76324575e1f95664be4c74ce0e2571b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e047c5eaa76324575e1f95664be4c74ce0e2571b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303050916.mcRDtxWE-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                            ^~~~~~~~~~~~~~~~~
   drivers/char/random.c:1447:30: note: Left side of '||' is true
                   else if (ratelimit_disable || __ratelimit(&urandom_warning)) {
                                              ^
   drivers/char/random.c:1449:4: note: Left side of '&&' is true
                           pr_notice("%s: uninitialized urandom read (%zu bytes read)\n",
                           ^
   include/linux/printk.h:520:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:381:7: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                       ^
   drivers/char/random.c:1449:4: note: Taking true branch
                           pr_notice("%s: uninitialized urandom read (%zu bytes read)\n",
                           ^
   include/linux/printk.h:520:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:381:3: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                   ^
   drivers/char/random.c:1449:4: note: '?' condition is true
                           pr_notice("%s: uninitialized urandom read (%zu bytes read)\n",
                           ^
   include/linux/printk.h:520:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:390:12: note: expanded from macro '__printk_index_emit'
                                   .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
                                          ^
   drivers/char/random.c:1449:4: note: '?' condition is true
                           pr_notice("%s: uninitialized urandom read (%zu bytes read)\n",
                           ^
   include/linux/printk.h:520:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
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
   drivers/char/random.c:1449:4: note: Loop condition is false.  Exiting loop
                           pr_notice("%s: uninitialized urandom read (%zu bytes read)\n",
                           ^
   include/linux/printk.h:520:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
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
   drivers/char/random.c:1450:7: note: Dereference of null pointer
                                     current->comm, iov_iter_count(iter));
                                     ^
   include/linux/printk.h:520:36: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
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
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
>> lib/kunit/static_stub.c:118:3: warning: Value stored to 'res' is never read [clang-analyzer-deadcode.DeadStores]
                   res = kunit_alloc_resource(test, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/static_stub.c:118:3: note: Value stored to 'res' is never read
                   res = kunit_alloc_resource(test, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/mtd/ubi/vtbl.c:96:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
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
   drivers/mtd/ubi/vtbl.c:96:13: note: Assuming 'idx' is < 0
           ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
                      ^
   drivers/mtd/ubi/debug.h:18:17: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                             \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/mtd/ubi/vtbl.c:96:22: note: Left side of '&&' is false
           ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
                               ^
   drivers/mtd/ubi/vtbl.c:96:2: note: Taking true branch
           ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
           ^
   drivers/mtd/ubi/debug.h:18:2: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                             \
           ^
   drivers/mtd/ubi/vtbl.c:96:2: note: Left side of '&&' is true
           ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
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
   include/linux/printk.h:381:7: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                       ^
   drivers/mtd/ubi/vtbl.c:96:2: note: Taking true branch
           ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
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
   include/linux/printk.h:381:3: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                   ^
   drivers/mtd/ubi/vtbl.c:96:2: note: '?' condition is true
           ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
           ^
   drivers/mtd/ubi/debug.h:19:3: note: expanded from macro 'ubi_assert'
                   pr_crit("UBI assert failed in %s at %u (pid %d)\n",          \
                   ^
   include/linux/printk.h:490:2: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)

vim +/res +118 lib/kunit/static_stub.c

e047c5eaa76324 David Gow 2023-01-31   83  
e047c5eaa76324 David Gow 2023-01-31   84  /* Helper function for kunit_activate_static_stub(). The macro does
e047c5eaa76324 David Gow 2023-01-31   85   * typechecking, so use it instead.
e047c5eaa76324 David Gow 2023-01-31   86   */
e047c5eaa76324 David Gow 2023-01-31   87  void __kunit_activate_static_stub(struct kunit *test,
e047c5eaa76324 David Gow 2023-01-31   88  				  void *real_fn_addr,
e047c5eaa76324 David Gow 2023-01-31   89  				  void *replacement_addr)
e047c5eaa76324 David Gow 2023-01-31   90  {
e047c5eaa76324 David Gow 2023-01-31   91  	struct kunit_static_stub_ctx *ctx;
e047c5eaa76324 David Gow 2023-01-31   92  	struct kunit_resource *res;
e047c5eaa76324 David Gow 2023-01-31   93  
e047c5eaa76324 David Gow 2023-01-31   94  	KUNIT_ASSERT_PTR_NE_MSG(test, real_fn_addr, NULL,
e047c5eaa76324 David Gow 2023-01-31   95  				"Tried to activate a stub for function NULL");
e047c5eaa76324 David Gow 2023-01-31   96  
e047c5eaa76324 David Gow 2023-01-31   97  	/* If the replacement address is NULL, deactivate the stub. */
e047c5eaa76324 David Gow 2023-01-31   98  	if (!replacement_addr) {
e047c5eaa76324 David Gow 2023-01-31   99  		kunit_deactivate_static_stub(test, replacement_addr);
e047c5eaa76324 David Gow 2023-01-31  100  		return;
e047c5eaa76324 David Gow 2023-01-31  101  	}
e047c5eaa76324 David Gow 2023-01-31  102  
e047c5eaa76324 David Gow 2023-01-31  103  	/* Look up any existing stubs for this function, and replace them. */
e047c5eaa76324 David Gow 2023-01-31  104  	res = kunit_find_resource(test,
e047c5eaa76324 David Gow 2023-01-31  105  				  __kunit_static_stub_resource_match,
e047c5eaa76324 David Gow 2023-01-31  106  				  real_fn_addr);
e047c5eaa76324 David Gow 2023-01-31  107  	if (res) {
e047c5eaa76324 David Gow 2023-01-31  108  		ctx = res->data;
e047c5eaa76324 David Gow 2023-01-31  109  		ctx->replacement_addr = replacement_addr;
e047c5eaa76324 David Gow 2023-01-31  110  
e047c5eaa76324 David Gow 2023-01-31  111  		/* We got an extra reference from find_resource(), so put it. */
e047c5eaa76324 David Gow 2023-01-31  112  		kunit_put_resource(res);
e047c5eaa76324 David Gow 2023-01-31  113  	} else {
e047c5eaa76324 David Gow 2023-01-31  114  		ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
e047c5eaa76324 David Gow 2023-01-31  115  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
e047c5eaa76324 David Gow 2023-01-31  116  		ctx->real_fn_addr = real_fn_addr;
e047c5eaa76324 David Gow 2023-01-31  117  		ctx->replacement_addr = replacement_addr;
e047c5eaa76324 David Gow 2023-01-31 @118  		res = kunit_alloc_resource(test, NULL,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
