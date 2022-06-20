Content-Type: multipart/mixed; boundary="===============2865760299437389932=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 6/7] include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: Dereference of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDereference]
Date: Mon, 20 Jun 2022 13:59:05 +0800
Message-ID: <202206201348.bAoQtLHK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2865760299437389932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: Dereference=
 of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDerefe=
rence]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: a8846f7b2f123f210694db27803e17fae1c15cbe [6/7] bitops: let optimize=
 out non-atomic bitops on compile-time constants
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20220617 (https://download.01.org/0day-ci/arc=
hive/20220620/202206201348.bAoQtLHK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/alobakin/linux/commit/a8846f7b2f123f210694db27=
803e17fae1c15cbe
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout a8846f7b2f123f210694db27803e17fae1c15cbe
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                          ^~~~~~~~
   drivers/input/input.c:1572:10: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   len +=3D snprintf(buf + len, max(buf_size - len, 0), "\n=
");
                          ^~~~~~~~
   drivers/input/input.c:2220:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, KEY, key);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2220:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, KEY, key);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2221:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, REL, rel);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2221:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, REL, rel);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2222:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, ABS, abs);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2222:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, ABS, abs);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2223:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, MSC, msc);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2223:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, MSC, msc);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2224:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, LED, led);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2224:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, LED, led);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2225:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, SND, snd);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2225:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, SND, snd);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2226:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, FF, ff);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2226:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, FF, ff);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2227:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           INPUT_CLEANSE_BITMASK(dev, SW, sw);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
   drivers/input/input.c:2227:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           INPUT_CLEANSE_BITMASK(dev, SW, sw);
           ^
   drivers/input/input.c:2214:4: note: expanded from macro 'INPUT_CLEANSE_B=
ITMASK'
                           memset(dev->bits##bit, 0,                       \
                           ^~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: Dereferen=
ce of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDere=
ference]
           *p  |=3D mask;
               ^
   drivers/input/input.c:525:2: note: Left side of '&&' is true
           __set_bit(EV_ABS, dev->evbit);
           ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   drivers/input/input.c:525:2: note: Assuming field 'evbit' is equal to 0
           __set_bit(EV_ABS, dev->evbit);
           ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/input.c:525:2: note: Left side of '&&' is false
           __set_bit(EV_ABS, dev->evbit);
           ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                                                        ^
   drivers/input/input.c:525:20: note: Passing null pointer value via 2nd p=
arameter 'addr'
           __set_bit(EV_ABS, dev->evbit);
                             ^
   include/linux/bitops.h:55:52: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                                                 ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   drivers/input/input.c:525:2: note: Calling 'generic___set_bit'
           __set_bit(EV_ABS, dev->evbit);
           ^
   include/linux/bitops.h:55:36: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:6:21: note: exp=
anded from macro '___set_bit'
   #define ___set_bit              arch___set_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:7:24: note: expanded from macro =
'arch___set_bit'
   #define arch___set_bit generic___set_bit
                          ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:30:2: note: 'p' initiali=
zed to a null pointer value
           unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
           ^~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:32:6: note: Dereference =
