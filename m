Content-Type: multipart/mixed; boundary="===============0977037037937797897=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-imx.c:592:23: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 26 Nov 2021 09:44:52 +0800
Message-ID: <202111260918.a37TRtqG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0977037037937797897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Clark Wang <xiaoning.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: 4df2f5e1372e9eec8f9e1b4a3025b9be23487d36 spi: imx: add a check for =
speed_hz before calculating the clock
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211126/202111260918.a37TRtqG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4df2f5e1372e9eec8f9e1b4a3025b9be23487d36
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4df2f5e1372e9eec8f9e1b4a3025b9be23487d36
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/pc87360.c:1463:3: note: Loop condition is true.  Entering =
loop body
                   for (i =3D 11; i < data->innr; i++) {
                   ^
   drivers/hwmon/pc87360.c:1464:4: note: Taking false branch
                           if (init >=3D init_in[i]) {
                           ^
   drivers/hwmon/pc87360.c:1463:16: note: Assuming 'i' is < field 'innr'
                   for (i =3D 11; i < data->innr; i++) {
                                ^~~~~~~~~~~~~~
   drivers/hwmon/pc87360.c:1463:3: note: Loop condition is true.  Entering =
loop body
                   for (i =3D 11; i < data->innr; i++) {
                   ^
   drivers/hwmon/pc87360.c:1464:4: note: Taking false branch
                           if (init >=3D init_in[i]) {
                           ^
   drivers/hwmon/pc87360.c:1463:32: note: The value 14 is assigned to 'i'
                   for (i =3D 11; i < data->innr; i++) {
                                                ^~~
   drivers/hwmon/pc87360.c:1463:16: note: Assuming 'i' is < field 'innr'
                   for (i =3D 11; i < data->innr; i++) {
                                ^~~~~~~~~~~~~~
   drivers/hwmon/pc87360.c:1463:3: note: Loop condition is true.  Entering =
loop body
                   for (i =3D 11; i < data->innr; i++) {
                   ^
   drivers/hwmon/pc87360.c:1464:13: note: The right operand of '>=3D' is a =
garbage value due to array index out of bounds
                           if (init >=3D init_in[i]) {
                                    ^  ~~~~~~~~~~
   17 warnings generated.
   drivers/spi/spi-imx.c:453:8: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is <=3D 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking false branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:441:2: note: Taking false branch
           if (fin > fspi << post)
           ^
   drivers/spi/spi-imx.c:446:9: note: '__UNIQUE_ID___x256' is > '__UNIQUE_I=
D___y257'
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/spi/spi-imx.c:446:9: note: '?' condition is true
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/spi/spi-imx.c:447:2: note: Taking false branch
           if (unlikely(post > 0xf)) {
           ^
   drivers/spi/spi-imx.c:453:8: note: Division by zero
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
>> drivers/spi/spi-imx.c:592:23: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   drivers/spi/spi-imx.c:577:6: note: 'clk' declared without an initial val=
ue
           u32 clk, delay;
               ^~~
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is > 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking true branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:438:3: note: Returning without writing to '*fres'
                   return 0;
                   ^
   drivers/spi/spi-imx.c:591:10: note: Returning from 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:592:23: note: Assigned value is garbage or undefin=
ed
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
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
   18 warnings generated.
   drivers/hwtracing/intel_th/core.c:373:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(thdev->name, name);
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:373:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(thdev->name, name);
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:1006:35: warning: Dereference of null =
pointer [clang-analyzer-core.NullDereference]
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                            ^
   drivers/hwtracing/intel_th/intel_th.h:189:2: note: expanded from macro '=
to_intel_th_driver'
           container_of((_d), struct intel_th_driver, driver)
           ^
   include/linux/kernel.h:708:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/hwtracing/intel_th/core.c:291:34: note: Left side of '&&' is fal=
se
           struct intel_th_device *thdev =3D to_intel_th_device(dev);
                                           ^
   drivers/hwtracing/intel_th/intel_th.h:93:2: note: expanded from macro 't=
o_intel_th_device'
           container_of((_d), struct intel_th_device, dev)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwtracing/intel_th/core.c:291:34: note: Taking false branch
           struct intel_th_device *thdev =3D to_intel_th_device(dev);
                                           ^
   drivers/hwtracing/intel_th/intel_th.h:93:2: note: expanded from macro 't=
o_intel_th_device'
           container_of((_d), struct intel_th_device, dev)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwtracing/intel_th/core.c:291:34: note: Loop condition is false.=
  Exiting loop
           struct intel_th_device *thdev =3D to_intel_th_device(dev);
                                           ^
   drivers/hwtracing/intel_th/intel_th.h:93:2: note: expanded from macro 't=
o_intel_th_device'
           container_of((_d), struct intel_th_device, dev)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
   force_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:400:8: note: Excessive padding i=
n 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). Optim=
al fields order: name, supply, ocp, base, force_type, consider reordering t=
he fields or adding explicit padding members
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1154:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1154:2: note: Value stored to 'r=
et' is never read
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/spi/spi-imx.c:453:8: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is <=3D 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking false branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:441:2: note: Taking false branch
           if (fin > fspi << post)
           ^
   drivers/spi/spi-imx.c:446:9: note: '__UNIQUE_ID___x256' is > '__UNIQUE_I=
D___y257'
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/spi/spi-imx.c:446:9: note: '?' condition is true
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/spi/spi-imx.c:447:2: note: Taking false branch
           if (unlikely(post > 0xf)) {
           ^
   drivers/spi/spi-imx.c:453:8: note: Division by zero
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
>> drivers/spi/spi-imx.c:592:23: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   drivers/spi/spi-imx.c:577:6: note: 'clk' declared without an initial val=
ue
           u32 clk, delay;
               ^~~
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is > 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking true branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:438:3: note: Returning without writing to '*fres'
                   return 0;
                   ^
   drivers/spi/spi-imx.c:591:10: note: Returning from 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:592:23: note: Assigned value is garbage or undefin=
ed
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (17 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 with check filters).
   16 warnings generated.
   include/asm-generic/bitops/non-atomic.h:106:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/usb/gadget/function/u_serial.c:359:26: note: Left side of '&&' i=
s false
           struct gs_port          *port =3D container_of(w, struct gs_port=
, push);
                                           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/function/u_serial.c:359:26: note: Taking false branch
           struct gs_port          *port =3D container_of(w, struct gs_port=
, push);
                                           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/usb/gadget/function/u_serial.c:359:26: note: Loop condition is f=
alse.  Exiting loop
           struct gs_port          *port =3D container_of(w, struct gs_port=
, push);
                                           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/gadget/function/u_serial.c:366:2: note: Calling 'spin_lock_i=
rq'
           spin_lock_irq(&port->port_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:379:2: note: Value assigned to field 'tty'
           raw_spin_lock_irq(&lock->rlock);
           ^
   include/linux/spinlock.h:282:34: note: expanded from macro 'raw_spin_loc=
k_irq'
   #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_serial.c:366:2: note: Returning from 'spin=
_lock_irq'
           spin_lock_irq(&port->port_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +592 drivers/spi/spi-imx.c

f677f17cced0ca drivers/spi/spi-imx.c Anton Bondarenko 2015-12-08  572  =

1d374703fb988d drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  573 =
 static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
4df2f5e1372e9e drivers/spi/spi-imx.c Clark Wang       2021-04-08  574  				=
       struct spi_device *spi)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  575 =
 {
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  576 =
 	u32 ctrl =3D readl(spi_imx->base + MX51_ECSPI_CTRL);
4df2f5e1372e9e drivers/spi/spi-imx.c Clark Wang       2021-04-08  577  	u32=
 clk, delay;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  578  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  579 =
 	/* Clear BL field and set the right value */
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  580 =
 	ctrl &=3D ~MX51_ECSPI_CTRL_BL_MASK;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  581 =
 	if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  582 =
 		ctrl |=3D (spi_imx->slave_burst * 8 - 1)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  583 =
 			<< MX51_ECSPI_CTRL_BL_OFFSET;
9f6aa42bbbb23d drivers/spi/spi-imx.c Fabio Estevam    2015-12-03  584  	else
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  585 =
 		ctrl |=3D (spi_imx->bits_per_word - 1)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  586 =
 			<< MX51_ECSPI_CTRL_BL_OFFSET;
9f6aa42bbbb23d drivers/spi/spi-imx.c Fabio Estevam    2015-12-03  587  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  588 =
 	/* set clock speed */
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  589 =
 	ctrl &=3D ~(0xf << MX51_ECSPI_CTRL_POSTDIV_OFFSET |
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  590 =
 		  0xf << MX51_ECSPI_CTRL_PREDIV_OFFSET);
4df2f5e1372e9e drivers/spi/spi-imx.c Clark Wang       2021-04-08  591  	ctr=
l |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30 @592 =
 	spi_imx->spi_bus_clk =3D clk;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  593  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  594 =
 	if (spi_imx->usedma)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  595 =
 		ctrl |=3D MX51_ECSPI_CTRL_SMC;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  596  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  597 =
 	writel(ctrl, spi_imx->base + MX51_ECSPI_CTRL);
0b599603d8534b drivers/spi/spi_imx.c Uwe Kleine-K=C3=B6nig 2010-09-09  598  =

6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  599  	/*
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  600  	 * =
Wait until the changes in the configuration register CONFIGREG
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  601  	 * =
propagate into the hardware. It takes exactly one tick of the
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  602  	 * =
SCLK clock, but we will wait two SCLK clock just to be sure. The
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  603  	 * =
effect of the delay it takes for the hardware to apply changes
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  604  	 * =
is noticable if the SCLK clock run very slow. In such a case, if
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  605  	 * =
the polarity of SCLK should be inverted, the GPIO ChipSelect might
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  606  	 * =
be asserted before the SCLK polarity changes, which would disrupt
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  607  	 * =
the SPI communication as the device on the other end would consider
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  608  	 * =
the change of SCLK polarity as a clock tick already.
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  609  	 */
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  610  	del=
ay =3D (2 * 1000000) / clk;
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  611  	if =
(likely(delay < 10))	/* SCLK is faster than 100 kHz */
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  612  		ud=
elay(delay);
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  613  	els=
e			/* SCLK is _very_ slow */
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  614  		us=
leep_range(delay, delay + 10);
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  615  =

987a2dfe3f0485 drivers/spi/spi-imx.c Robin Gong       2018-10-10  616  	ret=
urn 0;
987a2dfe3f0485 drivers/spi/spi-imx.c Robin Gong       2018-10-10  617  }
987a2dfe3f0485 drivers/spi/spi-imx.c Robin Gong       2018-10-10  618  =


:::::: The code@line 592 was first introduced by commit
:::::: 00b80ac9355397455adec24c9ee76f1b0225cd27 spi: imx: mx51-ecspi: Move =
some initialisation to prepare_message hook.

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0977037037937797897==--

