Content-Type: multipart/mixed; boundary="===============7510905469576325278=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sailus-media-tree:master 23/44] drivers/media/i2c/ov5640.c:304:8: warning: Excessive padding in 'struct ov5640_mode_info' (8 padding bytes, where 0 is optimal).
Date: Wed, 02 Mar 2022 13:34:34 +0800
Message-ID: <202203021317.STTAUBDn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7510905469576325278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jacopo Mondi <jacopo@jmondi.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   5dcf73288209c0e275e19d323815bb934af58fcf
commit: 26e97310a3da15db6d75e985857b2c3bd92a2bc5 [23/44] media: ov5640: Spl=
it DVP and CSI-2 timings
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20220301 (https://download.01.org/0day-ci/arc=
hive/20220302/202203021317.STTAUBDn-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tre=
e.git
        git fetch --no-tags sailus-media-tree master
        git checkout 26e97310a3da15db6d75e985857b2c3bd92a2bc5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/net/ethernet/sun/niu.c:9094:3: note: Calling 'niu_try_msix'
                   niu_try_msix(np, ldg_num_map);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9030:14: note: Assuming the condition is =
false
           for (i =3D 0; i < (NIU_NUM_LDG / parent->num_ports); i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9030:2: note: Loop condition is false. Ex=
ecution continues on line 9033
           for (i =3D 0; i < (NIU_NUM_LDG / parent->num_ports); i++)
           ^
   drivers/net/ethernet/sun/niu.c:9035:8: note: Assuming field 'port' is no=
t equal to 0
                       (np->port =3D=3D 0 ? 3 : 1));
                        ^~~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9035:8: note: '?' condition is false
   drivers/net/ethernet/sun/niu.c:9036:9: note: Assuming the condition is f=
alse
           BUG_ON(num_irqs > (NIU_NUM_LDG / parent->num_ports));
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/sun/niu.c:9036:2: note: Taking false branch
           BUG_ON(num_irqs > (NIU_NUM_LDG / parent->num_ports));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/net/ethernet/sun/niu.c:9036:2: note: Loop condition is false.  E=
xiting loop
           BUG_ON(num_irqs > (NIU_NUM_LDG / parent->num_ports));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/net/ethernet/sun/niu.c:9038:14: note: Assuming 'i' is >=3D 'num_=
irqs'
           for (i =3D 0; i < num_irqs; i++) {
                       ^~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9038:2: note: Loop condition is false. Ex=
ecution continues on line 9043
           for (i =3D 0; i < num_irqs; i++) {
           ^
   drivers/net/ethernet/sun/niu.c:9044:6: note: Assuming 'num_irqs' is >=3D=
 0
           if (num_irqs < 0) {
               ^~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9044:2: note: Taking false branch
           if (num_irqs < 0) {
           ^
   drivers/net/ethernet/sun/niu.c:9050:14: note: Assuming 'i' is >=3D 'num_=
irqs'
           for (i =3D 0; i < num_irqs; i++)
                       ^~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9050:2: note: Loop condition is false. Ex=
ecution continues on line 9052
           for (i =3D 0; i < num_irqs; i++)
           ^
   drivers/net/ethernet/sun/niu.c:9053:1: note: Returning without writing t=
o '*ldg_num_map'
   }
   ^
   drivers/net/ethernet/sun/niu.c:9094:3: note: Returning from 'niu_try_msi=
x'
                   niu_try_msix(np, ldg_num_map);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9097:2: note: Loop condition is false. Ex=
ecution continues on line 9128
           for (i =3D 0; i < np->num_ldg; i++) {
           ^
   drivers/net/ethernet/sun/niu.c:9128:2: note: The value 0 is assigned to =
'ldg_rotor'
           ldg_rotor =3D 0;
           ^~~~~~~~~~~~~
   drivers/net/ethernet/sun/niu.c:9130:8: note: 3rd function call argument =
is an uninitialized value
           err =3D niu_ldg_assign_ldn(np, parent, ldg_num_map[ldg_rotor],
                 ^                              ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 20 warnings (12 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/media/i2c/ov5640.c:304:8: warning: Excessive padding in 'struct =
ov5640_mode_info' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   reg_data, =

   id, =

   dn_mode, =

   pixel_rate, =

   width, =

   height, =

   reg_data_size, =

   dvp_timings, =

   csi2_timings, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ov5640_mode_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov5640.c:304:8: note: Excessive padding in 'struct ov5=
640_mode_info' (8 padding bytes, where 0 is optimal). Optimal fields order:=
 reg_data, id, dn_mode, pixel_rate, width, height, reg_data_size, dvp_timin=
gs, csi2_timings, consider reordering the fields or adding explicit padding=
 members
   struct ov5640_mode_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/media/i2c/ov5647.c:813:8: warning: The left expression of the co=
mpound assignment is an uninitialized value. The computed value will also b=
e garbage [clang-analyzer-core.uninitialized.Assign]
           rdval &=3D ~0x01;
                 ^
   drivers/media/i2c/ov5647.c:1369:6: note: Assuming 'sensor' is non-null
           if (!sensor)
               ^~~~~~~
   drivers/media/i2c/ov5647.c:1369:2: note: Taking false branch
           if (!sensor)
           ^
   drivers/media/i2c/ov5647.c:1372:6: note: Left side of '&&' is true
           if (IS_ENABLED(CONFIG_OF) && np) {
               ^
   include/linux/kconfig.h:73:28: note: expanded from macro 'IS_ENABLED'
   #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
                              ^
   include/linux/kconfig.h:24:22: note: expanded from macro '__or'
   #define __or(x, y)                      ___or(x, y)
                                           ^
   include/linux/kconfig.h:25:23: note: expanded from macro '___or'
   #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
                                           ^
   include/linux/kconfig.h:26:65: note: expanded from macro '____or'
   #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1=
, y)
                                                                          ^
   drivers/media/i2c/ov5647.c:1372:31: note: Assuming 'np' is null
           if (IS_ENABLED(CONFIG_OF) && np) {
                                        ^~
   drivers/media/i2c/ov5647.c:1372:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_OF) && np) {
           ^
   drivers/media/i2c/ov5647.c:1381:2: note: Taking false branch
           if (IS_ERR(sensor->xclk)) {
           ^
   drivers/media/i2c/ov5647.c:1387:6: note: Assuming 'xclk_freq' is equal t=
o 25000000
           if (xclk_freq !=3D 25000000) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov5647.c:1387:2: note: Taking false branch
           if (xclk_freq !=3D 25000000) {
           ^
   drivers/media/i2c/ov5647.c:1394:2: note: Taking false branch
           if (IS_ERR(sensor->pwdn)) {
           ^
   drivers/media/i2c/ov5647.c:1399:2: note: Loop condition is false.  Exiti=
ng loop
           mutex_init(&sensor->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/media/i2c/ov5647.c:1404:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/ov5647.c:1404:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/ov5647.c:1415:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/i2c/ov5647.c:1415:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/media/i2c/ov5647.c:1419:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/ov5647.c:1419:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/ov5647.c:1423:6: note: 'ret' is < 0
           if (ret < 0)
               ^~~
   drivers/media/i2c/ov5647.c:1423:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/media/i2c/ov5647.c:1424:3: note: Control jumps to line 1440
                   goto power_off;
                   ^
   drivers/media/i2c/ov5647.c:1440:2: note: Calling 'ov5647_power_off'
           ov5647_power_off(dev);
           ^~~~~~~~~~~~~~~~~~~~~

vim +304 drivers/media/i2c/ov5640.c

19a81c1426c185c Steve Longerbeam 2017-06-07  303  =

26e97310a3da15d Jacopo Mondi     2022-02-24 @304  struct ov5640_mode_info {
26e97310a3da15d Jacopo Mondi     2022-02-24  305  	enum ov5640_mode_id id;
26e97310a3da15d Jacopo Mondi     2022-02-24  306  	enum ov5640_downsize_mod=
e dn_mode;
26e97310a3da15d Jacopo Mondi     2022-02-24  307  	enum ov5640_pixel_rate_i=
d pixel_rate;
26e97310a3da15d Jacopo Mondi     2022-02-24  308  =

26e97310a3da15d Jacopo Mondi     2022-02-24  309  	unsigned int width;
26e97310a3da15d Jacopo Mondi     2022-02-24  310  	unsigned int height;
26e97310a3da15d Jacopo Mondi     2022-02-24  311  =

26e97310a3da15d Jacopo Mondi     2022-02-24  312  	struct ov5640_timings dv=
p_timings;
26e97310a3da15d Jacopo Mondi     2022-02-24  313  	struct ov5640_timings cs=
i2_timings;
26e97310a3da15d Jacopo Mondi     2022-02-24  314  =

26e97310a3da15d Jacopo Mondi     2022-02-24  315  	const struct reg_value *=
reg_data;
26e97310a3da15d Jacopo Mondi     2022-02-24  316  	u32 reg_data_size;
26e97310a3da15d Jacopo Mondi     2022-02-24  317  };
26e97310a3da15d Jacopo Mondi     2022-02-24  318  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7510905469576325278==--

