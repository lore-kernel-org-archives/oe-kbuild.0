Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3001386
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 01:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679015573; x=1710551573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3TdoTT7jSGy8guDB9m8KK+FyRyfJhhjpBoliNL16Ek=;
  b=Ifkrak1FWKE2JW3qPyrT8etZ935mIGmIUYrimAGVNcATkhYKyyXxhxCc
   ps05O9LASBP71m+tN0Jvrl1NIup8XYNcTERoCm9fuuMAYo2S7UMrB4z4C
   cI49wlQv8y5Ucr5FwtONKANu/5xB+PPARSeOBZFubJ2vm1zS0GciYGRf+
   eUBN4/ZwS5xMy15Xi3R9W1Jbhogl7GXa7pW/kE6bR5zbFDsVn5xndZMsJ
   m7kDe1nYoe6QHkPoPVFTm6nvYQFvOFy/Jtb2LFwUIYHytof/Zu5Mh7NFW
   9NoFIKx6jrBubMsM17w8Mknzql58qPx6MDpUGW8DgwOgm5MAripZqfBaO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317808877"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="317808877"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 18:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710339678"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="710339678"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 18:12:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcyeH-0008wa-2T;
	Fri, 17 Mar 2023 01:12:49 +0000
Date: Fri, 17 Mar 2023 09:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2399/3406] crypto/skcipher.c:101:30: warning:
 Value stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303170939.l6IY7KIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/skcipher.c:101:30: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 57502b27f098a3911533f6d8b794fe93c1a2ff9b [2399/3406] crypto: skcipher - Count error stats differently
