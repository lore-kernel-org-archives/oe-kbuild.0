Content-Type: multipart/mixed; boundary="===============1084286738367975822=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/atm/ueagle-atm.c:2367:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Tue, 29 Mar 2022 21:52:13 +0800
Message-ID: <202203292135.mcqr0P9H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1084286738367975822==
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
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220328 (https://download.01.org/0day-ci/archi=
ve/20220329/202203292135.mcqr0P9H-lkp(a)intel.com/config)
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
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/usb/serial/whiteheat.c:514:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(command_info->result_buffer, &data[1],
                   ^~~~~~
   drivers/usb/serial/whiteheat.c:514:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(command_info->result_buffer, &data[1],
                   ^~~~~~
   drivers/usb/serial/whiteheat.c:538:17: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/whiteheat.c:538:17: note: Value stored to 'dev' durin=
g its initialization is never read
           struct device *dev =3D &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/whiteheat.c:556:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&transfer_buffer[1], data, datasize);
           ^~~~~~
   drivers/usb/serial/whiteheat.c:556:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&transfer_buffer[1], data, datasize);
           ^~~~~~
   drivers/usb/serial/whiteheat.c:587:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&info->mcr, command_info->result_buffer,
                           ^~~~~~
   drivers/usb/serial/whiteheat.c:587:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&info->mcr, command_info->result_buffer,
                           ^~~~~~
   drivers/usb/serial/whiteheat.c:621:17: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &port->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/serial/whiteheat.c:621:17: note: Value stored to 'dev' durin=
g its initialization is never read
           struct device *dev =3D &port->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   drivers/usb/atm/ueagle-atm.c:1178:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmv, 0, sizeof(cmv));
           ^~~~~~
   drivers/usb/atm/ueagle-atm.c:1178:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&cmv, 0, sizeof(cmv));
           ^~~~~~
   drivers/usb/atm/ueagle-atm.c:1574:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cmv_name, FW_DIR);
           ^~~~~~
   drivers/usb/atm/ueagle-atm.c:1574:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(cmv_name, FW_DIR);
           ^~~~~~
   drivers/usb/atm/ueagle-atm.c:1820:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sc->stats, 0, sizeof(struct uea_stats));
           ^~~~~~
   drivers/usb/atm/ueagle-atm.c:1820:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&sc->stats, 0, sizeof(struct uea_stats));
           ^~~~~~
   drivers/usb/atm/ueagle-atm.c:2212:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret =3D kthread_stop(sc->kthread);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2212:2: note: Value stored to 'ret' is neve=
r read
           ret =3D kthread_stop(sc->kthread);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2255:8: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.state);
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2255:8: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.state);
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2321:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "Modem is booting\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2321:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "Modem is booting\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2324:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "Modem is initializing\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2324:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "Modem is initializing\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2327:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "Modem is operational\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2327:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "Modem is operational\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2330:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "Modem synchronization failed\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2330:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "Modem synchronization failed\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2333:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "Modem state is unknown\n");
                         ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2333:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "Modem state is unknown\n");
                         ^~~~~~~
