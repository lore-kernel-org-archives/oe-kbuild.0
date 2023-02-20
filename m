Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F96D39
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676907582; x=1708443582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ap/0p1/NR+qUX34yDha8Oj/xgqEGUllKUayWBaoy8lc=;
  b=M+8SFwwOKoS/DMuq7gcbxsdrI+z1SXtqBIT4JIArPd5C4ZOt3oOIPlsm
   8sHEpTLwNG7lk42zwJfqdVZxPb3IEkQ74H6Pxjv+oSTQSf1XT55aFhfHh
   6nQYuR4+A+afE1Mwc1KPa5WDT/en/GOWWpzAuGbld/8muKGHsnGkGMIDR
   NAtsZck3FcMHuglILaUqCEuDfLir+uiOsBt5wgB8EeC6qDDBTDQIv0hYt
   NJZbT+LOP1VFbAbuU0yBBO3cT/e4Z2P9DR+ao2YMxVDqZqgOu/3rtO4sf
   IE6BQHEhDYivyw639WccTDi5u1TUJ1yQLHzY3uvl+W45mJuJW9HOfpJF5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="359895606"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="359895606"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 07:39:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="648858922"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="648858922"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Feb 2023 07:39:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU8G8-000E1d-2B;
	Mon, 20 Feb 2023 15:39:20 +0000
Date: Mon, 20 Feb 2023 23:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 07/12] tpm: Add full HMAC and encrypt/decrypt session
 handling code
Message-ID: <202302202332.f7zvqTEp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/char/tpm/tpm2-sessions.c:381:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230216201410.15010-8-James.Bottomley@HansenPartnership.com>
References: <20230216201410.15010-8-James.Bottomley@HansenPartnership.com>
TO: James Bottomley <James.Bottomley@HansenPartnership.com>
TO: linux-integrity@vger.kernel.org
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: keyrings@vger.kernel.org
CC: Ard Biesheuvel <ardb@kernel.org>

