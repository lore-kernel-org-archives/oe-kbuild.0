Content-Type: multipart/mixed; boundary="===============1267898355997863693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ptp/ptp_ocp.c:1211:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provide...
Date: Wed, 01 Jun 2022 10:08:58 +0800
Message-ID: <202206011053.o9wlZ2ts-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1267898355997863693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/ptp/ptp_ocp.c:1211:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]"
:::::: =


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
head:   2a5699b0de4ee623d77f183c8e8e62691bd60a70
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220530 (https://download.01.org/0day-ci/arc=
hive/20220601/202206011053.o9wlZ2ts-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c4=
8f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
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
                            ^~~
   drivers/hwmon/max31730.c:219:8: note: '?' condition is true
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
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
   drivers/hwmon/max31730.c:219:2: note: The value -128000 is assigned to '=
val'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/max31730.c:220:30: note: The result of the left shift is u=
ndefined because the left operand is negative
           val =3D DIV_ROUND_CLOSEST(val << 4, 1000) << 4;
                                       ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/ptp/ptp_idt82p33.c:126:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&msg[1], buf, count);
           ^~~~~~
   drivers/ptp/ptp_idt82p33.c:126:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(&msg[1], buf, count);
           ^~~~~~
   drivers/ptp/ptp_idt82p33.c:899:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(channel->caps.name, sizeof(channel->caps.name),
           ^~~~~~~~
   drivers/ptp/ptp_idt82p33.c:899:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(channel->caps.name, sizeof(channel->caps.name),
           ^~~~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   drivers/ptp/ptp_ocp.c:773:2: warning: Value stored to 'ctrl' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ctrl =3D ioread32(&bp->reg->ctrl);
           ^
   drivers/ptp/ptp_ocp.c:773:2: note: Value stored to 'ctrl' is never read
   drivers/ptp/ptp_ocp.c:780:2: warning: Value stored to 'ctrl' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ctrl =3D ioread32(&bp->reg->ctrl);
           ^
   drivers/ptp/ptp_ocp.c:780:2: note: Value stored to 'ctrl' is never read
   drivers/ptp/ptp_ocp.c:1082:4: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(buf, "%d", ver);
                           ^~~~~~~
   drivers/ptp/ptp_ocp.c:1082:4: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                           sprintf(buf, "%d", ver);
                           ^~~~~~~
   drivers/ptp/ptp_ocp.c:1087:4: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(buf, "%d", ver >> 16);
                           ^~~~~~~
   drivers/ptp/ptp_ocp.c:1087:4: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                           sprintf(buf, "%d", ver >> 16);
                           ^~~~~~~
   drivers/ptp/ptp_ocp.c:1100:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "%pM", bp->serial);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:1100:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "%pM", bp->serial);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:1204:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "AXI.%d", id);
           ^~~~~~~
   drivers/ptp/ptp_ocp.c:1204:2: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "AXI.%d", id);
           ^~~~~~~
>> drivers/ptp/ptp_ocp.c:1211:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           sprintf(buf, "%s.%d", info->name, id);
           ^~~~~~~
   drivers/ptp/ptp_ocp.c:1211:2: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           sprintf(buf, "%s.%d", info->name, id);
           ^~~~~~~
   drivers/ptp/ptp_ocp.c:1342:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&uart, 0, sizeof(uart));
           ^~~~~~
   drivers/ptp/ptp_ocp.c:1342:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&uart, 0, sizeof(uart));
           ^~~~~~
   drivers/ptp/ptp_ocp.c:1994:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ans, def);
           ^~~~~~
   drivers/ptp/ptp_ocp.c:1994:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(ans, def);
           ^~~~~~
   drivers/ptp/ptp_ocp.c:1996:10: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   ans +=3D sprintf(ans, "%s ", pri);
                          ^~~~~~~
   drivers/ptp/ptp_ocp.c:1996:10: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   ans +=3D sprintf(ans, "%s ", pri);
                          ^~~~~~~
   drivers/ptp/ptp_ocp.c:1998:3: warning: Value stored to 'ans' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   ans +=3D sprintf(ans, "%s ", sec);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:1998:3: note: Value stored to 'ans' is never read
                   ans +=3D sprintf(ans, "%s ", sec);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:1998:10: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   ans +=3D sprintf(ans, "%s ", sec);
                          ^~~~~~~
   drivers/ptp/ptp_ocp.c:1998:10: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   ans +=3D sprintf(ans, "%s ", sec);
                          ^~~~~~~
   drivers/ptp/ptp_ocp.c:2132:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "----");
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2132:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "----");
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2135:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "IRIG");
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2135:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "IRIG");
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2138:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   sprintf(buf, "%s via PPS1", src);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2138:3: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   sprintf(buf, "%s via PPS1", src);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2141:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "DCF");
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2141:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "DCF");
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2144:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buf, "unknown");
                   ^~~~~~
   drivers/ptp/ptp_ocp.c:2144:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(buf, "unknown");
                   ^~~~~~
   drivers/ptp/ptp_ocp.c:2301:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "ttyS%d", bp->gnss_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2301:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "ttyS%d", bp->gnss_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2305:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "ttyS%d", bp->gnss2_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2305:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "ttyS%d", bp->gnss2_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2309:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "ttyS%d", bp->mac_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2309:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "ttyS%d", bp->mac_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2313:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "ttyS%d", bp->nmea_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2313:3: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "ttyS%d", bp->nmea_port);
                   ^~~~~~~
   drivers/ptp/ptp_ocp.c:2316:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "ptp%d", ptp_clock_index(bp->ptp));
           ^~~~~~~
   drivers/ptp/ptp_ocp.c:2316:2: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "ptp%d", ptp_clock_index(bp->ptp));
           ^~~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/leds/leds-lm3530.c:236:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&als, 0, sizeof(struct lm3530_als_data));

