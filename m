Content-Type: multipart/mixed; boundary="===============2419979057779194295=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/amba/bus.c:87:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides bou...
Date: Tue, 29 Mar 2022 00:50:28 +0800
Message-ID: <202203290036.2Dn6Jozi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2419979057779194295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220329/202203290036.2Dn6Jozi-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   52 warnings generated.
   crypto/chacha20poly1305.c:89:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, &leicb, sizeof(leicb));
           ^~~~~~
   crypto/chacha20poly1305.c:89:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv, &leicb, sizeof(leicb));
           ^~~~~~
   crypto/chacha20poly1305.c:90:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + sizeof(leicb), ctx->salt, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:90:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv + sizeof(leicb), ctx->salt, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:91:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + sizeof(leicb) + ctx->saltlen, req->iv,
           ^~~~~~
   crypto/chacha20poly1305.c:91:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv + sizeof(leicb) + ctx->saltlen, req->iv,
           ^~~~~~
   crypto/chacha20poly1305.c:208:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:208:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:267:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:267:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:376:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx->key, 0, sizeof(rctx->key));
           ^~~~~~
   crypto/chacha20poly1305.c:376:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(rctx->key, 0, sizeof(rctx->key));
           ^~~~~~
   crypto/chacha20poly1305.c:483:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->salt, key + keylen, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:483:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->salt, key + keylen, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:601:6: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/chacha20poly1305.c:601:6: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/chacha20poly1305.c:605:6: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/chacha20poly1305.c:605:6: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   kernel/time/timekeeping.c:423:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(base, tkr, sizeof(*base));
           ^~~~~~
   kernel/time/timekeeping.c:423:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(base, tkr, sizeof(*base));
           ^~~~~~
   kernel/time/timekeeping.c:429:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(base + 1, base, sizeof(*base));
           ^~~~~~
   kernel/time/timekeeping.c:429:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(base + 1, base, sizeof(*base));
           ^~~~~~
   kernel/time/timekeeping.c:637:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tkr_dummy, tkr, sizeof(tkr_dummy));
           ^~~~~~
   kernel/time/timekeeping.c:637:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tkr_dummy, tkr, sizeof(tkr_dummy));
           ^~~~~~
   kernel/time/timekeeping.c:644:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tkr_dummy, tkr, sizeof(tkr_dummy));
           ^~~~~~
   kernel/time/timekeeping.c:644:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tkr_dummy, tkr, sizeof(tkr_dummy));
           ^~~~~~
   kernel/time/timekeeping.c:763:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&shadow_timekeeper, &tk_core.timekeeper,
                   ^~~~~~
   kernel/time/timekeeping.c:763:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&shadow_timekeeper, &tk_core.timekeeper,
                   ^~~~~~
   kernel/time/timekeeping.c:2195:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(real_tk, tk, sizeof(*tk));
           ^~~~~~
   kernel/time/timekeeping.c:2195:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(real_tk, tk, sizeof(*tk));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/amba/bus.c:87:8: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%s\n", dev->driver_override);
                 ^~~~~~~
   drivers/amba/bus.c:87:8: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           len =3D sprintf(buf, "%s\n", dev->driver_override);
                 ^~~~~~~
   drivers/amba/bus.c:136:1: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
   amba_attr_func(id, "%08x\n", dev->periphid);
   ^
   drivers/amba/bus.c:132:9: note: expanded from macro 'amba_attr_func'
           return sprintf(buf, fmt, arg);                                  \
                  ^~~~~~~
   drivers/amba/bus.c:136:1: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
   amba_attr_func(id, "%08x\n", dev->periphid);
   ^
   drivers/amba/bus.c:132:9: note: expanded from macro 'amba_attr_func'
           return sprintf(buf, fmt, arg);                                  \
                  ^~~~~~~
   drivers/amba/bus.c:137:1: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
   amba_attr_func(resource, "\t%016llx\t%016llx\t%016lx\n",
   ^
   drivers/amba/bus.c:132:9: note: expanded from macro 'amba_attr_func'
           return sprintf(buf, fmt, arg);                                  \
                  ^~~~~~~
   drivers/amba/bus.c:137:1: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
   amba_attr_func(resource, "\t%016llx\t%016llx\t%016lx\n",
   ^
   drivers/amba/bus.c:132:9: note: expanded from macro 'amba_attr_func'
           return sprintf(buf, fmt, arg);                                  \
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   lib/crypto/poly1305.c:37:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(desc->buf + desc->buflen, src, bytes);
                   ^~~~~~
   lib/crypto/poly1305.c:37:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(desc->buf + desc->buflen, src, bytes);
                   ^~~~~~
   lib/crypto/poly1305.c:58:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(desc->buf, src, nbytes);
                   ^~~~~~
   lib/crypto/poly1305.c:58:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(desc->buf, src, nbytes);
                   ^~~~~~
   lib/crypto/poly1305.c:67:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(desc->buf + desc->buflen, 0,
                   ^~~~~~
   lib/crypto/poly1305.c:67:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(desc->buf + desc->buflen, 0,
                   ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (7 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   arch/arm/kernel/devtree.c:232:6: warning: Access to field 'dt_fixup' res=
ults in a dereference of a null pointer (loaded from variable 'mdesc') [cla=
ng-analyzer-core.NullDereference]
           if (mdesc->dt_fixup)
               ^~~~~
   arch/arm/kernel/devtree.c:206:6: note: Assuming 'dt_virt' is non-null
           if (!dt_virt || !early_init_dt_verify(dt_virt))
               ^~~~~~~~
   arch/arm/kernel/devtree.c:206:6: note: Left side of '||' is false
   arch/arm/kernel/devtree.c:206:18: note: Assuming the condition is false
           if (!dt_virt || !early_init_dt_verify(dt_virt))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:206:2: note: Taking false branch
           if (!dt_virt || !early_init_dt_verify(dt_virt))
           ^
   arch/arm/kernel/devtree.c:209:2: note: Value assigned to 'mdesc'
           mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mac=
h);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:211:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/devtree.c:211:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/devtree.c:221:10: note: Assuming 'size' is <=3D 0
                   while (size > 0) {
                          ^~~~~~~~
   arch/arm/kernel/devtree.c:221:3: note: Loop condition is false. Executio=
n continues on line 226
                   while (size > 0) {
                   ^
   arch/arm/kernel/devtree.c:232:6: note: Access to field 'dt_fixup' result=
s in a dereference of a null pointer (loaded from variable 'mdesc')
           if (mdesc->dt_fixup)
               ^~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
--
               ^~~~~~~~~~
   drivers/dma/stm32-dma.c:1196:17: note: Left side of '&&' is false
           if (chan->desc && cookie =3D=3D chan->desc->vdesc.tx.cookie)
                          ^
   drivers/dma/stm32-dma.c:1199:11: note: Assuming 'vdesc' is non-null
           else if (vdesc)
                    ^~~~~
   drivers/dma/stm32-dma.c:1199:7: note: Taking true branch
           else if (vdesc)
                ^
   drivers/dma/stm32-dma.c:1200:13: note: Calling 'stm32_dma_desc_residue'
                   residue =3D stm32_dma_desc_residue(chan,
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1149:12: note: Calling 'stm32_dma_get_remaining_=
bytes'
           residue =3D stm32_dma_get_remaining_bytes(chan);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1069:36: note: Calling 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:223:2: note: Returning without writing to 'chan-=
>desc'
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
           ^
   drivers/dma/stm32-dma.c:1069:36: note: Returning from 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1075:2: note: Returning without writing to 'chan=
->desc'
           return ndtr << width;
           ^
   drivers/dma/stm32-dma.c:1149:12: note: Returning from 'stm32_dma_get_rem=
aining_bytes'
           residue =3D stm32_dma_get_remaining_bytes(chan);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1151:7: note: Calling 'stm32_dma_is_current_sg'
           if (!stm32_dma_is_current_sg(chan)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1092:36: note: Calling 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:223:2: note: Returning without writing to 'chan-=
>desc'
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
           ^
   drivers/dma/stm32-dma.c:1092:36: note: Returning from 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1099:6: note: Assuming the condition is true
           if (!(dma_scr & STM32_DMA_SCR_DBM))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1099:2: note: Taking true branch
           if (!(dma_scr & STM32_DMA_SCR_DBM))
           ^
   drivers/dma/stm32-dma.c:1100:3: note: Returning without writing to 'chan=
->desc'
                   return true;
                   ^
   drivers/dma/stm32-dma.c:1151:7: note: Returning from 'stm32_dma_is_curre=
nt_sg'
           if (!stm32_dma_is_current_sg(chan)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1151:2: note: Taking false branch
           if (!stm32_dma_is_current_sg(chan)) {
           ^
   drivers/dma/stm32-dma.c:1165:7: note: Access to field 'cyclic' results i=
n a dereference of a null pointer (loaded from field 'desc')
           if (!chan->desc->cyclic || n_sg !=3D 0)
                ^     ~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   lib/test_rhashtable.c:380:4: warning: Value stored to 'prand' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           prand >>=3D 1;
                           ^         ~
   lib/test_rhashtable.c:380:4: note: Value stored to 'prand' is never read
                           prand >>=3D 1;
                           ^         ~
   lib/test_rhashtable.c:396:4: warning: Value stored to 'prand' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           prand >>=3D 1;
                           ^         ~
   lib/test_rhashtable.c:396:4: note: Value stored to 'prand' is never read
                           prand >>=3D 1;
                           ^         ~
   lib/test_rhashtable.c:410:4: warning: Value stored to 'prand' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           prand >>=3D 1;
                           ^         ~
   lib/test_rhashtable.c:410:4: note: Value stored to 'prand' is never read
                           prand >>=3D 1;
                           ^         ~
   lib/test_rhashtable.c:505:14: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           offset +=3D sprintf(buff + offset, "\nbucket[%d]=
 -> ", i);
                                     ^~~~~~~
   lib/test_rhashtable.c:505:14: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                           offset +=3D sprintf(buff + offset, "\nbucket[%d]=
 -> ", i);
                                     ^~~~~~~
   lib/test_rhashtable.c:510:14: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           offset +=3D sprintf(buff + offset, "[[");
                                     ^~~~~~~
   lib/test_rhashtable.c:510:14: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                           offset +=3D sprintf(buff + offset, "[[");
                                     ^~~~~~~
>> lib/test_rhashtable.c:516:15: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                                   offset +=3D sprintf(buff + offset, " val=
 %d (tid=3D%d)%s", p->value.id, p->value.tid,
                                             ^~~~~~~
   lib/test_rhashtable.c:516:15: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                                   offset +=3D sprintf(buff + offset, " val=
 %d (tid=3D%d)%s", p->value.id, p->value.tid,
                                             ^~~~~~~
   lib/test_rhashtable.c:523:5: warning: Access to field 'next' results in =
a dereference of a null pointer (loaded from variable 'pos') [clang-analyze=
r-core.NullDereference]
                                   rht_dereference(pos->next, ht) : NULL;
                                   ^
   include/linux/rhashtable.h:272:2: note: expanded from macro 'rht_derefer=
ence'
           rcu_dereference_protected(p, lockdep_rht_mutex_is_held(ht))
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:400:34: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                           ^
   lib/test_rhashtable.c:705:6: note: Assuming 'parm_entries' is >=3D 0
           if (parm_entries < 0)
               ^~~~~~~~~~~~~~~~
   lib/test_rhashtable.c:705:2: note: Taking false branch
           if (parm_entries < 0)
           ^
   lib/test_rhashtable.c:708:12: note: Assuming '__UNIQUE_ID___x227' is >=
=3D '__UNIQUE_ID___y228'
           entries =3D min(parm_entries, MAX_ENTRIES);
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
   lib/test_rhashtable.c:708:12: note: '?' condition is false
           entries =3D min(parm_entries, MAX_ENTRIES);
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   lib/test_rhashtable.c:711:29: note: '?' condition is false
           test_rht_params.max_size =3D max_size ? : roundup_pow_of_two(ent=
ries);
                                      ^
   lib/test_rhashtable.c:711:42: note: '?' condition is false
           test_rht_params.max_size =3D max_size ? : roundup_pow_of_two(ent=
ries);
                                                   ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   lib/test_rhashtable.c:716:6: note: Assuming 'objs' is non-null
           if (!objs)
               ^~~~~
   lib/test_rhashtable.c:716:2: note: Taking false branch
           if (!objs)
           ^
   lib/test_rhashtable.c:719:2: note: Loop condition is false.  Exiting loop
           pr_info("Running rhashtable test nelem=3D%d, max_size=3D%d, shri=
nking=3D%d\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
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
   lib/test_rhashtable.c:722:14: note: Assuming 'i' is >=3D 'runs'
           for (i =3D 0; i < runs; i++) {
                       ^~~~~~~~
   lib/test_rhashtable.c:722:2: note: Loop condition is false. Execution co=
ntinues on line 746
           for (i =3D 0; i < runs; i++) {
           ^
   lib/test_rhashtable.c:746:2: note: Loop condition is false.  Exiting loop
           pr_info("test if its possible to exceed max_size %d: %s\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
--
                           ^~~~~~~~~~~~~~~~~~~~~
   mm/percpu.c:2508:2: note: Loop condition is true.  Entering loop body
           for (group =3D 0; group < ai->nr_groups; group++) {
           ^
   mm/percpu.c:2512:23: note: Division by zero
                   BUG_ON(gi->nr_units % upa);
                                       ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/video/fbdev/core/fbsysfs.c:121:9: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(&buf[offset], PAGE_SIZE - offset, "%c:%dx%d%c-%d=
\n",
                  ^~~~~~~~
   drivers/video/fbdev/core/fbsysfs.c:121:9: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(&buf[offset], PAGE_SIZE - offset, "%c:%dx%d%c-%d=
\n",
                  ^~~~~~~~
   drivers/video/fbdev/core/fbsysfs.c:137:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&var, 0, sizeof(var));
           ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:137:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&var, 0, sizeof(var));
           ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:443:7: warning: Call to function 'ssc=
anf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(&buf[i * 24],
                       ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:443:7: note: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(&buf[i * 24],
                       ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
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
   lib/test_printf.c:684:2: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           snprintf(cmp_buffer, BUF_SIZE, "__GFP_ATOMIC|%#lx",
           ^~~~~~~~
   Suppressed 43 warnings (30 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/pinctrl/pxa/pinctrl-pxa2xx.c:325:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(func->groups, gtmp, ngroups * sizeof(*gtmp));
                   ^~~~~~
   drivers/pinctrl/pxa/pinctrl-pxa2xx.c:325:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(func->groups, gtmp, ngroups * sizeof(*gtmp));
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
   33 warnings generated.
   drivers/pinctrl/samsung/pinctrl-samsung.c:93:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(new_map + old_num, 0, (new_num - old_num) * sizeof(*new_m=
ap));
           ^~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:93:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(new_map + old_num, 0, (new_num - old_num) * sizeof(*new_m=
ap));
           ^~~~~~
>> drivers/pinctrl/samsung/pinctrl-samsung.c:896:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           sprintf(pin_names, "%s-%d", pin_bank->name, pin);
                           ^~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:896:4: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           sprintf(pin_names, "%s-%d", pin_bank->name, pin);
                           ^~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1065:19: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   bank->eint_base =3D virt_base[0];
                                   ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1101:6: note: Assuming 'drvdat=
a' is non-null
           if (!drvdata)
               ^~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1101:2: note: Taking false bra=
nch
           if (!drvdata)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1104:9: note: Calling 'samsung=
_pinctrl_get_soc_data'
           ctrl =3D samsung_pinctrl_get_soc_data(drvdata, pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Calling 'samsung=
_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:6: note: Assuming 'id' is =
>=3D 0
           if (id < 0) {
               ^~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:2: note: Taking false bran=
ch
           if (id < 0) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:6: note: Assuming 'id' is =
< field 'num_ctrl'
           if (id >=3D of_data->num_ctrl) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:2: note: Taking false bran=
ch
           if (id >=3D of_data->num_ctrl) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1002:2: note: Returning pointe=
r, which participates in a condition later
           return &(of_data->ctrl[id]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Returning from '=
samsung_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:6: note: Assuming 'ctrl' =
is non-null
           if (!ctrl)
               ^~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:2: note: Taking false bra=
nch
           if (!ctrl)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Calling 'devm_k=
calloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:216:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:219:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Returning from =
'devm_kcalloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:6: note: Assuming field '=
pin_banks' is non-null
           if (!d->pin_banks)
               ^~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:2: note: Taking false bra=
nch
           if (!d->pin_banks)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:6: note: Assuming the con=
dition is false
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:2: note: Taking false bra=
nch
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:14: note: Assuming the co=
ndition is false
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:2: note: Loop condition i=
s false. Execution continues on line 1048
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:14: note: Assuming 'i' is=
 < field 'nr_banks'
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:2: note: Loop condition i=
s true.  Entering loop body
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1060:3: note: Loop condition i=
s false.  Exiting loop
                   raw_spin_lock_init(&bank->slock);
                   ^
   include/linux/spinlock.h:111:2: note: expanded from macro 'raw_spin_lock=
_init'
           do { *(lock) =3D __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1065:19: note: Assigned value =
is garbage or undefined
                   bank->eint_base =3D virt_base[0];
                                   ^ ~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1073:15: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           d->virt_base =3D virt_base[0];
--
                  ^~~~~~~
   kernel/ksysfs.c:145:9: note: Call to function 'sprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", file_caps_enabled);
                  ^~~~~~~
   kernel/ksysfs.c:196:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &__start_notes + off, count);
           ^~~~~~
   kernel/ksysfs.c:196:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(buf, &__start_notes + off, count);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   arch/arm/crypto/chacha-glue.c:59:12: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           s =3D d =3D memcpy(buf, src, bytes);
                                   ^~~~~~
   arch/arm/crypto/chacha-glue.c:59:12: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           s =3D d =3D memcpy(buf, src, bytes);
                                   ^~~~~~
   arch/arm/crypto/chacha-glue.c:62:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dst, buf, bytes);
                           ^~~~~~
   arch/arm/crypto/chacha-glue.c:62:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(dst, buf, bytes);
                           ^~~~~~
   arch/arm/crypto/chacha-glue.c:180:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&real_iv[0], req->iv + 24, 8);
           ^~~~~~
   arch/arm/crypto/chacha-glue.c:180:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&real_iv[0], req->iv + 24, 8);
           ^~~~~~
   arch/arm/crypto/chacha-glue.c:181:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&real_iv[8], req->iv + 16, 8);
           ^~~~~~
   arch/arm/crypto/chacha-glue.c:181:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&real_iv[8], req->iv + 16, 8);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/soc/amlogic/meson-clk-measure.c:624:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
           ^~~~~~
   drivers/soc/amlogic/meson-clk-measure.c:624:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   160 warnings generated.
>> lib/test_scanf.c:41:8: warning: Call to function 'vsscanf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'vsscanf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D vsscanf(string, fmt, ap_copy);
                 ^~~~~~~
   lib/test_scanf.c:41:8: note: Call to function 'vsscanf' is insecure as i=
t does not provide bounding of the memory buffer or security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'vsscanf_s' in case of C11
           ret =3D vsscanf(string, fmt, ap_copy);
                 ^~~~~~~
   lib/test_scanf.c:219:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(unsigned long long, "%llu",   "llu", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:219:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(unsigned long long, "%llu",   "llu", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:220:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%lld",   "lld", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:220:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%lld",   "lld", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:221:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%lld",   "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:221:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%lld",   "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:222:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(unsigned long long, "%llx",   "llx", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:222:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(unsigned long long, "%llx",   "llx", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:223:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%llx",   "llx", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:223:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%llx",   "llx", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:224:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "0x%llx", "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
--
                   ^~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:129:3: note: Null pointer passed as 2nd argument to me=
mory copy function
                   memcpy(walk->dst.virt.addr, walk->page, n);
                   ^                           ~~~~~~~~~~
   crypto/skcipher.c:171:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(walk->oiv, walk->iv, walk->ivsize);
                   ^~~~~~
   crypto/skcipher.c:171:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(walk->oiv, walk->iv, walk->ivsize);
                   ^~~~~~
   crypto/skcipher.c:210:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(walk->oiv, walk->iv, walk->ivsize);
                   ^~~~~~
   crypto/skcipher.c:210:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(walk->oiv, walk->iv, walk->ivsize);
                   ^~~~~~
   crypto/skcipher.c:292:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tmp, walk->src.virt.addr, walk->nbytes);
           ^~~~~~
   crypto/skcipher.c:292:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(tmp, walk->src.virt.addr, walk->nbytes);
           ^~~~~~
   crypto/skcipher.c:428:13: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           walk->iv =3D memcpy(iv, walk->iv, walk->ivsize);
                      ^~~~~~
   crypto/skcipher.c:428:13: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           walk->iv =3D memcpy(iv, walk->iv, walk->ivsize);
                      ^~~~~~
   crypto/skcipher.c:588:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/skcipher.c:588:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/skcipher.c:710:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rblkcipher, 0, sizeof(rblkcipher));
           ^~~~~~
   crypto/skcipher.c:710:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&rblkcipher, 0, sizeof(rblkcipher));
           ^~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   security/keys/gc.c:366:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
           ^~~~~~
   security/keys/gc.c:366:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   lib/irq_poll.c:181:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(iop, 0, sizeof(*iop));
           ^~~~~~
   lib/irq_poll.c:181:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(iop, 0, sizeof(*iop));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   lib/stackdepot.c:139:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(stack->entries, entries, flex_array_size(stack, entries, =
size));
           ^~~~~~
   lib/stackdepot.c:139:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(stack->entries, entries, flex_array_size(stack, entries, =
size));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
>> drivers/bus/fsl-mc/fsl-mc-bus.c:159:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
                  ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:159:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
                  ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:203:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
                  ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:203:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
                  ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:281:2: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "%d\n", get_dprc_irq_state(root_mc_dev));
           ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:281:2: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "%d\n", get_dprc_irq_state(root_mc_dev));
           ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:599:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(attr, 0, sizeof(struct dprc_attributes));
           ^~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:599:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(attr, 0, sizeof(struct dprc_attributes));
           ^~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:871:18: warning: Access to field 'icid' =
results in a dereference of a null pointer (loaded from variable 'parent_mc=
_dev') [clang-analyzer-core.NullDereference]
                   mc_dev->icid =3D parent_mc_dev->icid;
                                  ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1120:6: note: Assuming 'mc' is non-null
           if (!mc)
               ^~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1120:2: note: Taking false branch
           if (!mc)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1126:6: note: Assuming 'plat_res' is null
           if (plat_res) {
               ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1126:2: note: Taking false branch
           if (plat_res) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1132:6: note: Assuming field 'fsl_mc_reg=
s' is null
           if (mc->fsl_mc_regs) {
               ^~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1132:2: note: Taking false branch
           if (mc->fsl_mc_regs) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1178:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1178:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1182:6: note: 'error' is equal to 0
           if (error !=3D 0) {
               ^~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1182:2: note: Taking false branch
           if (error !=3D 0) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1188:2: note: Loop condition is false.  =
Exiting loop
           dev_info(&pdev->dev, "MC firmware version: %u.%u.%u\n",
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
   drivers/bus/fsl-mc/fsl-mc-bus.c:1191:6: note: Assuming the condition is =
false
           if (dev_of_node(&pdev->dev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1191:2: note: Taking false branch
           if (dev_of_node(&pdev->dev)) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1200:6: note: Assuming 'error' is >=3D 0
           if (error < 0) {
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1200:2: note: Taking false branch
           if (error < 0) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1210:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1210:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1219:10: note: Calling 'fsl_mc_device_ad=
d'
           error =3D fsl_mc_device_add(&obj_desc, mc_io, &pdev->dev, &mc_bu=
s_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:793:6: note: Assuming the condition is f=
alse
           if (dev_is_fsl_mc(parent_dev))
               ^
   include/linux/fsl/mc.h:353:30: note: expanded from macro 'dev_is_fsl_mc'
   #define dev_is_fsl_mc(_dev) ((_dev)->bus =3D=3D &fsl_mc_bus_type)
--
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/fuse/dev.c:1683:14: note: '?' condition is true
           num_pages =3D min(num_pages, fc->max_pages);
                       ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   fs/fuse/dev.c:1687:7: note: Calling 'kzalloc'
           ra =3D kzalloc(args_size, GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Uninitialized value stored to field 'n=
um_pages'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1687:7: note: Returning from 'kzalloc'
           ra =3D kzalloc(args_size, GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1688:6: note: Assuming 'ra' is non-null
           if (!ra)
               ^~~
   fs/fuse/dev.c:1688:2: note: Taking false branch
           if (!ra)
           ^
   fs/fuse/dev.c:1704:9: note: Assuming 'num' is not equal to 0
           while (num && ap->num_pages < num_pages) {
                  ^~~
   fs/fuse/dev.c:1704:9: note: Left side of '&&' is true
   fs/fuse/dev.c:1704:30: note: The left operand of '<' is a garbage value
           while (num && ap->num_pages < num_pages) {
                         ~~~~~~~~~~~~~ ^
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   arch/arm/kernel/signal.c:173:2: warning: Value stored to 'aux' is never =
read [clang-analyzer-deadcode.DeadStores]
           aux =3D (char __user *) sf->uc.uc_regspace;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:173:2: note: Value stored to 'aux' is never read
           aux =3D (char __user *) sf->uc.uc_regspace;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:662:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr + offset, sigreturn_codes, sizeof(sigreturn_codes));
           ^~~~~~
   arch/arm/kernel/signal.c:662:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(addr + offset, sigreturn_codes, sizeof(sigreturn_codes));
           ^~~~~~
   Suppressed 46 warnings (42 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (30 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (14 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   arch/arm/kernel/traps.c:92:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, " r%d:%08x", reg, *stack--);
                                ^~~~~~~
   arch/arm/kernel/traps.c:92:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, " r%d:%08x", reg, *stack--);
                                ^~~~~~~
   arch/arm/kernel/traps.c:135:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(str, ' ', sizeof(str));
                   ^~~~~~
   arch/arm/kernel/traps.c:135:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(str, ' ', sizeof(str));
                   ^~~~~~
   arch/arm/kernel/traps.c:142:6: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           sprintf(str + i * 9, " %08lx", v=
al);
                                           ^~~~~~~
   arch/arm/kernel/traps.c:142:6: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                                           sprintf(str + i * 9, " %08lx", v=
al);
                                           ^~~~~~~
   arch/arm/kernel/traps.c:144:6: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           sprintf(str + i * 9, " ????????"=
);
                                           ^~~~~~~
   arch/arm/kernel/traps.c:144:6: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                                           sprintf(str + i * 9, " ????????"=
);
                                           ^~~~~~~
>> arch/arm/kernel/traps.c:183:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                           p +=3D sprintf(p, i =3D=3D 0 ? "(%0*x) " : "%0*x=
 ",
                                ^~~~~~~
   arch/arm/kernel/traps.c:183:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                           p +=3D sprintf(p, i =3D=3D 0 ? "(%0*x) " : "%0*x=
 ",
                                ^~~~~~~
   arch/arm/kernel/traps.c:186:4: warning: Value stored to 'p' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:186:4: note: Value stored to 'p' is never read
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:186:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "bad PC value");
                                ^~~~~~~
   arch/arm/kernel/traps.c:186:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "bad PC value");
                                ^~~~~~~
   Suppressed 41 warnings (30 in non-user code, 11 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   kernel/fork.c:1051:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
           ^~~~~~
   kernel/fork.c:1051:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
           ^~~~~~
   kernel/fork.c:1102:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mm, 0, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1102:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(mm, 0, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1446:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mm, oldmm, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1446:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(mm, oldmm, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1575:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sig->action, current->sighand->action, sizeof(sig->action=
));
           ^~~~~~
   kernel/fork.c:1575:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(sig->action, current->sighand->action, sizeof(sig->action=
));
           ^~~~~~
   kernel/fork.c:1643:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sig->rlim, current->signal->rlim, sizeof sig->rlim);
           ^~~~~~
   kernel/fork.c:1643:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(sig->rlim, current->signal->rlim, sizeof sig->rlim);
           ^~~~~~
   Suppressed 66 warnings (63 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   arch/arm/kernel/process.c:221:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(thread->used_cp, 0, sizeof(thread->used_cp));
           ^~~~~~
   arch/arm/kernel/process.c:221:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(thread->used_cp, 0, sizeof(thread->used_cp));
           ^~~~~~
   arch/arm/kernel/process.c:222:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tsk->thread.debug, 0, sizeof(struct debug_info));
           ^~~~~~
   arch/arm/kernel/process.c:222:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&tsk->thread.debug, 0, sizeof(struct debug_info));
           ^~~~~~
   arch/arm/kernel/process.c:223:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&thread->fpstate, 0, sizeof(union fp_state));
           ^~~~~~
   arch/arm/kernel/process.c:223:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&thread->fpstate, 0, sizeof(union fp_state));
           ^~~~~~
   arch/arm/kernel/process.c:242:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&thread->cpu_context, 0, sizeof(struct cpu_context_save));
           ^~~~~~
   arch/arm/kernel/process.c:242:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&thread->cpu_context, 0, sizeof(struct cpu_context_save));
           ^~~~~~
   arch/arm/kernel/process.c:260:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(childregs, 0, sizeof(struct pt_regs));
                   ^~~~~~
   arch/arm/kernel/process.c:260:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(childregs, 0, sizeof(struct pt_regs));
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/video/fbdev/core/modedb.c:728:4: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&cvt_mode, 0, sizeof(cvt_mode));
--
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/eventlog/tpm1.c:276:2: note: Value stored to 'len' is n=
ever read
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 49 warnings (46 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (45 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (45 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/pinctrl/mediatek/pinctrl-moore.c:183:4: warning: Value stored to=
 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D -ENOTSUPP;
                           ^     ~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-moore.c:183:4: note: Value stored to 'e=
rr' is never read
                           err =3D -ENOTSUPP;
                           ^     ~~~~~~~~~
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
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
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
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
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
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/bus/mhi/core/init.c:98:9: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
                  ^~~~~~~~
   drivers/bus/mhi/core/init.c:98:9: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
                  ^~~~~~~~
   drivers/bus/mhi/core/init.c:112:10: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   cnt +=3D snprintf(buf + cnt, PAGE_SIZE - cnt,
                          ^~~~~~~~
   drivers/bus/mhi/core/init.c:112:10: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   cnt +=3D snprintf(buf + cnt, PAGE_SIZE - cnt,
                          ^~~~~~~~
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/usb/core/devices.c:183:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           start +=3D sprintf(start, format_endpt, desc->bEndpointAddress, =
dir,
                    ^~~~~~~
   drivers/usb/core/devices.c:183:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           start +=3D sprintf(start, format_endpt, desc->bEndpointAddress, =
dir,
                    ^~~~~~~
   drivers/usb/core/devices.c:209:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           start +=3D sprintf(start, format_iface,
                    ^~~~~~~
   drivers/usb/core/devices.c:209:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           start +=3D sprintf(start, format_iface,
                    ^~~~~~~
   drivers/usb/core/devices.c:244:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           start +=3D sprintf(start, format_iad,
                    ^~~~~~~
   drivers/usb/core/devices.c:244:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           start +=3D sprintf(start, format_iad,
                    ^~~~~~~
   drivers/usb/core/devices.c:271:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           start +=3D sprintf(start, format_config,
                    ^~~~~~~
   drivers/usb/core/devices.c:271:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           start +=3D sprintf(start, format_config,
                    ^~~~~~~
   drivers/usb/core/devices.c:292:18: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return start + sprintf(start, "(null Cfg. desc.)\n");
                                  ^~~~~~~
   drivers/usb/core/devices.c:292:18: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   return start + sprintf(start, "(null Cfg. desc.)\n");
                                  ^~~~~~~
   drivers/usb/core/devices.c:325:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           start +=3D sprintf(start, format_device1,
                    ^~~~~~~
   drivers/usb/core/devices.c:325:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           start +=3D sprintf(start, format_device1,
                    ^~~~~~~
   drivers/usb/core/devices.c:335:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           start +=3D sprintf(start, format_device2,
                    ^~~~~~~
   drivers/usb/core/devices.c:335:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           start +=3D sprintf(start, format_device2,
                    ^~~~~~~
   drivers/usb/core/devices.c:351:12: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                   start +=3D sprintf(start, format_string_manufacturer,
                            ^~~~~~~
   drivers/usb/core/devices.c:351:12: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                   start +=3D sprintf(start, format_string_manufacturer,
                            ^~~~~~~
   drivers/usb/core/devices.c:356:12: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                   start +=3D sprintf(start, format_string_product, dev->pr=
oduct);
                            ^~~~~~~
   drivers/usb/core/devices.c:356:12: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                   start +=3D sprintf(start, format_string_product, dev->pr=
oduct);
                            ^~~~~~~
   drivers/usb/core/devices.c:361:12: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                   start +=3D sprintf(start, format_string_serialnumber,
                            ^~~~~~~
   drivers/usb/core/devices.c:361:12: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                   start +=3D sprintf(start, format_string_serialnumber,
                            ^~~~~~~
   drivers/usb/core/devices.c:484:27: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           data_end =3D pages_start + sprintf(pages_start, format_topo,
                                    ^~~~~~~
   drivers/usb/core/devices.c:484:27: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           data_end =3D pages_start + sprintf(pages_start, format_topo,
                                    ^~~~~~~
   drivers/usb/core/devices.c:509:15: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                   data_end +=3D sprintf(data_end, format_bandwidth,
                               ^~~~~~~
   drivers/usb/core/devices.c:509:15: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                   data_end +=3D sprintf(data_end, format_bandwidth,
                               ^~~~~~~
   drivers/usb/core/devices.c:521:15: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   data_end +=3D sprintf(data_end, "(truncated)\n");
                               ^~~~~~~
   drivers/usb/core/devices.c:521:15: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   data_end +=3D sprintf(data_end, "(truncated)\n");
                               ^~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                   memcpy(req->iv, req_ctx->iv, ivsize);
                   ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:994:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:994:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1003:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1003:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1428:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alg, &tmpl->template_skcipher, sizeof(*alg));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1428:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(alg, &tmpl->template_skcipher, sizeof(*alg));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1430:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", tmpl->na=
me);
           ^~~~~~~~
   drivers/crypto/ccree/cc_cipher.c:1430:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", tmpl->na=
me);
           ^~~~~~~~
   drivers/crypto/ccree/cc_cipher.c:1431:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s",
           ^~~~~~~~
   drivers/crypto/ccree/cc_cipher.c:1431:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s",
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/clk/clk-aspeed.c:609:2: warning: Value stored to 'hw' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, clkin);
           ^
   drivers/clk/clk-aspeed.c:609:2: note: Value stored to 'hw' is never read
   drivers/clk/clk-aspeed.c:662:2: warning: Value stored to 'hw' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
           ^
   drivers/clk/clk-aspeed.c:662:2: note: Value stored to 'hw' is never read
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
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
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/mfd/qcom-spmi-pmic.c:107:3: warning: Value stored to 'name' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   name =3D pmic_spmi_id_table[i].compatible;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/qcom-spmi-pmic.c:107:3: note: Value stored to 'name' is neve=
r read
                   name =3D pmic_spmi_id_table[i].compatible;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/usb/usbip/stub_main.c:36:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:36:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
>> drivers/usb/usbip/stub_main.c:158:11: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:158:11: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/char/ipmi/ipmi_plat_data.c:21:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pr, 0, sizeof(pr));
           ^~~~~~
   drivers/char/ipmi/ipmi_plat_data.c:21:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(pr, 0, sizeof(pr));
           ^~~~~~
   drivers/char/ipmi/ipmi_plat_data.c:22:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(r));
           ^~~~~~
   drivers/char/ipmi/ipmi_plat_data.c:22:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(r));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/soundwire/sysfs_slave_dpn.c:98:1: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
   sdw_dpn_attr(imp_def_interrupts);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:98:1: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
   sdw_dpn_attr(imp_def_interrupts);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:99:1: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
   sdw_dpn_attr(max_word);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:99:1: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
   sdw_dpn_attr(max_word);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:100:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
   sdw_dpn_attr(min_word);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:100:1: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
   sdw_dpn_attr(min_word);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:101:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
   sdw_dpn_attr(type);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:101:1: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
   sdw_dpn_attr(type);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:102:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
   sdw_dpn_attr(max_grouping);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:102:1: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
   sdw_dpn_attr(max_grouping);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:103:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
   sdw_dpn_attr(simple_ch_prep_sm);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:75:11: note: expanded from macro 'sd=
w_dpn_attr'
                           return sprintf(buf, format_string,              \
                                  ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:103:1: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
   sdw_dpn_attr(simple_ch_prep_sm);
--
           ^~~~~~
   kernel/bpf/core.c:333:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fp->tag, result, sizeof(fp->tag));
           ^~~~~~
   kernel/bpf/core.c:333:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(fp->tag, result, sizeof(fp->tag));
           ^~~~~~
   kernel/bpf/core.c:452:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(prog->insnsi + off, patch, sizeof(*patch));
                   ^~~~~~
   kernel/bpf/core.c:452:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(prog->insnsi + off, patch, sizeof(*patch));
                   ^~~~~~
   kernel/bpf/core.c:488:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(prog_adj->insnsi + off + len, prog_adj->insnsi + off + 1,
           ^~~~~~~
   kernel/bpf/core.c:488:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(prog_adj->insnsi + off + len, prog_adj->insnsi + off + 1,
           ^~~~~~~
   kernel/bpf/core.c:490:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
           ^~~~~~
   kernel/bpf/core.c:490:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
           ^~~~~~
   kernel/bpf/core.c:508:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(prog->insnsi + off, prog->insnsi + off + cnt,
           ^~~~~~~
   kernel/bpf/core.c:508:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(prog->insnsi + off, prog->insnsi + off + cnt,
           ^~~~~~~
   kernel/bpf/core.c:1370:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dst, 0, size);
           ^~~~~~
   kernel/bpf/core.c:1370:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(dst, 0, size);
           ^~~~~~
   Suppressed 76 warnings (74 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/bridge/sii902x.c:450:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &sii902x->i2c->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sii902x.c:450:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &sii902x->i2c->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sii902x.c:698:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, sii902x->connector.eld,
           ^~~~~~
   drivers/gpu/drm/bridge/sii902x.c:698:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, sii902x->connector.eld,
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/usb/core/port.c:25:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", port_dev->location);
                  ^~~~~~~
   drivers/usb/core/port.c:25:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", port_dev->location);
                  ^~~~~~~
>> drivers/usb/core/port.c:50:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", result);
                  ^~~~~~~
   drivers/usb/core/port.c:50:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", result);
                  ^~~~~~~
   drivers/usb/core/port.c:59:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", port_dev->over_current_count);
                  ^~~~~~~
   drivers/usb/core/port.c:59:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", port_dev->over_current_count);
                  ^~~~~~~
   drivers/usb/core/port.c:68:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%08x\n", port_dev->quirks);
                  ^~~~~~~
   drivers/usb/core/port.c:68:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%08x\n", port_dev->quirks);
                  ^~~~~~~
   drivers/usb/core/port.c:103:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   drivers/usb/core/port.c:103:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   drivers/usb/core/port.c:331:20: warning: Value stored to 'lpeer' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct usb_port *lpeer =3D left->peer;
                                    ^~~~~   ~~~~~~~~~~
   drivers/usb/core/port.c:331:20: note: Value stored to 'lpeer' during its=
 initialization is never read
                   struct usb_port *lpeer =3D left->peer;
                                    ^~~~~   ~~~~~~~~~~
   drivers/usb/core/port.c:332:20: warning: Value stored to 'rpeer' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct usb_port *rpeer =3D right->peer;
                                    ^~~~~   ~~~~~~~~~~~
   drivers/usb/core/port.c:332:20: note: Value stored to 'rpeer' during its=
 initialization is never read
                   struct usb_port *rpeer =3D right->peer;
                                    ^~~~~   ~~~~~~~~~~~
   drivers/usb/core/port.c:336:4: warning: Value stored to 'method' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           method =3D "location";
                           ^        ~~~~~~~~~~
   drivers/usb/core/port.c:336:4: note: Value stored to 'method' is never r=
ead
                           method =3D "location";
                           ^        ~~~~~~~~~~
   drivers/usb/core/port.c:338:4: warning: Value stored to 'method' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           method =3D "default";
                           ^        ~~~~~~~~~
   drivers/usb/core/port.c:338:4: note: Value stored to 'method' is never r=
ead
                           method =3D "default";
                           ^        ~~~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/leds/led-class.c:35:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", led_cdev->brightness);
                  ^~~~~~~
   drivers/leds/led-class.c:35:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", led_cdev->brightness);
                  ^~~~~~~
   drivers/leds/led-class.c:73:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", led_cdev->max_brightness);
                  ^~~~~~~
   drivers/leds/led-class.c:73:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", led_cdev->max_brightness);
                  ^~~~~~~
   drivers/leds/led-class.c:115:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
                  ^~~~~~~
   drivers/leds/led-class.c:115:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
                  ^~~~~~~
   drivers/leds/led-class.c:318:9: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(name, len, "%s_%u", init_name, ++i);
                         ^~~~~~~~
   drivers/leds/led-class.c:318:9: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(name, len, "%s_%u", init_name, ++i);
                         ^~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/leds/led-class-flash.c:75:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->brightness.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:75:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->brightness.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:85:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->brightness.max);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:85:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->brightness.max);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:133:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", state);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:133:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", state);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:172:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->timeout.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:172:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->timeout.val);
--
           ^~~~~~
   lib/kfifo.c:105:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(fifo->data, src + l, len - l);
           ^~~~~~
   lib/kfifo.c:143:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, fifo->data + off, l);
           ^~~~~~
   lib/kfifo.c:143:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(dst, fifo->data + off, l);
           ^~~~~~
   lib/kfifo.c:144:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst + l, fifo->data, len - l);
           ^~~~~~
   lib/kfifo.c:144:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(dst + l, fifo->data, len - l);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/iio/temperature/tsys01.c:141:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(ptr, "0x%04x ", dev_data->prom[i]);
                         ^~~~~~~
   drivers/iio/temperature/tsys01.c:141:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(ptr, "0x%04x ", dev_data->prom[i]);
                         ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/ipack/ipack.c:128:3: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(&buf[c], "%02x", idev->id[i]);
                   ^~~~~~~
   drivers/ipack/ipack.c:128:3: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
                   sprintf(&buf[c], "%02x", idev->id[i]);
                   ^~~~~~~
   drivers/ipack/ipack.c:141:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%02x\n", idev->id_vendor);
                          ^~~~~~~
   drivers/ipack/ipack.c:141:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%02x\n", idev->id_vendor);
                          ^~~~~~~
   drivers/ipack/ipack.c:143:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%06x\n", idev->id_vendor);
                          ^~~~~~~
   drivers/ipack/ipack.c:143:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%06x\n", idev->id_vendor);
                          ^~~~~~~
   drivers/ipack/ipack.c:155:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%02x\n", idev->id_device);
                          ^~~~~~~
   drivers/ipack/ipack.c:155:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%02x\n", idev->id_device);
                          ^~~~~~~
   drivers/ipack/ipack.c:157:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%04x\n", idev->id_device);
                          ^~~~~~~
   drivers/ipack/ipack.c:157:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%04x\n", idev->id_device);
                          ^~~~~~~
   drivers/ipack/ipack.c:168:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "ipac:f%02Xv%08Xd%08X", idev->id_format,
                  ^~~~~~~
   drivers/ipack/ipack.c:168:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "ipac:f%02Xv%08Xd%08X", idev->id_format,
                  ^~~~~~~
   drivers/ipack/ipack.c:172:1: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   ipack_device_attr(id_format, "0x%hhx\n");
   ^
   drivers/ipack/ipack.c:102:9: note: expanded from macro 'ipack_device_att=
r'
           return sprintf(buf, format_string, idev->field);                \
                  ^~~~~~~
   drivers/ipack/ipack.c:172:1: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
   ipack_device_attr(id_format, "0x%hhx\n");
   ^
   drivers/ipack/ipack.c:102:9: note: expanded from macro 'ipack_device_att=
r'
           return sprintf(buf, format_string, idev->field);                \
                  ^~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
>> drivers/rpmsg/rpmsg_char.c:303:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", eptdev->chinfo.name);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_char.c:303:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", eptdev->chinfo.name);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_char.c:312:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", eptdev->chinfo.src);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_char.c:312:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", eptdev->chinfo.src);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_char.c:321:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", eptdev->chinfo.dst);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_char.c:321:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", eptdev->chinfo.dst);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_char.c:436:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^~~~~~
   drivers/rpmsg/rpmsg_char.c:436:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^~~~~~
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/leds/flash/leds-max77693.c:776:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(led->iout_torch_max, cfg->iout_torch_max,
           ^~~~~~
   drivers/leds/flash/leds-max77693.c:776:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(led->iout_torch_max, cfg->iout_torch_max,
           ^~~~~~
   drivers/leds/flash/leds-max77693.c:778:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(led->iout_flash_max, cfg->iout_flash_max,
           ^~~~~~
   drivers/leds/flash/leds-max77693.c:778:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(led->iout_flash_max, cfg->iout_flash_max,
           ^~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/firmware/google/coreboot_table.c:104:3: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&device->entry, ptr_entry, entry->size);
                   ^~~~~~
   drivers/firmware/google/coreboot_table.c:104:3: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&device->entry, ptr_entry, entry->size);
                   ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/crypto/atmel-aes.c:501:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(req->iv, rctx->lastc, ivsize);
                           ^~~~~~
   drivers/crypto/atmel-aes.c:501:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(req->iv, rctx->lastc, ivsize);
                           ^~~~~~
   drivers/crypto/atmel-aes.c:532:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(req->iv, ctx->iv, ivsize);
           ^~~~~~
   drivers/crypto/atmel-aes.c:532:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(req->iv, ctx->iv, ivsize);
           ^~~~~~
   drivers/crypto/atmel-aes.c:818:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/crypto/atmel-aes.c:818:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/crypto/atmel-aes.c:1073:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->iv, req->iv, AES_BLOCK_SIZE);
           ^~~~~~
   drivers/crypto/atmel-aes.c:1073:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->iv, req->iv, AES_BLOCK_SIZE);
           ^~~~~~
   drivers/crypto/atmel-aes.c:1171:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->key, key, keylen);
           ^~~~~~
   drivers/crypto/atmel-aes.c:1171:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->key, key, keylen);
           ^~~~~~
   drivers/crypto/atmel-aes.c:1529:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->j0, iv, ivsize);
--
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   kernel/kmod.c:142:8: warning: Call to function 'vsnprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D vsnprintf(module_name, MODULE_NAME_LEN, fmt, args);
                 ^~~~~~~~~
   kernel/kmod.c:142:8: note: Call to function 'vsnprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'vsnprintf_s' in case of C11
           ret =3D vsnprintf(module_name, MODULE_NAME_LEN, fmt, args);
                 ^~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   kernel/sched/core.c:5511:16: warning: Value stored to 'preempt_disable_i=
p' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:5511:16: note: Value stored to 'preempt_disable_ip' =
during its initialization is never read
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:6296:3: warning: Value stored to 'rq' is never read =
[clang-analyzer-deadcode.DeadStores]
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6296:3: note: Value stored to 'rq' is never read
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7652:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:7652:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:9313:3: warning: Value stored to 'ptr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ptr =3D (unsigned long)kzalloc(ptr, GFP_NOWAIT);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9313:3: note: Value stored to 'ptr' is never read
                   ptr =3D (unsigned long)kzalloc(ptr, GFP_NOWAIT);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 65 warnings (59 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   net/atm/mpoa_caches.c:118:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(entry->MPS_ctrl_ATM_addr, client->mps_ctrl_addr, ATM_ESA_=
LEN);
           ^~~~~~
   net/atm/mpoa_caches.c:118:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(entry->MPS_ctrl_ATM_addr, client->mps_ctrl_addr, ATM_ESA_=
LEN);
           ^~~~~~
   net/atm/mpoa_caches.c:146:4: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(msg.MPS_ctrl, mpc->mps_ctrl_addr, ATM_ESA=
_LEN);
                           ^~~~~~
   net/atm/mpoa_caches.c:146:4: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                           memcpy(msg.MPS_ctrl, mpc->mps_ctrl_addr, ATM_ESA=
_LEN);
                           ^~~~~~
   net/atm/mpoa_caches.c:168:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg.MPS_ctrl, mpc->mps_ctrl_addr, ATM_ESA_LEN);
                   ^~~~~~
   net/atm/mpoa_caches.c:168:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(msg.MPS_ctrl, mpc->mps_ctrl_addr, ATM_ESA_LEN);
                   ^~~~~~
   net/atm/mpoa_caches.c:282:5: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&entry->hold_down, 0, sizeof(time=
64_t));
                                   ^~~~~~
   net/atm/mpoa_caches.c:282:5: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                                   memset(&entry->hold_down, 0, sizeof(time=
64_t));
                                   ^~~~~~
   net/atm/mpoa_caches.c:284:5: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(msg.MPS_ctrl, client->mps_ctrl_ad=
dr, ATM_ESA_LEN);
                                   ^~~~~~
   net/atm/mpoa_caches.c:284:5: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                                   memcpy(msg.MPS_ctrl, client->mps_ctrl_ad=
dr, ATM_ESA_LEN);
                                   ^~~~~~
   net/atm/mpoa_caches.c:478:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(entry->MPS_ctrl_ATM_addr, client->mps_ctrl_addr, ATM_ESA_=
LEN);
           ^~~~~~
   net/atm/mpoa_caches.c:478:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(entry->MPS_ctrl_ATM_addr, client->mps_ctrl_addr, ATM_ESA_=
LEN);
           ^~~~~~
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/dma/lgm/lgm-dma.c:1264:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&c->config, cfg, sizeof(c->config));
           ^~~~~~
   drivers/dma/lgm/lgm-dma.c:1264:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(&c->config, cfg, sizeof(c->config));
           ^~~~~~
   drivers/dma/lgm/lgm-dma.c:1412:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(c->name, sizeof(c->name), "chan%d", c->nr);
           ^~~~~~~~
   drivers/dma/lgm/lgm-dma.c:1412:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(c->name, sizeof(c->name), "chan%d", c->nr);
           ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/iio/accel/kxcjk-1013.c:1121:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", str);
                  ^~~~~~~
   drivers/iio/accel/kxcjk-1013.c:1121:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", str);
                  ^~~~~~~
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/iio/accel/mma9551_core.c:135:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req.buf, inbytes, num_inbytes);
                   ^~~~~~
   drivers/iio/accel/mma9551_core.c:135:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(req.buf, inbytes, num_inbytes);
                   ^~~~~~
   drivers/iio/accel/mma9551_core.c:194:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(outbytes, rsp.buf, num_outbytes);
                   ^~~~~~
   drivers/iio/accel/mma9551_core.c:194:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(outbytes, rsp.buf, num_outbytes);
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/of/fdt_address.c:90:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr, 0, na * 4);
           ^~~~~~
   drivers/of/fdt_address.c:90:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(addr, 0, na * 4);
           ^~~~~~
   drivers/of/fdt_address.c:124:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(addr, 0, pna * 4);
                   ^~~~~~
   drivers/of/fdt_address.c:124:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(addr, 0, pna * 4);
                   ^~~~~~
   drivers/of/fdt_address.c:143:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, ranges + na, 4 * pna);
           ^~~~~~
   drivers/of/fdt_address.c:143:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(addr, ranges + na, 4 * pna);
           ^~~~~~
   drivers/of/fdt_address.c:195:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, reg, na * 4);
           ^~~~~~
   drivers/of/fdt_address.c:195:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(addr, reg, na * 4);
           ^~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/usb/host/oxu210hp-hcd.c:881:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc->u.hs.DeviceRemovable[0], 0, temp);
           ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:881:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&desc->u.hs.DeviceRemovable[0], 0, temp);
           ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:882:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc->u.hs.DeviceRemovable[temp], 0xff, temp);
           ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:882:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&desc->u.hs.DeviceRemovable[temp], 0xff, temp);
           ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:977:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(qtd, 0, sizeof *qtd);
           ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:977:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(qtd, 0, sizeof *qtd);
           ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:1013:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(qtd, 0, sizeof *qtd);
                   ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:1013:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(qtd, 0, sizeof *qtd);
                   ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:1070:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(qh, 0, sizeof *qh);
                   ^~~~~~
   drivers/usb/host/oxu210hp-hcd.c:1070:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(qh, 0, sizeof *qh);
--
           ^~~~~~
   net/ipv4/tcp_ipv4.c:711:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&arg, 0, sizeof(arg));
           ^~~~~~
   net/ipv4/tcp_ipv4.c:862:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rep.th, 0, sizeof(struct tcphdr));
           ^~~~~~
   net/ipv4/tcp_ipv4.c:862:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&rep.th, 0, sizeof(struct tcphdr));
           ^~~~~~
   net/ipv4/tcp_ipv4.c:863:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&arg, 0, sizeof(arg));
           ^~~~~~
   net/ipv4/tcp_ipv4.c:863:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&arg, 0, sizeof(arg));
           ^~~~~~
   net/ipv4/tcp_ipv4.c:1935:2: warning: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(IPCB(skb), &TCP_SKB_CB(skb)->header.h4,
           ^~~~~~~
   net/ipv4/tcp_ipv4.c:1935:2: note: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11
           memmove(IPCB(skb), &TCP_SKB_CB(skb)->header.h4,
           ^~~~~~~
   net/ipv4/tcp_ipv4.c:1945:2: warning: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(&TCP_SKB_CB(skb)->header.h4, IPCB(skb),
           ^~~~~~~
   net/ipv4/tcp_ipv4.c:1945:2: note: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11
           memmove(&TCP_SKB_CB(skb)->header.h4, IPCB(skb),
           ^~~~~~~
   net/ipv4/tcp_ipv4.c:3209:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(net->ipv4.sysctl_tcp_rmem,
                   ^~~~~~
   net/ipv4/tcp_ipv4.c:3209:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(net->ipv4.sysctl_tcp_rmem,
                   ^~~~~~
   net/ipv4/tcp_ipv4.c:3212:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(net->ipv4.sysctl_tcp_wmem,
                   ^~~~~~
   net/ipv4/tcp_ipv4.c:3212:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(net->ipv4.sysctl_tcp_wmem,
                   ^~~~~~
   Suppressed 101 warnings (100 in non-user code, 1 with check filters).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/remoteproc/remoteproc_core.c:263:2: warning: Call to function 'v=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'vsnprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(_name, sizeof(_name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:263:2: note: Call to function 'vsnp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(_name, sizeof(_name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:557:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:557:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:683:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "trace%d", rproc->num_traces);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:683:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "trace%d", rproc->num_traces);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1048:2: warning: Call to function '=
vsnprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'vsnprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1048:2: note: Call to function 'vsn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1087:2: warning: Call to function '=
vsnprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'vsnprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1087:2: note: Call to function 'vsn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1399:3: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(loaded_table, rproc->cached_table, rproc->table_s=
z);
                   ^~~~~~
   drivers/remoteproc/remoteproc_core.c:1399:3: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(loaded_table, rproc->cached_table, rproc->table_s=
z);
                   ^~~~~~
   drivers/remoteproc/remoteproc_core.c:1648:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
           ^~~~~~
   drivers/remoteproc/remoteproc_core.c:1648:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/usb/roles/class.c:232:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", usb_roles[role]);
                  ^~~~~~~
   drivers/usb/roles/class.c:232:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", usb_roles[role]);
                  ^~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/i2c/i2c-core-base.c:645:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", dev->type =3D=3D &i2c_client_type ?
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:645:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", dev->type =3D=3D &i2c_client_type ?
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:664:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s%s\n", I2C_MODULE_PREFIX, client->name);
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:664:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s%s\n", I2C_MODULE_PREFIX, client->name);
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:1185:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1185:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1196:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(info.type, buf, blank - buf);
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1196:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(info.type, buf, blank - buf);
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1199:8: warning: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(++blank, "%hi%c", &info.addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1199:8: note: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(++blank, "%hi%c", &info.addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1254:8: warning: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(buf, "%hi%c", &addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1254:8: note: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(buf, "%hi%c", &addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1740:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&adap->dev, 0, sizeof(adap->dev));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1740:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&adap->dev, 0, sizeof(adap->dev));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:2316:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:2316:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:2521:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg->buf, buf, msg->len);
                   ^~~~~~
   drivers/i2c/i2c-core-base.c:2521:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(msg->buf, buf, msg->len);
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/test_hexdump.c:102:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p, q, amount);
                   ^~~~~~
   lib/test_hexdump.c:102:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(p, q, amount);
                   ^~~~~~
   lib/test_hexdump.c:116:3: warning: Call to function 'strncpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(p, data_a, l);
                   ^~~~~~~
   lib/test_hexdump.c:116:3: note: Call to function 'strncpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'strncpy_s' in case of C11
                   strncpy(p, data_a, l);
                   ^~~~~~~
   lib/test_hexdump.c:133:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(real, FILL_CHAR, sizeof(real));
           ^~~~~~
   lib/test_hexdump.c:133:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(real, FILL_CHAR, sizeof(real));
           ^~~~~~
   lib/test_hexdump.c:137:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(test, FILL_CHAR, sizeof(test));
           ^~~~~~
   lib/test_hexdump.c:137:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(test, FILL_CHAR, sizeof(test));
           ^~~~~~
   lib/test_hexdump.c:172:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, FILL_CHAR, sizeof(buf));
           ^~~~~~
   lib/test_hexdump.c:172:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(buf, FILL_CHAR, sizeof(buf));
--
           ^~~~~~
   drivers/video/backlight/pwm_bl.c:544:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   drivers/video/backlight/pwm_bl.c:544:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/remoteproc/remoteproc_debugfs.c:87:21: warning: The left operand=
 of '=3D=3D' is a garbage value due to array index out of bounds [clang-ana=
lyzer-core.UndefinedBinaryOperatorResult]
           if (buf[count - 1] =3D=3D '\n')
               ~~~~~~~~~~~~~~ ^
   drivers/remoteproc/remoteproc_debugfs.c:79:6: note: Assuming the conditi=
on is false
           if (count > sizeof(buf))
               ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_debugfs.c:79:2: note: Taking false branch
           if (count > sizeof(buf))
           ^
   drivers/remoteproc/remoteproc_debugfs.c:82:8: note: Calling 'copy_from_u=
ser'
           ret =3D copy_from_user(buf, user_buf, count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:221:15: note: Assuming 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:221:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:221:26: note: Assuming 'sz' is < 'bytes', wh=
ich participates in a condition later
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:221:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:222:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   drivers/remoteproc/remoteproc_debugfs.c:82:8: note: Returning from 'copy=
_from_user'
           ret =3D copy_from_user(buf, user_buf, count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_debugfs.c:83:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/remoteproc/remoteproc_debugfs.c:83:2: note: Taking false branch
           if (ret)
           ^
   drivers/remoteproc/remoteproc_debugfs.c:87:21: note: The left operand of=
 '=3D=3D' is a garbage value due to array index out of bounds
           if (buf[count - 1] =3D=3D '\n')
               ~~~~~~~~~~~~~~ ^
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c:142:2: warning: Cal=
l to function 'memcpy' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'memcpy_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->config, opts, sizeof(priv->config));
           ^~~~~~
   drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c:142:2: note: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11
           memcpy(&priv->config, opts, sizeof(priv->config));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/phy/broadcom/phy-brcm-usb.c:233:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/phy/broadcom/phy-brcm-usb.c:233:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/phy/broadcom/phy-brcm-usb.c:269:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/phy/broadcom/phy-brcm-usb.c:269:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/vdpa/vdpa.c:117:8: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:117:8: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:602:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^~~~~~
   drivers/vdpa/vdpa.c:602:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   drivers/regulator/core.c:404:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, 64, "%s-supply", supply);
           ^~~~~~~~
   drivers/regulator/core.c:404:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_name, 64, "%s-supply", supply);
           ^~~~~~~~
   drivers/regulator/core.c:596:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", uV);
                  ^~~~~~~
   drivers/regulator/core.c:596:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", uV);
                  ^~~~~~~
   drivers/regulator/core.c:605:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", _regulator_get_current_limit(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:605:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", _regulator_get_current_limit(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:614:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", rdev_get_name(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:614:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", rdev_get_name(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:635:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", regulator_opmode_to_str(mode));
                  ^~~~~~~
   drivers/regulator/core.c:635:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", regulator_opmode_to_str(mode));
                  ^~~~~~~
   drivers/regulator/core.c:650:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "enabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:650:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "enabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:652:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:652:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:654:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   drivers/regulator/core.c:654:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   drivers/regulator/core.c:714:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/regulator/core.c:714:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/regulator/core.c:724:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:724:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:726:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->min_uA);
                  ^~~~~~~
   drivers/regulator/core.c:726:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->min_uA);
                  ^~~~~~~
   drivers/regulator/core.c:736:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:736:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "constraint not defined\n");
--
                                              ^~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/clk/clk-divider.c:378:14: note: Taking true branch
           req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
                       ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/clk/clk-divider.c:378:14: note: Division by zero
           req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
                       ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/clk/clk-divider.c:240:7: note: Left side of '&&' is false
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/clk/clk-divider.c:240:7: note: Left side of '&&' is false
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/clk/clk-divider.c:240:7: note: Assuming the condition is true
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/clk/clk-divider.c:240:7: note: Taking true branch
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/clk/clk-divider.c:243:6: note: Assuming the condition is true
           if (flags & CLK_DIVIDER_POWER_OF_TWO) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:243:2: note: Taking true branch
           if (flags & CLK_DIVIDER_POWER_OF_TWO) {
           ^
   drivers/clk/clk-divider.c:245:10: note: Calling '__rounddown_pow_of_two'
                   down =3D __rounddown_pow_of_two(down);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
>> drivers/remoteproc/remoteproc_sysfs.c:145:9: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           return sprintf(buf, "%s\n", firmware);
                  ^~~~~~~
   drivers/remoteproc/remoteproc_sysfs.c:145:9: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           return sprintf(buf, "%s\n", firmware);
                  ^~~~~~~
   drivers/remoteproc/remoteproc_sysfs.c:185:9: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           return sprintf(buf, "%s\n", rproc_state_string[state]);
                  ^~~~~~~
   drivers/remoteproc/remoteproc_sysfs.c:185:9: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           return sprintf(buf, "%s\n", rproc_state_string[state]);
                  ^~~~~~~
   drivers/remoteproc/remoteproc_sysfs.c:229:9: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           return sprintf(buf, "%s\n", rproc->name);
                  ^~~~~~~
   drivers/remoteproc/remoteproc_sysfs.c:229:9: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           return sprintf(buf, "%s\n", rproc->name);
                  ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   include/linux/skmsg.h:350:2: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           return msg;
           ^
   net/core/skmsg.c:411:11: note: Calling 'sk_psock_peek_msg'
           msg_rx =3D sk_psock_peek_msg(psock);
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skmsg.h:348:8: note: Left side of '||' is false
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skmsg.h:348:8: note: Left side of '||' is false
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skmsg.h:348:8: note: Left side of '||' is true
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/skmsg.h:348:8: note: Taking false branch
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/skmsg.h:348:8: note: Loop condition is false.  Exiting loop
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:1014:3: note: Loop condition is true.  Enteri=
ng loop body
                   list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_nod=
e) {
                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:1015:8: note: Use of memory after it is freed
                           if (s_rt->slave !=3D slave)
                               ^~~~~~~~~~~
   drivers/soundwire/stream.c:1506:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&params, &bus->params, sizeof(params));
                   ^~~~~~
   drivers/soundwire/stream.c:1506:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&params, &bus->params, sizeof(params));
                   ^~~~~~
   drivers/soundwire/stream.c:1569:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&bus->params, &params, sizeof(params));
           ^~~~~~
   drivers/soundwire/stream.c:1569:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&bus->params, &params, sizeof(params));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/usb/musb/musb_core.c:316:15: warning: Value stored to 'musb' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:316:15: note: Value stored to 'musb' during=
 its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:360:15: warning: Value stored to 'musb' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:360:15: note: Value stored to 'musb' during=
 its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:916:4: warning: Value stored to 'int_usb' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           int_usb &=3D ~MUSB_INTR_SUSPEND;
                           ^          ~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:916:4: note: Value stored to 'int_usb' is n=
ever read
                           int_usb &=3D ~MUSB_INTR_SUSPEND;
                           ^          ~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:1607:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(aInfo, (reg & MUSB_CONFIGDATA_UTMIDW) ? "UTMI-16" : "UTMI=
-8");
           ^~~~~~
   drivers/usb/musb/musb_core.c:1607:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(aInfo, (reg & MUSB_CONFIGDATA_UTMIDW) ? "UTMI-16" : "UTMI=
-8");
           ^~~~~~
   drivers/usb/musb/musb_core.c:1609:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", dyn FIFOs");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1609:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", dyn FIFOs");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1613:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", bulk combine");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1613:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", bulk combine");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1617:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", bulk split");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1617:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", bulk split");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1621:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", HB-ISO Rx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1621:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", HB-ISO Rx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1625:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", HB-ISO Tx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1625:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", HB-ISO Tx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1629:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", SoftConn");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1629:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", SoftConn");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1635:3: warning: Value stored to 'type' is =
never read [clang-analyzer-deadcode.DeadStores]
                   type =3D "M";
                   ^      ~~~
   drivers/usb/musb/musb_core.c:1635:3: note: Value stored to 'type' is nev=
er read
                   type =3D "M";
                   ^      ~~~
   drivers/usb/musb/musb_core.c:1638:3: warning: Value stored to 'type' is =
never read [clang-analyzer-deadcode.DeadStores]
                   type =3D "";
                   ^      ~~
   drivers/usb/musb/musb_core.c:1638:3: note: Value stored to 'type' is nev=
er read
                   type =3D "";
                   ^      ~~
>> drivers/usb/musb/musb_core.c:1866:8: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           ret =3D sprintf(buf, "%s\n", usb_otg_state_string(musb->xceiv->o=
tg->state));
                 ^~~~~~~
   drivers/usb/musb/musb_core.c:1866:8: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           ret =3D sprintf(buf, "%s\n", usb_otg_state_string(musb->xceiv->o=
tg->state));
                 ^~~~~~~
   drivers/usb/musb/musb_core.c:1903:6: warning: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%lu", &val) < 1) {
               ^~~~~~
   drivers/usb/musb/musb_core.c:1903:6: note: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%lu", &val) < 1) {
               ^~~~~~
   drivers/usb/musb/musb_core.c:1944:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(buf, "Vbus %s, timeout %lu msec\n",
                  ^~~~~~~
   drivers/usb/musb/musb_core.c:1944:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(buf, "Vbus %s, timeout %lu msec\n",
                  ^~~~~~~
   drivers/usb/musb/musb_core.c:1958:6: warning: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%hu", &srp) !=3D 1
               ^~~~~~
   drivers/usb/musb/musb_core.c:1958:6: note: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%hu", &srp) !=3D 1
               ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/of/dynamic.c:240:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:240:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:508:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:508:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:550:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:550:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:679:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   drivers/of/dynamic.c:679:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   net/ipv4/tcp_dctcp.c:194:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&info->dctcp, 0, sizeof(info->dctcp));
                   ^~~~~~
   net/ipv4/tcp_dctcp.c:194:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&info->dctcp, 0, sizeof(info->dctcp));
                   ^~~~~~
   Suppressed 97 warnings (96 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   Suppressed 97 warnings (96 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   net/ipv4/tcp_htcp.c:261:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ca, 0, sizeof(struct htcp));
           ^~~~~~
   net/ipv4/tcp_htcp.c:261:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(ca, 0, sizeof(struct htcp));
           ^~~~~~
   Suppressed 97 warnings (96 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   Suppressed 97 warnings (96 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   Suppressed 97 warnings (96 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   Suppressed 97 warnings (96 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (101 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   fs/fscache/volume.c:223:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(volume->coherency, coherency_data, coherency_len);
--
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:232:6: note: Assuming field 'lvds_mux' is =
non-null
           if (ldb->lvds_mux) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:232:2: note: Taking true branch
           if (ldb->lvds_mux) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:233:3: note: 'lvds_mux' initialized to a n=
ull pointer value
                   const struct bus_mux *lvds_mux =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:235:7: note: Assuming the condition is fal=
se
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:235:3: note: Taking false branch
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                   ^
   drivers/gpu/drm/imx/imx-ldb.c:237:12: note: Assuming the condition is fa=
lse
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:237:8: note: Taking false branch
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                        ^
   drivers/gpu/drm/imx/imx-ldb.c:240:35: note: Access to field 'reg' result=
s in a dereference of a null pointer (loaded from variable 'lvds_mux')
                   regmap_update_bits(ldb->regmap, lvds_mux->reg, lvds_mux-=
>mask,
                                                   ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:345:28: warning: Access to field 'reg' res=
ults in a dereference of a null pointer (loaded from variable 'lvds_mux') [=
clang-analyzer-core.NullDereference]
                   regmap_read(ldb->regmap, lvds_mux->reg, &mux);
                                            ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:325:6: note: Assuming the condition is fal=
se
           if (imx_ldb_ch =3D=3D &ldb->channel[0] || dual)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:325:6: note: Left side of '||' is false
   drivers/gpu/drm/imx/imx-ldb.c:325:40: note: Assuming 'dual' is 0
           if (imx_ldb_ch =3D=3D &ldb->channel[0] || dual)
                                                 ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:325:2: note: Taking false branch
           if (imx_ldb_ch =3D=3D &ldb->channel[0] || dual)
           ^
   drivers/gpu/drm/imx/imx-ldb.c:327:6: note: Assuming the condition is fal=
se
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:327:6: note: Left side of '||' is false
   drivers/gpu/drm/imx/imx-ldb.c:327:40: note: 'dual' is 0
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual)
                                                 ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:327:2: note: Taking false branch
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual)
           ^
   drivers/gpu/drm/imx/imx-ldb.c:332:6: note: 'dual' is 0
           if (dual) {
               ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:332:2: note: Taking false branch
           if (dual) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:337:6: note: Assuming field 'lvds_mux' is =
non-null
           if (ldb->lvds_mux) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:337:2: note: Taking true branch
           if (ldb->lvds_mux) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:338:3: note: 'lvds_mux' initialized to a n=
ull pointer value
                   const struct bus_mux *lvds_mux =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:340:7: note: Assuming the condition is fal=
se
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:340:3: note: Taking false branch
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                   ^
   drivers/gpu/drm/imx/imx-ldb.c:342:12: note: Assuming the condition is fa=
lse
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:342:8: note: Taking false branch
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                        ^
   drivers/gpu/drm/imx/imx-ldb.c:345:28: note: Access to field 'reg' result=
s in a dereference of a null pointer (loaded from variable 'lvds_mux')
                   regmap_read(ldb->regmap, lvds_mux->reg, &mux);
                                            ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:421:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clkname, sizeof(clkname), "di%d", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:421:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clkname, sizeof(clkname), "di%d", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:426:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clkname, sizeof(clkname), "di%d_pll", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:426:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clkname, sizeof(clkname), "di%d_pll", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:656:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(clkname, "di%d_sel", i);
                   ^~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:656:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(clkname, "di%d_sel", i);
                   ^~~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> lib/cmdline_kunit.c:79:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(in, "%u%s", get_random_int() % 256, str);
                   ^~~~~~~
   lib/cmdline_kunit.c:79:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(in, "%u%s", get_random_int() % 256, str);
                   ^~~~~~~
   lib/cmdline_kunit.c:97:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(in, "%s%u", str, get_random_int() % 256);
                   ^~~~~~~
   lib/cmdline_kunit.c:97:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(in, "%s%u", str, get_random_int() % 256);
                   ^~~~~~~
   lib/cmdline_kunit.c:114:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(r));
           ^~~~~~
   lib/cmdline_kunit.c:114:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(r));
           ^~~~~~
   lib/cmdline_kunit.c:121:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(r));
           ^~~~~~
   lib/cmdline_kunit.c:121:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(r));
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/char/ipmi/ipmi_ipmb.c:155:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(imsg->rsp + 1, msg + 3, iidev->rcvlen - 4);
                   ^~~~~~
   drivers/char/ipmi/ipmi_ipmb.c:155:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(imsg->rsp + 1, msg + 3, iidev->rcvlen - 4);
                   ^~~~~~
   drivers/char/ipmi/ipmi_ipmb.c:163:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(imsg->rsp + 1, msg + 5, iidev->rcvlen - 6);
                   ^~~~~~
   drivers/char/ipmi/ipmi_ipmb.c:163:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(imsg->rsp + 1, msg + 5, iidev->rcvlen - 6);
                   ^~~~~~
   drivers/char/ipmi/ipmi_ipmb.c:251:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iidev->xmitmsg + 4, msg->data + 2, msg->data_size=
 - 2);
                   ^~~~~~
   drivers/char/ipmi/ipmi_ipmb.c:251:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(iidev->xmitmsg + 4, msg->data + 2, msg->data_size=
 - 2);
                   ^~~~~~
   drivers/char/ipmi/ipmi_ipmb.c:257:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iidev->xmitmsg + 5, msg->data + 1, msg->data_size=
 - 1);
                   ^~~~~~
   drivers/char/ipmi/ipmi_ipmb.c:257:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(iidev->xmitmsg + 5, msg->data + 1, msg->data_size=
 - 1);
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/char/ipmi/ipmi_watchdog.c:215:2: warning: Call to function 'strn=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'strncpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(valcp, val, 15);
           ^~~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:215:2: note: Call to function 'strncpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(valcp, val, 15);
           ^~~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1204:3: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcpy(outval, action);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1204:3: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
                   strcpy(outval, action);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1219:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(action, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1219:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(action, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1226:3: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcpy(outval, preaction);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1226:3: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
                   strcpy(outval, preaction);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1243:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(preaction, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1243:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(preaction, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1250:3: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcpy(outval, preop);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1250:3: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
                   strcpy(outval, preop);
                   ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1263:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(preop, inval);
           ^~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1263:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(preop, inval);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/usb/mtu3/mtu3_debugfs.c:135:2: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           sprintf(mregs->name, "%s", name);
           ^~~~~~~
   drivers/usb/mtu3/mtu3_debugfs.c:135:2: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           sprintf(mregs->name, "%s", name);
           ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/usb/host/ehci-hcd.c:888:2: note: Control jumps to the 'default' =
case@line 897
           switch (usb_pipetype (urb->pipe)) {
           ^
   drivers/usb/host/ehci-hcd.c:898:3: note: Taking false branch
                   if (!qh_urb_transaction (ehci, urb, &qtd_list, mem_flags=
))
                   ^
   drivers/usb/host/ehci-hcd.c:900:10: note: Calling 'submit_async'
                   return submit_async(ehci, urb, &qtd_list, mem_flags);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
--
           ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5646:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5646:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5681:3: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msgs[num - 1].buf, txmsg->reply.u.remote_i2c_read=
_ack.bytes, msgs[num - 1].len);
                   ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5681:3: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(msgs[num - 1].buf, txmsg->reply.u.remote_i2c_read=
_ack.bytes, msgs[num - 1].len);
                   ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5705:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&msg, 0, sizeof(msg));
                   ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5705:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&msg, 0, sizeof(msg));
                   ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5712:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(txmsg, 0, sizeof(*txmsg));
                   ^~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:5712:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(txmsg, 0, sizeof(*txmsg));
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/char/hw_random/cctrng.c:136:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:136:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:165:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:165:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:232:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, &(buf[drvdata->circ.tail]), size);
           ^~~~~~
   drivers/char/hw_random/cctrng.c:232:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, &(buf[drvdata->circ.tail]), size);
           ^~~~~~
   drivers/char/hw_random/cctrng.c:241:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, &(buf[drvdata->circ.tail]), size);
                   ^~~~~~
   drivers/char/hw_random/cctrng.c:241:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data, &(buf[drvdata->circ.tail]), size);
                   ^~~~~~
   drivers/char/hw_random/cctrng.c:278:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:278:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (45 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (45 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/usb/musb/musb_dsps.c:351:6: warning: Value stored to 'devctl' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u8 devctl =3D musb_readb(mregs, MUSB_DEVCTL);
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_dsps.c:351:6: note: Value stored to 'devctl' durin=
g its initialization is never read
                   u8 devctl =3D musb_readb(mregs, MUSB_DEVCTL);
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/musb/musb_dsps.c:414:2: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           sprintf(buf, "%s.dsps", dev_name(musb->controller));
           ^~~~~~~
   drivers/usb/musb/musb_dsps.c:414:2: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           sprintf(buf, "%s.dsps", dev_name(musb->controller));
           ^~~~~~~
   drivers/usb/musb/musb_dsps.c:637:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, &val, len);
                   ^~~~~~
   drivers/usb/musb/musb_dsps.c:637:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, &val, len);
                   ^~~~~~
   drivers/usb/musb/musb_dsps.c:735:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(resources, 0, sizeof(resources));
           ^~~~~~
   drivers/usb/musb/musb_dsps.c:735:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(resources, 0, sizeof(resources));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/usb/musb/tusb6010.c:185:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&val, buf, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:185:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&val, buf, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:194:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&val, buf, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:194:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&val, buf, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:208:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, &val, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:208:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, &val, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:216:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &val, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:216:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &val, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:222:15: warning: Value stored to 'musb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:222:15: note: Value stored to 'musb' during =
its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:272:15: warning: Value stored to 'musb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:272:15: note: Value stored to 'musb' during =
its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:633:2: warning: Value stored to 'otg_stat' i=
s never read [clang-analyzer-deadcode.DeadStores]
           otg_stat =3D musb_readl(tbase, TUSB_DEV_OTG_STAT);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:633:2: note: Value stored to 'otg_stat' is n=
ever read
           otg_stat =3D musb_readl(tbase, TUSB_DEV_OTG_STAT);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:1226:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(musb_resources, 0x00, sizeof(*musb_resources) *
           ^~~~~~
   drivers/usb/musb/tusb6010.c:1226:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(musb_resources, 0x00, sizeof(*musb_resources) *
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/pinctrl/pinctrl-equilibrium.c:98:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&it, 0, sizeof(it));
           ^~~~~~
   drivers/pinctrl/pinctrl-equilibrium.c:98:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&it, 0, sizeof(it));
           ^~~~~~
   drivers/pinctrl/pinctrl-equilibrium.c:765:3: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&group, 0, sizeof(group));
                   ^~~~~~
   drivers/pinctrl/pinctrl-equilibrium.c:765:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(&group, 0, sizeof(group));
                   ^~~~~~
   drivers/pinctrl/pinctrl-equilibrium.c:801:3: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pin_names, PIN_NAME_FMT, i);
                   ^~~~~~~
   drivers/pinctrl/pinctrl-equilibrium.c:801:3: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(pin_names, PIN_NAME_FMT, i);
                   ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/xlnx/zynqmp_disp.c:1327:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(dma_channel_name, sizeof(dma_channel_name),
                   ^~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_disp.c:1327:3: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(dma_channel_name, sizeof(dma_channel_name),
--
           ^~~~~~
   net/mptcp/protocol.c:2550:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(mptcp_sk(sk)->ca_name, icsk->icsk_ca_ops->name);
           ^~~~~~
   Suppressed 101 warnings (100 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/crypto/keembay/keembay-ocs-aes-core.c:177:2: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tctx->key, in_key, key_len);
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:177:2: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tctx->key, in_key, key_len);
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:246:2: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:246:2: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:580:4: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(req->iv, rctx->last_ct_blk, iv_size);
                           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:580:4: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(req->iv, rctx->last_ct_blk, iv_size);
                           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/crypto/keembay/ocs-aes.c:906:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tag, tag_u32, tag_size);
           ^~~~~~
   drivers/crypto/keembay/ocs-aes.c:906:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tag, tag_u32, tag_size);
           ^~~~~~
   drivers/crypto/keembay/ocs-aes.c:1062:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(b0, 0, sizeof(b0));
           ^~~~~~
   drivers/crypto/keembay/ocs-aes.c:1062:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(b0, 0, sizeof(b0));
           ^~~~~~
   drivers/crypto/keembay/ocs-aes.c:1154:3: warning: 1st function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   iowrite8(enc_a[i],
                   ^
   include/asm-generic/io.h:743:18: note: expanded from macro 'iowrite8'
   #define iowrite8 iowrite8
                    ^
   drivers/crypto/keembay/ocs-aes.c:1327:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/crypto/keembay/ocs-aes.c:1327:2: note: Taking false branch
           if (rc)
           ^
   drivers/crypto/keembay/ocs-aes.c:1369:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/crypto/keembay/ocs-aes.c:1369:2: note: Taking false branch
           if (rc)
           ^
   drivers/crypto/keembay/ocs-aes.c:1379:2: note: Calling 'ocs_aes_ccm_do_a=
data'
           ocs_aes_ccm_do_adata(aes_dev, adata_dma_list, adata_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1164:6: note: Assuming 'adata_size' is =
not equal to 0
           if (!adata_size) {
               ^~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1164:2: note: Taking false branch
           if (!adata_size) {
           ^
   drivers/crypto/keembay/ocs-aes.c:1176:2: note: Calling 'ocs_aes_ccm_writ=
e_adata_len'
           ocs_aes_ccm_write_adata_len(aes_dev, adata_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1141:6: note: Assuming 'adata_len' is <=
 65280
           if (adata_len < 65280) {
               ^~~~~~~~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1141:2: note: Taking true branch
           if (adata_len < 65280) {
           ^
   drivers/crypto/keembay/ocs-aes.c:1153:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < len; i++)
           ^
   drivers/crypto/keembay/ocs-aes.c:1153:23: note: The value 1 is assigned =
to 'i'
           for (i =3D 0; i < len; i++)
                                ^~~
   drivers/crypto/keembay/ocs-aes.c:1153:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < len; i++)
           ^
   drivers/crypto/keembay/ocs-aes.c:1154:3: note: 1st function call argumen=
t is an uninitialized value
                   iowrite8(enc_a[i],
                   ^        ~~~~~~~~
   include/asm-generic/io.h:743:18: note: expanded from macro 'iowrite8'
   #define iowrite8 iowrite8
                    ^
   drivers/crypto/keembay/ocs-aes.c:1337:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&iv[COUNTER_START(lprime)], 0, COUNTER_LEN(lprime));
           ^~~~~~
   drivers/crypto/keembay/ocs-aes.c:1337:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&iv[COUNTER_START(lprime)], 0, COUNTER_LEN(lprime));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
>> drivers/staging/greybus/arche-apb-ctrl.c:302:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                   return sprintf(buf, "off%s\n",
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:302:10: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                   return sprintf(buf, "off%s\n",
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:305:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:305:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:307:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:307:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:309:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:309:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:311:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:311:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/media/cec/platform/s5p/exynos_hdmi_cecctrl.c:202:3: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
                   sprintf(debug + i * 2, "%02x ", buffer[i]);
                   ^~~~~~~
   drivers/media/cec/platform/s5p/exynos_hdmi_cecctrl.c:202:3: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
                   sprintf(debug + i * 2, "%02x ", buffer[i]);
                   ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/w1/masters/ds2490.c:277:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(st, 0, sizeof(*st));
                   ^~~~~~
   drivers/w1/masters/ds2490.c:277:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(st, 0, sizeof(*st));
                   ^~~~~~
   drivers/w1/masters/ds2490.c:295:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(st, dev->st_buf, sizeof(*st));
                   ^~~~~~
   drivers/w1/masters/ds2490.c:295:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(st, dev->st_buf, sizeof(*st));
                   ^~~~~~
   drivers/w1/masters/ds2490.c:621:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0xFF, len);
           ^~~~~~
   drivers/w1/masters/ds2490.c:621:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(buf, 0xFF, len);
           ^~~~~~
   drivers/w1/masters/ds2490.c:633:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, len);
           ^~~~~~
   drivers/w1/masters/ds2490.c:633:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, len);
           ^~~~~~
   drivers/w1/masters/ds2490.c:915:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, tbuf, len);
                   ^~~~~~
   drivers/w1/masters/ds2490.c:915:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, tbuf, len);
                   ^~~~~~
   drivers/w1/masters/ds2490.c:946:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&dev->master, 0, sizeof(struct w1_bus_master));
           ^~~~~~
   drivers/w1/masters/ds2490.c:946:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&dev->master, 0, sizeof(struct w1_bus_master));
           ^~~~~~
   drivers/w1/masters/ds2490.c:1006:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dev->ep, 0, sizeof(dev->ep));
           ^~~~~~
   drivers/w1/masters/ds2490.c:1006:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(dev->ep, 0, sizeof(dev->ep));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/dma/qcom/hidma_ll.c:535:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lldev->tre_ring + lldev->tre_write_offset,
           ^~~~~~
   drivers/dma/qcom/hidma_ll.c:535:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(lldev->tre_ring + lldev->tre_write_offset,
           ^~~~~~
   drivers/dma/qcom/hidma_ll.c:817:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(lldev->trepool, 0, required_bytes);
--
           ^      ~~~
   fs/splice.c:853:2: warning: Value stored to 'ret' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/splice.c:853:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:134:9: warning: The resul=
t of the left shift is undefined due to shifting '16711678' by '16', which =
is unrepresentable in the unsigned version of the return type 'int' [clang-=
analyzer-core.UndefinedBinaryOperatorResult]
           cfg |=3D ATMEL_HLCDC_CLKDIV(div);
                  ^
   include/linux/mfd/atmel-hlcdc.h:44:45: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                            ~~~~~~~~~ ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:78:8: note: Calling 'clk_=
prepare_enable'
           ret =3D clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:951:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:951:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:954:6: note: Assuming 'ret' is 0, which participates=
 in a condition later
           if (ret)
               ^~~
   include/linux/clk.h:954:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:957:2: note: Returning zero (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:78:8: note: Returning fro=
m 'clk_prepare_enable'
           ret =3D clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:79:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:79:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:104:6: note: Assuming fie=
ld 'fixed_clksrc' is true
           if (!crtc->dc->desc->fixed_clksrc) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:104:2: note: Taking false=
 branch
           if (!crtc->dc->desc->fixed_clksrc) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:111:6: note: Assuming 'di=
v' is >=3D 2
           if (div < 2) {
               ^~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:111:2: note: Taking false=
 branch
           if (div < 2) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:113:13: note: Assuming th=
e condition is true
           } else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
                      ^
   include/linux/mfd/atmel-hlcdc.h:44:34: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:113:9: note: Taking true =
branch
           } else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
                  ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:118:7: note: Assuming the=
 condition is true
                   if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
                       ^
   include/linux/mfd/atmel-hlcdc.h:44:34: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:118:3: note: Taking true =
branch
                   if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:134:9: note: The result o=
f the left shift is undefined due to shifting '16711678' by '16', which is =
unrepresentable in the unsigned version of the return type 'int'
           cfg |=3D ATMEL_HLCDC_CLKDIV(div);
                  ^
   include/linux/mfd/atmel-hlcdc.h:44:45: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                            ~~~~~~~~~ ^
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
>> drivers/power/supply/charger-manager.c:1081:9: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", charger->regulator_name);
                  ^~~~~~~
   drivers/power/supply/charger-manager.c:1081:9: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
           return sprintf(buf, "%s\n", charger->regulator_name);
                  ^~~~~~~
   drivers/power/supply/charger-manager.c:1094:9: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", state ? "enabled" : "disabled");
                  ^~~~~~~
   drivers/power/supply/charger-manager.c:1094:9: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
           return sprintf(buf, "%s\n", state ? "enabled" : "disabled");
                  ^~~~~~~
   drivers/power/supply/charger-manager.c:1103:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", charger->externally_control);
                  ^~~~~~~
   drivers/power/supply/charger-manager.c:1103:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", charger->externally_control);
                  ^~~~~~~
   drivers/power/supply/charger-manager.c:1120:8: warning: Call to function=
 'sscanf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%d", &externally_control);
                 ^~~~~~
   drivers/power/supply/charger-manager.c:1120:8: note: Call to function 's=
scanf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%d", &externally_control);
                 ^~~~~~
   drivers/power/supply/charger-manager.c:1519:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cm->charger_psy_desc, &psy_default, sizeof(psy_default));
           ^~~~~~
   drivers/power/supply/charger-manager.c:1519:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cm->charger_psy_desc, &psy_default, sizeof(psy_default));
           ^~~~~~
   drivers/power/supply/charger-manager.c:1522:3: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(cm->psy_name_buf, psy_default.name, PSY_NAME_MAX=
);
                   ^~~~~~~
   drivers/power/supply/charger-manager.c:1522:3: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(cm->psy_name_buf, psy_default.name, PSY_NAME_MAX=
);
                   ^~~~~~~
   drivers/power/supply/charger-manager.c:1524:3: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(cm->psy_name_buf, desc->psy_name, PSY_NAME_MAX);
                   ^~~~~~~
   drivers/power/supply/charger-manager.c:1524:3: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(cm->psy_name_buf, desc->psy_name, PSY_NAME_MAX);
                   ^~~~~~~
   drivers/power/supply/charger-manager.c:1535:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(properties, default_charger_props,
           ^~~~~~
   drivers/power/supply/charger-manager.c:1535:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(properties, default_charger_props,
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/regulator/pwm-regulator.c:335:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&drvdata->desc, &pwm_regulator_desc, sizeof(drvdata->desc=
));
           ^~~~~~
   drivers/regulator/pwm-regulator.c:335:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&drvdata->desc, &pwm_regulator_desc, sizeof(drvdata->desc=
));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/iio/light/adux1020.c:384:9: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                           *val =3D buf[0];
                                ^ ~~~~~~
   drivers/iio/light/adux1020.c:372:2: note: Control jumps to 'case IIO_CHA=
N_INFO_RAW:'  at line 373
           switch (mask) {
           ^
   drivers/iio/light/adux1020.c:374:3: note: Control jumps to 'case IIO_PRO=
XIMITY:'  at line 375
                   switch (chan->type) {
                   ^
   drivers/iio/light/adux1020.c:377:8: note: 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~
   drivers/iio/light/adux1020.c:377:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:380:10: note: Calling 'adux1020_measure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:320:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
--
           ^~~~~~
   drivers/video/fbdev/broadsheetfb.c:1149:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(info->cmap.blue, info->cmap.red, sizeof(u16)*16);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   kernel/time/test_udelay.c:114:8: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(lbuf, "%d %d", &usecs, &iters);
                 ^~~~~~
   kernel/time/test_udelay.c:114:8: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(lbuf, "%d %d", &usecs, &iters);
                 ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   kernel/torture.c:914:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, sizeof(buf), "Stopping %s", title);
           ^~~~~~~~
   kernel/torture.c:914:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           snprintf(buf, sizeof(buf), "Stopping %s", title);
           ^~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/usb/chipidea/debug.c:90:6: warning: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%u", &mode) !=3D 1)
               ^~~~~~
   drivers/usb/chipidea/debug.c:90:6: note: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%u", &mode) !=3D 1)
               ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
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
                           ^~~~~~
   fs/dcache.c:2835:4: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dentry->d_iname, target->d_name.name,
                           ^~~~~~
   fs/dcache.c:2835:4: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                           memcpy(dentry->d_iname, target->d_name.name,
                           ^~~~~~
   fs/dcache.c:2863:3: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dentry->d_iname, target->d_name.name,
                   ^~~~~~
   fs/dcache.c:2863:3: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                   memcpy(dentry->d_iname, target->d_name.name,
                   ^~~~~~
   fs/dcache.c:3203:23: warning: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           dentry->d_name.len =3D sprintf(dentry->d_iname, "#%llu",
                                ^~~~~~~
   fs/dcache.c:3203:23: note: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11
           dentry->d_name.len =3D sprintf(dentry->d_iname, "#%llu",
                                ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/firmware/arm_scmi/msg.c:60:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg->msg_payload, xfer->tx.buf, xfer->tx.len);
                   ^~~~~~
   drivers/firmware/arm_scmi/msg.c:60:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(msg->msg_payload, xfer->tx.buf, xfer->tx.len);
                   ^~~~~~
   drivers/firmware/arm_scmi/msg.c:92:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(xfer->rx.buf, &msg->msg_payload[1], xfer->rx.len);
           ^~~~~~
   drivers/firmware/arm_scmi/msg.c:92:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(xfer->rx.buf, &msg->msg_payload[1], xfer->rx.len);
           ^~~~~~
   drivers/firmware/arm_scmi/msg.c:110:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(xfer->rx.buf, msg->msg_payload, xfer->rx.len);
           ^~~~~~
   drivers/firmware/arm_scmi/msg.c:110:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(xfer->rx.buf, msg->msg_payload, xfer->rx.len);
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/perf/fsl_imx8_ddr_perf.c:269:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(event, "config:0-7");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:269:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(event, "config:0-7");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:270:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(axi_id, "config1:0-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:270:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(axi_id, "config1:0-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:271:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:271:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
>> drivers/perf/arm_dmc620_pmu.c:208:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GEN_PMU_FORMAT_ATTR(mask);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:208:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GEN_PMU_FORMAT_ATTR(mask);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:209:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GEN_PMU_FORMAT_ATTR(match);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:209:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GEN_PMU_FORMAT_ATTR(match);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:210:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GEN_PMU_FORMAT_ATTR(invert);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:210:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GEN_PMU_FORMAT_ATTR(invert);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:211:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GEN_PMU_FORMAT_ATTR(incr);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:211:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GEN_PMU_FORMAT_ATTR(incr);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:212:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GEN_PMU_FORMAT_ATTR(event);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:212:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GEN_PMU_FORMAT_ATTR(event);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:213:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GEN_PMU_FORMAT_ATTR(clkdiv2);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/arm_dmc620_pmu.c:213:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GEN_PMU_FORMAT_ATTR(clkdiv2);
   ^
   drivers/perf/arm_dmc620_pmu.c:194:2: note: expanded from macro 'GEN_PMU_=
FORMAT_ATTR'
           PMU_FORMAT_ATTR(name,                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   net/core/sock_reuseport.c:197:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(more_reuse->socks, reuse->socks,
           ^~~~~~
   net/core/sock_reuseport.c:197:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(more_reuse->socks, reuse->socks,
           ^~~~~~
   net/core/sock_reuseport.c:199:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(more_reuse->socks +
           ^~~~~~
   net/core/sock_reuseport.c:199:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(more_reuse->socks +
           ^~~~~~
   Suppressed 95 warnings (94 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/misc/ds1682.c:94:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", (sattr->nr =3D=3D 4) ? (val * 250)=
 : val);
                  ^~~~~~~
   drivers/misc/ds1682.c:94:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", (sattr->nr =3D=3D 4) ? (val * 250)=
 : val);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/misc/hmc6352.c:84:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d.%d\n", ret/10, ret%10);
                  ^~~~~~~
   drivers/misc/hmc6352.c:84:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d.%d\n", ret/10, ret%10);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/staging/fieldbus/anybuss/hms-profinet.c:69:9: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, max_size, "%pM\n", response.addr);
                  ^~~~~~~~
   drivers/staging/fieldbus/anybuss/hms-profinet.c:69:9: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, max_size, "%pM\n", response.addr);
                  ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/mfd/arizona-core.c:954:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&arizona->pdata, dev_get_platdata(arizona->dev),
                   ^~~~~~
   drivers/mfd/arizona-core.c:954:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&arizona->pdata, dev_get_platdata(arizona->dev),
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/shmobile/shmob_drm_plane.c:178:27: warning: Value stored=
 to 'sdev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct shmob_drm_device *sdev =3D plane->dev->dev_private;
                                    ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/shmobile/shmob_drm_plane.c:178:27: note: Value stored to=
 'sdev' during its initialization is never read
           struct shmob_drm_device *sdev =3D plane->dev->dev_private;
                                    ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
--
               ^~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:227:2: note: Taking true branch
           if (div =3D=3D 0) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:228:7: note: Assuming 'odr_idx' is eq=
ual to 0
                   if (odr_idx =3D=3D 0) {
                       ^~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:228:3: note: Taking true branch
                   if (odr_idx =3D=3D 0) {
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:230:4: note: Returning zero, which pa=
rticipates in a condition later
                           return 0;
                           ^~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:302:8: note: Returning from 'lis3lv02=
d_get_pwron_wait'
           ret =3D lis3lv02d_get_pwron_wait(lis3);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:303:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/misc/lis3lv02d/lis3lv02d.c:303:2: note: Taking false branch
           if (ret)
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:313:8: note: Calling 'lis3lv02d_get_p=
wron_wait'
           ret =3D lis3lv02d_get_pwron_wait(lis3);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:227:6: note: Assuming 'div' is equal =
to 0
           if (div =3D=3D 0) {
               ^~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:227:2: note: Taking true branch
           if (div =3D=3D 0) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:228:7: note: Assuming 'odr_idx' is eq=
ual to 0
                   if (odr_idx =3D=3D 0) {
                       ^~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:228:3: note: Taking true branch
                   if (odr_idx =3D=3D 0) {
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:230:4: note: Returning zero, which pa=
rticipates in a condition later
                           return 0;
                           ^~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:313:8: note: Returning from 'lis3lv02=
d_get_pwron_wait'
           ret =3D lis3lv02d_get_pwron_wait(lis3);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:314:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/misc/lis3lv02d/lis3lv02d.c:314:2: note: Taking false branch
           if (ret)
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:323:6: note: Assuming field 'whoami' =
is equal to WAI_8B
           if (lis3->whoami =3D=3D WAI_8B) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:323:2: note: Taking true branch
           if (lis3->whoami =3D=3D WAI_8B) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:326:3: note: 3rd function call argume=
nt is an uninitialized value
                   lis3->write(lis3, CTRL_REG3, ctrl_reg_data);
                   ^                            ~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:806:9: warning: 4th function call arg=
ument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           return sprintf(buf, "%s %d %d %d\n", res,
                  ^
   drivers/misc/lis3lv02d/lis3lv02d.c:794:10: note: Calling 'lis3lv02d_self=
test'
           switch (lis3lv02d_selftest(lis3, values)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:276:6: note: Assuming field 'whoami' =
is not equal to WAI_8B
           if (lis3->whoami =3D=3D WAI_8B) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:276:2: note: Taking false branch
           if (lis3->whoami =3D=3D WAI_8B) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:289:7: note: Assuming field 'whoami' =
is equal to WAI_3DC
           if ((lis3->whoami =3D=3D WAI_3DC) || (lis3->whoami =3D=3D WAI_3D=
LH)) {
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:289:32: note: Left side of '||' is tr=
ue
           if ((lis3->whoami =3D=3D WAI_3DC) || (lis3->whoami =3D=3D WAI_3D=
LH)) {
                                         ^
   drivers/misc/lis3lv02d/lis3lv02d.c:303:6: note: 'ret' is -6
           if (ret)
               ^~~
   drivers/misc/lis3lv02d/lis3lv02d.c:303:2: note: Taking true branch
           if (ret)
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:304:3: note: Control jumps to line 356
                   goto fail;
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:357:2: note: Returning without writin=
g to '*results'
           return ret;
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:794:10: note: Returning from 'lis3lv0=
2d_selftest'
           switch (lis3lv02d_selftest(lis3, values)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:794:2: note: Control jumps to the 'de=
fault' case at line 802
           switch (lis3lv02d_selftest(lis3, values)) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:804:3: note:  Execution continues on =
line 806
                   break;
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:806:9: note: 4th function call argume=
nt is an uninitialized value
           return sprintf(buf, "%s %d %d %d\n", res,
                  ^
>> drivers/misc/lis3lv02d/lis3lv02d.c:806:9: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
           return sprintf(buf, "%s %d %d %d\n", res,
                  ^~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:806:9: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
           return sprintf(buf, "%s %d %d %d\n", res,
                  ^~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:820:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "(%d,%d,%d)\n", x, y, z);
                  ^~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:820:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "(%d,%d,%d)\n", x, y, z);
                  ^~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:832:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", lis3->odrs[odr_idx]);
                  ^~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:832:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", lis3->odrs[odr_idx]);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/crypto/qce/common.c:477:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(authiv, std_iv_sha1, auth_ivsize);
                           ^~~~~~
   drivers/crypto/qce/common.c:477:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(authiv, std_iv_sha1, auth_ivsize);
                           ^~~~~~
   drivers/crypto/qce/common.c:480:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(authiv, std_iv_sha256, auth_ivsize);
                           ^~~~~~
   drivers/crypto/qce/common.c:480:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(authiv, std_iv_sha256, auth_ivsize);
                           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/crypto/qce/aead.c:148:4: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   drivers/crypto/qce/aead.c:148:4: note: Value stored to 'ret' is never re=
ad
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   drivers/crypto/qce/aead.c:154:4: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   drivers/crypto/qce/aead.c:154:4: note: Value stored to 'ret' is never re=
ad
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   drivers/crypto/qce/aead.c:394:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&msg_len[0], &rctx->cryptlen, 4);
           ^~~~~~
   drivers/crypto/qce/aead.c:394:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&msg_len[0], &rctx->cryptlen, 4);
           ^~~~~~
   drivers/crypto/qce/aead.c:396:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&rctx->ccm_nonce[0], rctx->iv, rctx->ivsize);
           ^~~~~~
   drivers/crypto/qce/aead.c:396:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&rctx->ccm_nonce[0], rctx->iv, rctx->ivsize);
           ^~~~~~
   drivers/crypto/qce/aead.c:421:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(rctx->ccm_rfc4309_iv, 0, QCE_MAX_IV_SIZE);
                   ^~~~~~
   drivers/crypto/qce/aead.c:421:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(rctx->ccm_rfc4309_iv, 0, QCE_MAX_IV_SIZE);
                   ^~~~~~
   drivers/crypto/qce/aead.c:423:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rctx->ccm_rfc4309_iv[1], ctx->ccm4309_salt, QCE_=
CCM4309_SALT_SIZE);
                   ^~~~~~
   drivers/crypto/qce/aead.c:423:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&rctx->ccm_rfc4309_iv[1], ctx->ccm4309_salt, QCE_=
CCM4309_SALT_SIZE);
                   ^~~~~~
   drivers/crypto/qce/aead.c:424:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rctx->ccm_rfc4309_iv[4], req->iv, 8);
                   ^~~~~~
   drivers/crypto/qce/aead.c:424:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&rctx->ccm_rfc4309_iv[4], req->iv, 8);
                   ^~~~~~
   drivers/crypto/qce/aead.c:575:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->ccm4309_salt, key + keylen, QCE_CCM4309_SALT=
_SIZE);
                   ^~~~~~
   drivers/crypto/qce/aead.c:575:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->ccm4309_salt, key + keylen, QCE_CCM4309_SALT=
_SIZE);
                   ^~~~~~
   drivers/crypto/qce/aead.c:584:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->enc_key, key, keylen);
           ^~~~~~
   drivers/crypto/qce/aead.c:584:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->enc_key, key, keylen);
           ^~~~~~
   drivers/crypto/qce/aead.c:585:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->auth_key, key, keylen);
           ^~~~~~
   drivers/crypto/qce/aead.c:585:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->auth_key, key, keylen);
--
           ^
   drivers/rpmsg/qcom_smd.c:327:3: note: expanded from macro 'SET_TX_CHANNE=
L_FLAG'
                   BUILD_BUG_ON(sizeof(channel->info->tx.param) !=3D sizeof=
(u8)); \
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/rpmsg/qcom_smd.c:794:2: note: Field 'info_word' is non-null
           SET_TX_CHANNEL_FLAG(channel, fTAIL, 0);
           ^
   drivers/rpmsg/qcom_smd.c:328:16: note: expanded from macro 'SET_TX_CHANN=
EL_FLAG'
                   if (channel->info_word)                                 =
     \
                                ^
   drivers/rpmsg/qcom_smd.c:794:2: note: Taking true branch
           SET_TX_CHANNEL_FLAG(channel, fTAIL, 0);
           ^
   drivers/rpmsg/qcom_smd.c:328:3: note: expanded from macro 'SET_TX_CHANNE=
L_FLAG'
                   if (channel->info_word)                                 =
     \
                   ^
   drivers/rpmsg/qcom_smd.c:799:2: note: Taking false branch
           SET_TX_CHANNEL_FLAG(channel, fHEAD, 1);
           ^
   drivers/rpmsg/qcom_smd.c:327:3: note: expanded from macro 'SET_TX_CHANNE=
L_FLAG'
                   BUILD_BUG_ON(sizeof(channel->info->tx.param) !=3D sizeof=
(u8)); \
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/rpmsg/qcom_smd.c:799:2: note: Loop condition is false.  Exiting =
loop
           SET_TX_CHANNEL_FLAG(channel, fHEAD, 1);
           ^
   drivers/rpmsg/qcom_smd.c:327:3: note: expanded from macro 'SET_TX_CHANNE=
L_FLAG'
                   BUILD_BUG_ON(sizeof(channel->info->tx.param) !=3D sizeof=
(u8)); \
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/rpmsg/qcom_smd.c:799:2: note: Field 'info_word' is non-null
           SET_TX_CHANNEL_FLAG(channel, fHEAD, 1);
           ^
   drivers/rpmsg/qcom_smd.c:328:16: note: expanded from macro 'SET_TX_CHANN=
EL_FLAG'
                   if (channel->info_word)                                 =
     \
                                ^
   drivers/rpmsg/qcom_smd.c:799:2: note: Taking true branch
           SET_TX_CHANNEL_FLAG(channel, fHEAD, 1);
           ^
   drivers/rpmsg/qcom_smd.c:328:3: note: expanded from macro 'SET_TX_CHANNE=
L_FLAG'
                   if (channel->info_word)                                 =
     \
                   ^
   drivers/rpmsg/qcom_smd.c:809:2: note: Undefined or garbage value returne=
d to caller
           return ret;
           ^      ~~~
   drivers/rpmsg/qcom_smd.c:1092:2: warning: Call to function 'strncpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(rpdev->id.name, channel->name, RPMSG_NAME_SIZE);
           ^~~~~~~
   drivers/rpmsg/qcom_smd.c:1092:2: note: Call to function 'strncpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'strncpy_s' in case of C11
           strncpy(rpdev->id.name, channel->name, RPMSG_NAME_SIZE);
           ^~~~~~~
   drivers/rpmsg/qcom_smd.c:1323:3: warning: Call to function 'strncpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
                   ^~~~~~~
   drivers/rpmsg/qcom_smd.c:1323:3: note: Call to function 'strncpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'strncpy_s' in case of C11
                   strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
                   ^~~~~~~
>> drivers/rpmsg/qcom_smd.c:1455:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", edge->name);
                  ^~~~~~~
   drivers/rpmsg/qcom_smd.c:1455:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", edge->name);
                  ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   85 warnings generated.
   net/core/xdp.c:161:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdp_rxq, 0, sizeof(*xdp_rxq));
           ^~~~~~
   net/core/xdp.c:161:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(xdp_rxq, 0, sizeof(*xdp_rxq));
           ^~~~~~
   net/core/xdp.c:524:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdpf, 0, sizeof(*xdpf));
           ^~~~~~
   net/core/xdp.c:524:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(xdpf, 0, sizeof(*xdpf));
           ^~~~~~
   net/core/xdp.c:528:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, data_to_copy, totsize);
           ^~~~~~
   net/core/xdp.c:528:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(addr, data_to_copy, totsize);
           ^~~~~~
   net/core/xdp.c:613:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(skb, 0, offsetof(struct sk_buff, tail));
           ^~~~~~
   net/core/xdp.c:613:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(skb, 0, offsetof(struct sk_buff, tail));
           ^~~~~~
   net/core/xdp.c:636:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, xdpf, totalsize);
           ^~~~~~
   net/core/xdp.c:636:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(addr, xdpf, totalsize);
           ^~~~~~
   Suppressed 80 warnings (80 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
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
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/usb/typec/ucsi/ucsi.c:421:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(orig, 0, sizeof(orig));
           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:421:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(orig, 0, sizeof(orig));
           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:422:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(updated, 0, sizeof(updated));
           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:422:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(updated, 0, sizeof(updated));
           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:426:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&alt, 0, sizeof(alt));
                   ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:426:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(&alt, 0, sizeof(alt));
                   ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:457:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&desc, 0, sizeof(desc));
                   ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:457:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(&desc, 0, sizeof(desc));
                   ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:503:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(alt, 0, sizeof(alt));
                   ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:503:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(alt, 0, sizeof(alt));
                   ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:527:4: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&desc, 0, sizeof(desc));
                           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:527:4: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                           memset(&desc, 0, sizeof(desc));
                           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:674:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:674:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:1122:2: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0; /* ucsi_send_command() returns length on success */
           ^     ~
   drivers/usb/typec/ucsi/ucsi.c:1122:2: note: Value stored to 'ret' is nev=
er read
           ret =3D 0; /* ucsi_send_command() returns length on success */
           ^     ~
   drivers/usb/typec/ucsi/ucsi.c:1263:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ucsi->cap, 0, sizeof(ucsi->cap));
           ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c:1263:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&ucsi->cap, 0, sizeof(ucsi->cap));
           ^~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/gpu/drm/drm_atomic_uapi.c:93:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&state->mode, 0, sizeof(state->mode));
                   ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:93:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(&state->mode, 0, sizeof(state->mode));
                   ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:128:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&state->mode, 0, sizeof(state->mode));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:128:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&state->mode, 0, sizeof(state->mode));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1197:4: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&f[*num_fences], 0, sizeof(*f));
                           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1197:4: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                           memset(&f[*num_fences], 0, sizeof(*f));
                           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1236:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&f[*num_fences], 0, sizeof(*f));
                   ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1236:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&f[*num_fences], 0, sizeof(*f));
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/hid/hid-wiimote-core.c:95:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(wdata->queue.outq[wdata->queue.head].data, buffer, count);
           ^~~~~~
   drivers/hid/hid-wiimote-core.c:95:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(wdata->queue.outq[wdata->queue.head].data, buffer, count);
--
                   return sprintf(buf, "procontroller\n");
                          ^~~~~~~
   drivers/hid/hid-wiimote-core.c:1718:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "procontroller\n");
                          ^~~~~~~
   drivers/hid/hid-wiimote-core.c:1720:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "pending\n");
                          ^~~~~~~
   drivers/hid/hid-wiimote-core.c:1720:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "pending\n");
                          ^~~~~~~
   drivers/hid/hid-wiimote-core.c:1723:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   drivers/hid/hid-wiimote-core.c:1723:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: warning: The resu=
lt of the left shift is undefined because the left operand is negative [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Assuming fi=
eld 'crtc' is non-null
           if (!new_s->crtc || !new_s->fb)
               ^~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:22: note: Assuming f=
ield 'fb' is non-null
           if (!new_s->crtc || !new_s->fb)
                               ^~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:2: note: Taking fals=
e branch
           if (!new_s->crtc || !new_s->fb)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:746:6: note: Assuming fi=
eld 'visible' is true
           if (!hstate->base.visible) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:746:2: note: Taking fals=
e branch
           if (!hstate->base.visible) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:756:2: note: Calling 'at=
mel_hlcdc_plane_update_disc_area'
           atmel_hlcdc_plane_update_disc_area(plane, hstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Assuming fi=
eld 'disc_pos' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:27: note: Assuming f=
ield 'disc_size' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
                                    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:2: note: Taking fals=
e branch
           if (!layout->disc_pos || !layout->disc_size)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: note: The result =
of the left shift is undefined because the left operand is negative
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                 ~~~~~~~~~ ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:819:39: warning: Value s=
tored to 'desc' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:819:39: note: Value stor=
ed to 'desc' during its initialization is never read
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/firmware/arm_scmi/driver.c:1795:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D idr_for_each(idr, info->desc->ops->chan_free, idr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:1795:2: note: Value stored to 'ret' i=
s never read
           ret =3D idr_for_each(idr, info->desc->ops->chan_free, idr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:1951:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u.%u\n", info->version.major_ver,
                  ^~~~~~~
   drivers/firmware/arm_scmi/driver.c:1951:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u.%u\n", info->version.major_ver,
                  ^~~~~~~
   drivers/firmware/arm_scmi/driver.c:1961:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%x\n", info->version.impl_ver);
                  ^~~~~~~
   drivers/firmware/arm_scmi/driver.c:1961:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%x\n", info->version.impl_ver);
                  ^~~~~~~
>> drivers/firmware/arm_scmi/driver.c:1970:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", info->version.vendor_id);
                  ^~~~~~~
   drivers/firmware/arm_scmi/driver.c:1970:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", info->version.vendor_id);
                  ^~~~~~~
   drivers/firmware/arm_scmi/driver.c:1979:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", info->version.sub_vendor_id);
                  ^~~~~~~
   drivers/firmware/arm_scmi/driver.c:1979:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", info->version.sub_vendor_id);
                  ^~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (98 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   120 warnings generated.
   net/ipv4/route.c:879:2: warning: Value stored to 'log_martians' is never=
 read [clang-analyzer-deadcode.DeadStores]
           log_martians =3D IN_DEV_LOG_MARTIANS(in_dev);
           ^
   net/ipv4/route.c:879:2: note: Value stored to 'log_martians' is never re=
ad
   net/ipv4/route.c:1213:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&opt, 0, sizeof(opt));
           ^~~~~~
   net/ipv4/route.c:1213:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&opt, 0, sizeof(opt));
           ^~~~~~
   net/ipv4/route.c:1286:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, &src, 4);
           ^~~~~~
   net/ipv4/route.c:1286:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(addr, &src, 4);
           ^~~~~~
   net/ipv4/route.c:1910:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hash_keys, 0, sizeof(hash_keys));
           ^~~~~~
   net/ipv4/route.c:1910:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&hash_keys, 0, sizeof(hash_keys));
           ^~~~~~
   net/ipv4/route.c:1946:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hash_keys, 0, sizeof(hash_keys));
           ^~~~~~
   net/ipv4/route.c:1946:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&hash_keys, 0, sizeof(hash_keys));
           ^~~~~~
   net/ipv4/route.c:1999:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hash_keys, 0, sizeof(hash_keys));
           ^~~~~~
   net/ipv4/route.c:1999:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&hash_keys, 0, sizeof(hash_keys));
           ^~~~~~
   net/ipv4/route.c:2025:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&hash_keys, 0, sizeof(hash_keys));
                   ^~~~~~
   net/ipv4/route.c:2025:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&hash_keys, 0, sizeof(hash_keys));
                   ^~~~~~
   net/ipv4/route.c:2045:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&hash_keys, 0, sizeof(hash_keys));
                           ^~~~~~
   net/ipv4/route.c:2045:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(&hash_keys, 0, sizeof(hash_keys));
                           ^~~~~~
   net/ipv4/route.c:2059:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&hash_keys, 0, sizeof(hash_keys));
                           ^~~~~~
   net/ipv4/route.c:2059:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(&hash_keys, 0, sizeof(hash_keys));
                           ^~~~~~
   net/ipv4/route.c:2070:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&hash_keys, 0, sizeof(hash_keys));
                   ^~~~~~
   net/ipv4/route.c:2070:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&hash_keys, 0, sizeof(hash_keys));
                   ^~~~~~
   net/ipv4/route.c:2889:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fl4, 0, sizeof(fl4));
           ^~~~~~
   net/ipv4/route.c:2889:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&fl4, 0, sizeof(fl4));
           ^~~~~~
   net/ipv4/route.c:2987:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(via->rtvia_addr, &rt->rt_gw6, alen);
                           ^~~~~~
   net/ipv4/route.c:2987:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(via->rtvia_addr, &rt->rt_gw6, alen);
                           ^~~~~~
   net/ipv4/route.c:3001:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(metrics, dst_metrics_ptr(&rt->dst), sizeof(metrics));
           ^~~~~~
   net/ipv4/route.c:3001:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(metrics, dst_metrics_ptr(&rt->dst), sizeof(metrics));
           ^~~~~~
   Suppressed 107 warnings (105 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/char/ipmi/ipmi_si_intf.c:604:4: warning: Access to field 'rsp_si=
ze' results in a dereference of a null pointer (loaded from field 'curr_msg=
') [clang-analyzer-core.NullDereference]
--
           ^
   drivers/power/supply/bq25980_charger.c:572:3: note: Returning without wr=
iting to 'state->dischg'
                   return ret;
                   ^
   drivers/power/supply/bq25980_charger.c:837:8: note: Returning from 'bq25=
980_get_state'
           ret =3D bq25980_get_state(bq, &state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:838:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/power/supply/bq25980_charger.c:838:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/power/supply/bq25980_charger.c:841:7: note: Calling 'bq25980_sta=
te_changed'
           if (!bq25980_state_changed(bq, &state))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:820:27: note: The right operand o=
f '!=3D' is a garbage value
           return (old_state.dischg !=3D new_state->dischg ||
                                    ^  ~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:1226:2: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(bq->model_name, id->name, I2C_NAME_SIZE);
           ^~~~~~~
   drivers/power/supply/bq25980_charger.c:1226:2: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(bq->model_name, id->name, I2C_NAME_SIZE);
           ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/usb/core/file.c:160:6: warning: Value stored to 'minor_base' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/file.c:160:6: note: Value stored to 'minor_base' during=
 its initialization is never read
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/file.c:202:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), class_driver->name, minor - minor_b=
ase);
           ^~~~~~~~
   drivers/usb/core/file.c:202:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), class_driver->name, minor - minor_b=
