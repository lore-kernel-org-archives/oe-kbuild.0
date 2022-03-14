Content-Type: multipart/mixed; boundary="===============1739038256375436761=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11110/11953] drivers/hwmon/nsa320-hwmon.c:114:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or p...
Date: Mon, 14 Mar 2022 08:47:11 +0800
Message-ID: <202203140843.jDb2RRbR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1739038256375436761==
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
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220313 (https://download.01.org/0day-ci/archi=
ve/20220314/202203140843.jDb2RRbR-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb=
2cb7654c15ae366967ef35093c5724c416)
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
   include/linux/mtd/nand.h:419:2: note: Returning without writing to 'nand=
->ecc.user_conf.strength', which participates in a condition later
           return &nand->mtd;
           ^
   include/linux/mtd/nand.h:419:2: note: Returning without writing to 'nand=
->ecc.ctx.conf.strength', which participates in a condition later
   drivers/mtd/nand/ecc-sw-bch.c:173:25: note: Returning from 'nanddev_to_m=
td'
           struct mtd_info *mtd =3D nanddev_to_mtd(nand);
                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:179:6: note: Assuming field 'oobsize' is >=
=3D 64
           if (mtd->oobsize < 64) {
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:179:2: note: Taking false branch
           if (mtd->oobsize < 64) {
           ^
   drivers/mtd/nand/ecc-sw-bch.c:184:6: note: Assuming field 'ooblayout' is=
 non-null
           if (!mtd->ooblayout)
               ^~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:184:2: note: Taking false branch
           if (!mtd->ooblayout)
           ^
   drivers/mtd/nand/ecc-sw-bch.c:198:6: note: Assuming field 'step_size' is=
 not equal to 0
           if (!conf->step_size) {
               ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:198:2: note: Taking false branch
           if (!conf->step_size) {
           ^
   drivers/mtd/nand/ecc-sw-bch.c:210:6: note: Assuming the condition is fal=
se
           if (nand->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:210:2: note: Taking false branch
           if (nand->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
           ^
   drivers/mtd/nand/ecc-sw-bch.c:218:7: note: 'code_size' is 0
           if (!code_size)
                ^~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:218:2: note: Taking true branch
           if (!code_size)
           ^
   drivers/mtd/nand/ecc-sw-bch.c:220:7: note: Calling 'fls'
                                            fls(8 * conf->step_size), 8);
                                            ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                          ^
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is 0, which pa=
rticipates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking true branch
           if (!x)
           ^
   drivers/mtd/nand/ecc-sw-bch.c:220:7: note: Returning from 'fls'
                                            fls(8 * conf->step_size), 8);
                                            ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                          ^
   drivers/mtd/nand/ecc-sw-bch.c:222:6: note: Assuming field 'strength' is 0
           if (!conf->strength)
               ^~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:222:2: note: Taking true branch
           if (!conf->strength)
           ^
   drivers/mtd/nand/ecc-sw-bch.c:223:38: note: Calling 'fls'
                   conf->strength =3D (code_size * 8) / fls(8 * conf->step_=
size);
                                                      ^~~~~~~~~~~~~~~~~~~~~=
~~~
   include/asm-generic/bitops/fls.h:17:7: note: 'x' is 0
           if (!x)
                ^
   include/asm-generic/bitops/fls.h:17:2: note: Taking true branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:18:3: note: Returning zero
                   return 0;
                   ^~~~~~~~
   drivers/mtd/nand/ecc-sw-bch.c:223:38: note: Returning from 'fls'
                   conf->strength =3D (code_size * 8) / fls(8 * conf->step_=
size);
                                                      ^~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/nand/ecc-sw-bch.c:223:36: note: Division by zero
                   conf->strength =3D (code_size * 8) / fls(8 * conf->step_=
size);
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
>> drivers/hwmon/nsa320-hwmon.c:114:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%s\n", nsa320_input_names[channel]);
                  ^~~~~~~
   drivers/hwmon/nsa320-hwmon.c:114:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%s\n", nsa320_input_names[channel]);
                  ^~~~~~~
   drivers/hwmon/nsa320-hwmon.c:125:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (mcu_data & 0xffff) * 100);
                  ^~~~~~~
   drivers/hwmon/nsa320-hwmon.c:125:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (mcu_data & 0xffff) * 100);
                  ^~~~~~~
   drivers/hwmon/nsa320-hwmon.c:136:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ((mcu_data & 0xff0000) >> 16) * 100);
                  ^~~~~~~
   drivers/hwmon/nsa320-hwmon.c:136:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ((mcu_data & 0xff0000) >> 16) * 100);
                  ^~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/hwmon/pc87360.c:249:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan[attr->index],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:249:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan[attr->index],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:257:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan_min[attr->ind=
ex],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:257:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan_min[attr->ind=
ex],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:265:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/pc87360.c:265:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/pc87360.c:273:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/pc87360.c:273:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/pc87360.c:348:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/pc87360.c:348:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/pc87360.c:397:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in[attr->index],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:397:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in[attr->index],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:405:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index=
],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:405:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index=
],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:413:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index=
],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:413:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index=
],
                  ^~~~~~~
   drivers/hwmon/pc87360.c:421:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->in_status[attr->index]);
                  ^~~~~~~
   drivers/hwmon/pc87360.c:421:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->in_status[attr->index]);
                  ^~~~~~~
   drivers/hwmon/pc87360.c:535:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MI=