vim +1211 drivers/ptp/ptp_ocp.c

773bda96492153 Jonathan Lemon 2021-08-03  1190  =

773bda96492153 Jonathan Lemon 2021-08-03  1191  static int
773bda96492153 Jonathan Lemon 2021-08-03  1192  ptp_ocp_register_i2c(struct=
 ptp_ocp *bp, struct ocp_resource *r)
773bda96492153 Jonathan Lemon 2021-08-03  1193  {
773bda96492153 Jonathan Lemon 2021-08-03  1194  	struct pci_dev *pdev =3D b=
p->pdev;
1618df6afab2c1 Jonathan Lemon 2021-09-14  1195  	struct ptp_ocp_i2c_info *i=
nfo;
773bda96492153 Jonathan Lemon 2021-08-03  1196  	struct platform_device *p;
773bda96492153 Jonathan Lemon 2021-08-03  1197  	struct clk_hw *clk;
773bda96492153 Jonathan Lemon 2021-08-03  1198  	char buf[32];
773bda96492153 Jonathan Lemon 2021-08-03  1199  	int id;
773bda96492153 Jonathan Lemon 2021-08-03  1200  =

1618df6afab2c1 Jonathan Lemon 2021-09-14  1201  	info =3D r->extra;
773bda96492153 Jonathan Lemon 2021-08-03  1202  	id =3D pci_dev_id(bp->pdev=
);
773bda96492153 Jonathan Lemon 2021-08-03  1203  =

773bda96492153 Jonathan Lemon 2021-08-03  1204  	sprintf(buf, "AXI.%d", id);
1618df6afab2c1 Jonathan Lemon 2021-09-14  1205  	clk =3D clk_hw_register_fi=
xed_rate(&pdev->dev, buf, NULL, 0,
1618df6afab2c1 Jonathan Lemon 2021-09-14  1206  					 info->fixed_rate);
773bda96492153 Jonathan Lemon 2021-08-03  1207  	if (IS_ERR(clk))
773bda96492153 Jonathan Lemon 2021-08-03  1208  		return PTR_ERR(clk);
773bda96492153 Jonathan Lemon 2021-08-03  1209  	bp->i2c_clk =3D clk;
773bda96492153 Jonathan Lemon 2021-08-03  1210  =

1618df6afab2c1 Jonathan Lemon 2021-09-14 @1211  	sprintf(buf, "%s.%d", info=
->name, id);
773bda96492153 Jonathan Lemon 2021-08-03  1212  	devm_clk_hw_register_clkde=
v(&pdev->dev, clk, NULL, buf);
773bda96492153 Jonathan Lemon 2021-08-03  1213  	p =3D ptp_ocp_i2c_bus(bp->=
pdev, r, id);
773bda96492153 Jonathan Lemon 2021-08-03  1214  	if (IS_ERR(p))
773bda96492153 Jonathan Lemon 2021-08-03  1215  		return PTR_ERR(p);
773bda96492153 Jonathan Lemon 2021-08-03  1216  =

773bda96492153 Jonathan Lemon 2021-08-03  1217  	bp_assign_entry(bp, r, p);
773bda96492153 Jonathan Lemon 2021-08-03  1218  =

773bda96492153 Jonathan Lemon 2021-08-03  1219  	return 0;
773bda96492153 Jonathan Lemon 2021-08-03  1220  }
773bda96492153 Jonathan Lemon 2021-08-03  1221  =


:::::: The code at line 1211 was first introduced by commit
:::::: 1618df6afab2c1856cd574444b76f6dccee080df ptp: ocp: parameterize the =
i2c driver used

:::::: TO: Jonathan Lemon <jonathan.lemon@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1267898355997863693==--