of null pointer (loaded from variable 'p')
           *p  |=3D mask;
            ~  ^
   include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/input/input.c:2317:6: note: Left side of '&&' is true
           if (test_bit(EV_ABS, dev->evbit) && !dev->absinfo) {
               ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   drivers/input/input.c:2317:6: note: Assuming field 'evbit' is equal to 0
           if (test_bit(EV_ABS, dev->evbit) && !dev->absinfo) {
               ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/input.c:2317:6: note: Left side of '&&' is false
           if (test_bit(EV_ABS, dev->evbit) && !dev->absinfo) {
               ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                                                        ^
   drivers/input/input.c:2317:23: note: Passing null pointer value via 2nd =
parameter 'addr'
           if (test_bit(EV_ABS, dev->evbit) && !dev->absinfo) {
                                ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                                ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   drivers/input/input.c:2317:6: note: Calling 'generic_test_bit'
           if (test_bit(EV_ABS, dev->evbit) && !dev->absinfo) {
--
           ^~~~~~
   crypto/gcm.c:159:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pctx->iv, req->iv, GCM_AES_IV_SIZE);
           ^~~~~~
   crypto/gcm.c:159:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(pctx->iv, req->iv, GCM_AES_IV_SIZE);
           ^~~~~~
   crypto/gcm.c:160:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pctx->iv + GCM_AES_IV_SIZE, &counter, 4);
           ^~~~~~
   crypto/gcm.c:160:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(pctx->iv + GCM_AES_IV_SIZE, &counter, 4);
           ^~~~~~
   crypto/gcm.c:232:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pctx->iauth_tag, &lengths, 16);
           ^~~~~~
   crypto/gcm.c:232:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(pctx->iauth_tag, &lengths, 16);
           ^~~~~~
   crypto/gcm.c:622:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:622:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:626:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:626:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:667:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(ctr_name, CRYPTO_MAX_ALG_NAME, "ctr(%s)", cipher_na=
me) >=3D
               ^~~~~~~~
   crypto/gcm.c:667:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(ctr_name, CRYPTO_MAX_ALG_NAME, "ctr(%s)", cipher_na=
me) >=3D
               ^~~~~~~~
   crypto/gcm.c:701:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->nonce, key + keylen, 4);
           ^~~~~~
   crypto/gcm.c:701:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(ctx->nonce, key + keylen, 4);
           ^~~~~~
   crypto/gcm.c:735:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, ctx->nonce, 4);
           ^~~~~~
   crypto/gcm.c:735:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iv, ctx->nonce, 4);
           ^~~~~~
   crypto/gcm.c:736:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + 4, req->iv, 8);
           ^~~~~~
   crypto/gcm.c:736:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iv + 4, req->iv, 8);
           ^~~~~~
   crypto/gcm.c:863:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:863:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:866:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:866:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:909:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->nonce, key + keylen, 4);
           ^~~~~~
   crypto/gcm.c:909:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(ctx->nonce, key + keylen, 4);
           ^~~~~~
   crypto/gcm.c:945:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, ctx->nonce, 4);
           ^~~~~~
   crypto/gcm.c:945:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iv, ctx->nonce, 4);
           ^~~~~~
   crypto/gcm.c:946:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + 4, req->iv, 8);
           ^~~~~~
   crypto/gcm.c:946:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iv + 4, req->iv, 8);
           ^~~~~~
   crypto/gcm.c:1078:6: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:1078:6: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:1081:6: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/gcm.c:1081:6: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
