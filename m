Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E15669
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678900142; x=1710436142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/cV6SaYno/z60vU3JqDg3/2cLUmoEzG0OX5WoxHKNg=;
  b=YMOyUregz2QvbYO9NUFJOkCF2rM12FYFnlkcSmJzW7BsX2mJ0teyNCRb
   al0xrIcXB701Bh2923bpscIX5PXq5Y/2vxcpbRORLgFErCedRd8tdeFbZ
   YQHoJnwaV7hSK9M1837AkOMIMhifeJ2kJHmy8xECAirPAl1im1jaKp2HD
   dNK14oRNF7oJRASdjMB3knuvHXmbKOyXaQl3Ys+GPj7yu2K/UYa5DDuyc
   xptcASEfCoaM0kyt5Yk+jLUy9LBntzpAr1ahPq1/uEz94JNrdQk2Efjwg
   93xWJ4Q8kL21QG8fcKEpvhlHTfp/j4lyRvuBDt22gUuisQThAX3wj7NkA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424039057"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="424039057"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 10:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="822876087"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="822876087"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2023 10:09:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcUcV-0007ud-2U;
	Wed, 15 Mar 2023 17:08:59 +0000
Date: Thu, 16 Mar 2023 01:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2394/3406] crypto/aead.c:278:28: warning: Value
 stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303160117.AI1JKUyx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/aead.c:278:28: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   225b6b81afe63b3850b7cee0a3590f51144f2a75