ase);
           ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/usb/core/buffer.c:77:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "buffer-%d", size);
                   ^~~~~~~~
   drivers/usb/core/buffer.c:77:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "buffer-%d", size);
                   ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   drivers/usb/core/sysfs.c:48:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_actconfig_attr(bNumInterfaces, "%2d\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:48:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   usb_actconfig_attr(bNumInterfaces, "%2d\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:49:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_actconfig_attr(bmAttributes, "%2x\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:49:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   usb_actconfig_attr(bmAttributes, "%2x\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:64:8: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rc =3D sprintf(buf, "%dmA\n", usb_get_max_power(udev, ac=
tconfig));
                        ^~~~~~~
   drivers/usb/core/sysfs.c:64:8: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   rc =3D sprintf(buf, "%dmA\n", usb_get_max_power(udev, ac=
tconfig));
                        ^~~~~~~
>> drivers/usb/core/sysfs.c:83:8: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   rc =3D sprintf(buf, "%s\n", actconfig->string);
                        ^~~~~~~
   drivers/usb/core/sysfs.c:83:8: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   rc =3D sprintf(buf, "%s\n", actconfig->string);
                        ^~~~~~~
   drivers/usb/core/sysfs.c:90:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_actconfig_show(bConfigurationValue, "%u\n");
   ^
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:90:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   usb_actconfig_show(bConfigurationValue, "%u\n");
   ^
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:99:6: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%d", &config) !=3D 1 || config < -1 || config >=
 255)
               ^~~~~~
   drivers/usb/core/sysfs.c:99:6: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%d", &config) !=3D 1 || config < -1 || config >=
 255)
               ^~~~~~
   drivers/usb/core/sysfs.c:117:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%pOF\n", of_node);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:117:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%pOF\n", of_node);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:140:1: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
   usb_string_attr(product);
   ^
   drivers/usb/core/sysfs.c:134:11: note: expanded from macro 'usb_string_a=
