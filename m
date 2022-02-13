Content-Type: multipart/mixed; boundary="===============6560993142160215456=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/nand/raw/pl35x-nand-controller.c:1126:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 13 Feb 2022 08:25:23 +0800
Message-ID: <202202130809.TZexhBcc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6560993142160215456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   83e396641110663d3c7bb25b9bc0c6a750359ecf
commit: 08d8c62164a322eb923034acacf25246b775593a mtd: rawnand: pl353: Add s=
upport for the ARM PL353 SMC NAND controller
date:   8 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220211 (https://download.01.org/0day-ci/archi=
ve/20220213/202202130809.TZexhBcc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D08d8c62164a322eb923034acacf25246b775593a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 08d8c62164a322eb923034acacf25246b775593a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:483:3: note: '?' condition =
is false
                   if (!PL35X_SMC_ECC_VALUE_IS_VALID(ecc_value))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:483:3: note: '?' condition =
is false
                   if (!PL35X_SMC_ECC_VALUE_IS_VALID(ecc_value))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:483:3: note: Taking false b=
ranch
                   if (!PL35X_SMC_ECC_VALUE_IS_VALID(ecc_value))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:3: note: Assuming the c=
ondition is true
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:3: note: '?' condition =
is false
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:3: note: '?' condition =
is false
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:3: note: Taking false b=
ranch
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:491:3: note: Calling 'pl35x=
_nand_ecc_reg_to_array'
                   pl35x_nand_ecc_reg_to_array(chip, ecc_value, calc_ecc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is < field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is true.  Entering loop body
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is < field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is true.  Entering loop body
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is >=3D field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is false. Execution continues on line 446
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:491:3: note: Returning from=
 'pl35x_nand_ecc_reg_to_array'
                   pl35x_nand_ecc_reg_to_array(chip, ecc_value, calc_ecc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:492:11: note: Calling 'pl35=
x_nand_correct_data'
                   stats =3D pl35x_nand_correct_data(nfc, data, read_ecc, c=
alc_ecc);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:411:54: note: The left oper=
and of '<<' is a garbage value
           calc_ecc_upper =3D ((calc_ecc[1] >> 4) | (calc_ecc[2] << 4)) &
                                                   ~~~~~~~~~~~ ^
>> drivers/mtd/nand/raw/pl35x-nand-controller.c:1126:2: warning: Undefined =
or garbage value returned to caller [clang-analyzer-core.uninitialized.Unde=
fReturn]
           return ret;
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Left side of=
 '&&' is false
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: '?' conditio=
n is true
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Left side of=
 '&&' is false
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Taking false=
 branch
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Loop conditi=
on is false.  Exiting loop
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1137:6: note: Assuming 'nfc=
' is non-null
           if (!nfc)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1137:2: note: '?' condition=
 is false
           if (!nfc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^

vim +1126 drivers/mtd/nand/raw/pl35x-nand-controller.c

08d8c62164a322 Miquel Raynal 2021-06-10  1104  =

08d8c62164a322 Miquel Raynal 2021-06-10  1105  static int pl35x_nand_chips_=
init(struct pl35x_nandc *nfc)
08d8c62164a322 Miquel Raynal 2021-06-10  1106  {
08d8c62164a322 Miquel Raynal 2021-06-10  1107  	struct device_node *np =3D =
nfc->dev->of_node, *nand_np;
08d8c62164a322 Miquel Raynal 2021-06-10  1108  	int nchips =3D of_get_child=
_count(np);
08d8c62164a322 Miquel Raynal 2021-06-10  1109  	int ret;
08d8c62164a322 Miquel Raynal 2021-06-10  1110  =

08d8c62164a322 Miquel Raynal 2021-06-10  1111  	if (!nchips || nchips > PL3=
5X_NAND_MAX_CS) {
08d8c62164a322 Miquel Raynal 2021-06-10  1112  		dev_err(nfc->dev, "Incorre=
ct number of NAND chips (%d)\n",
08d8c62164a322 Miquel Raynal 2021-06-10  1113  			nchips);
08d8c62164a322 Miquel Raynal 2021-06-10  1114  		return -EINVAL;
08d8c62164a322 Miquel Raynal 2021-06-10  1115  	}
08d8c62164a322 Miquel Raynal 2021-06-10  1116  =

08d8c62164a322 Miquel Raynal 2021-06-10  1117  	for_each_child_of_node(np, =
nand_np) {
08d8c62164a322 Miquel Raynal 2021-06-10  1118  		ret =3D pl35x_nand_chip_in=
it(nfc, nand_np);
08d8c62164a322 Miquel Raynal 2021-06-10  1119  		if (ret) {
08d8c62164a322 Miquel Raynal 2021-06-10  1120  			of_node_put(nand_np);
08d8c62164a322 Miquel Raynal 2021-06-10  1121  			pl35x_nand_chips_cleanup(=
nfc);
08d8c62164a322 Miquel Raynal 2021-06-10  1122  			break;
08d8c62164a322 Miquel Raynal 2021-06-10  1123  		}
08d8c62164a322 Miquel Raynal 2021-06-10  1124  	}
08d8c62164a322 Miquel Raynal 2021-06-10  1125  =

08d8c62164a322 Miquel Raynal 2021-06-10 @1126  	return ret;
08d8c62164a322 Miquel Raynal 2021-06-10  1127  }
08d8c62164a322 Miquel Raynal 2021-06-10  1128  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6560993142160215456==--

