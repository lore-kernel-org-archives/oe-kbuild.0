Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B028EA
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678877453; x=1710413453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WigwdiAKzKBweGLkvnTSMxWRRxu6ZKgdv2f1evzn5Dk=;
  b=HV9c0ODJqGzBVBaJnLEFhDq2dUYphEzTa9N/qXI39YyW/mHBTK9gzksp
   60wHUoRrNSYDjhwB/giDADK40vbTuDBzLiJVng1U6TGyK6bOzDi61bvT5
   SBS2vIqVbSPunzpGRVnlH7GTFzJ+CFXFjoRj+Rjs7RPH76xBta+FrYa3j
   YV//0j8vSmeiXy9/JJVYSSt8Ubv4MVduNlJ2q59Uy765KlFCmMxAFAhIZ
   kIJA8LBWEKHz/K05r1DUr3Y2hv4dxjmTpjZ/Im4NIkt3lEiiBLTE+rNXh
   Hiheex1KovQbsQOYCkKGsj/ImM4zDrn+j/r8WhDmj7QQbDvqZvUv9od/7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336358287"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="336358287"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 03:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768446127"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="768446127"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2023 03:50:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcOiR-0007ca-0y;
	Wed, 15 Mar 2023 10:50:43 +0000
Date: Wed, 15 Mar 2023 18:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2395/3406] crypto/akcipher.c:135:32: warning:
 Value stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303151857.zyV9ituS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/akcipher.c:135:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   225b6b81afe63b3850b7cee0a3590f51144f2a75
commit: 49be9316310d89c790d13979ea727d32e2fd3ec4 [2395/3406] crypto: akcipher - Count error stats differently
:::::: branch date: 9 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20230310 (https://download.01.org/0day-ci/archive/20230315/202303151857.zyV9ituS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=49be9316310d89c790d13979ea727d32e2fd3ec4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 49be9316310d89c790d13979ea727d32e2fd3ec4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303151857.zyV9ituS-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/rcupdate.h:418:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   fs/affs/super.c:198:16: note: Loop condition is false.  Exiting loop
           *uid        = current_uid();
                         ^
   include/linux/cred.h:381:25: note: expanded from macro 'current_uid'
   #define current_uid()           (current_cred_xxx(uid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:673:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:469:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:418:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   fs/affs/super.c:199:16: note: Left side of '&&' is false
           *gid        = current_gid();
                         ^
   include/linux/cred.h:382:25: note: expanded from macro 'current_gid'
   #define current_gid()           (current_cred_xxx(gid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:673:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:469:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:418:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   fs/affs/super.c:199:16: note: Loop condition is false.  Exiting loop
           *gid        = current_gid();
                         ^
   include/linux/cred.h:382:25: note: expanded from macro 'current_gid'
   #define current_gid()           (current_cred_xxx(gid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:673:2: note: expanded from macro 'rcu_dereference_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:469:2: note: expanded from macro '__rcu_dereference_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
           ^
   include/linux/rcupdate.h:418:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   fs/affs/super.c:206:6: note: Assuming 'options' is null
           if (!options)
               ^~~~~~~~
   fs/affs/super.c:206:2: note: Taking true branch
           if (!options)
           ^
   fs/affs/super.c:207:3: note: Returning without writing to '*mode'
                   return 1;
                   ^
   fs/affs/super.c:573:7: note: Returning from 'parse_options'
           if (!parse_options(data, &uid, &gid, &mode, &reserved, &root_block,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/super.c:573:2: note: Taking false branch
           if (!parse_options(data, &uid, &gid, &mode, &reserved, &root_block,
           ^
   fs/affs/super.c:583:15: note: Assigned value is garbage or undefined
           sbi->s_mode  = mode;
                        ^ ~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
>> crypto/akcipher.c:135:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   crypto/akcipher.c:135:32: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   crypto/dh.c:467:6: note: Assuming 'buffer' is null
           if (buffer) {
               ^~~~~~
   crypto/dh.c:467:2: note: Taking false branch
           if (buffer) {
           ^
   crypto/dh.c:480:14: note: Field 'key_size' is 0
           if (!params.key_size) {
                       ^
   crypto/dh.c:480:2: note: Taking true branch
           if (!params.key_size) {
           ^
   crypto/dh.c:481:9: note: Calling 'dh_safe_prime_gen_privkey'
                   key = dh_safe_prime_gen_privkey(inst_ctx->safe_prime,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/dh.c:373:6: note: '?' condition is false
           n = roundup_pow_of_two(2 * safe_prime->max_strength);
               ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   crypto/dh.c:373:6: note: Calling '__roundup_pow_of_two'
           n = roundup_pow_of_two(2 * safe_prime->max_strength);
               ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_two'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:205:2: note: Taking true branch
           if (sizeof(l) == 4)
           ^
   include/linux/bitops.h:206:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r = 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal to 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is false
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is false
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is false
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is false
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is false
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loaded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:206:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:206:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);

vim +/istat +135 crypto/akcipher.c

3c339ab83fc09d Tadeusz Struk      2015-06-16  132  
28a4618ad14cf1 Andrzej Zaborowski 2015-12-05  133  static void akcipher_prepare_alg(struct akcipher_alg *alg)
3c339ab83fc09d Tadeusz Struk      2015-06-16  134  {
49be9316310d89 Herbert Xu         2023-02-16 @135  	struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
3c339ab83fc09d Tadeusz Struk      2015-06-16  136  	struct crypto_alg *base = &alg->base;
3c339ab83fc09d Tadeusz Struk      2015-06-16  137  
3c339ab83fc09d Tadeusz Struk      2015-06-16  138  	base->cra_type = &crypto_akcipher_type;
3c339ab83fc09d Tadeusz Struk      2015-06-16  139  	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
3c339ab83fc09d Tadeusz Struk      2015-06-16  140  	base->cra_flags |= CRYPTO_ALG_TYPE_AKCIPHER;
49be9316310d89 Herbert Xu         2023-02-16  141  
49be9316310d89 Herbert Xu         2023-02-16  142  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
49be9316310d89 Herbert Xu         2023-02-16  143  		memset(istat, 0, sizeof(*istat));
28a4618ad14cf1 Andrzej Zaborowski 2015-12-05  144  }
28a4618ad14cf1 Andrzej Zaborowski 2015-12-05  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