>> include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: Dereferen=
ce of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDere=
ference]
           *p  |=3D mask;
               ^
   mm/page_alloc.c:1603:9: note: Assuming 'start_pfn' is < 'end_pfn'
           for (; start_pfn < end_pfn; start_pfn++) {
                  ^~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1603:2: note: Loop condition is true.  Entering loop body
           for (; start_pfn < end_pfn; start_pfn++) {
           ^
   mm/page_alloc.c:1604:3: note: Taking true branch
                   if (pfn_valid(start_pfn)) {
                   ^
   mm/page_alloc.c:1617:4: note: Calling '__SetPageReserved'
                           __SetPageReserved(page);
                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:520:2: note: Left side of '&&' is true
           __SETPAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
           ^
   include/linux/page-flags.h:423:3: note: expanded from macro '__SETPAGEFL=
AG'
   { __set_bit(PG_##lname, &policy(page, 1)->flags); }
     ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   include/linux/page-flags.h:520:2: note: Assuming the condition is false
           __SETPAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
           ^
   include/linux/page-flags.h:423:3: note: expanded from macro '__SETPAGEFL=
AG'
   { __set_bit(PG_##lname, &policy(page, 1)->flags); }
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:520:2: note: Left side of '&&' is false
           __SETPAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
           ^
   include/linux/page-flags.h:423:3: note: expanded from macro '__SETPAGEFL=
AG'
   { __set_bit(PG_##lname, &policy(page, 1)->flags); }
     ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                                                        ^
   include/linux/page-flags.h:520:2: note: Passing null pointer value via 2=
nd parameter 'addr'
           __SETPAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
           ^
   include/linux/page-flags.h:423:25: note: expanded from macro '__SETPAGEF=
LAG'
   { __set_bit(PG_##lname, &policy(page, 1)->flags); }
     ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:55:52: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   include/linux/page-flags.h:520:2: note: Calling 'generic___set_bit'
           __SETPAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
           ^
   include/linux/page-flags.h:423:3: note: expanded from macro '__SETPAGEFL=
AG'
   { __set_bit(PG_##lname, &policy(page, 1)->flags); }
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:55:36: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:6:21: note: exp=
anded from macro '___set_bit'
   #define ___set_bit              arch___set_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:7:24: note: expanded from macro =
'arch___set_bit'
   #define arch___set_bit generic___set_bit
                          ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:30:2: note: 'p' initiali=
zed to a null pointer value
           unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
           ^~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:32:6: note: Dereference =
of null pointer (loaded from variable 'p')
           *p  |=3D mask;
            ~  ^
   include/asm-generic/bitops/generic-non-atomic.h:41:5: warning: Dereferen=
ce of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDere=
ference]
           *p &=3D ~mask;
              ^
   mm/page_alloc.c:2234:15: note: '?' condition is false
           unsigned i =3D pageblock_nr_pages;
                        ^
   include/linux/pageblock-flags.h:55:36: note: expanded from macro 'pagebl=
ock_nr_pages'
   #define pageblock_nr_pages      (1UL << pageblock_order)
                                           ^
   include/linux/pageblock-flags.h:44:26: note: expanded from macro 'pagebl=
ock_order'
   #define pageblock_order         min_t(unsigned int, HUGETLB_PAGE_ORDER, =
MAX_ORDER - 1)
                                   ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
--
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/tmp464.c:286:13: note: Assuming '__UNIQUE_ID___x252' is < =
'__UNIQUE_ID___y253'
           interval =3D clamp_val(interval, 125, 16000);
                      ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/hwmon/tmp464.c:286:13: note: '?' condition is true
           interval =3D clamp_val(interval, 125, 16000);
                      ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/tmp464.c:287:2: note: The value -16 is assigned to 'rate'
           rate =3D 7 - __fls(interval * 4 / (125 * 3));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/tmp464.c:292:12: note: The result of the left shift is und=
efined because the left operand is negative
                                     rate << TMP464_CONFIG_CONVERSION_RATE_=
B0);
                                     ~~~~ ^
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/rpmsg/rpmsg_ns.c:53:2: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
           ^~~~~~~
   drivers/rpmsg/rpmsg_ns.c:53:2: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
           strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
           ^~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/rpmsg/qcom_glink_native.c:459:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(req.name, channel->name);
           ^~~~~~
   drivers/rpmsg/qcom_glink_native.c:459:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(req.name, channel->name);
           ^~~~~~
   drivers/rpmsg/qcom_glink_native.c:1549:3: warning: Call to function 'str=
ncpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'strncpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
                   ^~~~~~~
   drivers/rpmsg/qcom_glink_native.c:1549:3: note: Call to function 'strncp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
                   ^~~~~~~
   drivers/rpmsg/qcom_glink_native.c:1677:9: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, RPMSG_NAME_SIZE, "%s\n", name);
                  ^~~~~~~~
   drivers/rpmsg/qcom_glink_native.c:1677:9: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, RPMSG_NAME_SIZE, "%s\n", name);
                  ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/hid/hid-multitouch.c:399:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", td->mtclass.quirks);
                  ^~~~~~~
   drivers/hid/hid-multitouch.c:399:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", td->mtclass.quirks);
                  ^~~~~~~
   drivers/hid/hid-multitouch.c:1620:4: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           sprintf(name, "%s %s", hdev->name, suffix);
                           ^~~~~~~
   drivers/hid/hid-multitouch.c:1620:4: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           sprintf(name, "%s %s", hdev->name, suffix);
                           ^~~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: Dereferen=
ce of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDere=
ference]
           *p  |=3D mask;
               ^
   drivers/hid/hid-multitouch.c:1571:2: note: Loop condition is false. Exec=
ution continues on line 1588
           list_for_each_entry(report, &hi->reports, hidinput_list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/hid/hid-multitouch.c:1588:2: note: Control jumps to 'case 852000=
:'  at line 1606
           switch (hi->application) {
           ^
   drivers/hid/hid-multitouch.c:1608:3: note: Left side of '&&' is true
                   __set_bit(BTN_STYLUS, hi->input->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   drivers/hid/hid-multitouch.c:1608:3: note: Assuming field 'keybit' is eq=
ual to 0
                   __set_bit(BTN_STYLUS, hi->input->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1608:3: note: Left side of '&&' is false
                   __set_bit(BTN_STYLUS, hi->input->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                                                        ^
   drivers/hid/hid-multitouch.c:1608:25: note: Passing null pointer value v=
ia 2nd parameter 'addr'
                   __set_bit(BTN_STYLUS, hi->input->keybit);
                                         ^
   include/linux/bitops.h:55:52: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                                                 ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   drivers/hid/hid-multitouch.c:1608:3: note: Calling 'generic___set_bit'
                   __set_bit(BTN_STYLUS, hi->input->keybit);
                   ^
   include/linux/bitops.h:55:36: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:6:21: note: exp=
anded from macro '___set_bit'
   #define ___set_bit              arch___set_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:7:24: note: expanded from macro =
'arch___set_bit'
   #define arch___set_bit generic___set_bit
                          ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:30:2: note: 'p' initiali=
zed to a null pointer value
           unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
           ^~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:32:6: note: Dereference =
of null pointer (loaded from variable 'p')
           *p  |=3D mask;
            ~  ^
   include/linux/hid.h:1056:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-multitouch.c:1318:6: note: Assuming 'rdata' is non-null
           if (!rdata) {
               ^~~~~~
   drivers/hid/hid-multitouch.c:1318:2: note: Taking false branch
           if (!rdata) {
           ^
   drivers/hid/hid-multitouch.c:1331:6: note: Assuming field 'export_all_in=
puts' is true
           if (!td->mtclass.export_all_inputs &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1331:37: note: Left side of '&&' is false
           if (!td->mtclass.export_all_inputs &&
                                              ^
   drivers/hid/hid-multitouch.c:1349:6: note: Assuming field 'application' =
is equal to HID_VD_ASUS_CUSTOM_MEDIA_KEYS
           if (field->application =3D=3D HID_VD_ASUS_CUSTOM_MEDIA_KEYS &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1349:6: note: Left side of '&&' is true
   drivers/hid/hid-multitouch.c:1350:6: note: Assuming the condition is true
               application->quirks & MT_QUIRK_ASUS_CUSTOM_UP &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1349:6: note: Left side of '&&' is true
           if (field->application =3D=3D HID_VD_ASUS_CUSTOM_MEDIA_KEYS &&
               ^
   drivers/hid/hid-multitouch.c:1351:6: note: Assuming the condition is true
               (usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CUSTOM) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1349:2: note: Taking true branch
           if (field->application =3D=3D HID_VD_ASUS_CUSTOM_MEDIA_KEYS &&
           ^
   drivers/hid/hid-multitouch.c:1353:7: note: Assuming the condition is fal=
se
--
                  ^~~~~~~~
   drivers/fpga/altera-cvp.c:542:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, 3, "%d\n", altera_cvp_chkcfg);
                  ^~~~~~~~
   drivers/fpga/altera-cvp.c:652:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(conf->mgr_name, sizeof(conf->mgr_name), "%s @%s",
           ^~~~~~~~
   drivers/fpga/altera-cvp.c:652:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(conf->mgr_name, sizeof(conf->mgr_name), "%s @%s",
           ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/fpga/zynqmp-fpga.c:55:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kbuf, buf, size);
           ^~~~~~
   drivers/fpga/zynqmp-fpga.c:55:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(kbuf, buf, size);
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/memstick/core/ms_block.c:227:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&card->current_mrq, 0, sizeof(card->current_mrq));
           ^~~~~~
   drivers/memstick/core/ms_block.c:227:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&card->current_mrq, 0, sizeof(card->current_mrq));
           ^~~~~~
   drivers/memstick/core/ms_block.c:885:4: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(miter.addr + offset, 0xFF, chunklen);
                           ^~~~~~
   drivers/memstick/core/ms_block.c:885:4: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                           memset(miter.addr + offset, 0xFF, chunklen);
                           ^~~~~~
   drivers/memstick/core/ms_block.c:897:4: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(extra, 0xFF, sizeof(*extra));
                           ^~~~~~
   drivers/memstick/core/ms_block.c:897:4: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                           memset(extra, 0xFF, sizeof(*extra));
                           ^~~~~~
   drivers/memstick/core/ms_block.c:1361:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(msb->lba_to_pba_table, MS_BLOCK_INVALID,
           ^~~~~~
   drivers/memstick/core/ms_block.c:1361:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(msb->lba_to_pba_table, MS_BLOCK_INVALID,
           ^~~~~~
   drivers/memstick/core/ms_block.c:1397:3: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&extra, 0, sizeof(extra));
                   ^~~~~~
   drivers/memstick/core/ms_block.c:1397:3: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                   memset(&extra, 0, sizeof(extra));
                   ^~~~~~
   drivers/memstick/core/ms_block.c:2108:2: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
           ^~~~~~~
   drivers/memstick/core/ms_block.c:2108:2: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
           ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/input/mouse/psmouse-base.c:1565:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(psmouse->devname, sizeof(psmouse->devname), "%s %s %s",
           ^~~~~~~~
   drivers/input/mouse/psmouse-base.c:1565:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(psmouse->devname, sizeof(psmouse->devname), "%s %s %s",
           ^~~~~~~~
   drivers/input/mouse/psmouse-base.c:1607:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(psmouse->phys, sizeof(psmouse->phys), "%s/input0", seri=
o->phys);
           ^~~~~~~~
   drivers/input/mouse/psmouse-base.c:1607:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(psmouse->phys, sizeof(psmouse->phys), "%s/input0", seri=
o->phys);
           ^~~~~~~~
   drivers/input/mouse/psmouse-base.c:1875:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", *field);
                  ^~~~~~~
   drivers/input/mouse/psmouse-base.c:1875:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", *field);
                  ^~~~~~~
   drivers/input/mouse/psmouse-base.c:1895:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", psmouse->protocol->name);
                  ^~~~~~~
   drivers/input/mouse/psmouse-base.c:1895:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", psmouse->protocol->name);
                  ^~~~~~~
   drivers/input/mouse/psmouse-base.c:2045:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buffer, "%s\n", psmouse_protocol_by_type(type)->n=
ame);
                  ^~~~~~~
   drivers/input/mouse/psmouse-base.c:2045:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buffer, "%s\n", psmouse_protocol_by_type(type)->n=
ame);
                  ^~~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: Dereferen=
ce of null pointer (loaded from variable 'p') [clang-analyzer-core.NullDere=
ference]
           *p  |=3D mask;
               ^
   drivers/input/mouse/psmouse-base.c:714:6: note: Assuming 'set_properties=
' is true
           if (set_properties) {
               ^~~~~~~~~~~~~~
   drivers/input/mouse/psmouse-base.c:714:2: note: Taking true branch
           if (set_properties) {
           ^
   drivers/input/mouse/psmouse-base.c:718:3: note: Left side of '&&' is true
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   drivers/input/mouse/psmouse-base.c:718:3: note: Assuming field 'keybit' =
is equal to 0
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/psmouse-base.c:718:3: note: Left side of '&&' is fal=
se
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:30: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                                                        ^
   drivers/input/mouse/psmouse-base.c:718:25: note: Passing null pointer va=
lue via 2nd parameter 'addr'
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                                         ^
   include/linux/bitops.h:55:52: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                                                 ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   drivers/input/mouse/psmouse-base.c:718:3: note: Calling 'generic___set_b=
it'
                   __set_bit(BTN_MIDDLE, psmouse->dev->keybit);
                   ^
   include/linux/bitops.h:55:36: note: expanded from macro '__set_bit'
   #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:6:21: note: exp=
anded from macro '___set_bit'
   #define ___set_bit              arch___set_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:7:24: note: expanded from macro =
'arch___set_bit'
   #define arch___set_bit generic___set_bit
                          ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:30:2: note: 'p' initiali=
zed to a null pointer value
           unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
           ^~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:32:6: note: Dereference =
of null pointer (loaded from variable 'p')
           *p  |=3D mask;
            ~  ^
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   include/linux/hid.h:1056:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-tivo.c:26:2: note: Control jumps to 'case 4294901760:'  =
at line 27
           switch (usage->hid & HID_USAGE_PAGE) {
           ^
   drivers/hid/hid-tivo.c:28:3: note: Control jumps to 'case 62:'  at line =
32
                   switch (usage->hid & HID_USAGE) {
                   ^
   drivers/hid/hid-tivo.c:32:14: note: Calling 'hid_map_usage_clear'
                   case 0x3e: tivo_map_key_clear(KEY_TV);          break;
                              ^
   drivers/hid/hid-tivo.c:19:31: note: expanded from macro 'tivo_map_key_cl=
ear'
   #define tivo_map_key_clear(c)   hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1084:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1027:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1031:2: note: Control jumps to 'case 1:'  at line 10=
40
           switch (type) {
           ^
   include/linux/hid.h:1043:3: note:  Execution continues on line 1054
                   break;
                   ^
   include/linux/hid.h:1054:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {

vim +/p +32 include/asm-generic/bitops/generic-non-atomic.h

b9944c14c86ab2a Alexander Lobakin 2022-05-07  11  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07  12  /*
b9944c14c86ab2a Alexander Lobakin 2022-05-07  13   * Generic definitions fo=
r bit operations, should not be used in regular code
b9944c14c86ab2a Alexander Lobakin 2022-05-07  14   * directly.
b9944c14c86ab2a Alexander Lobakin 2022-05-07  15   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07  16  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07  17  /**
b9944c14c86ab2a Alexander Lobakin 2022-05-07  18   * generic___set_bit - Se=
t a bit in memory
b9944c14c86ab2a Alexander Lobakin 2022-05-07  19   * @nr: the bit to set
b9944c14c86ab2a Alexander Lobakin 2022-05-07  20   * @addr: the address to =
start counting from
b9944c14c86ab2a Alexander Lobakin 2022-05-07  21   *
b9944c14c86ab2a Alexander Lobakin 2022-05-07  22   * Unlike set_bit(), this=
 function is non-atomic and may be reordered.
b9944c14c86ab2a Alexander Lobakin 2022-05-07  23   * If it's called on the =
same region of memory simultaneously, the effect
b9944c14c86ab2a Alexander Lobakin 2022-05-07  24   * may be that only one o=
peration succeeds.
b9944c14c86ab2a Alexander Lobakin 2022-05-07  25   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07  26  static __always_inline vo=
id
521611f961a7dda Alexander Lobakin 2022-05-09  27  generic___set_bit(unsigne=
d long nr, volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07  28  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07  29  	unsigned long mask =3D B=
IT_MASK(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07  30  	unsigned long *p =3D ((u=
nsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07  31  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07 @32  	*p  |=3D mask;
b9944c14c86ab2a Alexander Lobakin 2022-05-07  33  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07  34  =


:::::: The code at line 32 was first introduced by commit
:::::: b9944c14c86ab2ac2a97aeec1426812751e0039b bitops: always define asm-g=
eneric non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Alexander Lobakin <alexandr.lobakin@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2865760299437389932==--