ttr'
           retval =3D sprintf(buf, "%s\n", udev->name);                    =
  \
                    ^~~~~~~
   drivers/usb/core/sysfs.c:140:1: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
   usb_string_attr(product);
   ^
   drivers/usb/core/sysfs.c:134:11: note: expanded from macro 'usb_string_a=
ttr'
           retval =3D sprintf(buf, "%s\n", udev->name);                    =
  \
                    ^~~~~~~
   drivers/usb/core/sysfs.c:141:1: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
   usb_string_attr(manufacturer);
   ^
   drivers/usb/core/sysfs.c:134:11: note: expanded from macro 'usb_string_a=
ttr'
           retval =3D sprintf(buf, "%s\n", udev->name);                    =
  \
                    ^~~~~~~
   drivers/usb/core/sysfs.c:141:1: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
   usb_string_attr(manufacturer);
   ^
   drivers/usb/core/sysfs.c:134:11: note: expanded from macro 'usb_string_a=
ttr'
           retval =3D sprintf(buf, "%s\n", udev->name);                    =
  \
                    ^~~~~~~
   drivers/usb/core/sysfs.c:142:1: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
   usb_string_attr(serial);
   ^
   drivers/usb/core/sysfs.c:134:11: note: expanded from macro 'usb_string_a=
