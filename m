Content-Type: multipart/mixed; boundary="===============6929592786668108806=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: crypto/dh.c:438:9: warning: Potential leak of memory pointed to by 'key' [clang-analyzer-unix.Malloc]
Date: Sun, 24 Apr 2022 00:39:27 +0800
Message-ID: <202204240037.lXfgU5eD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6929592786668108806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nicolai Stange <nstange@suse.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: 1e207964566738b49b003e80063fd712af75b82c crypto: dh - implement pri=
vate key generation primitive for ffdheXYZ(dh)
date:   7 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20220418 (https://download.01.org/0day-ci/arc=
hive/20220424/202204240037.lXfgU5eD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1e207964566738b49b003e80063fd712af75b82c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1e207964566738b49b003e80063fd712af75b82c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   init/main.c:642:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(saved_command_line + xlen, boot_command_line);
           ^~~~~~
   init/main.c:643:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:643:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:655:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:655:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:657:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len,
                           ^~~~~~
   init/main.c:657:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len,
                           ^~~~~~
   init/main.c:661:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:661:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:663:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:663:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:1188:4: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1188:4: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1388:3: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   init/main.c:1388:3: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   Suppressed 14 warnings (11 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> crypto/dh.c:438:9: warning: Potential leak of memory pointed to by 'key'=
 [clang-analyzer-unix.Malloc]
           return ERR_PTR(err);
                  ^
   crypto/dh.c:358:6: note: '?' condition is false
           n =3D roundup_pow_of_two(2 * safe_prime->max_strength);
               ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   crypto/dh.c:359:2: note: '?' condition is false
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/dh.c:359:2: note: '?' condition is true
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   crypto/dh.c:359:2: note: Taking true branch
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/dh.c:359:2: note: Loop condition is false.  Exiting loop
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:106:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/riscv/include/asm/bug.h:79:29: note: expanded from macro '__WARN_FL=
AGS'
   #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
                               ^
   arch/riscv/include/asm/bug.h:53:32: note: expanded from macro '__BUG_FLA=
GS'
   #define __BUG_FLAGS(flags)                                      \
                                                                   ^
   crypto/dh.c:367:8: note: Memory is allocated
           key =3D kmalloc(oversampling_size, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/dh.c:368:6: note: Assuming 'key' is non-null
           if (!key)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/dh.c:368:2: note: '?' condition is false
           if (!key)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/dh.c:368:7: note: 'key' is non-null
           if (!key)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   crypto/dh.c:368:2: note: '?' condition is false
           if (!key)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \

vim +/key +438 crypto/dh.c

1e207964566738 Nicolai Stange 2022-02-21  333  =

1e207964566738 Nicolai Stange 2022-02-21  334  static void *dh_safe_prime_g=
en_privkey(const struct dh_safe_prime *safe_prime,
1e207964566738 Nicolai Stange 2022-02-21  335  				       unsigned int *key=
_size)
1e207964566738 Nicolai Stange 2022-02-21  336  {
1e207964566738 Nicolai Stange 2022-02-21  337  	unsigned int n, oversamplin=
g_size;
1e207964566738 Nicolai Stange 2022-02-21  338  	__be64 *key;
1e207964566738 Nicolai Stange 2022-02-21  339  	int err;
1e207964566738 Nicolai Stange 2022-02-21  340  	u64 h, o;
1e207964566738 Nicolai Stange 2022-02-21  341  =

1e207964566738 Nicolai Stange 2022-02-21  342  	/*
1e207964566738 Nicolai Stange 2022-02-21  343  	 * Generate a private key f=
ollowing NIST SP800-56Ar3,
1e207964566738 Nicolai Stange 2022-02-21  344  	 * sec. 5.6.1.1.1 and 5.6.1=
.1.3 resp..
1e207964566738 Nicolai Stange 2022-02-21  345  	 *
1e207964566738 Nicolai Stange 2022-02-21  346  	 * 5.6.1.1.1: choose key le=
ngth N such that
1e207964566738 Nicolai Stange 2022-02-21  347  	 * 2 * ->max_strength <=3D =
N <=3D log2(q) + 1 =3D ->p_size * 8 - 1
1e207964566738 Nicolai Stange 2022-02-21  348  	 * with q =3D (p - 1) / 2 f=
or the safe-prime groups.
1e207964566738 Nicolai Stange 2022-02-21  349  	 * Choose the lower bound's=
 next power of two for N in order to
1e207964566738 Nicolai Stange 2022-02-21  350  	 * avoid excessively large =
private keys while still
1e207964566738 Nicolai Stange 2022-02-21  351  	 * maintaining some extra r=
eserve beyond the bare minimum in
1e207964566738 Nicolai Stange 2022-02-21  352  	 * most cases. Note that fo=
r each entry in safe_prime_groups[],
1e207964566738 Nicolai Stange 2022-02-21  353  	 * the following holds for =
such N:
1e207964566738 Nicolai Stange 2022-02-21  354  	 * - N >=3D 256, in particu=
lar it is a multiple of 2^6 =3D 64
1e207964566738 Nicolai Stange 2022-02-21  355  	 *   bits and
1e207964566738 Nicolai Stange 2022-02-21  356  	 * - N < log2(q) + 1, i.e. =
N respects the upper bound.
1e207964566738 Nicolai Stange 2022-02-21  357  	 */
1e207964566738 Nicolai Stange 2022-02-21  358  	n =3D roundup_pow_of_two(2 =
* safe_prime->max_strength);
1e207964566738 Nicolai Stange 2022-02-21  359  	WARN_ON_ONCE(n & ((1u << 6)=
 - 1));
1e207964566738 Nicolai Stange 2022-02-21  360  	n >>=3D 6; /* Convert N int=
o units of u64. */
1e207964566738 Nicolai Stange 2022-02-21  361  =

1e207964566738 Nicolai Stange 2022-02-21  362  	/*
1e207964566738 Nicolai Stange 2022-02-21  363  	 * Reserve one extra u64 to=
 hold the extra random bits
1e207964566738 Nicolai Stange 2022-02-21  364  	 * required as per 5.6.1.1.=
3.
1e207964566738 Nicolai Stange 2022-02-21  365  	 */
1e207964566738 Nicolai Stange 2022-02-21  366  	oversampling_size =3D (n + =
1) * sizeof(__be64);
1e207964566738 Nicolai Stange 2022-02-21  367  	key =3D kmalloc(oversamplin=
g_size, GFP_KERNEL);
1e207964566738 Nicolai Stange 2022-02-21  368  	if (!key)
1e207964566738 Nicolai Stange 2022-02-21  369  		return ERR_PTR(-ENOMEM);
1e207964566738 Nicolai Stange 2022-02-21  370  =

1e207964566738 Nicolai Stange 2022-02-21  371  	/*
1e207964566738 Nicolai Stange 2022-02-21  372  	 * 5.6.1.1.3, step 3 (and i=
mplicitly step 4): obtain N + 64
1e207964566738 Nicolai Stange 2022-02-21  373  	 * random bits and interpre=
t them as a big endian integer.
1e207964566738 Nicolai Stange 2022-02-21  374  	 */
1e207964566738 Nicolai Stange 2022-02-21  375  	err =3D -EFAULT;
1e207964566738 Nicolai Stange 2022-02-21  376  	if (crypto_get_default_rng(=
))
1e207964566738 Nicolai Stange 2022-02-21  377  		goto out_err;
1e207964566738 Nicolai Stange 2022-02-21  378  =

1e207964566738 Nicolai Stange 2022-02-21  379  	err =3D crypto_rng_get_byte=
s(crypto_default_rng, (u8 *)key,
1e207964566738 Nicolai Stange 2022-02-21  380  				   oversampling_size);
1e207964566738 Nicolai Stange 2022-02-21  381  	crypto_put_default_rng();
1e207964566738 Nicolai Stange 2022-02-21  382  	if (err)
1e207964566738 Nicolai Stange 2022-02-21  383  		goto out_err;
1e207964566738 Nicolai Stange 2022-02-21  384  =

1e207964566738 Nicolai Stange 2022-02-21  385  	/*
1e207964566738 Nicolai Stange 2022-02-21  386  	 * 5.6.1.1.3, step 5 is imp=
licit: 2^N < q and thus,
1e207964566738 Nicolai Stange 2022-02-21  387  	 * M =3D min(2^N, q) =3D 2^=
N.
1e207964566738 Nicolai Stange 2022-02-21  388  	 *
1e207964566738 Nicolai Stange 2022-02-21  389  	 * For step 6, calculate
1e207964566738 Nicolai Stange 2022-02-21  390  	 * key =3D (key[] mod (M - =
1)) + 1 =3D (key[] mod (2^N - 1)) + 1.
1e207964566738 Nicolai Stange 2022-02-21  391  	 *
1e207964566738 Nicolai Stange 2022-02-21  392  	 * In order to avoid expens=
ive divisions, note that
1e207964566738 Nicolai Stange 2022-02-21  393  	 * 2^N mod (2^N - 1) =3D 1 =
and thus, for any integer h,
1e207964566738 Nicolai Stange 2022-02-21  394  	 * 2^N * h mod (2^N - 1) =
=3D h mod (2^N - 1) always holds.
1e207964566738 Nicolai Stange 2022-02-21  395  	 * The big endian integer k=
ey[] composed of n + 1 64bit words
1e207964566738 Nicolai Stange 2022-02-21  396  	 * may be written as key[] =
=3D h * 2^N + l, with h =3D key[0]
1e207964566738 Nicolai Stange 2022-02-21  397  	 * representing the 64 most=
 significant bits and l
1e207964566738 Nicolai Stange 2022-02-21  398  	 * corresponding to the rem=
aining 2^N bits. With the remark
1e207964566738 Nicolai Stange 2022-02-21  399  	 * from above,
1e207964566738 Nicolai Stange 2022-02-21  400  	 * h * 2^N + l mod (2^N - 1=
) =3D l + h mod (2^N - 1).
1e207964566738 Nicolai Stange 2022-02-21  401  	 * As both, l and h are les=
s than 2^N, their sum after
1e207964566738 Nicolai Stange 2022-02-21  402  	 * this first reduction is =
guaranteed to be <=3D 2^(N + 1) - 2.
1e207964566738 Nicolai Stange 2022-02-21  403  	 * Or equivalently, that th=
eir sum can again be written as
1e207964566738 Nicolai Stange 2022-02-21  404  	 * h' * 2^N + l' with h' no=
w either zero or one and if one,
1e207964566738 Nicolai Stange 2022-02-21  405  	 * then l' <=3D 2^N - 2. Th=
us, all bits@positions >=3D N will
1e207964566738 Nicolai Stange 2022-02-21  406  	 * be zero after a second r=
eduction:
1e207964566738 Nicolai Stange 2022-02-21  407  	 * h' * 2^N + l' mod (2^N -=
 1) =3D l' + h' mod (2^N - 1).
1e207964566738 Nicolai Stange 2022-02-21  408  	 * At this point, it is sti=
ll possible that
1e207964566738 Nicolai Stange 2022-02-21  409  	 * l' + h' =3D 2^N - 1, i.e=
. that l' + h' mod (2^N - 1)
1e207964566738 Nicolai Stange 2022-02-21  410  	 * is zero. This condition =
will be detected below by means of
1e207964566738 Nicolai Stange 2022-02-21  411  	 * the final increment over=
flowing in this case.
1e207964566738 Nicolai Stange 2022-02-21  412  	 */
1e207964566738 Nicolai Stange 2022-02-21  413  	h =3D be64_to_cpu(key[0]);
1e207964566738 Nicolai Stange 2022-02-21  414  	h =3D __add_u64_to_be(key +=
 1, n, h);
1e207964566738 Nicolai Stange 2022-02-21  415  	h =3D __add_u64_to_be(key +=
 1, n, h);
1e207964566738 Nicolai Stange 2022-02-21  416  	WARN_ON_ONCE(h);
1e207964566738 Nicolai Stange 2022-02-21  417  =

1e207964566738 Nicolai Stange 2022-02-21  418  	/* Increment to obtain the =
final result. */
1e207964566738 Nicolai Stange 2022-02-21  419  	o =3D __add_u64_to_be(key +=
 1, n, 1);
1e207964566738 Nicolai Stange 2022-02-21  420  	/*
1e207964566738 Nicolai Stange 2022-02-21  421  	 * The overflow bit o from =
the increment is either zero or
1e207964566738 Nicolai Stange 2022-02-21  422  	 * one. If zero, key[1:n] h=
olds the final result in big-endian
1e207964566738 Nicolai Stange 2022-02-21  423  	 * order. If one, key[1:n] =
is zero now, but needs to be set to
1e207964566738 Nicolai Stange 2022-02-21  424  	 * one, c.f. above.
1e207964566738 Nicolai Stange 2022-02-21  425  	 */
1e207964566738 Nicolai Stange 2022-02-21  426  	if (o)
1e207964566738 Nicolai Stange 2022-02-21  427  		key[n] =3D cpu_to_be64(1);
1e207964566738 Nicolai Stange 2022-02-21  428  =

1e207964566738 Nicolai Stange 2022-02-21  429  	/* n is in units of u64, co=
nvert to bytes. */
1e207964566738 Nicolai Stange 2022-02-21  430  	*key_size =3D n << 3;
1e207964566738 Nicolai Stange 2022-02-21  431  	/* Strip the leading extra =
__be64, which is (virtually) zero by now. */
1e207964566738 Nicolai Stange 2022-02-21  432  	memmove(key, &key[1], *key_=
size);
1e207964566738 Nicolai Stange 2022-02-21  433  =

1e207964566738 Nicolai Stange 2022-02-21  434  	return key;
1e207964566738 Nicolai Stange 2022-02-21  435  =

1e207964566738 Nicolai Stange 2022-02-21  436  out_err:
1e207964566738 Nicolai Stange 2022-02-21  437  	kfree_sensitive(key);
1e207964566738 Nicolai Stange 2022-02-21 @438  	return ERR_PTR(err);
1e207964566738 Nicolai Stange 2022-02-21  439  }
1e207964566738 Nicolai Stange 2022-02-21  440  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6929592786668108806==--

