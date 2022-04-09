Content-Type: multipart/mixed; boundary="===============3948585988244220071=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/musb/musb_gadget.c:1705:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments o...
Date: Sat, 09 Apr 2022 11:19:08 +0800
Message-ID: <202204091159.GuVIoSDk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3948585988244220071==
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
head:   1831fed559732b132aef0ea8261ac77e73f7eadf
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   4 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220408 (https://download.01.org/0day-ci/arc=
hive/20220409/202204091159.GuVIoSDk-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:198:7: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           rc =3D sprintf(buf, "%d\n", cap.stclear_flags.deactivated);
                ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:222:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           str +=3D sprintf(str, "Manufacturer: 0x%x\n",
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:222:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           str +=3D sprintf(str, "Manufacturer: 0x%x\n",
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:243:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           str +=3D sprintf(str,
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:243:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           str +=3D sprintf(str,
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:278:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%d %d %d [%s]\n",
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:278:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%d %d %d [%s]\n",
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:292:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%d %d %d %d [%s]\n",
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:292:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%d %d %d %d [%s]\n",
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:307:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%s\n", chip->flags & TPM_CHIP_FLAG_TPM2
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:307:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%s\n", chip->flags & TPM_CHIP_FLAG_TPM2
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:372:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "%02X", digest.digest[i]);
                          ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:372:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "%02X", digest.digest[i]);
                          ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:373:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           str +=3D sprintf(str, "\n");
                  ^~~~~~~
   drivers/char/tpm/tpm-sysfs.c:373:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           str +=3D sprintf(str, "\n");
                  ^~~~~~~
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   crypto/curve25519-generic.c:18:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(secret, buf, CURVE25519_KEY_SIZE);
                   ^~~~~~
   crypto/curve25519-generic.c:18:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(secret, buf, CURVE25519_KEY_SIZE);
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/usb/musb/musb_gadget.c:36:25: warning: Value stored to 'dma' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dma_controller *dma =3D musb->dma_controller;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:36:25: note: Value stored to 'dma' during=
 its initialization is never read
           struct dma_controller *dma =3D musb->dma_controller;
                                  ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:86:18: warning: Value stored to 'musb_ep'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct musb_ep *musb_ep =3D request->ep;
                           ^~~~~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:86:18: note: Value stored to 'musb_ep' du=
ring its initialization is never read
           struct musb_ep *musb_ep =3D request->ep;
                           ^~~~~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:160:16: warning: Value stored to 'musb' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb             *musb =3D ep->musb;
                                    ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_gadget.c:160:16: note: Value stored to 'musb' duri=
ng its initialization is never read
           struct musb             *musb =3D ep->musb;
                                    ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_gadget.c:162:16: warning: Value stored to 'epio' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem *epio =3D ep->musb->endpoints[ep->current_epnum].re=
gs;
                         ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:162:16: note: Value stored to 'epio' duri=
ng its initialization is never read
           void __iomem *epio =3D ep->musb->endpoints[ep->current_epnum].re=
gs;
                         ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_gadget.c:593:4: warning: Value stored to 'use_mode=
_1' is never read [clang-analyzer-deadcode.DeadStores]
                           use_mode_1 =3D 1;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:593:4: note: Value stored to 'use_mode_1'=
 is never read
                           use_mode_1 =3D 1;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:595:4: warning: Value stored to 'use_mode=
_1' is never read [clang-analyzer-deadcode.DeadStores]
                           use_mode_1 =3D 0;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:595:4: note: Value stored to 'use_mode_1'=
 is never read
                           use_mode_1 =3D 0;
                           ^            ~
   drivers/usb/musb/musb_gadget.c:1696:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ep, 0, sizeof *ep);
           ^~~~~~
   drivers/usb/musb/musb_gadget.c:1696:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(ep, 0, sizeof *ep);
           ^~~~~~
>> drivers/usb/musb/musb_gadget.c:1705:2: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           sprintf(ep->name, "ep%d%s", epnum,
           ^~~~~~~
   drivers/usb/musb/musb_gadget.c:1705:2: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           sprintf(ep->name, "ep%d%s", epnum,
           ^~~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/iio/potentiometer/ad5272.c:49:8: warning: Excessive padding in '=
struct ad5272_data' (94 padding bytes, where 30 is optimal). =

   Optimal fields order: =

   buf, =

   client, =

   cfg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5272_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/potentiometer/ad5272.c:49:8: note: Excessive padding in 'str=
uct ad5272_data' (94 padding bytes, where 30 is optimal). Optimal fields or=
der: buf, client, cfg, lock, consider reordering the fields or adding expli=
cit padding members
   struct ad5272_data {
   ~~~~~~~^~~~~~~~~~~~~
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
   44 warnings generated.
   drivers/iio/potentiostat/lmp91000.c:141:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data->buffer, 0, sizeof(data->buffer));
           ^~~~~~
   drivers/iio/potentiostat/lmp91000.c:141:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(data->buffer, 0, sizeof(data->buffer));
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/usb/gadget/udc/udc-xilinx.c:502:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:502:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:506:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:506:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:520:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:520:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:524:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:524:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:635:3: warning: Value stored to 'buf=
ferspace' is never read [clang-analyzer-deadcode.DeadStores]
                   bufferspace -=3D count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:635:3: note: Value stored to 'buffer=
space' is never read
                   bufferspace -=3D count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:680:19: warning: Value stored to 'ud=
c' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct xusb_udc *udc =3D ep->udc;
                            ^~~   ~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:680:19: note: Value stored to 'udc' =
during its initialization is never read
           struct xusb_udc *udc =3D ep->udc;
                            ^~~   ~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:695:14: warning: Although the value =
stored to 'is_short' is used in the enclosing expression, the value is neve=
r actually read from 'is_short' [clang-analyzer-deadcode.DeadStores]
                           is_last =3D is_short =3D 1;
                                     ^          ~
   drivers/usb/gadget/udc/udc-xilinx.c:695:14: note: Although the value sto=
red to 'is_short' is used in the enclosing expression, the value is never a=
ctually read from 'is_short'
                           is_last =3D is_short =3D 1;
                                     ^          ~
   drivers/usb/gadget/udc/udc-xilinx.c:1026:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(corebuf, req->usb_req.buf, length);
                   ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1026:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(corebuf, req->usb_req.buf, length);
                   ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1139:19: warning: Value stored to 'r=
eq' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xusb_req *req    =3D to_xusb_req(_req);
                            ^~~
   drivers/usb/gadget/udc/udc-xilinx.c:1139:19: note: Value stored to 'req'=
 during its initialization is never read
           struct xusb_req *req    =3D to_xusb_req(_req);
                            ^~~
   drivers/usb/gadget/udc/udc-xilinx.c:1311:4: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(ep->name, EPNAME_SIZE, "ep%d", ep_numbe=
r);
                           ^~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1311:4: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(ep->name, EPNAME_SIZE, "ep%d", ep_numbe=
r);
                           ^~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1746:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&setup, ep0rambase, 8);

vim +1705 drivers/usb/musb/musb_gadget.c

550a7375fe7209 Felipe Balbi   2008-07-24  1685  =

550a7375fe7209 Felipe Balbi   2008-07-24  1686  /* Only this registration c=
ode "knows" the rule (from USB standards)
550a7375fe7209 Felipe Balbi   2008-07-24  1687   * about there being only o=
ne external upstream port.  It assumes
550a7375fe7209 Felipe Balbi   2008-07-24  1688   * all peripheral ports are=
 external...
550a7375fe7209 Felipe Balbi   2008-07-24  1689   */
550a7375fe7209 Felipe Balbi   2008-07-24  1690  =

41ac7b3ab7fe1d Bill Pemberton 2012-11-19  1691  static void
550a7375fe7209 Felipe Balbi   2008-07-24  1692  init_peripheral_ep(struct m=
usb *musb, struct musb_ep *ep, u8 epnum, int is_in)
550a7375fe7209 Felipe Balbi   2008-07-24  1693  {
550a7375fe7209 Felipe Balbi   2008-07-24  1694  	struct musb_hw_ep	*hw_ep =
=3D musb->endpoints + epnum;
550a7375fe7209 Felipe Balbi   2008-07-24  1695  =

550a7375fe7209 Felipe Balbi   2008-07-24  1696  	memset(ep, 0, sizeof *ep);
550a7375fe7209 Felipe Balbi   2008-07-24  1697  =

550a7375fe7209 Felipe Balbi   2008-07-24  1698  	ep->current_epnum =3D epnu=
m;
550a7375fe7209 Felipe Balbi   2008-07-24  1699  	ep->musb =3D musb;
550a7375fe7209 Felipe Balbi   2008-07-24  1700  	ep->hw_ep =3D hw_ep;
550a7375fe7209 Felipe Balbi   2008-07-24  1701  	ep->is_in =3D is_in;
550a7375fe7209 Felipe Balbi   2008-07-24  1702  =

550a7375fe7209 Felipe Balbi   2008-07-24  1703  	INIT_LIST_HEAD(&ep->req_li=
st);
550a7375fe7209 Felipe Balbi   2008-07-24  1704  =

550a7375fe7209 Felipe Balbi   2008-07-24 @1705  	sprintf(ep->name, "ep%d%s"=
, epnum,
550a7375fe7209 Felipe Balbi   2008-07-24  1706  			(!epnum || hw_ep->is_sha=
red_fifo) ? "" : (
550a7375fe7209 Felipe Balbi   2008-07-24  1707  				is_in ? "in" : "out"));
550a7375fe7209 Felipe Balbi   2008-07-24  1708  	ep->end_point.name =3D ep-=
>name;
550a7375fe7209 Felipe Balbi   2008-07-24  1709  	INIT_LIST_HEAD(&ep->end_po=
int.ep_list);
550a7375fe7209 Felipe Balbi   2008-07-24  1710  	if (!epnum) {
e117e742d31068 Robert Baldyga 2013-12-13  1711  		usb_ep_set_maxpacket_limi=
t(&ep->end_point, 64);
8501955e888662 Robert Baldyga 2015-07-31  1712  		ep->end_point.caps.type_c=
ontrol =3D true;
550a7375fe7209 Felipe Balbi   2008-07-24  1713  		ep->end_point.ops =3D &mu=
sb_g_ep0_ops;
550a7375fe7209 Felipe Balbi   2008-07-24  1714  		musb->g.ep0 =3D &ep->end_=
point;
550a7375fe7209 Felipe Balbi   2008-07-24  1715  	} else {
550a7375fe7209 Felipe Balbi   2008-07-24  1716  		if (is_in)
e117e742d31068 Robert Baldyga 2013-12-13  1717  			usb_ep_set_maxpacket_lim=
it(&ep->end_point, hw_ep->max_packet_sz_tx);
550a7375fe7209 Felipe Balbi   2008-07-24  1718  		else
e117e742d31068 Robert Baldyga 2013-12-13  1719  			usb_ep_set_maxpacket_lim=
it(&ep->end_point, hw_ep->max_packet_sz_rx);
8501955e888662 Robert Baldyga 2015-07-31  1720  		ep->end_point.caps.type_i=
so =3D true;
8501955e888662 Robert Baldyga 2015-07-31  1721  		ep->end_point.caps.type_b=
ulk =3D true;
8501955e888662 Robert Baldyga 2015-07-31  1722  		ep->end_point.caps.type_i=
nt =3D true;
550a7375fe7209 Felipe Balbi   2008-07-24  1723  		ep->end_point.ops =3D &mu=
sb_ep_ops;
550a7375fe7209 Felipe Balbi   2008-07-24  1724  		list_add_tail(&ep->end_po=
int.ep_list, &musb->g.ep_list);
550a7375fe7209 Felipe Balbi   2008-07-24  1725  	}
8501955e888662 Robert Baldyga 2015-07-31  1726  =

8501955e888662 Robert Baldyga 2015-07-31  1727  	if (!epnum || hw_ep->is_sh=
ared_fifo) {
8501955e888662 Robert Baldyga 2015-07-31  1728  		ep->end_point.caps.dir_in=
 =3D true;
8501955e888662 Robert Baldyga 2015-07-31  1729  		ep->end_point.caps.dir_ou=
t =3D true;
8501955e888662 Robert Baldyga 2015-07-31  1730  	} else if (is_in)
8501955e888662 Robert Baldyga 2015-07-31  1731  		ep->end_point.caps.dir_in=
 =3D true;
8501955e888662 Robert Baldyga 2015-07-31  1732  	else
8501955e888662 Robert Baldyga 2015-07-31  1733  		ep->end_point.caps.dir_ou=
t =3D true;
550a7375fe7209 Felipe Balbi   2008-07-24  1734  }
550a7375fe7209 Felipe Balbi   2008-07-24  1735  =


:::::: The code at line 1705 was first introduced by commit
:::::: 550a7375fe720924241f0eb76e4a5c1a3eb8c32f USB: Add MUSB and TUSB supp=
ort

:::::: TO: Felipe Balbi <felipe.balbi@nokia.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3948585988244220071==--

