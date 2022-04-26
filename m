Content-Type: multipart/mixed; boundary="===============1100697569282482449=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/5] virtio-crypto: use private buffer for control request
Date: Tue, 26 Apr 2022 15:49:31 +0800
Message-ID: <202204261507.YSlYncSr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1100697569282482449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220424104140.44841-3-pizhenwei@bytedance.com>
References: <20220424104140.44841-3-pizhenwei@bytedance.com>
TO: zhenwei pi <pizhenwei@bytedance.com>
TO: arei.gonglei(a)huawei.com
TO: mst(a)redhat.com
TO: jasowang(a)redhat.com
CC: herbert(a)gondor.apana.org.au
CC: linux-kernel(a)vger.kernel.org
CC: virtualization(a)lists.linux-foundation.org
CC: linux-crypto(a)vger.kernel.org
CC: helei.sig11(a)bytedance.com
CC: davem(a)davemloft.net
CC: zhenwei pi <pizhenwei@bytedance.com>

Hi zhenwei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on linus/master v5.18-rc4 next-20220422]
[cannot apply to herbert-crypto-2.6/master linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenwei-pi/virtio-cr=
ypto-Improve-performance/20220424-184732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220424 (https://download.01.org/0day-ci/archi=
ve/20220426/202204261507.YSlYncSr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/286da9ed04239c7036f=
247b3781249d84a387e23
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhenwei-pi/virtio-crypto-Improve-p=
erformance/20220424-184732
        git checkout 286da9ed04239c7036f247b3781249d84a387e23
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/media/mc/mc-device.c:565:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%.*s\n", (int)sizeof(mdev->model), mdev->mo=
del);
                  ^~~~~~~
   drivers/media/mc/mc-device.c:565:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%.*s\n", (int)sizeof(mdev->model), mdev->mo=
del);
                  ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/crypto/virtio/virtio_crypto_skcipher_algs.c:452:2: warning: Call=
 to function 'memcpy' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memcpy_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, req->iv, ivsize);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_skcipher_algs.c:452:2: note: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv, req->iv, ivsize);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:124:2: warning: Call=
 to function 'memcpy' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memcpy_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ctrl->header, header, sizeof(ctrl->header));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:124:2: note: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ctrl->header, header, sizeof(ctrl->header));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:125:2: warning: Call=
 to function 'memcpy' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memcpy_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ctrl->u, para, sizeof(ctrl->u));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:125:2: note: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ctrl->u, para, sizeof(ctrl->u));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:166:4: warning: Acce=
