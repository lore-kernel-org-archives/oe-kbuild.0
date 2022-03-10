Content-Type: multipart/mixed; boundary="===============1758884044573000383=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11110/11953] arch/arm/crypto/poly1305-glue.c:91:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as ...
Date: Fri, 11 Mar 2022 05:30:45 +0800
Message-ID: <202203110538.RVmRuOqf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1758884044573000383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 6992f0b3f0fd879b31095263986ba1aedb27c83b [11110/11953] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220310 (https://download.01.org/0day-ci/archi=
ve/20220311/202203110538.RVmRuOqf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6992f0b3f0fd879b31095263986ba1aedb27c83b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6992f0b3f0fd879b31095263986ba1aedb27c83b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> arch/arm/crypto/poly1305-glue.c:91:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:91:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:111:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf, src, len);
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:111:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf, src, len);
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:148:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:148:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf + dctx->buflen, src, bytes);
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:183:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dctx->buf, src, nbytes);
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:183:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dctx->buf, src, nbytes);
                   ^~~~~~
>> arch/arm/crypto/poly1305-glue.c:192:3: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dctx->buf + dctx->buflen, 0,
                   ^~~~~~
   arch/arm/crypto/poly1305-glue.c:192:3: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
                   memset(dctx->buf + dctx->buflen, 0,
                   ^~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/tty/serial/8250/8250_early.c:46:10: warning: Dereference of null=
 pointer [clang-analyzer-core.NullDereference]
                   return readw(port->membase + offset);
                          ^
   arch/arm/include/asm/io.h:306:32: note: expanded from macro 'readw'
   #define readw(c)                ({ u16 __v =3D readw_relaxed(c); __iormb=
(); __v; })
                                                ^
   arch/arm/include/asm/io.h:297:6: note: expanded from macro 'readw_relaxe=
d'
                                           __raw_readw(c)); __r; })
                                           ^
   arch/arm/include/asm/io.h:59:50: note: expanded from macro '__raw_readw'
   #define __raw_readw(a)         (__chk_io_ptr(a), *(volatile unsigned sho=
rt __force *)(a))
                                                    ^
   drivers/tty/serial/8250/8250_early.c:160:8: note: Assuming field 'membas=
e' is null
           if (!(device->port.membase || device->port.iobase))
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:8: note: Left side of '||' is f=
alse
   drivers/tty/serial/8250/8250_early.c:160:6: note: Assuming the condition=
 is false
           if (!(device->port.membase || device->port.iobase))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:2: note: Taking false branch
           if (!(device->port.membase || device->port.iobase))
           ^
   drivers/tty/serial/8250/8250_early.c:163:6: note: Assuming field 'baud' =
is 0
           if (!device->baud) {
               ^~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:163:2: note: Taking true branch
           if (!device->baud) {
           ^
   drivers/tty/serial/8250/8250_early.c:168:9: note: Calling 'serial8250_ea=
rly_in'
                   ier =3D serial8250_early_in(port, UART_IER);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:42:2: note: Control jumps to 'case =
7:'  at line 45
           switch (port->iotype) {
           ^
   drivers/tty/serial/8250/8250_early.c:46:10: note: Dereference of null po=
inter
                   return readw(port->membase + offset);
                          ^
   arch/arm/include/asm/io.h:306:32: note: expanded from macro 'readw'
   #define readw(c)                ({ u16 __v =3D readw_relaxed(c); __iormb=
(); __v; })
                                                ^~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:297:6: note: expanded from macro 'readw_relaxe=
d'
                                           __raw_readw(c)); __r; })
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:59:50: note: expanded from macro '__raw_readw'
   #define __raw_readw(a)         (__chk_io_ptr(a), *(volatile unsigned sho=
rt __force *)(a))
                                                    ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   drivers/tty/serial/8250/8250_early.c:70:3: warning: Dereference of null =
pointer [clang-analyzer-core.NullDereference]
                   writew(value, port->membase + offset);
                   ^
   arch/arm/include/asm/io.h:310:36: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                                 ^
   arch/arm/include/asm/io.h:302:29: note: expanded from macro 'writew_rela=
xed'
   #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v=
),c)
                                   ^
   arch/arm/include/asm/io.h:60:97: note: expanded from macro '__raw_writew'
   #define __raw_writew(v,a)      ((void)(__chk_io_ptr(a), *(volatile unsig=
ned short __force *)(a) =3D (v)))
                                                                           =
                        ^
   drivers/tty/serial/8250/8250_early.c:160:8: note: Assuming field 'membas=
e' is null
           if (!(device->port.membase || device->port.iobase))
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:8: note: Left side of '||' is f=
alse
   drivers/tty/serial/8250/8250_early.c:160:6: note: Assuming the condition=
 is false
           if (!(device->port.membase || device->port.iobase))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:2: note: Taking false branch
           if (!(device->port.membase || device->port.iobase))
           ^
   drivers/tty/serial/8250/8250_early.c:163:6: note: Assuming field 'baud' =
is not equal to 0
           if (!device->baud) {
               ^~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:163:2: note: Taking false branch
           if (!device->baud) {
           ^
   drivers/tty/serial/8250/8250_early.c:171:3: note: Calling 'init_port'
                   init_port(device);
                   ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:141:2: note: Calling 'serial8250_ea=
rly_out'
           serial8250_early_out(port, UART_LCR, 0x3);      /* 8n1 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:65:2: note: Control jumps to 'case =
7:'  at line 69
           switch (port->iotype) {
           ^
   drivers/tty/serial/8250/8250_early.c:70:3: note: Loop condition is false=
.  Exiting loop
                   writew(value, port->membase + offset);
                   ^
   arch/arm/include/asm/io.h:310:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
--
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/asm-generic/getorder.h:44:9: note: Returning from 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/getorder.h:44:2: note: Returning the value 32
           return fls(size);
           ^~~~~~~~~~~~~~~~
   kernel/dma/direct.c:402:28: note: Returning from 'get_order'
           unsigned int page_order =3D get_order(size);
                                     ^~~~~~~~~~~~~~~
   kernel/dma/direct.c:402:2: note: 'page_order' initialized to 32
           unsigned int page_order =3D get_order(size);
           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/direct.c:406:43: note: Left side of '&&' is false
           if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
                                                    ^
   kernel/dma/direct.c:410:38: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'int'
           if (dma_set_encrypted(dev, vaddr, 1 << page_order))
                                               ^  ~~~~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   crypto/authenc.c:409:6: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authenc.c:409:6: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authenc.c:415:6: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authenc.c:415:6: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   crypto/authencesn.c:424:6: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authencesn.c:424:6: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authencesn.c:429:6: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authencesn.c:429:6: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   crypto/asymmetric_keys/x509_cert_parser.c:404:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:404:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:408:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + ctx->o_size + 2,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:408:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + ctx->o_size + 2,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:428:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, name, namesize);
           ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:428:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, name, namesize);
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
>> drivers/video/fbdev/efifb.c:323:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   efifb_attr_decl(base, "0x%x");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:323:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   efifb_attr_decl(base, "0x%x");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:324:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   efifb_attr_decl(linelength, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:324:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   efifb_attr_decl(linelength, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:325:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   efifb_attr_decl(height, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:325:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   efifb_attr_decl(height, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:326:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   efifb_attr_decl(width, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:326:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   efifb_attr_decl(width, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:327:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   efifb_attr_decl(depth, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   drivers/video/fbdev/efifb.c:327:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   efifb_attr_decl(depth, "%u");
   ^
   drivers/video/fbdev/efifb.c:319:9: note: expanded from macro 'efifb_attr=
_decl'
           return sprintf(buf, fmt "\n", (screen_info.lfb_##name));        \
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/char/tpm/tpm-sysfs.c:42:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&anti_replay, 0, sizeof(anti_replay));
           ^~~~~~
   drivers/char/tpm/tpm-sysfs.c:42:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&anti_replay, 0, sizeof(anti_replay));
           ^~~~~~
   drivers/char/tpm/tpm-sysfs.c:58:6: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
               sprintf(str,
               ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:58:6: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
               sprintf(str,
               ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:72:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "%16ph\n", &out->modulus[i]);
                          ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:72:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "%16ph\n", &out->modulus[i]);
                          ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:107:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "PCR-%02d: ", i);
                          ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:107:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "PCR-%02d: ", i);
                          ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:109:11: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           str +=3D sprintf(str, "%02X ", digest[j]);
                                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:109:11: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                           str +=3D sprintf(str, "%02X ", digest[j]);
                                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:110:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "\n");
                          ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:110:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "\n");
--
   40 warnings generated.
   arch/arm/kernel/setup.c:372:2: warning: Call to function 'vsnprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(buf, sizeof(buf), str, ap);
           ^~~~~~~~~
   arch/arm/kernel/setup.c:372:2: note: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(buf, sizeof(buf), str, ap);
           ^~~~~~~~~
   arch/arm/kernel/setup.c:716:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(init_utsname()->machine, __NEW_UTS_LEN + 1, "%s%c",
           ^~~~~~~~
   arch/arm/kernel/setup.c:716:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(init_utsname()->machine, __NEW_UTS_LEN + 1, "%s%c",
           ^~~~~~~~
   arch/arm/kernel/setup.c:718:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(elf_platform, ELF_PLATFORM_SIZE, "%s%c",
           ^~~~~~~~
   arch/arm/kernel/setup.c:718:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(elf_platform, ELF_PLATFORM_SIZE, "%s%c",
           ^~~~~~~~
   arch/arm/kernel/setup.c:1121:17: warning: Access to field 'name' results=
 in a dereference of a null pointer (loaded from variable 'mdesc') [clang-a=
nalyzer-core.NullDereference]
           machine_name =3D mdesc->name;
                          ^~~~~
   arch/arm/kernel/setup.c:1099:6: note: Assuming '__atags_pointer' is 0
           if (__atags_pointer)
               ^~~~~~~~~~~~~~~
   arch/arm/kernel/setup.c:1099:2: note: Taking false branch
           if (__atags_pointer)
           ^
   arch/arm/kernel/setup.c:1103:6: note: 'atags_vaddr' is null
           if (atags_vaddr) {
               ^~~~~~~~~~~
   arch/arm/kernel/setup.c:1103:2: note: Taking false branch
           if (atags_vaddr) {
           ^
   arch/arm/kernel/setup.c:1109:7: note: 'mdesc' is null
           if (!mdesc)
                ^~~~~
   arch/arm/kernel/setup.c:1109:2: note: Taking true branch
           if (!mdesc)
           ^
   arch/arm/kernel/setup.c:1110:3: note: Value assigned to 'mdesc'
                   mdesc =3D setup_machine_tags(atags_vaddr, __machine_arch=
_type);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   arch/arm/kernel/setup.c:1111:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/setup.c:1111:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/setup.c:1115:7: note: Assuming '__atags_pointer' is 0
                   if (__atags_pointer)
                       ^~~~~~~~~~~~~~~
   arch/arm/kernel/setup.c:1115:3: note: Taking false branch
                   if (__atags_pointer)
                   ^
   arch/arm/kernel/setup.c:1121:17: note: Access to field 'name' results in=
 a dereference of a null pointer (loaded from variable 'mdesc')
           machine_name =3D mdesc->name;
                          ^~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/zstd/common/entropy_common.c:77:9: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(buffer, headerBuffer, hbSize);
           ^
   lib/zstd/common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcp=
y'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/common/entropy_common.c:77:9: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(buffer, headerBuffer, hbSize);
           ^
   lib/zstd/common/zstd_deps.h:32:28: note: expanded from macro 'ZSTD_memcp=
y'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/common/entropy_common.c:87:5: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(normalizedCounter, 0, (*maxSVPtr+1) * sizeof(normalizedC=
ounter[0]));   /* all symbols not present in NCount have a frequency of 0 */
       ^
   lib/zstd/common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memse=
t'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/common/entropy_common.c:87:5: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(normalizedCounter, 0, (*maxSVPtr+1) * sizeof(normalizedC=
ounter[0]));   /* all symbols not present in NCount have a frequency of 0 */
       ^
   lib/zstd/common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memse=
t'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/common/entropy_common.c:294:5: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(rankStats, 0, (HUF_TABLELOG_MAX + 1) * sizeof(U32));
       ^
   lib/zstd/common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memse=
t'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/common/entropy_common.c:294:5: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(rankStats, 0, (HUF_TABLELOG_MAX + 1) * sizeof(U32));
       ^
   lib/zstd/common/zstd_deps.h:34:28: note: expanded from macro 'ZSTD_memse=
t'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
>> security/tomoyo/condition.c:123:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(local_checked, 0, sizeof(local_checked));
                   ^~~~~~
   security/tomoyo/condition.c:123:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(local_checked, 0, sizeof(local_checked));
                   ^~~~~~
   security/tomoyo/condition.c:826:17: warning: Access to field 'file' resu=
