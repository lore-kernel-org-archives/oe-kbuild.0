Content-Type: multipart/mixed; boundary="===============8398922854219647544=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/storage/sddr09.c:1156:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Wed, 30 Mar 2022 16:55:55 +0800
Message-ID: <202203301630.PtkyuGLo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8398922854219647544==
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
head:   965181d7ef7e1a863477536dc328c23a7ebc8a1d
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220329 (https://download.01.org/0day-ci/archi=
ve/20220330/202203301630.PtkyuGLo-lkp(a)intel.com/config)
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
                   status =3D mos7840_calc_baud_rate_divisor(port, baudRate=
, &divisor,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/usb/serial/mos7840.c:1202:2: warning: Value stored to 'lData' is=
 never read [clang-analyzer-deadcode.DeadStores]
           lData =3D LCR_BITS_8;
           ^
   drivers/usb/serial/mos7840.c:1202:2: note: Value stored to 'lData' is ne=
ver read
   drivers/usb/serial/mos7840.c:1203:2: warning: Value stored to 'lStop' is=
 never read [clang-analyzer-deadcode.DeadStores]
           lStop =3D LCR_STOP_1;
           ^
   drivers/usb/serial/mos7840.c:1203:2: note: Value stored to 'lStop' is ne=
ver read
   drivers/usb/serial/mos7840.c:1306:2: warning: Value stored to 'status' i=
s never read [clang-analyzer-deadcode.DeadStores]
           status =3D mos7840_send_cmd_write_baud_rate(mos7840_port, baud);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1306:2: note: Value stored to 'status' is n=
ever read
           status =3D mos7840_send_cmd_write_baud_rate(mos7840_port, baud);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1387:26: warning: Value stored to 'port' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct usb_serial_port *port =3D tty->driver_data;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1387:26: note: Value stored to 'port' durin=
g its initialization is never read
           struct usb_serial_port *port =3D tty->driver_data;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1516:17: warning: Value stored to 'dev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/mos7840.c:1516:17: note: Value stored to 'dev' during=
 its initialization is never read
           struct device *dev =3D &serial->interface->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
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
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
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
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:48:2: warning: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&evts, 0, sizeof(evts));
           ^~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:48:2: note: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&evts, 0, sizeof(evts));
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:581:4: warning: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(str, "pipe-%d", crtc->slave->id);
                           ^~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:581:4: note: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(str, "pipe-%d", crtc->slave->id);
                           ^~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:583:4: warning: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(str, "None");
                           ^~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:583:4: note: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(str, "None");
                           ^~~~~~~
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
   44 warnings generated.
   block/blk-map.c:32:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(bmd->iov, data->iov, sizeof(struct iovec) * data->nr_segs=
);
           ^~~~~~
   block/blk-map.c:32:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(bmd->iov, data->iov, sizeof(struct iovec) * data->nr_segs=
);

