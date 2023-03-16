Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F560644
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 05:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678945172; x=1710481172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/w0Nnn4/vLvJ12ta522qNVURJAcaCJK1Ki7cUuoYHvw=;
  b=g8hNT1Zw8ftMnBZt7Z7SEGAMMSEX9fnbSbT10tsbb14hnnwKy7/JKm6h
   3huSmIQYrQnZCzMYSckEpzZSYIfLG/i10MFE85EelpS8CJMR7q2FjBUjw
   bgqnJN/eCogkRadrnT2mzKU8Q7UkJUQCuQK9vGMrYwBJdk7Zke43aOUxa
   iOKAKy2K1UCB1ttR4ZYzZsvp4/Osqm4UgNdHWI63gXV9n35eig9P3RWSO
   rC2/YJroYEN2IyMiioGB5jLGAbr/3MaywCRqtf4JnVSQd/Fz7II4pWpOe
   47/HodAjUzM72PPkj03zPZC7tPDqSzYeYt9rCW2or4fAXYxl1u0CXbuFN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321737186"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="321737186"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 22:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="925608433"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925608433"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2023 22:39:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcgKf-0008KJ-2n;
	Thu, 16 Mar 2023 05:39:21 +0000
Date: Thu, 16 Mar 2023 13:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2396/3406] crypto/ahash.c:311:26: warning: Value
 stored to 'alg' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303161330.N2iirpq5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/ahash.c:311:26: warning: Value stored to 'alg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 0e4e6d7094df9ec839c7d3163911ce1ff06e11b5 [2396/3406] crypto: hash - Count error stats differently
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230316/202303161330.N2iirpq5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0e4e6d7094df9ec839c7d3163911ce1ff06e11b5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0e4e6d7094df9ec839c7d3163911ce1ff06e11b5
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303161330.N2iirpq5-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                               ^~~~~~
   fs/nls/nls_base.c:194:2: note: Loop condition is true.  Entering loop body
           while (inlen > 0 && maxout > 0) {
           ^
   fs/nls/nls_base.c:195:7: note: Calling 'get_utf16'
                   u = get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:176:2: note: Control jumps to the 'default' case at line 177
           switch (endian) {
           ^
   fs/nls/nls_base.c:178:3: note: Returning value (loaded from 'c'), which participates in a condition later
                   return c;
                   ^~~~~~~~
   fs/nls/nls_base.c:195:7: note: Returning from 'get_utf16'
                   u = get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:196:7: note: Assuming 'u' is not equal to 0
                   if (!u)
                       ^~
   fs/nls/nls_base.c:196:3: note: Taking false branch
                   if (!u)
                   ^
   fs/nls/nls_base.c:200:7: note: Assuming 'u' is <= 127
                   if (u > 0x7f) {
                       ^~~~~~~~
   fs/nls/nls_base.c:200:3: note: Taking false branch
                   if (u > 0x7f) {
                   ^
   fs/nls/nls_base.c:227:5: note: Null pointer value stored to 'op'
                           *op++ = (u8) u;
                            ^~~~
   fs/nls/nls_base.c:227:10: note: Dereference of null pointer
                           *op++ = (u8) u;
                           ~~~~~~^~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   crypto/asymmetric_keys/verify_pefile.c:113:14: warning: Although the value stored to 'secs' is used in the enclosing expression, the value is never actually read from 'secs' [clang-analyzer-deadcode.DeadStores]
           ctx->secs = secs = pebuf + cursor;
                       ^      ~~~~~~~~~~~~~~
   crypto/asymmetric_keys/verify_pefile.c:113:14: note: Although the value stored to 'secs' is used in the enclosing expression, the value is never actually read from 'secs'
           ctx->secs = secs = pebuf + cursor;
                       ^      ~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
>> crypto/ahash.c:311:26: warning: Value stored to 'alg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ahash.c:311:26: note: Value stored to 'alg' during its initialization is never read
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ahash.c:323:26: warning: Value stored to 'alg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ahash.c:323:26: note: Value stored to 'alg' during its initialization is never read
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
>> crypto/shash.c:573:28: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_hash *istat = hash_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   crypto/shash.c:573:28: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_hash *istat = hash_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   crypto/akcipher.c:135:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   crypto/akcipher.c:135:32: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   include/linux/list.h:869:10: warning: Access to field 'pprev' results in a dereference of a null pointer (loaded from variable 'h') [clang-analyzer-core.NullDereference]
           return !h->pprev;
                   ^
   kernel/ucount.c:255:23: note: Assuming pointer value is null
           for (iter = ucounts; iter; iter = iter->ns->ucounts) {
                                ^~~~
   kernel/ucount.c:255:2: note: Loop condition is false. Execution continues on line 259
           for (iter = ucounts; iter; iter = iter->ns->ucounts) {
           ^
   kernel/ucount.c:259:14: note: Passing null pointer value via 1st parameter 'ucounts'
           put_ucounts(ucounts);
                       ^~~~~~~
   kernel/ucount.c:259:2: note: Calling 'put_ucounts'
           put_ucounts(ucounts);
           ^~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:207:6: note: Assuming the condition is true
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, flags)) {
               ^
   include/linux/spinlock.h:477:21: note: expanded from macro 'atomic_dec_and_lock_irqsave'
                   __cond_lock(lock, _atomic_dec_and_lock_irqsave(atomic, lock, &(flags)))
                   ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:63:28: note: expanded from macro '__cond_lock'
   # define __cond_lock(x,c) (c)
                              ^
   kernel/ucount.c:207:2: note: Taking true branch
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, flags)) {
           ^
   kernel/ucount.c:208:18: note: Passing null pointer value via 1st parameter 'n'
                   hlist_del_init(&ucounts->node);
                                  ^~~~~~~~~~~~~~
   kernel/ucount.c:208:3: note: Calling 'hlist_del_init'
                   hlist_del_init(&ucounts->node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:926:22: note: Passing null pointer value via 1st parameter 'h'
           if (!hlist_unhashed(n)) {
                               ^
   include/linux/list.h:926:7: note: Calling 'hlist_unhashed'
           if (!hlist_unhashed(n)) {
                ^~~~~~~~~~~~~~~~~
   include/linux/list.h:869:10: note: Access to field 'pprev' results in a dereference of a null pointer (loaded from variable 'h')
           return !h->pprev;
                   ^
   kernel/ucount.c:338:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           do_dec_rlimit_put_ucounts(ucounts, iter, type);
           ^                         ~~~~~~~
   kernel/ucount.c:317:2: note: Loop condition is true.  Entering loop body
           for (iter = ucounts; iter; iter = iter->ns->ucounts) {
           ^
   kernel/ucount.c:319:7: note: Assuming 'new' is >= 0
                   if (new < 0 || new > max)

vim +/alg +311 crypto/ahash.c

66f6ce5e52f2f2 Herbert Xu     2009-07-15  307  
66f6ce5e52f2f2 Herbert Xu     2009-07-15  308  int crypto_ahash_final(struct ahash_request *req)
66f6ce5e52f2f2 Herbert Xu     2009-07-15  309  {
f7d76e05d058b8 Corentin Labbe 2018-11-29  310  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
0e4e6d7094df9e Herbert Xu     2023-02-16 @311  	struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
cac5818c25d042 Corentin Labbe 2018-09-19  312  
0e4e6d7094df9e Herbert Xu     2023-02-16  313  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
0e4e6d7094df9e Herbert Xu     2023-02-16  314  		atomic64_inc(&hash_get_stat(alg)->hash_cnt);
0e4e6d7094df9e Herbert Xu     2023-02-16  315  
0e4e6d7094df9e Herbert Xu     2023-02-16  316  	return crypto_ahash_op(req, tfm->final, true);
66f6ce5e52f2f2 Herbert Xu     2009-07-15  317  }
66f6ce5e52f2f2 Herbert Xu     2009-07-15  318  EXPORT_SYMBOL_GPL(crypto_ahash_final);
66f6ce5e52f2f2 Herbert Xu     2009-07-15  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