:::::: branch date: 24 hours ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170939.l6IY7KIK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=57502b27f098a3911533f6d8b794fe93c1a2ff9b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 57502b27f098a3911533f6d8b794fe93c1a2ff9b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303170939.l6IY7KIK-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^
   security/keys/keyctl_pkey.c:128:8: note: Returning from 'keyctl_pkey_params_get'
           ret = keyctl_pkey_params_get(uparams.key_id, _info, params);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyctl_pkey.c:129:6: note: 'ret' is >= 0
           if (ret < 0)
               ^~~
   security/keys/keyctl_pkey.c:129:2: note: Taking false branch
           if (ret < 0)
           ^
   security/keys/keyctl_pkey.c:132:8: note: Dereference of null pointer
           ret = params->key->type->asym_query(params, &info);
                 ^~~~~~~~~~~~~~~~~
   security/keys/keyctl_pkey.c:181:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           ret = params.key->type->asym_query(&params, &res);
                 ^~~~~~~~~~~~~~~~
   security/keys/keyctl_pkey.c:177:8: note: Calling 'keyctl_pkey_params_get'
           ret = keyctl_pkey_params_get(id, _info, &params);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyctl_pkey.c:86:2: note: Null pointer value stored to 'params.key'
           memset(params, 0, sizeof(*params));
           ^
   include/linux/fortify-string.h:461:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:453:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:59:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^
   security/keys/keyctl_pkey.c:90:2: note: Taking true branch
           if (IS_ERR(p))
           ^
   security/keys/keyctl_pkey.c:177:8: note: Returning from 'keyctl_pkey_params_get'
           ret = keyctl_pkey_params_get(id, _info, &params);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyctl_pkey.c:178:6: note: 'ret' is >= 0
           if (ret < 0)
               ^~~
   security/keys/keyctl_pkey.c:178:2: note: Taking false branch
           if (ret < 0)
           ^
   security/keys/keyctl_pkey.c:181:8: note: Dereference of null pointer
           ret = params.key->type->asym_query(&params, &res);
                 ^~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   crypto/pcbc.c:74:10: warning: Although the value stored to 'nbytes' is used in the enclosing expression, the value is never actually read from 'nbytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes = walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:74:10: note: Although the value stored to 'nbytes' is used in the enclosing expression, the value is never actually read from 'nbytes'
           while ((nbytes = walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: warning: Although the value stored to 'nbytes' is used in the enclosing expression, the value is never actually read from 'nbytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes = walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: note: Although the value stored to 'nbytes' is used in the enclosing expression, the value is never actually read from 'nbytes'
           while ((nbytes = walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   crypto/aead.c:278:28: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
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
   21 warnings generated.
>> crypto/skcipher.c:101:30: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_cipher *istat = skcipher_get_stat(alg);
                                       ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:101:30: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_cipher *istat = skcipher_get_stat(alg);
                                       ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:147:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
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
   crypto/skcipher.c:581:9: note: Calling 'skcipher_walk_aead_common'
           return skcipher_walk_aead_common(walk, req, atomic);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:533:15: note: Assuming field 'total' is not equal to 0
           if (unlikely(!walk->total))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   crypto/skcipher.c:533:2: note: Taking false branch
           if (unlikely(!walk->total))
           ^
   crypto/skcipher.c:547:6: note: Assuming the condition is false
           if (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:547:2: note: Taking false branch
           if (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP)
           ^
   crypto/skcipher.c:557:8: note: Calling 'skcipher_walk_first'
           err = skcipher_walk_first(walk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:452:6: note: Assuming the condition is true
           if (WARN_ON_ONCE(in_hardirq()))
               ^
   include/asm-generic/bug.h:180:33: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                ^~~~~~~~~~~~
   crypto/skcipher.c:452:2: note: Taking false branch
           if (WARN_ON_ONCE(in_hardirq()))
           ^
   crypto/skcipher.c:456:6: note: Assuming the condition is false
           if (unlikely(((unsigned long)walk->iv & walk->alignmask))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   crypto/skcipher.c:456:2: note: Taking true branch
           if (unlikely(((unsigned long)walk->iv & walk->alignmask))) {
           ^
   crypto/skcipher.c:457:13: note: Calling 'skcipher_copy_iv'
                   int err = skcipher_copy_iv(walk);
                             ^~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:430:6: note: Assuming the condition is false
           if (walk->flags & SKCIPHER_WALK_PHYS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:430:2: note: Taking false branch
           if (walk->flags & SKCIPHER_WALK_PHYS)
           ^
   crypto/skcipher.c:440:6: note: Assuming field 'buffer' is non-null
           if (!walk->buffer)
               ^~~~~~~~~~~~~
   crypto/skcipher.c:440:2: note: Taking false branch
           if (!walk->buffer)
           ^
   crypto/skcipher.c:446:13: note: Taking false branch
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
   crypto/skcipher.c:447:2: note: Returning zero, which participates in a condition later
           return 0;
           ^~~~~~~~
   crypto/skcipher.c:457:13: note: Returning from 'skcipher_copy_iv'
                   int err = skcipher_copy_iv(walk);
                             ^~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:458:7: note: 'err' is 0

vim +/istat +101 crypto/skcipher.c

57502b27f098a3 Herbert Xu 2023-02-16   98  
57502b27f098a3 Herbert Xu 2023-02-16   99  static inline int crypto_skcipher_errstat(struct skcipher_alg *alg, int err)
57502b27f098a3 Herbert Xu 2023-02-16  100  {
57502b27f098a3 Herbert Xu 2023-02-16 @101  	struct crypto_istat_cipher *istat = skcipher_get_stat(alg);
57502b27f098a3 Herbert Xu 2023-02-16  102  
57502b27f098a3 Herbert Xu 2023-02-16  103  	if (!IS_ENABLED(CONFIG_CRYPTO_STATS))
57502b27f098a3 Herbert Xu 2023-02-16  104  		return err;
57502b27f098a3 Herbert Xu 2023-02-16  105  
57502b27f098a3 Herbert Xu 2023-02-16  106  	if (err && err != -EINPROGRESS && err != -EBUSY)
57502b27f098a3 Herbert Xu 2023-02-16  107  		atomic64_inc(&istat->err_cnt);
57502b27f098a3 Herbert Xu 2023-02-16  108  
57502b27f098a3 Herbert Xu 2023-02-16  109  	return err;
57502b27f098a3 Herbert Xu 2023-02-16  110  }
57502b27f098a3 Herbert Xu 2023-02-16  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