lts in a dereference of a null pointer (loaded from field 'bprm') [clang-an=
alyzer-core.NullDereference]
                                   file =3D ee ? ee->bprm->file : NULL;
                                               ^   ~~~~
   security/tomoyo/condition.c:782:6: note: Assuming 'cond' is non-null
           if (!cond)
               ^~~~~
   security/tomoyo/condition.c:782:2: note: Taking false branch
           if (!cond)
           ^
   security/tomoyo/condition.c:788:6: note: Assuming field 'ee' is non-null
           if (r->ee)
               ^~~~~
   security/tomoyo/condition.c:788:2: note: Taking true branch
           if (r->ee)
           ^
   security/tomoyo/condition.c:790:6: note: Assuming 'bprm' is null
           if (!bprm && (argc || envc))
               ^~~~~
   security/tomoyo/condition.c:790:6: note: Left side of '&&' is true
   security/tomoyo/condition.c:790:16: note: Assuming 'argc' is 0
           if (!bprm && (argc || envc))
                         ^~~~
   security/tomoyo/condition.c:790:16: note: Left side of '||' is false
   security/tomoyo/condition.c:790:24: note: Assuming 'envc' is 0
           if (!bprm && (argc || envc))
                                 ^~~~
   security/tomoyo/condition.c:790:2: note: Taking false branch
           if (!bprm && (argc || envc))
           ^
   security/tomoyo/condition.c:798:14: note: Assuming 'i' is < 'condc'
           for (i =3D 0; i < condc; i++) {
                       ^~~~~~~~~
   security/tomoyo/condition.c:798:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < condc; i++) {
           ^
   security/tomoyo/condition.c:807:7: note: Assuming 'left' is not equal to=
 TOMOYO_ARGV_ENTRY
                   if (left =3D=3D TOMOYO_ARGV_ENTRY || left =3D=3D TOMOYO_=
ENVP_ENTRY)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/tomoyo/condition.c:807:7: note: Left side of '||' is false
   security/tomoyo/condition.c:807:36: note: Assuming 'left' is not equal t=
o TOMOYO_ENVP_ENTRY
                   if (left =3D=3D TOMOYO_ARGV_ENTRY || left =3D=3D TOMOYO_=
ENVP_ENTRY)
                                                    ^~~~~~~~~~~~~~~~~~~~~~~=
~~
   security/tomoyo/condition.c:807:3: note: Taking false branch
                   if (left =3D=3D TOMOYO_ARGV_ENTRY || left =3D=3D TOMOYO_=
ENVP_ENTRY)
                   ^
   security/tomoyo/condition.c:810:7: note: Assuming 'right' is equal to TO=
MOYO_NAME_UNION
                   if (right =3D=3D TOMOYO_NAME_UNION) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/tomoyo/condition.c:810:3: note: Taking true branch
                   if (right =3D=3D TOMOYO_NAME_UNION) {
                   ^
   security/tomoyo/condition.c:816:4: note: Control jumps to 'case TOMOYO_E=
XEC_REALPATH:' @line 824
                           switch (left) {
                           ^
   security/tomoyo/condition.c:826:12: note: 'ee' is non-null
                                   file =3D ee ? ee->bprm->file : NULL;
                                          ^~
   security/tomoyo/condition.c:826:12: note: '?' condition is true
   security/tomoyo/condition.c:826:17: note: Access to field 'file' results=
 in a dereference of a null pointer (loaded from field 'bprm')
                                   file =3D ee ? ee->bprm->file : NULL;
                                               ^   ~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   arch/arm/mm/dma-mapping.c:251:4: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(ptr, 0, PAGE_SIZE);
                           ^~~~~~
   arch/arm/mm/dma-mapping.c:251:4: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                           memset(ptr, 0, PAGE_SIZE);
                           ^~~~~~
   arch/arm/mm/dma-mapping.c:262:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ptr, 0, size);
                   ^~~~~~
   arch/arm/mm/dma-mapping.c:262:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(ptr, 0, size);
                   ^~~~~~
   arch/arm/mm/dma-mapping.c:288:54: warning: The result of the left shift =
is undefined due to shifting by '32', which is greater or equal to the widt=
h of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           for (p =3D page + (size >> PAGE_SHIFT), e =3D page + (1 << order=
); p < e; p++)
                                                               ^
   arch/arm/mm/dma-mapping.c:644:9: note: Calling '__alloc_remap_buffer'
           return __alloc_remap_buffer(args->dev, args->size, args->gfp,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mm/dma-mapping.c:467:9: note: Calling '__dma_alloc_buffer'
           page =3D __dma_alloc_buffer(dev, size, gfp, NORMAL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mm/dma-mapping.c:277:24: note: Calling 'get_order'
           unsigned long order =3D get_order(size);
                                 ^~~~~~~~~~~~~~~
   include/asm-generic/getorder.h:31:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/asm-generic/getorder.h:44:9: note: Calling 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
--
   ^
   drivers/firmware/efi/esrt.c:126:9: note: expanded from macro 'esre_attr_=
decl'
           return sprintf(buf, fmt "\n", \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:135:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   esre_attr_decl(capsule_flags, 32, "0x%x");
   ^
   drivers/firmware/efi/esrt.c:126:9: note: expanded from macro 'esre_attr_=
decl'
           return sprintf(buf, fmt "\n", \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:135:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   esre_attr_decl(capsule_flags, 32, "0x%x");
   ^
   drivers/firmware/efi/esrt.c:126:9: note: expanded from macro 'esre_attr_=
decl'
           return sprintf(buf, fmt "\n", \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:136:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   esre_attr_decl(last_attempt_version, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:126:9: note: expanded from macro 'esre_attr_=
decl'
           return sprintf(buf, fmt "\n", \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:136:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   esre_attr_decl(last_attempt_version, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:126:9: note: expanded from macro 'esre_attr_=
decl'
           return sprintf(buf, fmt "\n", \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:137:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   esre_attr_decl(last_attempt_status, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:126:9: note: expanded from macro 'esre_attr_=
decl'
           return sprintf(buf, fmt "\n", \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:137:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   esre_attr_decl(last_attempt_status, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:126:9: note: expanded from macro 'esre_attr_=
decl'
           return sprintf(buf, fmt "\n", \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:205:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   esrt_attr_decl(fw_resource_count, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:200:9: note: expanded from macro 'esrt_attr_=
decl'
           return sprintf(buf, fmt "\n", le##size##_to_cpu(esrt->name)); \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:205:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   esrt_attr_decl(fw_resource_count, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:200:9: note: expanded from macro 'esrt_attr_=
decl'
           return sprintf(buf, fmt "\n", le##size##_to_cpu(esrt->name)); \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:206:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   esrt_attr_decl(fw_resource_count_max, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:200:9: note: expanded from macro 'esrt_attr_=
decl'
           return sprintf(buf, fmt "\n", le##size##_to_cpu(esrt->name)); \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:206:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   esrt_attr_decl(fw_resource_count_max, 32, "%u");
   ^
   drivers/firmware/efi/esrt.c:200:9: note: expanded from macro 'esrt_attr_=
decl'
           return sprintf(buf, fmt "\n", le##size##_to_cpu(esrt->name)); \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:207:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   esrt_attr_decl(fw_resource_version, 64, "%llu");
   ^
   drivers/firmware/efi/esrt.c:200:9: note: expanded from macro 'esrt_attr_=
decl'
           return sprintf(buf, fmt "\n", le##size##_to_cpu(esrt->name)); \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:207:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   esrt_attr_decl(fw_resource_version, 64, "%llu");
   ^
   drivers/firmware/efi/esrt.c:200:9: note: expanded from macro 'esrt_attr_=
decl'
           return sprintf(buf, fmt "\n", le##size##_to_cpu(esrt->name)); \
                  ^~~~~~~
   drivers/firmware/efi/esrt.c:289:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tmpesrt, va, sizeof(tmpesrt));
           ^~~~~~
   drivers/firmware/efi/esrt.c:289:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tmpesrt, va, sizeof(tmpesrt));
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
>> security/tomoyo/network.c:71:4: warning: Call to function 'memmove' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(max, min, sizeof(u16) * 8);
                           ^~~~~~~
   security/tomoyo/network.c:71:4: note: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11
                           memmove(max, min, sizeof(u16) * 8);
                           ^~~~~~~
>> security/tomoyo/network.c:93:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buffer, buffer_len, "%pI4%c%pI4", min_ip,
           ^~~~~~~~
   security/tomoyo/network.c:93:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(buffer, buffer_len, "%pI4%c%pI4", min_ip,
           ^~~~~~~~
   security/tomoyo/network.c:111:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buffer, buffer_len, "%pI6c%c%pI6c", min_ip,
           ^~~~~~~~
   security/tomoyo/network.c:111:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(buffer, buffer_len, "%pI6c%c%pI6c", min_ip,
           ^~~~~~~~
   security/tomoyo/network.c:391:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf + len, sizeof(buf) - len, " %u",
           ^~~~~~~~
   security/tomoyo/network.c:391:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf + len, sizeof(buf) - len, " %u",
           ^~~~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/leds/led-core.c:442:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:442:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:449:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
                           ^~~~~~~~
   drivers/leds/led-core.c:449:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
                           ^~~~~~~~
   drivers/leds/led-core.c:453:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:453:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:458:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:458:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:469:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
                   ^~~~~~~~
   drivers/leds/led-core.c:469:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
                   ^~~~~~~~
   drivers/leds/led-core.c:472:30: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/leds/led-core.c:424:2: note: Taking false branch
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/leds/led-core.c:424:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/leds/led-core.c:426:6: note: Assuming 'led_classdev_name' is non=
-null
           if (!led_classdev_name)
               ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:426:2: note: Taking false branch
           if (!led_classdev_name)
           ^
   drivers/leds/led-core.c:429:2: note: Calling 'led_parse_fwnode_props'
           led_parse_fwnode_props(dev, fwnode, &props);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:370:6: note: Assuming 'fwnode' is non-null
           if (!fwnode)
               ^~~~~~~
   drivers/leds/led-core.c:370:2: note: Taking false branch
           if (!fwnode)
           ^
   drivers/leds/led-core.c:373:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "label")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:373:2: note: Taking false branch
           if (fwnode_property_present(fwnode, "label")) {
           ^
   drivers/leds/led-core.c:380:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "color")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:380:2: note: Taking false branch
           if (fwnode_property_present(fwnode, "color")) {
           ^
   drivers/leds/led-core.c:391:6: note: Assuming the condition is true
           if (!fwnode_property_present(fwnode, "function"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:391:2: note: Taking true branch
           if (!fwnode_property_present(fwnode, "function"))
--
           ^
   security/tomoyo/domain.c:942:11: note: Passing null pointer value via 1s=
t parameter 'page'
           put_page(page);
                    ^~~~
   security/tomoyo/domain.c:942:2: note: Calling 'put_page'
           put_page(page);
           ^~~~~~~~~~~~~~
   include/linux/mm.h:1224:35: note: Passing null pointer value via 1st par=
ameter 'page'
           struct folio *folio =3D page_folio(page);
                                            ^
   include/linux/page-flags.h:219:49: note: expanded from macro 'page_folio'
           struct page *:          (struct folio *)_compound_head(p)))
                                                                  ^
   include/linux/mm.h:1224:24: note: Calling '_compound_head'
           struct folio *folio =3D page_folio(page);
                                 ^
   include/linux/page-flags.h:219:34: note: expanded from macro 'page_folio'
           struct page *:          (struct folio *)_compound_head(p)))
                                                   ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:195:23: note: Left side of '||' is false
           unsigned long head =3D READ_ONCE(page->compound_head);
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
   include/linux/page-flags.h:195:23: note: Left side of '||' is false
           unsigned long head =3D READ_ONCE(page->compound_head);
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
   include/linux/page-flags.h:195:23: note: Left side of '||' is true
           unsigned long head =3D READ_ONCE(page->compound_head);
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
   include/linux/page-flags.h:195:23: note: Taking false branch
           unsigned long head =3D READ_ONCE(page->compound_head);
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
   include/linux/page-flags.h:195:23: note: Loop condition is false.  Exiti=
ng loop
           unsigned long head =3D READ_ONCE(page->compound_head);
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
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/page-flags.h:195:23: note: Dereference of null pointer
           unsigned long head =3D READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>> security/tomoyo/domain.c:484:3: warning: Call to function 'memmove' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(name, domainname, len);
                   ^~~~~~~
   security/tomoyo/domain.c:484:3: note: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11
                   memmove(name, domainname, len);
                   ^~~~~~~
>> security/tomoyo/domain.c:567:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(e.group, domain->group, sizeof(e.group));
                   ^~~~~~
   security/tomoyo/domain.c:567:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(e.group, domain->group, sizeof(e.group));
                   ^~~~~~
>> security/tomoyo/domain.c:787:4: warning: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(ee->tmp, old_domain->domainname->name,
                           ^~~~~~~
   security/tomoyo/domain.c:787:4: note: Call to function 'strncpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'strncpy_s' in case of C11
                           strncpy(ee->tmp, old_domain->domainname->name,
                           ^~~~~~~
   security/tomoyo/domain.c:793:4: warning: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(ee->tmp, domainname, TOMOYO_EXEC_TMPSIZE=
 - 1);
                           ^~~~~~~
   security/tomoyo/domain.c:793:4: note: Call to function 'strncpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'strncpy_s' in case of C11
                           strncpy(ee->tmp, domainname, TOMOYO_EXEC_TMPSIZE=
 - 1);
                           ^~~~~~~
>> security/tomoyo/domain.c:795:4: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "%s %=
s",
                           ^~~~~~~~
   security/tomoyo/domain.c:795:4: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "%s %=
s",
                           ^~~~~~~~
   security/tomoyo/domain.c:808:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "<%s>",
                   ^~~~~~~~
   security/tomoyo/domain.c:808:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "<%s>",
                   ^~~~~~~~
   security/tomoyo/domain.c:819:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "%s %s",
                   ^~~~~~~~
   security/tomoyo/domain.c:819:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "%s %s",
                   ^~~~~~~~
   security/tomoyo/domain.c:841:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "%s %s",
                   ^~~~~~~~
   security/tomoyo/domain.c:841:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(ee->tmp, TOMOYO_EXEC_TMPSIZE - 1, "%s %s",
                   ^~~~~~~~
   security/tomoyo/domain.c:936:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dump->data + offset, kaddr + offset,
                   ^~~~~~
   security/tomoyo/domain.c:936:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dump->data + offset, kaddr + offset,
                   ^~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   fs/d_path.c:50:3: warning: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   memset(dst, 'x', len);
                   ^~~~~~
   fs/d_path.c:50:3: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
                   memset(dst, 'x', len);
                   ^~~~~~
   fs/d_path.c:308:7: warning: Call to function 'vsnprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           sz =3D vsnprintf(temp, sizeof(temp), fmt, args) + 1;
                ^~~~~~~~~
   fs/d_path.c:308:7: note: Call to function 'vsnprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'vsnprintf_s' in case of C11
           sz =3D vsnprintf(temp, sizeof(temp), fmt, args) + 1;
                ^~~~~~~~~
   fs/d_path.c:315:9: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           return memcpy(buffer, temp, sz);
                  ^~~~~~
   fs/d_path.c:315:9: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           return memcpy(buffer, temp, sz);
                  ^~~~~~
   Suppressed 36 warnings (35 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   fs/statfs.c:62:2: warning: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(*buf));
           ^~~~~~
   fs/statfs.c:62:2: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(*buf));
           ^~~~~~
   fs/statfs.c:131:3: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:131:3: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:161:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:161:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:172:3: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:172:3: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
                   memcpy(&buf, st, sizeof(*st));
                   ^~~~~~
   fs/statfs.c:185:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:185:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset(buf.f_spare, 0, sizeof(buf.f_spare));
                   ^~~~~~
   fs/statfs.c:256:2: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp,0,sizeof(struct ustat));
           ^~~~~~
   fs/statfs.c:256:2: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
           memset(&tmp,0,sizeof(struct ustat));
           ^~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:57:2: note: Taking true branch
           if (ci->lastaddress !=3D adr)
           ^
   drivers/media/dvb-frontends/cxd2099.c:59:6: note: Assuming 'status' is n=
ot equal to 0
           if (!status) {
               ^~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:59:2: note: Taking false branch
           if (!status) {
           ^
   drivers/media/dvb-frontends/cxd2099.c:74:2: note: Returning without writ=
ing to '*data'
           return status;
           ^
   drivers/media/dvb-frontends/cxd2099.c:79:9: note: Returning from 'read_b=
lock'
           return read_block(ci, reg, val, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:79:2: note: Returning without writ=
ing to '*val'
           return read_block(ci, reg, val, 1);
           ^
   drivers/media/dvb-frontends/cxd2099.c:506:3: note: Returning from 'read_=
reg'
                   read_reg(ci, 0x01, &slotstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:507:11: note: The right operand of=
 '&' is a garbage value
                   if (!(2 & slotstat)) {
                           ^ ~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:620:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ci->cfg, cfg, sizeof(ci->cfg));
           ^~~~~~
   drivers/media/dvb-frontends/cxd2099.c:620:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ci->cfg, cfg, sizeof(ci->cfg));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   security/commoncap.c:441:5: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&nscap->data, &cap->data, sizeof(=
__le32) * 2 * VFS_CAP_U32);
                                   ^~~~~~
   security/commoncap.c:441:5: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                   memcpy(&nscap->data, &cap->data, sizeof(=
__le32) * 2 * VFS_CAP_U32);
                                   ^~~~~~
   security/commoncap.c:472:4: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&cap->data, &nscap->data, sizeof(__le32) =
* 2 * VFS_CAP_U32);
                           ^~~~~~
   security/commoncap.c:472:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy(&cap->data, &nscap->data, sizeof(__le32) =
* 2 * VFS_CAP_U32);
                           ^~~~~~
   security/commoncap.c:582:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&nscap->data, &cap->data, sizeof(__le32) * 2 * VFS_CAP_U3=
2);
           ^~~~~~
   security/commoncap.c:582:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(&nscap->data, &cap->data, sizeof(__le32) * 2 * VFS_CAP_U3=
2);
           ^~~~~~
   security/commoncap.c:660:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cpu_caps, 0, sizeof(struct cpu_vfs_cap_data));
           ^~~~~~
   security/commoncap.c:660:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(cpu_caps, 0, sizeof(struct cpu_vfs_cap_data));
           ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   fs/fs_context.c:566:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->legacy_data + size, param->key, len);
           ^~~~~~
   fs/fs_context.c:566:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(ctx->legacy_data + size, param->key, len);
           ^~~~~~
   fs/fs_context.c:570:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->legacy_data + size, param->string, param->si=
ze);
                   ^~~~~~
   fs/fs_context.c:570:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->legacy_data + size, param->string, param->si=
ze);
                   ^~~~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/media/dvb-frontends/mb86a20s.c:499:25: warning: Value stored to =
'state' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct mb86a20s_state *state =3D fe->demodulator_priv;
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:499:25: note: Value stored to 'st=
ate' during its initialization is never read
           struct mb86a20s_state *state =3D fe->demodulator_priv;
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~
>> drivers/media/dvb-frontends/mb86a20s.c:738:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&c->cnr, 0, sizeof(c->cnr));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:738:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&c->cnr, 0, sizeof(c->cnr));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:739:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&c->pre_bit_error, 0, sizeof(c->pre_bit_error));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:739:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&c->pre_bit_error, 0, sizeof(c->pre_bit_error));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:740:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&c->pre_bit_count, 0, sizeof(c->pre_bit_count));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:740:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&c->pre_bit_count, 0, sizeof(c->pre_bit_count));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:741:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&c->post_bit_error, 0, sizeof(c->post_bit_error));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:741:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&c->post_bit_error, 0, sizeof(c->post_bit_error));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:742:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&c->post_bit_count, 0, sizeof(c->post_bit_count));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:742:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&c->post_bit_count, 0, sizeof(c->post_bit_count));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:743:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&c->block_error, 0, sizeof(c->block_error));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:743:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&c->block_error, 0, sizeof(c->block_error));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:744:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&c->block_count, 0, sizeof(c->block_count));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:744:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(&c->block_count, 0, sizeof(c->block_count));
                   ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:877:3: warning: Value stored to '=
rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x52, 0x00);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:877:3: note: Value stored to 'rc'=
 is never read
   drivers/media/dvb-frontends/mb86a20s.c:903:3: warning: Value stored to '=
rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x52, 0x01);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:903:3: note: Value stored to 'rc'=
 is never read
   drivers/media/dvb-frontends/mb86a20s.c:1011:3: warning: Value stored to =
'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x5e, 0x00);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:1011:3: note: Value stored to 'rc=
' is never read
   drivers/media/dvb-frontends/mb86a20s.c:1028:3: warning: Value stored to =
'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x5e, 0x07);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:1028:3: note: Value stored to 'rc=
' is never read
   drivers/media/dvb-frontends/mb86a20s.c:1526:25: warning: Value stored to=
 'state' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct mb86a20s_state *state =3D fe->demodulator_priv;
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:1526:25: note: Value stored to 's=
tate' during its initialization is never read
           struct mb86a20s_state *state =3D fe->demodulator_priv;
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:2019:25: warning: Value stored to=
 'state' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct mb86a20s_state *state =3D fe->demodulator_priv;
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:2019:25: note: Value stored to 's=
tate' during its initialization is never read
           struct mb86a20s_state *state =3D fe->demodulator_priv;
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~
>> drivers/media/dvb-frontends/mb86a20s.c:2067:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &mb86a20s_ops,
           ^~~~~~
   drivers/media/dvb-frontends/mb86a20s.c:2067:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &mb86a20s_ops,
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   security/apparmor/policy_unpack.c:211:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p, src, len);
                   ^~~~~~
   security/apparmor/policy_unpack.c:211:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p, src, len);
                   ^~~~~~
   security/apparmor/policy_unpack.c:1060:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&strm, 0, sizeof(strm));
           ^~~~~~
   security/apparmor/policy_unpack.c:1060:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&strm, 0, sizeof(strm));
           ^~~~~~
   security/apparmor/policy_unpack.c:1098:4: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dstbuf, stgbuf, strm.total_out);
                           ^~~~~~
   security/apparmor/policy_unpack.c:1098:4: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(dstbuf, stgbuf, strm.total_out);
                           ^~~~~~
   Suppressed 98 warnings (96 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (89 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   112 warnings generated.
   security/apparmor/lsm.c:641:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(args, value, size);
                   ^~~~~~
   security/apparmor/lsm.c:641:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(args, value, size);
                   ^~~~~~
   security/apparmor/lsm.c:1482:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&kp_local, kp, sizeof(kp_local));
           ^~~~~~
   security/apparmor/lsm.c:1482:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(&kp_local, kp, sizeof(kp_local));
           ^~~~~~
   security/apparmor/lsm.c:1504:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&kp_local, kp, sizeof(kp_local));
           ^~~~~~
   security/apparmor/lsm.c:1504:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(&kp_local, kp, sizeof(kp_local));
           ^~~~~~
   security/apparmor/lsm.c:1547:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buffer, "%s", audit_mode_names[aa_g_audit]);
                  ^~~~~~~
   security/apparmor/lsm.c:1547:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buffer, "%s", audit_mode_names[aa_g_audit]);
                  ^~~~~~~
   security/apparmor/lsm.c:1576:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buffer, "%s", aa_profile_mode_names[aa_g_profile_=
mode]);
                  ^~~~~~~
   security/apparmor/lsm.c:1576:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buffer, "%s", aa_profile_mode_names[aa_g_profile_=
mode]);
                  ^~~~~~~
   Suppressed 107 warnings (106 in non-user code, 1 with check filters).
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
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   lib/kobject.c:156:3: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memcpy(path + length, kobject_name(parent), cur);
                   ^~~~~~
   lib/kobject.c:156:3: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                   memcpy(path + length, kobject_name(parent), cur);
                   ^~~~~~
   lib/kobject.c:516:2: warning: Call to function 'sprintf' is insecure as =
it does not provide bounding of the memory buffer or security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   lib/kobject.c:516:2: note: Call to function 'sprintf' is insecure as it =
does not provide bounding of the memory buffer or security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   lib/kobject.c:582:2: warning: Call to function 'sprintf' is insecure as =
it does not provide bounding of the memory buffer or security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   lib/kobject.c:582:2: note: Call to function 'sprintf' is insecure as it =
does not provide bounding of the memory buffer or security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   crypto/dh_helper.c:19:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, size);
--
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/input/touchscreen/cy8ctmg110_ts.c:71:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(i2c_data + 1, value, len);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:71:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(i2c_data + 1, value, len);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:115:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(reg_p, 0, CY8CTMG110_REG_MAX);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:115:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(reg_p, 0, CY8CTMG110_REG_MAX);
           ^~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:193:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ts->phys, sizeof(ts->phys),
           ^~~~~~~~
   drivers/input/touchscreen/cy8ctmg110_ts.c:193:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ts->phys, sizeof(ts->phys),
           ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/usb/roles/class.c:232:9: warning: Call to function 'sprintf' is =
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
   Suppressed 11 warnings (11 in non-user code).
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
   24 warnings generated.
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
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
>> security/tomoyo/realpath.c:172:4: warning: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(pos, "/self", 5);
                           ^~~~~~~
   security/tomoyo/realpath.c:172:4: note: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11
                           memmove(pos, "/self", 5);
                           ^~~~~~~