>> drivers/usb/atm/ueagle-atm.c:2367:8: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           ret =3D sprintf(buf, "%s\n", delin);
                 ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2367:8: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           ret =3D sprintf(buf, "%s\n", delin);
                 ^~~~~~~
   drivers/usb/atm/ueagle-atm.c:2397:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(mflags, 1);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2397:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(mflags, 1);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2398:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(vidcpe, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2398:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(vidcpe, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2399:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(usrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2399:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(usrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2400:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(dsrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2400:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(dsrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2401:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(usattenuation, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2401:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(usattenuation, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2402:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(dsattenuation, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2402:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(dsattenuation, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2403:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(usmargin, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2403:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(usmargin, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2404:1: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   UEA_ATTR(dsmargin, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
                 ^~~~~~~~
   drivers/usb/atm/ueagle-atm.c:2404:1: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
   UEA_ATTR(dsmargin, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2387:8: note: expanded from macro 'UEA_ATTR'
           ret =3D snprintf(buf, 10, "%08x\n", sc->stats.phy.name);  \
--
           ^~~~~~
   drivers/net/can/usb/ucan.c:882:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(urbs, 0, sizeof(*urbs) * UCAN_MAX_RX_URBS);
           ^~~~~~
   drivers/net/can/usb/ucan.c:1086:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(m->msg.can_msg.data, cf->data, cf->len);
                   ^~~~~~
   drivers/net/can/usb/ucan.c:1086:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(m->msg.can_msg.data, cf->data, cf->len);
                   ^~~~~~
   drivers/net/can/usb/ucan.c:1430:4: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/net/can/usb/ucan.c:1430:4: note: Value stored to 'ret' is never =
read
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/net/can/usb/ucan.c:1530:3: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(firmware_str, up->ctl_msg_buffer->raw,
                   ^~~~~~~
   drivers/net/can/usb/ucan.c:1530:3: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
                   strncpy(firmware_str, up->ctl_msg_buffer->raw,
                   ^~~~~~~
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/usb/renesas_usbhs/mod.c:201:2: warning: Value stored to 'intenb0=
' is never read [clang-analyzer-deadcode.DeadStores]
           intenb0 =3D usbhs_read(priv, INTENB0);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:201:2: note: Value stored to 'intenb0' i=
s never read
           intenb0 =3D usbhs_read(priv, INTENB0);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:205:3: warning: Value stored to 'intenb1=
' is never read [clang-analyzer-deadcode.DeadStores]
                   intenb1 =3D usbhs_read(priv, INTENB1);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:205:3: note: Value stored to 'intenb1' i=
s never read
                   intenb1 =3D usbhs_read(priv, INTENB1);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:207:20: warning: Although the value stor=
ed to 'intenb1' is used in the enclosing expression, the value is never act=
ually read from 'intenb1' [clang-analyzer-deadcode.DeadStores]
                   state->intsts1 =3D intenb1 =3D 0;
                                    ^         ~
   drivers/usb/renesas_usbhs/mod.c:207:20: note: Although the value stored =
to 'intenb1' is used in the enclosing expression, the value is never actual=
ly read from 'intenb1'
                   state->intsts1 =3D intenb1 =3D 0;
                                    ^         ~
   drivers/usb/renesas_usbhs/mod.c:259:3: warning: 3rd function call argume=
nt is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   usbhs_write(priv, BRDYSTS, ~irq_state.brdysts);
                   ^                          ~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:235:2: note: Taking false branch
           if (usbhs_status_get_each_irq(priv, &irq_state) < 0)
           ^
   drivers/usb/renesas_usbhs/mod.c:250:2: note: Taking false branch
           if (usbhs_mod_is_host(priv))
           ^
   drivers/usb/renesas_usbhs/mod.c:258:6: note: Assuming the condition is t=
rue
           if (irq_state.intsts0 & BRDY)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:258:2: note: Taking true branch
           if (irq_state.intsts0 & BRDY)
           ^
   drivers/usb/renesas_usbhs/mod.c:259:3: note: 3rd function call argument =
is an uninitialized value
                   usbhs_write(priv, BRDYSTS, ~irq_state.brdysts);
                   ^                          ~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:260:2: warning: 3rd function call argume=
nt is an uninitialized value [clang-analyzer-core.CallAndMessage]
           usbhs_write(priv, NRDYSTS, ~irq_state.nrdysts);
           ^                          ~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:235:2: note: Taking false branch
           if (usbhs_status_get_each_irq(priv, &irq_state) < 0)
           ^
   drivers/usb/renesas_usbhs/mod.c:250:2: note: Taking false branch
           if (usbhs_mod_is_host(priv))
           ^
   drivers/usb/renesas_usbhs/mod.c:258:6: note: Assuming the condition is f=
alse
           if (irq_state.intsts0 & BRDY)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:258:2: note: Taking false branch
           if (irq_state.intsts0 & BRDY)
           ^
   drivers/usb/renesas_usbhs/mod.c:260:2: note: 3rd function call argument =
is an uninitialized value
           usbhs_write(priv, NRDYSTS, ~irq_state.nrdysts);
           ^                          ~~~~~~~~~~~~~~~~~~
   Suppressed 35 warnings (34 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/usb/misc/chaoskey.c:286:2: warning: Value stored to 'interface' =
is never read [clang-analyzer-deadcode.DeadStores]
           interface =3D dev->interface;
           ^           ~~~~~~~~~~~~~~
   drivers/usb/misc/chaoskey.c:286:2: note: Value stored to 'interface' is =
never read
           interface =3D dev->interface;
           ^           ~~~~~~~~~~~~~~
   drivers/usb/misc/chaoskey.c:513:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, dev->buf + dev->used, this_time);
           ^~~~~~
   drivers/usb/misc/chaoskey.c:513:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, dev->buf + dev->used, this_time);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/usb/usbip/vudc_dev.c:535:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(ep->name, "ep%d%s", num,
                   ^~~~~~~
   drivers/usb/usbip/vudc_dev.c:535:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(ep->name, "ep%d%s", num,
                   ^~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hwmon/lm92.c:143:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm92.c:143:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm92.c:174:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
])
                  ^~~~~~~
   drivers/hwmon/lm92.c:174:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
])
                  ^~~~~~~
   drivers/hwmon/lm92.c:183:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[t_min])
                  ^~~~~~~
   drivers/hwmon/lm92.c:183:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[t_min])
                  ^~~~~~~
   drivers/hwmon/lm92.c:216:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ALARMS_FROM_REG(data->temp[t_input])=
);
                  ^~~~~~~
   drivers/hwmon/lm92.c:216:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ALARMS_FROM_REG(data->temp[t_input])=
);
                  ^~~~~~~
   drivers/hwmon/lm92.c:224:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (data->temp[t_input] >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm92.c:224:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (data->temp[t_input] >> bitnr) & 1);
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/iio/accel/mma8452.c:252:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/mma8452.c:252:2: note: Value stored to 'ret' is never =
read
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
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
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/iio/accel/sca3000.c:163:8: warning: Excessive padding in 'struct=
 sca3000_state' (46 padding bytes, where 14 is optimal). =

   Optimal fields order: =

   tx, =

   last_timestamp, =

   us, =

   info, =

   mo_det_use_count, =

   lock, =

   rx, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sca3000_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/accel/sca3000.c:163:8: note: Excessive padding in 'struct sc=
a3000_state' (46 padding bytes, where 14 is optimal). Optimal fields order:=
 tx, last_timestamp, us, info, mo_det_use_count, lock, rx, consider reorder=
ing the fields or adding explicit padding members
   struct sca3000_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/accel/sca3000.c:457:8: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%d", st->info->measurement_mode_3db_freq);
                 ^~~~~~~
   drivers/iio/accel/sca3000.c:457:8: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           len =3D sprintf(buf, "%d", st->info->measurement_mode_3db_freq);
                 ^~~~~~~
   drivers/iio/accel/sca3000.c:459:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, " %d",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:459:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, " %d",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:462:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, " %d",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:462:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, " %d",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:464:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/accel/sca3000.c:464:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/accel/sca3000.c:841:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, "%d %d %d\n",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:841:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, "%d %d %d\n",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:847:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, "%d %d %d\n",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:847:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, "%d %d %d\n",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:853:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, "%d %d %d\n",
                          ^~~~~~~
   drivers/iio/accel/sca3000.c:853:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, "%d %d %d\n",
                          ^~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/usb/isp1760/isp1760-udc.c:1237:22: warning: Value stored to 'udc=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct isp1760_udc *udc =3D gadget_to_udc(gadget);
                               ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-udc.c:1237:22: note: Value stored to 'udc' d=
uring its initialization is never read
           struct isp1760_udc *udc =3D gadget_to_udc(gadget);
                               ^~~   ~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/isp1760/isp1760-udc.c:1463:3: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
                   sprintf(ep->name, "ep%u%s", ep_num,
                   ^~~~~~~
   drivers/usb/isp1760/isp1760-udc.c:1463:3: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
                   sprintf(ep->name, "ep%u%s", ep_num,
                   ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
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
   110 warnings generated.
   Suppressed 110 warnings (110 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   88 warnings generated.
   drivers/usb/cdns3/cdns3-gadget.c:143:2: warning: Use of memory after it =
is freed [clang-analyzer-unix.Malloc]
           return list_first_entry_or_null(list, struct cdns3_aligned_buf, =
list);
           ^
   drivers/usb/cdns3/cdns3-gadget.c:3259:45: note: 32 is not equal to 64
           ret =3D dma_set_mask_and_coherent(cdns->dev, DMA_BIT_MASK(32));
                                                      ^
   include/linux/dma-mapping.h:76:27: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                             ^~~
   drivers/usb/cdns3/cdns3-gadget.c:3259:45: note: '?' condition is false
           ret =3D dma_set_mask_and_coherent(cdns->dev, DMA_BIT_MASK(32));
                                                      ^
   include/linux/dma-mapping.h:76:26: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                            ^
   drivers/usb/cdns3/cdns3-gadget.c:3260:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/usb/cdns3/cdns3-gadget.c:3260:2: note: Taking false branch
           if (ret) {
           ^
   drivers/usb/cdns3/cdns3-gadget.c:3269:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/usb/cdns3/cdns3-gadget.c:3269:2: note: Taking false branch
           if (ret) {
           ^
   drivers/usb/cdns3/cdns3-gadget.c:3284:6: note: Assuming 'ret' is not equ=
al to 0
           if (ret)
               ^~~
   drivers/usb/cdns3/cdns3-gadget.c:3284:2: note: Taking true branch
           if (ret)
           ^
   drivers/usb/cdns3/cdns3-gadget.c:3285:3: note: Control jumps to line 3289
                   goto err0;
                   ^
   drivers/usb/cdns3/cdns3-gadget.c:3289:2: note: Calling 'cdns3_gadget_exi=
t'
           cdns3_gadget_exit(cdns);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/cdns3/cdns3-gadget.c:3101:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&priv_dev->aligned_buf_list)) {
           ^
   drivers/usb/cdns3/cdns3-gadget.c:3104:9: note: Calling 'cdns3_next_align=
_buf'
                   buf =3D cdns3_next_align_buf(&priv_dev->aligned_buf_list=
);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/cdns3/cdns3-gadget.c:143:9: note: Left side of '||' is false
           return list_first_entry_or_null(list, struct cdns3_aligned_buf, =
list);
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
   drivers/usb/cdns3/cdns3-gadget.c:143:9: note: Left side of '||' is false
           return list_first_entry_or_null(list, struct cdns3_aligned_buf, =
list);
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
   drivers/usb/cdns3/cdns3-gadget.c:143:9: note: Left side of '||' is true
           return list_first_entry_or_null(list, struct cdns3_aligned_buf, =
list);
                  ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \

vim +2367 drivers/usb/atm/ueagle-atm.c

b72458a80c75ca Matthieu CASTET                     2005-11-07  2279  =

7f26ee4b56496f Greg Kroah-Hartman                  2018-01-23  2280  static=
 ssize_t stat_human_status_show(struct device *dev,
4545f7eea31f3f Javier Blanco de Torres (Neurowork  2010-04-12  2281) 			str=
uct device_attribute *attr, char *buf)
b72458a80c75ca Matthieu CASTET                     2005-11-07  2282  {
b72458a80c75ca Matthieu CASTET                     2005-11-07  2283  	int r=
et =3D -ENODEV;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2284  	int m=
odem_state;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2285  	struc=
t uea_softc *sc;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2286  =

ab3c81ff639fbe Arjan van de Ven                    2006-01-13  2287  	mutex=
_lock(&uea_mutex);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2288  	sc =
=3D dev_to_uea(dev);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2289  	if (!=
sc)
b72458a80c75ca Matthieu CASTET                     2005-11-07  2290  		goto=
 out;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2291  =

c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2292  	if (U=
EA_CHIP_VERSION(sc) =3D=3D EAGLE_IV) {
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2293  		swit=
ch (sc->stats.phy.state) {
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2294  		case=
 0x0:	/* not yet synchronized */
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2295  		case=
 0x1:
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2296  		case=
 0x3:
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2297  		case=
 0x4:
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2298  			mod=
em_state =3D 0;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2299  			bre=
ak;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2300  		case=
 0x5:	/* initialization */
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2301  		case=
 0x6:
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2302  		case=
 0x9:
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2303  		case=
 0xa:
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2304  			mod=
em_state =3D 1;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2305  			bre=
ak;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2306  		case=
 0x7:	/* operational */
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2307  			mod=
em_state =3D 2;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2308  			bre=
ak;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2309  		case=
 0x2:	/* fail ... */
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2310  			mod=
em_state =3D 3;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2311  			bre=
ak;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2312  		defa=
ult:	/* unknown */
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2313  			mod=
em_state =3D 4;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2314  			bre=
ak;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2315  		}
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2316  	} else
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2317  		mode=
m_state =3D GET_STATUS(sc->stats.phy.state);
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2318  =

c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2319  	switc=
h (modem_state) {
b72458a80c75ca Matthieu CASTET                     2005-11-07  2320  	case =
0:
b72458a80c75ca Matthieu CASTET                     2005-11-07  2321  		ret =
=3D sprintf(buf, "Modem is booting\n");
b72458a80c75ca Matthieu CASTET                     2005-11-07  2322  		brea=
k;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2323  	case =
1:
b72458a80c75ca Matthieu CASTET                     2005-11-07  2324  		ret =
=3D sprintf(buf, "Modem is initializing\n");
b72458a80c75ca Matthieu CASTET                     2005-11-07  2325  		brea=
k;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2326  	case =
2:
b72458a80c75ca Matthieu CASTET                     2005-11-07  2327  		ret =
=3D sprintf(buf, "Modem is operational\n");
b72458a80c75ca Matthieu CASTET                     2005-11-07  2328  		brea=
k;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2329  	case =
3:
b72458a80c75ca Matthieu CASTET                     2005-11-07 @2330  		ret =
=3D sprintf(buf, "Modem synchronization failed\n");
b72458a80c75ca Matthieu CASTET                     2005-11-07  2331  		brea=
k;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2332  	defau=
lt:
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2333  		ret =
=3D sprintf(buf, "Modem state is unknown\n");
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2334  		brea=
k;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2335  	}
b72458a80c75ca Matthieu CASTET                     2005-11-07  2336  out:
ab3c81ff639fbe Arjan van de Ven                    2006-01-13  2337  	mutex=
_unlock(&uea_mutex);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2338  	retur=
n ret;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2339  }
b72458a80c75ca Matthieu CASTET                     2005-11-07  2340  =

7f26ee4b56496f Greg Kroah-Hartman                  2018-01-23  2341  static=
 DEVICE_ATTR_RO(stat_human_status);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2342  =

7f26ee4b56496f Greg Kroah-Hartman                  2018-01-23  2343  static=
 ssize_t stat_delin_show(struct device *dev, struct device_attribute *attr,
b72458a80c75ca Matthieu CASTET                     2005-11-07  2344  		char=
 *buf)
b72458a80c75ca Matthieu CASTET                     2005-11-07  2345  {
b72458a80c75ca Matthieu CASTET                     2005-11-07  2346  	int r=
et =3D -ENODEV;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2347  	struc=
t uea_softc *sc;
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2348  	char =
*delin =3D "GOOD";
b72458a80c75ca Matthieu CASTET                     2005-11-07  2349  =

ab3c81ff639fbe Arjan van de Ven                    2006-01-13  2350  	mutex=
_lock(&uea_mutex);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2351  	sc =
=3D dev_to_uea(dev);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2352  	if (!=
sc)
b72458a80c75ca Matthieu CASTET                     2005-11-07  2353  		goto=
 out;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2354  =

c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2355  	if (U=
EA_CHIP_VERSION(sc) =3D=3D EAGLE_IV) {
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2356  		if (=
sc->stats.phy.flags & 0x4000)
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2357  			del=
in =3D "RESET";
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2358  		else=
 if (sc->stats.phy.flags & 0x0001)
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2359  			del=
in =3D "LOSS";
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2360  	} els=
e {
b72458a80c75ca Matthieu CASTET                     2005-11-07  2361  		if (=
sc->stats.phy.flags & 0x0C00)
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2362  			del=
in =3D "ERROR";
b72458a80c75ca Matthieu CASTET                     2005-11-07  2363  		else=
 if (sc->stats.phy.flags & 0x0030)
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2364  			del=
in =3D "LOSS";
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2365  	}
c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20  2366  =

c8e463796c7ae6 Stanislaw Gruszka                   2007-08-20 @2367  	ret =
=3D sprintf(buf, "%s\n", delin);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2368  out:
ab3c81ff639fbe Arjan van de Ven                    2006-01-13  2369  	mutex=
_unlock(&uea_mutex);
b72458a80c75ca Matthieu CASTET                     2005-11-07  2370  	retur=
n ret;
b72458a80c75ca Matthieu CASTET                     2005-11-07  2371  }
b72458a80c75ca Matthieu CASTET                     2005-11-07  2372  =


:::::: The code at line 2367 was first introduced by commit
:::::: c8e463796c7ae6d8dda39b0c7eb3d627600ffe2e UEAGLE: Eagle IV chipset su=
pport

:::::: TO: Stanislaw Gruszka <stf_xl@wp.pl>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1084286738367975822==--