ss to field 'status' results in a dereference of an undefined pointer value=
 (loaded from variable 'input') [clang-analyzer-core.NullDereference]
                           le32_to_cpu(input->status));
                           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:480:9: note: Calling=
 'virtio_crypto_rsa_set_key'
           return virtio_crypto_rsa_set_key(tfm, key, keylen, 0,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:405:6: note: 'privat=
e' is false
           if (private) {
               ^~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:405:2: note: Taking =
false branch
           if (private) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:413:6: note: Assumin=
g 'ret' is 0
           if (ret)
               ^~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:413:2: note: Taking =
false branch
           if (ret)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:417:6: note: Assumin=
g field 'n' is non-null
           if (!rsa_ctx->n)
               ^~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:417:2: note: Taking =
false branch
           if (!rsa_ctx->n)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:420:6: note: Assumin=
g field 'vcrypto' is non-null
           if (!ctx->vcrypto) {
               ^~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:420:2: note: Taking =
false branch
           if (!ctx->vcrypto) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:445:9: note: Calling=
 'virtio_crypto_alg_akcipher_init_session'
           return virtio_crypto_alg_akcipher_init_session(ctx, &header, &pa=
ra, key, keylen);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:110:2: note: 'input'=
 declared without an initial value
           struct virtio_crypto_session_input *input;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:113:9: note: Calling=
 'kmemdup'
           pkey =3D kmemdup(key, keylen, GFP_ATOMIC);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:436:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && p_size < size)
                                          ^
   include/linux/fortify-string.h:438:6: note: Assuming 'p_size' is >=3D 's=
ize'
           if (p_size < size)
               ^~~~~~~~~~~~~
   include/linux/fortify-string.h:438:2: note: Taking false branch
           if (p_size < size)
           ^
   include/linux/fortify-string.h:440:2: note: Returning pointer, which par=
ticipates in a condition later
           return __real_kmemdup(p, size, gfp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:113:9: note: Returni=
ng from 'kmemdup'
           pkey =3D kmemdup(key, keylen, GFP_ATOMIC);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:114:6: note: Assumin=
g 'pkey' is non-null
           if (!pkey)
               ^~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:114:2: note: Taking =
false branch
           if (!pkey)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:118:6: note: Assumin=
g 'vc_ctrl_req' is null
           if (!vc_ctrl_req) {
               ^~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:118:2: note: Taking =
true branch
           if (!vc_ctrl_req) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:120:3: note: Control=
 jumps to line 161
                   goto out;
                   ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:164:6: note: 'err' i=
s < 0
           if (err < 0)
               ^~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:164:2: note: Taking =
true branch
           if (err < 0)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:165:3: note: Loop co=
ndition is false.  Exiting loop
                   pr_err("virtio_crypto: Create session failed status: %u\=
n",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:166:4: note: Access =
to field 'status' results in a dereference of an undefined pointer value (l=
oaded from variable 'input')
                           le32_to_cpu(input->status));
                           ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:166:4: warning: Use =
of memory after it is freed [clang-analyzer-unix.Malloc]
                           le32_to_cpu(input->status));
                           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:480:9: note: Calling=
 'virtio_crypto_rsa_set_key'
           return virtio_crypto_rsa_set_key(tfm, key, keylen, 0,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:405:6: note: 'privat=
e' is false
           if (private) {
               ^~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:405:2: note: Taking =
false branch
           if (private) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:413:6: note: Assumin=
g 'ret' is 0
           if (ret)
               ^~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:413:2: note: Taking =
false branch
           if (ret)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:417:6: note: Assumin=
g field 'n' is non-null
           if (!rsa_ctx->n)
               ^~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:417:2: note: Taking =
false branch
           if (!rsa_ctx->n)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:420:6: note: Assumin=
g field 'vcrypto' is non-null
           if (!ctx->vcrypto) {
               ^~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:420:2: note: Taking =
false branch
           if (!ctx->vcrypto) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:445:9: note: Calling=
 'virtio_crypto_alg_akcipher_init_session'
           return virtio_crypto_alg_akcipher_init_session(ctx, &header, &pa=
ra, key, keylen);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:114:6: note: Assumin=
g 'pkey' is non-null
           if (!pkey)
               ^~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:114:2: note: Taking =
false branch
           if (!pkey)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:118:6: note: Assumin=
g 'vc_ctrl_req' is non-null
           if (!vc_ctrl_req) {
               ^~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:118:2: note: Taking =
false branch
           if (!vc_ctrl_req) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:140:6: note: Assumin=
g 'err' is < 0
           if (err < 0) {
               ^~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:140:2: note: Taking =
true branch
           if (err < 0) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:142:3: note: Control=
 jumps to line 161
                   goto out;
                   ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:161:2: note: Memory =
is released
           kfree(vc_ctrl_req);
           ^~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:164:6: note: 'err' i=
s < 0
           if (err < 0)
               ^~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:164:2: note: Taking =
true branch
           if (err < 0)
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:165:3: note: Loop co=
ndition is false.  Exiting loop
                   pr_err("virtio_crypto: Create session failed status: %u\=
n",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:166:4: note: Use of =
memory after it is freed
                           le32_to_cpu(input->status));
                           ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:230:2: warning: 1st =
function call argument is an uninitialized value [clang-analyzer-core.CallA=
ndMessage]
           kfree(vc_ctrl_req);
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:510:2: note: Calling=
 'virtio_crypto_alg_akcipher_close_session'
           virtio_crypto_alg_akcipher_close_session(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:180:2: note: 'vc_ctr=
l_req' declared without an initial value
           struct virtio_crypto_ctrl_request *vc_ctrl_req;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:182:6: note: Assumin=
g field 'session_valid' is false
           if (!ctx->session_valid) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:182:2: note: Taking =
true branch
           if (!ctx->session_valid) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:184:3: note: Control=
 jumps to line 230
                   goto out;
                   ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:230:2: note: 1st fun=
ction call argument is an uninitialized value
           kfree(vc_ctrl_req);
           ^     ~~~~~~~~~~~
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:233:4: warning: Acce=
ss to field 'status' results in a dereference of an undefined pointer value=
 (loaded from variable 'ctrl_status') [clang-analyzer-core.NullDereference]
                           ctrl_status->status, destroy_session->session_id=
);
                           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:510:2: note: Calling=
 'virtio_crypto_alg_akcipher_close_session'
           virtio_crypto_alg_akcipher_close_session(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:179:2: note: 'ctrl_s=
tatus' declared without an initial value
           struct virtio_crypto_inhdr *ctrl_status;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:182:6: note: Assumin=
g field 'session_valid' is true
           if (!ctx->session_valid) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:182:2: note: Taking =
false branch
           if (!ctx->session_valid) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:188:6: note: Assumin=
g 'vc_ctrl_req' is null
           if (!vc_ctrl_req) {
               ^~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:188:2: note: Taking =
true branch
           if (!vc_ctrl_req) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:190:3: note: Control=
 jumps to line 230
                   goto out;
                   ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:231:6: note: 'err' i=
s < 0
           if (err < 0) {
               ^~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:231:2: note: Taking =
true branch
           if (err < 0) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:232:3: note: Loop co=
ndition is false.  Exiting loop
                   pr_err("virtio_crypto: Close session failed status: %u, =
session_id: 0x%llx\n",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:233:4: note: Access =
to field 'status' results in a dereference of an undefined pointer value (l=
oaded from variable 'ctrl_status')
                           ctrl_status->status, destroy_session->session_id=
);
                           ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:233:4: warning: Use =
of memory after it is freed [clang-analyzer-unix.Malloc]
                           ctrl_status->status, destroy_session->session_id=
);
                           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:510:2: note: Calling=
 'virtio_crypto_alg_akcipher_close_session'
           virtio_crypto_alg_akcipher_close_session(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:182:6: note: Assumin=
g field 'session_valid' is true
           if (!ctx->session_valid) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:182:2: note: Taking =
false branch
           if (!ctx->session_valid) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:188:6: note: Assumin=
g 'vc_ctrl_req' is non-null
           if (!vc_ctrl_req) {
               ^~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:188:2: note: Taking =
false branch
           if (!vc_ctrl_req) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:210:6: note: Assumin=
g 'err' is < 0
           if (err < 0) {
               ^~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:210:2: note: Taking =
true branch
           if (err < 0) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:212:3: note: Control=
 jumps to line 230
                   goto out;
                   ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:230:2: note: Memory =
is released
           kfree(vc_ctrl_req);
           ^~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:231:6: note: 'err' i=
s < 0
           if (err < 0) {
               ^~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:231:2: note: Taking =
true branch
           if (err < 0) {
           ^
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:232:3: note: Loop co=
ndition is false.  Exiting loop
                   pr_err("virtio_crypto: Close session failed status: %u, =
session_id: 0x%llx\n",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)

vim +166 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c

59ca6c93387d32 zhenwei pi 2022-03-02   98  =

59ca6c93387d32 zhenwei pi 2022-03-02   99  static int virtio_crypto_alg_akc=
ipher_init_session(struct virtio_crypto_akcipher_ctx *ctx,
59ca6c93387d32 zhenwei pi 2022-03-02  100  		struct virtio_crypto_ctrl_head=
er *header, void *para,
59ca6c93387d32 zhenwei pi 2022-03-02  101  		const uint8_t *key, unsigned i=
nt keylen)
59ca6c93387d32 zhenwei pi 2022-03-02  102  {
59ca6c93387d32 zhenwei pi 2022-03-02  103  	struct scatterlist outhdr_sg, k=
ey_sg, inhdr_sg, *sgs[3];
59ca6c93387d32 zhenwei pi 2022-03-02  104  	struct virtio_crypto *vcrypto =
=3D ctx->vcrypto;
59ca6c93387d32 zhenwei pi 2022-03-02  105  	uint8_t *pkey;
59ca6c93387d32 zhenwei pi 2022-03-02  106  	unsigned int inlen;
59ca6c93387d32 zhenwei pi 2022-03-02  107  	int err;
59ca6c93387d32 zhenwei pi 2022-03-02  108  	unsigned int num_out =3D 0, num=
_in =3D 0;
bb26cab9a7c25d zhenwei pi 2022-04-24  109  	struct virtio_crypto_op_ctrl_re=
q *ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  110  	struct virtio_crypto_session_in=
put *input;
286da9ed04239c zhenwei pi 2022-04-24  111  	struct virtio_crypto_ctrl_reque=
st *vc_ctrl_req;
59ca6c93387d32 zhenwei pi 2022-03-02  112  =

59ca6c93387d32 zhenwei pi 2022-03-02  113  	pkey =3D kmemdup(key, keylen, G=
FP_ATOMIC);
59ca6c93387d32 zhenwei pi 2022-03-02  114  	if (!pkey)
59ca6c93387d32 zhenwei pi 2022-03-02  115  		return -ENOMEM;
59ca6c93387d32 zhenwei pi 2022-03-02  116  =

286da9ed04239c zhenwei pi 2022-04-24  117  	vc_ctrl_req =3D kzalloc(sizeof(=
*vc_ctrl_req), GFP_KERNEL);
286da9ed04239c zhenwei pi 2022-04-24  118  	if (!vc_ctrl_req) {
286da9ed04239c zhenwei pi 2022-04-24  119  		err =3D -ENOMEM;
286da9ed04239c zhenwei pi 2022-04-24  120  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  121  	}
286da9ed04239c zhenwei pi 2022-04-24  122  =

286da9ed04239c zhenwei pi 2022-04-24  123  	ctrl =3D &vc_ctrl_req->ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  124  	memcpy(&ctrl->header, header, s=
izeof(ctrl->header));
bb26cab9a7c25d zhenwei pi 2022-04-24  125  	memcpy(&ctrl->u, para, sizeof(c=
trl->u));
286da9ed04239c zhenwei pi 2022-04-24  126  	input =3D &vc_ctrl_req->input;
bb26cab9a7c25d zhenwei pi 2022-04-24  127  	input->status =3D cpu_to_le32(V=
IRTIO_CRYPTO_ERR);
59ca6c93387d32 zhenwei pi 2022-03-02  128  =

bb26cab9a7c25d zhenwei pi 2022-04-24  129  	sg_init_one(&outhdr_sg, ctrl, s=
izeof(*ctrl));
59ca6c93387d32 zhenwei pi 2022-03-02  130  	sgs[num_out++] =3D &outhdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  131  =

59ca6c93387d32 zhenwei pi 2022-03-02  132  	sg_init_one(&key_sg, pkey, keyl=
en);
59ca6c93387d32 zhenwei pi 2022-03-02  133  	sgs[num_out++] =3D &key_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  134  =

bb26cab9a7c25d zhenwei pi 2022-04-24  135  	sg_init_one(&inhdr_sg, input, s=
izeof(*input));
59ca6c93387d32 zhenwei pi 2022-03-02  136  	sgs[num_out + num_in++] =3D &in=
hdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  137  =

286da9ed04239c zhenwei pi 2022-04-24  138  	spin_lock(&vcrypto->ctrl_lock);
59ca6c93387d32 zhenwei pi 2022-03-02  139  	err =3D virtqueue_add_sgs(vcryp=
to->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
286da9ed04239c zhenwei pi 2022-04-24  140  	if (err < 0) {
286da9ed04239c zhenwei pi 2022-04-24  141  		spin_unlock(&vcrypto->ctrl_loc=
k);
59ca6c93387d32 zhenwei pi 2022-03-02  142  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  143  	}
59ca6c93387d32 zhenwei pi 2022-03-02  144  =

59ca6c93387d32 zhenwei pi 2022-03-02  145  	virtqueue_kick(vcrypto->ctrl_vq=
);
59ca6c93387d32 zhenwei pi 2022-03-02  146  	while (!virtqueue_get_buf(vcryp=
to->ctrl_vq, &inlen) &&
59ca6c93387d32 zhenwei pi 2022-03-02  147  	       !virtqueue_is_broken(vcr=
ypto->ctrl_vq))
59ca6c93387d32 zhenwei pi 2022-03-02  148  		cpu_relax();
286da9ed04239c zhenwei pi 2022-04-24  149  	spin_unlock(&vcrypto->ctrl_lock=
);
59ca6c93387d32 zhenwei pi 2022-03-02  150  =

bb26cab9a7c25d zhenwei pi 2022-04-24  151  	if (le32_to_cpu(input->status) =
!=3D VIRTIO_CRYPTO_OK) {
59ca6c93387d32 zhenwei pi 2022-03-02  152  		err =3D -EINVAL;
59ca6c93387d32 zhenwei pi 2022-03-02  153  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  154  	}
59ca6c93387d32 zhenwei pi 2022-03-02  155  =

bb26cab9a7c25d zhenwei pi 2022-04-24  156  	ctx->session_id =3D le64_to_cpu=
(input->session_id);
59ca6c93387d32 zhenwei pi 2022-03-02  157  	ctx->session_valid =3D true;
59ca6c93387d32 zhenwei pi 2022-03-02  158  	err =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  159  =

59ca6c93387d32 zhenwei pi 2022-03-02  160  out:
286da9ed04239c zhenwei pi 2022-04-24  161  	kfree(vc_ctrl_req);
59ca6c93387d32 zhenwei pi 2022-03-02  162  	kfree_sensitive(pkey);
59ca6c93387d32 zhenwei pi 2022-03-02  163  =

59ca6c93387d32 zhenwei pi 2022-03-02  164  	if (err < 0)
59ca6c93387d32 zhenwei pi 2022-03-02  165  		pr_err("virtio_crypto: Create =
session failed status: %u\n",
bb26cab9a7c25d zhenwei pi 2022-04-24 @166  			le32_to_cpu(input->status));
59ca6c93387d32 zhenwei pi 2022-03-02  167  =

59ca6c93387d32 zhenwei pi 2022-03-02  168  	return err;
59ca6c93387d32 zhenwei pi 2022-03-02  169  }
59ca6c93387d32 zhenwei pi 2022-03-02  170  =

59ca6c93387d32 zhenwei pi 2022-03-02  171  static int virtio_crypto_alg_akc=
ipher_close_session(struct virtio_crypto_akcipher_ctx *ctx)
59ca6c93387d32 zhenwei pi 2022-03-02  172  {
59ca6c93387d32 zhenwei pi 2022-03-02  173  	struct scatterlist outhdr_sg, i=
nhdr_sg, *sgs[2];
59ca6c93387d32 zhenwei pi 2022-03-02  174  	struct virtio_crypto_destroy_se=
ssion_req *destroy_session;
59ca6c93387d32 zhenwei pi 2022-03-02  175  	struct virtio_crypto *vcrypto =
=3D ctx->vcrypto;
59ca6c93387d32 zhenwei pi 2022-03-02  176  	unsigned int num_out =3D 0, num=
_in =3D 0, inlen;
59ca6c93387d32 zhenwei pi 2022-03-02  177  	int err;
bb26cab9a7c25d zhenwei pi 2022-04-24  178  	struct virtio_crypto_op_ctrl_re=
q *ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  179  	struct virtio_crypto_inhdr *ctr=
l_status;
286da9ed04239c zhenwei pi 2022-04-24  180  	struct virtio_crypto_ctrl_reque=
st *vc_ctrl_req;
59ca6c93387d32 zhenwei pi 2022-03-02  181  =

59ca6c93387d32 zhenwei pi 2022-03-02  182  	if (!ctx->session_valid) {
59ca6c93387d32 zhenwei pi 2022-03-02  183  		err =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  184  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  185  	}
286da9ed04239c zhenwei pi 2022-04-24  186  =

286da9ed04239c zhenwei pi 2022-04-24  187  	vc_ctrl_req =3D kzalloc(sizeof(=
*vc_ctrl_req), GFP_KERNEL);
286da9ed04239c zhenwei pi 2022-04-24  188  	if (!vc_ctrl_req) {
286da9ed04239c zhenwei pi 2022-04-24  189  		err =3D -ENOMEM;
286da9ed04239c zhenwei pi 2022-04-24  190  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  191  	}
286da9ed04239c zhenwei pi 2022-04-24  192  =

286da9ed04239c zhenwei pi 2022-04-24  193  	ctrl_status =3D &vc_ctrl_req->c=
trl_status;
bb26cab9a7c25d zhenwei pi 2022-04-24  194  	ctrl_status->status =3D VIRTIO_=
CRYPTO_ERR;
286da9ed04239c zhenwei pi 2022-04-24  195  	ctrl =3D &vc_ctrl_req->ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  196  	ctrl->header.opcode =3D cpu_to_=
le32(VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION);
bb26cab9a7c25d zhenwei pi 2022-04-24  197  	ctrl->header.queue_id =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  198  =

bb26cab9a7c25d zhenwei pi 2022-04-24  199  	destroy_session =3D &ctrl->u.de=
stroy_session;
59ca6c93387d32 zhenwei pi 2022-03-02  200  	destroy_session->session_id =3D=
 cpu_to_le64(ctx->session_id);
59ca6c93387d32 zhenwei pi 2022-03-02  201  =

bb26cab9a7c25d zhenwei pi 2022-04-24  202  	sg_init_one(&outhdr_sg, ctrl, s=
izeof(*ctrl));
59ca6c93387d32 zhenwei pi 2022-03-02  203  	sgs[num_out++] =3D &outhdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  204  =

bb26cab9a7c25d zhenwei pi 2022-04-24  205  	sg_init_one(&inhdr_sg, &ctrl_st=
atus->status, sizeof(ctrl_status->status));
59ca6c93387d32 zhenwei pi 2022-03-02  206  	sgs[num_out + num_in++] =3D &in=
hdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  207  =

286da9ed04239c zhenwei pi 2022-04-24  208  	spin_lock(&vcrypto->ctrl_lock);
59ca6c93387d32 zhenwei pi 2022-03-02  209  	err =3D virtqueue_add_sgs(vcryp=
to->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
286da9ed04239c zhenwei pi 2022-04-24  210  	if (err < 0) {
286da9ed04239c zhenwei pi 2022-04-24  211  		spin_unlock(&vcrypto->ctrl_loc=
k);
59ca6c93387d32 zhenwei pi 2022-03-02  212  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  213  	}
59ca6c93387d32 zhenwei pi 2022-03-02  214  =

59ca6c93387d32 zhenwei pi 2022-03-02  215  	virtqueue_kick(vcrypto->ctrl_vq=
);
59ca6c93387d32 zhenwei pi 2022-03-02  216  	while (!virtqueue_get_buf(vcryp=
to->ctrl_vq, &inlen) &&
59ca6c93387d32 zhenwei pi 2022-03-02  217  	       !virtqueue_is_broken(vcr=
ypto->ctrl_vq))
59ca6c93387d32 zhenwei pi 2022-03-02  218  		cpu_relax();
286da9ed04239c zhenwei pi 2022-04-24  219  	spin_unlock(&vcrypto->ctrl_lock=
);
59ca6c93387d32 zhenwei pi 2022-03-02  220  =

bb26cab9a7c25d zhenwei pi 2022-04-24  221  	if (ctrl_status->status !=3D VI=
RTIO_CRYPTO_OK) {
59ca6c93387d32 zhenwei pi 2022-03-02  222  		err =3D -EINVAL;
59ca6c93387d32 zhenwei pi 2022-03-02  223  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  224  	}
59ca6c93387d32 zhenwei pi 2022-03-02  225  =

59ca6c93387d32 zhenwei pi 2022-03-02  226  	err =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  227  	ctx->session_valid =3D false;
59ca6c93387d32 zhenwei pi 2022-03-02  228  =

59ca6c93387d32 zhenwei pi 2022-03-02  229  out:
286da9ed04239c zhenwei pi 2022-04-24  230  	kfree(vc_ctrl_req);
59ca6c93387d32 zhenwei pi 2022-03-02  231  	if (err < 0) {
59ca6c93387d32 zhenwei pi 2022-03-02  232  		pr_err("virtio_crypto: Close s=
ession failed status: %u, session_id: 0x%llx\n",
bb26cab9a7c25d zhenwei pi 2022-04-24 @233  			ctrl_status->status, destroy_=
session->session_id);
59ca6c93387d32 zhenwei pi 2022-03-02  234  	}
59ca6c93387d32 zhenwei pi 2022-03-02  235  =

59ca6c93387d32 zhenwei pi 2022-03-02  236  	return err;
59ca6c93387d32 zhenwei pi 2022-03-02  237  }
59ca6c93387d32 zhenwei pi 2022-03-02  238  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1100697569282482449==--

