Content-Type: multipart/mixed; boundary="===============7657840317892889070=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 17/17] fortify: Work around Clang inlining bugs
Date: Wed, 15 Dec 2021 11:25:41 +0800
Message-ID: <202112151126.bOLnKyZC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7657840317892889070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211213223331.135412-18-keescook@chromium.org>
References: <20211213223331.135412-18-keescook@chromium.org>
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc5 next-20211213]
[cannot apply to rdma/for-next axboe-block/for-next kvm/queue tip/x86/core =
mkp-scsi/for-next jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/Enable-strict-co=
mpile-time-memcpy-fortify-checks/20211214-064002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
aa50faff4416c869b52dff68a937c84d29e12f4b
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-c007-20211213 (https://download.01.org/0day-ci/ar=
chive/20211215/202112151126.bOLnKyZC-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e5d600e1abbdd2034dbc84465=
4957a4ec1182dbf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/Enable-strict-compile-ti=
me-memcpy-fortify-checks/20211214-064002
        git checkout e5d600e1abbdd2034dbc844654957a4ec1182dbf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:98:3: note: expanded from macro '__WARN_printf'
                   instrumentation_begin();                                \
                   ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:78:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_begin();                                \
           ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:79:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));           \
           ^
   arch/x86/include/asm/bug.h:25:37: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags)                                          \
                                                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:81:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_end();                                  \
           ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:76:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:101:3: note: expanded from macro '__WARN_print=
f'
                   instrumentation_end();                                  \
                   ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:97:38: note: expanded from macro '__WARN_print=
f'
   #define __WARN_printf(taint, arg...) do {                               \
                                        ^
   lib/math/reciprocal_div.c:51:14: note: The result of the left shift is u=
ndefined due to shifting by '64', which is greater or equal to the width of=
 type 'unsigned long long'
           mlow =3D 1ULL << (32 + l);
                       ^  ~~~~~~~~
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> include/linux/fortify-string.h:393:9: warning: Null pointer passed as 2n=
d argument to memory comparison function [clang-analyzer-unix.cstring.NullA=
rg]
           return __underlying_memcmp(p, q, size);
                  ^
   include/linux/fortify-string.h:42:29: note: expanded from macro '__under=
lying_memcmp'
   #define __underlying_memcmp     __builtin_memcmp
                                   ^
   security/keys/keyring.c:678:2: note: Taking false branch
           kenter("{%d},{%s,%s}",
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "=3D=3D> %s("FMT")\n", __func__, ##__VA_ARG=
S__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/keyring.c:684:9: note: Assuming the condition is false
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   security/keys/keyring.c:684:9: note: Left side of '||' is false
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
                  ^
   security/keys/keyring.c:685:9: note: Assuming the condition is false
                  (ctx->flags & STATE_CHECKS) =3D=3D STATE_CHECKS);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   security/keys/keyring.c:684:2: note: Taking false branch
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   security/keys/keyring.c:684:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   security/keys/keyring.c:687:6: note: Assuming field 'description' is null
           if (ctx->index_key.description)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:687:2: note: Taking false branch
           if (ctx->index_key.description)
           ^
   security/keys/keyring.c:693:6: note: Assuming field 'lookup_type' is not=
 equal to KEYRING_SEARCH_LOOKUP_ITERATE
           if (ctx->match_data.lookup_type =3D=3D KEYRING_SEARCH_LOOKUP_ITE=
RATE ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:693:6: note: Left side of '||' is false
   security/keys/keyring.c:694:6: note: Calling 'keyring_compare_object'
               keyring_compare_object(keyring, &ctx->index_key)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Assuming 'key->index_key.type' is e=
qual to 'index_key->type'
           return key->index_key.type =3D=3D index_key->type &&
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Left side of '&&' is true
   security/keys/keyring.c:315:3: note: Assuming 'key->index_key.domain_tag=
' is equal to 'index_key->domain_tag'
                   key->index_key.domain_tag =3D=3D index_key->domain_tag &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Left side of '&&' is true
           return key->index_key.type =3D=3D index_key->type &&
                  ^
   security/keys/keyring.c:316:3: note: Assuming 'key->index_key.desc_len' =
is equal to 'index_key->desc_len'
                   key->index_key.desc_len =3D=3D index_key->desc_len &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Left side of '&&' is true
           return key->index_key.type =3D=3D index_key->type &&
                  ^
   security/keys/keyring.c:317:38: note: Passing null pointer value via 2nd=
 parameter 'q'
                   memcmp(key->index_key.description, index_key->descriptio=
n,
                                                      ^
   include/linux/fortify-string.h:379:45: note: expanded from macro 'memcmp'
   #define memcmp(p, q, s) __fortify_memcmp(p, q, s)
                                               ^
   security/keys/keyring.c:317:3: note: Calling '__fortify_memcmp'
                   memcmp(key->index_key.description, index_key->descriptio=
n,
                   ^
   include/linux/fortify-string.h:379:25: note: expanded from macro 'memcmp'
   #define memcmp(p, q, s) __fortify_memcmp(p, q, s)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:385:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/fortify-string.h:391:6: note: Assuming 'p_size' is >=3D 's=
ize'
           if (p_size < size || q_size < size)
               ^~~~~~~~~~~~~
   include/linux/fortify-string.h:391:6: note: Left side of '||' is false
   include/linux/fortify-string.h:391:23: note: Assuming 'q_size' is >=3D '=
size'
           if (p_size < size || q_size < size)
                                ^~~~~~~~~~~~~
   include/linux/fortify-string.h:391:2: note: Taking false branch
           if (p_size < size || q_size < size)

vim +393 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  378  =

e5d600e1abbdd2 Kees Cook      2021-12-13  379  #define memcmp(p, q, s) __fo=
rtify_memcmp(p, q, s)
e5d600e1abbdd2 Kees Cook      2021-12-13  380  __FORTIFY_INLINE int __forti=
fy_memcmp(const void *p, const void *q, __kernel_size_t size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  381  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  382  	size_t p_size =3D __builtin=
_object_size(p, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  383  	size_t q_size =3D __builtin=
_object_size(q, 0);
a28a6e860c6cf2 Francis Laniel 2021-02-25  384  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  385  	if (__builtin_constant_p(si=
ze)) {
a28a6e860c6cf2 Francis Laniel 2021-02-25  386  		if (p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  387  			__read_overflow();
a28a6e860c6cf2 Francis Laniel 2021-02-25  388  		if (q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  389  			__read_overflow2();
a28a6e860c6cf2 Francis Laniel 2021-02-25  390  	}
a28a6e860c6cf2 Francis Laniel 2021-02-25  391  	if (p_size < size || q_size=
 < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  392  		fortify_panic(__func__);
a28a6e860c6cf2 Francis Laniel 2021-02-25 @393  	return __underlying_memcmp(=
p, q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  394  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  395  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7657840317892889070==--

