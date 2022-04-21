Content-Type: multipart/mixed; boundary="===============0523519043274063364=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/misc/yealink.c:691:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Thu, 21 Apr 2022 16:41:02 +0800
Message-ID: <202204211603.EaMhwtaX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0523519043274063364==
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
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   6 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220420 (https://download.01.org/0day-ci/arc=
hive/20220421/202204211603.EaMhwtaX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   Suppressed 48 warnings (43 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
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
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/input/misc/tps65218-pwrbutton.c:113:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pwr->phys, sizeof(pwr->phys), "%s/input0",
           ^~~~~~~~
   drivers/input/misc/tps65218-pwrbutton.c:113:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pwr->phys, sizeof(pwr->phys), "%s/input0",
           ^~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   drivers/input/misc/uinput.c:956:4: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&ff_up.old, 0, sizeof(struct ff_effect));
                           ^~~~~~
   drivers/input/misc/uinput.c:956:4: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                           memset(&ff_up.old, 0, sizeof(struct ff_effect));
                           ^~~~~~
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/input/misc/yealink.c:288:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:288:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:305:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:305:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:321:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:321:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
>> drivers/input/misc/yealink.c:691:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:691:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:979:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/yealink.c:979:2: note: Value stored to 'ret' is never=
 read
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/input/keyboard/tca8418_keypad.c:241:15: warning: The result of t=
he left shift is undefined because the left operand is negative [clang-anal=
yzer-core.UndefinedBinaryOperatorResult]
           reg +=3D (~(~0 << cols)) << 8;
                        ^
   drivers/input/keyboard/tca8418_keypad.c:273:2: note: Taking false branch
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYT=
E)) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:280:6: note: Assuming 'error' is=
 0
           if (error)
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:280:2: note: Taking false branch
           if (error)
           ^
   drivers/input/keyboard/tca8418_keypad.c:283:6: note: Assuming 'rows' is =
not equal to 0
           if (!rows || rows > TCA8418_MAX_ROWS) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:283:6: note: Left side of '||' i=
s false
   drivers/input/keyboard/tca8418_keypad.c:283:15: note: Assuming 'rows' is=
 <=3D TCA8418_MAX_ROWS
           if (!rows || rows > TCA8418_MAX_ROWS) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:283:2: note: Taking false branch
           if (!rows || rows > TCA8418_MAX_ROWS) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:288:6: note: Assuming 'cols' is =
not equal to 0
           if (!cols || cols > TCA8418_MAX_COLS) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:288:6: note: Left side of '||' i=