N));
                  ^~~~~~~
   drivers/hwmon/pc87360.c:535:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MI=
N));
                  ^~~~~~~
   drivers/hwmon/pc87360.c:543:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MA=
X));
                  ^~~~~~~
   drivers/hwmon/pc87360.c:543:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MA=
X));
                  ^~~~~~~
   drivers/hwmon/pc87360.c:585:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/pc87360.c:585:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/pc87360.c:593:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/pc87360.c:593:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->vrm);
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
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:155:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/firmware/turris-mox-rwtm.c:141:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MOX_ATTR_RO(serial_number, "%016llX\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:141:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   MOX_ATTR_RO(serial_number, "%016llX\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:142:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MOX_ATTR_RO(board_version, "%i\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:142:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   MOX_ATTR_RO(board_version, "%i\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:143:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MOX_ATTR_RO(ram_size, "%i\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:143:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   MOX_ATTR_RO(ram_size, "%i\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:144:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MOX_ATTR_RO(mac_address1, "%pM\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:144:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   MOX_ATTR_RO(mac_address1, "%pM\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:145:1: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MOX_ATTR_RO(mac_address2, "%pM\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:145:1: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
   MOX_ATTR_RO(mac_address2, "%pM\n", board_info);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
>> drivers/firmware/turris-mox-rwtm.c:146:1: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
   MOX_ATTR_RO(pubkey, "%s\n", pubkey);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:146:1: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
   MOX_ATTR_RO(pubkey, "%s\n", pubkey);
   ^
   drivers/firmware/turris-mox-rwtm.c:137:9: note: expanded from macro 'MOX=
_ATTR_RO'
           return sprintf(buf, format, rwtm->name);                \
                  ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:254:3: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rwtm->pubkey,
                   ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:254:3: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rwtm->pubkey,
                   ^~~~~~~
   drivers/firmware/turris-mox-rwtm.c:317:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, rwtm->buf, max);
           ^~~~~~
   drivers/firmware/turris-mox-rwtm.c:317:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, rwtm->buf, max);
           ^~~~~~
   drivers/firmware/turris-mox-rwtm.c:387:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rwtm->buf, 0, 4);
           ^~~~~~
   drivers/firmware/turris-mox-rwtm.c:387:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(rwtm->buf, 0, 4);
           ^~~~~~
   drivers/firmware/turris-mox-rwtm.c:415:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
           ^~~~~~
   drivers/firmware/turris-mox-rwtm.c:415:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/hwmon/gl520sm.c:193:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:193:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:213:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", VDD_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:213:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", VDD_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:215:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", IN_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:215:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", IN_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:226:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", VDD_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:226:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", VDD_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:228:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", IN_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:228:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", IN_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:239:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", VDD_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:239:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", VDD_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:241:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", IN_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:241:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", IN_FROM_REG(r));
                          ^~~~~~~
   drivers/hwmon/gl520sm.c:344:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_input[n],
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:344:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_input[n],
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:354:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[n],
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:354:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[n],
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:364:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[n]));
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:364:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[n]));
                  ^~~~~~~
   drivers/hwmon/gl520sm.c:371:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->fan_off);
--
           ^
   drivers/clocksource/timer-atmel-tcb.c:443:3: note: Taking false branch
                   pr_debug("TC: %u / %-3u [%d] --> %u\n", rate, divisor, i=
, tmp);
                   ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/clocksource/timer-atmel-tcb.c:444:8: note: 'best_divisor_idx' is=
 >=3D 0
                   if ((best_divisor_idx >=3D 0) && (tmp < 5 * 1000 * 1000))
                        ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:444:7: note: Left side of '&&' is =
true
                   if ((best_divisor_idx >=3D 0) && (tmp < 5 * 1000 * 1000))
                       ^
   drivers/clocksource/timer-atmel-tcb.c:444:35: note: Assuming the conditi=