>> security/tomoyo/realpath.c:196:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name) - 1, "dev(%u,%u):", MAJOR(de=
v),
                   ^~~~~~~~
   security/tomoyo/realpath.c:196:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name) - 1, "dev(%u,%u):", MAJOR(de=
v),
                   ^~~~~~~~
   security/tomoyo/realpath.c:202:3: warning: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(pos, name, name_len);
                   ^~~~~~~
   security/tomoyo/realpath.c:202:3: note: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11
                   memmove(pos, name, name_len);
                   ^~~~~~~
   security/tomoyo/realpath.c:214:3: warning: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(pos, name, name_len);
                   ^~~~~~~
   security/tomoyo/realpath.c:214:3: note: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11
                   memmove(pos, name, name_len);
                   ^~~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/verity/verify.c:48:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, virt + hoffset, hsize);
           ^~~~~~
   fs/verity/verify.c:48:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(out, virt + hoffset, hsize);
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hwtracing/coresight/coresight-cpu-debug.c:514:2: warning: Call t=
o function 'snprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'snprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           snprintf(buf, sizeof(buf), "%d\n", debug_enable);
           ^~~~~~~~
   drivers/hwtracing/coresight/coresight-cpu-debug.c:514:2: note: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11
           snprintf(buf, sizeof(buf), "%d\n", debug_enable);
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/hwtracing/intel_th/core.c:390:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(thdev->name, name);
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:390:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(thdev->name, name);
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:631:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(res, subdev->res,
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:631:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(res, subdev->res,
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:1023:35: warning: Dereference of null =
pointer [clang-analyzer-core.NullDereference]
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                            ^
   drivers/hwtracing/intel_th/intel_th.h:192:2: note: expanded from macro '=
to_intel_th_driver'
           container_of((_d), struct intel_th_driver, driver)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/hwtracing/intel_th/core.c:313:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwtracing/intel_th/core.c:313:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwtracing/intel_th/core.c:316:7: note: Assuming 'val' is 0
           if (!!val !=3D thdev->output.active) {
                ^~~~
   drivers/hwtracing/intel_th/core.c:316:6: note: Assuming the condition is=
 true
           if (!!val !=3D thdev->output.active) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:316:2: note: Taking true branch
           if (!!val !=3D thdev->output.active) {
           ^
   drivers/hwtracing/intel_th/core.c:317:7: note: 'val' is 0
                   if (val)
                       ^~~
   drivers/hwtracing/intel_th/core.c:317:3: note: Taking false branch
                   if (val)
                   ^
   drivers/hwtracing/intel_th/core.c:320:4: note: Calling 'intel_th_output_=
deactivate'
                           intel_th_output_deactivate(thdev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:279:3: note: Assuming field 'driver' i=
s non-null
                   to_intel_th_driver_or_null(thdev->dev.driver);
                   ^
   drivers/hwtracing/intel_th/intel_th.h:195:3: note: expanded from macro '=
to_intel_th_driver_or_null'
           ((_d) ? to_intel_th_driver(_d) : NULL)
            ^~~~
   drivers/hwtracing/intel_th/core.c:279:3: note: '?' condition is true
                   to_intel_th_driver_or_null(thdev->dev.driver);
                   ^
   drivers/hwtracing/intel_th/intel_th.h:195:3: note: expanded from macro '=
to_intel_th_driver_or_null'
           ((_d) ? to_intel_th_driver(_d) : NULL)
--
                  ^~~~~~~
   drivers/input/touchscreen/ad7879.c:550:2: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
           ^~~~~~~~
   drivers/input/touchscreen/ad7879.c:550:2: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
           ^~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/mtd/chips/gen_probe.c:67:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cfi, 0, sizeof(cfi));
           ^~~~~~
   drivers/mtd/chips/gen_probe.c:67:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&cfi, 0, sizeof(cfi));
           ^~~~~~
   drivers/mtd/chips/gen_probe.c:145:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(retcfi, &cfi, sizeof(cfi));
           ^~~~~~
   drivers/mtd/chips/gen_probe.c:145:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(retcfi, &cfi, sizeof(cfi));
           ^~~~~~
   drivers/mtd/chips/gen_probe.c:146:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&retcfi->chips[0], 0, sizeof(struct flchip) * cfi.numchip=
s);
           ^~~~~~
   drivers/mtd/chips/gen_probe.c:146:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&retcfi->chips[0], 0, sizeof(struct flchip) * cfi.numchip=
s);
           ^~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/mtd/chips/jedec_probe.c:1993:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cfi->cfiq, 0, sizeof(struct cfi_ident));
           ^~~~~~
   drivers/mtd/chips/jedec_probe.c:1993:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(cfi->cfiq, 0, sizeof(struct cfi_ident));
           ^~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/regulator/of_regulator.c:67:4: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(prop, 255, props[i], lvl[j]);
                           ^~~~~~~~
   drivers/regulator/of_regulator.c:67:4: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(prop, 255, props[i], lvl[j]);
                           ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (20 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/watchdog/ziirave_wdt.c:244:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(packet + 3, data, len);
           ^~~~~~
   drivers/watchdog/ziirave_wdt.c:244:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(packet + 3, data, len);
           ^~~~~~
   drivers/watchdog/ziirave_wdt.c:245:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(packet + 3 + len, 0, ZIIRAVE_FIRM_PKT_DATA_SIZE - len);
           ^~~~~~
   drivers/watchdog/ziirave_wdt.c:245:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(packet + 3 + len, 0, ZIIRAVE_FIRM_PKT_DATA_SIZE - len);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/media/tuners/it913x.c:151:26: warning: Value stored to 'pdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:151:26: note: Value stored to 'pdev' durin=
g its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:210:26: warning: Value stored to 'pdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:210:26: note: Value stored to 'pdev' durin=
g its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
>> drivers/media/tuners/it913x.c:402:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &it913x_tuner_ops,
           ^~~~~~
   drivers/media/tuners/it913x.c:402:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &it913x_tuner_ops,
           ^~~~~~
>> drivers/media/tuners/it913x.c:429:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   drivers/media/tuners/it913x.c:429:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (89 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   106 warnings generated.
   security/apparmor/label.c:47:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(proxy, 0, sizeof(*proxy));
                   ^~~~~~
   security/apparmor/label.c:47:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(proxy, 0, sizeof(*proxy));
                   ^~~~~~
   security/apparmor/label.c:810:3: warning: Value stored to 'res' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   res =3D __label_remove(old, new);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/label.c:810:3: note: Value stored to 'res' is never re=
ad
                   res =3D __label_remove(old, new);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/label.c:1102:7: warning: Access to field 'ns' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           ls =3D labels_set(new);
                ^
   security/apparmor/include/label.h:146:25: note: expanded from macro 'lab=
els_set'
   #define labels_set(X) (&labels_ns(X)->labels)
                           ^
   security/apparmor/include/label.h:145:22: note: expanded from macro 'lab=
els_ns'
   #define labels_ns(X) (vec_ns(&((X)->vec[0]), (X)->size))
                        ^
   security/apparmor/label.c:1222:2: note: Taking false branch
           AA_BUG(!a);
           ^
   security/apparmor/include/lib.h:37:3: note: expanded from macro 'AA_BUG'
                   AA_BUG_FMT((X), "" args);                               =
    \
                   ^
   security/apparmor/include/lib.h:44:37: note: expanded from macro 'AA_BUG=
_FMT'
   #define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/apparmor/label.c:1222:2: note: Loop condition is false.  Exitin=
g loop
           AA_BUG(!a);
           ^
   security/apparmor/include/lib.h:35:2: note: expanded from macro 'AA_BUG'
           do {                                                            =
    \
           ^
   security/apparmor/label.c:1223:2: note: Taking false branch
           AA_BUG(!b);
           ^
   security/apparmor/include/lib.h:37:3: note: expanded from macro 'AA_BUG'
                   AA_BUG_FMT((X), "" args);                               =
    \
                   ^
   security/apparmor/include/lib.h:44:37: note: expanded from macro 'AA_BUG=
_FMT'
   #define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/apparmor/label.c:1223:2: note: Loop condition is false.  Exitin=
g loop
           AA_BUG(!b);
           ^
   security/apparmor/include/lib.h:35:2: note: expanded from macro 'AA_BUG'
           do {                                                            =
    \
           ^
   security/apparmor/label.c:1225:6: note: Assuming 'a' is not equal to 'b'
           if (a =3D=3D b)
               ^~~~~~
   security/apparmor/label.c:1225:2: note: Taking false branch
           if (a =3D=3D b)
           ^
   security/apparmor/label.c:1234:7: note: 'label' is null
           if (!label) {
                ^~~~~
   security/apparmor/label.c:1234:2: note: Taking true branch
           if (!label) {
           ^
   security/apparmor/label.c:1244:8: note: 'new' is non-null
                   if (!new)
                        ^~~
   security/apparmor/label.c:1244:3: note: Taking false branch
                   if (!new)
                   ^
   security/apparmor/label.c:1247:11: note: Calling 'label_merge_insert'
                   label =3D label_merge_insert(new, a, b);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/label.c:1055:6: note: 'k' initialized to 0
           int k =3D 0, invcount =3D 0;
               ^
   security/apparmor/label.c:1058:2: note: Taking false branch
           AA_BUG(!a);
           ^
   security/apparmor/include/lib.h:37:3: note: expanded from macro 'AA_BUG'
                   AA_BUG_FMT((X), "" args);                               =
    \
                   ^
   security/apparmor/include/lib.h:44:37: note: expanded from macro 'AA_BUG=
_FMT'
   #define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
--
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/include/label.h:33:15: note: expanded from macro 'vec_=
setup'
                   for (i =3D 0; i < (N); i++)                             =
  \
                               ^~~~~~~
   security/apparmor/mount.c:707:11: note: Loop condition is false. Executi=
on continues on line 707
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:233:7: note: expanded from macro 'fn_lab=
el_build'
                   if (vec_setup(label, __lvec, (L)->size, (GFP))) {       \
                       ^
   security/apparmor/include/label.h:33:3: note: expanded from macro 'vec_s=
etup'
                   for (i =3D 0; i < (N); i++)                             =
  \
                   ^
   security/apparmor/mount.c:707:11: note: '__lvec' is non-null
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:233:24: note: expanded from macro 'fn_la=
bel_build'
                   if (vec_setup(label, __lvec, (L)->size, (GFP))) {       \
                                        ^~~~~~
   security/apparmor/include/label.h:37:3: note: expanded from macro 'vec_s=
etup'
           (V) ? 0 : -ENOMEM;                                              \
            ^
   security/apparmor/mount.c:707:11: note: '?' condition is true
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:233:7: note: expanded from macro 'fn_lab=
el_build'
                   if (vec_setup(label, __lvec, (L)->size, (GFP))) {       \
                       ^
   security/apparmor/include/label.h:37:2: note: expanded from macro 'vec_s=
etup'
           (V) ? 0 : -ENOMEM;                                              \
           ^
   security/apparmor/mount.c:707:11: note: Taking false branch
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:233:3: note: expanded from macro 'fn_lab=
el_build'
                   if (vec_setup(label, __lvec, (L)->size, (GFP))) {       \
                   ^
   security/apparmor/mount.c:707:11: note: Loop condition is false. Executi=
on continues on line 707
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:238:3: note: expanded from macro 'fn_lab=
el_build'
                   label_for_each(__i, (L), (P)) {                         \
                   ^
   security/apparmor/include/label.h:155:2: note: expanded from macro 'labe=
l_for_each'
           for ((I).i =3D 0; ((P) =3D (L)->vec[(I).i]); ++((I).i))
           ^
   security/apparmor/mount.c:707:11: note: The value 0 is assigned to '__j'
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:245:8: note: expanded from macro 'fn_lab=
el_build'
                   for (__j =3D __count =3D 0; __j < (L)->size; __j++)     =
    \
                        ^~~~~~~~~~~~~~~~~
   security/apparmor/mount.c:707:11: note: Loop condition is true.  Enterin=
g loop body
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:245:3: note: expanded from macro 'fn_lab=
el_build'
                   for (__j =3D __count =3D 0; __j < (L)->size; __j++)     =
    \
                   ^
   security/apparmor/mount.c:707:11: note: Access to field 'size' results i=
n a dereference of a null pointer
           target =3D fn_label_build(label, profile, GFP_KERNEL,
                    ^
   security/apparmor/include/lib.h:246:15: note: expanded from macro 'fn_la=
bel_build'
                           __count +=3D __lvec[__j]->size;                 =
  \
                                      ^~~~~~~~~~~~~~~~~
   Suppressed 90 warnings (89 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/dvb-frontends/mt312.c:106:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], src, count);
           ^~~~~~
   drivers/media/dvb-frontends/mt312.c:106:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], src, count);
           ^~~~~~
   drivers/media/dvb-frontends/mt312.c:796:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &mt312_ops,
           ^~~~~~
   drivers/media/dvb-frontends/mt312.c:796:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &mt312_ops,
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
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
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   drivers/bluetooth/hci_vhci.c:76:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   drivers/bluetooth/hci_vhci.c:76:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
>> drivers/bluetooth/bfusb.c:472:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   drivers/bluetooth/bfusb.c:472:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   drivers/bluetooth/bfusb.c:550:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, firmware + sent, size);
                   ^~~~~~
   drivers/bluetooth/bfusb.c:550:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, firmware + sent, size);
                   ^~~~~~
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   drivers/bluetooth/btmrvl_main.c:575:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + 2, bdaddr, sizeof(bdaddr_t));
           ^~~~~~
   drivers/bluetooth/btmrvl_main.c:575:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + 2, bdaddr, sizeof(bdaddr_t));
           ^~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/leds/trigger/ledtrig-pattern.c:230:12: warning: Call to function=
 'sscanf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ccount =3D sscanf(buf + offset, "%u %u %n",
                            ^~~~~~
   drivers/leds/trigger/ledtrig-pattern.c:230:12: note: Call to function 's=
scanf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sscanf_s' in case of C11
                   ccount =3D sscanf(buf + offset, "%u %u %n",
                            ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/firmware/dmi_scan.c:78:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(str, bp);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:78:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(str, bp);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:213:2: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(s, "%u.%u", *major, *minor);
           ^~~~~~~
   drivers/firmware/dmi_scan.c:213:2: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           sprintf(s, "%u.%u", *major, *minor);
           ^~~~~~~
   drivers/firmware/dmi_scan.c:249:3: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(s, "%pUl", d);
                   ^~~~~~~
   drivers/firmware/dmi_scan.c:249:3: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   sprintf(s, "%pUl", d);
                   ^~~~~~~
   drivers/firmware/dmi_scan.c:251:3: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(s, "%pUb", d);
                   ^~~~~~~
   drivers/firmware/dmi_scan.c:251:3: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   sprintf(s, "%pUb", d);
                   ^~~~~~~
   drivers/firmware/dmi_scan.c:270:2: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(s, "%u", *d & 0x7F);
           ^~~~~~~
   drivers/firmware/dmi_scan.c:270:2: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           sprintf(s, "%u", *d & 0x7F);
           ^~~~~~~
   drivers/firmware/dmi_scan.c:287:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)(dev + 1), name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:287:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)(dev + 1), name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:344:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, dm, dm->length);
           ^~~~~~
   drivers/firmware/dmi_scan.c:344:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, dm, dm->length);
           ^~~~~~
   drivers/firmware/dmi_scan.c:376:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)&dev[1], name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:376:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)&dev[1], name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:555:2: warning: Value stored to 'c' is never=
 read [clang-analyzer-deadcode.DeadStores]
           c +=3D print_filtered(buf + c, len - c,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/dmi_scan.c:555:2: note: Value stored to 'c' is never re=
ad
           c +=3D print_filtered(buf + c, len - c,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/dmi_scan.c:574:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(smbios_entry_point, buf, smbios_entry_point_size);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:574:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(smbios_entry_point, buf, smbios_entry_point_size);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:611:5: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(smbios_entry_point, buf,
                                   ^~~~~~
   drivers/firmware/dmi_scan.c:611:5: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(smbios_entry_point, buf,
--
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:143:6: note: 'out_sgs' is null
           if (out_sgs)
               ^~~~~~~
   sound/virtio/virtio_ctl_msg.c:143:2: note: Taking false branch
           if (out_sgs)
           ^
   sound/virtio/virtio_ctl_msg.c:147:6: note: 'in_sgs' is non-null
           if (in_sgs)
               ^~~~~~
   sound/virtio/virtio_ctl_msg.c:147:2: note: Taking true branch
           if (in_sgs)
           ^
   sound/virtio/virtio_ctl_msg.c:150:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   sound/virtio/virtio_ctl_msg.c:150:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   sound/virtio/virtio_ctl_msg.c:153:6: note: Assuming 'rc' is not equal to=
 0
           if (!rc) {
               ^~~
   sound/virtio/virtio_ctl_msg.c:153:2: note: Taking false branch
           if (!rc) {
           ^
   sound/virtio/virtio_ctl_msg.c:160:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   sound/virtio/virtio_ctl_msg.c:160:2: note: Taking true branch
           if (rc) {
           ^
   sound/virtio/virtio_ctl_msg.c:161:3: note: Loop condition is false.  Exi=
ting loop
                   dev_err(&vdev->dev, "failed to send control message (0x%=
08x)\n",
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
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
   sound/virtio/virtio_ctl_msg.c:168:3: note: Calling 'virtsnd_ctl_msg_unre=
f'
                   virtsnd_ctl_msg_unref(msg);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:48:2: note: Taking true branch
           if (refcount_dec_and_test(&msg->ref_count))
           ^
   sound/virtio/virtio_ctl_msg.c:49:3: note: Memory is released
                   kfree(msg);
                   ^~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:168:3: note: Returning; memory was release=
d via 1st parameter
                   virtsnd_ctl_msg_unref(msg);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:170:3: note: Control jumps to line 207
                   goto on_exit;
                   ^
   sound/virtio/virtio_ctl_msg.c:207:2: note: Use of memory after it is fre=
ed
           virtsnd_ctl_msg_unref(msg);
           ^                     ~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/misc/apds9802als.c:42:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "4095\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:42:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "4095\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:44:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "65535\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:44:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "65535\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:101:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/misc/apds9802als.c:101:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
>> net/bluetooth/amp.c:196:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&keybuf[0], key->val, HCI_LINK_KEY_SIZE);
           ^~~~~~
   net/bluetooth/amp.c:196:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&keybuf[0], key->val, HCI_LINK_KEY_SIZE);
           ^~~~~~
   net/bluetooth/amp.c:197:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&keybuf[HCI_LINK_KEY_SIZE], key->val, HCI_LINK_KEY_SIZE);
           ^~~~~~
   net/bluetooth/amp.c:197:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&keybuf[HCI_LINK_KEY_SIZE], key->val, HCI_LINK_KEY_SIZE);
           ^~~~~~
   net/bluetooth/amp.c:208:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, gamp_key, HCI_AMP_LINK_KEY_SIZE);
                   ^~~~~~
   net/bluetooth/amp.c:208:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(data, gamp_key, HCI_AMP_LINK_KEY_SIZE);
                   ^~~~~~
   net/bluetooth/amp.c:234:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(assoc->data + assoc->offset, rp->frag, frag_len);
                   ^~~~~~
   net/bluetooth/amp.c:234:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(assoc->data + assoc->offset, rp->frag, frag_len);
                   ^~~~~~
   net/bluetooth/amp.c:243:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(assoc->data + assoc->offset, rp->frag, rem_len);
           ^~~~~~
   net/bluetooth/amp.c:243:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(assoc->data + assoc->offset, rp->frag, rem_len);
           ^~~~~~
>> net/bluetooth/amp.c:279:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hdev->loc_assoc, 0, sizeof(struct amp_assoc));
           ^~~~~~
   net/bluetooth/amp.c:279:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&hdev->loc_assoc, 0, sizeof(struct amp_assoc));
           ^~~~~~
   net/bluetooth/amp.c:280:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/amp.c:280:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/amp.c:369:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cp->frag, ctrl->assoc, frag_len);
           ^~~~~~
   net/bluetooth/amp.c:369:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(cp->frag, ctrl->assoc, frag_len);
           ^~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/w1/slaves/w1_ds250x.c:161:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &data->eprom[off], count);
           ^~~~~~
   drivers/w1/slaves/w1_ds250x.c:161:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &data->eprom[off], count);
           ^~~~~~
   drivers/w1/slaves/w1_ds250x.c:201:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:201:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:206:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:206:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   net/ethtool/bitset.c:17:17: warning: The result of the right shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'u32' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return ~(u32)0 >> (32 - n % 32);
                          ^
   net/ethtool/bitset.c:829:9: note: Calling 'ethnl_update_bitset32'
           return ethnl_update_bitset32((u32 *)bitmap, nbits, attr, names, =
extack,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/ethtool/bitset.c:561:6: note: Assuming 'attr' is non-null
           if (!attr)
               ^~~~~
   net/ethtool/bitset.c:561:2: note: Taking false branch
           if (!attr)
           ^
   net/ethtool/bitset.c:565:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/ethtool/bitset.c:565:2: note: Taking false branch
           if (ret < 0)
           ^
   net/ethtool/bitset.c:568:6: note: Assuming the condition is false
           if (tb[ETHTOOL_A_BITSET_BITS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/bitset.c:568:2: note: Taking false branch
           if (tb[ETHTOOL_A_BITSET_BITS])
           ^
   net/ethtool/bitset.c:572:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   net/ethtool/bitset.c:572:2: note: Taking false branch
           if (ret < 0)
           ^
   net/ethtool/bitset.c:576:16: note: '__UNIQUE_ID___x431' is >=3D '__UNIQU=
E_ID___y432'
           change_bits =3D min_t(unsigned int,
                         ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
--
           ^~~~~~
   drivers/devfreq/devfreq.c:1752:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(df->stats.trans_table, 0, array3_size(sizeof(unsigned int=
),
           ^~~~~~
   drivers/devfreq/devfreq.c:1752:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(df->stats.trans_table, 0, array3_size(sizeof(unsigned int=
),
           ^~~~~~
   drivers/devfreq/devfreq.c:1785:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", df->profile->polling_ms);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1785:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", df->profile->polling_ms);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1799:8: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%u", &value);
                 ^~~~~~
   drivers/devfreq/devfreq.c:1799:8: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%u", &value);
                 ^~~~~~
   drivers/devfreq/devfreq.c:1818:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", timer_name[df->profile->timer]);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1818:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", timer_name[df->profile->timer]);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1832:8: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%16s", str_timer);
                 ^~~~~~
   drivers/devfreq/devfreq.c:1832:8: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%16s", str_timer);
                 ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/usb/usbip/vhci_tx.c:31:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(pdup->u.cmd_submit.setup, urb->setup_packet, 8);
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:31:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(pdup->u.cmd_submit.setup, urb->setup_packet, 8);
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:73:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&pdu_header, 0, sizeof(pdu_header));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:73:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(&pdu_header, 0, sizeof(pdu_header));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:74:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&msg, 0, sizeof(msg));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:74:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(&msg, 0, sizeof(msg));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:75:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&iov, 0, sizeof(iov));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:75:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(&iov, 0, sizeof(iov));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:200:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&pdu_header, 0, sizeof(pdu_header));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:200:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(&pdu_header, 0, sizeof(pdu_header));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:201:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&msg, 0, sizeof(msg));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:201:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(&msg, 0, sizeof(msg));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:202:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&iov, 0, sizeof(iov));
                   ^~~~~~
   drivers/usb/usbip/vhci_tx.c:202:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(&iov, 0, sizeof(iov));
                   ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   security/smack/smack_lsm.c:729:5: warning: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memmove(to, from, len);
                                   ^~~~~~~
   security/smack/smack_lsm.c:729:5: note: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11
                                   memmove(to, from, len);
                                   ^~~~~~~
   security/smack/smack_lsm.c:1469:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer, XATTR_NAME_SMACK, len);
                   ^~~~~~
   security/smack/smack_lsm.c:1469:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer, XATTR_NAME_SMACK, len);
                   ^~~~~~
   security/smack/smack_lsm.c:2857:4: warning: Value stored to 'rc' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           rc =3D smk_ipv6_check(ssp->smk_out, rsp, sip,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smack_lsm.c:2857:4: note: Value stored to 'rc' is never r=
ead
                           rc =3D smk_ipv6_check(ssp->smk_out, rsp, sip,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 94 warnings (93 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
>> security/smack/smack_access.c:472:2: warning: Call to function 'strncpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(smack, string, i);
           ^~~~~~~
   security/smack/smack_access.c:472:2: note: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11
           strncpy(smack, string, i);
           ^~~~~~~
   Suppressed 93 warnings (92 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   114 warnings generated.
>> security/smack/smackfs.c:887:8: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(rule, "%d", &maplevel);
                 ^~~~~~
   security/smack/smackfs.c:887:8: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(rule, "%d", &maplevel);
                 ^~~~~~
   security/smack/smackfs.c:897:8: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(rule, "%d", &catlen);
                 ^~~~~~
   security/smack/smackfs.c:897:8: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(rule, "%d", &catlen);
                 ^~~~~~
>> security/smack/smackfs.c:905:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mapcatset, 0, sizeof(mapcatset));
           ^~~~~~
   security/smack/smackfs.c:905:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(mapcatset, 0, sizeof(mapcatset));
           ^~~~~~
   security/smack/smackfs.c:913:9: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(rule, "%u", &cat);
                         ^~~~~~
   security/smack/smackfs.c:913:9: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(rule, "%u", &cat);
                         ^~~~~~
>> security/smack/smackfs.c:1186:7: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd/%u %s",
                ^~~~~~
   security/smack/smackfs.c:1186:7: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
           rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd/%u %s",
                ^~~~~~
   security/smack/smackfs.c:1189:8: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd %s",
                        ^~~~~~
   security/smack/smackfs.c:1189:8: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
                   rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd %s",
                        ^~~~~~
   security/smack/smackfs.c:1195:3: warning: Value stored to 'm' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   m =3D BEBITS;
                   ^
   security/smack/smackfs.c:1195:3: note: Value stored to 'm' is never read
   security/smack/smackfs.c:1446:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x/%u %s",
               ^~~~~~
   security/smack/smackfs.c:1446:6: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
           i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x/%u %s",
               ^~~~~~
   security/smack/smackfs.c:1451:7: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x %s",
                       ^~~~~~
   security/smack/smackfs.c:1451:7: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
                   i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x %s",
                       ^~~~~~
>> security/smack/smackfs.c:1579:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", smk_cipso_doi_value);
           ^~~~~~~
   security/smack/smackfs.c:1579:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", smk_cipso_doi_value);
           ^~~~~~~
   security/smack/smackfs.c:1611:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1611:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1645:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", smack_cipso_direct);
           ^~~~~~~
   security/smack/smackfs.c:1645:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", smack_cipso_direct);
           ^~~~~~~
   security/smack/smackfs.c:1678:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1678:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1723:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", smack_cipso_mapped);
           ^~~~~~~
   security/smack/smackfs.c:1723:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", smack_cipso_mapped);
           ^~~~~~~
   security/smack/smackfs.c:1756:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1756:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:2161:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d\n", log_policy);
           ^~~~~~~
   security/smack/smackfs.c:2161:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d\n", log_policy);
           ^~~~~~~
   security/smack/smackfs.c:2192:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:2192:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:2313:9: warning: 1st function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
                   res =3D smk_access(rule.smk_subject, rule.smk_object,
                         ^
   security/smack/smackfs.c:2341:9: note: Calling 'smk_user_access'
           return smk_user_access(file, buf, count, ppos, SMK_FIXED24_FMT);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2298:6: note: Calling 'IS_ERR'
           if (IS_ERR(data))
               ^~~~~~~~~~~~
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
   security/smack/smackfs.c:2298:6: note: Returning from 'IS_ERR'
           if (IS_ERR(data))
               ^~~~~~~~~~~~
   security/smack/smackfs.c:2298:2: note: Taking false branch
           if (IS_ERR(data))
           ^
   security/smack/smackfs.c:2301:6: note: 'format' is equal to SMK_FIXED24_=
FMT
           if (format =3D=3D SMK_FIXED24_FMT) {
               ^~~~~~
   security/smack/smackfs.c:2301:2: note: Taking true branch
           if (format =3D=3D SMK_FIXED24_FMT) {
           ^
   security/smack/smackfs.c:2302:7: note: Assuming the condition is false
                   if (count < SMK_LOADLEN)
                       ^~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2302:3: note: Taking false branch
                   if (count < SMK_LOADLEN)
                   ^
   security/smack/smackfs.c:2304:9: note: Calling 'smk_parse_rule'
                   res =3D smk_parse_rule(data, &rule, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:372:7: note: Calling 'smk_fill_rule'
           rc =3D smk_fill_rule(data, data + SMK_LABELLEN,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:322:6: note: 'import' is 0
           if (import) {
               ^~~~~~
   security/smack/smackfs.c:322:2: note: Taking false branch
           if (import) {
           ^
   security/smack/smackfs.c:332:3: note: Taking true branch
                   if (IS_ERR(cp))
--
           ^~~~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   net/strparser/strparser.c:161:5: warning: Value stored to 'head' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                                   head =3D skb;
                                   ^      ~~~
   net/strparser/strparser.c:161:5: note: Value stored to 'head' is never r=
ead
                                   head =3D skb;
                                   ^      ~~~
   net/strparser/strparser.c:187:4: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(stm, 0, sizeof(*stm));
                           ^~~~~~
   net/strparser/strparser.c:187:4: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                           memset(stm, 0, sizeof(*stm));
                           ^~~~~~
   net/strparser/strparser.c:463:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(strp, 0, sizeof(*strp));
           ^~~~~~
   net/strparser/strparser.c:463:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(strp, 0, sizeof(*strp));
           ^~~~~~
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
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
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
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
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/input/touchscreen/mtouch.c:140:2: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mtouch->phys, sizeof(mtouch->phys), "%s/input0", serio-=
>phys);
           ^~~~~~~~
   drivers/input/touchscreen/mtouch.c:140:2: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(mtouch->phys, sizeof(mtouch->phys), "%s/input0", serio-=
>phys);
           ^~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/input/touchscreen/usbtouchscreen.c:863:24: warning: Value stored=
 to 'intf' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct usb_interface *intf =3D dev->interface;
                                 ^~~~   ~~~~~~~~~~~~~~
   drivers/input/touchscreen/usbtouchscreen.c:863:24: note: Value stored to=
 'intf' during its initialization is never read
           struct usb_interface *intf =3D dev->interface;
                                 ^~~~   ~~~~~~~~~~~~~~
>> drivers/input/touchscreen/usbtouchscreen.c:1435:4: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(usbtouch->buffer + usbtouch->buf_len, pkt=
, append);
                           ^~~~~~
   drivers/input/touchscreen/usbtouchscreen.c:1435:4: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(usbtouch->buffer + usbtouch->buf_len, pkt=
, append);
                           ^~~~~~
   drivers/input/touchscreen/usbtouchscreen.c:1448:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(usbtouch->buffer + usbtouch->buf_len, pkt, tmp);
                   ^~~~~~
   drivers/input/touchscreen/usbtouchscreen.c:1448:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(usbtouch->buffer + usbtouch->buf_len, pkt, tmp);
                   ^~~~~~
   drivers/input/touchscreen/usbtouchscreen.c:1476:4: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(usbtouch->buffer, buffer + pos, buf_len -=
 pos);
                           ^~~~~~
   drivers/input/touchscreen/usbtouchscreen.c:1476:4: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(usbtouch->buffer, buffer + pos, buf_len -=
 pos);
                           ^~~~~~
>> drivers/input/touchscreen/usbtouchscreen.c:1717:3: warning: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(usbtouch->name, sizeof(usbtouch->name),
                   ^~~~~~~~
   drivers/input/touchscreen/usbtouchscreen.c:1717:3: note: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(usbtouch->name, sizeof(usbtouch->name),
                   ^~~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   111 warnings generated.
   net/core/net-sysfs.c:106:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   NETDEVICE_SHOW_RO(dev_id, fmt_hex);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:106:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   NETDEVICE_SHOW_RO(dev_id, fmt_hex);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:107:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   NETDEVICE_SHOW_RO(dev_port, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:107:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   NETDEVICE_SHOW_RO(dev_port, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:108:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   NETDEVICE_SHOW_RO(addr_assign_type, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:108:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   NETDEVICE_SHOW_RO(addr_assign_type, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:109:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   NETDEVICE_SHOW_RO(addr_len, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:109:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   NETDEVICE_SHOW_RO(addr_len, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:110:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   NETDEVICE_SHOW_RO(ifindex, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:110:1: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
   NETDEVICE_SHOW_RO(ifindex, fmt_dec);
   ^
   net/core/net-sysfs.c:68:52: note: expanded from macro 'NETDEVICE_SHOW_RO'
   #define NETDEVICE_SHOW_RO(field, format_string)                         \
                                                                           ^
   net/core/net-sysfs.c:60:9: note: expanded from macro '\NETDEVICE_SHOW'
           return sprintf(buf, format_string, dev->field);                 \
                  ^~~~~~~
   net/core/net-sysfs.c:111:1: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
   NETDEVICE_SHOW_RO(type, fmt_dec);
--
                   ^     ~~~~
   drivers/media/tuners/si2157.c:647:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "palI";
                   ^     ~~~~~~
   drivers/media/tuners/si2157.c:647:3: note: Value stored to 'std' is neve=
r read
                   std =3D "palI";
                   ^     ~~~~~~
   drivers/media/tuners/si2157.c:652:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "palDK";
                   ^     ~~~~~~~
   drivers/media/tuners/si2157.c:652:3: note: Value stored to 'std' is neve=
r read
                   std =3D "palDK";
                   ^     ~~~~~~~
   drivers/media/tuners/si2157.c:657:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:657:4: note: Value stored to 'std' is neve=
r read
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:661:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:661:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:667:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:667:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:673:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:673:3: note: Value stored to 'std' is neve=
r read
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:684:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x03\x06\x08\x02", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:684:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x03\x06\x08\x02", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:698:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x0d\x06\x94\x64", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:698:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x0d\x06\x94\x64", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:712:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x0C\x06", 4);
           ^~~~~~
   drivers/media/tuners/si2157.c:712:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x0C\x06", 4);
           ^~~~~~
   drivers/media/tuners/si2157.c:722:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x07\x06\x32\xc8", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:722:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x07\x06\x32\xc8", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:730:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:730:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:742:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x41\x01\x00\x00\x00\x00\x00\x00", 8);
           ^~~~~~
   drivers/media/tuners/si2157.c:742:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x41\x01\x00\x00\x00\x00\x00\x00", 8);
           ^~~~~~
   drivers/media/tuners/si2157.c:806:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:806:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:861:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:861:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:911:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_=
ops));
           ^~~~~~
   drivers/media/tuners/si2157.c:911:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_=
ops));
           ^~~~~~
   drivers/media/tuners/si2157.c:969:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   drivers/media/tuners/si2157.c:969:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   Suppressed 47 warnings (45 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
>> drivers/i2c/busses/i2c-cp2615.c:92:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&ret->data, data, data_len);
                   ^~~~~~
   drivers/i2c/busses/i2c-cp2615.c:92:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&ret->data, data, data_len);
                   ^~~~~~
   drivers/i2c/busses/i2c-cp2615.c:165:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &i2c_r->data, i2c_r->read_len);
                   ^~~~~~
   drivers/i2c/busses/i2c-cp2615.c:165:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &i2c_r->data, i2c_r->read_len);
                   ^~~~~~
   drivers/i2c/busses/i2c-cp2615.c:234:4: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&i2c_w.data, msg->buf, i2c_w.write_len);
                           ^~~~~~
   drivers/i2c/busses/i2c-cp2615.c:234:4: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&i2c_w.data, msg->buf, i2c_w.write_len);
                           ^~~~~~
>> drivers/i2c/busses/i2c-cp2615.c:301:2: warning: Call to function 'strncp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(adap->name, usbdev->serial, sizeof(adap->name) - 1);
           ^~~~~~~
   drivers/i2c/busses/i2c-cp2615.c:301:2: note: Call to function 'strncpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'strncpy_s' in case of C11
           strncpy(adap->name, usbdev->serial, sizeof(adap->name) - 1);
           ^~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/tuners/mxl301rf.c:300:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->cfg, cfg, sizeof(state->cfg));
           ^~~~~~
   drivers/media/tuners/mxl301rf.c:300:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->cfg, cfg, sizeof(state->cfg));
           ^~~~~~
   drivers/media/tuners/mxl301rf.c:303:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &mxl301rf_ops, sizeof(mxl301rf_ops));
           ^~~~~~
   drivers/media/tuners/mxl301rf.c:303:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &mxl301rf_ops, sizeof(mxl301rf_ops));
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/tuners/qm1d1b0004.c:167:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->cfg, priv_cfg, sizeof(state->cfg));
           ^~~~~~
   drivers/media/tuners/qm1d1b0004.c:167:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->cfg, priv_cfg, sizeof(state->cfg));
           ^~~~~~
   drivers/media/tuners/qm1d1b0004.c:217:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &qm1d1b0004_ops, sizeof(fe->ops.tuner=
_ops));
           ^~~~~~
   drivers/media/tuners/qm1d1b0004.c:217:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &qm1d1b0004_ops, sizeof(fe->ops.tuner=
_ops));
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/input/serio/libps2.c:245:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(send_param, param, send);
           ^~~~~~
   drivers/input/serio/libps2.c:245:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(send_param, param, send);
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/input/serio/apbps2.c:180:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(priv->io->phys, sizeof(priv->io->phys),
           ^~~~~~~~
   drivers/input/serio/apbps2.c:180:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(priv->io->phys, sizeof(priv->io->phys),
           ^~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/joystick/a3d.c:94:44: warning: The left operand of '<<' is=
 a garbage value due to array index out of bounds [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
           return (csum & 0x3f) !=3D ((data[count - 2] << 3) | data[count -=
 1]);
                                                     ^
   drivers/input/joystick/a3d.c:257:6: note: Assuming 'a3d' is non-null
           if (!a3d || !input_dev) {
               ^~~~
   drivers/input/joystick/a3d.c:257:6: note: Left side of '||' is false
   drivers/input/joystick/a3d.c:257:14: note: Assuming 'input_dev' is non-n=
ull
           if (!a3d || !input_dev) {
                       ^~~~~~~~~~
   drivers/input/joystick/a3d.c:257:2: note: Taking false branch
           if (!a3d || !input_dev) {
           ^
   drivers/input/joystick/a3d.c:268:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/input/joystick/a3d.c:268:2: note: Taking false branch
           if (err)
           ^
   drivers/input/joystick/a3d.c:271:6: note: Calling 'a3d_read_packet'
           i =3D a3d_read_packet(gameport, A3D_MAX_LENGTH, data);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/a3d.c:66:2: note: Loop condition is false.  Exiti=
ng loop
           local_irq_save(flags);
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
   drivers/input/joystick/a3d.c:66:2: note: Loop condition is false.  Exiti=
ng loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/input/joystick/a3d.c:70:9: note: Assuming 't' is > 0
           while (t > 0 && i < length) {
                  ^~~~~
   drivers/input/joystick/a3d.c:70:9: note: Left side of '&&' is true
   drivers/input/joystick/a3d.c:70:2: note: Loop condition is true.  Enteri=
ng loop body
           while (t > 0 && i < length) {
           ^
--
                   ^                              ~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/test-drivers/vivid/vivid-osd.c:76:3: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&vblank, 0, sizeof(vblank));
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-osd.c:76:3: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&vblank, 0, sizeof(vblank));
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-osd.c:112:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fix, 0, sizeof(struct fb_fix_screeninfo));
           ^~~~~~
   drivers/media/test-drivers/vivid/vivid-osd.c:112:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(fix, 0, sizeof(struct fb_fix_screeninfo));
           ^~~~~~
   Suppressed 60 warnings (59 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/i2c/i2c-slave-eeprom.c:102:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &eeprom->buffer[off], count);
           ^~~~~~
   drivers/i2c/i2c-slave-eeprom.c:102:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &eeprom->buffer[off], count);
           ^~~~~~
   drivers/i2c/i2c-slave-eeprom.c:117:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&eeprom->buffer[off], buf, count);
           ^~~~~~
   drivers/i2c/i2c-slave-eeprom.c:117:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&eeprom->buffer[off], buf, count);
           ^~~~~~
   drivers/i2c/i2c-slave-eeprom.c:138:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(eeprom->buffer, 0xff, size);
                   ^~~~~~
   drivers/i2c/i2c-slave-eeprom.c:138:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(eeprom->buffer, 0xff, size);
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
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
                  ^~~~~~~
   drivers/leds/led-class-flash.c:182:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->timeout.max);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:182:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->timeout.max);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:203:14: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
                           buf_len =3D sprintf(pbuf, "%s ",
                                     ^~~~~~~
   drivers/leds/led-class-flash.c:203:14: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
                           buf_len =3D sprintf(pbuf, "%s ",
                                     ^~~~~~~
   drivers/leds/led-class-flash.c:210:16: warning: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           return strlen(strcat(buf, "\n"));
                         ^~~~~~
   drivers/leds/led-class-flash.c:210:16: note: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119
           return strlen(strcat(buf, "\n"));
                         ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   net/bluetooth/sco.c:1008:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&cinfo, 0, sizeof(cinfo));
                   ^~~~~~
   net/bluetooth/sco.c:1008:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&cinfo, 0, sizeof(cinfo));
                   ^~~~~~
   net/bluetooth/sco.c:1010:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cinfo.dev_class, sco_pi(sk)->conn->hcon->dev_clas=
s, 3);
                   ^~~~~~
   net/bluetooth/sco.c:1010:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(cinfo.dev_class, sco_pi(sk)->conn->hcon->dev_clas=
s, 3);
                   ^~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
