Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DAF197
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 22:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678833175; x=1710369175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GLVKO1euIsmdGQ6I+/QBNlGE8lFLAkX/jOO9Qvri0Q=;
  b=Rtu9+SNZ+jBB14mVuMOVSwhOq3SmGrx/U/dx5WjydtLAjHmrMvU3NSw4
   A8LJj5ZnyDS1qtkSacCfZjCn0aNIUfH7+93n+DCweUMGFMmaiBCJI9D2Q
   UZGVI/IqUNw6DeYp6P7uBTNwYO3o3S6JZ0L+Fr+PwoEqWcG2LJCSwI84i
   trLCM95ai65YKYunRJ+bY9q1CKynt7LI5lQmF1DNV00r8mLOhnWT2ZH10
   eTmA7rKp2m/bMWV2yVOh2JlpkjKcjNu3g6ukqCzeYgDTnG63b/sg2xdgx
   BTO4S8s+B4oFL7SvNDXEU3rlPJe1yl7N1tIa0IMj//59Wts5c64GBCGm1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="423830616"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="423830616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 15:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="748176669"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="748176669"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Mar 2023 15:32:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcDCP-0007EZ-0O;
	Tue, 14 Mar 2023 22:32:53 +0000
Date: Wed, 15 Mar 2023 06:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2394/3406] crypto/aead.c:278:28: warning: Value
 stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303150633.D0zNcenu-lkp@intel.com>
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
head:   ec0fa9a0a6fac454745c930bdb8619d0a354bac9
commit: 7c3e825ecb87c601de9f647bf9229f06094ecc00 [2394/3406] crypto: aead - Count error stats differently
:::::: branch date: 19 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20230310 (https://download.01.org/0day-ci/archive/20230315/202303150633.D0zNcenu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7c3e825ecb87c601de9f647bf9229f06094ecc00
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7c3e825ecb87c601de9f647bf9229f06094ecc00
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303150633.D0zNcenu-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   #define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
                     ^
   fs/jffs2/os-linux.h:34:40: note: expanded from macro 'JFFS2_CLAMP_TIME'
   #define JFFS2_CLAMP_TIME(t) ((uint32_t)clamp_t(time64_t, (t), 0, U32_MAX))
                                          ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^
   include/linux/minmax.h:41:3: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
            ^
   fs/jffs2/nodelist.h:37:36: note: expanded from macro 'cpu_to_je32'
   #define cpu_to_je32(x) ((jint32_t){x})
                                      ^
   fs/jffs2/gc.c:826:25: note: '?' condition is true
           ri.mtime = cpu_to_je32(JFFS2_F_I_MTIME(f));
                                  ^
   fs/jffs2/os-linux.h:39:28: note: expanded from macro 'JFFS2_F_I_MTIME'
   #define JFFS2_F_I_MTIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_mtime)
                              ^
   fs/jffs2/os-linux.h:37:19: note: expanded from macro 'I_SEC'
   #define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
                     ^
   fs/jffs2/os-linux.h:34:40: note: expanded from macro 'JFFS2_CLAMP_TIME'
   #define JFFS2_CLAMP_TIME(t) ((uint32_t)clamp_t(time64_t, (t), 0, U32_MAX))
                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^
   include/linux/minmax.h:41:3: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
            ^
   fs/jffs2/gc.c:836:2: note: Taking false branch
           if (IS_ERR(new_fn)) {
           ^
   fs/jffs2/gc.c:845:6: note: Assuming the condition is true
           if (S_ISLNK(JFFS2_F_I_MODE(f)))
               ^
   include/uapi/linux/stat.h:21:21: note: expanded from macro 'S_ISLNK'
   #define S_ISLNK(m)      (((m) & S_IFMT) == S_IFLNK)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:845:2: note: Taking true branch
           if (S_ISLNK(JFFS2_F_I_MODE(f)))
           ^
   fs/jffs2/gc.c:846:3: note: Argument to kfree() is the address of the local variable 'dev', which is not memory allocated by malloc()
                   kfree(mdata);
                   ^     ~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
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
   Suppressed 6 warnings (6 in non-user code).
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
   8 warnings generated.
>> crypto/aead.c:278:28: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_aead *istat = aead_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   crypto/aead.c:278:28: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_aead *istat = aead_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   crypto/skcipher.c:115:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(walk->dst.virt.addr, walk->page, n);
                   ^
   crypto/skcipher.c:549:9: note: Calling 'skcipher_walk_aead_common'
           return skcipher_walk_aead_common(walk, req, atomic);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:501:15: note: Assuming field 'total' is not equal to 0
           if (unlikely(!walk->total))
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   crypto/skcipher.c:501:22: note: Field 'total' is not equal to 0
           if (unlikely(!walk->total))
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
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
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
   crypto/skcipher.c:415:2: note: Returning zero, which participates in a condition later
           return 0;
           ^~~~~~~~
   crypto/skcipher.c:425:13: note: Returning from 'skcipher_copy_iv'
                   int err = skcipher_copy_iv(walk);
                             ^~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:426:7: note: 'err' is 0
                   if (err)
                       ^~~
   crypto/skcipher.c:426:3: note: Taking false branch
                   if (err)
                   ^
   crypto/skcipher.c:430:2: note: Null pointer value stored to field 'page'
           walk->page = NULL;
           ^~~~~~~~~~~~~~~~~
   crypto/skcipher.c:432:9: note: Calling 'skcipher_walk_next'
           return skcipher_walk_next(walk);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:340:28: note: Assuming '__UNIQUE_ID___x354' is <= '__UNIQUE_ID___y355'
           bsize = min(walk->stride, max(n, walk->blocksize));

vim +/istat +278 crypto/aead.c

d29ce988aeb4592 Herbert Xu 2007-12-12  275  
63293c611334472 Herbert Xu 2015-05-21  276  static int aead_prepare_alg(struct aead_alg *alg)
63293c611334472 Herbert Xu 2015-05-21  277  {
7c3e825ecb87c60 Herbert Xu 2023-02-16 @278  	struct crypto_istat_aead *istat = aead_get_stat(alg);
63293c611334472 Herbert Xu 2015-05-21  279  	struct crypto_alg *base = &alg->base;
63293c611334472 Herbert Xu 2015-05-21  280  
7a530aa9cf3f282 Herbert Xu 2016-07-12  281  	if (max3(alg->maxauthsize, alg->ivsize, alg->chunksize) >
7a530aa9cf3f282 Herbert Xu 2016-07-12  282  	    PAGE_SIZE / 8)
63293c611334472 Herbert Xu 2015-05-21  283  		return -EINVAL;
63293c611334472 Herbert Xu 2015-05-21  284  
7a530aa9cf3f282 Herbert Xu 2016-07-12  285  	if (!alg->chunksize)
7a530aa9cf3f282 Herbert Xu 2016-07-12  286  		alg->chunksize = base->cra_blocksize;
7a530aa9cf3f282 Herbert Xu 2016-07-12  287  
b0d955ba4688fcb Herbert Xu 2015-08-14  288  	base->cra_type = &crypto_aead_type;
63293c611334472 Herbert Xu 2015-05-21  289  	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
63293c611334472 Herbert Xu 2015-05-21  290  	base->cra_flags |= CRYPTO_ALG_TYPE_AEAD;
63293c611334472 Herbert Xu 2015-05-21  291  
7c3e825ecb87c60 Herbert Xu 2023-02-16  292  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
7c3e825ecb87c60 Herbert Xu 2023-02-16  293  		memset(istat, 0, sizeof(*istat));
7c3e825ecb87c60 Herbert Xu 2023-02-16  294  
63293c611334472 Herbert Xu 2015-05-21  295  	return 0;
63293c611334472 Herbert Xu 2015-05-21  296  }
63293c611334472 Herbert Xu 2015-05-21  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