on is true
                   if ((best_divisor_idx >=3D 0) && (tmp < 5 * 1000 * 1000))
                                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:444:3: note: Taking true branch
                   if ((best_divisor_idx >=3D 0) && (tmp < 5 * 1000 * 1000))
                   ^
   drivers/clocksource/timer-atmel-tcb.c:445:4: note:  Execution continues =
on line 450
                           break;
                           ^
   drivers/clocksource/timer-atmel-tcb.c:452:2: note: Taking false branch
           pr_debug("%s@%d.%03d MHz\n", clksrc.name, divided_rate / 1000=
000,
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/clocksource/timer-atmel-tcb.c:457:6: note: Assuming 'bits' is eq=
ual to 32
           if (bits =3D=3D 32) {
               ^~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:457:2: note: Taking true branch
           if (bits =3D=3D 32) {
           ^
   drivers/clocksource/timer-atmel-tcb.c:481:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/clocksource/timer-atmel-tcb.c:481:2: note: Taking false branch
           if (ret)
           ^
   drivers/clocksource/timer-atmel-tcb.c:485:8: note: Calling 'setup_clkeve=
nts'
           ret =3D setup_clkevents(&tc, best_divisor_idx);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:261:2: note: 'bits' initialized to=
 32
           int bits =3D tc->tcb_config->counter_width;
           ^~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:264:8: note: Calling 'clk_prepare_=
enable'
           ret =3D clk_prepare_enable(t2_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/clocksource/timer-atmel-tcb.c:264:8: note: Returning from 'clk_p=
repare_enable'
           ret =3D clk_prepare_enable(t2_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:265:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/clocksource/timer-atmel-tcb.c:265:2: note: Taking false branch
           if (ret)
           ^
   drivers/clocksource/timer-atmel-tcb.c:271:6: note: 'bits' is equal to 32
           if (bits =3D=3D 32) {
               ^~~~
   drivers/clocksource/timer-atmel-tcb.c:271:2: note: Taking true branch
           if (bits =3D=3D 32) {
           ^
   drivers/clocksource/timer-atmel-tcb.c:290:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/clocksource/timer-atmel-tcb.c:290:2: note: Taking false branch
           if (ret) {
           ^
   drivers/clocksource/timer-atmel-tcb.c:297:66: note: The result of the le=
ft shift is undefined due to shifting by '32', which is greater or equal to=
 the width of type 'unsigned long'
           clockevents_config_and_register(&clkevt.clkevt, clkevt.rate, 1, =
BIT(bits) - 1);
                                                                           ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
>> drivers/leds/trigger/ledtrig-tty.c:33:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
                   len =3D sprintf(buf, "%s\n", trigger_data->ttyname);
                         ^~~~~~~
   drivers/leds/trigger/ledtrig-tty.c:33:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
                   len =3D sprintf(buf, "%s\n", trigger_data->ttyname);
                         ^~~~~~~
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/firmware/qcom_scm.c:466:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mdata_buf, metadata, size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:466:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(mdata_buf, metadata, size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:1053:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(keybuf, key, key_size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:1053:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(keybuf, key, key_size);
           ^~~~~~
   drivers/firmware/qcom_scm.c:1126:8: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
           *resp =3D res.result[0];
                 ^ ~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:1118:6: note: Assuming 'req_cnt' is <=3D QCO=
M_SCM_HDCP_MAX_REQ_CNT
           if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:1118:2: note: Taking false branch
           if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
           ^
   drivers/firmware/qcom_scm.c:1121:8: note: Calling 'qcom_scm_clk_enable'
           ret =3D qcom_scm_clk_enable();
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:87:8: note: Calling 'clk_prepare_enable'
           ret =3D clk_prepare_enable(__scm->core_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/firmware/qcom_scm.c:87:8: note: Returning from 'clk_prepare_enab=
le'
           ret =3D clk_prepare_enable(__scm->core_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:88:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/firmware/qcom_scm.c:88:2: note: Taking false branch
           if (ret)
           ^
   drivers/firmware/qcom_scm.c:91:8: note: Calling 'clk_prepare_enable'
           ret =3D clk_prepare_enable(__scm->iface_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/firmware/qcom_scm.c:91:8: note: Returning from 'clk_prepare_enab=
le'
           ret =3D clk_prepare_enable(__scm->iface_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qcom_scm.c:92:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/firmware/qcom_scm.c:92:2: note: Taking false branch
           if (ret)
           ^
   drivers/firmware/qcom_scm.c:95:8: note: Calling 'clk_prepare_enable'
           ret =3D clk_prepare_enable(__scm->bus_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:951:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:951:2: note: Taking false branch
           if (ret)
--
                   memset(cable->chg_propval, 0, sizeof(cable->chg_propval)=
);
                   ^~~~~~
   drivers/extcon/extcon.c:343:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cable->jack_propval, 0, sizeof(cable->jack_propva=
l));
                   ^~~~~~
   drivers/extcon/extcon.c:343:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(cable->jack_propval, 0, sizeof(cable->jack_propva=
l));
                   ^~~~~~
   drivers/extcon/extcon.c:345:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cable->disp_propval, 0, sizeof(cable->disp_propva=
l));
                   ^~~~~~
   drivers/extcon/extcon.c:345:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(cable->disp_propval, 0, sizeof(cable->disp_propva=
l));
                   ^~~~~~
   drivers/extcon/extcon.c:355:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%u\n", edev->state);
                          ^~~~~~~
   drivers/extcon/extcon.c:355:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%u\n", edev->state);
                          ^~~~~~~
   drivers/extcon/extcon.c:358:12: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   count +=3D sprintf(buf + count, "%s=3D%d\n",
                            ^~~~~~~
   drivers/extcon/extcon.c:358:12: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   count +=3D sprintf(buf + count, "%s=3D%d\n",
                            ^~~~~~~
   drivers/extcon/extcon.c:372:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", edev->name);
                  ^~~~~~~
   drivers/extcon/extcon.c:372:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", edev->name);
                  ^~~~~~~
   drivers/extcon/extcon.c:383:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/extcon/extcon.c:383:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/extcon/extcon.c:395:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/extcon/extcon.c:395:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/extcon/extcon.c:460:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name_buf, sizeof(name_buf), "NAME=3D%s", prop_b=
uf);
                   ^~~~~~~~
   drivers/extcon/extcon.c:460:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name_buf, sizeof(name_buf), "NAME=3D%s", prop_b=
uf);
                   ^~~~~~~~
   drivers/extcon/extcon.c:468:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(state_buf, sizeof(state_buf), "STATE=3D%s", pro=
p_buf);
                   ^~~~~~~~
   drivers/extcon/extcon.c:468:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(state_buf, sizeof(state_buf), "STATE=3D%s", pro=
p_buf);
                   ^~~~~~~~
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/extcon/extcon-max8997.c:416:3: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D max8997_muic_handle_jig_uart(info, attached);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-max8997.c:416:3: note: Value stored to 'ret' is ne=
ver read
                   ret =3D max8997_muic_handle_jig_uart(info, attached);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/extcon/extcon-ptn5150.c:173:2: warning: Value stored to 'vendor_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           vendor_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VENDOR, reg_data);
           ^
   drivers/extcon/extcon-ptn5150.c:173:2: note: Value stored to 'vendor_id'=
 is never read
   drivers/extcon/extcon-ptn5150.c:174:2: warning: Value stored to 'version=
_id' is never read [clang-analyzer-deadcode.DeadStores]
           version_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VERSION, reg_data=
);
           ^
   drivers/extcon/extcon-ptn5150.c:174:2: note: Value stored to 'version_id=
' is never read
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/memory/brcmstb_dpfe.c:414:12: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           *size =3D sprintf(buf,
                                   ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:414:12: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                           *size =3D sprintf(buf,
                                   ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:703:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "ERROR: driver private data not set\=
n");
                          ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:703:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "ERROR: driver private data not set\=
n");
                          ^~~~~~~
>> drivers/memory/brcmstb_dpfe.c:707:10: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                   return sprintf(buf, "ERROR: %s\n", get_error_text(-ret));
                          ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:707:10: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                   return sprintf(buf, "ERROR: %s\n", get_error_text(-ret));
                          ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:725:7: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
           info =3D response[MSG_ARG0];
                ^ ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:721:8: note: Calling 'generic_show'
           ret =3D generic_show(DPFE_CMD_GET_INFO, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:702:6: note: Assuming 'priv' is null, whic=
h participates in a condition later
           if (!priv)
               ^~~~~
   drivers/memory/brcmstb_dpfe.c:702:2: note: Taking true branch
           if (!priv)
           ^
   drivers/memory/brcmstb_dpfe.c:703:3: note: Returning value, which partic=
ipates in a condition later
                   return sprintf(buf, "ERROR: driver private data not set\=
n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/memory/brcmstb_dpfe.c:721:8: note: Returning from 'generic_show'
           ret =3D generic_show(DPFE_CMD_GET_INFO, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:722:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/memory/brcmstb_dpfe.c:722:2: note: Taking false branch
           if (ret)
           ^
   drivers/memory/brcmstb_dpfe.c:725:7: note: Assigned value is garbage or =
undefined
           info =3D response[MSG_ARG0];
                ^ ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:727:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u.%u.%u.%u\n",
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:727:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u.%u.%u.%u\n",
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:749:9: warning: 2nd function call argument=
 is an uninitialized value [clang-analyzer-core.CallAndMessage]
           info =3D get_msg_ptr(priv, response[MSG_ARG0], buf, &ret);
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:745:8: note: Calling 'generic_show'
           ret =3D generic_show(DPFE_CMD_GET_REFRESH, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:702:6: note: Assuming 'priv' is null, whic=
h participates in a condition later
           if (!priv)
               ^~~~~
   drivers/memory/brcmstb_dpfe.c:702:2: note: Taking true branch
           if (!priv)
           ^
   drivers/memory/brcmstb_dpfe.c:703:3: note: Returning value, which partic=
ipates in a condition later
                   return sprintf(buf, "ERROR: driver private data not set\=
n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/memory/brcmstb_dpfe.c:745:8: note: Returning from 'generic_show'
           ret =3D generic_show(DPFE_CMD_GET_REFRESH, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:746:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/memory/brcmstb_dpfe.c:746:2: note: Taking false branch
           if (ret)
           ^
   drivers/memory/brcmstb_dpfe.c:749:9: note: 2nd function call argument is=
 an uninitialized value
           info =3D get_msg_ptr(priv, response[MSG_ARG0], buf, &ret);
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:762:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#x %#x %#x %#x %#x %#x %#x\n",
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:762:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#x %#x %#x %#x %#x %#x %#x\n",
                  ^~~~~~~
   drivers/memory/brcmstb_dpfe.c:808:9: warning: 2nd function call argument=
 is an uninitialized value [clang-analyzer-core.CallAndMessage]
           info =3D get_msg_ptr(priv, response[MSG_ARG0], buf, &ret);
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:804:8: note: Calling 'generic_show'
           ret =3D generic_show(DPFE_CMD_GET_VENDOR, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:702:6: note: Assuming 'priv' is null, whic=
h participates in a condition later
           if (!priv)
               ^~~~~
   drivers/memory/brcmstb_dpfe.c:702:2: note: Taking true branch
           if (!priv)
           ^
   drivers/memory/brcmstb_dpfe.c:703:3: note: Returning value, which partic=
ipates in a condition later
                   return sprintf(buf, "ERROR: driver private data not set\=
n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/memory/brcmstb_dpfe.c:804:8: note: Returning from 'generic_show'
           ret =3D generic_show(DPFE_CMD_GET_VENDOR, response, priv, buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:805:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/memory/brcmstb_dpfe.c:805:2: note: Taking false branch
           if (ret)
           ^
   drivers/memory/brcmstb_dpfe.c:808:9: note: 2nd function call argument is=
 an uninitialized value
           info =3D get_msg_ptr(priv, response[MSG_ARG0], buf, &ret);
                  ^                 ~~~~~~~~~~~~~~~~~~
   drivers/memory/brcmstb_dpfe.c:822:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#x %#x %#x %#x %#x\n", mr5, mr6, mr7, mr8,=
 err);
--
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:66:2: note: Taking false branch
           if (NF_INVF(ipinfo, IPT_INV_VIA_OUT, ret !=3D 0))
           ^
   net/ipv4/netfilter/ip_tables.c:70:6: note: Assuming field 'proto' is 0
           if (ipinfo->proto &&
               ^~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:70:20: note: Left side of '&&' is false
           if (ipinfo->proto &&
                             ^
   net/ipv4/netfilter/ip_tables.c:77:8: note: Assuming the condition is fal=
se
                       (ipinfo->flags & IPT_F_FRAG) && !isfrag))
                        ^
   include/linux/netfilter/x_tables.h:13:4: note: expanded from macro 'NF_I=
NVF'
           ((boolean) ^ !!((ptr)->invflags & (flag)))
             ^~~~~~~
   net/ipv4/netfilter/ip_tables.c:77:36: note: Left side of '&&' is false
                       (ipinfo->flags & IPT_F_FRAG) && !isfrag))
                                                    ^
   net/ipv4/netfilter/ip_tables.c:76:6: note: Assuming the condition is true
           if (NF_INVF(ipinfo, IPT_INV_FRAG,
               ^
   include/linux/netfilter/x_tables.h:13:16: note: expanded from macro 'NF_=
INVF'
           ((boolean) ^ !!((ptr)->invflags & (flag)))
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:76:2: note: Taking false branch
           if (NF_INVF(ipinfo, IPT_INV_FRAG,
           ^
   net/ipv4/netfilter/ip_tables.c:80:2: note: Returning the value 1, which =
participates in a condition later
           return true;
           ^~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:285:8: note: Returning from 'ip_packet_ma=
tch'
                   if (!ip_packet_match(ip, indev, outdev,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:285:3: note: Taking false branch
                   if (!ip_packet_match(ip, indev, outdev,
                   ^
   net/ipv4/netfilter/ip_tables.c:292:3: note: Loop condition is false. Exe=
cution continues on line 299
                   xt_ematch_foreach(ematch, e) {
                   ^
   include/uapi/linux/netfilter/x_tables.h:181:2: note: expanded from macro=
 'xt_ematch_foreach'
           for ((pos) =3D (struct xt_entry_match *)entry->elems; \
           ^
   net/ipv4/netfilter/ip_tables.c:300:3: note: Loop condition is false.  Ex=
iting loop
                   ADD_COUNTER(*counter, skb->len, 1);
                   ^
   include/uapi/linux/netfilter/x_tables.h:108:28: note: expanded from macr=
o 'ADD_COUNTER'
   #define ADD_COUNTER(c,b,p) do { (c).bcnt +=3D (b); (c).pcnt +=3D (p); } =
while(0)
                              ^
   net/ipv4/netfilter/ip_tables.c:303:11: note: Assuming field 'target' is =
null
                   WARN_ON(!t->u.kernel.target);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/ipv4/netfilter/ip_tables.c:312:8: note: Access to field 'target' res=
ults in a dereference of a null pointer (loaded from field 'target')
                   if (!t->u.kernel.target->target) {
                        ^           ~~~~~~
   net/ipv4/netfilter/ip_tables.c:532:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mtpar, 0, sizeof(mtpar));
           ^~~~~~
   net/ipv4/netfilter/ip_tables.c:532:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&mtpar, 0, sizeof(mtpar));
           ^~~~~~
   net/ipv4/netfilter/ip_tables.c:978:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&info, 0, sizeof(info));
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:978:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(&info, 0, sizeof(info));
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:980:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info.hook_entry, private->hook_entry,
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:980:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info.hook_entry, private->hook_entry,
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:982:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info.underflow, private->underflow,
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:982:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info.underflow, private->underflow,
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:986:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(info.name, name);
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:986:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(info.name, name);
                   ^~~~~~
   net/ipv4/netfilter/ip_tables.c:1735:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(loc_cpu_entry, repl->entries, repl->size);
           ^~~~~~
   net/ipv4/netfilter/ip_tables.c:1735:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(loc_cpu_entry, repl->entries, repl->size);
           ^~~~~~
   Suppressed 78 warnings (77 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
>> drivers/mmc/host/omap_hsmmc.c:747:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(buf, "%s\n", mmc_pdata(host)->name);
                  ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:747:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(buf, "%s\n", mmc_pdata(host)->name);
                  ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:873:6: warning: Access to field 'sbc' resu=
lts in a dereference of a null pointer (loaded from field 'mrq') [clang-ana=
lyzer-core.NullDereference]
           if (host->mrq->sbc && (host->cmd =3D=3D host->mrq->sbc) &&
               ^
   drivers/mmc/host/omap_hsmmc.c:1072:2: note: Loop condition is true.  Ent=
ering loop body
           while (status & (INT_EN_MASK | CIRQ_EN)) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1073:7: note: Assuming field 'req_in_progr=
ess' is not equal to 0
                   if (host->req_in_progress)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1073:3: note: Taking true branch
                   if (host->req_in_progress)
                   ^
   drivers/mmc/host/omap_hsmmc.c:1074:4: note: Calling 'omap_hsmmc_do_irq'
                           omap_hsmmc_do_irq(host, status);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1023:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "IRQ Status is %x\n", status);
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/omap_hsmmc.c:1025:6: note: Assuming the condition is fa=
lse
           if (status & ERR_EN) {
               ^~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1025:2: note: Taking false branch
           if (status & ERR_EN) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1057:6: note: 'end_cmd' is 0
           if (end_cmd || ((status & CC_EN) && host->cmd))
               ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:6: note: Left side of '||' is false
   drivers/mmc/host/omap_hsmmc.c:1057:19: note: Assuming the condition is f=
alse
           if (end_cmd || ((status & CC_EN) && host->cmd))
                            ^~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:35: note: Left side of '&&' is false
           if (end_cmd || ((status & CC_EN) && host->cmd))
                                            ^
   drivers/mmc/host/omap_hsmmc.c:1059:7: note: 'end_trans' is 0
           if ((end_trans || (status & TC_EN)) && host->mrq)
                ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1059:7: note: Left side of '||' is false
   drivers/mmc/host/omap_hsmmc.c:1059:21: note: Assuming the condition is t=
rue
           if ((end_trans || (status & TC_EN)) && host->mrq)
                              ^~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1059:6: note: Left side of '&&' is true
           if ((end_trans || (status & TC_EN)) && host->mrq)
               ^
   drivers/mmc/host/omap_hsmmc.c:1059:41: note: Assuming field 'mrq' is non=
-null
           if ((end_trans || (status & TC_EN)) && host->mrq)
                                                  ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1059:2: note: Taking true branch
           if ((end_trans || (status & TC_EN)) && host->mrq)
           ^
   drivers/mmc/host/omap_hsmmc.c:1060:3: note: Calling 'omap_hsmmc_xfer_don=
e'
                   omap_hsmmc_xfer_done(host, data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:840:6: note: Assuming 'data' is non-null
           if (!data) {
               ^~~~~
   drivers/mmc/host/omap_hsmmc.c:840:2: note: Taking false branch
           if (!data) {
           ^
   drivers/mmc/host/omap_hsmmc.c:856:6: note: Assuming field 'error' is not=
 equal to 0
           if (!data->error)
               ^~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:856:2: note: Taking false branch
           if (!data->error)
           ^
   drivers/mmc/host/omap_hsmmc.c:861:6: note: Assuming field 'stop' is null
           if (data->stop && (data->error || !host->mrq->sbc))
               ^~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:861:17: note: Left side of '&&' is false
           if (data->stop && (data->error || !host->mrq->sbc))
                          ^
   drivers/mmc/host/omap_hsmmc.c:864:3: note: Calling 'omap_hsmmc_request_d=
one'
                   omap_hsmmc_request_done(host, data->mrq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:821:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&host->irq_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/mmc/host/omap_hsmmc.c:821:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&host->irq_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/mmc/host/omap_hsmmc.c:828:6: note: Assuming field 'data' is null
           if (mrq->data && host->use_dma && dma_ch !=3D -1)
               ^~~~~~~~~
--
                   ^    ~~~
   net/core/pktgen.c:1182:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1187:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pg_result, "OK: udp_dst_max=3D%u", pkt_dev->udp_=
dst_max);
                   ^~~~~~~
   net/core/pktgen.c:1187:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(pg_result, "OK: udp_dst_max=3D%u", pkt_dev->udp_=
dst_max);
                   ^~~~~~~
   net/core/pktgen.c:1204:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1204:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1207:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pg_result, "OK: clone_skb=3D%d", pkt_dev->clone_=
skb);
                   ^~~~~~~
   net/core/pktgen.c:1207:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(pg_result, "OK: clone_skb=3D%d", pkt_dev->clone_=
skb);
                   ^~~~~~~
   net/core/pktgen.c:1215:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1215:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1217:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pg_result, "OK: count=3D%llu",
                   ^~~~~~~
   net/core/pktgen.c:1217:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(pg_result, "OK: count=3D%llu",
                   ^~~~~~~
   net/core/pktgen.c:1226:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1226:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1231:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pg_result, "OK: src_mac_count=3D%d",
                   ^~~~~~~
   net/core/pktgen.c:1231:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(pg_result, "OK: src_mac_count=3D%d",
                   ^~~~~~~
   net/core/pktgen.c:1240:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1240:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1245:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pg_result, "OK: dst_mac_count=3D%d",
                   ^~~~~~~
   net/core/pktgen.c:1245:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(pg_result, "OK: dst_mac_count=3D%d",
                   ^~~~~~~
   net/core/pktgen.c:1254:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1254:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1261:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pg_result, "OK: burst=3D%u", pkt_dev->burst);
                   ^~~~~~~
   net/core/pktgen.c:1261:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(pg_result, "OK: burst=3D%u", pkt_dev->burst);
                   ^~~~~~~
   net/core/pktgen.c:1269:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1269:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1273:4: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(pg_result, "OK: node=3D%d", pkt_dev->nod=
e);
                           ^~~~~~~
   net/core/pktgen.c:1273:4: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                           sprintf(pg_result, "OK: node=3D%d", pkt_dev->nod=
e);
                           ^~~~~~~
   net/core/pktgen.c:1280:4: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(pg_result, "ERROR: node not possible");
                           ^~~~~~~
   net/core/pktgen.c:1280:4: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                           sprintf(pg_result, "ERROR: node not possible");
                           ^~~~~~~
   net/core/pktgen.c:1286:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(f, 0, 32);
                   ^~~~~~
   net/core/pktgen.c:1286:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(f, 0, 32);
                   ^~~~~~
   net/core/pktgen.c:1293:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1293:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
>> net/core/pktgen.c:1312:4: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                           sprintf(pg_result,
                           ^~~~~~~
   net/core/pktgen.c:1312:4: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                           sprintf(pg_result,
                           ^~~~~~~
   net/core/pktgen.c:1317:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(pg_result, "OK: xmit_mode=3D%s", f);
                   ^~~~~~~
   net/core/pktgen.c:1317:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(pg_result, "OK: xmit_mode=3D%s", f);
                   ^~~~~~~
   net/core/pktgen.c:1325:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(f, 0, 32);
                   ^~~~~~
   net/core/pktgen.c:1325:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(f, 0, 32);
                   ^~~~~~
   net/core/pktgen.c:1332:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1332:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1342:4: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                           sprintf(pg_result,
                           ^~~~~~~
   net/core/pktgen.c:1342:4: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                           sprintf(pg_result,
                           ^~~~~~~
   net/core/pktgen.c:1356:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(pg_result, "OK: flags=3D0x%x", pkt_dev->flags);
                   ^~~~~~~
   net/core/pktgen.c:1356:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(pg_result, "OK: flags=3D0x%x", pkt_dev->flags);
                   ^~~~~~~
   net/core/pktgen.c:1368:4: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(pkt_dev->dst_min, 0, sizeof(pkt_dev->dst_=
min));
                           ^~~~~~
   net/core/pktgen.c:1368:4: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                           memset(pkt_dev->dst_min, 0, sizeof(pkt_dev->dst_=
min));
                           ^~~~~~
   net/core/pktgen.c:1369:4: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(pkt_dev->dst_min, buf);
                           ^~~~~~
   net/core/pktgen.c:1369:4: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                           strcpy(pkt_dev->dst_min, buf);
                           ^~~~~~
   net/core/pktgen.c:1375:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1375:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1376:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(pg_result, "OK: dst_min=3D%s", pkt_dev->dst_min);
                   ^~~~~~~
   net/core/pktgen.c:1376:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(pg_result, "OK: dst_min=3D%s", pkt_dev->dst_min);
                   ^~~~~~~
   net/core/pktgen.c:1388:4: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(pkt_dev->dst_max, 0, sizeof(pkt_dev->dst_=
max));
                           ^~~~~~
   net/core/pktgen.c:1388:4: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                           memset(pkt_dev->dst_max, 0, sizeof(pkt_dev->dst_=
max));
                           ^~~~~~
   net/core/pktgen.c:1389:4: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(pkt_dev->dst_max, buf);
                           ^~~~~~
   net/core/pktgen.c:1389:4: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                           strcpy(pkt_dev->dst_max, buf);
                           ^~~~~~
   net/core/pktgen.c:1395:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1395:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1396:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(pg_result, "OK: dst_max=3D%s", pkt_dev->dst_max);
                   ^~~~~~~
   net/core/pktgen.c:1396:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(pg_result, "OK: dst_max=3D%s", pkt_dev->dst_max);
                   ^~~~~~~
   net/core/pktgen.c:1411:3: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, sizeof(buf), "%pI6c", &pkt_dev->in6_daddr);
                   ^~~~~~~~
   net/core/pktgen.c:1411:3: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, sizeof(buf), "%pI6c", &pkt_dev->in6_daddr);
                   ^~~~~~~~
   net/core/pktgen.c:1418:3: warning: Value stored to 'i' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1418:3: note: Value stored to 'i' is never read
                   i +=3D len;
                   ^    ~~~
   net/core/pktgen.c:1419:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(pg_result, "OK: dst6=3D%s", buf);
                   ^~~~~~~
   net/core/pktgen.c:1419:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(pg_result, "OK: dst6=3D%s", buf);

vim +114 drivers/hwmon/nsa320-hwmon.c

630300d5fcb6ee Adam Baker    2016-03-05  108  =

f0faf62c71a9a9 Guenter Roeck 2018-12-10  109  static ssize_t label_show(str=
uct device *dev, struct device_attribute *attr,
f0faf62c71a9a9 Guenter Roeck 2018-12-10  110  			  char *buf)
630300d5fcb6ee Adam Baker    2016-03-05  111  {
630300d5fcb6ee Adam Baker    2016-03-05  112  	int channel =3D to_sensor_de=
v_attr(attr)->index;
630300d5fcb6ee Adam Baker    2016-03-05  113  =

630300d5fcb6ee Adam Baker    2016-03-05 @114  	return sprintf(buf, "%s\n", =
nsa320_input_names[channel]);
630300d5fcb6ee Adam Baker    2016-03-05  115  }
630300d5fcb6ee Adam Baker    2016-03-05  116  =


:::::: The code at line 114 was first introduced by commit
:::::: 630300d5fcb6ee9c32c75d8b576c100fbb794159 hwmon: Create an NSA320 har=
dware monitoring driver

:::::: TO: Adam Baker <linux@baker-net.org.uk>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1739038256375436761==--