vim +1156 drivers/usb/storage/sddr09.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1092  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1093  static int
^1da177e4c3f41 Linus Torvalds  2005-04-16  1094  sddr09_get_wp(struct us_da=
ta *us, struct sddr09_card_info *info) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1095  	int result;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1096  	unsigned char status;
ef976ea33b4c44 Victor Dodon    2016-02-17  1097  	const char *wp_fmt;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1098  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1099  	result =3D sddr09_read_st=
atus(us, &status);
0dc08a357538de Matthew Dharm   2005-12-04  1100  	if (result) {
191648d03d2022 Joe Perches     2013-04-19  1101  		usb_stor_dbg(us, "read_s=
tatus fails\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1102  		return result;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1103  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1104  	if ((status & 0x80) =3D=
=3D 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1105  		info->flags |=3D SDDR09_=
WP;	/* write protected */
ef976ea33b4c44 Victor Dodon    2016-02-17  1106  		wp_fmt =3D " WP";
ef976ea33b4c44 Victor Dodon    2016-02-17  1107  	} else {
ef976ea33b4c44 Victor Dodon    2016-02-17 @1108  		wp_fmt =3D "";
^1da177e4c3f41 Linus Torvalds  2005-04-16  1109  	}
ef976ea33b4c44 Victor Dodon    2016-02-17  1110  	usb_stor_dbg(us, "status =
0x%02X%s%s%s%s\n", status, wp_fmt,
ef976ea33b4c44 Victor Dodon    2016-02-17  1111  		     status & 0x40 ? " R=
eady" : "",
ef976ea33b4c44 Victor Dodon    2016-02-17  1112  		     status & LUNBITS ? =
" Suspended" : "",
ef976ea33b4c44 Victor Dodon    2016-02-17  1113  		     status & 0x01 ? " E=
rror" : "");
ef976ea33b4c44 Victor Dodon    2016-02-17  1114  =

0dc08a357538de Matthew Dharm   2005-12-04  1115  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1116  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1117  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1118  #if 0
^1da177e4c3f41 Linus Torvalds  2005-04-16  1119  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  1120   * Reset Command: 12 bytes.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1121   * byte 0: opcode: EB
^1da177e4c3f41 Linus Torvalds  2005-04-16  1122   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1123  static int
^1da177e4c3f41 Linus Torvalds  2005-04-16  1124  sddr09_reset(struct us_dat=
a *us) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1125  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1126  	unsigned char *command =
=3D us->iobuf;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1127  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1128  	memset(command, 0, 12);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1129  	command[0] =3D 0xEB;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1130  	command[1] =3D LUNBITS;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1131  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1132  	return sddr09_send_scsi_c=
ommand(us, command, 12);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1133  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1134  #endif
^1da177e4c3f41 Linus Torvalds  2005-04-16  1135  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1136  static struct nand_flash_d=
ev *
^1da177e4c3f41 Linus Torvalds  2005-04-16  1137  sddr09_get_cardinfo(struct=
 us_data *us, unsigned char flags) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1138  	struct nand_flash_dev *ca=
rdinfo;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1139  	unsigned char deviceID[4];
^1da177e4c3f41 Linus Torvalds  2005-04-16  1140  	char blurbtxt[256];
^1da177e4c3f41 Linus Torvalds  2005-04-16  1141  	int result;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1142  =

191648d03d2022 Joe Perches     2013-04-19  1143  	usb_stor_dbg(us, "Reading=
 capacity...\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1144  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1145  	result =3D sddr09_read_de=
viceID(us, deviceID);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1146  =

0dc08a357538de Matthew Dharm   2005-12-04  1147  	if (result) {
191648d03d2022 Joe Perches     2013-04-19  1148  		usb_stor_dbg(us, "Result=
 of read_deviceID is %d\n", result);
6f8aa65b520371 Frank Seidel    2009-02-05  1149  		printk(KERN_WARNING "sdd=
r09: could not read card info\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1150  		return NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1151  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1152  =

7adce46784a099 Andy Shevchenko 2014-09-05  1153  	sprintf(blurbtxt, "sddr09=
: Found Flash card, ID =3D %4ph", deviceID);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1154  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1155  	/* Byte 0 is the manufact=
urer */
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1156  	sprintf(blurbtxt + strlen=
(blurbtxt),
^1da177e4c3f41 Linus Torvalds  2005-04-16  1157  		": Manuf. %s",
^1da177e4c3f41 Linus Torvalds  2005-04-16  1158  		nand_flash_manufacturer(=
deviceID[0]));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1159  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1160  	/* Byte 1 is the device t=
ype */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1161  	cardinfo =3D nand_find_id=
(deviceID[1]);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1162  	if (cardinfo) {
f0183a338e4f90 Felipe Balbi    2016-04-18  1163  		/*
f0183a338e4f90 Felipe Balbi    2016-04-18  1164  		 * MB or MiB? It is neit=
her. A 16 MB card has
f0183a338e4f90 Felipe Balbi    2016-04-18  1165  		 * 17301504 raw bytes, o=
f which 16384000 are
f0183a338e4f90 Felipe Balbi    2016-04-18  1166  		 * usable for user data.
f0183a338e4f90 Felipe Balbi    2016-04-18  1167  		 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1168  		sprintf(blurbtxt + strle=
n(blurbtxt),
^1da177e4c3f41 Linus Torvalds  2005-04-16  1169  			", %d MB", 1<<(cardinfo=
->chipshift - 20));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1170  	} else {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1171  		sprintf(blurbtxt + strle=
n(blurbtxt),
^1da177e4c3f41 Linus Torvalds  2005-04-16  1172  			", type unrecognized");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1173  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1174  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1175  	/* Byte 2 is code to sign=
al availability of 128-bit ID */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1176  	if (deviceID[2] =3D=3D 0x=
a5) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1177  		sprintf(blurbtxt + strle=
n(blurbtxt),
^1da177e4c3f41 Linus Torvalds  2005-04-16  1178  			", 128-bit ID");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1179  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1180  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1181  	/* Byte 3 announces the a=
vailability of another read ID command */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1182  	if (deviceID[3] =3D=3D 0x=
c0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1183  		sprintf(blurbtxt + strle=
n(blurbtxt),
^1da177e4c3f41 Linus Torvalds  2005-04-16  1184  			", extra cmd");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1185  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1186  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1187  	if (flags & SDDR09_WP)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1188  		sprintf(blurbtxt + strle=
n(blurbtxt),
^1da177e4c3f41 Linus Torvalds  2005-04-16  1189  			", WP");
^1da177e4c3f41 Linus Torvalds  2005-04-16  1190  =

6f8aa65b520371 Frank Seidel    2009-02-05  1191  	printk(KERN_WARNING "%s\n=
", blurbtxt);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1192  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1193  	return cardinfo;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1194  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1195  =


:::::: The code at line 1156 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8398922854219647544==--

