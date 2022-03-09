Content-Type: multipart/mixed; boundary="===============1196526781650812005=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9491/11353] crypto/dh.c:438:9: warning: Potential leak of memory pointed to by 'key' [clang-analyzer-unix.Malloc]
Date: Wed, 09 Mar 2022 10:14:00 +0800
Message-ID: <202203091011.Ixia17Ac-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1196526781650812005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Nicolai Stange <nstange@suse.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: 1e207964566738b49b003e80063fd712af75b82c [9491/11353] crypto: dh - =
implement private key generation primitive for ffdheXYZ(dh)
:::::: branch date: 18 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20220308 (https://download.01.org/0day-ci/archi=
ve/20220309/202203091011.Ixia17Ac-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D1e207964566738b49b003e80063fd712af75b82c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1e207964566738b49b003e80063fd712af75b82c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/hpfs/namei.c:549:2: note: Taking false branch
           if (!(dep =3D map_dirent(old_dir, hpfs_i(old_dir)->i_dno, old_na=
me, old_len, &dno, &qbh))) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/namei.c:554:2: note: Calling 'copy_de'
           copy_de(&de, dep);
           ^~~~~~~~~~~~~~~~~
   fs/hpfs/hpfs_fn.h:179:7: note: 'dst' is non-null
           if (!dst || !src) return;
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/hpfs_fn.h:179:6: note: Left side of '||' is false
           if (!dst || !src) return;
               ^
   fs/hpfs/hpfs_fn.h:179:15: note: 'src' is non-null
           if (!dst || !src) return;
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/hpfs_fn.h:179:2: note: '?' condition is false
           if (!dst || !src) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/hpfs_fn.h:179:7: note: 'dst' is non-null
           if (!dst || !src) return;
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
   fs/hpfs/hpfs_fn.h:179:6: note: Left side of '||' is false
           if (!dst || !src) return;
               ^
   fs/hpfs/hpfs_fn.h:179:15: note: 'src' is non-null
           if (!dst || !src) return;
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
   fs/hpfs/hpfs_fn.h:179:2: note: '?' condition is false
           if (!dst || !src) return;
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
   fs/hpfs/hpfs_fn.h:179:2: note: Taking false branch
           if (!dst || !src) return;
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/hpfs_fn.h:180:4: note: Assigned value is garbage or undefined
           a =3D dst->down;
             ^ ~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   crypto/dh.c:359:2: note: '__ret_do_once' is true
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/dh.c:359:2: note: Left side of '&&' is true
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^
   crypto/dh.c:359:2: note: '__ret_do_once' is true
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/dh.c:359:2: note: Left side of '&&' is true
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^
   crypto/dh.c:359:2: note: '?' condition is false
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/dh.c:359:2: note: '__ret_do_once' is true
           WARN_ON_ONCE(n & ((1u << 6) - 1));
           ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'

vim +/key +438 crypto/dh.c

1e207964566738b Nicolai Stange 2022-02-21  333  =

1e207964566738b Nicolai Stange 2022-02-21  334  static void *dh_safe_prime_=
gen_privkey(const struct dh_safe_prime *safe_prime,
1e207964566738b Nicolai Stange 2022-02-21  335  				       unsigned int *ke=
y_size)
1e207964566738b Nicolai Stange 2022-02-21  336  {
1e207964566738b Nicolai Stange 2022-02-21  337  	unsigned int n, oversampli=
ng_size;
1e207964566738b Nicolai Stange 2022-02-21  338  	__be64 *key;
1e207964566738b Nicolai Stange 2022-02-21  339  	int err;
1e207964566738b Nicolai Stange 2022-02-21  340  	u64 h, o;
1e207964566738b Nicolai Stange 2022-02-21  341  =

1e207964566738b Nicolai Stange 2022-02-21  342  	/*
1e207964566738b Nicolai Stange 2022-02-21  343  	 * Generate a private key =
following NIST SP800-56Ar3,
1e207964566738b Nicolai Stange 2022-02-21  344  	 * sec. 5.6.1.1.1 and 5.6.=
1.1.3 resp..
1e207964566738b Nicolai Stange 2022-02-21  345  	 *
1e207964566738b Nicolai Stange 2022-02-21  346  	 * 5.6.1.1.1: choose key l=
ength N such that
1e207964566738b Nicolai Stange 2022-02-21  347  	 * 2 * ->max_strength <=3D=
 N <=3D log2(q) + 1 =3D ->p_size * 8 - 1
1e207964566738b Nicolai Stange 2022-02-21  348  	 * with q =3D (p - 1) / 2 =
for the safe-prime groups.
1e207964566738b Nicolai Stange 2022-02-21  349  	 * Choose the lower bound'=
s next power of two for N in order to
1e207964566738b Nicolai Stange 2022-02-21  350  	 * avoid excessively large=
 private keys while still
1e207964566738b Nicolai Stange 2022-02-21  351  	 * maintaining some extra =
reserve beyond the bare minimum in
1e207964566738b Nicolai Stange 2022-02-21  352  	 * most cases. Note that f=
or each entry in safe_prime_groups[],
1e207964566738b Nicolai Stange 2022-02-21  353  	 * the following holds for=
 such N:
1e207964566738b Nicolai Stange 2022-02-21  354  	 * - N >=3D 256, in partic=
ular it is a multiple of 2^6 =3D 64
1e207964566738b Nicolai Stange 2022-02-21  355  	 *   bits and
1e207964566738b Nicolai Stange 2022-02-21  356  	 * - N < log2(q) + 1, i.e.=
 N respects the upper bound.
1e207964566738b Nicolai Stange 2022-02-21  357  	 */
1e207964566738b Nicolai Stange 2022-02-21  358  	n =3D roundup_pow_of_two(2=
 * safe_prime->max_strength);
1e207964566738b Nicolai Stange 2022-02-21  359  	WARN_ON_ONCE(n & ((1u << 6=
) - 1));
1e207964566738b Nicolai Stange 2022-02-21  360  	n >>=3D 6; /* Convert N in=
to units of u64. */
1e207964566738b Nicolai Stange 2022-02-21  361  =

1e207964566738b Nicolai Stange 2022-02-21  362  	/*
1e207964566738b Nicolai Stange 2022-02-21  363  	 * Reserve one extra u64 t=
o hold the extra random bits
1e207964566738b Nicolai Stange 2022-02-21  364  	 * required as per 5.6.1.1=
.3.
1e207964566738b Nicolai Stange 2022-02-21  365  	 */
1e207964566738b Nicolai Stange 2022-02-21  366  	oversampling_size =3D (n +=
 1) * sizeof(__be64);
1e207964566738b Nicolai Stange 2022-02-21  367  	key =3D kmalloc(oversampli=
ng_size, GFP_KERNEL);
1e207964566738b Nicolai Stange 2022-02-21  368  	if (!key)
1e207964566738b Nicolai Stange 2022-02-21  369  		return ERR_PTR(-ENOMEM);
1e207964566738b Nicolai Stange 2022-02-21  370  =

1e207964566738b Nicolai Stange 2022-02-21  371  	/*
1e207964566738b Nicolai Stange 2022-02-21  372  	 * 5.6.1.1.3, step 3 (and =
implicitly step 4): obtain N + 64
1e207964566738b Nicolai Stange 2022-02-21  373  	 * random bits and interpr=
et them as a big endian integer.
1e207964566738b Nicolai Stange 2022-02-21  374  	 */
1e207964566738b Nicolai Stange 2022-02-21  375  	err =3D -EFAULT;
1e207964566738b Nicolai Stange 2022-02-21  376  	if (crypto_get_default_rng=
())
1e207964566738b Nicolai Stange 2022-02-21  377  		goto out_err;
1e207964566738b Nicolai Stange 2022-02-21  378  =

1e207964566738b Nicolai Stange 2022-02-21  379  	err =3D crypto_rng_get_byt=
es(crypto_default_rng, (u8 *)key,
1e207964566738b Nicolai Stange 2022-02-21  380  				   oversampling_size);
1e207964566738b Nicolai Stange 2022-02-21  381  	crypto_put_default_rng();
1e207964566738b Nicolai Stange 2022-02-21  382  	if (err)
1e207964566738b Nicolai Stange 2022-02-21  383  		goto out_err;
1e207964566738b Nicolai Stange 2022-02-21  384  =

1e207964566738b Nicolai Stange 2022-02-21  385  	/*
1e207964566738b Nicolai Stange 2022-02-21  386  	 * 5.6.1.1.3, step 5 is im=
plicit: 2^N < q and thus,
1e207964566738b Nicolai Stange 2022-02-21  387  	 * M =3D min(2^N, q) =3D 2=
^N.
1e207964566738b Nicolai Stange 2022-02-21  388  	 *
1e207964566738b Nicolai Stange 2022-02-21  389  	 * For step 6, calculate
1e207964566738b Nicolai Stange 2022-02-21  390  	 * key =3D (key[] mod (M -=
 1)) + 1 =3D (key[] mod (2^N - 1)) + 1.
1e207964566738b Nicolai Stange 2022-02-21  391  	 *
1e207964566738b Nicolai Stange 2022-02-21  392  	 * In order to avoid expen=
sive divisions, note that
1e207964566738b Nicolai Stange 2022-02-21  393  	 * 2^N mod (2^N - 1) =3D 1=
 and thus, for any integer h,
1e207964566738b Nicolai Stange 2022-02-21  394  	 * 2^N * h mod (2^N - 1) =
=3D h mod (2^N - 1) always holds.
1e207964566738b Nicolai Stange 2022-02-21  395  	 * The big endian integer =
key[] composed of n + 1 64bit words
1e207964566738b Nicolai Stange 2022-02-21  396  	 * may be written as key[]=
 =3D h * 2^N + l, with h =3D key[0]
1e207964566738b Nicolai Stange 2022-02-21  397  	 * representing the 64 mos=
t significant bits and l
1e207964566738b Nicolai Stange 2022-02-21  398  	 * corresponding to the re=
maining 2^N bits. With the remark
1e207964566738b Nicolai Stange 2022-02-21  399  	 * from above,
1e207964566738b Nicolai Stange 2022-02-21  400  	 * h * 2^N + l mod (2^N - =
1) =3D l + h mod (2^N - 1).
1e207964566738b Nicolai Stange 2022-02-21  401  	 * As both, l and h are le=
ss than 2^N, their sum after
1e207964566738b Nicolai Stange 2022-02-21  402  	 * this first reduction is=
 guaranteed to be <=3D 2^(N + 1) - 2.
1e207964566738b Nicolai Stange 2022-02-21  403  	 * Or equivalently, that t=
heir sum can again be written as
1e207964566738b Nicolai Stange 2022-02-21  404  	 * h' * 2^N + l' with h' n=
ow either zero or one and if one,
1e207964566738b Nicolai Stange 2022-02-21  405  	 * then l' <=3D 2^N - 2. T=
hus, all bits@positions >=3D N will
1e207964566738b Nicolai Stange 2022-02-21  406  	 * be zero after a second =
reduction:
1e207964566738b Nicolai Stange 2022-02-21  407  	 * h' * 2^N + l' mod (2^N =
- 1) =3D l' + h' mod (2^N - 1).
1e207964566738b Nicolai Stange 2022-02-21  408  	 * At this point, it is st=
ill possible that
1e207964566738b Nicolai Stange 2022-02-21  409  	 * l' + h' =3D 2^N - 1, i.=
e. that l' + h' mod (2^N - 1)
1e207964566738b Nicolai Stange 2022-02-21  410  	 * is zero. This condition=
 will be detected below by means of
1e207964566738b Nicolai Stange 2022-02-21  411  	 * the final increment ove=
rflowing in this case.
1e207964566738b Nicolai Stange 2022-02-21  412  	 */
1e207964566738b Nicolai Stange 2022-02-21  413  	h =3D be64_to_cpu(key[0]);
1e207964566738b Nicolai Stange 2022-02-21  414  	h =3D __add_u64_to_be(key =
+ 1, n, h);
1e207964566738b Nicolai Stange 2022-02-21  415  	h =3D __add_u64_to_be(key =
+ 1, n, h);
1e207964566738b Nicolai Stange 2022-02-21  416  	WARN_ON_ONCE(h);
1e207964566738b Nicolai Stange 2022-02-21  417  =

1e207964566738b Nicolai Stange 2022-02-21  418  	/* Increment to obtain the=
 final result. */
1e207964566738b Nicolai Stange 2022-02-21  419  	o =3D __add_u64_to_be(key =
+ 1, n, 1);
1e207964566738b Nicolai Stange 2022-02-21  420  	/*
1e207964566738b Nicolai Stange 2022-02-21  421  	 * The overflow bit o from=
 the increment is either zero or
1e207964566738b Nicolai Stange 2022-02-21  422  	 * one. If zero, key[1:n] =
holds the final result in big-endian
1e207964566738b Nicolai Stange 2022-02-21  423  	 * order. If one, key[1:n]=
 is zero now, but needs to be set to
1e207964566738b Nicolai Stange 2022-02-21  424  	 * one, c.f. above.
1e207964566738b Nicolai Stange 2022-02-21  425  	 */
1e207964566738b Nicolai Stange 2022-02-21  426  	if (o)
1e207964566738b Nicolai Stange 2022-02-21  427  		key[n] =3D cpu_to_be64(1);
1e207964566738b Nicolai Stange 2022-02-21  428  =

1e207964566738b Nicolai Stange 2022-02-21  429  	/* n is in units of u64, c=
onvert to bytes. */
1e207964566738b Nicolai Stange 2022-02-21  430  	*key_size =3D n << 3;
1e207964566738b Nicolai Stange 2022-02-21  431  	/* Strip the leading extra=
 __be64, which is (virtually) zero by now. */
1e207964566738b Nicolai Stange 2022-02-21  432  	memmove(key, &key[1], *key=
_size);
1e207964566738b Nicolai Stange 2022-02-21  433  =

1e207964566738b Nicolai Stange 2022-02-21  434  	return key;
1e207964566738b Nicolai Stange 2022-02-21  435  =

1e207964566738b Nicolai Stange 2022-02-21  436  out_err:
1e207964566738b Nicolai Stange 2022-02-21  437  	kfree_sensitive(key);
1e207964566738b Nicolai Stange 2022-02-21 @438  	return ERR_PTR(err);
1e207964566738b Nicolai Stange 2022-02-21  439  }
1e207964566738b Nicolai Stange 2022-02-21  440  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1196526781650812005==--

