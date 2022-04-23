Content-Type: multipart/mixed; boundary="===============5464367524694185212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/storage/sddr09.c:1156:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Sat, 23 Apr 2022 09:54:14 +0800
Message-ID: <202204230917.jhVNuHbv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5464367524694185212==
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
head:   06fb4ecfeac7e00d6704fa5ed19299f2fefb3cc9
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220421 (https://download.01.org/0day-ci/archi=
ve/20220423/202204230917.jhVNuHbv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                               ^
   fs/xfs/libxfs/xfs_iext_tree.c:512:2: note: '?' condition is true
           ASSERT(nr_entries <=3D KEYS_PER_NODE);
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:514:6: note: Assuming 'nr_entries' is not =
equal to KEYS_PER_NODE
           if (nr_entries =3D=3D KEYS_PER_NODE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:514:2: note: Taking false branch
           if (nr_entries =3D=3D KEYS_PER_NODE)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:521:6: note: Assuming 'node' is equal to '=
new'
           if (node !=3D new && pos =3D=3D 0 && nr_entries > 0)
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:521:18: note: Left side of '&&' is false
           if (node !=3D new && pos =3D=3D 0 && nr_entries > 0)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:23: note: 'i' is <=3D 'pos'
           for (i =3D nr_entries; i > pos; i--) {
                                ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:2: note: Loop condition is false. Exec=
ution continues on line 528
           for (i =3D nr_entries; i > pos; i--) {
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:528:18: note: Array access (via field 'key=
s') results in a null pointer dereference
           node->keys[pos] =3D offset;
                 ~~~~      ^
   fs/xfs/libxfs/xfs_iext_tree.c:607:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(new + ifp->if_bytes, 0, new_size - ifp->if_bytes);
           ^~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:607:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(new + ifp->if_bytes, 0, new_size - ifp->if_bytes);
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
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
   55 warnings generated.
   drivers/media/cec/core/cec-notifier.c:118:3: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&n->conn_info, 0, sizeof(n->conn_info));
                   ^~~~~~
   drivers/media/cec/core/cec-notifier.c:118:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(&n->conn_info, 0, sizeof(n->conn_info));
                   ^~~~~~
   drivers/media/cec/core/cec-notifier.c:135:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&n->conn_info, 0, sizeof(n->conn_info));
           ^~~~~~
   drivers/media/cec/core/cec-notifier.c:135:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&n->conn_info, 0, sizeof(n->conn_info));
           ^~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
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
   Suppressed 41 warnings (41 in non-user code).
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
   sound/soc/codecs/pcm512x.c:1024:3: note: Taking false branch
                   if (ret !=3D 0) {
                   ^
   sound/soc/codecs/pcm512x.c:1062:12: note: Left side of '||' is true
           osr_div =3D DIV_ROUND_CLOSEST(dac_rate, osr_rate);
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1063:6: note: Assuming 'osr_div' is <=3D 128
           if (osr_div > 128) {
               ^~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1063:2: note: Taking false branch
           if (osr_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1068:12: note: Left side of '||' is true
           dac_div =3D DIV_ROUND_CLOSEST(dacsrc_rate, dac_rate);
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1069:6: note: Assuming 'dac_div' is <=3D 128
           if (dac_div > 128) {
               ^~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1069:2: note: Taking false branch
           if (dac_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1075:12: note: Left side of '||' is true
           ncp_div =3D DIV_ROUND_CLOSEST(dac_rate,
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1075:2: note: The value 0 is assigned to 'ncp=
_div'
           ncp_div =3D DIV_ROUND_CLOSEST(dac_rate,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1077:6: note: 'ncp_div' is <=3D 128
           if (ncp_div > 128 || dac_rate / ncp_div > 2048000) {
               ^~~~~~~
   sound/soc/codecs/pcm512x.c:1077:6: note: Left side of '||' is false
   sound/soc/codecs/pcm512x.c:1077:32: note: Division by zero
           if (ncp_div > 128 || dac_rate / ncp_div > 2048000) {
                                ~~~~~~~~~^~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/usb/line6/podhd.c:149:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", pod->serial_number);
                  ^~~~~~~
   sound/usb/line6/podhd.c:149:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", pod->serial_number);
                  ^~~~~~~
   sound/usb/line6/podhd.c:158:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%06x\n", pod->firmware_version);
                  ^~~~~~~
   sound/usb/line6/podhd.c:158:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%06x\n", pod->firmware_version);
                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/usb/line6/toneport.c:202:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/usb/line6/toneport.c:202:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/usb/line6/toneport.c:314:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(led->name, sizeof(led->name), "%s::%s",
                   ^~~~~~~~
   sound/usb/line6/toneport.c:314:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(led->name, sizeof(led->name), "%s::%s",
                   ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/spi/at73c213.c:714:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, chip->pcm->name);
           ^~~~~~
   sound/spi/at73c213.c:714:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(card->mixername, chip->pcm->name);
           ^~~~~~
   sound/spi/at73c213.c:901:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&chip->reg_image, &snd_at73c213_original_image,
           ^~~~~~
   sound/spi/at73c213.c:901:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(&chip->reg_image, &snd_at73c213_original_image,
           ^~~~~~
   sound/spi/at73c213.c:962:2: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(id, sizeof id, "at73c213_%d", board->ssc_id);
           ^~~~~~~~
   sound/spi/at73c213.c:962:2: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           snprintf(id, sizeof id, "at73c213_%d", board->ssc_id);
           ^~~~~~~~
   sound/spi/at73c213.c:985:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, board->shortname);
           ^~~~~~
   sound/spi/at73c213.c:985:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(card->shortname, board->shortname);
           ^~~~~~
>> sound/spi/at73c213.c:986:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
           sprintf(card->longname, "%s on irq %d", card->shortname, chip->i=
rq);
           ^~~~~~~
   sound/spi/at73c213.c:986:2: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           sprintf(card->longname, "%s on irq %d", card->shortname, chip->i=
rq);
           ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
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
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   sound/soc/codecs/cs4234.c:550:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dac5_masks, 0xFF, sizeof(dac5_masks));
                   ^~~~~~
   sound/soc/codecs/cs4234.c:550:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(dac5_masks, 0xFF, sizeof(dac5_masks));
                   ^~~~~~
   sound/soc/codecs/cs4234.c:834:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cs4234->rate_dividers, &cs4234_dividers, sizeof(cs4234_d=
ividers));
           ^~~~~~
   sound/soc/codecs/cs4234.c:834:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cs4234->rate_dividers, &cs4234_dividers, sizeof(cs4234_d=
ividers));
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
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
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   fs/nilfs2/cpfile.c:467:22: warning: The left operand of '+' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   *cnop =3D ci->ci_cno + 1;
                                      ^
   fs/nilfs2/cpfile.c:586:8: note: Calling 'nilfs_cpfile_do_get_cpinfo'
           nci =3D nilfs_cpfile_do_get_cpinfo(cpfile, &tcno, &ci, sizeof(ci=
), 1);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/nilfs2/cpfile.c:436:6: note: Assuming 'cno' is not equal to 0
           if (cno =3D=3D 0)
               ^~~~~~~~
   fs/nilfs2/cpfile.c:436:2: note: Taking false branch
           if (cno =3D=3D 0)
           ^
   fs/nilfs2/cpfile.c:440:2: note: Loop condition is true.  Entering loop b=
ody
           for (n =3D 0; n < nci; cno +=3D ncps) {
           ^
   fs/nilfs2/cpfile.c:443:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   fs/nilfs2/cpfile.c:443:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   fs/nilfs2/cpfile.c:452:15: note: Assuming 'i' is < 'ncps'
                   for (i =3D 0; i < ncps && n < nci; i++, cp =3D (void *)c=
p + cpsz) {
                               ^~~~~~~~
   fs/nilfs2/cpfile.c:452:15: note: Left side of '&&' is true
   fs/nilfs2/cpfile.c:452:3: note: Loop condition is true.  Entering loop b=
ody
                   for (i =3D 0; i < ncps && n < nci; i++, cp =3D (void *)c=
p + cpsz) {
                   ^
   fs/nilfs2/cpfile.c:453:4: note: Taking true branch
                           if (!nilfs_checkpoint_invalid(cp)) {
                           ^
   fs/nilfs2/cpfile.c:454:5: note: Calling 'nilfs_cpfile_checkpoint_to_cpin=
fo'
                                   nilfs_cpfile_checkpoint_to_cpinfo(cpfile=
, cp,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/nilfs2/cpfile.c:454:5: note: Returning from 'nilfs_cpfile_checkpoint_=
to_cpinfo'
                                   nilfs_cpfile_checkpoint_to_cpinfo(cpfile=
, cp,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/nilfs2/cpfile.c:452:15: note: Assuming 'i' is >=3D 'ncps'
                   for (i =3D 0; i < ncps && n < nci; i++, cp =3D (void *)c=
p + cpsz) {
                               ^~~~~~~~
   fs/nilfs2/cpfile.c:452:24: note: Left side of '&&' is false
                   for (i =3D 0; i < ncps && n < nci; i++, cp =3D (void *)c=
p + cpsz) {
                                        ^
   fs/nilfs2/cpfile.c:460:3: note: Taking false branch
                   kunmap_atomic(kaddr);
                   ^
   include/linux/highmem-internal.h:245:2: note: expanded from macro 'kunma=
p_atomic'

vim +1156 drivers/usb/storage/sddr09.c

^1da177e4c3f415 Linus Torvalds  2005-04-16  1135  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1136  static struct nand_flash_=
dev *
^1da177e4c3f415 Linus Torvalds  2005-04-16  1137  sddr09_get_cardinfo(struc=
t us_data *us, unsigned char flags) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  1138  	struct nand_flash_dev *c=
ardinfo;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1139  	unsigned char deviceID[4=
];
^1da177e4c3f415 Linus Torvalds  2005-04-16  1140  	char blurbtxt[256];
^1da177e4c3f415 Linus Torvalds  2005-04-16  1141  	int result;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1142  =

191648d03d20229 Joe Perches     2013-04-19  1143  	usb_stor_dbg(us, "Readin=
g capacity...\n");
^1da177e4c3f415 Linus Torvalds  2005-04-16  1144  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1145  	result =3D sddr09_read_d=
eviceID(us, deviceID);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1146  =

0dc08a357538de3 Matthew Dharm   2005-12-04  1147  	if (result) {
191648d03d20229 Joe Perches     2013-04-19  1148  		usb_stor_dbg(us, "Resul=
t of read_deviceID is %d\n", result);
6f8aa65b5203712 Frank Seidel    2009-02-05  1149  		printk(KERN_WARNING "sd=
dr09: could not read card info\n");
^1da177e4c3f415 Linus Torvalds  2005-04-16  1150  		return NULL;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1151  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  1152  =

7adce46784a0992 Andy Shevchenko 2014-09-05  1153  	sprintf(blurbtxt, "sddr0=
9: Found Flash card, ID =3D %4ph", deviceID);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1154  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1155  	/* Byte 0 is the manufac=
turer */
^1da177e4c3f415 Linus Torvalds  2005-04-16 @1156  	sprintf(blurbtxt + strle=
n(blurbtxt),
^1da177e4c3f415 Linus Torvalds  2005-04-16  1157  		": Manuf. %s",
^1da177e4c3f415 Linus Torvalds  2005-04-16  1158  		nand_flash_manufacturer=
(deviceID[0]));
^1da177e4c3f415 Linus Torvalds  2005-04-16  1159  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1160  	/* Byte 1 is the device =
type */
^1da177e4c3f415 Linus Torvalds  2005-04-16  1161  	cardinfo =3D nand_find_i=
d(deviceID[1]);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1162  	if (cardinfo) {
f0183a338e4f90e Felipe Balbi    2016-04-18  1163  		/*
f0183a338e4f90e Felipe Balbi    2016-04-18  1164  		 * MB or MiB? It is nei=
ther. A 16 MB card has
f0183a338e4f90e Felipe Balbi    2016-04-18  1165  		 * 17301504 raw bytes, =
of which 16384000 are
f0183a338e4f90e Felipe Balbi    2016-04-18  1166  		 * usable for user data.
f0183a338e4f90e Felipe Balbi    2016-04-18  1167  		 */
^1da177e4c3f415 Linus Torvalds  2005-04-16  1168  		sprintf(blurbtxt + strl=
en(blurbtxt),
^1da177e4c3f415 Linus Torvalds  2005-04-16  1169  			", %d MB", 1<<(cardinf=
o->chipshift - 20));
^1da177e4c3f415 Linus Torvalds  2005-04-16  1170  	} else {
^1da177e4c3f415 Linus Torvalds  2005-04-16  1171  		sprintf(blurbtxt + strl=
en(blurbtxt),
^1da177e4c3f415 Linus Torvalds  2005-04-16  1172  			", type unrecognized");
^1da177e4c3f415 Linus Torvalds  2005-04-16  1173  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  1174  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1175  	/* Byte 2 is code to sig=
nal availability of 128-bit ID */
^1da177e4c3f415 Linus Torvalds  2005-04-16  1176  	if (deviceID[2] =3D=3D 0=
xa5) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  1177  		sprintf(blurbtxt + strl=
en(blurbtxt),
^1da177e4c3f415 Linus Torvalds  2005-04-16  1178  			", 128-bit ID");
^1da177e4c3f415 Linus Torvalds  2005-04-16  1179  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  1180  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1181  	/* Byte 3 announces the =
availability of another read ID command */
^1da177e4c3f415 Linus Torvalds  2005-04-16  1182  	if (deviceID[3] =3D=3D 0=
xc0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  1183  		sprintf(blurbtxt + strl=
en(blurbtxt),
^1da177e4c3f415 Linus Torvalds  2005-04-16  1184  			", extra cmd");
^1da177e4c3f415 Linus Torvalds  2005-04-16  1185  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  1186  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1187  	if (flags & SDDR09_WP)
^1da177e4c3f415 Linus Torvalds  2005-04-16  1188  		sprintf(blurbtxt + strl=
en(blurbtxt),
^1da177e4c3f415 Linus Torvalds  2005-04-16  1189  			", WP");
^1da177e4c3f415 Linus Torvalds  2005-04-16  1190  =

6f8aa65b5203712 Frank Seidel    2009-02-05  1191  	printk(KERN_WARNING "%s\=
n", blurbtxt);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1192  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  1193  	return cardinfo;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1194  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  1195  =


:::::: The code at line 1156 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5464367524694185212==--