ttr'
           retval =3D sprintf(buf, "%s\n", udev->name);                    =
  \
                    ^~~~~~~
   drivers/usb/core/sysfs.c:142:1: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
   usb_string_attr(serial);
   ^
   drivers/usb/core/sysfs.c:134:11: note: expanded from macro 'usb_string_a=
ttr'
           retval =3D sprintf(buf, "%s\n", udev->name);                    =
  \
                    ^~~~~~~
   drivers/usb/core/sysfs.c:178:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", speed);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:178:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", speed);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:188:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", udev->rx_lanes);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:188:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", udev->rx_lanes);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:198:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", udev->tx_lanes);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:198:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", udev->tx_lanes);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:208:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", udev->bus->busnum);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:208:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", udev->bus->busnum);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:218:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", udev->devnum);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:218:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", udev->devnum);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:228:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", udev->devpath);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:228:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", udev->devpath);
--
                       ^~~~~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:250:3: note: Taking =
true branch
                   if (rctx->biv) {
                   ^
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:252:8: note: Assumin=
g the condition is true
                           if (rctx->op_dir & SS_DECRYPTION) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:252:4: note: Taking =
true branch
                           if (rctx->op_dir & SS_DECRYPTION) {
                           ^
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:253:5: note: Null po=
inter passed as 2nd argument to memory copy function
                                   memcpy(areq->iv, backup_iv, ivsize);
                                   ^                ~~~~~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:290:2: warning: Call=
 to function 'memset' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memset_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx, 0, sizeof(struct sun8i_cipher_req_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:290:2: note: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rctx, 0, sizeof(struct sun8i_cipher_req_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:311:2: warning: Call=
 to function 'memset' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memset_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx, 0, sizeof(struct sun8i_cipher_req_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:311:2: note: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rctx, 0, sizeof(struct sun8i_cipher_req_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:333:2: warning: Call=
 to function 'memset' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memset_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(op, 0, sizeof(struct sun8i_cipher_tfm_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:333:2: note: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(op, 0, sizeof(struct sun8i_cipher_tfm_ctx));
           ^~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:382:23: warning: Val=
ue stored to 'ss' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct sun8i_ss_dev *ss =3D op->ss;
                                ^~   ~~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:382:23: note: Value =
stored to 'ss' during its initialization is never read
           struct sun8i_ss_dev *ss =3D op->ss;
                                ^~   ~~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:411:23: warning: Val=
ue stored to 'ss' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct sun8i_ss_dev *ss =3D op->ss;
                                ^~   ~~~~~~
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:411:23: note: Value =
stored to 'ss' during its initialization is never read
           struct sun8i_ss_dev *ss =3D op->ss;
                                ^~   ~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/usb/core/endpoint.c:46:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_ep_attr(bLength, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:46:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   usb_ep_attr(bLength, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:47:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_ep_attr(bEndpointAddress, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:47:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   usb_ep_attr(bEndpointAddress, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:48:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_ep_attr(bmAttributes, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:48:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   usb_ep_attr(bmAttributes, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:49:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_ep_attr(bInterval, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:49:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   usb_ep_attr(bInterval, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:55:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%04x\n", usb_endpoint_maxp(ep->desc));
                  ^~~~~~~
   drivers/usb/core/endpoint.c:55:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%04x\n", usb_endpoint_maxp(ep->desc));
                  ^~~~~~~
>> drivers/usb/core/endpoint.c:79:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", type);
                  ^~~~~~~
   drivers/usb/core/endpoint.c:79:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", type);
                  ^~~~~~~
   drivers/usb/core/endpoint.c:98:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d%cs\n", interval, unit);
                  ^~~~~~~
   drivers/usb/core/endpoint.c:98:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d%cs\n", interval, unit);
                  ^~~~~~~
   drivers/usb/core/endpoint.c:114:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", direction);
                  ^~~~~~~
   drivers/usb/core/endpoint.c:114:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", direction);
                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/hid/hid-gt683r.c:265:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, name_sz, "%s::%s",
                   ^~~~~~~~
   drivers/hid/hid-gt683r.c:265:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, name_sz, "%s::%s",
                   ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
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
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/hid/hid-picolcd_backlight.c:66:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(props));
           ^~~~~~
   drivers/hid/hid-picolcd_backlight.c:66:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(props));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   138 warnings generated.
   drivers/hid/hid-picolcd_debugfs.c:124:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(raw_data, 0, sizeof(raw_data));
           ^~~~~~
   drivers/hid/hid-picolcd_debugfs.c:124:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(raw_data, 0, sizeof(raw_data));
           ^~~~~~
   drivers/hid/hid-picolcd_debugfs.c:406:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buff, BUFF_SZ, "\nout report %d (size %d) =3D  ",
           ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:406:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buff, BUFF_SZ, "\nout report %d (size %d) =3D  ",
           ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:417:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "out report %s (%d, size=3D%d)\n=
",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:417:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "out report %s (%d, size=3D%d)\n=
",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:420:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tGPO state: 0x%02x\n", raw_dat=
a[1]);
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:420:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tGPO state: 0x%02x\n", raw_dat=
a[1]);
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:425:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "out report %s (%d, size=3D%d)\n=
",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:425:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "out report %s (%d, size=3D%d)\n=
",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:428:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tBrightness: 0x%02x\n", raw_da=
ta[1]);
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:428:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tBrightness: 0x%02x\n", raw_da=
ta[1]);
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:433:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "out report %s (%d, size=3D%d)\n=
",
--
                  ^~~~~~~
   drivers/cpufreq/cpufreq_ondemand.c:320:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   gov_show_one_common(ignore_nice_load);
   ^
   drivers/cpufreq/cpufreq_governor.h:67:9: note: expanded from macro 'gov_=
show_one_common'
           return sprintf(buf, "%u\n", dbs_data->file_name);               \
                  ^~~~~~~
   drivers/cpufreq/cpufreq_ondemand.c:320:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   gov_show_one_common(ignore_nice_load);
   ^
   drivers/cpufreq/cpufreq_governor.h:67:9: note: expanded from macro 'gov_=
show_one_common'
           return sprintf(buf, "%u\n", dbs_data->file_name);               \
                  ^~~~~~~
   drivers/cpufreq/cpufreq_ondemand.c:321:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   gov_show_one_common(io_is_busy);
   ^
   drivers/cpufreq/cpufreq_governor.h:67:9: note: expanded from macro 'gov_=
show_one_common'
           return sprintf(buf, "%u\n", dbs_data->file_name);               \
                  ^~~~~~~
   drivers/cpufreq/cpufreq_ondemand.c:321:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   gov_show_one_common(io_is_busy);
   ^
   drivers/cpufreq/cpufreq_governor.h:67:9: note: expanded from macro 'gov_=
show_one_common'
           return sprintf(buf, "%u\n", dbs_data->file_name);               \
                  ^~~~~~~
   drivers/cpufreq/cpufreq_ondemand.c:322:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   gov_show_one(od, powersave_bias);
   ^
   drivers/cpufreq/cpufreq_governor.h:59:9: note: expanded from macro 'gov_=
show_one'
           return sprintf(buf, "%u\n", tuners->file_name);                 \
                  ^~~~~~~
   drivers/cpufreq/cpufreq_ondemand.c:322:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   gov_show_one(od, powersave_bias);
   ^
   drivers/cpufreq/cpufreq_governor.h:59:9: note: expanded from macro 'gov_=
show_one'
           return sprintf(buf, "%u\n", tuners->file_name);                 \
                  ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   net/sched/sch_frag.c:43:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb->data, &data->l2_data, data->l2_len);
           ^~~~~~
   net/sched/sch_frag.c:43:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(skb->data, &data->l2_data, data->l2_len);
           ^~~~~~
   net/sched/sch_frag.c:67:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&data->l2_data, skb->data, hlen);
           ^~~~~~
   net/sched/sch_frag.c:67:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&data->l2_data, skb->data, hlen);
           ^~~~~~
   net/sched/sch_frag.c:69:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(IPCB(skb), 0, sizeof(struct inet_skb_parm));
           ^~~~~~
   net/sched/sch_frag.c:69:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(IPCB(skb), 0, sizeof(struct inet_skb_parm));
           ^~~~~~
   net/sched/sch_frag.c:114:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&sch_frag_rt, 0, sizeof(sch_frag_rt));
                   ^~~~~~
   net/sched/sch_frag.c:114:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&sch_frag_rt, 0, sizeof(sch_frag_rt));
                   ^~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/auxdisplay/line-display.c:91:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(linedisp->buf, ' ', linedisp->num_chars);
                   ^~~~~~
   drivers/auxdisplay/line-display.c:91:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(linedisp->buf, ' ', linedisp->num_chars);
                   ^~~~~~
   drivers/auxdisplay/line-display.c:212:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(linedisp, 0, sizeof(*linedisp));
           ^~~~~~
   drivers/auxdisplay/line-display.c:212:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(linedisp, 0, sizeof(*linedisp));
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/usb/common/ulpi.c:112:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "ulpi:v%04xp%04x\n",
                  ^~~~~~~
   drivers/usb/common/ulpi.c:112:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "ulpi:v%04xp%04x\n",
                  ^~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   107 warnings generated.
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
   Suppressed 101 warnings (97 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/iio/adc/hx711.c:365:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
           ^~~~~~
   drivers/iio/adc/hx711.c:365:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
           ^~~~~~
   drivers/iio/adc/hx711.c:396:11: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "0.%09d ",
                                  ^~~~~~~
   drivers/iio/adc/hx711.c:396:11: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "0.%09d ",
                                  ^~~~~~~
   drivers/iio/adc/hx711.c:399:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/adc/hx711.c:399:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/adc/hx711.c:536:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/hx711.c:536:2: note: Value stored to 'ret' is never read
           ret =3D of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/input/touchscreen/zforce_ts.c:229:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:229:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:242:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:242:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:257:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:257:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:460:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:460:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D ts->client;
                              ^~~~~~   ~~~~~~~~~~
   drivers/input/touchscreen/zforce_ts.c:827:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ts->phys, sizeof(ts->phys),
--
           memset(&whdr, 0, sizeof(whdr));
           ^~~~~~
   net/rxrpc/rxkad.c:813:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&whdr, 0, sizeof(whdr));
           ^~~~~~
   net/rxrpc/rxkad.c:877:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&iv, s2->session_key, sizeof(iv));
           ^~~~~~
   net/rxrpc/rxkad.c:877:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(&iv, s2->session_key, sizeof(iv));
           ^~~~~~
   net/rxrpc/rxkad.c:1006:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&iv, &server_key->payload.data[2], sizeof(iv));
           ^~~~~~
   net/rxrpc/rxkad.c:1006:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(&iv, &server_key->payload.data[2], sizeof(iv));
           ^~~~~~
   net/rxrpc/rxkad.c:1042:2: warning: Value stored to 'name' is never read =
[clang-analyzer-deadcode.DeadStores]
           name =3D Z(ANAME);
           ^
   net/rxrpc/rxkad.c:1042:2: note: Value stored to 'name' is never read
   net/rxrpc/rxkad.c:1046:2: warning: Value stored to 'name' is never read =
[clang-analyzer-deadcode.DeadStores]
           name =3D Z(INST);
           ^
   net/rxrpc/rxkad.c:1046:2: note: Value stored to 'name' is never read
   net/rxrpc/rxkad.c:1050:2: warning: Value stored to 'name' is never read =
[clang-analyzer-deadcode.DeadStores]
           name =3D Z(REALM);
           ^
   net/rxrpc/rxkad.c:1050:2: note: Value stored to 'name' is never read
   net/rxrpc/rxkad.c:1058:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&addr, p, sizeof(addr));
           ^~~~~~
   net/rxrpc/rxkad.c:1058:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(&addr, p, sizeof(addr));
           ^~~~~~
   net/rxrpc/rxkad.c:1063:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&key, p, sizeof(key));
           ^~~~~~
   net/rxrpc/rxkad.c:1063:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(&key, p, sizeof(key));
           ^~~~~~
   net/rxrpc/rxkad.c:1066:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(_session_key, &key, sizeof(key));
           ^~~~~~
   net/rxrpc/rxkad.c:1066:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(_session_key, &key, sizeof(key));
           ^~~~~~
   net/rxrpc/rxkad.c:1075:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&stamp, p, 4);
                   ^~~~~~
   net/rxrpc/rxkad.c:1075:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&stamp, p, 4);
                   ^~~~~~
   net/rxrpc/rxkad.c:1079:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&stamp, p, 4);
                   ^~~~~~
   net/rxrpc/rxkad.c:1079:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&stamp, p, 4);
                   ^~~~~~
   net/rxrpc/rxkad.c:1102:2: warning: Value stored to 'name' is never read =
