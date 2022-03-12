Content-Type: multipart/mixed; boundary="===============6433810011588974547=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] [v3] Kbuild: move to -std=gnu11
Date: Sun, 13 Mar 2022 03:44:34 +0800
Message-ID: <202203130344.WpXY5TTo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6433810011588974547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220301145233.3689119-1-arnd@kernel.org>
References: <20220301145233.3689119-1-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>

Hi Arnd,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on drm-intel/for-linux-next staging/staging-testin=
g kdave/for-next soc/for-next linus/master v5.17-rc7]
[cannot apply to masahiroy-kbuild/for-next srcres258-doc/doc-zh-tw next-202=
20310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/Kbuild-move-=
to-std-gnu11/20220301-225348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for=
-next/core
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: mips-randconfig-c004-20220302 (https://download.01.org/0day-ci/arch=
ive/20220313/202203130344.WpXY5TTo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/afebabb39f6a871f6e6d69f60=
1738fbce1c1b37c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arnd-Bergmann/Kbuild-move-to-std-g=
nu11/20220301-225348
        git checkout afebabb39f6a871f6e6d69f601738fbce1c1b37c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   fs/xfs/xfs_fsmap.c:949:4: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&dkeys[0], 0, sizeof(struct xfs_fsmap));
                           ^~~~~~
   fs/xfs/xfs_fsmap.c:949:4: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                           memset(&dkeys[0], 0, sizeof(struct xfs_fsmap));
                           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   fs/isofs/util.c:40:14: warning: The result of the left shift is undefine=
d because the left operand is negative [clang-analyzer-core.UndefinedBinary=
OperatorResult]
                           tz |=3D (-1 << 8);
                                  ~~ ^
   fs/isofs/util.c:30:6: note: Assuming 'flag' is equal to 0
           if (flag =3D=3D 0) tz =3D p[6]; /* High sierra has no time zone =
*/
               ^~~~~~~~~
   fs/isofs/util.c:30:2: note: Taking true branch
           if (flag =3D=3D 0) tz =3D p[6]; /* High sierra has no time zone =
*/
           ^
   fs/isofs/util.c:33:6: note: 'year' is >=3D 0
           if (year < 0) {
               ^~~~
   fs/isofs/util.c:33:2: note: Taking false branch
           if (year < 0) {
           ^
   fs/isofs/util.c:39:7: note: Assuming the condition is true
                   if (tz & 0x80)
                       ^~~~~~~~~
   fs/isofs/util.c:39:3: note: Taking true branch
                   if (tz & 0x80)
                   ^
   fs/isofs/util.c:40:14: note: The result of the left shift is undefined b=
ecause the left operand is negative
                           tz |=3D (-1 << 8);
                                  ~~ ^
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   crypto/hmac.c:65:3: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ipad, inkey, keylen);
                   ^~~~~~
   crypto/hmac.c:65:3: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                   memcpy(ipad, inkey, keylen);
                   ^~~~~~
   crypto/hmac.c:67:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(ipad + keylen, 0, bs - keylen);
           ^~~~~~
   crypto/hmac.c:67:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(ipad + keylen, 0, bs - keylen);
           ^~~~~~
   crypto/hmac.c:68:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(opad, ipad, bs);
           ^~~~~~
   crypto/hmac.c:68:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(opad, ipad, bs);
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   crypto/vmac.c:487:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(dctx->polytmp, tctx->polykey, sizeof(dctx->polytmp));
           ^~~~~~
   crypto/vmac.c:487:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(dctx->polytmp, tctx->polykey, sizeof(dctx->polytmp));
           ^~~~~~
   crypto/vmac.c:501:3: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dctx->nonce.bytes[dctx->nonce_size], p, n);
                   ^~~~~~
   crypto/vmac.c:501:3: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                   memcpy(&dctx->nonce.bytes[dctx->nonce_size], p, n);
                   ^~~~~~
   crypto/vmac.c:509:3: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dctx->partial[dctx->partial_size], p, n);
                   ^~~~~~
   crypto/vmac.c:509:3: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                   memcpy(&dctx->partial[dctx->partial_size], p, n);
                   ^~~~~~
   crypto/vmac.c:528:3: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->partial, p, len);
                   ^~~~~~
   crypto/vmac.c:528:3: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                   memcpy(dctx->partial, p, len);
                   ^~~~~~
   crypto/vmac.c:548:3: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memset(&dctx->partial[partial], 0, n - partial);
                   ^~~~~~
   crypto/vmac.c:548:3: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
                   memset(&dctx->partial[partial], 0, n - partial);
                   ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