commit: 7c3e825ecb87c601de9f647bf9229f06094ecc00 [2394/3406] crypto: aead - Count error stats differently
:::::: branch date: 15 hours ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160117.AI1JKUyx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7c3e825ecb87c601de9f647bf9229f06094ecc00
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7c3e825ecb87c601de9f647bf9229f06094ecc00
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303160117.AI1JKUyx-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   crypto/ecc.c:1303:2: note: Calling 'xycz_initial_double'
           xycz_initial_double(rx[1], ry[1], rx[0], ry[0], initial_z, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1168:6: note: 'p_initial_z' is non-null
           if (p_initial_z)
               ^~~~~~~~~~~
   crypto/ecc.c:1168:2: note: Taking true branch
           if (p_initial_z)
           ^
   crypto/ecc.c:1173:2: note: Calling 'ecc_point_double_jacobian'
           ecc_point_double_jacobian(x1, y1, z, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1089:6: note: Assuming the condition is false
           if (vli_is_zero(z1, ndigits))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1089:2: note: Taking false branch
           if (vli_is_zero(z1, ndigits))
           ^
   crypto/ecc.c:1093:2: note: Calling 'vli_mod_square_fast'
           vli_mod_square_fast(t4, y1, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:982:2: note: Calling 'vli_mmod_fast'
           vli_mmod_fast(result, product, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:918:2: note: Taking false branch
           if (strncmp(curve->name, "nist_", 5) != 0) {
           ^
   crypto/ecc.c:934:2: note: Control jumps to the 'default' case at line 944
           switch (ndigits) {
           ^
   crypto/ecc.c:945:3: note: Assuming the condition is false
                   pr_err_ratelimited("ecc: unsupported digits size!\n");
                   ^
   include/linux/printk.h:663:2: note: expanded from macro 'pr_err_ratelimited'
           printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:648:6: note: expanded from macro 'printk_ratelimited'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:45:28: note: expanded from macro '__ratelimit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:945:3: note: Taking false branch
                   pr_err_ratelimited("ecc: unsupported digits size!\n");
                   ^
   include/linux/printk.h:663:2: note: expanded from macro 'pr_err_ratelimited'
           printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:648:2: note: expanded from macro 'printk_ratelimited'
           if (__ratelimit(&_rs))                                          \
           ^
   crypto/ecc.c:946:3: note: Returning without writing to '*result'
                   return false;
                   ^
   crypto/ecc.c:982:2: note: Returning from 'vli_mmod_fast'
           vli_mmod_fast(result, product, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:983:1: note: Returning without writing to '*result'
   }
   ^
   crypto/ecc.c:1093:2: note: Returning from 'vli_mod_square_fast'
           vli_mod_square_fast(t4, y1, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1097:2: note: Calling 'vli_mod_square_fast'
           vli_mod_square_fast(t4, t4, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:981:2: note: Calling 'vli_square'
           vli_square(product, left, curve->g.ndigits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:455:14: note: Assuming the condition is true
           for (k = 0; k < ndigits * 2 - 1; k++) {
                       ^~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:455:2: note: Loop condition is true.  Entering loop body
           for (k = 0; k < ndigits * 2 - 1; k++) {
           ^
   crypto/ecc.c:458:7: note: Assuming 'k' is < 'ndigits'
                   if (k < ndigits)
                       ^~~~~~~~~~~
   crypto/ecc.c:458:3: note: Taking true branch
                   if (k < ndigits)
                   ^
   crypto/ecc.c:459:4: note: The value 0 is assigned to 'min'
                           min = 0;
                           ^~~~~~~
   crypto/ecc.c:463:8: note: The value 0 is assigned to 'i'
                   for (i = min; i <= k && i <= k - i; i++) {
                        ^~~~~~~
   crypto/ecc.c:463:17: note: 'i' is <= 'k'
                   for (i = min; i <= k && i <= k - i; i++) {
                                 ^
   crypto/ecc.c:463:17: note: Left side of '&&' is true
   crypto/ecc.c:463:3: note: Loop condition is true.  Entering loop body
                   for (i = min; i <= k && i <= k - i; i++) {
                   ^
   crypto/ecc.c:466:14: note: 1st function call argument is an uninitialized value
                           product = mul_64_64(left[i], left[k - i]);
                                     ^         ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
>> crypto/aead.c:278:28: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_aead *istat = aead_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   crypto/aead.c:278:28: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_aead *istat = aead_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   crypto/skcipher.c:115:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(walk->dst.virt.addr, walk->page, n);
                   ^
   include/linux/fortify-string.h:630:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:585:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^
   note: expanded from here
   include/linux/fortify-string.h:57:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   crypto/skcipher.c:549:9: note: Calling 'skcipher_walk_aead_common'
           return skcipher_walk_aead_common(walk, req, atomic);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:501:15: note: Assuming field 'total' is not equal to 0
           if (unlikely(!walk->total))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   crypto/skcipher.c:501:2: note: Taking false branch
           if (unlikely(!walk->total))
           ^
   crypto/skcipher.c:515:6: note: Assuming the condition is false
           if (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:515:2: note: Taking false branch
           if (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP)
           ^
   crypto/skcipher.c:525:8: note: Calling 'skcipher_walk_first'
           err = skcipher_walk_first(walk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:420:6: note: Assuming the condition is true
           if (WARN_ON_ONCE(in_hardirq()))
               ^
   include/asm-generic/bug.h:180:33: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                ^~~~~~~~~~~~
   crypto/skcipher.c:420:2: note: Taking false branch
           if (WARN_ON_ONCE(in_hardirq()))
           ^
   crypto/skcipher.c:424:6: note: Assuming the condition is false
           if (unlikely(((unsigned long)walk->iv & walk->alignmask))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   crypto/skcipher.c:424:2: note: Taking true branch
           if (unlikely(((unsigned long)walk->iv & walk->alignmask))) {
           ^
   crypto/skcipher.c:425:13: note: Calling 'skcipher_copy_iv'
                   int err = skcipher_copy_iv(walk);
                             ^~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:398:6: note: Assuming the condition is false
           if (walk->flags & SKCIPHER_WALK_PHYS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:398:2: note: Taking false branch
           if (walk->flags & SKCIPHER_WALK_PHYS)
           ^
   crypto/skcipher.c:408:6: note: Assuming field 'buffer' is non-null
           if (!walk->buffer)
               ^~~~~~~~~~~~~
   crypto/skcipher.c:408:2: note: Taking false branch
           if (!walk->buffer)
           ^
   crypto/skcipher.c:414:13: note: Taking false branch
           walk->iv = memcpy(iv, walk->iv, walk->ivsize);
                      ^
   include/linux/fortify-string.h:630:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:181:41: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                           ^
   include/asm-generic/bug.h:175:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:128:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   crypto/skcipher.c:415:2: note: Returning zero, which participates in a condition later

vim +/istat +278 crypto/aead.c

d29ce988aeb459 Herbert Xu 2007-12-12  275  
63293c61133447 Herbert Xu 2015-05-21  276  static int aead_prepare_alg(struct aead_alg *alg)
63293c61133447 Herbert Xu 2015-05-21  277  {
7c3e825ecb87c6 Herbert Xu 2023-02-16 @278  	struct crypto_istat_aead *istat = aead_get_stat(alg);
63293c61133447 Herbert Xu 2015-05-21  279  	struct crypto_alg *base = &alg->base;
63293c61133447 Herbert Xu 2015-05-21  280  
7a530aa9cf3f28 Herbert Xu 2016-07-12  281  	if (max3(alg->maxauthsize, alg->ivsize, alg->chunksize) >
7a530aa9cf3f28 Herbert Xu 2016-07-12  282  	    PAGE_SIZE / 8)
63293c61133447 Herbert Xu 2015-05-21  283  		return -EINVAL;
63293c61133447 Herbert Xu 2015-05-21  284  
7a530aa9cf3f28 Herbert Xu 2016-07-12  285  	if (!alg->chunksize)
7a530aa9cf3f28 Herbert Xu 2016-07-12  286  		alg->chunksize = base->cra_blocksize;
7a530aa9cf3f28 Herbert Xu 2016-07-12  287  
b0d955ba4688fc Herbert Xu 2015-08-14  288  	base->cra_type = &crypto_aead_type;
63293c61133447 Herbert Xu 2015-05-21  289  	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
63293c61133447 Herbert Xu 2015-05-21  290  	base->cra_flags |= CRYPTO_ALG_TYPE_AEAD;
63293c61133447 Herbert Xu 2015-05-21  291  
7c3e825ecb87c6 Herbert Xu 2023-02-16  292  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
7c3e825ecb87c6 Herbert Xu 2023-02-16  293  		memset(istat, 0, sizeof(*istat));
7c3e825ecb87c6 Herbert Xu 2023-02-16  294  
63293c61133447 Herbert Xu 2015-05-21  295  	return 0;
63293c61133447 Herbert Xu 2015-05-21  296  }
63293c61133447 Herbert Xu 2015-05-21  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
