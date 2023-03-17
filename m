Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E617F7F1
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679040132; x=1710576132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7aBSnIJcaRAuBG54vmR7YqoXX7iZqANwYgJpm3mC7M=;
  b=QwYIG49peV0IVlu2yiOj5CtLux0ns+7lmwvoZyAkacUvheZTKGAyTDfx
   nqBjN5aElRXwSqirmjgU4mto1OfT54RslHE0ftZ/ZM7cTvz2zS51eNHiO
   /RPTeVeyvj69fo3Y8hE1ZxYsHS73TPEAjochRqr3MIzUGoy7vRqY4v+A1
   8US7mJCGukzBZdPVFhMtn0DLu47VK+UyBHyPUQ49NJz68i+kDmx7Y4w6W
   ad8UmxqVW0jTmvH7FBY83lmMgYeDgLb9+ta0ZLNLhGAmkxHTEhQbrvPdH
   dhQqcmSKVxYiGpcuwAbjciAoqKHpNBW26c+utaGIXw9JnLAU83jDSVC/m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424478114"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="424478114"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 01:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854358377"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="854358377"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 01:02:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd52H-0009D8-0W;
	Fri, 17 Mar 2023 08:02:01 +0000
Date: Fri, 17 Mar 2023 16:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2400/3406] crypto/rng.c:206:27: warning: Value
 stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303171604.IC5KepFy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/rng.c:206:27: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: ecf24a1070b3259a81feabe5d5b18153921c0a10 [2400/3406] crypto: rng - Count error stats differently
:::::: branch date: 5 hours ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171604.IC5KepFy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ecf24a1070b3259a81feabe5d5b18153921c0a10
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ecf24a1070b3259a81feabe5d5b18153921c0a10
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303171604.IC5KepFy-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ubifs/lpt.c:281:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, nrbits > 0);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                             \
                                 ^
   fs/ubifs/lpt.c:282:18: note: Assuming 'nrbits' is <= 32
           ubifs_assert(c, nrbits <= 32);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                               \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ubifs/lpt.c:282:2: note: Taking false branch
           ubifs_assert(c, nrbits <= 32);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                               \
           ^
   fs/ubifs/lpt.c:282:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, nrbits <= 32);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                             \
                                 ^
   fs/ubifs/lpt.c:283:18: note: Assuming the condition is true
           ubifs_assert(c, *pos >= 0);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                               \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ubifs/lpt.c:283:2: note: Taking false branch
           ubifs_assert(c, *pos >= 0);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                               \
           ^
   fs/ubifs/lpt.c:283:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, *pos >= 0);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                             \
                                 ^
   fs/ubifs/lpt.c:284:2: note: Taking false branch
           ubifs_assert(c, *pos < 8);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                               \
           ^
   fs/ubifs/lpt.c:284:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, *pos < 8);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                             \
                                 ^
   fs/ubifs/lpt.c:285:6: note: Assuming 'b' is 0
           if (b) {
               ^
   fs/ubifs/lpt.c:285:2: note: Taking false branch
           if (b) {
           ^
   fs/ubifs/lpt.c:306:3: note: 'Default' branch taken. Execution continues on line 324
                   switch (bytes) {
                   ^
   fs/ubifs/lpt.c:324:6: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
           val <<= k;
           ~~~ ^
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
>> crypto/rng.c:206:27: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_rng *istat = rng_get_stat(alg);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~
   crypto/rng.c:206:27: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_rng *istat = rng_get_stat(alg);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   crypto/drbg.c:246:17: warning: Value stored to 'entropylen' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned short entropylen = drbg_sec_strength(drbg->core->flags);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:246:17: note: Value stored to 'entropylen' during its initialization is never read
           unsigned short entropylen = drbg_sec_strength(drbg->core->flags);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:1200:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret = crypto_rng_get_bytes(drbg->jent,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:1200:4: note: Value stored to 'ret' is never read
                           ret = crypto_rng_get_bytes(drbg->jent,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/pwm/sysfs.c:159:14: warning: Value stored to 'polarity' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *polarity = "unknown";
                       ^~~~~~~~   ~~~~~~~~~
   drivers/pwm/sysfs.c:159:14: note: Value stored to 'polarity' during its initialization is never read
           const char *polarity = "unknown";
                       ^~~~~~~~   ~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clk/at91/clk-master.c:197:7: warning: Division by zero [clang-analyzer-core.DivideZero]
           rate /= characteristics->divisors[div_index];
                ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(master_div->lock, flags);
           ^
   include/linux/spinlock.h:380:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:241:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(master_div->lock, flags);

vim +/istat +206 crypto/rng.c

17f0f4a47df9ae Neil Horman 2008-08-14  203  
acec27ff35af9c Herbert Xu  2015-04-21  204  int crypto_register_rng(struct rng_alg *alg)
acec27ff35af9c Herbert Xu  2015-04-21  205  {
ecf24a1070b325 Herbert Xu  2023-02-16 @206  	struct crypto_istat_rng *istat = rng_get_stat(alg);
acec27ff35af9c Herbert Xu  2015-04-21  207  	struct crypto_alg *base = &alg->base;
acec27ff35af9c Herbert Xu  2015-04-21  208  
acec27ff35af9c Herbert Xu  2015-04-21  209  	if (alg->seedsize > PAGE_SIZE / 8)
acec27ff35af9c Herbert Xu  2015-04-21  210  		return -EINVAL;
acec27ff35af9c Herbert Xu  2015-04-21  211  
acec27ff35af9c Herbert Xu  2015-04-21  212  	base->cra_type = &crypto_rng_type;
acec27ff35af9c Herbert Xu  2015-04-21  213  	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
acec27ff35af9c Herbert Xu  2015-04-21  214  	base->cra_flags |= CRYPTO_ALG_TYPE_RNG;
acec27ff35af9c Herbert Xu  2015-04-21  215  
ecf24a1070b325 Herbert Xu  2023-02-16  216  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
ecf24a1070b325 Herbert Xu  2023-02-16  217  		memset(istat, 0, sizeof(*istat));
ecf24a1070b325 Herbert Xu  2023-02-16  218  
acec27ff35af9c Herbert Xu  2015-04-21  219  	return crypto_register_alg(base);
acec27ff35af9c Herbert Xu  2015-04-21  220  }
acec27ff35af9c Herbert Xu  2015-04-21  221  EXPORT_SYMBOL_GPL(crypto_register_rng);
acec27ff35af9c Herbert Xu  2015-04-21  222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