>> arch/mips/ath79/setup.c:185:3: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   sprintf(ath79_sys_type, "Qualcomm Atheros QCA%s ver %u r=
ev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:185:3: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   sprintf(ath79_sys_type, "Qualcomm Atheros QCA%s ver %u r=
ev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:188:3: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   sprintf(ath79_sys_type, "Qualcomm Atheros TP%s rev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:188:3: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   sprintf(ath79_sys_type, "Qualcomm Atheros TP%s rev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:191:3: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   sprintf(ath79_sys_type, "Atheros AR%s rev %u", chip, rev=
);
                   ^~~~~~~
   arch/mips/ath79/setup.c:191:3: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   sprintf(ath79_sys_type, "Atheros AR%s rev %u", chip, rev=
);
                   ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   lib/test_min_heap.c:16:21: warning: The left operand of '<' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return *(int *)lhs < *(int *)rhs;
                              ^
   lib/test_min_heap.c:173:9: note: Calling 'test_heapify_all'
           err +=3D test_heapify_all(true);
                  ^~~~~~~~~~~~~~~~~~~~~~
   lib/test_min_heap.c:73:11: note: 'min_heap' is true
                   .less =3D min_heap ? less_than : greater_than,
                           ^~~~~~~~
   lib/test_min_heap.c:73:11: note: '?' condition is true
   lib/test_min_heap.c:79:2: note: Calling 'min_heapify_all'
           min_heapify_all(&heap, &funcs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/min_heap.h:73:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D heap->nr / 2; i >=3D 0; i--)
           ^
   include/linux/min_heap.h:73:2: note: Loop condition is true.  Entering l=
oop body
   include/linux/min_heap.h:74:3: note: Calling 'min_heapify'
                   min_heapify(heap, i, func);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/min_heap.h:41:2: note: Loop condition is true.  Entering l=
oop body
           for (;;) {
           ^
   include/linux/min_heap.h:42:3: note: Taking false branch
                   if (pos * 2 + 1 >=3D heap->nr)
                   ^
   include/linux/min_heap.h:48:7: note: Calling 'less_than'
                   if (func->less(left, smallest))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_min_heap.c:16:21: note: The left operand of '<' is a garbage va=
lue
           return *(int *)lhs < *(int *)rhs;
                  ~~~~~~~~~~~ ^
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   lib/test_printf.c:49:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(alloced_buffer, FILL_CHAR, BUF_SIZE + 2*PAD_SIZE);
           ^~~~~~
   lib/test_printf.c:49:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(alloced_buffer, FILL_CHAR, BUF_SIZE + 2*PAD_SIZE);
           ^~~~~~
   lib/test_printf.c:51:8: warning: Call to function 'vsnprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D vsnprintf(test_buffer, bufsize, fmt, aq);
                 ^~~~~~~~~
   lib/test_printf.c:51:8: note: Call to function 'vsnprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'vsnprintf_s' in case of C11
           ret =3D vsnprintf(test_buffer, bufsize, fmt, aq);
                 ^~~~~~~~~
   lib/test_printf.c:267:11: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           nchars =3D snprintf(buf, len, "%p", p);
                    ^~~~~~~~
   lib/test_printf.c:267:11: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           nchars =3D snprintf(buf, len, "%p", p);
                    ^~~~~~~~
   lib/test_printf.c:639:2: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cmp_buf + size, BUF_SIZE - size, ")");
           ^~~~~~~~
   lib/test_printf.c:639:2: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           snprintf(cmp_buf + size, BUF_SIZE - size, ")");
           ^~~~~~~~
   lib/test_printf.c:681:2: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cmp_buffer, BUF_SIZE, "%#lx", (unsigned long) gfp);
           ^~~~~~~~
   lib/test_printf.c:681:2: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           snprintf(cmp_buffer, BUF_SIZE, "%#lx", (unsigned long) gfp);
           ^~~~~~~~
   lib/test_printf.c:684:2: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cmp_buffer, BUF_SIZE, "__GFP_ATOMIC|%#lx",
           ^~~~~~~~
--
           ^
   fs/ext4/ioctl.c:1158:2: note: Control jumps to 'case 2148034064:' @li=
ne 1356
           switch (cmd) {
           ^
   fs/ext4/ioctl.c:1357:3: note: 'n_blocks_count' declared without an initi=
al value
                   ext4_fsblk_t n_blocks_count;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ioctl.c:1361:7: note: Calling 'copy_from_user'
                   if (copy_from_user(&n_blocks_count, (__u64 __user *)arg,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   fs/ext4/ioctl.c:1361:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(&n_blocks_count, (__u64 __user *)arg,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ioctl.c:1361:3: note: Taking false branch
                   if (copy_from_user(&n_blocks_count, (__u64 __user *)arg,
                   ^
   fs/ext4/ioctl.c:1367:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/ext4/ioctl.c:1367:3: note: Taking false branch
                   if (err)
                   ^
   fs/ext4/ioctl.c:1371:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/ext4/ioctl.c:1371:3: note: Taking false branch
                   if (err)
                   ^
   fs/ext4/ioctl.c:1374:9: note: 2nd function call argument is an uninitial=
ized value
                   err =3D ext4_resize_fs(sb, n_blocks_count);
                         ^                  ~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   kernel/power/hibernate.c:1071:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "[disabled]\n");
                          ^~~~~~~
   kernel/power/hibernate.c:1071:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "[disabled]\n");
                          ^~~~~~~
>> kernel/power/hibernate.c:1091:11: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                           buf +=3D sprintf(buf, "[%s] ", hibernation_modes=
[i]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1091:11: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                           buf +=3D sprintf(buf, "[%s] ", hibernation_modes=
[i]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1093:11: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                           buf +=3D sprintf(buf, "%s ", hibernation_modes[i=
]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1093:11: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                           buf +=3D sprintf(buf, "%s ", hibernation_modes[i=
]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1095:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           buf +=3D sprintf(buf, "\n");
                  ^~~~~~~
   kernel/power/hibernate.c:1095:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           buf +=3D sprintf(buf, "\n");
                  ^~~~~~~
   kernel/power/hibernate.c:1153:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d:%d\n", MAJOR(swsusp_resume_device),
                  ^~~~~~~
   kernel/power/hibernate.c:1153:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d:%d\n", MAJOR(swsusp_resume_device),
                  ^~~~~~~
   kernel/power/hibernate.c:1190:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", (unsigned long long)swsusp_resume_=
block);
                  ^~~~~~~
   kernel/power/hibernate.c:1190:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", (unsigned long long)swsusp_resume_=
block);
                  ^~~~~~~
   kernel/power/hibernate.c:1213:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", image_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1213:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", image_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1221:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1221:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1234:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", reserved_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1234:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", reserved_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1243:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1243:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1281:2: warning: Call to function 'strncpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(resume_file, str, 255);
           ^~~~~~~
   kernel/power/hibernate.c:1281:2: note: Call to function 'strncpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'strncpy_s' in case of C11
           strncpy(resume_file, str, 255);
           ^~~~~~~
   kernel/power/hibernate.c:1292:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(str, "%llu", &offset) =3D=3D 1)
               ^~~~~~
   kernel/power/hibernate.c:1292:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(str, "%llu", &offset) =3D=3D 1)
               ^~~~~~
   Suppressed 39 warnings (38 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   fs/overlayfs/super.c:1811:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D -EINVAL;
           ^     ~~~~~~~
   fs/overlayfs/super.c:1811:2: note: Value stored to 'err' is never read
           err =3D -EINVAL;
           ^     ~~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/video/hdmi.c:59:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:59:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:125:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:125:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:226:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:226:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:233:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(frame->vendor, vendor, min(len, sizeof(frame->vendor)));
--
               ^~~~~~~~~~~
   drivers/mfd/as3711.c:145:2: note: Taking false branch
           if (client->irq)
           ^
   drivers/mfd/as3711.c:149:6: note: Calling 'IS_ERR'
           if (IS_ERR(as3711->regmap)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/as3711.c:149:6: note: Returning from 'IS_ERR'
           if (IS_ERR(as3711->regmap)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/as3711.c:149:2: note: Taking false branch
           if (IS_ERR(as3711->regmap)) {
           ^
   drivers/mfd/as3711.c:157:6: note: Assuming 'ret' is not equal to 0
           if (!ret)
               ^~~~
   drivers/mfd/as3711.c:157:2: note: Taking false branch
           if (!ret)
           ^
   drivers/mfd/as3711.c:159:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/mfd/as3711.c:159:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/mfd/as3711.c:163:6: note: Assuming 'id1' is equal to 139
           if (id1 !=3D 0x8b)
               ^~~~~~~~~~~
   drivers/mfd/as3711.c:163:2: note: Taking false branch
           if (id1 !=3D 0x8b)
           ^
   drivers/mfd/as3711.c:165:2: note: Loop condition is false.  Exiting loop
           dev_info(as3711->dev, "AS3711 detected: %x:%x\n", id1, id2);
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mfd/as3711.c:165:2: note: 4th function call argument is an unini=
tialized value
           dev_info(as3711->dev, "AS3711 detected: %x:%x\n", id1, id2);
           ^
   include/linux/dev_printk.h:150:24: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
                                 ^                                         =
 ~~~~~~~~~~~
   include/linux/dev_printk.h:110:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                   ^                   ~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/misc/enclosure.c:186:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:186:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:187:2: warning: Call to function 'strcat' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   drivers/misc/enclosure.c:187:2: note: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   drivers/misc/enclosure.c:310:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(newname, COMPONENT_NAME_SIZE,
                   ^~~~~~~~
   drivers/misc/enclosure.c:310:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(newname, COMPONENT_NAME_SIZE,
                   ^~~~~~~~
   drivers/misc/enclosure.c:313:4: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(newname, COMPONENT_NAME_SIZE,
                           ^~~~~~~~
   drivers/misc/enclosure.c:313:4: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           snprintf(newname, COMPONENT_NAME_SIZE,
                           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> drivers/misc/kgdbts.c:240:2: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           sprintf(scratch_buf, "%s,%lx,%i", bp_type, addr,
           ^~~~~~~
   drivers/misc/kgdbts.c:240:2: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           sprintf(scratch_buf, "%s,%lx,%i", bp_type, addr,
           ^~~~~~~
   drivers/misc/kgdbts.c:390:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(scratch_buf, 0, sizeof(scratch_buf));
           ^~~~~~
   drivers/misc/kgdbts.c:390:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(scratch_buf, 0, sizeof(scratch_buf));
           ^~~~~~
   drivers/misc/kgdbts.c:709:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(get_buf, buf);
           ^~~~~~
   drivers/misc/kgdbts.c:709:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(get_buf, buf);
           ^~~~~~
   drivers/misc/kgdbts.c:714:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(get_buf, "#");
           ^~~~~~
   drivers/misc/kgdbts.c:714:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(get_buf, "#");
           ^~~~~~
   drivers/misc/kgdbts.c:832:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ts, 0, sizeof(ts));
           ^~~~~~
   drivers/misc/kgdbts.c:832:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&ts, 0, sizeof(ts));
           ^~~~~~
   drivers/misc/kgdbts.c:1075:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(config, opt);
           ^~~~~~
   drivers/misc/kgdbts.c:1075:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(config, opt);
           ^~~~~~
   drivers/misc/kgdbts.c:1146:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(config, kmessage);
                   ^~~~~~
   drivers/misc/kgdbts.c:1146:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(config, kmessage);
                   ^~~~~~
   drivers/misc/kgdbts.c:1155:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(config, kmessage);
           ^~~~~~
   drivers/misc/kgdbts.c:1155:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(config, kmessage);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/char/ipmi/ipmi_kcs_sm.c:285:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kcs->write_data, data, size);
           ^~~~~~
   drivers/char/ipmi/ipmi_kcs_sm.c:285:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(kcs->write_data, data, size);
           ^~~~~~
   drivers/char/ipmi/ipmi_kcs_sm.c:304:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, kcs->read_data, kcs->read_pos);
           ^~~~~~
   drivers/char/ipmi/ipmi_kcs_sm.c:304:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, kcs->read_data, kcs->read_pos);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/char/ipmi/ipmi_smic_sm.c:144:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(smic->write_data, data, size);
           ^~~~~~
   drivers/char/ipmi/ipmi_smic_sm.c:144:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(smic->write_data, data, size);
           ^~~~~~
   drivers/char/ipmi/ipmi_smic_sm.c:169:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, smic->read_data, smic->read_pos);
           ^~~~~~
   drivers/char/ipmi/ipmi_smic_sm.c:169:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, smic->read_data, smic->read_pos);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/char/ipmi/ipmi_bt_sm.c:155:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "B_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:155:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "B_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:157:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "H_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:157:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "H_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:159:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "OEM0 ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:159:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "OEM0 ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:161:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "SMS ");
--
                       ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   mm/memory.c:2578:7: note: Taking false branch
                   if (WARN_ON_ONCE(pmd_leaf(*pmd)))
                       ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   mm/memory.c:2578:3: note: Taking false branch
                   if (WARN_ON_ONCE(pmd_leaf(*pmd)))
                   ^
   mm/memory.c:2580:7: note: Assuming the condition is false
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                       ^~~~~~~~~~~~~~~
   mm/memory.c:2580:23: note: Left side of '&&' is false
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                                       ^
   mm/memory.c:2585:9: note: Calling 'apply_to_pte_range'
                   err =3D apply_to_pte_range(mm, pmd, addr, next,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2520:2: note: 'ptl' declared without an initial value
           spinlock_t *ptl;
           ^~~~~~~~~~~~~~~
   mm/memory.c:2522:6: note: 'create' is false
           if (create) {
               ^~~~~~
   mm/memory.c:2522:2: note: Taking false branch
           if (create) {
           ^
   mm/memory.c:2529:23: note: Assuming the condition is true
                   mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
                                       ^~~~~~~~~~~~~~
   mm/memory.c:2529:22: note: '?' condition is true
                   mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
                                      ^
   mm/memory.c:2536:2: note: Loop condition is false.  Exiting loop
           arch_enter_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:986:36: note: expanded from macro 'arch_enter_la=
zy_mmu_mode'
   #define arch_enter_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:2538:6: note: Assuming 'fn' is null
           if (fn) {
               ^~
   mm/memory.c:2538:2: note: Taking false branch
           if (fn) {
           ^
   mm/memory.c:2549:2: note: Loop condition is false.  Exiting loop
           arch_leave_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:987:36: note: expanded from macro 'arch_leave_la=
zy_mmu_mode'
   #define arch_leave_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:2551:6: note: Assuming the condition is true
           if (mm !=3D &init_mm)
               ^~~~~~~~~~~~~~
   mm/memory.c:2551:2: note: Taking true branch
           if (mm !=3D &init_mm)
           ^
   mm/memory.c:2552:3: note: 1st function call argument is an uninitialized=
 value
                   pte_unmap_unlock(mapped_pte, ptl);
                   ^
   include/linux/mm.h:2351:2: note: expanded from macro 'pte_unmap_unlock'
           spin_unlock(ptl);                               \
           ^           ~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/misc/lkdtm/usercopy.c:145:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(one, 'A', size);
           ^~~~~~
   drivers/misc/lkdtm/usercopy.c:145:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(one, 'A', size);
           ^~~~~~
   drivers/misc/lkdtm/usercopy.c:146:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(two, 'B', size);
           ^~~~~~
   drivers/misc/lkdtm/usercopy.c:146:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(two, 'B', size);
           ^~~~~~
   drivers/misc/lkdtm/usercopy.c:222:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 'B', cache_size);
           ^~~~~~
   drivers/misc/lkdtm/usercopy.c:222:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(buf, 'B', cache_size);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
>> drivers/gpu/drm/drm_dp_aux_dev.c:115:8: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           res =3D sprintf(buf, "%s\n", aux_dev->aux->name);
                 ^~~~~~~
   drivers/gpu/drm/drm_dp_aux_dev.c:115:8: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           res =3D sprintf(buf, "%s\n", aux_dev->aux->name);
                 ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/gpu/drm/selftests/test-drm_mm.c:212:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm, 0, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:212:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&mm, 0, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:218:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm, 0xff, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:218:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&mm, 0xff, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:236:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:236:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:277:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(nodes, 0, sizeof(nodes));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:277:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(nodes, 0, sizeof(nodes));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:600:4: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(node, 0, sizeof(*node));
                           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:600:4: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                           memset(node, 0, sizeof(*node));
                           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1471:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1471:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1952:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsvd_lo, 0, sizeof(rsvd_lo));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1952:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&rsvd_lo, 0, sizeof(rsvd_lo));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1961:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsvd_hi, 0, sizeof(rsvd_hi));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1961:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&rsvd_hi, 0, sizeof(rsvd_hi));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1976:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&node, 0, sizeof(node));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1976:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&node, 0, sizeof(node));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2181:2: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:376:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: Assuming '__UNIQU=
E_ID___x238' is >=3D '__UNIQUE_ID___y239'
           const unsigned int count =3D min(4096u, max_iterations);
                                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: '?' condition is =
false
           const unsigned int count =3D min(4096u, max_iterations);
--
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/mtd/devices/block2mtd.c:74:5: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(page_address(page), 0xff, PAGE_SI=
ZE);
                                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:74:5: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                                   memset(page_address(page), 0xff, PAGE_SI=
ZE);
                                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:124:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, page_address(page) + offset, cpylen);
                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:124:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, page_address(page) + offset, cpylen);
                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:160:4: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(page_address(page) + offset, buf, cpylen);
                           ^~~~~~
   drivers/mtd/devices/block2mtd.c:160:4: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(page_address(page) + offset, buf, cpylen);
                           ^~~~~~
   drivers/mtd/devices/block2mtd.c:402:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/block2mtd.c:402:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/usb/musb/musb_debugfs.c:171:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:171:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/usb/typec/class.c:103:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", id->id_header);
                  ^~~~~~~
   drivers/usb/typec/class.c:103:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", id->id_header);
                  ^~~~~~~
   drivers/usb/typec/class.c:112:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", id->cert_stat);
                  ^~~~~~~
   drivers/usb/typec/class.c:112:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", id->cert_stat);
                  ^~~~~~~
   drivers/usb/typec/class.c:121:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", id->product);
                  ^~~~~~~
   drivers/usb/typec/class.c:121:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", id->product);
                  ^~~~~~~
   drivers/usb/typec/class.c:303:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dir, sizeof(dir), "mode%d", adev->mode);
           ^~~~~~~~
   drivers/usb/typec/class.c:303:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(dir, sizeof(dir), "mode%d", adev->mode);
           ^~~~~~~~
   drivers/usb/typec/class.c:335:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", alt->vdo);
                  ^~~~~~~
   drivers/usb/typec/class.c:335:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", alt->vdo);
                  ^~~~~~~
>> drivers/usb/typec/class.c:344:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   drivers/usb/typec/class.c:344:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   drivers/usb/typec/class.c:353:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", alt->active ? "yes" : "no");
                  ^~~~~~~
   drivers/usb/typec/class.c:353:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", alt->active ? "yes" : "no");
                  ^~~~~~~
   drivers/usb/typec/class.c:404:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "source\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:404:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "source\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:407:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:407:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:411:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "source sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:411:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "source sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:423:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", adev->mode);
                  ^~~~~~~
   drivers/usb/typec/class.c:423:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", adev->mode);
                  ^~~~~~~
   drivers/usb/typec/class.c:432:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%04x\n", adev->svid);
                  ^~~~~~~
   drivers/usb/typec/class.c:432:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%04x\n", adev->svid);
                  ^~~~~~~
   drivers/usb/typec/class.c:528:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           alt->roles =3D desc->roles;
                      ^
   drivers/usb/typec/class.c:1940:6: note: Assuming 'altmodes_node' is non-=
null
           if (!altmodes_node)
               ^~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1940:2: note: Taking false branch
           if (!altmodes_node)
           ^
   drivers/usb/typec/class.c:1943:2: note: Loop condition is true.  Enterin=
g loop body
           fwnode_for_each_child_node(altmodes_node, child) {
           ^
   include/linux/property.h:101:2: note: expanded from macro 'fwnode_for_ea=
ch_child_node'
           for (child =3D fwnode_get_next_child_node(fwnode, NULL); child; =
  \
           ^
   drivers/usb/typec/class.c:1945:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1945:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1952:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1952:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1958:7: note: Assuming 'index' is < 'n'
                   if (index >=3D n) {
                       ^~~~~~~~~~
   drivers/usb/typec/class.c:1958:3: note: Taking false branch
                   if (index >=3D n) {
                   ^
   drivers/usb/typec/class.c:1967:9: note: Calling 'typec_port_register_alt=
mode'
                   alt =3D typec_port_register_altmode(port, &desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1915:2: note: Taking false branch
           if (IS_ERR(mux))
           ^
   drivers/usb/typec/class.c:1918:9: note: Calling 'typec_register_altmode'
           adev =3D typec_register_altmode(&port->dev, desc);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:519:8: note: Calling 'kzalloc'
           alt =3D kzalloc(sizeof(*alt), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
--
           ^
   drivers/media/dvb-frontends/ds3000.c:24:2: note: expanded from macro 'dp=
rintk'
           do { \
           ^
   drivers/media/dvb-frontends/ds3000.c:699:15: note: Assuming 'i' is >=3D =
field 'msg_len'
           for (i =3D 0 ; i < d->msg_len;) {
                        ^~~~~~~~~~~~~~
   drivers/media/dvb-frontends/ds3000.c:699:2: note: Loop condition is fals=
e. Execution continues on line 706
           for (i =3D 0 ; i < d->msg_len;) {
           ^
   drivers/media/dvb-frontends/ds3000.c:711:2: note: Loop condition is fals=
e. Execution continues on line 714
           for (i =3D 0; i < d->msg_len; i++)
           ^
   drivers/media/dvb-frontends/ds3000.c:720:28: note: The result of the lef=
t shift is undefined because the left operand is negative
           data |=3D ((d->msg_len - 1) << 3) | 0x07;
                    ~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/ds3000.c:850:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &ds3000_ops,
           ^~~~~~
   drivers/media/dvb-frontends/ds3000.c:850:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &ds3000_ops,
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/media/tuners/tda18250.c:445:11: warning: The result of the left =
shift is undefined due to shifting by '4294967295', which is greater or equ=
al to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:439:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/tuners/tda18250.c:439:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/tuners/tda18250.c:443:6: note: Assuming 'exp' is > 5
           if (exp > 5)
               ^~~~~~~
   drivers/media/tuners/tda18250.c:443:2: note: Taking true branch
           if (exp > 5)
           ^
   drivers/media/tuners/tda18250.c:445:11: note: The result of the left shi=
ft is undefined due to shifting by '4294967295', which is greater or equal =
to the width of type 'int'
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18250.c:845:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &tda18250_ops,
           ^~~~~~
   drivers/media/tuners/tda18250.c:845:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &tda18250_ops,
           ^~~~~~
   drivers/media/tuners/tda18250.c:866:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   drivers/media/tuners/tda18250.c:866:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/input/misc/yealink.c:288:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:288:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:305:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:305:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:321:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:321:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
>> drivers/input/misc/yealink.c:691:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:691:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:979:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/yealink.c:979:2: note: Value stored to 'ret' is never=
 read
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   fs/xfs/xfs_bmap_item.c:579:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buip->bui_format.bui_extents, extp, count * sizeof(*extp)=
);
           ^~~~~~
   fs/xfs/xfs_bmap_item.c:579:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(buip->bui_format.bui_extents, extp, count * sizeof(*extp)=
);
           ^~~~~~
   fs/xfs/xfs_bmap_item.c:613:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_bui_fmt, src_bui_fmt, len);
                   ^~~~~~
   fs/xfs/xfs_bmap_item.c:613:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(dst_bui_fmt, src_bui_fmt, len);
                   ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   fs/xfs/xfs_buf_item_recover.c:505:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(xfs_buf_offset(bp,
                   ^~~~~~
   fs/xfs/xfs_buf_item_recover.c:505:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(xfs_buf_offset(bp,
                   ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   fs/xfs/xfs_dquot_item_recover.c:148:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ddq, recddq, item->ri_buf[1].i_len);
           ^~~~~~
   fs/xfs/xfs_dquot_item_recover.c:148:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ddq, recddq, item->ri_buf[1].i_len);
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   fs/cifs/fs_context.c:307:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_ctx, ctx, sizeof(*ctx));
           ^~~~~~
   fs/cifs/fs_context.c:307:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(new_ctx, ctx, sizeof(*ctx));
           ^~~~~~
   fs/cifs/fs_context.c:601:4: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(key + len, options);
                           ^~~~~~
   fs/cifs/fs_context.c:601:4: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                           strcpy(key + len, options);
                           ^~~~~~
   fs/cifs/fs_context.c:1225:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ctx->source_rfc1001_name, 0x20,
                   ^~~~~~
   fs/cifs/fs_context.c:1225:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(ctx->source_rfc1001_name, 0x20,
                   ^~~~~~
   fs/cifs/fs_context.c:1246:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ctx->target_rfc1001_name, 0x20,
                   ^~~~~~
   fs/cifs/fs_context.c:1246:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(ctx->target_rfc1001_name, 0x20,
                   ^~~~~~
   fs/cifs/fs_context.c:1492:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ctx->source_rfc1001_name, 0x20, RFC1001_NAME_LEN);
           ^~~~~~
   fs/cifs/fs_context.c:1492:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(ctx->source_rfc1001_name, 0x20, RFC1001_NAME_LEN);
           ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/pcmcia/socket_sysfs.c:162:8: warning: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "0x%x\n", &mask);
                 ^~~~~~
   drivers/pcmcia/socket_sysfs.c:162:8: note: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "0x%x\n", &mask);
                 ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/pcmcia/ds.c:105:11: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           fields =3D sscanf(buf, "%hx %hx %hx %hhx %hhx %hhx %x %x %x %x",
                    ^~~~~~
   drivers/pcmcia/ds.c:105:11: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
           fields =3D sscanf(buf, "%hx %hx %hx %hhx %hhx %hhx %x %x %x %x",
                    ^~~~~~
   drivers/pcmcia/ds.c:121:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dynid->id.prod_id_hash, prod_id_hash, sizeof(__u32) * 4);
--
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:159:6: note: Assuming field 'star=
t' is non-null
           if (!iter.start) {
               ^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:159:2: note: Taking false branch
           if (!iter.start) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:186:6: note: 'n_bomap_pages' is 0
           if (n_bomap_pages) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:186:2: note: Taking false branch
           if (n_bomap_pages) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:196:14: note: Assuming 'i' is < f=
ield 'nr_bos'
           for (i =3D 0; i < submit->nr_bos; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:196:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < submit->nr_bos; i++) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:207:8: note: Calling 'IS_ERR'
                   if (!IS_ERR(pages)) {
                        ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:207:8: note: Returning from 'IS_E=
RR'
                   if (!IS_ERR(pages)) {
                        ^~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:207:3: note: Taking true branch
                   if (!IS_ERR(pages)) {
                   ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:212:16: note: Assuming the condit=
ion is true
                           for (j =3D 0; j < obj->base.size >> PAGE_SHIFT; =
j++)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:212:4: note: Loop condition is tr=
ue.  Entering loop body
                           for (j =3D 0; j < obj->base.size >> PAGE_SHIFT; =
j++)
                           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:213:6: note: Null pointer value s=
tored to 'bomap'
                                   *bomap++ =3D cpu_to_le64(page_to_phys(*p=
ages++));
                                    ^~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:213:14: note: Dereference of null=
 pointer
                                   *bomap++ =3D cpu_to_le64(page_to_phys(*p=
ages++));
                                   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:220:4: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(iter.data, vaddr, obj->base.size);
                           ^~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:220:4: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(iter.data, vaddr, obj->base.size);
                           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/media/usb/dvb-usb-v2/anysee.c:44:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->buf[0], sbuf, slen);
           ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:44:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->buf[0], sbuf, slen);
           ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:97:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(rbuf, state->buf, rlen);
                   ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:97:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(rbuf, state->buf, rlen);
                   ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:227:4: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&buf[4], msg[i].buf, msg[i].len);
                           ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:227:4: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&buf[4], msg[i].buf, msg[i].len);
                           ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:1029:5: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&adap->fe[1]->ops.tuner_ops,
                                   ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:1029:5: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&adap->fe[1]->ops.tuner_ops,
                                   ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:1065:4: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&adap->fe[1]->ops.tuner_ops,
                           ^~~~~~
   drivers/media/usb/dvb-usb-v2/anysee.c:1065:4: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&adap->fe[1]->ops.tuner_ops,
                           ^~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
>> drivers/usb/typec/bus.c:301:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   drivers/usb/typec/bus.c:301:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
>> drivers/usb/typec/altmodes/displayport.c:396:8: warning: Call to functio=
n 'sprintf' is insecure as it does not provide bounding of the memory buffe=
r or security checks introduced in the C11 standard. Replace with analogous=
 functions that support length arguments or provides boundary checks such a=
s 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecate=
dOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%s ", cur ? "USB" : "[USB]");
                 ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:396:8: note: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11
           len =3D sprintf(buf, "%s ", cur ? "USB" : "[USB]");
                 ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:400:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "[%s] ", configurati=
ons[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:400:11: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "[%s] ", configurati=
ons[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:403:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "%s ", configuration=
s[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:403:11: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "%s ", configuration=
s[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:496:12: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                                   len +=3D sprintf(buf + len, "[%s] ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:496:12: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                                   len +=3D sprintf(buf + len, "[%s] ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:499:12: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                                   len +=3D sprintf(buf + len, "%s ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:499:12: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                                   len +=3D sprintf(buf + len, "%s ",
                                          ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   fs/btrfs/send.c:429:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(tmp_buf, p->buf, old_buf_len);
                           ^~~~~~
   fs/btrfs/send.c:429:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(tmp_buf, p->buf, old_buf_len);
                           ^~~~~~
   fs/btrfs/send.c:446:3: warning: Call to function 'memmove' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(p->start, tmp_buf, path_len + 1);
                   ^~~~~~~
   fs/btrfs/send.c:446:3: note: Call to function 'memmove' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memmove_s' in case of C11
                   memmove(p->start, tmp_buf, path_len + 1);
                   ^~~~~~~
   fs/btrfs/send.c:492:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(prepared, name, name_len);
           ^~~~~~
   fs/btrfs/send.c:492:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(prepared, name, name_len);
           ^~~~~~
   fs/btrfs/send.c:506:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(prepared, p2->start, p2->end - p2->start);
           ^~~~~~
   fs/btrfs/send.c:506:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(prepared, p2->start, p2->end - p2->start);
           ^~~~~~
   fs/btrfs/send.c:554:2: warning: Call to function 'memmove' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(p->start, tmp, len + 1);
           ^~~~~~~
   fs/btrfs/send.c:554:2: note: Call to function 'memmove' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memmove_s' in case of C11
           memmove(p->start, tmp, len + 1);
           ^~~~~~~
   fs/btrfs/send.c:605:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(hdr + 1, data, len);
           ^~~~~~
   fs/btrfs/send.c:605:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(hdr + 1, data, len);
           ^~~~~~
   fs/btrfs/send.c:1058:2: warning: Value stored to 'len' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           len =3D 0;
           ^     ~
   fs/btrfs/send.c:1058:2: note: Value stored to 'len' is never read
           len =3D 0;
           ^     ~
   fs/btrfs/send.c:1130:2: warning: Potential leak of memory pointed to by =
'buf' [clang-analyzer-unix.Malloc]
           return ret;
           ^
   fs/btrfs/send.c:7085:6: note: Assuming 'left_path' is non-null
           if (!left_path) {
               ^~~~~~~~~~
   fs/btrfs/send.c:7085:2: note: Taking false branch
           if (!left_path) {
           ^
   fs/btrfs/send.c:7090:6: note: Assuming 'right_path' is non-null
           if (!right_path) {
               ^~~~~~~~~~~
   fs/btrfs/send.c:7090:2: note: Taking false branch
           if (!right_path) {
           ^
   fs/btrfs/send.c:7096:6: note: Assuming 'tmp_buf' is non-null
           if (!tmp_buf) {
               ^~~~~~~~
   fs/btrfs/send.c:7096:2: note: Taking false branch
           if (!tmp_buf) {
           ^
   fs/btrfs/send.c:7154:6: note: Assuming the condition is false
           if (!left_path->nodes[left_level]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:7154:2: note: Taking false branch
           if (!left_path->nodes[left_level]) {
--
           ^
   drivers/media/i2c/ov5647.c:811:3: note: Loop condition is false.  Exitin=
g loop
                   dev_dbg(dev, "software standby failed\n");
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/media/i2c/ov5647.c:813:8: note: The left expression of the compo=
und assignment is an uninitialized value. The computed value will also be g=
arbage
           rdval &=3D ~0x01;
           ~~~~~ ^
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/media/dvb-frontends/ves1x93.c:493:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &ves1x93_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/ves1x93.c:493:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &ves1x93_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/usb/storage/onetouch.c:213:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(onetouch->name, sizeof(onetouch->name),
                   ^~~~~~~~
   drivers/usb/storage/onetouch.c:213:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(onetouch->name, sizeof(onetouch->name),
                   ^~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/usb/storage/sddr09.c:240:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, ecc, 3);
           ^~~~~~
   drivers/usb/storage/sddr09.c:240:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, ecc, 3);
           ^~~~~~
   drivers/usb/storage/sddr09.c:352:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:352:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:528:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:528:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:717:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:717:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:796:4: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(buffer, 0, len);
                           ^~~~~~
   drivers/usb/storage/sddr09.c:796:4: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                           memset(buffer, 0, len);
                           ^~~~~~
   drivers/usb/storage/sddr09.c:922:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bptr, xptr, info->pagesize);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:922:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(bptr, xptr, info->pagesize);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1076:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:1076:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:1106:3: warning: Value stored to 'wp_fmt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   wp_fmt =3D " WP";
                   ^        ~~~~~
   drivers/usb/storage/sddr09.c:1106:3: note: Value stored to 'wp_fmt' is n=
ever read
                   wp_fmt =3D " WP";
                   ^        ~~~~~
   drivers/usb/storage/sddr09.c:1108:3: warning: Value stored to 'wp_fmt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   wp_fmt =3D "";
                   ^        ~~
   drivers/usb/storage/sddr09.c:1108:3: note: Value stored to 'wp_fmt' is n=
ever read
                   wp_fmt =3D "";
                   ^        ~~
   drivers/usb/storage/sddr09.c:1153:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(blurbtxt, "sddr09: Found Flash card, ID =3D %4ph", devic=
eID);
           ^~~~~~~
   drivers/usb/storage/sddr09.c:1153:2: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           sprintf(blurbtxt, "sddr09: Found Flash card, ID =3D %4ph", devic=
eID);
           ^~~~~~~
>> drivers/usb/storage/sddr09.c:1156:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(blurbtxt + strlen(blurbtxt),
           ^~~~~~~
   drivers/usb/storage/sddr09.c:1156:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(blurbtxt + strlen(blurbtxt),
           ^~~~~~~
   drivers/usb/storage/sddr09.c:1168:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1168:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1171:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1171:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1177:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1177:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1183:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1183:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1188:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1188:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1563:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ptr, 0, 18);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1563:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(ptr, 0, 18);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1581:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ptr, inquiry_response, 8);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1581:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ptr, inquiry_response, 8);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1639:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ptr, mode_page_01, sizeof(mode_page_01));
                           ^~~~~~
   drivers/usb/storage/sddr09.c:1639:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ptr, mode_page_01, sizeof(mode_page_01));
                           ^~~~~~
   drivers/usb/storage/sddr09.c:1705:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ptr+strlen(ptr), "%02X ", srb->cmnd[i]);
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1705:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(ptr+strlen(ptr), "%02X ", srb->cmnd[i]);
                   ^~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/ata/libata-core.c:92:8: warning: Excessive padding in 'struct at=
a_force_param' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   xfer_mask, =

   horkage_on, =

   horkage_off, =

   lflags, =

   cbl, =

   spd_limit, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ata_force_param {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:92:8: note: Excessive padding in 'struct ata_f=
orce_param' (4 padding bytes, where 0 is optimal). Optimal fields order: na=
me, xfer_mask, horkage_on, horkage_off, lflags, cbl, spd_limit, consider re=
ordering the fields or adding explicit padding members
   struct ata_force_param {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:1512:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(qc->cdb, cdb, ATAPI_CDB_LEN);
                   ^~~~~~
   drivers/ata/libata-core.c:1512:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(qc->cdb, cdb, ATAPI_CDB_LEN);
                   ^~~~~~
   drivers/ata/libata-core.c:2114:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cmds, ap->sector_buf, ATA_LOG_NCQ_SEND_RECV_SIZE);
                   ^~~~~~
   drivers/ata/libata-core.c:2114:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cmds, ap->sector_buf, ATA_LOG_NCQ_SEND_RECV_SIZE);
                   ^~~~~~
   drivers/ata/libata-core.c:2139:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cmds, ap->sector_buf, ATA_LOG_NCQ_NON_DATA_SIZE);
                   ^~~~~~
   drivers/ata/libata-core.c:2139:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cmds, ap->sector_buf, ATA_LOG_NCQ_NON_DATA_SIZE);
                   ^~~~~~
   drivers/ata/libata-core.c:2205:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(desc, desc_sz, "NCQ (not used)");
                   ^~~~~~~~
   drivers/ata/libata-core.c:2205:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(desc, desc_sz, "NCQ (not used)");
--
                   ^~~~~~
   net/tls/tls_main.c:390:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(crypto_info_aes_gcm_128->iv,
                   ^~~~~~
   net/tls/tls_main.c:393:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(crypto_info_aes_gcm_128->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:393:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(crypto_info_aes_gcm_128->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:414:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(crypto_info_aes_gcm_256->iv,
                   ^~~~~~
   net/tls/tls_main.c:414:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(crypto_info_aes_gcm_256->iv,
                   ^~~~~~
   net/tls/tls_main.c:417:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(crypto_info_aes_gcm_256->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:417:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(crypto_info_aes_gcm_256->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:436:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(aes_ccm_128->iv,
                   ^~~~~~
   net/tls/tls_main.c:436:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(aes_ccm_128->iv,
                   ^~~~~~
   net/tls/tls_main.c:439:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(aes_ccm_128->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:439:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(aes_ccm_128->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:457:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(chacha20_poly1305->iv,
                   ^~~~~~
   net/tls/tls_main.c:457:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(chacha20_poly1305->iv,
                   ^~~~~~
   net/tls/tls_main.c:460:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(chacha20_poly1305->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:460:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(chacha20_poly1305->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:478:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sm4_gcm_info->iv,
                   ^~~~~~
   net/tls/tls_main.c:478:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(sm4_gcm_info->iv,
                   ^~~~~~
   net/tls/tls_main.c:481:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sm4_gcm_info->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:481:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(sm4_gcm_info->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:498:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sm4_ccm_info->iv,
                   ^~~~~~
   net/tls/tls_main.c:498:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(sm4_ccm_info->iv,
                   ^~~~~~
   net/tls/tls_main.c:501:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sm4_ccm_info->rec_seq, cctx->rec_seq,
                   ^~~~~~
   net/tls/tls_main.c:501:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(sm4_ccm_info->rec_seq, cctx->rec_seq,
                   ^~~~~~
   Suppressed 98 warnings (98 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   drivers/infiniband/core/sysfs.c:590:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, out_mad->data + offset, size);
           ^~~~~~
   drivers/infiniband/core/sysfs.c:590:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, out_mad->data + offset, size);
           ^~~~~~
   drivers/infiniband/core/sysfs.c:1111:7: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (snprintf(element->name, sizeof(element->name), "%d",=
 i) >=3D
                       ^~~~~~~~
   drivers/infiniband/core/sysfs.c:1111:7: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   if (snprintf(element->name, sizeof(element->name), "%d",=
 i) >=3D
                       ^~~~~~~~
   drivers/infiniband/core/sysfs.c:1368:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(desc.node_desc, buf, min_t(int, count, IB_DEVICE_NODE_DES=
C_MAX));
           ^~~~~~
   drivers/infiniband/core/sysfs.c:1368:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(desc.node_desc, buf, min_t(int, count, IB_DEVICE_NODE_DES=
C_MAX));
           ^~~~~~
   Suppressed 79 warnings (79 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   drivers/infiniband/core/device.c:425:2: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
           ret =3D rename_compat_devs(ibdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/device.c:425:2: note: Value stored to 'ret' is n=
ever read
           ret =3D rename_compat_devs(ibdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/core/device.c:465:7: warning: Call to function 'sscan=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sscanf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                   if (sscanf(dev_name(&device->dev), name, &i) !=3D 1)
                       ^~~~~~
   drivers/infiniband/core/device.c:465:7: note: Call to function 'sscanf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sscanf_s'=
 in case of C11
                   if (sscanf(dev_name(&device->dev), name, &i) !=3D 1)
                       ^~~~~~
   drivers/infiniband/core/device.c:469:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, sizeof buf, name, i);
                   ^~~~~~~~
   drivers/infiniband/core/device.c:469:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, sizeof buf, name, i);
                   ^~~~~~~~
   drivers/infiniband/core/device.c:1249:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&device->attrs, 0, sizeof(device->attrs));
           ^~~~~~
   drivers/infiniband/core/device.c:1249:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&device->attrs, 0, sizeof(device->attrs));
           ^~~~~~
   drivers/infiniband/core/device.c:2019:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   drivers/infiniband/core/device.c:2019:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   drivers/infiniband/core/device.c:2057:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   drivers/infiniband/core/device.c:2057:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   Suppressed 93 warnings (93 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/mcb/mcb-parse.c:210:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
           ^~~~~~~~
   drivers/mcb/mcb-parse.c:210:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   net/sched/sch_mq.c:136:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sch->qstats, 0, sizeof(sch->qstats));
           ^~~~~~
   net/sched/sch_mq.c:136:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&sch->qstats, 0, sizeof(sch->qstats));
           ^~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   net/rxrpc/sendmsg.c:547:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&p->call.timeouts, CMSG_DATA(cmsg), len);
                           ^~~~~~
   net/rxrpc/sendmsg.c:547:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(&p->call.timeouts, CMSG_DATA(cmsg), len);
                           ^~~~~~
   net/rxrpc/sendmsg.c:598:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/rxrpc/sendmsg.c:598:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   Suppressed 78 warnings (78 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   net/rxrpc/server_key.c:78:6: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(prep->orig_description, "%u:%u%n", &service, &sec_cla=
ss, &n) !=3D 2)
               ^~~~~~
   net/rxrpc/server_key.c:78:6: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
           if (sscanf(prep->orig_description, "%u:%u%n", &service, &sec_cla=
ss, &n) !=3D 2)
               ^~~~~~
   Suppressed 78 warnings (78 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5720:30: note: Left side of '&&' is false
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
                                       ^
   net/netfilter/nf_tables_api.c:5723:6: note: Assuming 'flags' is equal to=
 0
           if (flags !=3D 0)
               ^~~~~~~~~~
   net/netfilter/nf_tables_api.c:5723:2: note: Taking false branch
           if (flags !=3D 0)
           ^
   net/netfilter/nf_tables_api.c:5726:6: note: Assuming the condition is fa=
lse
           if (set->flags & NFT_SET_MAP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5726:2: note: Taking false branch
           if (set->flags & NFT_SET_MAP) {
           ^
   net/netfilter/nf_tables_api.c:5731:7: note: Assuming the condition is fa=
lse
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5731:3: note: Taking false branch
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                   ^
   net/netfilter/nf_tables_api.c:5735:42: note: Left side of '&&' is false
           if ((flags & NFT_SET_ELEM_INTERVAL_END) &&
                                                   ^
   net/netfilter/nf_tables_api.c:5746:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5746:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5753:13: note: Assuming the condition is f=
alse
           } else if (set->flags & NFT_SET_TIMEOUT) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5753:9: note: Taking false branch
           } else if (set->flags & NFT_SET_TIMEOUT) {
                  ^
   net/netfilter/nf_tables_api.c:5758:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5758:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5767:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_SET_ELEM_EXPR]) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5767:2: note: Taking true branch
           if (nla[NFTA_SET_ELEM_EXPR]) {
           ^
   net/netfilter/nf_tables_api.c:5770:7: note: Assuming field 'num_exprs' i=
s 0
                   if (set->num_exprs && set->num_exprs !=3D 1)
                       ^~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5770:22: note: Left side of '&&' is false
                   if (set->num_exprs && set->num_exprs !=3D 1)
                                      ^
   net/netfilter/nf_tables_api.c:5773:10: note: Calling 'nft_set_elem_expr_=
alloc'
                   expr =3D nft_set_elem_expr_alloc(ctx, set,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5332:9: note: Calling 'nft_expr_init'
           expr =3D nft_expr_init(ctx, attr);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2795:8: note: Calling 'nf_tables_expr_pars=
e'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2714:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:2714:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2718:2: note: Taking true branch
           if (IS_ERR(type))
           ^
   net/netfilter/nf_tables_api.c:2719:3: note: Returning without writing to=
 'info->ops'
                   return PTR_ERR(type);
                   ^
   net/netfilter/nf_tables_api.c:2795:8: note: Returning from 'nf_tables_ex=
pr_parse'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2796:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:2796:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2800:17: note: Access to field 'size' resu=
lts in a dereference of an undefined pointer value (loaded from field 'ops')
           expr =3D kzalloc(expr_info.ops->size, GFP_KERNEL);
                          ^         ~~~
   net/netfilter/nf_tables_api.c:2831:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, src->ops->size);
                   ^~~~~~
   net/netfilter/nf_tables_api.c:2831:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, src->ops->size);
                   ^~~~~~
   net/netfilter/nf_tables_api.c:3012:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&cb->args[1], 0,
                           ^~~~~~
   net/netfilter/nf_tables_api.c:3012:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(&cb->args[1], 0,
                           ^~~~~~
>> net/netfilter/nf_tables_api.c:3804:9: warning: Call to function 'sscanf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sscanf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                           if (!sscanf(i->name, name, &tmp))
                                ^~~~~~
   net/netfilter/nf_tables_api.c:3804:9: note: Call to function 'sscanf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sscanf_s' i=
n case of C11
                           if (!sscanf(i->name, name, &tmp))
                                ^~~~~~
   net/netfilter/nf_tables_api.c:3815:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(inuse, 0, PAGE_SIZE);
                           ^~~~~~
   net/netfilter/nf_tables_api.c:3815:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(inuse, 0, PAGE_SIZE);
                           ^~~~~~
   net/netfilter/nf_tables_api.c:4249:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   net/netfilter/nf_tables_api.c:4249:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   net/netfilter/nf_tables_api.c:5096:16: warning: The left operand of '!=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (desc.type !=3D NFT_DATA_VALUE || desc.len !=3D set->klen) {
                         ^
   net/netfilter/nf_tables_api.c:6302:2: note: Taking false branch
           if (IS_ERR(table)) {
           ^
   net/netfilter/nf_tables_api.c:6308:2: note: Taking false branch
           if (IS_ERR(set))
           ^
   net/netfilter/nf_tables_api.c:6310:6: note: Assuming the condition is fa=
lse
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6310:34: note: Left side of '&&' is false
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
                                           ^
   net/netfilter/nf_tables_api.c:6315:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6315:2: note: Taking false branch
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
           ^
   net/netfilter/nf_tables_api.c:6318:2: note: Loop condition is true.  Ent=
ering loop body
           nla_for_each_nested(attr, nla[NFTA_SET_ELEM_LIST_ELEMENTS], rem)=
 {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/netfilter/nf_tables_api.c:6319:9: note: Calling 'nft_del_setelem'
                   err =3D nft_del_setelem(&ctx, set, attr);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6132:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:6132:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6136:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:6136:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6139:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6139:30: note: Left side of '&&' is false
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
                                       ^
   net/netfilter/nf_tables_api.c:6144:6: note: Assuming 'flags' is equal to=
 0
           if (flags !=3D 0)
               ^~~~~~~~~~
   net/netfilter/nf_tables_api.c:6144:2: note: Taking false branch
           if (flags !=3D 0)
           ^
   net/netfilter/nf_tables_api.c:6147:2: note: Taking true branch
           if (nla[NFTA_SET_ELEM_KEY]) {
           ^
   net/netfilter/nf_tables_api.c:6148:9: note: Calling 'nft_setelem_parse_k=
ey'
                   err =3D nft_setelem_parse_key(ctx, set, &elem.key.val,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5092:8: note: Calling 'nft_data_init'
           err =3D nft_data_init(ctx, key, NFT_DATA_VALUE_MAXLEN, &desc, at=
tr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9555:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:9555:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:9558:6: note: Assuming the condition is fa=
lse
           if (tb[NFTA_DATA_VALUE])
               ^~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9558:2: note: Taking false branch
           if (tb[NFTA_DATA_VALUE])
           ^
   net/netfilter/nf_tables_api.c:9561:6: note: Assuming the condition is tr=
ue
           if (tb[NFTA_DATA_VERDICT] && ctx !=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9561:6: note: Left side of '&&' is true
   net/netfilter/nf_tables_api.c:9561:31: note: 'ctx' is not equal to NULL
--
                                              ^
   include/linux/kdev_t.h:11:20: note: expanded from macro 'MINOR'
   #define MINOR(dev)      ((unsigned int) ((dev) & MINORMASK))
                           ^
   drivers/md/dm-table.c:362:3: note: Taking false branch
                   if (MAJOR(dev) !=3D major || MINOR(dev) !=3D minor)
                   ^
   drivers/md/dm-table.c:370:19: note: Passing null pointer value via 1st p=
arameter 'l'
           dd =3D find_device(&t->devices, dev);
                            ^~~~~~~~~~~
   drivers/md/dm-table.c:370:7: note: Calling 'find_device'
           dd =3D find_device(&t->devices, dev);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-table.c:215:2: note: Access to field 'next' results in a d=
ereference of a null pointer (loaded from variable 'l')
           list_for_each_entry (dd, l, list)
           ^
   include/linux/list.h:638:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^                ~~~~
   include/linux/list.h:531:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^           ~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^            ~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~
   drivers/md/dm-table.c:359:6: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(path, "%u:%u%c", &major, &minor, &dummy) =3D=3D 2) {
               ^~~~~~
   drivers/md/dm-table.c:359:6: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
           if (sscanf(path, "%u:%u%c", &major, &minor, &dummy) =3D=3D 2) {
               ^~~~~~
   drivers/md/dm-table.c:491:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(argv, old_argv, *size * sizeof(*argv));
                   ^~~~~~
   drivers/md/dm-table.c:491:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(argv, old_argv, *size * sizeof(*argv));
                   ^~~~~~
   drivers/md/dm-table.c:652:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tgt, 0, sizeof(*tgt));
           ^~~~~~
   drivers/md/dm-table.c:652:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(tgt, 0, sizeof(*tgt));
           ^~~~~~
   drivers/md/dm-table.c:743:7: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
               (sscanf(arg_str, "%u%c", value, &dummy) !=3D 1) ||
                ^~~~~~
   drivers/md/dm-table.c:743:7: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
               (sscanf(arg_str, "%u%c", value, &dummy) !=3D 1) ||
                ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/leds/led-triggers.c:86:7: warning: Call to function 'vsnprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   i =3D vsnprintf(NULL, 0, fmt, args);
                       ^~~~~~~~~
   drivers/leds/led-triggers.c:86:7: note: Call to function 'vsnprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'vsnprintf_s' in case of C11
                   i =3D vsnprintf(NULL, 0, fmt, args);
                       ^~~~~~~~~
   drivers/leds/led-triggers.c:279:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)trig->name, name);
           ^~~~~~
   drivers/leds/led-triggers.c:279:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)trig->name, name);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   Suppressed 98 warnings (98 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   Suppressed 101 warnings (101 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   drivers/usb/host/xhci-dbgcap.c:377:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps)=
);
           ^~~~~~
   drivers/usb/host/xhci-dbgcap.c:377:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps)=
);
           ^~~~~~
   drivers/usb/host/xhci-dbgcap.c:828:4: warning: Value stored to 'ctrl' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           ctrl =3D readl(&dbc->regs->control);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-dbgcap.c:828:4: note: Value stored to 'ctrl' is ne=
ver read
                           ctrl =3D readl(&dbc->regs->control);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-dbgcap.c:1004:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   drivers/usb/host/xhci-dbgcap.c:1004:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/iio/adc/twl6030-gpadc.c:911:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D devm_request_threaded_irq(dev, irq, NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/twl6030-gpadc.c:911:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D devm_request_threaded_irq(dev, irq, NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/iio/adc/xilinx-xadc-core.c:628:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data, 0, new_size);
           ^~~~~~
   drivers/iio/adc/xilinx-xadc-core.c:628:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(data, 0, new_size);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/extcon/extcon-max8997.c:416:3: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D max8997_muic_handle_jig_uart(info, attached);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-max8997.c:416:3: note: Value stored to 'ret' is ne=
ver read
                   ret =3D max8997_muic_handle_jig_uart(info, attached);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/staging/greybus/bootrom.c:166:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(firmware_name, sizeof(firmware_name),
           ^~~~~~~~
   drivers/staging/greybus/bootrom.c:166:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(firmware_name, sizeof(firmware_name),
           ^~~~~~~~
   drivers/staging/greybus/bootrom.c:291:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(firmware_response->data, fw->data + offset, size);
           ^~~~~~
   drivers/staging/greybus/bootrom.c:291:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(firmware_response->data, fw->data + offset, size);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/iio/accel/bmc150-accel-core.c:896:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", wm);
                  ^~~~~~~
   drivers/iio/accel/bmc150-accel-core.c:896:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", wm);

vim +185 arch/mips/ath79/setup.c

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   42  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   43  static void __init ath79_=
detect_sys_type(void)
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   44  {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   45  	char *chip =3D "????";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   46  	u32 id;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   47  	u32 major;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   48  	u32 minor;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   49  	u32 rev =3D 0;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20   50  	u32 ver =3D 1;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   51  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   52  	id =3D ath79_reset_rr(AR=
71XX_RESET_REG_REV_ID);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   53  	major =3D id & REV_ID_MA=
JOR_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   54  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   55  	switch (major) {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   56  	case REV_ID_MAJOR_AR71XX:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   57  		minor =3D id & AR71XX_R=
EV_ID_MINOR_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   58  		rev =3D id >> AR71XX_RE=
V_ID_REVISION_SHIFT;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   59  		rev &=3D AR71XX_REV_ID_=
REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   60  		switch (minor) {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   61  		case AR71XX_REV_ID_MINO=
R_AR7130:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   62  			ath79_soc =3D ATH79_SO=
C_AR7130;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   63  			chip =3D "7130";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   64  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   65  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   66  		case AR71XX_REV_ID_MINO=
R_AR7141:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   67  			ath79_soc =3D ATH79_SO=
C_AR7141;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   68  			chip =3D "7141";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   69  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   70  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   71  		case AR71XX_REV_ID_MINO=
R_AR7161:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   72  			ath79_soc =3D ATH79_SO=
C_AR7161;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   73  			chip =3D "7161";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   74  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   75  		}
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   76  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   77  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   78  	case REV_ID_MAJOR_AR7240:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   79  		ath79_soc =3D ATH79_SOC=
_AR7240;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   80  		chip =3D "7240";
8bed1288d479fd Gabor Juhos       2011-06-20   81  		rev =3D id & AR724X_REV=
_ID_REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   82  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   83  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   84  	case REV_ID_MAJOR_AR7241:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   85  		ath79_soc =3D ATH79_SOC=
_AR7241;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   86  		chip =3D "7241";
8bed1288d479fd Gabor Juhos       2011-06-20   87  		rev =3D id & AR724X_REV=
_ID_REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   88  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   89  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   90  	case REV_ID_MAJOR_AR7242:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   91  		ath79_soc =3D ATH79_SOC=
_AR7242;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   92  		chip =3D "7242";
8bed1288d479fd Gabor Juhos       2011-06-20   93  		rev =3D id & AR724X_REV=
_ID_REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   94  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   95  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   96  	case REV_ID_MAJOR_AR913X:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   97  		minor =3D id & AR913X_R=
EV_ID_MINOR_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   98  		rev =3D id >> AR913X_RE=
V_ID_REVISION_SHIFT;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   99  		rev &=3D AR913X_REV_ID_=
REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  100  		switch (minor) {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  101  		case AR913X_REV_ID_MINO=
R_AR9130:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  102  			ath79_soc =3D ATH79_SO=
C_AR9130;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  103  			chip =3D "9130";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  104  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  105  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  106  		case AR913X_REV_ID_MINO=
R_AR9132:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  107  			ath79_soc =3D ATH79_SO=
C_AR9132;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  108  			chip =3D "9132";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  109  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  110  		}
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  111  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  112  =

80a7ed81a840ae Gabor Juhos       2012-03-14  113  	case REV_ID_MAJOR_AR9330:
80a7ed81a840ae Gabor Juhos       2012-03-14  114  		ath79_soc =3D ATH79_SOC=
_AR9330;
80a7ed81a840ae Gabor Juhos       2012-03-14  115  		chip =3D "9330";
80a7ed81a840ae Gabor Juhos       2012-03-14  116  		rev =3D id & AR933X_REV=
_ID_REVISION_MASK;
80a7ed81a840ae Gabor Juhos       2012-03-14  117  		break;
80a7ed81a840ae Gabor Juhos       2012-03-14  118  =

80a7ed81a840ae Gabor Juhos       2012-03-14  119  	case REV_ID_MAJOR_AR9331:
80a7ed81a840ae Gabor Juhos       2012-03-14  120  		ath79_soc =3D ATH79_SOC=
_AR9331;
80a7ed81a840ae Gabor Juhos       2012-03-14  121  		chip =3D "9331";
80a7ed81a840ae Gabor Juhos       2012-03-14  122  		rev =3D id & AR933X_REV=
_ID_REVISION_MASK;
80a7ed81a840ae Gabor Juhos       2012-03-14  123  		break;
80a7ed81a840ae Gabor Juhos       2012-03-14  124  =

d84114660a65e8 Gabor Juhos       2012-03-14  125  	case REV_ID_MAJOR_AR9341:
d84114660a65e8 Gabor Juhos       2012-03-14  126  		ath79_soc =3D ATH79_SOC=
_AR9341;
d84114660a65e8 Gabor Juhos       2012-03-14  127  		chip =3D "9341";
d84114660a65e8 Gabor Juhos       2012-03-14  128  		rev =3D id & AR934X_REV=
_ID_REVISION_MASK;
d84114660a65e8 Gabor Juhos       2012-03-14  129  		break;
d84114660a65e8 Gabor Juhos       2012-03-14  130  =

d84114660a65e8 Gabor Juhos       2012-03-14  131  	case REV_ID_MAJOR_AR9342:
d84114660a65e8 Gabor Juhos       2012-03-14  132  		ath79_soc =3D ATH79_SOC=
_AR9342;
d84114660a65e8 Gabor Juhos       2012-03-14  133  		chip =3D "9342";
d84114660a65e8 Gabor Juhos       2012-03-14  134  		rev =3D id & AR934X_REV=
_ID_REVISION_MASK;
d84114660a65e8 Gabor Juhos       2012-03-14  135  		break;
d84114660a65e8 Gabor Juhos       2012-03-14  136  =

d84114660a65e8 Gabor Juhos       2012-03-14  137  	case REV_ID_MAJOR_AR9344:
d84114660a65e8 Gabor Juhos       2012-03-14  138  		ath79_soc =3D ATH79_SOC=
_AR9344;
d84114660a65e8 Gabor Juhos       2012-03-14  139  		chip =3D "9344";
d84114660a65e8 Gabor Juhos       2012-03-14  140  		rev =3D id & AR934X_REV=
_ID_REVISION_MASK;
d84114660a65e8 Gabor Juhos       2012-03-14  141  		break;
d84114660a65e8 Gabor Juhos       2012-03-14  142  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  143  	case REV_ID_MAJOR_QCA953=
3_V2:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  144  		ver =3D 2;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  145  		ath79_soc_rev =3D 2;
c9b0299034665d Liangliang Huang  2020-05-04  146  		fallthrough;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  147  	case REV_ID_MAJOR_QCA953=
3:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  148  		ath79_soc =3D ATH79_SOC=
_QCA9533;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  149  		chip =3D "9533";
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  150  		rev =3D id & QCA953X_RE=
V_ID_REVISION_MASK;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  151  		break;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  152  =

2e6c91e392fd7b Gabor Juhos       2013-02-15  153  	case REV_ID_MAJOR_QCA955=
6:
2e6c91e392fd7b Gabor Juhos       2013-02-15  154  		ath79_soc =3D ATH79_SOC=
_QCA9556;
2e6c91e392fd7b Gabor Juhos       2013-02-15  155  		chip =3D "9556";
2e6c91e392fd7b Gabor Juhos       2013-02-15  156  		rev =3D id & QCA955X_RE=
V_ID_REVISION_MASK;
2e6c91e392fd7b Gabor Juhos       2013-02-15  157  		break;
2e6c91e392fd7b Gabor Juhos       2013-02-15  158  =

2e6c91e392fd7b Gabor Juhos       2013-02-15  159  	case REV_ID_MAJOR_QCA955=
8:
2e6c91e392fd7b Gabor Juhos       2013-02-15  160  		ath79_soc =3D ATH79_SOC=
_QCA9558;
2e6c91e392fd7b Gabor Juhos       2013-02-15  161  		chip =3D "9558";
2e6c91e392fd7b Gabor Juhos       2013-02-15  162  		rev =3D id & QCA955X_RE=
V_ID_REVISION_MASK;
2e6c91e392fd7b Gabor Juhos       2013-02-15  163  		break;
2e6c91e392fd7b Gabor Juhos       2013-02-15  164  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  165  	case REV_ID_MAJOR_QCA956=
X:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  166  		ath79_soc =3D ATH79_SOC=
_QCA956X;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  167  		chip =3D "956X";
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  168  		rev =3D id & QCA956X_RE=
V_ID_REVISION_MASK;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  169  		break;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  170  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  171  	case REV_ID_MAJOR_TP9343:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  172  		ath79_soc =3D ATH79_SOC=
_TP9343;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  173  		chip =3D "9343";
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  174  		rev =3D id & QCA956X_RE=
V_ID_REVISION_MASK;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  175  		break;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  176  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  177  	default:
ab75dc02c151c9 Ralf Baechle      2011-11-17  178  		panic("ath79: unknown S=
oC, id:0x%08x", id);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  179  	}
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  180  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  181  	if (ver =3D=3D 1)
be5f3623204e15 Gabor Juhos       2011-11-18  182  		ath79_soc_rev =3D rev;
be5f3623204e15 Gabor Juhos       2011-11-18  183  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  184  	if (soc_is_qca953x() || =
soc_is_qca955x() || soc_is_qca956x())
af2d1b521bfbc5 Matthias Schiffer 2018-07-20 @185  		sprintf(ath79_sys_type,=
 "Qualcomm Atheros QCA%s ver %u rev %u",
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  186  			chip, ver, rev);
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  187  	else if (soc_is_tp9343())
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  188  		sprintf(ath79_sys_type,=
 "Qualcomm Atheros TP%s rev %u",
2e6c91e392fd7b Gabor Juhos       2013-02-15  189  			chip, rev);
2e6c91e392fd7b Gabor Juhos       2013-02-15  190  	else
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  191  		sprintf(ath79_sys_type,=
 "Atheros AR%s rev %u", chip, rev);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  192  	pr_info("SoC: %s\n", ath=
79_sys_type);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  193  }
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  194  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6433810011588974547==--