s false
   drivers/input/keyboard/tca8418_keypad.c:288:15: note: Assuming 'cols' is=
 <=3D TCA8418_MAX_COLS
           if (!cols || cols > TCA8418_MAX_COLS) {
                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:288:2: note: Taking false branch
           if (!cols || cols > TCA8418_MAX_COLS) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:297:6: note: Assuming 'keypad_da=
ta' is non-null
           if (!keypad_data)
               ^~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:297:2: note: Taking false branch
           if (!keypad_data)
           ^
   drivers/input/keyboard/tca8418_keypad.c:305:6: note: 'error' is 0
           if (error)
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:305:2: note: Taking false branch
           if (error)
           ^
   drivers/input/keyboard/tca8418_keypad.c:310:6: note: Assuming 'input' is=
 non-null
           if (!input)
               ^~~~~~
   drivers/input/keyboard/tca8418_keypad.c:310:2: note: Taking false branch
           if (!input)
           ^
   drivers/input/keyboard/tca8418_keypad.c:322:6: note: Assuming 'error' is=
 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:322:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:327:6: note: Assuming the condit=
ion is false
           if (device_property_read_bool(dev, "keypad,autorepeat"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:327:2: note: Taking false branch
           if (device_property_read_bool(dev, "keypad,autorepeat"))
           ^
   drivers/input/keyboard/tca8418_keypad.c:336:6: note: Assuming 'error' is=
 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:336:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:343:10: note: Calling 'tca8418_c=
onfigure'
           error =3D tca8418_configure(keypad_data, rows, cols);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:241:15: note: The result of the =
left shift is undefined because the left operand is negative
           reg +=3D (~(~0 << cols)) << 8;
                     ~~ ^
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/input/touchscreen/cyttsp_i2c_common.c:73:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&xfer_buf[1], values, length);
           ^~~~~~

vim +691 drivers/input/misc/yealink.c

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  552  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  553  /=
* Interface to the 7-segments translation table aka. char set.
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  554   =
*/
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  555  s=
tatic ssize_t show_map(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  556  	=
			char *buf)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  557  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16 @558  	=
memcpy(buf, &map_seg7, sizeof(map_seg7));
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  559  	=
return sizeof(map_seg7);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  560  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  561  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  562  s=
tatic ssize_t store_map(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  563  	=
			const char *buf, size_t cnt)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  564  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  565  	=
if (cnt !=3D sizeof(map_seg7))
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  566  	=
	return -EINVAL;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  567  	=
memcpy(&map_seg7, buf, sizeof(map_seg7));
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  568  	=
return sizeof(map_seg7);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  569  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  570  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  571  /=
* Interface to the LCD.
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  572   =
*/
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  573  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  574  /=
* Reading /sys/../lineX will return the format string with its settings:
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  575   *
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  576   =
* Example:
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  577   =
* cat ./line3
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  578   =
* 888888888888
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  579   =
* Linux Rocks!
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  580   =
*/
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  581  s=
tatic ssize_t show_line(struct device *dev, char *buf, int a, int b)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  582  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  583  	=
struct yealink_dev *yld;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  584  	=
int i;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  585  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  586  	=
down_read(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  587  	=
yld =3D dev_get_drvdata(dev);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  588  	=
if (yld =3D=3D NULL) {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  589  	=
	up_read(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  590  	=
	return -ENODEV;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  591  	}
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  592  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  593  	=
for (i =3D a; i < b; i++)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  594  	=
	*buf++ =3D lcdMap[i].type;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  595  	=
*buf++ =3D '\n';
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  596  	=
for (i =3D a; i < b; i++)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  597  	=
	*buf++ =3D yld->lcdMap[i];
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  598  	=
*buf++ =3D '\n';
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  599  	=
*buf =3D 0;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  600  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  601  	=
up_read(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  602  	=
return 3 + ((b - a) << 1);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  603  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  604  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  605  s=
tatic ssize_t show_line1(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  606  	=
		char *buf)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  607  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  608  	=
return show_line(dev, buf, LCD_LINE1_OFFSET, LCD_LINE2_OFFSET);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  609  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  610  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  611  s=
tatic ssize_t show_line2(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  612  	=
		char *buf)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  613  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  614  	=
return show_line(dev, buf, LCD_LINE2_OFFSET, LCD_LINE3_OFFSET);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  615  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  616  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  617  s=
tatic ssize_t show_line3(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  618  	=
		char *buf)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  619  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  620  	=
return show_line(dev, buf, LCD_LINE3_OFFSET, LCD_LINE4_OFFSET);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  621  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  622  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  623  /=
* Writing to /sys/../lineX will set the coresponding LCD line.
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  624   =
* - Excess characters are ignored.
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  625   =
* - If less characters are written than allowed, the remaining digits are
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  626   =
*   unchanged.
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  627   =
* - The '\n' or '\t' char is a placeholder, it does not overwrite the
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  628   =
*   original content.
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  629   =
*/
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  630  s=
tatic ssize_t store_line(struct device *dev, const char *buf, size_t count,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  631  	=
	int el, size_t len)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  632  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  633  	=
struct yealink_dev *yld;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  634  	=
int i;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  635  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  636  	=
down_write(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  637  	=
yld =3D dev_get_drvdata(dev);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  638  	=
if (yld =3D=3D NULL) {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  639  	=
	up_write(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  640  	=
	return -ENODEV;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  641  	}
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  642  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  643  	=
if (len > count)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  644  	=
	len =3D count;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  645  	=
for (i =3D 0; i < len; i++)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  646  	=
	setChar(yld, el++, buf[i]);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  647  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  648  	=
up_write(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  649  	=
return count;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  650  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  651  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  652  s=
tatic ssize_t store_line1(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  653  	=
			const char *buf, size_t count)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  654  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  655  	=
return store_line(dev, buf, count, LCD_LINE1_OFFSET, LCD_LINE1_SIZE);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  656  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  657  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  658  s=
tatic ssize_t store_line2(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  659  	=
			const char *buf, size_t count)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  660  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  661  	=
return store_line(dev, buf, count, LCD_LINE2_OFFSET, LCD_LINE2_SIZE);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  662  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  663  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  664  s=
tatic ssize_t store_line3(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  665  	=
			const char *buf, size_t count)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  666  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  667  	=
return store_line(dev, buf, count, LCD_LINE3_OFFSET, LCD_LINE3_SIZE);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  668  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  669  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  670  /=
* Interface to visible and audible "icons", these include:
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  671   =
* pictures on the LCD, the LED, and the dialtone signal.
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  672   =
*/
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  673  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  674  /=
* Get a list of "switchable elements" with their current state. */
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  675  s=
tatic ssize_t get_icons(struct device *dev, struct device_attribute *attr,
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  676  	=
		char *buf)
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  677  {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  678  	=
struct yealink_dev *yld;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  679  	=
int i, ret =3D 1;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  680  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  681  	=
down_read(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  682  	=
yld =3D dev_get_drvdata(dev);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  683  	=
if (yld =3D=3D NULL) {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  684  	=
	up_read(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  685  	=
	return -ENODEV;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  686  	}
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  687  =

aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  688  	=
for (i =3D 0; i < ARRAY_SIZE(lcdMap); i++) {
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  689  	=
	if (lcdMap[i].type !=3D '.')
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  690  	=
		continue;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16 @691  	=
	ret +=3D sprintf(&buf[ret], "%s %s\n",
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  692  	=
			yld->lcdMap[i] =3D=3D ' ' ? "  " : "on",
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  693  	=
			lcdMap[i].u.p.name);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  694  	}
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  695  	=
up_read(&sysfs_rwsema);
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  696  	=
return ret;
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  697  }
aca951a22a1d93 drivers/usb/input/yealink.c Henk Vergonet 2005-08-16  698  =


:::::: The code at line 691 was first introduced by commit
:::::: aca951a22a1d93ebe31b54052b3eb9a8196df2fc [PATCH] input-driver-yealin=
k-P1K-usb-phone

:::::: TO: Henk <Henk.Vergonet@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0523519043274063364==--