Hi James,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.2 next-20230220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Bottomley/crypto-lib-implement-library-version-of-AES-in-CFB-mode/20230217-044329
patch link:    https://lore.kernel.org/r/20230216201410.15010-8-James.Bottomley%40HansenPartnership.com
patch subject: [PATCH 07/12] tpm: Add full HMAC and encrypt/decrypt session handling code
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-c004-20230217 (https://download.01.org/0day-ci/archive/20230220/202302202332.f7zvqTEp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1d4f519aa756ba5ed684fb2a2f9ad6e1fb91bdb5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review James-Bottomley/crypto-lib-implement-library-version-of-AES-in-CFB-mode/20230217-044329
        git checkout 1d4f519aa756ba5ed684fb2a2f9ad6e1fb91bdb5
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302202332.f7zvqTEp-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:409:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   arch/mips/include/asm/bitops.h:413:6: note: Assuming the condition is false
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:413:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:417:6: note: Assuming the condition is false
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:417:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:421:6: note: Assuming the condition is false
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:421:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   arch/mips/include/asm/bitops.h:425:2: note: Returning the value 32 (loaded from 'r')
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
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/char/tpm/tpm2-sessions.c:381:3: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^                       ~
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:57:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   drivers/char/tpm/tpm2-sessions.c:374:9: note: Assuming 'passphrase' is null
           while (passphrase && passphraselen > 0
                  ^~~~~~~~~~
   drivers/char/tpm/tpm2-sessions.c:374:20: note: Left side of '&&' is false
           while (passphrase && passphraselen > 0
                             ^
   drivers/char/tpm/tpm2-sessions.c:380:6: note: Assuming 'passphraselen' is not equal to 0
           if (passphraselen)
               ^~~~~~~~~~~~~
   drivers/char/tpm/tpm2-sessions.c:380:2: note: Taking true branch
           if (passphraselen)
           ^
   drivers/char/tpm/tpm2-sessions.c:381:3: note: Taking false branch
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:181:41: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                           ^
   include/asm-generic/bug.h:175:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/char/tpm/tpm2-sessions.c:381:3: note: Null pointer passed as 2nd argument to memory copy function
                   memcpy(auth->passphrase, passphrase, passphraselen);
                   ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^                       ~
   include/linux/fortify-string.h:578:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:57:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
>> drivers/char/tpm/tpm2-sessions.c:734:2: warning: Value stored to 'attrs' is never read [clang-analyzer-deadcode.DeadStores]
           attrs = *s++;
           ^       ~~~~
   drivers/char/tpm/tpm2-sessions.c:734:2: note: Value stored to 'attrs' is never read
           attrs = *s++;
           ^       ~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/char/tpm/tpm_tis_core.c:249:21: warning: The left operand of '>>' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   burstcnt = (value >> 8) & 0xFFFF;
                                     ^
   drivers/char/tpm/tpm_tis_core.c:953:2: note: Taking false branch
           if (IS_ERR(chip))
           ^
   drivers/char/tpm/tpm_tis_core.c:963:37: note: TIS_SHORT_TIMEOUT is <= TPM2_TIMEOUT_A
           chip->timeout_a = msecs_to_jiffies(TIS_TIMEOUT_A_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:64:27: note: expanded from macro 'TIS_TIMEOUT_A_MAX'
   #define TIS_TIMEOUT_A_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEOUT_A)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:134:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:963:37: note: '?' condition is false
           chip->timeout_a = msecs_to_jiffies(TIS_TIMEOUT_A_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:64:27: note: expanded from macro 'TIS_TIMEOUT_A_MAX'
   #define TIS_TIMEOUT_A_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEOUT_A)
                                   ^
   include/linux/minmax.h:134:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/tpm/tpm_tis_core.c:964:37: note: TIS_LONG_TIMEOUT is <= TPM2_TIMEOUT_B
           chip->timeout_b = msecs_to_jiffies(TIS_TIMEOUT_B_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:65:27: note: expanded from macro 'TIS_TIMEOUT_B_MAX'
   #define TIS_TIMEOUT_B_MAX       max_t(int, TIS_LONG_TIMEOUT, TPM2_TIMEOUT_B)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:134:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:964:37: note: '?' condition is false
           chip->timeout_b = msecs_to_jiffies(TIS_TIMEOUT_B_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:65:27: note: expanded from macro 'TIS_TIMEOUT_B_MAX'
   #define TIS_TIMEOUT_B_MAX       max_t(int, TIS_LONG_TIMEOUT, TPM2_TIMEOUT_B)
                                   ^
   include/linux/minmax.h:134:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/tpm/tpm_tis_core.c:965:37: note: TIS_SHORT_TIMEOUT is > TPM2_TIMEOUT_C
           chip->timeout_c = msecs_to_jiffies(TIS_TIMEOUT_C_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:66:27: note: expanded from macro 'TIS_TIMEOUT_C_MAX'
   #define TIS_TIMEOUT_C_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEOUT_C)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:134:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:965:37: note: '?' condition is true
           chip->timeout_c = msecs_to_jiffies(TIS_TIMEOUT_C_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:66:27: note: expanded from macro 'TIS_TIMEOUT_C_MAX'
   #define TIS_TIMEOUT_C_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEOUT_C)
                                   ^
   include/linux/minmax.h:134:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \

vim +381 drivers/char/tpm/tpm2-sessions.c

1d4f519aa756ba James Bottomley 2023-02-16  335  
1d4f519aa756ba James Bottomley 2023-02-16  336  /**
1d4f519aa756ba James Bottomley 2023-02-16  337   * tpm_buf_append_hmac_session() append a TPM session element
1d4f519aa756ba James Bottomley 2023-02-16  338   * @chip: the TPM chip structure
1d4f519aa756ba James Bottomley 2023-02-16  339   * @buf: The buffer to be appended
1d4f519aa756ba James Bottomley 2023-02-16  340   * @attributes: The session attributes
1d4f519aa756ba James Bottomley 2023-02-16  341   * @passphrase: The session authority (NULL if none)
1d4f519aa756ba James Bottomley 2023-02-16  342   * @passphraselen: The length of the session authority (0 if none)
1d4f519aa756ba James Bottomley 2023-02-16  343   *
1d4f519aa756ba James Bottomley 2023-02-16  344   * This fills in a session structure in the TPM command buffer, except
1d4f519aa756ba James Bottomley 2023-02-16  345   * for the HMAC which cannot be computed until the command buffer is
1d4f519aa756ba James Bottomley 2023-02-16  346   * complete.  The type of session is controlled by the @attributes,
1d4f519aa756ba James Bottomley 2023-02-16  347   * the main ones of which are TPM2_SA_CONTINUE_SESSION which means the
1d4f519aa756ba James Bottomley 2023-02-16  348   * session won't terminate after tpm_buf_check_hmac_response(),
1d4f519aa756ba James Bottomley 2023-02-16  349   * TPM2_SA_DECRYPT which means this buffers first parameter should be
1d4f519aa756ba James Bottomley 2023-02-16  350   * encrypted with a session key and TPM2_SA_ENCRYPT, which means the
1d4f519aa756ba James Bottomley 2023-02-16  351   * response buffer's first parameter needs to be decrypted (confusing,
1d4f519aa756ba James Bottomley 2023-02-16  352   * but the defines are written from the point of view of the TPM).
1d4f519aa756ba James Bottomley 2023-02-16  353   *
1d4f519aa756ba James Bottomley 2023-02-16  354   * Any session appended by this command must be finalized by calling
1d4f519aa756ba James Bottomley 2023-02-16  355   * tpm_buf_fill_hmac_session() otherwise the HMAC will be incorrect
1d4f519aa756ba James Bottomley 2023-02-16  356   * and the TPM will reject the command.
1d4f519aa756ba James Bottomley 2023-02-16  357   *
1d4f519aa756ba James Bottomley 2023-02-16  358   * As with most tpm_buf operations, success is assumed because failure
1d4f519aa756ba James Bottomley 2023-02-16  359   * will be caused by an incorrect programming model and indicated by a
1d4f519aa756ba James Bottomley 2023-02-16  360   * kernel message.
1d4f519aa756ba James Bottomley 2023-02-16  361   */
1d4f519aa756ba James Bottomley 2023-02-16  362  void tpm_buf_append_hmac_session(struct tpm_chip *chip, struct tpm_buf *buf,
1d4f519aa756ba James Bottomley 2023-02-16  363  				 u8 attributes, u8 *passphrase,
1d4f519aa756ba James Bottomley 2023-02-16  364  				 int passphraselen)
1d4f519aa756ba James Bottomley 2023-02-16  365  {
1d4f519aa756ba James Bottomley 2023-02-16  366  	u8 nonce[SHA256_DIGEST_SIZE];
1d4f519aa756ba James Bottomley 2023-02-16  367  	u32 len;
1d4f519aa756ba James Bottomley 2023-02-16  368  	struct tpm2_auth *auth = chip->auth;
1d4f519aa756ba James Bottomley 2023-02-16  369  
1d4f519aa756ba James Bottomley 2023-02-16  370  	/*
1d4f519aa756ba James Bottomley 2023-02-16  371  	 * The Architecture Guide requires us to strip trailing zeros
1d4f519aa756ba James Bottomley 2023-02-16  372  	 * before computing the HMAC
1d4f519aa756ba James Bottomley 2023-02-16  373  	 */
1d4f519aa756ba James Bottomley 2023-02-16  374  	while (passphrase && passphraselen > 0
1d4f519aa756ba James Bottomley 2023-02-16  375  	       && passphrase[passphraselen - 1] == '\0')
1d4f519aa756ba James Bottomley 2023-02-16  376  		passphraselen--;
1d4f519aa756ba James Bottomley 2023-02-16  377  
1d4f519aa756ba James Bottomley 2023-02-16  378  	auth->attrs = attributes;
1d4f519aa756ba James Bottomley 2023-02-16  379  	auth->passphraselen = passphraselen;
1d4f519aa756ba James Bottomley 2023-02-16  380  	if (passphraselen)
1d4f519aa756ba James Bottomley 2023-02-16 @381  		memcpy(auth->passphrase, passphrase, passphraselen);
1d4f519aa756ba James Bottomley 2023-02-16  382  
1d4f519aa756ba James Bottomley 2023-02-16  383  	if (auth->session != tpm_buf_length(buf)) {
1d4f519aa756ba James Bottomley 2023-02-16  384  		/* we're not the first session */
1d4f519aa756ba James Bottomley 2023-02-16  385  		len = get_unaligned_be32(&buf->data[auth->session]);
1d4f519aa756ba James Bottomley 2023-02-16  386  		if (4 + len + auth->session != tpm_buf_length(buf)) {
1d4f519aa756ba James Bottomley 2023-02-16  387  			WARN(1, "session length mismatch, cannot append");
1d4f519aa756ba James Bottomley 2023-02-16  388  			return;
1d4f519aa756ba James Bottomley 2023-02-16  389  		}
1d4f519aa756ba James Bottomley 2023-02-16  390  
1d4f519aa756ba James Bottomley 2023-02-16  391  		/* add our new session */
1d4f519aa756ba James Bottomley 2023-02-16  392  		len += 9 + 2 * SHA256_DIGEST_SIZE;
1d4f519aa756ba James Bottomley 2023-02-16  393  		put_unaligned_be32(len, &buf->data[auth->session]);
1d4f519aa756ba James Bottomley 2023-02-16  394  	} else {
1d4f519aa756ba James Bottomley 2023-02-16  395  		tpm_buf_append_u32(buf, 9 + 2 * SHA256_DIGEST_SIZE);
1d4f519aa756ba James Bottomley 2023-02-16  396  	}
1d4f519aa756ba James Bottomley 2023-02-16  397  
1d4f519aa756ba James Bottomley 2023-02-16  398  	/* random number for our nonce */
1d4f519aa756ba James Bottomley 2023-02-16  399  	get_random_bytes(nonce, sizeof(nonce));
1d4f519aa756ba James Bottomley 2023-02-16  400  	memcpy(auth->our_nonce, nonce, sizeof(nonce));
1d4f519aa756ba James Bottomley 2023-02-16  401  	tpm_buf_append_u32(buf, auth->handle);
1d4f519aa756ba James Bottomley 2023-02-16  402  	/* our new nonce */
1d4f519aa756ba James Bottomley 2023-02-16  403  	tpm_buf_append_u16(buf, SHA256_DIGEST_SIZE);
1d4f519aa756ba James Bottomley 2023-02-16  404  	tpm_buf_append(buf, nonce, SHA256_DIGEST_SIZE);
1d4f519aa756ba James Bottomley 2023-02-16  405  	tpm_buf_append_u8(buf, auth->attrs);
1d4f519aa756ba James Bottomley 2023-02-16  406  	/* and put a placeholder for the hmac */
1d4f519aa756ba James Bottomley 2023-02-16  407  	tpm_buf_append_u16(buf, SHA256_DIGEST_SIZE);
1d4f519aa756ba James Bottomley 2023-02-16  408  	tpm_buf_append(buf, nonce, SHA256_DIGEST_SIZE);
1d4f519aa756ba James Bottomley 2023-02-16  409  }
1d4f519aa756ba James Bottomley 2023-02-16  410  EXPORT_SYMBOL(tpm_buf_append_hmac_session);
1d4f519aa756ba James Bottomley 2023-02-16  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