[clang-analyzer-deadcode.DeadStores]
           name =3D Z(SNAME);
           ^
   net/rxrpc/rxkad.c:1102:2: note: Value stored to 'name' is never read
   net/rxrpc/rxkad.c:1106:2: warning: Value stored to 'name' is never read =
[clang-analyzer-deadcode.DeadStores]
           name =3D Z(INST);
           ^
   net/rxrpc/rxkad.c:1106:2: note: Value stored to 'name' is never read
   net/rxrpc/rxkad.c:1140:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&iv, session_key, sizeof(iv));
           ^~~~~~
   net/rxrpc/rxkad.c:1140:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(&iv, session_key, sizeof(iv));
           ^~~~~~
   Suppressed 84 warnings (82 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
>> drivers/iio/position/hid-sensor-custom-intel-hinge.c:179:9: warning: Cal=
l to function 'sprintf' is insecure as it does not provide bounding of the =
memory buffer or security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(label, "%s\n", st->labels[chan->channel]);
                  ^~~~~~~
   drivers/iio/position/hid-sensor-custom-intel-hinge.c:179:9: note: Call t=
o function 'sprintf' is insecure as it does not provide bounding of the mem=
ory buffer or security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'sprintf_s' in case of C11
           return sprintf(label, "%s\n", st->labels[chan->channel]);
                  ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/usb/dwc3/dwc3-qcom.c:694:8: warning: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(fwnode_get_name(dev->fwnode), "URS%d", &id);
                 ^~~~~~
   drivers/usb/dwc3/dwc3-qcom.c:694:8: note: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(fwnode_get_name(dev->fwnode), "URS%d", &id);
                 ^~~~~~
   drivers/usb/dwc3/dwc3-qcom.c:699:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "USB%d", id);
           ^~~~~~~~
   drivers/usb/dwc3/dwc3-qcom.c:699:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "USB%d", id);
           ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/usb/host/ohci-hcd.c:184:6: warning: Division by zero [clang-anal=
yzer-core.DivideZero]
                                           % usb_maxpacket (urb->dev, pipe,
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ohci-hcd.c:161:7: note: Calling 'ed_get'
           ed =3D ed_get(ohci, urb->ep, urb->dev, pipe, urb->interval);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ohci-q.c:410:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave (&ohci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/usb/host/ohci-q.c:410:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave (&ohci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/usb/host/ohci-q.c:410:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave (&ohci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
--
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:530:1: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
   coresight_cti_reg(ittrigin, ITTRIGIN);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:531:1: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   coresight_cti_reg(itchin, ITCHIN);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:531:1: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
   coresight_cti_reg(itchin, ITCHIN);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:532:1: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   coresight_cti_reg(itchoutack, ITCHOUTACK);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:532:1: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
   coresight_cti_reg(itchoutack, ITCHOUTACK);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:533:1: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   coresight_cti_reg(ittrigoutack, ITTRIGOUTACK);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:533:1: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
   coresight_cti_reg(ittrigoutack, ITTRIGOUTACK);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:575:10: warning: Call =
to function 'sscanf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sscanf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           items =3D sscanf(buf, "%d %d", &chan_idx, &trig_idx);
                   ^~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:575:10: note: Call to =
function 'sscanf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sscanf_s' in case of C11
           items =3D sscanf(buf, "%d %d", &chan_idx, &trig_idx);
                   ^~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:644:10: warning: Call =
to function 'sprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size =3D sprintf(buf, "\n");
                          ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:644:10: note: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
                   size =3D sprintf(buf, "\n");
                          ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:719:9: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:719:9: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:820:9: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:820:9: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:836:12: warning: Call =
to function 'sprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           used +=3D sprintf(buf + used, "%d ", reg_idx);
                                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:836:12: note: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
                           used +=3D sprintf(buf + used, "%d ", reg_idx);
                                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:839:10: warning: Call =
to function 'sprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:839:10: note: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:856:12: warning: Call =
to function 'sprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           used +=3D sprintf(buf + used, "%d ", reg_idx);
                                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:856:12: note: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
                           used +=3D sprintf(buf + used, "%d ", reg_idx);
                                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:859:10: warning: Call =
to function 'sprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:859:10: note: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:890:10: warning: Call =
to function 'sprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size =3D sprintf(buf, "\n");
                          ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:890:10: note: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
                   size =3D sprintf(buf, "\n");
                          ^~~~~~~
>> drivers/hwtracing/coresight/coresight-cti-sysfs.c:949:9: warning: Call t=
o function 'sprintf' is insecure as it does not provide bounding of the mem=
ory buffer or security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", con->con_dev_name);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:949:9: note: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", con->con_dev_name);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1004:11: warning: Call=
 to function 'sprintf' is insecure as it does not provide bounding of the m=
emory buffer or security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   used +=3D sprintf(buf + used, "%s ", name);
                           ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1004:11: note: Call to=
 function 'sprintf' is insecure as it does not provide bounding of the memo=
ry buffer or security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'sprintf_s' in case of C11
                   used +=3D sprintf(buf + used, "%s ", name);
                           ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1006:10: warning: Call=
 to function 'sprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1006:10: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1022:11: warning: Call=
 to function 'sprintf' is insecure as it does not provide bounding of the m=
emory buffer or security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   used +=3D sprintf(buf + used, "%s ", name);
                           ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1022:11: note: Call to=
 function 'sprintf' is insecure as it does not provide bounding of the memo=
ry buffer or security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'sprintf_s' in case of C11
                   used +=3D sprintf(buf + used, "%s ", name);
                           ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1024:10: warning: Call=
 to function 'sprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:1024:10: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           used +=3D sprintf(buf + used, "\n");
                   ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti.h:238:9: warning: Access to fi=
eld 'hw_powered' results in a dereference of a null pointer (loaded from va=
riable 'cfg') [clang-analyzer-core.NullDereference]
           return cfg->hw_powered && cfg->hw_enabled;
                  ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:410:1: note: Calling '=
cti_reg32_store'
   cti_config_reg32_rw(appset, ctiappset, CTIAPPSET);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:281:9: note: expanded =
from macro 'cti_config_reg32_rw'
           return cti_reg32_store(dev, buf, size,                          \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:247:2: note: 'drvdata'=
 initialized here
           struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:248:2: note: 'config' =
initialized here
           struct cti_config *config =3D &drvdata->config;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:250:6: note: Calling '=
kstrtoul'
           if (kstrtoul(buf, 0, &val))
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kstrtox.h:36:58: note: Left side of '&&' is false
           if (sizeof(unsigned long) =3D=3D sizeof(unsigned long long) &&
                                                                   ^
   include/linux/kstrtox.h:40:3: note: Returning value, which participates =
in a condition later
                   return _kstrtoul(s, base, res);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:250:6: note: Returning=
 from 'kstrtoul'
           if (kstrtoul(buf, 0, &val))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:250:6: note: Assuming =
the condition is false
           if (kstrtoul(buf, 0, &val))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:250:2: note: Taking fa=
lse branch
           if (kstrtoul(buf, 0, &val))
           ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:255:6: note: Assuming =
'pcached_val' is null
           if (pcached_val)
               ^~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:255:6: note: Assuming =
pointer value is null
           if (pcached_val)
               ^~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:255:2: note: Taking fa=
lse branch
           if (pcached_val)
           ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:7: note: 'reg_offs=
et' is >=3D 0
           if ((reg_offset >=3D 0) && cti_active(config))
                ^~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:6: note: Left side=
 of '&&' is true
           if ((reg_offset >=3D 0) && cti_active(config))
               ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:38: note: Passing =
value via 1st parameter 'cfg'
           if ((reg_offset >=3D 0) && cti_active(config))
                                               ^~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:259:27: note: Calling =
'cti_active'
           if ((reg_offset >=3D 0) && cti_active(config))
                                    ^~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti.h:238:9: note: Access to field=
 'hw_powered' results in a dereference of a null pointer (loaded from varia=
ble 'cfg')
           return cfg->hw_powered && cfg->hw_enabled;
                  ^~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D pcf_doAddress(adap, pmsg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: note: Value stored to 'ret' is n=
ever read
                   ret =3D pcf_doAddress(adap, pmsg);
--
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/hid/hid-elan.c:290:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(drvdata->prev_report, data,
                   ^~~~~~
   drivers/hid/hid-elan.c:290:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(drvdata->prev_report, data,
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/crypto/virtio/virtio_crypto_algs.c:440:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, req->iv, ivsize);
           ^~~~~~
   drivers/crypto/virtio/virtio_crypto_algs.c:440:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv, req->iv, ivsize);
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/crypto/virtio/virtio_crypto_core.c:82:3: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(vi->data_vq[i].name, sizeof(vi->data_vq[i].name=
),
                   ^~~~~~~~
   drivers/crypto/virtio/virtio_crypto_core.c:82:3: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vi->data_vq[i].name, sizeof(vi->data_vq[i].name=
),
                   ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/input/input-poller.c:143:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", input->poller->poll_interval);
                  ^~~~~~~
   drivers/input/input-poller.c:143:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", input->poller->poll_interval);
                  ^~~~~~~
   drivers/input/input-poller.c:188:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", input->poller->poll_interval_max);
                  ^~~~~~~
   drivers/input/input-poller.c:188:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", input->poller->poll_interval_max);
                  ^~~~~~~
   drivers/input/input-poller.c:198:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", input->poller->poll_interval_min);
                  ^~~~~~~
   drivers/input/input-poller.c:198:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", input->poller->poll_interval_min);
                  ^~~~~~~
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
   85 warnings generated.
   drivers/usb/atm/usbatm.c:332:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_tail_pointer(sarb), source + ATM_CELL_HEADER, ATM_CEL=
L_PAYLOAD);
           ^~~~~~
   drivers/usb/atm/usbatm.c:332:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_tail_pointer(sarb), source + ATM_CELL_HEADER, ATM_CEL=
L_PAYLOAD);
           ^~~~~~
   drivers/usb/atm/usbatm.c:425:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(cell_buf + buf_usage, source, space_left);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:425:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(cell_buf + buf_usage, source, space_left);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:432:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(cell_buf + buf_usage, source, avail_data);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:432:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(cell_buf + buf_usage, source, avail_data);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:444:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(instance->cell_buf, source, avail_data);
                   ^~~~~~
   drivers/usb/atm/usbatm.c:444:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(instance->cell_buf, source, avail_data);
                   ^~~~~~
   drivers/usb/atm/usbatm.c:483:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ptr, 0, left);
                   ^~~~~~
   drivers/usb/atm/usbatm.c:483:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(ptr, 0, left);
                   ^~~~~~
>> drivers/usb/atm/usbatm.c:739:10: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
                   return sprintf(page, "%s\n", instance->description);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:739:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
                   return sprintf(page, "%s\n", instance->description);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:742:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "MAC: %pM\n", atm_dev->esi);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:742:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "MAC: %pM\n", atm_dev->esi);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:745:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page,
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:745:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(page,
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:755:11: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(page, "Disconnected\n");
                                  ^~~~~~~
   drivers/usb/atm/usbatm.c:755:11: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                           return sprintf(page, "Disconnected\n");
                                  ^~~~~~~
   drivers/usb/atm/usbatm.c:759:12: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   return sprintf(page, "Line up\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:759:12: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                                   return sprintf(page, "Line up\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:761:12: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   return sprintf(page, "Line down\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:761:12: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                                   return sprintf(page, "Line down\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:763:12: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   return sprintf(page, "Line state unknown=
\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:763:12: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                                   return sprintf(page, "Line state unknown=
\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:1054:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, length, ")");
           ^~~~~~~~
   drivers/usb/atm/usbatm.c:1054:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, length, ")");
           ^~~~~~~~
   drivers/usb/atm/usbatm.c:1112:26: warning: Value stored to 'channel' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct usbatm_channel *channel =3D i ?
                                          ^~~~~~~   ~~~
   drivers/usb/atm/usbatm.c:1112:26: note: Value stored to 'channel' during=
 its initialization is never read
                   struct usbatm_channel *channel =3D i ?
                                          ^~~~~~~   ~~~
   drivers/usb/atm/usbatm.c:1208:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &intf->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/atm/usbatm.c:1208:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D &intf->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   net/batman-adv/routing.c:662:17: warning: Value stored to 'ethhdr' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ethhdr *ethhdr =3D eth_hdr(skb);
                          ^~~~~~   ~~~~~~~~~~~~
   net/batman-adv/routing.c:662:17: note: Value stored to 'ethhdr' during i=
ts initialization is never read
           struct ethhdr *ethhdr =3D eth_hdr(skb);
                          ^~~~~~   ~~~~~~~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   net/nfc/hci/command.c:161:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tmp + 1, param, param_len);
           ^~~~~~
   net/nfc/hci/command.c:161:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(tmp + 1, param, param_len);
           ^~~~~~
   net/nfc/hci/command.c:228:40: warning: Access to field 'data' results in=
 a dereference of an undefined pointer value (loaded from variable 'skb') [=
clang-analyzer-core.NullDereference]
           resp =3D (struct hci_create_pipe_resp *)skb->data;
                                                 ^
   net/nfc/hci/command.c:303:6: note: Assuming 'pipe' is not equal to NFC_H=
CI_DO_NOT_CREATE_PIPE
           if (pipe =3D=3D NFC_HCI_DO_NOT_CREATE_PIPE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/hci/command.c:303:2: note: Taking false branch
           if (pipe =3D=3D NFC_HCI_DO_NOT_CREATE_PIPE)
           ^
   net/nfc/hci/command.c:306:6: note: Assuming the condition is false
           if (hdev->gate2pipe[dest_gate] !=3D NFC_HCI_INVALID_PIPE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/hci/command.c:306:2: note: Taking false branch
           if (hdev->gate2pipe[dest_gate] !=3D NFC_HCI_INVALID_PIPE)
           ^
   net/nfc/hci/command.c:309:6: note: Assuming 'pipe' is equal to NFC_HCI_I=
NVALID_PIPE
           if (pipe !=3D NFC_HCI_INVALID_PIPE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/hci/command.c:309:2: note: Taking false branch
           if (pipe !=3D NFC_HCI_INVALID_PIPE)
           ^
   net/nfc/hci/command.c:312:2: note: Control jumps to the 'default' case a=
t line 319
           switch (dest_gate) {
--
           ^
   drivers/bcma/driver_mips.c:157:2: note: Calling 'bcma_core_mips_set_irq'
           bcma_core_mips_set_irq(core, irq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:102:2: note: Taking false branch
           BUG_ON(oldirq =3D=3D 6);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/bcma/driver_mips.c:102:2: note: Loop condition is false.  Exitin=
g loop
           BUG_ON(oldirq =3D=3D 6);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/bcma/driver_mips.c:107:6: note: 'oldirq' is equal to 0
           if (oldirq =3D=3D 0)
               ^~~~~~
   drivers/bcma/driver_mips.c:107:2: note: Taking true branch
           if (oldirq =3D=3D 0)
           ^
   drivers/bcma/driver_mips.c:115:6: note: 'irq' is not equal to 0
           if (irq =3D=3D 0) {
               ^~~
   drivers/bcma/driver_mips.c:115:2: note: Taking false branch
           if (irq =3D=3D 0) {
           ^
   drivers/bcma/driver_mips.c:122:7: note: Assuming 'irqinitmask' is not eq=
ual to 0
                   if (irqinitmask) {
                       ^~~~~~~~~~~
   drivers/bcma/driver_mips.c:122:3: note: Taking true branch
                   if (irqinitmask) {
                   ^
   drivers/bcma/driver_mips.c:128:4: note: Loop condition is true.  Enterin=
g loop body
                           list_for_each_entry(core, &bus->cores, list) {
                           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/bcma/driver_mips.c:129:15: note: Calling 'bcma_core_mips_irqflag'
                                   if ((1 << bcma_core_mips_irqflag(core)) =
=3D=3D
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:59:6: note: Calling 'bcma_core_mips_bcm47162a=
0_quirk'
           if (bcma_core_mips_bcm47162a0_quirk(dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:36:9: note: Assuming field 'id' is not equal =
to BCMA_CHIP_ID_BCM47162
           return dev->bus->chipinfo.id =3D=3D BCMA_CHIP_ID_BCM47162 &&
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:36:56: note: Left side of '&&' is false
           return dev->bus->chipinfo.id =3D=3D BCMA_CHIP_ID_BCM47162 &&
                                                                 ^
   drivers/bcma/driver_mips.c:36:2: note: Returning zero, which participate=
s in a condition later
           return dev->bus->chipinfo.id =3D=3D BCMA_CHIP_ID_BCM47162 &&
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:59:6: note: Returning from 'bcma_core_mips_bc=
m47162a0_quirk'
           if (bcma_core_mips_bcm47162a0_quirk(dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:59:2: note: Taking false branch
           if (bcma_core_mips_bcm47162a0_quirk(dev))
           ^
   drivers/bcma/driver_mips.c:61:6: note: Calling 'bcma_core_mips_bcm5357b0=
_quirk'
           if (bcma_core_mips_bcm5357b0_quirk(dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:43:10: note: Assuming field 'id' is equal to =
BCMA_CHIP_ID_BCM5357
           return (dev->bus->chipinfo.id =3D=3D BCMA_CHIP_ID_BCM5357 ||
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:43:56: note: Left side of '||' is true
           return (dev->bus->chipinfo.id =3D=3D BCMA_CHIP_ID_BCM5357 ||
                                                                 ^
   drivers/bcma/driver_mips.c:45:9: note: Assuming field 'pkg' is not equal=
 to 11
                  dev->bus->chipinfo.pkg =3D=3D 11 &&
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:45:38: note: Left side of '&&' is false
                  dev->bus->chipinfo.pkg =3D=3D 11 &&
                                               ^
   drivers/bcma/driver_mips.c:43:2: note: Returning zero, which participate=
s in a condition later
           return (dev->bus->chipinfo.id =3D=3D BCMA_CHIP_ID_BCM5357 ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:61:6: note: Returning from 'bcma_core_mips_bc=
m5357b0_quirk'
           if (bcma_core_mips_bcm5357b0_quirk(dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:61:2: note: Taking false branch
           if (bcma_core_mips_bcm5357b0_quirk(dev))
           ^
   drivers/bcma/driver_mips.c:65:6: note: Assuming 'flag' is 0
           if (flag)
               ^~~~
   drivers/bcma/driver_mips.c:65:2: note: Taking false branch
           if (flag)
           ^
   drivers/bcma/driver_mips.c:68:3: note: Returning the value 63
                   return 0x3f;
                   ^~~~~~~~~~~
   drivers/bcma/driver_mips.c:129:15: note: Returning from 'bcma_core_mips_=
irqflag'
                                   if ((1 << bcma_core_mips_irqflag(core)) =
=3D=3D
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:129:12: note: The result of the left shift is=
 undefined due to shifting by '63', which is greater or equal to the width =
of type 'int'
                                   if ((1 << bcma_core_mips_irqflag(core)) =
=3D=3D
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bcma/driver_mips.c:168:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                   ints +=3D sprintf(ints, " %s%c",
                           ^~~~~~~
   drivers/bcma/driver_mips.c:168:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                   ints +=3D sprintf(ints, " %s%c",
                           ^~~~~~~
   Suppressed 31 warnings (30 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/hsi/hsi_core.c:23:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "hsi:%s\n", dev_name(dev));
                  ^~~~~~~
   drivers/hsi/hsi_core.c:23:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "hsi:%s\n", dev_name(dev));
                  ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/slimbus/core.c:215:9: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(compat, "slim%x,%x", &manf_id, &prod_code=
);
                         ^~~~~~
   drivers/slimbus/core.c:215:9: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(compat, "slim%x,%x", &manf_id, &prod_code=
);
                         ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/slimbus/messaging.c:45:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg->rbuf, reply, len);
           ^~~~~~
   drivers/slimbus/messaging.c:45:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(msg->rbuf, reply, len);
           ^~~~~~
   drivers/slimbus/messaging.c:323:3: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return buf;
                   ^      ~~~
   drivers/slimbus/messaging.c:317:2: note: 'buf' declared without an initi=
al value
           u8 buf;
           ^~~~~~
   drivers/slimbus/messaging.c:319:8: note: Calling 'slim_read'
           ret =3D slim_read(sdev, addr, 1, &buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:300:2: note: Calling 'slim_fill_msg'
           slim_fill_msg(&msg, addr, count, val, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:282:1: note: Returning without writing to 'm=
sg->rbuf'
   }
   ^
   drivers/slimbus/messaging.c:300:2: note: Returning from 'slim_fill_msg'
           slim_fill_msg(&msg, addr, count, val, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:302:9: note: Calling 'slim_xfer_msg'
           return slim_xfer_msg(sdev, &msg, SLIM_MSG_MC_REQUEST_VALUE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:242:6: note: Assuming 'ctrl' is non-null
           if (!ctrl)
               ^~~~~
   drivers/slimbus/messaging.c:242:2: note: Taking false branch
           if (!ctrl)
           ^
   drivers/slimbus/messaging.c:245:8: note: Calling 'slim_val_inf_sanity'
           ret =3D slim_val_inf_sanity(ctrl, msg, mc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:182:7: note: 'msg' is non-null
           if (!msg || msg->num_bytes > 16 ||
                ^~~
   drivers/slimbus/messaging.c:182:6: note: Left side of '||' is false
           if (!msg || msg->num_bytes > 16 ||
               ^
   drivers/slimbus/messaging.c:182:19: note: Field 'num_bytes' is <=3D 16
           if (!msg || msg->num_bytes > 16 ||
                            ^
   drivers/slimbus/messaging.c:182:6: note: Left side of '||' is false
           if (!msg || msg->num_bytes > 16 ||
               ^
   drivers/slimbus/messaging.c:183:6: note: Assuming the condition is false
               (msg->start_offset + msg->num_bytes) > 0xC00)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:182:2: note: Taking false branch
           if (!msg || msg->num_bytes > 16 ||
           ^
   drivers/slimbus/messaging.c:185:2: note: Control jumps to 'case 96:'  at=
 line 186
           switch (mc) {
           ^
   drivers/slimbus/messaging.c:188:12: note: Field 'rbuf' is not equal to N=
ULL
                   if (msg->rbuf !=3D NULL)
                            ^
   drivers/slimbus/messaging.c:188:3: note: Taking true branch
                   if (msg->rbuf !=3D NULL)
                   ^
   drivers/slimbus/messaging.c:189:4: note: Returning without writing to 'm=
sg->rbuf'
                           return 0;
                           ^
   drivers/slimbus/messaging.c:245:8: note: Returning from 'slim_val_inf_sa=
nity'
           ret =3D slim_val_inf_sanity(ctrl, msg, mc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:246:6: note: 'ret' is 0
           if (ret)
--
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/hid/hid-roccat-isku.c:66:9: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", isku->actual_profile);
                  ^~~~~~~~
   drivers/hid/hid-roccat-isku.c:66:9: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", isku->actual_profile);
                  ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/hid/hid-roccat-kone.c:68:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, buf, size);
           ^~~~~~
   drivers/hid/hid-roccat-kone.c:68:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, buf, size);
           ^~~~~~
   drivers/hid/hid-roccat-kone.c:279:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, ((char const *)&kone->settings) + off, count);
           ^~~~~~
   drivers/hid/hid-roccat-kone.c:279:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, ((char const *)&kone->settings) + off, count);
           ^~~~~~
   drivers/hid/hid-roccat-kone.c:318:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&kone->settings, settings, sizeof(struct kone_set=
tings));
                   ^~~~~~
   drivers/hid/hid-roccat-kone.c:318:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&kone->settings, settings, sizeof(struct kone_set=
tings));
                   ^~~~~~
   drivers/hid/hid-roccat-kone.c:349:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, ((char const *)&kone->profiles[*(uint *)(attr->priva=
te)]) + off, count);
           ^~~~~~
   drivers/hid/hid-roccat-kone.c:349:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, ((char const *)&kone->profiles[*(uint *)(attr->priva=
te)]) + off, count);
           ^~~~~~
   drivers/hid/hid-roccat-kone.c:378:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(profile, buf, sizeof(struct kone_profile)=
);
                           ^~~~~~
   drivers/hid/hid-roccat-kone.c:378:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(profile, buf, sizeof(struct kone_profile)=
);
                           ^~~~~~
   drivers/hid/hid-roccat-kone.c:406:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_profile);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:406:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_profile);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:415:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_dpi);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:415:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_dpi);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:438:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", weight);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:438:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", weight);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:447:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->firmware_version);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:447:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->firmware_version);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:457:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.tcu);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:457:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.tcu);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:559:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.startup_p=
rofile);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:559:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.startup_p=
rofile);
                  ^~~~~~~~
   drivers/hid/hid-roccat-kone.c:860:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&kone->last_mouse_event, event,
                   ^~~~~~
   drivers/hid/hid-roccat-kone.c:860:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&kone->last_mouse_event, event,
                   ^~~~~~
   drivers/hid/hid-roccat-kone.c:863:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&event->wipe, 0, sizeof(event->wipe));
                   ^~~~~~
   drivers/hid/hid-roccat-kone.c:863:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(&event->wipe, 0, sizeof(event->wipe));
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/leds/leds-lm3530.c:236:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&als, 0, sizeof(struct lm3530_als_data));
           ^~~~~~
   drivers/leds/leds-lm3530.c:236:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&als, 0, sizeof(struct lm3530_als_data));
           ^~~~~~
>> drivers/leds/leds-lm3530.c:359:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                           len +=3D sprintf(buf + len, "[%s] ", mode_map[i]=
.mode);
                                  ^~~~~~~
   drivers/leds/leds-lm3530.c:359:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                           len +=3D sprintf(buf + len, "[%s] ", mode_map[i]=
.mode);
                                  ^~~~~~~
   drivers/leds/leds-lm3530.c:361:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                           len +=3D sprintf(buf + len, "%s ", mode_map[i].m=
ode);
                                  ^~~~~~~
   drivers/leds/leds-lm3530.c:361:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                           len +=3D sprintf(buf + len, "%s ", mode_map[i].m=
ode);
                                  ^~~~~~~
   drivers/leds/leds-lm3530.c:363:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/leds/leds-lm3530.c:363:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   net/netfilter/ipvs/ip_vs_core.c:110:3: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "IP_%u", proto);
                   ^~~~~~~
   net/netfilter/ipvs/ip_vs_core.c:110:3: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "IP_%u", proto);
                   ^~~~~~~
   net/netfilter/ipvs/ip_vs_core.c:1378:29: warning: The left operand of '=
=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResu=
lt]
                   if (unlikely(iph.protocol =3D=3D IPPROTO_ICMP)) {
                                             ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/netfilter/ipvs/ip_vs_core.c:1344:16: note: Assuming the condition is=
 false
           EnterFunction(11);
                         ^
   include/net/ip_vs.h:268:7: note: expanded from macro 'EnterFunction'
                   if (level <=3D ip_vs_get_debug_level())                 =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_core.c:1344:2: note: Taking false branch
           EnterFunction(11);
           ^
   include/net/ip_vs.h:268:3: note: expanded from macro 'EnterFunction'
                   if (level <=3D ip_vs_get_debug_level())                 =
  \
                   ^
   net/netfilter/ipvs/ip_vs_core.c:1344:2: note: Loop condition is false.  =
Exiting loop
           EnterFunction(11);
           ^
   include/net/ip_vs.h:267:2: note: expanded from macro 'EnterFunction'
           do {                                                            \
           ^
   net/netfilter/ipvs/ip_vs_core.c:1347:6: note: Assuming field 'ipvs_prope=
rty' is 0
           if (skb->ipvs_property)
               ^~~~~~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_core.c:1347:2: note: Taking false branch
           if (skb->ipvs_property)
           ^
   net/netfilter/ipvs/ip_vs_core.c:1352:15: note: 'sk' is null
           if (unlikely(sk && hooknum =3D=3D NF_INET_LOCAL_OUT &&
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/netfilter/ipvs/ip_vs_core.c:1352:18: note: Left side of '&&' is false
           if (unlikely(sk && hooknum =3D=3D NF_INET_LOCAL_OUT &&
                           ^
   net/netfilter/ipvs/ip_vs_core.c:1352:2: note: Taking false branch
           if (unlikely(sk && hooknum =3D=3D NF_INET_LOCAL_OUT &&
           ^
   net/netfilter/ipvs/ip_vs_core.c:1359:6: note: Assuming the condition is =
false
           if (unlikely(!skb_dst(skb)))
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_core.c:1359:2: note: Taking false branch
           if (unlikely(!skb_dst(skb)))
           ^
   net/netfilter/ipvs/ip_vs_core.c:1362:6: note: Assuming field 'enable' is=
 not equal to 0
           if (!ipvs->enable)
               ^~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_core.c:1362:2: note: Taking false branch
           if (!ipvs->enable)
           ^
   net/netfilter/ipvs/ip_vs_core.c:1365:2: note: Calling 'ip_vs_fill_iph_sk=
b'
           ip_vs_fill_iph_skb(af, skb, false, &iph);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ip_vs.h:129:6: note: 'inverse' is false
           if (inverse)
               ^~~~~~~
   include/net/ip_vs.h:129:2: note: Taking false branch
           if (inverse)
           ^
   include/net/ip_vs.h:132:9: note: Calling 'ip_vs_fill_iph_skb_off'
           return ip_vs_fill_iph_skb_off(af, skb, skb_network_offset(skb),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ip_vs.h:98:7: note: Assuming 'iph' is null
                   if (!iph)
--
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/serio/userio.c:145:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, &userio->buf[userio->tail], copylen);
                           ^~~~~~
   drivers/input/serio/userio.c:145:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, &userio->buf[userio->tail], copylen);
                           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/hwtracing/intel_th/msu.c:667:4: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&bdesc->hw_tag, 0, hw_sz);
                           ^~~~~~
   drivers/hwtracing/intel_th/msu.c:667:4: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                           memset(&bdesc->hw_tag, 0, hw_sz);
                           ^~~~~~
   drivers/hwtracing/intel_th/msu.c:860:2: warning: Value stored to 'reg' i=
s never read [clang-analyzer-deadcode.DeadStores]
           reg =3D ioread32(msc->reg_base + REG_MSU_MSC0STS);
           ^
   drivers/hwtracing/intel_th/msu.c:860:2: note: Value stored to 'reg' is n=
ever read
   drivers/hwtracing/intel_th/msu.c:1209:4: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(bdesc, 0, sizeof(*bdesc));
                           ^~~~~~
   drivers/hwtracing/intel_th/msu.c:1209:4: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                           memset(bdesc, 0, sizeof(*bdesc));
                           ^~~~~~
   drivers/hwtracing/intel_th/msu.c:2086:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", msc->stop_on_full);
                  ^~~~~~~
   drivers/hwtracing/intel_th/msu.c:2086:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", msc->stop_on_full);
                  ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
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
   31 warnings generated.
   drivers/char/ipmi/ipmi_si_platform.c:158:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&io, 0, sizeof(io));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_platform.c:158:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&io, 0, sizeof(io));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_platform.c:271:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&io, 0, sizeof(io));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_platform.c:271:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&io, 0, sizeof(io));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/i2c/busses/i2c-at91-master.c:761:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&slave_config, 0, sizeof(slave_config));
           ^~~~~~
   drivers/i2c/busses/i2c-at91-master.c:761:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&slave_config, 0, sizeof(slave_config));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/i2c/busses/i2c-davinci.c:796:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->pdata, &davinci_i2c_platform_data_default,
                   ^~~~~~
   drivers/i2c/busses/i2c-davinci.c:796:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->pdata, &davinci_i2c_platform_data_default,
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/usb/chipidea/core.c:956:10: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   return sprintf(buf, "%s\n", ci_role(ci)->name);
                          ^~~~~~~
   drivers/usb/chipidea/core.c:956:10: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   return sprintf(buf, "%s\n", ci_role(ci)->name);
                          ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/fpga/fpga-bridge.c:289:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", bridge->name);
                  ^~~~~~~
   drivers/fpga/fpga-bridge.c:289:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", bridge->name);
                  ^~~~~~~
   drivers/fpga/fpga-bridge.c:301:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", enable ? "enabled" : "disabled");
                  ^~~~~~~
   drivers/fpga/fpga-bridge.c:301:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", enable ? "enabled" : "disabled");
                  ^~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/fpga/altera-freeze-bridge.c:69:4: warning: Value stored to 'ctrl=
' is never read [clang-analyzer-deadcode.DeadStores]
                           ctrl =3D readl(priv->base_addr + FREEZE_CSR_CTRL=
_OFFSET);
                           ^
   drivers/fpga/altera-freeze-bridge.c:69:4: note: Value stored to 'ctrl' i=
s never read
   drivers/fpga/altera-freeze-bridge.c:150:2: warning: Value stored to 'sta=
tus' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D readl(priv->base_addr + FREEZE_CSR_STATUS_OFFSET);
           ^
   drivers/fpga/altera-freeze-bridge.c:150:2: note: Value stored to 'status=
' is never read
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   net/ceph/crush/mapper.c:1073:5: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(o, c, osize*sizeof(*o));
                                   ^~~~~~
   net/ceph/crush/mapper.c:1073:5: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(o, c, osize*sizeof(*o));
                                   ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   net/ceph/debugfs.c:411:2: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%pU.client%lld", &client->fsid,
           ^~~~~~~~
   net/ceph/debugfs.c:411:2: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%pU.client%lld", &client->fsid,
           ^~~~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   net/ceph/auth.c:224:2: warning: Value stored to 'result_msg' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           result_msg =3D p;
           ^            ~
   net/ceph/auth.c:224:2: note: Value stored to 'result_msg' is never read
           result_msg =3D p;
           ^            ~

vim +87 drivers/amba/bus.c

^1da177e4c3f41 arch/arm/common/amba.c Linus Torvalds     2005-04-16  78  =

5150a8f07f6c24 drivers/amba/bus.c     Uwe Kleine-K=C3=B6nig   2021-01-26  7=
9  =

3cf385713460eb drivers/amba/bus.c     Antonios Motakis   2015-01-06  80  st=
atic ssize_t driver_override_show(struct device *_dev,
3cf385713460eb drivers/amba/bus.c     Antonios Motakis   2015-01-06  81  		=
		    struct device_attribute *attr, char *buf)
3cf385713460eb drivers/amba/bus.c     Antonios Motakis   2015-01-06  82  {
3cf385713460eb drivers/amba/bus.c     Antonios Motakis   2015-01-06  83  	s=
truct amba_device *dev =3D to_amba_device(_dev);
6a7228d90d42bc drivers/amba/bus.c     Geert Uytterhoeven 2018-04-10  84  	s=
size_t len;
3cf385713460eb drivers/amba/bus.c     Antonios Motakis   2015-01-06  85  =

6a7228d90d42bc drivers/amba/bus.c     Geert Uytterhoeven 2018-04-10  86  	d=
evice_lock(_dev);
6a7228d90d42bc drivers/amba/bus.c     Geert Uytterhoeven 2018-04-10 @87  	l=
en =3D sprintf(buf, "%s\n", dev->driver_override);
6a7228d90d42bc drivers/amba/bus.c     Geert Uytterhoeven 2018-04-10  88  	d=
evice_unlock(_dev);
6a7228d90d42bc drivers/amba/bus.c     Geert Uytterhoeven 2018-04-10  89  	r=
eturn len;
3cf385713460eb drivers/amba/bus.c     Antonios Motakis   2015-01-06  90  }
3cf385713460eb drivers/amba/bus.c     Antonios Motakis   2015-01-06  91  =


:::::: The code at line 87 was first introduced by commit
:::::: 6a7228d90d42bcacfe38786756ba62762b91c20a ARM: amba: Fix race conditi=
on with driver_override

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2419979057779194295==--