>> net/bluetooth/a2mp.c:37:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd->data, data, len);
           ^~~~~~
   net/bluetooth/a2mp.c:37:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(cmd->data, data, len);
           ^~~~~~
>> net/bluetooth/a2mp.c:57:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   net/bluetooth/a2mp.c:57:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   net/bluetooth/a2mp.c:230:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&req, 0, sizeof(req));
                           ^~~~~~
   net/bluetooth/a2mp.c:230:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(&req, 0, sizeof(req));
                           ^~~~~~
   net/bluetooth/a2mp.c:311:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rsp, 0, sizeof(rsp));
                   ^~~~~~
   net/bluetooth/a2mp.c:311:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&rsp, 0, sizeof(rsp));
                   ^~~~~~
   net/bluetooth/a2mp.c:356:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^~~~~~
   net/bluetooth/a2mp.c:356:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^~~~~~
   net/bluetooth/a2mp.c:385:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rsp, 0, sizeof(rsp));
                   ^~~~~~
   net/bluetooth/a2mp.c:385:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&rsp, 0, sizeof(rsp));
                   ^~~~~~
   net/bluetooth/a2mp.c:486:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:486:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:567:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:567:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:691:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rej, 0, sizeof(rej));
                   ^~~~~~
   net/bluetooth/a2mp.c:691:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&rej, 0, sizeof(rej));
                   ^~~~~~
   net/bluetooth/a2mp.c:916:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:916:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:960:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(rsp->amp_assoc, loc_assoc->data, loc_assoc->len);
                   ^~~~~~
   net/bluetooth/a2mp.c:960:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(rsp->amp_assoc, loc_assoc->data, loc_assoc->len);
                   ^~~~~~
   net/bluetooth/a2mp.c:996:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(req->amp_assoc, loc_assoc->data, loc_assoc->len);
           ^~~~~~
   net/bluetooth/a2mp.c:996:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(req->amp_assoc, loc_assoc->data, loc_assoc->len);
           ^~~~~~
   net/bluetooth/a2mp.c:1015:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:1015:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&rsp, 0, sizeof(rsp));
           ^~~~~~
   net/bluetooth/a2mp.c:1049:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^~~~~~
   net/bluetooth/a2mp.c:1049:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (89 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   Suppressed 91 warnings (89 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4314:5: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(&cctx->prefixDict, 0, sizeof(cctx->prefixDict));   /* si=
ngle usage */
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4499:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4499:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4520:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4520:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4570:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4570:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4650:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4650:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:5096:5: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(&params, 0, sizeof(params));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:5096:5: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(&params, 0, sizeof(params));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (101 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (101 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (101 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (101 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   107 warnings generated.
   Suppressed 107 warnings (106 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   116 warnings generated.
>> net/ipv4/cipso_ipv4.c:1731:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(opt, 0, sizeof(struct ip_options));
           ^~~~~~
   net/ipv4/cipso_ipv4.c:1731:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(opt, 0, sizeof(struct ip_options));
           ^~~~~~
   net/ipv4/cipso_ipv4.c:1774:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0, buf_len);
                   ^~~~~~
   net/ipv4/cipso_ipv4.c:1774:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(buf, 0, buf_len);
                   ^~~~~~
>> net/ipv4/cipso_ipv4.c:1872:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(opt->opt.__data, buf, buf_len);
           ^~~~~~
   net/ipv4/cipso_ipv4.c:1872:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(opt->opt.__data, buf, buf_len);
           ^~~~~~
   net/ipv4/cipso_ipv4.c:1949:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(opt->opt.__data, buf, buf_len);
           ^~~~~~
   net/ipv4/cipso_ipv4.c:1949:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(opt->opt.__data, buf, buf_len);
           ^~~~~~
>> net/ipv4/cipso_ipv4.c:2006:3: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(cipso_ptr, cipso_ptr + cipso_len,
                   ^~~~~~~
   net/ipv4/cipso_ipv4.c:2006:3: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                   memmove(cipso_ptr, cipso_ptr + cipso_len,
                   ^~~~~~~
   net/ipv4/cipso_ipv4.c:2198:3: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove((char *)iph - len_delta, iph, iph->ihl << 2);
                   ^~~~~~~
   net/ipv4/cipso_ipv4.c:2198:3: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                   memmove((char *)iph - len_delta, iph, iph->ihl << 2);
                   ^~~~~~~
   net/ipv4/cipso_ipv4.c:2203:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(iph + 1, IPOPT_NOP, opt->optlen);
                   ^~~~~~
   net/ipv4/cipso_ipv4.c:2203:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(iph + 1, IPOPT_NOP, opt->optlen);
                   ^~~~~~
   net/ipv4/cipso_ipv4.c:2208:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(opt, 0, sizeof(*opt));
                   ^~~~~~
   net/ipv4/cipso_ipv4.c:2208:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(opt, 0, sizeof(*opt));
                   ^~~~~~
   net/ipv4/cipso_ipv4.c:2218:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iph + 1, buf, buf_len);
           ^~~~~~
   net/ipv4/cipso_ipv4.c:2218:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(iph + 1, buf, buf_len);
           ^~~~~~
   net/ipv4/cipso_ipv4.c:2220:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset((char *)(iph + 1) + buf_len, 0, opt_len - buf_len=
);
                   ^~~~~~
   net/ipv4/cipso_ipv4.c:2220:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset((char *)(iph + 1) + buf_len, 0, opt_len - buf_len=
);
                   ^~~~~~
   net/ipv4/cipso_ipv4.c:2260:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cipso_ptr, IPOPT_NOOP, cipso_ptr[1]);
           ^~~~~~
   net/ipv4/cipso_ipv4.c:2260:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(cipso_ptr, IPOPT_NOOP, cipso_ptr[1]);
           ^~~~~~
   Suppressed 105 warnings (104 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/media/dvb-frontends/tda665x.c:221:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(info->name, config->name, sizeof(config->name));
           ^~~~~~
   drivers/media/dvb-frontends/tda665x.c:221:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(info->name, config->name, sizeof(config->name));
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/media/dvb-frontends/af9013.c:45:21: warning: Value stored to 'cl=
ient' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:45:21: note: Value stored to 'clien=
t' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:108:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:108:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:219:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, 3);
           ^~~~~~
   drivers/media/dvb-frontends/af9013.c:219:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, 3);
           ^~~~~~
   drivers/media/dvb-frontends/af9013.c:401:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:401:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:518:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:518:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:832:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:832:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:980:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:980:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1166:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1166:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
--
           ^~~~~~
   Suppressed 224 warnings (224 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/mtd/tests/readtest.c:43:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0 , pgsize);
                   ^~~~~~
   drivers/mtd/tests/readtest.c:43:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(buf, 0 , pgsize);
                   ^~~~~~
   drivers/mtd/tests/readtest.c:90:8: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%05x: ", i);
                        ^~~~~~~
   drivers/mtd/tests/readtest.c:90:8: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%05x: ", i);
                        ^~~~~~~
   drivers/mtd/tests/readtest.c:92:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "%02x", (unsigned int)iobuf[i]=
);
                                ^~~~~~~
   drivers/mtd/tests/readtest.c:92:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "%02x", (unsigned int)iobuf[i]=
);
                                ^~~~~~~
   drivers/mtd/tests/readtest.c:104:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "%05x: ", i);
                                ^~~~~~~
   drivers/mtd/tests/readtest.c:104:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "%05x: ", i);
                                ^~~~~~~
   drivers/mtd/tests/readtest.c:106:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   p +=3D sprintf(p, "%02x",
                                        ^~~~~~~
   drivers/mtd/tests/readtest.c:106:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                                   p +=3D sprintf(p, "%02x",
                                        ^~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/hwmon/corsair-cpro.c:114:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ccp->buffer, 0x00, OUT_BUFFER_SIZE);
           ^~~~~~
   drivers/hwmon/corsair-cpro.c:114:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(ccp->buffer, 0x00, OUT_BUFFER_SIZE);
           ^~~~~~
   drivers/hwmon/corsair-cpro.c:141:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ccp->buffer, data, min(IN_BUFFER_SIZE, size));
           ^~~~~~
   drivers/hwmon/corsair-cpro.c:141:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(ccp->buffer, data, min(IN_BUFFER_SIZE, size));
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   security/lsm_audit.c:221:32: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           audit_log_untrustedstring(ab, memcpy(comm, current->comm, sizeof=
(comm)));
                                         ^~~~~~
   security/lsm_audit.c:221:32: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           audit_log_untrustedstring(ab, memcpy(comm, current->comm, sizeof=
(comm)));
                                         ^~~~~~
   security/lsm_audit.c:316:9: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                       memcpy(comm, tsk->comm, sizeof(comm)=
));
                                       ^~~~~~
   security/lsm_audit.c:316:9: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                       memcpy(comm, tsk->comm, sizeof(comm)=
));
                                       ^~~~~~
   security/lsm_audit.c:419:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&sbn_pfx.s6_addr, 0,
                   ^~~~~~
   security/lsm_audit.c:419:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&sbn_pfx.s6_addr, 0,
                   ^~~~~~
   security/lsm_audit.c:421:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&sbn_pfx.s6_addr, &a->u.ibpkey->subnet_prefix,
                   ^~~~~~
   security/lsm_audit.c:421:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(&sbn_pfx.s6_addr, &a->u.ibpkey->subnet_prefix,
                   ^~~~~~
   Suppressed 91 warnings (90 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
>> security/tomoyo/audit.c:38:8: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(buffer, tomoyo_buffer_len - 1, "argv[]=3D{ ");
                 ^~~~~~~~
   security/tomoyo/audit.c:38:8: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(buffer, tomoyo_buffer_len - 1, "argv[]=3D{ ");
                 ^~~~~~~~
>> security/tomoyo/audit.c:41:3: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(cp, "} envp[]=3D{ ", 11);
                   ^~~~~~~
   security/tomoyo/audit.c:41:3: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                   memmove(cp, "} envp[]=3D{ ", 11);
                   ^~~~~~~
   security/tomoyo/audit.c:80:7: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                                   memmove(cp, "... ", 4);
                                                   ^~~~~~~
   security/tomoyo/audit.c:80:7: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                                                   memmove(cp, "... ", 4);
                                                   ^~~~~~~
   security/tomoyo/audit.c:83:6: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memmove(cp, "} envp[]=3D{ ", 11);
                                           ^~~~~~~
   security/tomoyo/audit.c:83:6: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                                           memmove(cp, "} envp[]=3D{ ", 11);
                                           ^~~~~~~
   security/tomoyo/audit.c:92:7: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                                   memmove(cp, "... ", 4);
                                                   ^~~~~~~
   security/tomoyo/audit.c:92:7: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                                                   memmove(cp, "... ", 4);
                                                   ^~~~~~~
   security/tomoyo/audit.c:106:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buffer, tomoyo_buffer_len - 1,
           ^~~~~~~~
   security/tomoyo/audit.c:106:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(buffer, tomoyo_buffer_len - 1,
           ^~~~~~~~
   security/tomoyo/audit.c:165:8: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos =3D snprintf(buffer, tomoyo_buffer_len - 1,
                 ^~~~~~~~
   security/tomoyo/audit.c:165:8: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           pos =3D snprintf(buffer, tomoyo_buffer_len - 1,
                 ^~~~~~~~
   security/tomoyo/audit.c:196:11: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D snprintf(buffer + pos,
                                  ^~~~~~~~
   security/tomoyo/audit.c:196:11: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           pos +=3D snprintf(buffer + pos,
                                  ^~~~~~~~
   security/tomoyo/audit.c:206:10: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buffer + pos, tomoyo_buffer_len - 1 - =
pos,
                          ^~~~~~~~
   security/tomoyo/audit.c:206:10: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buffer + pos, tomoyo_buffer_len - 1 - =
pos,
                          ^~~~~~~~
   security/tomoyo/audit.c:216:11: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D snprintf(buffer + pos,
                                  ^~~~~~~~
   security/tomoyo/audit.c:216:11: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           pos +=3D snprintf(buffer + pos,
                                  ^~~~~~~~
   security/tomoyo/audit.c:221:10: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buffer + pos, tomoyo_buffer_len - 1 - =
pos,
                          ^~~~~~~~
   security/tomoyo/audit.c:221:10: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buffer + pos, tomoyo_buffer_len - 1 - =
pos,
                          ^~~~~~~~
   security/tomoyo/audit.c:279:8: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos =3D snprintf(buf, len, "%s", header);
                 ^~~~~~~~
   security/tomoyo/audit.c:279:8: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           pos =3D snprintf(buf, len, "%s", header);
                 ^~~~~~~~
   security/tomoyo/audit.c:283:10: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, len - pos,
                          ^~~~~~~~
   security/tomoyo/audit.c:283:10: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, len - pos,
                          ^~~~~~~~
   security/tomoyo/audit.c:287:10: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, len - pos, " symlink.target=
=3D\"%s\"",
                          ^~~~~~~~
   security/tomoyo/audit.c:287:10: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, len - pos, " symlink.target=
=3D\"%s\"",
                          ^~~~~~~~
   security/tomoyo/audit.c:289:9: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf + pos, len - pos, "\n%s\n", domainname);
                  ^~~~~~~~
   security/tomoyo/audit.c:289:9: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf + pos, len - pos, "\n%s\n", domainname);
                  ^~~~~~~~
>> security/tomoyo/audit.c:290:2: warning: Call to function 'vsnprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(buf + pos, len - pos, fmt, args);
           ^~~~~~~~~
   security/tomoyo/audit.c:290:2: note: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(buf + pos, len - pos, fmt, args);
           ^~~~~~~~~
   security/tomoyo/audit.c:426:8: warning: Call to function 'vsnprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf((char *) &len, 1, fmt, args) + 1;
                 ^~~~~~~~~
   security/tomoyo/audit.c:426:8: note: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf((char *) &len, 1, fmt, args) + 1;
                 ^~~~~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/misc/echo/echo.c:247:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ec->fir_taps16[i], 0, ec->taps * sizeof(int16_t));
                   ^~~~~~
   drivers/misc/echo/echo.c:247:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(ec->fir_taps16[i], 0, ec->taps * sizeof(int16_t));
                   ^~~~~~
   drivers/misc/echo/echo.c:256:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ec->snapshot, ec->fir_taps16[0], ec->taps * sizeof(int16_=
t));
           ^~~~~~
   drivers/misc/echo/echo.c:256:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(ec->snapshot, ec->fir_taps16[0], ec->taps * sizeof(int16_=
t));
           ^~~~~~
   drivers/misc/echo/echo.c:442:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ec->fir_taps16[0], ec->fir_taps16[1],
                           ^~~~~~
   drivers/misc/echo/echo.c:442:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ec->fir_taps16[0], ec->fir_taps16[1],
                           ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
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
   fs/namespace.c:2248:13: warning: Access to field 'd_inode' results in a =
dereference of a null pointer (loaded from variable 'dentry') [clang-analyz=
er-core.NullDereference]
           inode_lock(dentry->d_inode);
                      ^
   fs/namespace.c:3822:1: note: Calling '__do_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3830:6: note: Assuming the condition is false
           if (!may_mount())
               ^~~~~~~~~~~~
   fs/namespace.c:3830:2: note: Taking false branch
           if (!may_mount())
           ^
   fs/namespace.c:3835:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3835:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3840:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3840:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3844:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3844:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3848:11: note: Calling 'lock_mount'
           old_mp =3D lock_mount(&old);
                    ^~~~~~~~~~~~~~~~
   fs/namespace.c:2249:6: note: Assuming the condition is true
           if (unlikely(cant_mount(dentry))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/namespace.c:2249:2: note: Taking false branch
           if (unlikely(cant_mount(dentry))) {
           ^
   fs/namespace.c:2255:14: note: 'mnt' is non-null
           if (likely(!mnt)) {
                       ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
--
   ^
   drivers/net/can/softing/softing_main.c:691:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:706:1: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
   DEV_ATTR_RO(firmware_version, id.fw_version);
   ^
   drivers/net/can/softing/softing_main.c:691:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:707:1: warning: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedO=
rUnsafeBufferHandling]
   DEV_ATTR_RO_STR(hardware, pdat->name);
   ^
   drivers/net/can/softing/softing_main.c:700:9: note: expanded from macro =
'DEV_ATTR_RO_STR'
           return sprintf(buf, "%s\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:707:1: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
   DEV_ATTR_RO_STR(hardware, pdat->name);
   ^
   drivers/net/can/softing/softing_main.c:700:9: note: expanded from macro =
'DEV_ATTR_RO_STR'
           return sprintf(buf, "%s\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:708:1: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEV_ATTR_RO(hardware_version, id.hw_version);
   ^
   drivers/net/can/softing/softing_main.c:691:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:708:1: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
   DEV_ATTR_RO(hardware_version, id.hw_version);
   ^
   drivers/net/can/softing/softing_main.c:691:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:709:1: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEV_ATTR_RO(license, id.license);
   ^
   drivers/net/can/softing/softing_main.c:691:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   drivers/net/can/softing/softing_main.c:709:1: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
   DEV_ATTR_RO(license, id.license);
   ^
   drivers/net/can/softing/softing_main.c:691:9: note: expanded from macro =
'DEV_ATTR_RO'
           return sprintf(buf, "%u\n", card->member); \
                  ^~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/staging/greybus/light.c:232:1: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   gb_lights_fade_attr(in);
   ^
   drivers/staging/greybus/light.c:194:9: note: expanded from macro 'gb_lig=
hts_fade_attr'
           return sprintf(buf, "%u\n", channel->fade_##__dir);             \
                  ^~~~~~~
   drivers/staging/greybus/light.c:232:1: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
   gb_lights_fade_attr(in);
   ^
   drivers/staging/greybus/light.c:194:9: note: expanded from macro 'gb_lig=
hts_fade_attr'
           return sprintf(buf, "%u\n", channel->fade_##__dir);             \
                  ^~~~~~~
   drivers/staging/greybus/light.c:233:1: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   gb_lights_fade_attr(out);
   ^
   drivers/staging/greybus/light.c:194:9: note: expanded from macro 'gb_lig=
hts_fade_attr'
           return sprintf(buf, "%u\n", channel->fade_##__dir);             \
                  ^~~~~~~
   drivers/staging/greybus/light.c:233:1: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
   gb_lights_fade_attr(out);
   ^
   drivers/staging/greybus/light.c:194:9: note: expanded from macro 'gb_lig=
hts_fade_attr'
           return sprintf(buf, "%u\n", channel->fade_##__dir);             \
                  ^~~~~~~
   drivers/staging/greybus/light.c:241:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", channel->color);
                  ^~~~~~~
   drivers/staging/greybus/light.c:241:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", channel->color);
                  ^~~~~~~
>> drivers/staging/greybus/light.c:556:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(sd_cfg.dev_name, sizeof(sd_cfg.dev_name), "%s", light->=
name);
           ^~~~~~~~
   drivers/staging/greybus/light.c:556:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(sd_cfg.dev_name, sizeof(sd_cfg.dev_name), "%s", light->=
name);
           ^~~~~~~~
   drivers/staging/greybus/light.c:557:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(sd_cfg_ind.dev_name, sizeof(sd_cfg_ind.dev_name),
           ^~~~~~~~
   drivers/staging/greybus/light.c:557:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(sd_cfg_ind.dev_name, sizeof(sd_cfg_ind.dev_name),
           ^~~~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   107 warnings generated.
   net/dccp/ccid.c:85:2: warning: Call to function 'vsnprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(slab_name_fmt, CCID_SLAB_NAME_LENGTH, fmt, args);
           ^~~~~~~~~
   net/dccp/ccid.c:85:2: note: Call to function 'vsnprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'vsnprintf_s' in case of C11
           vsnprintf(slab_name_fmt, CCID_SLAB_NAME_LENGTH, fmt, args);
           ^~~~~~~~~
   net/dccp/ccid.c:154:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ccid + 1, 0, ccid_ops->ccid_hc_rx_obj_size);
                   ^~~~~~
   net/dccp/ccid.c:154:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(ccid + 1, 0, ccid_ops->ccid_hc_rx_obj_size);
                   ^~~~~~
   net/dccp/ccid.c:159:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ccid + 1, 0, ccid_ops->ccid_hc_tx_obj_size);
                   ^~~~~~
   net/dccp/ccid.c:159:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(ccid + 1, 0, ccid_ops->ccid_hc_tx_obj_size);
                   ^~~~~~
   Suppressed 104 warnings (103 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/mtd/nand/raw/ams-delta.c:199:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &nand_to_mtd(this)->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/ams-delta.c:199:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &nand_to_mtd(this)->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/mtd/nand/raw/denali.c:618:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0xff, size);
                   ^~~~~~
   drivers/mtd/nand/raw/denali.c:618:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(buf, 0xff, size);
                   ^~~~~~
   drivers/mtd/nand/raw/denali.c:705:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0xff, size);
                   ^~~~~~
   drivers/mtd/nand/raw/denali.c:705:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(buf, 0xff, size);
                   ^~~~~~
   Suppressed 35 warnings (35 in non-user code).
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
   18 warnings generated.
   drivers/power/supply/mp2629_charger.c:522:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d mohm\n", rval);
                  ^~~~~~~
   drivers/power/supply/mp2629_charger.c:522:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d mohm\n", rval);
                  ^~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/power/supply/mt6360_charger.c:816:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&mci->psy_desc, &mt6360_charger_desc, sizeof(mci->psy_des=
c));
           ^~~~~~
   drivers/power/supply/mt6360_charger.c:816:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&mci->psy_desc, &mt6360_charger_desc, sizeof(mci->psy_des=
c));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (87 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   net/sched/sch_api.c:434:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(rtab->data, nla_data(tab), 1024);
                   ^~~~~~
   net/sched/sch_api.c:434:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(rtab->data, nla_data(tab), 1024);
--
                                                              ^
   include/linux/scatterlist.h:183:44: note: expanded from macro 'for_each_=
sgtable_dma_sg'
           for_each_sg((sgt)->sgl, sg, (sgt)->nents, i)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/scatterlist.h:169:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/infiniband/core/umem.c:114:2: note: Loop condition is false. Exe=
cution continues on line 133
           for_each_sgtable_dma_sg(&umem->sgt_append.sgt, sg, i) {
           ^
   include/linux/scatterlist.h:183:2: note: expanded from macro 'for_each_s=
gtable_dma_sg'
           for_each_sg((sgt)->sgl, sg, (sgt)->nents, i)
           ^
   include/linux/scatterlist.h:169:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/infiniband/core/umem.c:133:6: note: Assuming 'mask' is not equal=
 to 0
           if (mask)
               ^~~~
   drivers/infiniband/core/umem.c:133:2: note: Taking true branch
           if (mask)
           ^
   drivers/infiniband/core/umem.c:134:18: note: The result of the right shi=
ft is undefined because the right operand is negative
                   pgsz_bitmap &=3D GENMASK(count_trailing_zeros(mask), 0);
                                  ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 91 warnings (90 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   net/caif/caif_usb.c:69:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(zeros, 0, hpad);
           ^~~~~~
   net/caif/caif_usb.c:69:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(zeros, 0, hpad);
           ^~~~~~
   net/caif/caif_usb.c:94:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&this->layer, 0, sizeof(this->layer));
           ^~~~~~
   net/caif/caif_usb.c:94:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&this->layer, 0, sizeof(this->layer));
           ^~~~~~
   net/caif/caif_usb.c:98:2: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(this->layer.name, CAIF_LAYER_NAME_SZ, "usb%d", phyid);
           ^~~~~~~~
   net/caif/caif_usb.c:98:2: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           snprintf(this->layer.name, CAIF_LAYER_NAME_SZ, "usb%d", phyid);
           ^~~~~~~~
   net/caif/caif_usb.c:162:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&common, 0, sizeof(common));
           ^~~~~~
   net/caif/caif_usb.c:162:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&common, 0, sizeof(common));
           ^~~~~~
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
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
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   kernel/watch_queue.c:105:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p + offset, n, len);
           ^~~~~~
   kernel/watch_queue.c:105:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(p + offset, n, len);
           ^~~~~~
   kernel/watch_queue.c:267:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bitmap, 0xff, bmsize);
           ^~~~~~
   kernel/watch_queue.c:267:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(bitmap, 0xff, bmsize);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   114 warnings generated.
>> net/ipv6/calipso.c:703:4: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(buf + offset + 2, 0, count - 2);
                           ^~~~~~
   net/ipv6/calipso.c:703:4: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                           memset(buf + offset + 2, 0, count - 2);
                           ^~~~~~
>> net/ipv6/calipso.c:933:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new, hop, start);
                   ^~~~~~
   net/ipv6/calipso.c:933:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(new, hop, start);
                   ^~~~~~
   net/ipv6/calipso.c:948:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((char *)new + buf_len, (char *)hop + end, hop_len=
 - end);
                   ^~~~~~
   net/ipv6/calipso.c:948:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy((char *)new + buf_len, (char *)hop + end, hop_len=
 - end);
                   ^~~~~~
   net/ipv6/calipso.c:993:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(*new, hop, start);
           ^~~~~~
   net/ipv6/calipso.c:993:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(*new, hop, start);
           ^~~~~~
   net/ipv6/calipso.c:998:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((char *)*new + start + pad, (char *)hop + end,
                   ^~~~~~
   net/ipv6/calipso.c:998:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy((char *)*new + start + pad, (char *)hop + end,
                   ^~~~~~
   net/ipv6/calipso.c:1316:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   net/ipv6/calipso.c:1316:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(buf));
           ^~~~~~
>> net/ipv6/calipso.c:1336:3: warning: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove((char *)ip6_hdr - len_delta, ip6_hdr,
                   ^~~~~~~
   net/ipv6/calipso.c:1336:3: note: Call to function 'memmove' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memmove_s' in case of C11
                   memmove((char *)ip6_hdr - len_delta, ip6_hdr,
                   ^~~~~~~
   net/ipv6/calipso.c:1354:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((char *)hop + start, buf + (start & 3), new_end - start);
           ^~~~~~
   net/ipv6/calipso.c:1354:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy((char *)hop + start, buf + (start & 3), new_end - start);
           ^~~~~~
   net/ipv6/calipso.c:1409:3: warning: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove((char *)ip6_hdr + delta, ip6_hdr, size);
                   ^~~~~~~
   net/ipv6/calipso.c:1409:3: note: Call to function 'memmove' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memmove_s' in case of C11
                   memmove((char *)ip6_hdr + delta, ip6_hdr, size);
                   ^~~~~~~
   Suppressed 105 warnings (104 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   kernel/bpf/trampoline.c:328:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ksym->name, KSYM_NAME_LEN, "bpf_trampoline_%llu_%u", ke=
y, idx);
           ^~~~~~~~
   kernel/bpf/trampoline.c:328:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(ksym->name, KSYM_NAME_LEN, "bpf_trampoline_%llu_%u", ke=
y, idx);
           ^~~~~~~~
   kernel/bpf/trampoline.c:506:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tr->func.model, &tgt_info->fmodel, sizeof(tgt_info->fmod=
el));
           ^~~~~~
   kernel/bpf/trampoline.c:506:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&tr->func.model, &tgt_info->fmodel, sizeof(tgt_info->fmod=
el));
           ^~~~~~
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/i2c/mt9v111.c:492:13: warning: Although the value stored t=
o 'vb' is used in the enclosing expression, the value is never actually rea=
d from 'vb' [clang-analyzer-deadcode.DeadStores]
           best_fps =3D vb =3D hb =3D 0;
                      ^    ~~~~~~
   drivers/media/i2c/mt9v111.c:492:13: note: Although the value stored to '=
vb' is used in the enclosing expression, the value is never actually read f=
rom 'vb'
           best_fps =3D vb =3D hb =3D 0;
                      ^    ~~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/media/test-drivers/vivid/vivid-vid-out.c:418:3: warning: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(pfmt[p].reserved, 0, sizeof(pfmt[p].reserved));
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:418:3: note: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(pfmt[p].reserved, 0, sizeof(pfmt[p].reserved));
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:443:2: warning: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mp->reserved, 0, sizeof(mp->reserved));
           ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:443:2: note: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(mp->reserved, 0, sizeof(mp->reserved));
           ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:861:3: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(win->clips, dev->clips_out,
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:861:3: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(win->clips, dev->clips_out,
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:892:3: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->try_clips_out, win->clips,
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:892:3: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->try_clips_out, win->clips,
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:916:3: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(win->clips, dev->try_clips_out,
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:916:3: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(win->clips, dev->try_clips_out,
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:953:3: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->clips_out, dev->try_clips_out, clips_size);
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:953:3: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->clips_out, dev->try_clips_out, clips_size);
                   ^~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:1044:3: warning: Call t=
o function 'snprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'snprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   snprintf(out->name, sizeof(out->name), "S-Video %u",
                   ^~~~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:1044:3: note: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11
                   snprintf(out->name, sizeof(out->name), "S-Video %u",
                   ^~~~~~~~
   drivers/media/test-drivers/vivid/vivid-vid-out.c:1052:3: warning: Call t=
o function 'snprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'snprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   snprintf(out->name, sizeof(out->name), "HDMI %u",
--
                  ^~~~~~~
   drivers/hwmon/it87.c:1815:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/it87.c:1870:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->beeps >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/it87.c:1870:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->beeps >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/it87.c:1920:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/it87.c:1920:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/it87.c:1943:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", (long)vid_from_reg(data->vid, data-=
>vrm));
                  ^~~~~~~
   drivers/hwmon/it87.c:1943:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", (long)vid_from_reg(data->vid, data-=
>vrm));
                  ^~~~~~~
   drivers/hwmon/it87.c:1973:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/hwmon/it87.c:1973:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/hwmon/it87.c:3311:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&sio_data, 0, sizeof(struct it87_sio_data));
                   ^~~~~~
   drivers/hwmon/it87.c:3311:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(&sio_data, 0, sizeof(struct it87_sio_data));
                   ^~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   net/rxrpc/peer_event.c:36:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(srx, 0, sizeof(*srx));
           ^~~~~~
   net/rxrpc/peer_event.c:36:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(srx, 0, sizeof(*srx));
           ^~~~~~
   net/rxrpc/peer_event.c:52:4: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&srx->transport.sin.sin_addr,
                           ^~~~~~
   net/rxrpc/peer_event.c:52:4: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                           memcpy(&srx->transport.sin.sin_addr,
                           ^~~~~~
   net/rxrpc/peer_event.c:58:4: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&srx->transport.sin.sin_addr,
                           ^~~~~~
   net/rxrpc/peer_event.c:58:4: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                           memcpy(&srx->transport.sin.sin_addr,
                           ^~~~~~
   net/rxrpc/peer_event.c:63:4: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&srx->transport.sin.sin_addr, &ip_hdr(skb=
)->saddr,
                           ^~~~~~
   net/rxrpc/peer_event.c:63:4: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                           memcpy(&srx->transport.sin.sin_addr, &ip_hdr(skb=
)->saddr,
                           ^~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   net/xfrm/xfrm_replay.c:88:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&x->preplay, &x->replay, sizeof(struct xfrm_replay_state)=
);
           ^~~~~~
   net/xfrm/xfrm_replay.c:88:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(&x->preplay, &x->replay, sizeof(struct xfrm_replay_state)=
);
           ^~~~~~
   net/xfrm/xfrm_replay.c:345:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(x->preplay_esn, x->replay_esn,
           ^~~~~~
   net/xfrm/xfrm_replay.c:345:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(x->preplay_esn, x->replay_esn,
           ^~~~~~
   net/xfrm/xfrm_replay.c:411:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(x->preplay_esn, x->replay_esn,
           ^~~~~~
   net/xfrm/xfrm_replay.c:411:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(x->preplay_esn, x->replay_esn,
           ^~~~~~
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   Suppressed 94 warnings (93 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
>> net/bluetooth/hidp/core.c:75:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ci, 0, sizeof(*ci));
           ^~~~~~
   net/bluetooth/hidp/core.c:75:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(ci, 0, sizeof(*ci));
           ^~~~~~
>> net/bluetooth/hidp/core.c:212:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(keys, udata, 8);
                   ^~~~~~
   net/bluetooth/hidp/core.c:212:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(keys, udata, 8);
                   ^~~~~~
   net/bluetooth/hidp/core.c:298:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, skb->data, len);
                   ^~~~~~
   net/bluetooth/hidp/core.c:298:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data, skb->data, len);
                   ^~~~~~
   net/bluetooth/hidp/core.c:445:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(session->input_buf, data, len);
           ^~~~~~
   net/bluetooth/hidp/core.c:445:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(session->input_buf, data, len);
           ^~~~~~
   net/bluetooth/hidp/core.c:625:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   net/bluetooth/hidp/core.c:625:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
>> net/bluetooth/hidp/core.c:785:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(hid->phys, sizeof(hid->phys), "%pMR",
           ^~~~~~~~
   net/bluetooth/hidp/core.c:785:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(hid->phys, sizeof(hid->phys), "%pMR",
           ^~~~~~~~
   net/bluetooth/hidp/core.c:791:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(hid->uniq, sizeof(hid->uniq), "%pMR",
           ^~~~~~~~
   net/bluetooth/hidp/core.c:791:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(hid->uniq, sizeof(hid->uniq), "%pMR",
           ^~~~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   85 warnings generated.
   drivers/net/appletalk/ipddp.c:296:5: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&rcp2, 0, sizeof(rcp2));
                                   ^~~~~~
   drivers/net/appletalk/ipddp.c:296:5: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                                   memset(&rcp2, 0, sizeof(rcp2));
                                   ^~~~~~
   Suppressed 84 warnings (83 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/mtd/nand/raw/cadence-nand-controller.c:758:2: warning: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cdns_ctrl->irq_status, 0, sizeof(cdns_ctrl->irq_status));
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:758:2: note: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&cdns_ctrl->irq_status, 0, sizeof(cdns_ctrl->irq_status));
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:759:2: warning: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cdns_ctrl->irq_mask, 0, sizeof(cdns_ctrl->irq_mask));
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:759:2: note: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&cdns_ctrl->irq_mask, 0, sizeof(cdns_ctrl->irq_mask));
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:924:2: warning: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cdma_desc, 0, sizeof(struct cadence_nand_cdma_desc));
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:924:2: note: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(cdma_desc, 0, sizeof(struct cadence_nand_cdma_desc));
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1414:2: warning: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + cdns_chip->bbm_offs, cdns_ctrl->buf, cdns_chip->bbm=
_len);
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1414:2: note: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + cdns_chip->bbm_offs, cdns_ctrl->buf, cdns_chip->bbm=
_len);
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1443:3: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cdns_ctrl->buf + mtd->writesize, 0xFF,
                   ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1443:3: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(cdns_ctrl->buf + mtd->writesize, 0xFF,
                   ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1476:3: warning: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cdns_ctrl->buf + mtd->writesize, chip->oob_poi,
                   ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1476:3: note: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cdns_ctrl->buf + mtd->writesize, chip->oob_poi,
                   ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1480:2: warning: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cdns_ctrl->buf, buf, mtd->writesize);
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1480:2: note: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cdns_ctrl->buf, buf, mtd->writesize);
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1497:2: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cdns_ctrl->buf, 0xFF, mtd->writesize);
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1497:2: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(cdns_ctrl->buf, 0xFF, mtd->writesize);
           ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1529:3: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tmp_buf, 0xff, size);
                   ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1529:3: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(tmp_buf, 0xff, size);
                   ^~~~~~
   drivers/mtd/nand/raw/cadence-nand-controller.c:1544:4: warning: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(tmp_buf + pos, buf, len);
--
           unsigned int nr_running =3D cfs_rq->nr_running;
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:686:15: note: Value stored to 'nr_running' during it=
s initialization is never read
           unsigned int nr_running =3D cfs_rq->nr_running;
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7039:37: warning: Access to field 'vruntime' results=
 in a dereference of a null pointer (loaded from variable 'se') [clang-anal=
yzer-core.NullDereference]
           s64 gran, vdiff =3D curr->vruntime - se->vruntime;
                                              ^
   kernel/sched/fair.c:7358:9: note: Calling 'pick_next_task_fair'
           return pick_next_task_fair(rq, NULL, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7221:7: note: Calling 'sched_fair_runnable'
           if (!sched_fair_runnable(rq))
                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:2249:9: note: Assuming field 'nr_running' is > 0
           return rq->cfs.nr_running > 0;
                  ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:2249:2: note: Returning without writing to 'rq->cfs=
.tasks_timeline.rb_leftmost', which participates in a condition later
           return rq->cfs.nr_running > 0;
           ^
   kernel/sched/sched.h:2249:2: note: Returning without writing to 'rq->cfs=
.next', which participates in a condition later
   kernel/sched/fair.c:7221:7: note: Returning from 'sched_fair_runnable'
           if (!sched_fair_runnable(rq))
                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7221:2: note: Taking false branch
           if (!sched_fair_runnable(rq))
           ^
   kernel/sched/fair.c:7225:7: note: 'prev' is null
           if (!prev || prev->sched_class !=3D &fair_sched_class)
                ^~~~
   kernel/sched/fair.c:7225:12: note: Left side of '||' is true
           if (!prev || prev->sched_class !=3D &fair_sched_class)
                     ^
   kernel/sched/fair.c:7226:3: note: Control jumps to line 7302
                   goto simple;
                   ^
   kernel/sched/fair.c:7302:6: note: 'prev' is null
           if (prev)
               ^~~~
   kernel/sched/fair.c:7302:2: note: Taking false branch
           if (prev)
           ^
   kernel/sched/fair.c:7306:33: note: Passing null pointer value via 2nd pa=
rameter 'curr'
                   se =3D pick_next_entity(cfs_rq, NULL);
                                                 ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   kernel/sched/fair.c:7306:8: note: Calling 'pick_next_entity'
                   se =3D pick_next_entity(cfs_rq, NULL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4508:30: note: Calling '__pick_first_entity'
           struct sched_entity *left =3D __pick_first_entity(cfs_rq);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:600:6: note: Assuming 'left' is null
           if (!left)
               ^~~~~
   kernel/sched/fair.c:600:2: note: Taking true branch
           if (!left)
           ^
   kernel/sched/fair.c:601:3: note: Returning without writing to 'cfs_rq->n=
ext', which participates in a condition later
                   return NULL;
                   ^
   kernel/sched/fair.c:601:3: note: Returning null pointer, which participa=
tes in a condition later
                   return NULL;
                   ^~~~~~~~~~~
   kernel/sched/fair.c:4508:30: note: Returning from '__pick_first_entity'
           struct sched_entity *left =3D __pick_first_entity(cfs_rq);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4515:7: note: 'left' is null
           if (!left || (curr && entity_before(curr, left)))
                ^~~~
   kernel/sched/fair.c:4515:12: note: Left side of '||' is true
           if (!left || (curr && entity_before(curr, left)))
                     ^
   kernel/sched/fair.c:4516:3: note: Null pointer value stored to 'left'
                   left =3D curr;
                   ^~~~~~~~~~~
   kernel/sched/fair.c:4524:6: note: Assuming field 'skip' is null
           if (cfs_rq->skip && cfs_rq->skip =3D=3D se) {
               ^~~~~~~~~~~~
   kernel/sched/fair.c:4524:19: note: Left side of '&&' is false
           if (cfs_rq->skip && cfs_rq->skip =3D=3D se) {
                            ^
   kernel/sched/fair.c:4539:6: note: Assuming field 'next' is non-null
           if (cfs_rq->next && wakeup_preempt_entity(cfs_rq->next, left) < =
1) {
               ^~~~~~~~~~~~
   kernel/sched/fair.c:4539:6: note: Left side of '&&' is true
   kernel/sched/fair.c:4539:58: note: Passing null pointer value via 2nd pa=
rameter 'se'
           if (cfs_rq->next && wakeup_preempt_entity(cfs_rq->next, left) < =
1) {
                                                                   ^~~~
   kernel/sched/fair.c:4539:22: note: Calling 'wakeup_preempt_entity'
           if (cfs_rq->next && wakeup_preempt_entity(cfs_rq->next, left) < =
1) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7039:37: note: Access to field 'vruntime' results in=
 a dereference of a null pointer (loaded from variable 'se')
           s64 gran, vdiff =3D curr->vruntime - se->vruntime;
                                              ^~
   Suppressed 68 warnings (61 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
>> security/tomoyo/common.c:202:2: warning: Call to function 'vsnprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(buffer + pos, len - pos - 1, fmt, args);
           ^~~~~~~~~
   security/tomoyo/common.c:202:2: note: Call to function 'vsnprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(buffer + pos, len - pos - 1, fmt, args);
           ^~~~~~~~~
   security/tomoyo/common.c:288:8: warning: Call to function 'vsnprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(head->read_buf + pos, size, fmt, args) + 1;
                 ^~~~~~~~~
   security/tomoyo/common.c:288:8: note: Call to function 'vsnprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(head->read_buf + pos, size, fmt, args) + 1;
                 ^~~~~~~~~
>> security/tomoyo/common.c:510:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ptr->config, TOMOYO_CONFIG_USE_DEFAULT,
                   ^~~~~~
   security/tomoyo/common.c:510:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(ptr->config, TOMOYO_CONFIG_USE_DEFAULT,
                   ^~~~~~
>> security/tomoyo/common.c:582:3: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sscanf(cp + strlen(find), "=3D%u", i);
                   ^~~~~~
   security/tomoyo/common.c:582:3: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
                   sscanf(cp + strlen(find), "=3D%u", i);
                   ^~~~~~
   security/tomoyo/common.c:681:6: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(data, "PROFILE_VERSION=3D%u", &head->w.ns->profile_ve=
rsion)
               ^~~~~~
   security/tomoyo/common.c:681:6: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(data, "PROFILE_VERSION=3D%u", &head->w.ns->profile_ve=
rsion)
               ^~~~~~
   security/tomoyo/common.c:1000:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(data, "pid=3D%u", &pid) =3D=3D 1 ||
               ^~~~~~
   security/tomoyo/common.c:1000:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(data, "pid=3D%u", &pid) =3D=3D 1 ||
               ^~~~~~
   security/tomoyo/common.c:1001:26: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
               (global_pid =3D true, sscanf(data, "global-pid=3D%u", &pid) =
=3D=3D 1)) {
                                   ^~~~~~
   security/tomoyo/common.c:1001:26: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
               (global_pid =3D true, sscanf(data, "global-pid=3D%u", &pid) =
=3D=3D 1)) {
                                   ^~~~~~
   security/tomoyo/common.c:1015:13: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           } else if (sscanf(data, "Q=3D%u", &pid) =3D=3D 1) {
                      ^~~~~~
   security/tomoyo/common.c:1015:13: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
           } else if (sscanf(data, "Q=3D%u", &pid) =3D=3D 1) {
                      ^~~~~~
   security/tomoyo/common.c:1023:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&head->r, 0, sizeof(head->r));
           ^~~~~~
   security/tomoyo/common.c:1023:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&head->r, 0, sizeof(head->r));
           ^~~~~~
   security/tomoyo/common.c:1197:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(data, "use_profile %u", &idx) =3D=3D 1
               ^~~~~~
   security/tomoyo/common.c:1197:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(data, "use_profile %u", &idx) =3D=3D 1
               ^~~~~~
   security/tomoyo/common.c:1204:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(data, "use_group %u\n", &idx) =3D=3D 1
               ^~~~~~
   security/tomoyo/common.c:1204:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(data, "use_group %u\n", &idx) =3D=3D 1
               ^~~~~~
>> security/tomoyo/common.c:2034:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buffer, len - 1, "%s", cp);
           ^~~~~~~~
   security/tomoyo/common.c:2034:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(buffer, len - 1, "%s", cp);
           ^~~~~~~~
   security/tomoyo/common.c:2069:8: warning: Call to function 'vsnprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf((char *) &len, 1, fmt, args) + 1;
                 ^~~~~~~~~
   security/tomoyo/common.c:2069:8: note: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf((char *) &len, 1, fmt, args) + 1;
                 ^~~~~~~~~
   security/tomoyo/common.c:2242:4: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(buf, len + 31, "Q%u-%hu\n%s", ptr->seri=
al,
                           ^~~~~~~~
   security/tomoyo/common.c:2242:4: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                           snprintf(buf, len + 31, "Q%u-%hu\n%s", ptr->seri=
al,
                           ^~~~~~~~
   security/tomoyo/common.c:2277:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(data, "A%u=3D%u", &serial, &answer) !=3D 2)
               ^~~~~~
   security/tomoyo/common.c:2277:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(data, "A%u=3D%u", &serial, &answer) !=3D 2)
               ^~~~~~
   security/tomoyo/common.c:2402:5: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   sscanf(data, "%u", &tomoyo_memory_quota[=
i]);
                                   ^~~~~~
   security/tomoyo/common.c:2402:5: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
                                   sscanf(data, "%u", &tomoyo_memory_quota[=
i]);
                                   ^~~~~~
   security/tomoyo/common.c:2554:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&head->r, 0, sizeof(head->r));
                   ^~~~~~
   security/tomoyo/common.c:2554:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&head->r, 0, sizeof(head->r));
                   ^~~~~~
>> security/tomoyo/common.c:2623:3: warning: Call to function 'memmove' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(line, line + 7, strlen(line + 7) + 1);
                   ^~~~~~~
   security/tomoyo/common.c:2623:3: note: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11
                   memmove(line, line + 7, strlen(line + 7) + 1);
                   ^~~~~~~
   security/tomoyo/common.c:2633:5: warning: Call to function 'memmove' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memmove(line, cp, strlen(cp) + 1);
                                   ^~~~~~~
   security/tomoyo/common.c:2633:5: note: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11
                                   memmove(line, cp, strlen(cp) + 1);
                                   ^~~~~~~
   security/tomoyo/common.c:2681:4: warning: Call to function 'memmove' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(cp, cp0, head->w.avail);
                           ^~~~~~~
   security/tomoyo/common.c:2681:4: note: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11
                           memmove(cp, cp0, head->w.avail);
                           ^~~~~~~
   security/tomoyo/common.c:2702:4: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&head->r, 0, sizeof(head->r));
                           ^~~~~~
   security/tomoyo/common.c:2702:4: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                           memset(&head->r, 0, sizeof(head->r));
                           ^~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/fpga/dfl-fme-perf.c:217:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(event,          "config:0-11");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:217:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(event,          "config:0-11");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:218:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(evtype,         "config:12-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:218:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(evtype,         "config:12-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:219:1: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(portid,         "config:16-23");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:219:1: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(portid,         "config:16-23");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:532:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ptr +=3D sprintf(ptr, "event=3D0x%02x", (unsigned int)get_event(=
config));
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:532:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           ptr +=3D sprintf(ptr, "event=3D0x%02x", (unsigned int)get_event(=
config));
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:533:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ptr +=3D sprintf(ptr, ",evtype=3D0x%02x", (unsigned int)get_evty=
pe(config));
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:533:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           ptr +=3D sprintf(ptr, ",evtype=3D0x%02x", (unsigned int)get_evty=
pe(config));
                  ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:536:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ptr +=3D sprintf(ptr, ",portid=3D0x%02x\n", FME_PORTID_R=
OOT);
                          ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:536:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   ptr +=3D sprintf(ptr, ",portid=3D0x%02x\n", FME_PORTID_R=
OOT);
                          ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:538:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ptr +=3D sprintf(ptr, ",portid=3D?\n");
                          ^~~~~~~
   drivers/fpga/dfl-fme-perf.c:538:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   ptr +=3D sprintf(ptr, ",portid=3D?\n");
                          ^~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/mmc/host/usdhi6rol0.c:335:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(host->bounce_buf, host->head_pg.mapped + PAGE_SIZE - blk_=
head,
           ^~~~~~
   drivers/mmc/host/usdhi6rol0.c:335:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(host->bounce_buf, host->head_pg.mapped + PAGE_SIZE - blk_=
head,
           ^~~~~~
   drivers/mmc/host/usdhi6rol0.c:337:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(host->bounce_buf + blk_head, host->pg.mapped,
           ^~~~~~
   drivers/mmc/host/usdhi6rol0.c:337:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(host->bounce_buf + blk_head, host->pg.mapped,
--
           ^~~~~~~
   net/smc/smc_pnet.c:447:2: note: Call to function 'strncpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'strncpy_s' in case of C11
           strncpy(new_pe->ib_name, ib_name, IB_DEVICE_NAME_MAX);
           ^~~~~~~
   net/smc/smc_pnet.c:756:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pe->pnetid, pnetid, SMC_MAX_PNETID_LEN);
           ^~~~~~
   net/smc/smc_pnet.c:756:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(pe->pnetid, pnetid, SMC_MAX_PNETID_LEN);
           ^~~~~~
   net/smc/smc_pnet.c:951:4: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pnetid, pnetelem->pnet_name, SMC_MAX_PNET=
ID_LEN);
                           ^~~~~~
   net/smc/smc_pnet.c:951:4: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                           memcpy(pnetid, pnetelem->pnet_name, SMC_MAX_PNET=
ID_LEN);
                           ^~~~~~
   net/smc/smc_pnet.c:990:2: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           list_for_each_entry(ibdev, &smc_ib_devices.list, list) {
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   net/smc/smc_pnet.c:1114:7: note: 'dst' is non-null
           if (!dst)
                ^~~
   net/smc/smc_pnet.c:1114:2: note: Taking false branch
           if (!dst)
           ^
   net/smc/smc_pnet.c:1116:6: note: Assuming field 'dev' is non-null
           if (!dst->dev)
               ^~~~~~~~~
   net/smc/smc_pnet.c:1116:2: note: Taking false branch
           if (!dst->dev)
           ^
   net/smc/smc_pnet.c:1119:2: note: Calling 'smc_pnet_find_roce_by_pnetid'
           smc_pnet_find_roce_by_pnetid(dst->dev, ini);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_pnet.c:1071:6: note: Left side of '&&' is true
           if (smc_pnetid_by_dev_port(ndev->dev.parent, ndev->dev_port,
               ^
   net/smc/smc_pnet.c:1073:6: note: Assuming the condition is false
               smc_pnet_find_ndev_pnetid_by_table(ndev, ndev_pnetid)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_pnet.c:1071:2: note: Taking false branch
           if (smc_pnetid_by_dev_port(ndev->dev.parent, ndev->dev_port,
           ^
   net/smc/smc_pnet.c:1077:2: note: Calling '_smc_pnet_find_roce_by_pnetid'
           _smc_pnet_find_roce_by_pnetid(ndev_pnetid, ini, NULL, net);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_pnet.c:990:22: note: Value assigned to 'ibdev'
           list_for_each_entry(ibdev, &smc_ib_devices.list, list) {
                               ^
   include/linux/list.h:638:7: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/smc_pnet.c:990:2: note: Loop condition is true.  Entering loop b=
ody
           list_for_each_entry(ibdev, &smc_ib_devices.list, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/smc/smc_pnet.c:991:7: note: Assuming 'ibdev' is equal to 'known_dev'
                   if (ibdev =3D=3D known_dev ||
                       ^~~~~~~~~~~~~~~~~~
   net/smc/smc_pnet.c:991:26: note: Left side of '||' is true
                   if (ibdev =3D=3D known_dev ||
                                          ^
   net/smc/smc_pnet.c:993:4: note:  Execution continues on line 990
                           continue;
                           ^
   net/smc/smc_pnet.c:990:2: note: Dereference of null pointer
           list_for_each_entry(ibdev, &smc_ib_devices.list, list) {
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
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
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   100 warnings generated.
>> net/bluetooth/6lowpan.c:162:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&lowpan_cb(skb)->gw, nexthop, sizeof(struct in6_a=
ddr));
                   ^~~~~~
   net/bluetooth/6lowpan.c:162:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(&lowpan_cb(skb)->gw, nexthop, sizeof(struct in6_a=
ddr));
                   ^~~~~~
   net/bluetooth/6lowpan.c:381:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ipv6_daddr, &hdr->daddr, sizeof(ipv6_daddr));
           ^~~~~~
   net/bluetooth/6lowpan.c:381:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&ipv6_daddr, &hdr->daddr, sizeof(ipv6_daddr));
           ^~~~~~
>> net/bluetooth/6lowpan.c:443:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   net/bluetooth/6lowpan.c:443:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   net/bluetooth/6lowpan.c:644:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&peer->peer_addr, 0, sizeof(struct in6_addr));
           ^~~~~~
   net/bluetooth/6lowpan.c:644:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&peer->peer_addr, 0, sizeof(struct in6_addr));
           ^~~~~~
>> net/bluetooth/6lowpan.c:960:6: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           n =3D sscanf(buf, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx %hhu",
               ^~~~~~
   net/bluetooth/6lowpan.c:960:6: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           n =3D sscanf(buf, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx %hhu",
               ^~~~~~
   Suppressed 95 warnings (94 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/iio/industrialio-event.c:542:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ev_int->group.attrs,
                   ^~~~~~
   drivers/iio/industrialio-event.c:542:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ev_int->group.attrs,
                   ^~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/iio/industrialio-buffer.c:841:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(config, 0, sizeof(*config));
           ^~~~~~
   drivers/iio/industrialio-buffer.c:841:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(config, 0, sizeof(*config));
           ^~~~~~
   drivers/iio/industrialio-buffer.c:854:2: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/iio/industrialio-buffer.c:1303:8: note: Calling 'strtobool'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kstrtox.h:152:9: note: Value assigned to 'requested_state'=
, which participates in a condition later
           return kstrtobool(s, res);
                  ^~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1303:8: note: Returning from 'strtoboo=
l'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1304:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/industrialio-buffer.c:1304:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/industrialio-buffer.c:1312:6: note: Assuming 'inlist' is not=
 equal to 'requested_state'
           if (inlist =3D=3D requested_state)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1312:2: note: Taking false branch
           if (inlist =3D=3D requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1315:6: note: Assuming 'requested_stat=
e' is true
           if (requested_state)
               ^~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1315:2: note: Taking true branch
           if (requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1316:9: note: Calling '__iio_update_bu=
ffers'
                   ret =3D __iio_update_buffers(indio_dev, buffer, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1197:8: note: Calling 'iio_verify_upda=
te'
           ret =3D iio_verify_update(indio_dev, insert_buffer, remove_buffe=
r,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:6: note: 'insert_buffer' is non-nu=
ll
           if (insert_buffer &&
               ^~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:6: note: Left side of '&&' is true
   drivers/iio/industrialio-buffer.c:835:6: note: Calling 'bitmap_empty'
               bitmap_empty(insert_buffer->scan_mask, indio_dev->masklength=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:385:6: note: Left side of '&&' is false
           if (small_const_nbits(nbits))
               ^
   include/asm-generic/bitsperlong.h:36:31: note: expanded from macro 'smal=
l_const_nbits'
           (__builtin_constant_p(nbits) && (nbits) <=3D BITS_PER_LONG && (n=
bits) > 0)
                                        ^
   include/linux/bitmap.h:388:9: note: Assuming the condition is false
           return find_first_bit(src, nbits) =3D=3D nbits;
                  ^
   arch/arm/include/asm/bitops.h:202:31: note: expanded from macro 'find_fi=
rst_bit'
   #define find_first_bit(p,sz)            _find_first_bit_le(p,sz)
                                           ^
   include/linux/bitmap.h:388:2: note: Returning zero, which participates i=
n a condition later
           return find_first_bit(src, nbits) =3D=3D nbits;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:835:6: note: Returning from 'bitmap_em=
pty'
               bitmap_empty(insert_buffer->scan_mask, indio_dev->masklength=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:2: note: Taking false branch
--
                         ^~~~~~~
   net/ipv4/tcp_cong.c:170:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
           ^~~~~~
   net/ipv4/tcp_cong.c:170:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
           ^~~~~~
   net/ipv4/tcp_cong.c:199:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
           ^~~~~~
   net/ipv4/tcp_cong.c:199:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
           ^~~~~~
   net/ipv4/tcp_cong.c:266:11: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:266:11: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:283:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(name, ca->name, TCP_CA_NAME_MAX);
           ^~~~~~~
   net/ipv4/tcp_cong.c:283:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(name, ca->name, TCP_CA_NAME_MAX);
           ^~~~~~~
   net/ipv4/tcp_cong.c:298:11: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:298:11: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   Suppressed 102 warnings (101 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   106 warnings generated.
   net/ipv6/datagram.c:46:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fl6, 0, sizeof(*fl6));
           ^~~~~~
   net/ipv6/datagram.c:46:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(fl6, 0, sizeof(*fl6));
           ^~~~~~
   net/ipv6/datagram.c:502:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&errhdr.ee, &serr->ee, sizeof(struct sock_extended_err));
           ^~~~~~
   net/ipv6/datagram.c:502:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&errhdr.ee, &serr->ee, sizeof(struct sock_extended_err));
           ^~~~~~
   net/ipv6/datagram.c:504:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sin, 0, sizeof(*sin));
           ^~~~~~
   net/ipv6/datagram.c:504:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(sin, 0, sizeof(*sin));
           ^~~~~~
   net/ipv6/datagram.c:567:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&mtu_info, IP6CBMTU(skb), sizeof(mtu_info));
           ^~~~~~
   net/ipv6/datagram.c:567:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&mtu_info, IP6CBMTU(skb), sizeof(mtu_info));
           ^~~~~~
   Suppressed 102 warnings (101 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:416:5: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(hw->scan[ST_LSM6DSX_ID_GYRO].chan=
nels,
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:416:5: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(hw->scan[ST_LSM6DSX_ID_GYRO].chan=
nels,
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:422:5: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(hw->scan[ST_LSM6DSX_ID_ACC].chann=
els,
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:422:5: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(hw->scan[ST_LSM6DSX_ID_ACC].chann=
els,
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:428:5: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(hw->scan[ST_LSM6DSX_ID_EXT0].chan=
nels,
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:428:5: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(hw->scan[ST_LSM6DSX_ID_EXT0].chan=
nels,
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:437:5: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(data, &hw->buff[offset], sizeof(d=
ata));
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:437:5: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(data, &hw->buff[offset], sizeof(d=
ata));
                                   ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:603:4: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(iio_buff, &hw->buff[i + ST_LSM6DSX_TAG_SI=
ZE],
                           ^~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:603:4: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(iio_buff, &hw->buff[i + ST_LSM6DSX_TAG_SI=
ZE],
                           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   Suppressed 91 warnings (90 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   123 warnings generated.
>> drivers/infiniband/core/ucma.c:234:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst->private_data, src->private_data,
                   ^~~~~~
   drivers/infiniband/core/ucma.c:234:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst->private_data, src->private_data,
                   ^~~~~~
   drivers/infiniband/core/ucma.c:251:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst->private_data, src->private_data,
                   ^~~~~~
   drivers/infiniband/core/ucma.c:251:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst->private_data, src->private_data,
                   ^~~~~~
>> drivers/infiniband/core/ucma.c:837:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&resp, 0, sizeof resp);
           ^~~~~~
   drivers/infiniband/core/ucma.c:837:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&resp, 0, sizeof resp);
           ^~~~~~
   drivers/infiniband/core/ucma.c:839:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&resp.src_addr, addr, addr->sa_family =3D=3D AF_INET ?
           ^~~~~~
   drivers/infiniband/core/ucma.c:839:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&resp.src_addr, addr, addr->sa_family =3D=3D AF_INET ?
           ^~~~~~
   drivers/infiniband/core/ucma.c:843:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&resp.dst_addr, addr, addr->sa_family =3D=3D AF_INET ?
           ^~~~~~
   drivers/infiniband/core/ucma.c:843:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&resp.dst_addr, addr, addr->sa_family =3D=3D AF_INET ?
           ^~~~~~
   drivers/infiniband/core/ucma.c:893:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&resp, 0, sizeof resp);
           ^~~~~~
   drivers/infiniband/core/ucma.c:893:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&resp, 0, sizeof resp);
           ^~~~~~
   drivers/infiniband/core/ucma.c:897:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&resp.src_addr, addr, resp.src_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:897:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&resp.src_addr, addr, resp.src_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:901:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&resp.dst_addr, addr, resp.dst_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:901:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&resp.dst_addr, addr, resp.dst_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:960:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&resp, 0, sizeof resp);
           ^~~~~~
   drivers/infiniband/core/ucma.c:960:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&resp, 0, sizeof resp);
           ^~~~~~
   drivers/infiniband/core/ucma.c:967:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(addr, &ctx->cm_id->route.addr.src_addr, resp.src_=
size);
                   ^~~~~~
   drivers/infiniband/core/ucma.c:967:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(addr, &ctx->cm_id->route.addr.src_addr, resp.src_=
size);
                   ^~~~~~
   drivers/infiniband/core/ucma.c:980:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(addr, &ctx->cm_id->route.addr.dst_addr, resp.dst_=
size);
                   ^~~~~~
   drivers/infiniband/core/ucma.c:980:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(addr, &ctx->cm_id->route.addr.dst_addr, resp.dst_=
size);
                   ^~~~~~
   drivers/infiniband/core/ucma.c:1236:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&qp_attr, 0, sizeof qp_attr);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1236:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&qp_attr, 0, sizeof qp_attr);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1317:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sa_path, 0, sizeof(sa_path));
           ^~~~~~
   drivers/infiniband/core/ucma.c:1317:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&sa_path, 0, sizeof(sa_path));
           ^~~~~~
   drivers/infiniband/core/ucma.c:1337:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&event, 0, sizeof event);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1337:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&event, 0, sizeof event);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1473:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&mc->addr, addr, cmd->addr_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1473:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&mc->addr, addr, cmd->addr_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1539:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&join_cmd.addr, &cmd.addr, join_cmd.addr_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1539:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&join_cmd.addr, &cmd.addr, join_cmd.addr_size);
           ^~~~~~
   drivers/infiniband/core/ucma.c:1807:34: warning: Use of memory after it =
is freed [clang-analyzer-unix.Malloc]
                   WARN_ON(xa_cmpxchg(&ctx_table, ctx->id, ctx, XA_ZERO_ENT=
RY,
                                                  ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/infiniband/core/ucma.c:1803:2: note: Loop condition is true.  En=
tering loop body
           while (!list_empty(&file->ctx_list)) {
           ^
   drivers/infiniband/core/ucma.c:1807:3: note: Assuming '__ret_warn_on' is=
 0
                   WARN_ON(xa_cmpxchg(&ctx_table, ctx->id, ctx, XA_ZERO_ENT=
RY,
                   ^
   include/asm-generic/bug.h:122:6: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
--
                   ^
   net/bridge/netfilter/ebtables.c:230:3: note: Taking false branch
                   if (EBT_MATCH_ITERATE(point, ebt_do_match, skb, &acpar) =
!=3D 0)
                   ^
   net/bridge/netfilter/ebtables.c:232:13: note: Field 'hotdrop' is false
                   if (acpar.hotdrop) {
                             ^
   net/bridge/netfilter/ebtables.c:232:3: note: Taking false branch
                   if (acpar.hotdrop) {
                   ^
   net/bridge/netfilter/ebtables.c:237:3: note: Loop condition is false.  E=
xiting loop
                   ADD_COUNTER(*(counter_base + i), skb->len, 1);
                   ^
   include/uapi/linux/netfilter/x_tables.h:108:28: note: expanded from macr=
o 'ADD_COUNTER'
   #define ADD_COUNTER(c,b,p) do { (c).bcnt +=3D (b); (c).pcnt +=3D (p); } =
while(0)
                              ^
   net/bridge/netfilter/ebtables.c:242:3: note: Assuming '__i' is >=3D fiel=
d 'target_offset'
                   EBT_WATCHER_ITERATE(point, ebt_do_watcher, skb, &acpar);
                   ^
   include/uapi/linux/netfilter_bridge/ebtables.h:246:7: note: expanded fro=
m macro 'EBT_WATCHER_ITERATE'
                __i < (e)->target_offset;                      \
                ^~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:242:3: note: Loop condition is false. Ex=
ecution continues on line 242
                   EBT_WATCHER_ITERATE(point, ebt_do_watcher, skb, &acpar);
                   ^
   include/uapi/linux/netfilter_bridge/ebtables.h:245:2: note: expanded fro=
m macro 'EBT_WATCHER_ITERATE'
           for (__i =3D e->watchers_offset;                      \
           ^
   net/bridge/netfilter/ebtables.c:242:3: note: '__ret' is equal to 0
                   EBT_WATCHER_ITERATE(point, ebt_do_watcher, skb, &acpar);
                   ^
   include/uapi/linux/netfilter_bridge/ebtables.h:255:6: note: expanded fro=
m macro 'EBT_WATCHER_ITERATE'
           if (__ret =3D=3D 0) {                                   \
               ^~~~~
   net/bridge/netfilter/ebtables.c:242:3: note: Taking true branch
                   EBT_WATCHER_ITERATE(point, ebt_do_watcher, skb, &acpar);
                   ^
   include/uapi/linux/netfilter_bridge/ebtables.h:255:2: note: expanded fro=
m macro 'EBT_WATCHER_ITERATE'
           if (__ret =3D=3D 0) {                                   \
           ^
   net/bridge/netfilter/ebtables.c:242:3: note: Assuming '__i' is equal to =
field 'target_offset'
                   EBT_WATCHER_ITERATE(point, ebt_do_watcher, skb, &acpar);
                   ^
   include/uapi/linux/netfilter_bridge/ebtables.h:256:7: note: expanded fro=
m macro 'EBT_WATCHER_ITERATE'
                   if (__i !=3D (e)->target_offset)              \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:242:3: note: Taking false branch
                   EBT_WATCHER_ITERATE(point, ebt_do_watcher, skb, &acpar);
                   ^
   include/uapi/linux/netfilter_bridge/ebtables.h:256:3: note: expanded fro=
m macro 'EBT_WATCHER_ITERATE'
                   if (__i !=3D (e)->target_offset)              \
                   ^
   net/bridge/netfilter/ebtables.c:246:7: note: Assuming field 'target' is =
null
                   if (!t->u.target->target)
                       ^~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:246:3: note: Taking true branch
                   if (!t->u.target->target)
                   ^
   net/bridge/netfilter/ebtables.c:253:7: note: Assuming the condition is f=
alse
                   if (verdict =3D=3D EBT_ACCEPT) {
                       ^~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:253:3: note: Taking false branch
                   if (verdict =3D=3D EBT_ACCEPT) {
                   ^
   net/bridge/netfilter/ebtables.c:257:7: note: Assuming the condition is f=
alse
                   if (verdict =3D=3D EBT_DROP) {
                       ^~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:257:3: note: Taking false branch
                   if (verdict =3D=3D EBT_DROP) {
                   ^
   net/bridge/netfilter/ebtables.c:261:7: note: Assuming the condition is f=
alse
                   if (verdict =3D=3D EBT_RETURN) {
                       ^~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:261:3: note: Taking false branch
                   if (verdict =3D=3D EBT_RETURN) {
                   ^
   net/bridge/netfilter/ebtables.c:278:7: note: Assuming the condition is f=
alse
                   if (verdict =3D=3D EBT_CONTINUE)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:278:3: note: Taking false branch
                   if (verdict =3D=3D EBT_CONTINUE)
                   ^
   net/bridge/netfilter/ebtables.c:281:12: note: Assuming 'verdict' is >=3D=
 0
                   if (WARN(verdict < 0, "bogus standard verdict\n")) {
                            ^
   include/asm-generic/bug.h:130:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/bridge/netfilter/ebtables.c:281:7: note: Taking false branch
                   if (WARN(verdict < 0, "bogus standard verdict\n")) {
                       ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   net/bridge/netfilter/ebtables.c:281:3: note: Taking false branch
                   if (WARN(verdict < 0, "bogus standard verdict\n")) {
                   ^
   net/bridge/netfilter/ebtables.c:287:12: note: Dereference of null pointer
                   cs[sp].n =3D i + 1;
                   ~~~~~~~~~^~~~~~~
>> net/bridge/netfilter/ebtables.c:732:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mtpar, 0, sizeof(mtpar));
           ^~~~~~
   net/bridge/netfilter/ebtables.c:732:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&mtpar, 0, sizeof(mtpar));
           ^~~~~~
   net/bridge/netfilter/ebtables.c:733:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tgpar, 0, sizeof(tgpar));
           ^~~~~~
   net/bridge/netfilter/ebtables.c:733:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&tgpar, 0, sizeof(tgpar));
           ^~~~~~
>> net/bridge/netfilter/ebtables.c:994:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(counters, oldcounters,
           ^~~~~~
   net/bridge/netfilter/ebtables.c:994:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(counters, oldcounters,
           ^~~~~~
   net/bridge/netfilter/ebtables.c:994:2: warning: Null pointer passed as 1=
st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(counters, oldcounters,
           ^
   net/bridge/netfilter/ebtables.c:2516:6: note: Assuming the condition is =
false
           if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:2516:2: note: Taking false branch
           if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
           ^
   net/bridge/netfilter/ebtables.c:2519:2: note: Control jumps to 'case 128=
:'  at line 2520
           switch (cmd) {
           ^
   net/bridge/netfilter/ebtables.c:2526:10: note: Calling 'do_replace'
                           ret =3D do_replace(net, arg, len);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1113:6: note: Calling 'copy_from_sockptr'
           if (copy_from_sockptr(&tmp, arg, sizeof(tmp)) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:55:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:6: note: Assuming the condition is false
           if (!sockptr_is_kernel(src))
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sockptr.h:47:2: note: Taking false branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/sockptr.h:55:9: note: Returning from 'copy_from_sockptr_of=
fset'
           return copy_from_sockptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1113:6: note: Returning from 'copy_from_=
sockptr'
           if (copy_from_sockptr(&tmp, arg, sizeof(tmp)) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1113:2: note: Taking false branch
           if (copy_from_sockptr(&tmp, arg, sizeof(tmp)) !=3D 0)
           ^
   net/bridge/netfilter/ebtables.c:1116:6: note: Assuming the condition is =
false
           if (len !=3D sizeof(tmp) + tmp.entries_size)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1116:2: note: Taking false branch
           if (len !=3D sizeof(tmp) + tmp.entries_size)
           ^
   net/bridge/netfilter/ebtables.c:1119:6: note: Assuming field 'entries_si=
ze' is not equal to 0
           if (tmp.entries_size =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1119:2: note: Taking false branch
           if (tmp.entries_size =3D=3D 0)
           ^
   net/bridge/netfilter/ebtables.c:1123:6: note: Assuming the condition is =
false
           if (tmp.nentries >=3D ((INT_MAX - sizeof(struct ebt_table_info))=
 /
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1123:2: note: Taking false branch
           if (tmp.nentries >=3D ((INT_MAX - sizeof(struct ebt_table_info))=
 /
           ^
   net/bridge/netfilter/ebtables.c:1126:6: note: Assuming the condition is =
false
           if (tmp.num_counters >=3D INT_MAX / sizeof(struct ebt_counter))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1126:2: note: Taking false branch
           if (tmp.num_counters >=3D INT_MAX / sizeof(struct ebt_counter))
           ^
   net/bridge/netfilter/ebtables.c:1133:6: note: Assuming 'newinfo' is non-=
null
           if (!newinfo)
               ^~~~~~~~
   net/bridge/netfilter/ebtables.c:1133:2: note: Taking false branch
           if (!newinfo)
           ^
   net/bridge/netfilter/ebtables.c:1136:6: note: Assuming 'countersize' is 0
           if (countersize)
               ^~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1136:2: note: Taking false branch
           if (countersize)
           ^
   net/bridge/netfilter/ebtables.c:1140:6: note: Assuming field 'entries' i=
s non-null
           if (!newinfo->entries) {
               ^~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1140:2: note: Taking false branch
           if (!newinfo->entries) {
           ^
   net/bridge/netfilter/ebtables.c:1144:2: note: Taking false branch
           if (copy_from_user(
           ^
   net/bridge/netfilter/ebtables.c:1150:8: note: Calling 'do_replace_finish'
           ret =3D do_replace_finish(net, &tmp, newinfo);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1012:2: note: 'counterstmp' initialized =
to a null pointer value
           struct ebt_counter *counterstmp =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1020:6: note: Assuming field 'num_counte=
rs' is 0
           if (repl->num_counters) {
               ^~~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1020:2: note: Taking false branch
           if (repl->num_counters) {
           ^
   net/bridge/netfilter/ebtables.c:1029:6: note: Assuming 'ret' is equal to=
 0
           if (ret !=3D 0)
--
   drivers/infiniband/core/cma.c:4929:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&id_priv->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/infiniband/core/cma.c:4929:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&id_priv->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/infiniband/core/cma.c:4931:6: note: Assuming 'state' is not equa=
l to RDMA_CM_DESTROYING
           if (state =3D=3D RDMA_CM_DESTROYING || state =3D=3D RDMA_CM_DEVI=
CE_REMOVAL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4931:6: note: Left side of '||' is false
   drivers/infiniband/core/cma.c:4931:37: note: Assuming 'state' is not equ=
al to RDMA_CM_DEVICE_REMOVAL
           if (state =3D=3D RDMA_CM_DESTROYING || state =3D=3D RDMA_CM_DEVI=
CE_REMOVAL) {
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/infiniband/core/cma.c:4931:2: note: Taking false branch
           if (state =3D=3D RDMA_CM_DESTROYING || state =3D=3D RDMA_CM_DEVI=
CE_REMOVAL) {
           ^
   drivers/infiniband/core/cma.c:4940:6: note: Assuming the condition is tr=
ue
           if (cma_cm_event_handler(id_priv, &event)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4940:2: note: Taking true branch
           if (cma_cm_event_handler(id_priv, &event)) {
           ^
   drivers/infiniband/core/cma.c:4948:3: note: Calling '_destroy_id'
                   _destroy_id(id_priv, state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1886:6: note: Assuming field 'cma_dev' is =
null
           if (id_priv->cma_dev) {
               ^~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1886:2: note: Taking false branch
           if (id_priv->cma_dev) {
           ^
   drivers/infiniband/core/cma.c:1902:6: note: Assuming field 'internal_id'=
 is 0
           if (id_priv->internal_id)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1902:2: note: Taking false branch
           if (id_priv->internal_id)
           ^
   drivers/infiniband/core/cma.c:1908:2: note: Memory is released
           kfree(id_priv);
           ^~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4948:3: note: Returning; memory was releas=
ed
                   _destroy_id(id_priv, state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4973:3: note: Returning; memory was releas=
ed
                   cma_send_device_removal_put(id_priv);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4964:2: note: Loop condition is true.  Ent=
ering loop body
           while (!list_empty(&cma_dev->id_list)) {
           ^
   drivers/infiniband/core/cma.c:4970:3: note: Calling 'cma_id_get'
                   cma_id_get(id_priv);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:829:2: note: Calling 'refcount_inc'
           refcount_inc(&id_priv->refcount);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:267:2: note: Calling '__refcount_inc'
           __refcount_inc(r, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:250:2: note: Calling '__refcount_add'
           __refcount_add(1, r, oldp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:193:12: note: Calling 'atomic_fetch_add_relaxed'
           int old =3D atomic_fetch_add_relaxed(i, &r->refs);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:117:9: note: Calling 'arch_at=
omic_fetch_add'
           return arch_atomic_fetch_add_relaxed(i, v);
                  ^
   include/linux/atomic/atomic-arch-fallback.h:213:39: note: expanded from =
macro 'arch_atomic_fetch_add_relaxed'
   #define arch_atomic_fetch_add_relaxed arch_atomic_fetch_add
                                         ^
   arch/arm/include/asm/atomic.h:223:1: note: Loop condition is false.  Exi=
ting loop
   ATOMIC_OPS(add, +=3D, add)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
           ^
   arch/arm/include/asm/atomic.h:192:2: note: expanded from macro 'ATOMIC_F=
ETCH_OP'
           raw_local_irq_save(flags);                                      \
           ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   arch/arm/include/asm/atomic.h:223:1: note: Use of memory after it is fre=
ed
   ATOMIC_OPS(add, +=3D, add)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/atomic.h:193:8: note: expanded from macro 'ATOMIC_F=
ETCH_OP'
           val =3D v->counter;                                             =
  \
                 ^~~~~~~~~~
>> drivers/infiniband/core/cma.c:623:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&gid, dev_addr->src_dev_addr +
           ^~~~~~
   drivers/infiniband/core/cma.c:623:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&gid, dev_addr->src_dev_addr +
           ^~~~~~
   drivers/infiniband/core/cma.c:676:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&gid, dev_addr->src_dev_addr +
                   ^~~~~~
   drivers/infiniband/core/cma.c:676:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&gid, dev_addr->src_dev_addr +
                   ^~~~~~
   drivers/infiniband/core/cma.c:713:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&gid, dev_addr->src_dev_addr +
           ^~~~~~
   drivers/infiniband/core/cma.c:713:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&gid, dev_addr->src_dev_addr +
           ^~~~~~
   drivers/infiniband/core/cma.c:822:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&addr->sib_addr, &sgid, sizeof(sgid));
           ^~~~~~
   drivers/infiniband/core/cma.c:822:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&addr->sib_addr, &sgid, sizeof(sgid));
           ^~~~~~
   drivers/infiniband/core/cma.c:1145:21: warning: The left operand of '&' =
is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if ((*qp_attr_mask & IB_QP_TIMEOUT) && id_priv->timeout_set)
                              ^
   drivers/infiniband/core/cma.c:4462:9: note: Calling 'rdma_accept'
           return rdma_accept(id, conn_param);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4411:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&id_priv->handler_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/infiniband/core/cma.c:4411:2: note: Left side of '&&' is false
           lockdep_assert_held(&id_priv->handler_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/infiniband/core/cma.c:4411:2: note: Taking false branch
           lockdep_assert_held(&id_priv->handler_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/infiniband/core/cma.c:4411:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&id_priv->handler_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/infiniband/core/cma.c:4413:6: note: Left side of '||' is false
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
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
   drivers/infiniband/core/cma.c:4413:6: note: Left side of '||' is false
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
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
   drivers/infiniband/core/cma.c:4413:6: note: Left side of '||' is true
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
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
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/infiniband/core/cma.c:4413:6: note: Assuming the condition is fa=
lse
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
               ^
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
   #define READ_ONCE(x)                                                    \
                                                                           ^
   drivers/infiniband/core/cma.c:4413:2: note: Taking false branch
           if (READ_ONCE(id_priv->state) !=3D RDMA_CM_CONNECT)
           ^
   drivers/infiniband/core/cma.c:4416:6: note: Assuming field 'qp' is non-n=
ull
           if (!id->qp && conn_param) {
               ^~~~~~~
   drivers/infiniband/core/cma.c:4416:14: note: Left side of '&&' is false
           if (!id->qp && conn_param) {
                       ^
   drivers/infiniband/core/cma.c:4421:6: note: Assuming the condition is tr=
ue
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4421:2: note: Taking true branch
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
           ^
   drivers/infiniband/core/cma.c:4422:7: note: Assuming field 'qp_type' is =
not equal to IB_QPT_UD
                   if (id->qp_type =3D=3D IB_QPT_UD) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:4422:3: note: Taking false branch
                   if (id->qp_type =3D=3D IB_QPT_UD) {
                   ^
   drivers/infiniband/core/cma.c:4432:8: note: Assuming 'conn_param' is null
                           if (conn_param)
                               ^~~~~~~~~~
   drivers/infiniband/core/cma.c:4432:4: note: Taking false branch
                           if (conn_param)
                           ^
   drivers/infiniband/core/cma.c:4435:11: note: Calling 'cma_rep_recv'
                                   ret =3D cma_rep_recv(id_priv);
                                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1952:8: note: Calling 'cma_modify_qp_rtr'
           ret =3D cma_modify_qp_rtr(id_priv, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1006:6: note: 'qp_attr_mask' declared with=
out an initial value
           int qp_attr_mask, ret;
               ^~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1009:6: note: Assuming field 'qp' is non-n=
ull
           if (!id_priv->id.qp) {
               ^~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1009:2: note: Taking false branch
           if (!id_priv->id.qp) {
           ^
   drivers/infiniband/core/cma.c:1016:8: note: Calling 'rdma_init_qp_attr'
           ret =3D rdma_init_qp_attr(&id_priv->id, &qp_attr, &qp_attr_mask);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1123:6: note: Assuming the condition is fa=
lse
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1123:2: note: Taking false branch
           if (rdma_cap_ib_cm(id->device, id->port_num)) {
           ^
   drivers/infiniband/core/cma.c:1132:13: note: Assuming the condition is f=
alse
           } else if (rdma_cap_iw_cm(id->device, id->port_num)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cma.c:1132:9: note: Taking false branch
           } else if (rdma_cap_iw_cm(id->device, id->port_num)) {
                  ^
   drivers/infiniband/core/cma.c:1145:21: note: The left operand of '&' is =
a garbage value
           if ((*qp_attr_mask & IB_QP_TIMEOUT) && id_priv->timeout_set)
                ~~~~~~~~~~~~~ ^
   drivers/infiniband/core/cma.c:1259:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&ib->sib_addr, &path->sgid, 16);
                           ^~~~~~
   drivers/infiniband/core/cma.c:1259:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&ib->sib_addr, &path->sgid, 16);
                           ^~~~~~
   drivers/infiniband/core/cma.c:1277:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&ib->sib_addr, &path->dgid, 16);
                           ^~~~~~
   drivers/infiniband/core/cma.c:1277:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&ib->sib_addr, &path->dgid, 16);
                           ^~~~~~
   drivers/infiniband/core/cma.c:1391:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&req->local_gid, &req_param->primary_path->sgid,
                   ^~~~~~
   drivers/infiniband/core/cma.c:1391:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&req->local_gid, &req_param->primary_path->sgid,
                   ^~~~~~
>> drivers/infiniband/core/cma.c:1436:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fl4, 0, sizeof(fl4));
           ^~~~~~
   drivers/infiniband/core/cma.c:1436:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&fl4, 0, sizeof(fl4));
           ^~~~~~
   drivers/infiniband/core/cma.c:2323:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(sgid, 0, sizeof(*sgid));
                           ^~~~~~
   drivers/infiniband/core/cma.c:2323:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(sgid, 0, sizeof(*sgid));
                           ^~~~~~
   drivers/infiniband/core/cma.c:2325:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(dgid, 0, sizeof(*dgid));
                           ^~~~~~
   drivers/infiniband/core/cma.c:2325:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(dgid, 0, sizeof(*dgid));
                           ^~~~~~
   drivers/infiniband/core/cma.c:2360:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cma_src_addr(id_priv), laddr,
                   ^~~~~~
   drivers/infiniband/core/cma.c:2360:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cma_src_addr(id_priv), laddr,
                   ^~~~~~
   drivers/infiniband/core/cma.c:2362:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cma_dst_addr(id_priv), raddr,
                   ^~~~~~
   drivers/infiniband/core/cma.c:2362:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cma_dst_addr(id_priv), raddr,
                   ^~~~~~
   drivers/infiniband/core/cma.c:2458:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cma_src_addr(conn_id), laddr, rdma_addr_size(laddr));
           ^~~~~~
   drivers/infiniband/core/cma.c:2458:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cma_src_addr(conn_id), laddr, rdma_addr_size(laddr));
           ^~~~~~
   drivers/infiniband/core/cma.c:2459:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cma_dst_addr(conn_id), raddr, rdma_addr_size(raddr));
           ^~~~~~
   drivers/infiniband/core/cma.c:2459:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cma_dst_addr(conn_id), raddr, rdma_addr_size(raddr));
           ^~~~~~
   drivers/infiniband/core/cma.c:2512:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&id_priv->cm_id.iw->local_addr, cma_src_addr(id_priv),
           ^~~~~~
   drivers/infiniband/core/cma.c:2512:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&id_priv->cm_id.iw->local_addr, cma_src_addr(id_priv),
           ^~~~~~
   drivers/infiniband/core/cma.c:2561:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cma_src_addr(dev_id_priv), cma_src_addr(id_priv),
           ^~~~~~
   drivers/infiniband/core/cma.c:2561:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cma_src_addr(dev_id_priv), cma_src_addr(id_priv),
           ^~~~~~
   drivers/infiniband/core/cma.c:2729:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&path_rec, 0, sizeof path_rec);
           ^~~~~~
   drivers/infiniband/core/cma.c:2729:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&path_rec, 0, sizeof path_rec);
           ^~~~~~
   drivers/infiniband/core/cma.c:3288:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&old_addr, addr, rdma_addr_size(addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:3288:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&old_addr, addr, rdma_addr_size(addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:3289:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, src_addr, rdma_addr_size(src_addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:3289:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(addr, src_addr, rdma_addr_size(src_addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:3301:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(addr, &old_addr,
                   ^~~~~~
   drivers/infiniband/core/cma.c:3301:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(addr, &old_addr,
                   ^~~~~~
   drivers/infiniband/core/cma.c:3403:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cma_dst_addr(id_priv), dst_addr, rdma_addr_size(dst_addr)=
);
           ^~~~~~
   drivers/infiniband/core/cma.c:3403:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cma_dst_addr(id_priv), dst_addr, rdma_addr_size(dst_addr)=
);
           ^~~~~~
   drivers/infiniband/core/cma.c:3425:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cma_dst_addr(id_priv), 0, rdma_addr_size(dst_addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:3425:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(cma_dst_addr(id_priv), 0, rdma_addr_size(dst_addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:3897:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cma_src_addr(id_priv), addr, rdma_addr_size(addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:3897:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cma_src_addr(id_priv), addr, rdma_addr_size(addr));
           ^~~~~~
   drivers/infiniband/core/cma.c:4042:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof req);
           ^~~~~~
   drivers/infiniband/core/cma.c:4042:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof req);
--
                         ^
   drivers/infiniband/core/mad.c:2754:2: note: Taking false branch
           if (!qp_info->qp)
           ^
   drivers/infiniband/core/mad.c:2757:2: note: Loop condition is true.  Ent=
ering loop body
           while (!list_empty(&qp_info->recv_queue.list)) {
           ^
   drivers/infiniband/core/mad.c:2774:3: note: Memory is released
                   kfree(recv);
                   ^~~~~~~~~~~
   drivers/infiniband/core/mad.c:2757:2: note: Loop condition is true.  Ent=
ering loop body
           while (!list_empty(&qp_info->recv_queue.list)) {
           ^
   drivers/infiniband/core/mad.c:2768:3: note: Calling 'list_del'
                   list_del(&mad_list->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   drivers/infiniband/core/mad.c:3122:2: note: Loop condition is true.  Ent=
ering loop body
           rdma_for_each_port (device, i) {
           ^
   include/rdma/ib_verbs.h:3032:2: note: expanded from macro 'rdma_for_each=
_port'
           for (iter =3D rdma_start_port(device +                          =
         \
           ^
   drivers/infiniband/core/mad.c:3123:7: note: Assuming the condition is fa=
lse
                   if (!rdma_cap_ib_mad(device, i))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/mad.c:3123:3: note: Taking false branch
                   if (!rdma_cap_ib_mad(device, i))
                   ^
   drivers/infiniband/core/mad.c:3126:7: note: Assuming the condition is fa=
lse
                   if (ib_agent_port_close(device, i))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/mad.c:3126:3: note: Taking false branch
                   if (ib_agent_port_close(device, i))
                   ^
   drivers/infiniband/core/mad.c:3129:7: note: Calling 'ib_mad_port_close'
                   if (ib_mad_port_close(device, i))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/mad.c:3046:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&ib_mad_port_list_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/infiniband/core/mad.c:3046:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&ib_mad_port_list_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/infiniband/core/mad.c:3048:6: note: 'port_priv' is not equal to =
NULL
           if (port_priv =3D=3D NULL) {
               ^~~~~~~~~
   drivers/infiniband/core/mad.c:3048:2: note: Taking false branch
           if (port_priv =3D=3D NULL) {
           ^
   drivers/infiniband/core/mad.c:3061:2: note: Calling 'cleanup_recv_queue'
           cleanup_recv_queue(&port_priv->qp_info[1]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/mad.c:2754:16: note: Field 'qp' is non-null
           if (!qp_info->qp)
                         ^
   drivers/infiniband/core/mad.c:2754:2: note: Taking false branch
           if (!qp_info->qp)
           ^
   drivers/infiniband/core/mad.c:2757:2: note: Loop condition is true.  Ent=
ering loop body
           while (!list_empty(&qp_info->recv_queue.list)) {
           ^
   drivers/infiniband/core/mad.c:2774:3: note: Memory is released
                   kfree(recv);
                   ^~~~~~~~~~~
   drivers/infiniband/core/mad.c:2757:2: note: Loop condition is true.  Ent=
ering loop body
           while (!list_empty(&qp_info->recv_queue.list)) {
           ^
   drivers/infiniband/core/mad.c:2768:3: note: Calling 'list_del'
                   list_del(&mad_list->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 91 warnings (87 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   84 warnings generated.
>> net/bluetooth/bnep/core.c:134:4: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(f + i, 0, sizeof(*f));
                           ^~~~~~
   net/bluetooth/bnep/core.c:134:4: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                           memset(f + i, 0, sizeof(*f));
                           ^~~~~~
>> net/bluetooth/bnep/core.c:180:4: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(a1, data, ETH_ALEN);
                           ^~~~~~
   net/bluetooth/bnep/core.c:180:4: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                           memcpy(a1, data, ETH_ALEN);
                           ^~~~~~
   net/bluetooth/bnep/core.c:595:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(s->eh.h_dest,   &src, ETH_ALEN);
           ^~~~~~
   net/bluetooth/bnep/core.c:595:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(s->eh.h_dest,   &src, ETH_ALEN);
           ^~~~~~
   net/bluetooth/bnep/core.c:596:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(s->eh.h_source, &dst, ETH_ALEN);
           ^~~~~~
   net/bluetooth/bnep/core.c:596:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(s->eh.h_source, &dst, ETH_ALEN);
           ^~~~~~
   net/bluetooth/bnep/core.c:641:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(req->device, dev->name);
           ^~~~~~
   net/bluetooth/bnep/core.c:641:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(req->device, dev->name);
           ^~~~~~
   net/bluetooth/bnep/core.c:678:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ci, 0, sizeof(*ci));
           ^~~~~~
   net/bluetooth/bnep/core.c:678:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(ci, 0, sizeof(*ci));
           ^~~~~~
   net/bluetooth/bnep/core.c:679:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ci->dst, s->eh.h_source, ETH_ALEN);
           ^~~~~~
   net/bluetooth/bnep/core.c:679:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ci->dst, s->eh.h_source, ETH_ALEN);
           ^~~~~~
   net/bluetooth/bnep/core.c:680:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ci->device, s->dev->name);
           ^~~~~~
   net/bluetooth/bnep/core.c:680:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(ci->device, s->dev->name);
           ^~~~~~
   net/bluetooth/bnep/core.c:736:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(flt, "protocol ");
           ^~~~~~
   net/bluetooth/bnep/core.c:736:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           strcat(flt, "protocol ");
           ^~~~~~
   net/bluetooth/bnep/core.c:740:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(flt, "multicast");
           ^~~~~~
   net/bluetooth/bnep/core.c:740:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           strcat(flt, "multicast");
           ^~~~~~
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   kernel/events/core.c:3807:35: warning: Access to field 'ctx' results in =
a dereference of a null pointer (loaded from variable 'event') [clang-analy=
zer-core.NullDereference]
           struct perf_event_context *ctx =3D event->ctx;
                                            ^
   kernel/events/core.c:13567:2: note: Calling 'perf_cgroup_switch'
           perf_cgroup_switch(task, PERF_CGROUP_SWOUT | PERF_CGROUP_SWIN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:850:2: note: Loop condition is false.  Exiting loop
           local_irq_save(flags);
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
   kernel/events/core.c:850:2: note: Loop condition is false.  Exiting loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   kernel/events/core.c:852:9: note: Loop condition is false.  Exiting loop
           list =3D this_cpu_ptr(&cgrp_cpuctx_list);
                  ^
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
                                   ^
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_p=
tr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                   ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/events/core.c:853:2: note: Loop condition is true.  Entering loop=
 body
           list_for_each_entry_safe(cpuctx, tmp, list, cgrp_cpuctx_entry) {
--
                                   ^~~~~~
   net/ceph/crush/mapper.c:1073:5: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(o, c, osize*sizeof(*o));
                                   ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
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
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   Suppressed 67 warnings (61 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   kernel/sched/deadline.c:1534:22: warning: Value stored to 'p' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct task_struct *p =3D dl_task_of(dl_se);
                               ^   ~~~~~~~~~~~~~~~~~
   kernel/sched/deadline.c:1534:22: note: Value stored to 'p' during its in=
itialization is never read
           struct task_struct *p =3D dl_task_of(dl_se);
                               ^   ~~~~~~~~~~~~~~~~~
   Suppressed 63 warnings (61 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   Suppressed 93 warnings (92 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
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
   68 warnings generated.
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   109 warnings generated.
   Suppressed 109 warnings (108 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (84 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   Suppressed 78 warnings (73 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   Suppressed 78 warnings (73 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   Suppressed 89 warnings (83 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   net/rxrpc/input.c:999:25: warning: Value stored to 'sp' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct rxrpc_skb_priv *sp =3D rxrpc_skb(skb);
                                  ^~
   net/rxrpc/input.c:999:25: note: Value stored to 'sp' during its initiali=
zation is never read
           struct rxrpc_skb_priv *sp =3D rxrpc_skb(skb);
                                  ^~
   net/rxrpc/input.c:1182:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sp, 0, sizeof(*sp));
           ^~~~~~
   net/rxrpc/input.c:1182:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(sp, 0, sizeof(*sp));
           ^~~~~~
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
   Suppressed 87 warnings (86 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> drivers/mmc/host/sdhci-s3c.c:512:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(pdata, pdev->dev.platform_data, sizeof(*pdata));
                   ^~~~~~
   drivers/mmc/host/sdhci-s3c.c:512:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(pdata, pdev->dev.platform_data, sizeof(*pdata));
                   ^~~~~~
>> drivers/mmc/host/sdhci-s3c.c:537:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, 14, "mmc_busclk.%d", ptr);
                   ^~~~~~~~
   drivers/mmc/host/sdhci-s3c.c:537:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, 14, "mmc_busclk.%d", ptr);
                   ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   net/bridge/br_arp_nd_proxy.c:151:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sip, arpptr, sizeof(sip));
           ^~~~~~
   net/bridge/br_arp_nd_proxy.c:151:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&sip, arpptr, sizeof(sip));
           ^~~~~~
   net/bridge/br_arp_nd_proxy.c:154:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tip, arpptr, sizeof(tip));
           ^~~~~~
   net/bridge/br_arp_nd_proxy.c:154:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tip, arpptr, sizeof(tip));
           ^~~~~~
   net/bridge/br_arp_nd_proxy.c:308:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pip6, 0, sizeof(struct ipv6hdr));
           ^~~~~~
   net/bridge/br_arp_nd_proxy.c:308:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(pip6, 0, sizeof(struct ipv6hdr));
           ^~~~~~
   net/bridge/br_arp_nd_proxy.c:322:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(na, 0, sizeof(*na) + na_olen);
           ^~~~~~
   net/bridge/br_arp_nd_proxy.c:322:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(na, 0, sizeof(*na) + na_olen);
           ^~~~~~
   Suppressed 92 warnings (91 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   net/decnet/dn_neigh.c:140:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(neigh->ha, dev->broadcast, dev->addr_len);
                   ^~~~~~
   net/decnet/dn_neigh.c:140:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(neigh->ha, dev->broadcast, dev->addr_len);
                   ^~~~~~
   net/decnet/dn_neigh.c:407:5: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(neigh->ha, &eth_hdr(skb)->h_sourc=
e, ETH_ALEN);
                                   ^~~~~~
   net/decnet/dn_neigh.c:407:5: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                                   memcpy(neigh->ha, &eth_hdr(skb)->h_sourc=
e, ETH_ALEN);
                                   ^~~~~~
   net/decnet/dn_neigh.c:466:5: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(neigh->ha, &eth_hdr(skb)->h_sourc=
e, ETH_ALEN);
                                   ^~~~~~
   net/decnet/dn_neigh.c:466:5: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                                   memcpy(neigh->ha, &eth_hdr(skb)->h_sourc=
e, ETH_ALEN);
                                   ^~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   105 warnings generated.
   Suppressed 105 warnings (102 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   109 warnings generated.
   Suppressed 109 warnings (108 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   113 warnings generated.
   net/ipv6/netfilter/nf_reject_ipv6.c:268:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fl, 0, sizeof(struct flowi));
           ^~~~~~
   net/ipv6/netfilter/nf_reject_ipv6.c:268:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&fl, 0, sizeof(struct flowi));
           ^~~~~~
   net/ipv6/netfilter/nf_reject_ipv6.c:301:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fl6, 0, sizeof(fl6));
           ^~~~~~
   net/ipv6/netfilter/nf_reject_ipv6.c:301:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&fl6, 0, sizeof(fl6));
           ^~~~~~
   net/ipv6/netfilter/nf_reject_ipv6.c:343:2: warning: Value stored to 'ip6=
h' is never read [clang-analyzer-deadcode.DeadStores]
           ip6h =3D nf_reject_ip6hdr_put(nskb, oldskb, IPPROTO_TCP,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/netfilter/nf_reject_ipv6.c:343:2: note: Value stored to 'ip6h' =
is never read
           ip6h =3D nf_reject_ip6hdr_put(nskb, oldskb, IPPROTO_TCP,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 110 warnings (103 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +91 arch/arm/crypto/poly1305-glue.c

a6b803b3ddc793 Ard Biesheuvel     2019-11-08   84  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08   85  static void arm_poly1305=
_do_update(struct poly1305_desc_ctx *dctx,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   86  				    const u8 *src, u=
32 len, bool do_neon)
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   87  {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   88  	if (unlikely(dctx->bufl=
en)) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   89  		u32 bytes =3D min(len,=
 POLY1305_BLOCK_SIZE - dctx->buflen);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   90  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  @91  		memcpy(dctx->buf + dct=
x->buflen, src, bytes);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   92  		src +=3D bytes;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   93  		len -=3D bytes;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   94  		dctx->buflen +=3D byte=
s;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   95  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08   96  		if (dctx->buflen =3D=
=3D POLY1305_BLOCK_SIZE) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   97  			arm_poly1305_blocks(d=
ctx, dctx->buf,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   98  					    POLY1305_BLOCK_=
SIZE, 1, false);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08   99  			dctx->buflen =3D 0;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  100  		}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  101  	}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  102  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  103  	if (likely(len >=3D POL=
Y1305_BLOCK_SIZE)) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  104  		arm_poly1305_blocks(dc=
tx, src, len, 1, do_neon);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  105  		src +=3D round_down(le=
n, POLY1305_BLOCK_SIZE);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  106  		len %=3D POLY1305_BLOC=
K_SIZE;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  107  	}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  108  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  109  	if (unlikely(len)) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  110  		dctx->buflen =3D len;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  111  		memcpy(dctx->buf, src,=
 len);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  112  	}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  113  }
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  114  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  115  static int arm_poly1305_=
update(struct shash_desc *desc,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  116  			       const u8 *src,=
 unsigned int srclen)
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  117  {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  118  	struct poly1305_desc_ct=
x *dctx =3D shash_desc_ctx(desc);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  119  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  120  	arm_poly1305_do_update(=
dctx, src, srclen, false);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  121  	return 0;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  122  }
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  123  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  124  static int __maybe_unuse=
d arm_poly1305_update_neon(struct shash_desc *desc,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  125  						   const u8 *src,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  126  						   unsigned int sr=
clen)
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  127  {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  128  	struct poly1305_desc_ct=
x *dctx =3D shash_desc_ctx(desc);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  129  	bool do_neon =3D crypto=
_simd_usable() && srclen > 128;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  130  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  131  	if (static_branch_likel=
y(&have_neon) && do_neon)
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  132  		kernel_neon_begin();
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  133  	arm_poly1305_do_update(=
dctx, src, srclen, do_neon);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  134  	if (static_branch_likel=
y(&have_neon) && do_neon)
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  135  		kernel_neon_end();
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  136  	return 0;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  137  }
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  138  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  139  void poly1305_update_arc=
h(struct poly1305_desc_ctx *dctx, const u8 *src,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  140  			  unsigned int nbytes)
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  141  {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  142  	bool do_neon =3D IS_ENA=
BLED(CONFIG_KERNEL_MODE_NEON) &&
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  143  		       crypto_simd_usa=
ble();
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  144  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  145  	if (unlikely(dctx->bufl=
en)) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  146  		u32 bytes =3D min(nbyt=
es, POLY1305_BLOCK_SIZE - dctx->buflen);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  147  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  148  		memcpy(dctx->buf + dct=
x->buflen, src, bytes);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  149  		src +=3D bytes;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  150  		nbytes -=3D bytes;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  151  		dctx->buflen +=3D byte=
s;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  152  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  153  		if (dctx->buflen =3D=
=3D POLY1305_BLOCK_SIZE) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  154  			poly1305_blocks_arm(&=
dctx->h, dctx->buf,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  155  					    POLY1305_BLOCK_=
SIZE, 1);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  156  			dctx->buflen =3D 0;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  157  		}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  158  	}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  159  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  160  	if (likely(nbytes >=3D =
POLY1305_BLOCK_SIZE)) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  161  		unsigned int len =3D r=
ound_down(nbytes, POLY1305_BLOCK_SIZE);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  162  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  163  		if (static_branch_like=
ly(&have_neon) && do_neon) {
706024a52c614b Jason A. Donenfeld 2020-04-22  164  			do {
706024a52c614b Jason A. Donenfeld 2020-04-22  165  				unsigned int todo =
=3D min_t(unsigned int, len, SZ_4K);
706024a52c614b Jason A. Donenfeld 2020-04-22  166  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  167  				kernel_neon_begin();
706024a52c614b Jason A. Donenfeld 2020-04-22  168  				poly1305_blocks_neon=
(&dctx->h, src, todo, 1);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  169  				kernel_neon_end();
706024a52c614b Jason A. Donenfeld 2020-04-22  170  =

706024a52c614b Jason A. Donenfeld 2020-04-22  171  				len -=3D todo;
706024a52c614b Jason A. Donenfeld 2020-04-22  172  				src +=3D todo;
706024a52c614b Jason A. Donenfeld 2020-04-22  173  			} while (len);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  174  		} else {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  175  			poly1305_blocks_arm(&=
dctx->h, src, len, 1);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  176  			src +=3D len;
706024a52c614b Jason A. Donenfeld 2020-04-22  177  		}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  178  		nbytes %=3D POLY1305_B=
LOCK_SIZE;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  179  	}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  180  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  181  	if (unlikely(nbytes)) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  182  		dctx->buflen =3D nbyte=
s;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  183  		memcpy(dctx->buf, src,=
 nbytes);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  184  	}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  185  }
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  186  EXPORT_SYMBOL(poly1305_u=
pdate_arch);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  187  =

a6b803b3ddc793 Ard Biesheuvel     2019-11-08  188  void poly1305_final_arch=
(struct poly1305_desc_ctx *dctx, u8 *dst)
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  189  {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  190  	if (unlikely(dctx->bufl=
en)) {
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  191  		dctx->buf[dctx->buflen=
++] =3D 1;
a6b803b3ddc793 Ard Biesheuvel     2019-11-08 @192  		memset(dctx->buf + dct=
x->buflen, 0,
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  193  		       POLY1305_BLOCK_=
SIZE - dctx->buflen);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  194  		poly1305_blocks_arm(&d=
ctx->h, dctx->buf, POLY1305_BLOCK_SIZE, 0);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  195  	}
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  196  =

31899908a0d248 Jason A. Donenfeld 2020-01-05  197  	poly1305_emit_arm(&dctx=
->h, dst, dctx->s);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  198  	*dctx =3D (struct poly1=
305_desc_ctx){};
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  199  }
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  200  EXPORT_SYMBOL(poly1305_f=
inal_arch);
a6b803b3ddc793 Ard Biesheuvel     2019-11-08  201  =


:::::: The code at line 91 was first introduced by commit
:::::: a6b803b3ddc793d6db0c16f12fc12d30d20fa9cc crypto: arm/poly1305 - inco=
rporate OpenSSL/CRYPTOGAMS NEON implementation

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1758884044573000383==--

