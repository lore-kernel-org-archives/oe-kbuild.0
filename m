Content-Type: multipart/mixed; boundary="===============8203550120621630649=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chenxing:msc313_mainlining 36/79] drivers/pinctrl/mstar/pinctrl-msc313.c:1532:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 18 Jan 2022 19:14:07 +0800
Message-ID: <202201181858.HT2v5sl9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8203550120621630649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Palmer <daniel@0x0f.com>

tree:   git://github.com/linux-chenxing/linux.git msc313_mainlining
head:   944e0daa939a7374dc40b73ceedb78a788fb25d4
commit: cac53fceca07b4f7b952d997c72df51eeb21c0bc [36/79] pinctrl: mstar: ms=
c313 pinctrl driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220116 (https://download.01.org/0day-ci/arc=
hive/20220118/202201181858.HT2v5sl9-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc4=
0b6d8d9a5869b4fca525d5f237b0ee2803)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/linux-chenxing/linux/commit/cac53fceca07b4f7b9=
52d997c72df51eeb21c0bc
        git remote add chenxing git://github.com/linux-chenxing/linux.git
        git fetch --no-tags chenxing msc313_mainlining
        git checkout cac53fceca07b4f7b952d997c72df51eeb21c0bc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1570:6: note: Returning from 'IS_ERR'
           if (IS_ERR(shp)) {
               ^~~~~~~~~~~
   ipc/shm.c:1570:2: note: Taking true branch
           if (IS_ERR(shp)) {
           ^
   ipc/shm.c:1572:3: note: Control jumps to line 1675
                   goto out_unlock;
                   ^
   ipc/shm.c:1677:2: note: Returning without writing to '*raddr'
           return err;
           ^
   ipc/shm.c:1677:2: note: Returning value (loaded from 'err'), which parti=
cipates in a condition later
           return err;
           ^~~~~~~~~~
   ipc/shm.c:1685:8: note: Returning from 'do_shmat'
           err =3D do_shmat(shmid, shmaddr, shmflg, &ret, SHMLBA);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1686:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   ipc/shm.c:1686:2: note: Taking false branch
           if (err)
           ^
   ipc/shm.c:1688:2: note: Loop condition is false.  Exiting loop
           force_successful_syscall_return();
           ^
   include/linux/ptrace.h:254:43: note: expanded from macro 'force_successf=
ul_syscall_return'
   #define force_successful_syscall_return() do { } while (0)
                                             ^
   ipc/shm.c:1689:2: note: Undefined or garbage value returned to caller
           return (long)ret;
           ^      ~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/fs-writeback.c:148:3: warning: Argument to kfree() is the address of =
the local variable 'work', which is not memory allocated by malloc() [clang=
-analyzer-unix.Malloc]
                   kfree(work);
                   ^
   fs/fs-writeback.c:2702:6: note: Assuming the condition is false
           if (bdi =3D=3D &noop_backing_dev_info)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:2702:2: note: Taking false branch
           if (bdi =3D=3D &noop_backing_dev_info)
           ^
   fs/fs-writeback.c:2708:2: note: Calling 'bdi_split_work_to_wbs'
           bdi_split_work_to_wbs(bdi, &work, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1204:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:171:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   fs/fs-writeback.c:1206:7: note: 'skip_if_busy' is false
           if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
                ^~~~~~~~~~~~
   fs/fs-writeback.c:1206:20: note: Left side of '||' is true
           if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
                             ^
   fs/fs-writeback.c:1208:3: note: Calling 'wb_queue_work'
                   wb_queue_work(&bdi->wb, base_work);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:163:6: note: Assuming field 'done' is null
           if (work->done)
               ^~~~~~~~~~
   fs/fs-writeback.c:163:2: note: Taking false branch
           if (work->done)
           ^
   fs/fs-writeback.c:168:6: note: Assuming the condition is false
           if (test_bit(WB_registered, &wb->state)) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   fs/fs-writeback.c:168:2: note: Taking false branch
           if (test_bit(WB_registered, &wb->state)) {
           ^
   fs/fs-writeback.c:172:3: note: Calling 'finish_writeback_work'
                   finish_writeback_work(wb, work);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:147:6: note: Assuming field 'auto_free' is not equal t=
o 0
           if (work->auto_free)
               ^~~~~~~~~~~~~~~
   fs/fs-writeback.c:147:2: note: Taking true branch
           if (work->auto_free)
           ^
   fs/fs-writeback.c:148:3: note: Argument to kfree() is the address of the=
 local variable 'work', which is not memory allocated by malloc()
                   kfree(work);
                   ^     ~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/pinctrl/mstar/pinctrl-mstar.c:88:2: warning: Undefined or garbag=
e value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:80:9: note: 'ret' declared without=
 an initial value
           int i, ret;
                  ^~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:82:14: note: Assuming 'i' is >=3D =
field 'ngroups'
           for (i =3D 0; i < pinctrl->info->ngroups; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:82:2: note: Loop condition is fals=
e. Execution continues on line 88
           for (i =3D 0; i < pinctrl->info->ngroups; i++) {
           ^
   drivers/pinctrl/mstar/pinctrl-mstar.c:88:2: note: Undefined or garbage v=
alue returned to caller
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:112:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:93:9: note: 'ret' declared without=
 an initial value
           int i, ret;
                  ^~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:95:14: note: Assuming 'i' is >=3D =
field 'nfunctions'
           for (i =3D 0; i < pinctrl->info->nfunctions; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:95:2: note: Loop condition is fals=
e. Execution continues on line 112
           for (i =3D 0; i < pinctrl->info->nfunctions; i++) {
           ^
   drivers/pinctrl/mstar/pinctrl-mstar.c:112:2: note: Undefined or garbage =
value returned to caller
           return ret;
           ^      ~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
>> drivers/pinctrl/mstar/pinctrl-msc313.c:1532:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D mstar_pinctrl_parse_functions(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.c:1532:2: note: Value stored to 're=
t' is never read
           ret =3D mstar_pinctrl_parse_functions(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.c:1533:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D mstar_pinctrl_parse_groups(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.c:1533:2: note: Value stored to 're=
t' is never read
           ret =3D mstar_pinctrl_parse_groups(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 46 warnings (5 in non-user code, 41 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/spi/spi-img-spfi.c:451:23: warning: The result of the left shift=
 is undefined because the right operand is negative [clang-analyzer-core.Un=
definedBinaryOperatorResult]
           div =3D clamp(512 / (1 << get_count_order(div)), 1, 128);
                                ^
   drivers/spi/spi-img-spfi.c:486:6: note: Assuming field 'len' is <=3D SPF=
I_TRANSACTION_TSIZE_MASK
           if (xfer->len > SPFI_TRANSACTION_TSIZE_MASK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-img-spfi.c:486:2: note: Taking false branch
           if (xfer->len > SPFI_TRANSACTION_TSIZE_MASK) {
           ^
   drivers/spi/spi-img-spfi.c:493:2: note: Calling 'img_spfi_config'
           img_spfi_config(master, spi, xfer);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-img-spfi.c:451:26: note: Calling 'get_count_order'
           div =3D clamp(512 / (1 << get_count_order(div)), 1, 128);
                                   ^
   include/linux/minmax.h:89:49: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                                                   ^~~
   include/linux/minmax.h:52:33: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   include/linux/bitops.h:195:6: note: Assuming 'count' is equal to 0
           if (count =3D=3D 0)
               ^~~~~~~~~~
   include/linux/bitops.h:195:2: note: Taking true branch
           if (count =3D=3D 0)
           ^
   include/linux/bitops.h:196:3: note: Returning the value -1
                   return -1;
                   ^~~~~~~~~
   drivers/spi/spi-img-spfi.c:451:26: note: Returning from 'get_count_order'
           div =3D clamp(512 / (1 << get_count_order(div)), 1, 128);
                                   ^
   include/linux/minmax.h:89:49: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                                                   ^~~
   include/linux/minmax.h:52:33: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/spi/spi-img-spfi.c:451:23: note: The result of the left shift is=
 undefined because the right operand is negative
           div =3D clamp(512 / (1 << get_count_order(div)), 1, 128);
                                ^
   include/linux/minmax.h:89:49: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                                                   ^~~

vim +/ret +1532 drivers/pinctrl/mstar/pinctrl-msc313.c

cac53fceca07b4 Daniel Palmer 2020-12-07  1486  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1487  static int msc313_pinctrl_pr=
obe(struct platform_device *pdev)
cac53fceca07b4 Daniel Palmer 2020-12-07  1488  {
cac53fceca07b4 Daniel Palmer 2020-12-07  1489  	int ret;
cac53fceca07b4 Daniel Palmer 2020-12-07  1490  	struct msc313_pinctrl *pinc=
trl;
cac53fceca07b4 Daniel Palmer 2020-12-07  1491  	const struct msc313_pinctrl=
_info *match_data;
cac53fceca07b4 Daniel Palmer 2020-12-07  1492  	void __iomem *base;
cac53fceca07b4 Daniel Palmer 2020-12-07  1493  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1494  	match_data =3D of_device_ge=
t_match_data(&pdev->dev);
cac53fceca07b4 Daniel Palmer 2020-12-07  1495  	if (!match_data)
cac53fceca07b4 Daniel Palmer 2020-12-07  1496  		return -EINVAL;
cac53fceca07b4 Daniel Palmer 2020-12-07  1497  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1498  	pinctrl =3D devm_kzalloc(&p=
dev->dev, sizeof(*pinctrl), GFP_KERNEL);
cac53fceca07b4 Daniel Palmer 2020-12-07  1499  	if (!pinctrl)
cac53fceca07b4 Daniel Palmer 2020-12-07  1500  		return -ENOMEM;
cac53fceca07b4 Daniel Palmer 2020-12-07  1501  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1502  	platform_set_drvdata(pdev, =
pinctrl);
cac53fceca07b4 Daniel Palmer 2020-12-07  1503  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1504  	pinctrl->dev =3D &pdev->dev;
cac53fceca07b4 Daniel Palmer 2020-12-07  1505  	pinctrl->info =3D match_dat=
a;
cac53fceca07b4 Daniel Palmer 2020-12-07  1506  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1507  	base =3D devm_platform_iore=
map_resource(pdev, 0);
cac53fceca07b4 Daniel Palmer 2020-12-07  1508  	if (IS_ERR(base))
cac53fceca07b4 Daniel Palmer 2020-12-07  1509  		return PTR_ERR(base);
cac53fceca07b4 Daniel Palmer 2020-12-07  1510  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1511  	pinctrl->regmap =3D devm_re=
gmap_init_mmio(pinctrl->dev, base,
cac53fceca07b4 Daniel Palmer 2020-12-07  1512  			&msc313_pinctrl_regmap_co=
nfig);
cac53fceca07b4 Daniel Palmer 2020-12-07  1513  	if (IS_ERR(pinctrl->regmap))
cac53fceca07b4 Daniel Palmer 2020-12-07  1514  		return PTR_ERR(pinctrl->re=
gmap);
cac53fceca07b4 Daniel Palmer 2020-12-07  1515  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1516  	pinctrl->desc.name =3D DRIV=
ER_NAME;
cac53fceca07b4 Daniel Palmer 2020-12-07  1517  	pinctrl->desc.pctlops =3D &=
msc313_pinctrl_ops;
cac53fceca07b4 Daniel Palmer 2020-12-07  1518  	pinctrl->desc.pmxops =3D &m=
star_pinmux_ops;
cac53fceca07b4 Daniel Palmer 2020-12-07  1519  	pinctrl->desc.confops =3D &=
mstar_pinconf_ops;
cac53fceca07b4 Daniel Palmer 2020-12-07  1520  	pinctrl->desc.owner =3D THI=
S_MODULE;
cac53fceca07b4 Daniel Palmer 2020-12-07  1521  	pinctrl->desc.pins =3D pinc=
trl->info->pins;
cac53fceca07b4 Daniel Palmer 2020-12-07  1522  	pinctrl->desc.npins =3D pin=
ctrl->info->npins;
cac53fceca07b4 Daniel Palmer 2020-12-07  1523  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1524  	ret =3D devm_pinctrl_regist=
er_and_init(pinctrl->dev, &pinctrl->desc,
cac53fceca07b4 Daniel Palmer 2020-12-07  1525  					     pinctrl, &pinctrl-=
>pctl);
cac53fceca07b4 Daniel Palmer 2020-12-07  1526  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1527  	if (ret) {
cac53fceca07b4 Daniel Palmer 2020-12-07  1528  		dev_err(pinctrl->dev, "fai=
led to register pinctrl\n");
cac53fceca07b4 Daniel Palmer 2020-12-07  1529  		return ret;
cac53fceca07b4 Daniel Palmer 2020-12-07  1530  	}
cac53fceca07b4 Daniel Palmer 2020-12-07  1531  =

cac53fceca07b4 Daniel Palmer 2020-12-07 @1532  	ret =3D mstar_pinctrl_parse=
_functions(pinctrl);
cac53fceca07b4 Daniel Palmer 2020-12-07  1533  	ret =3D mstar_pinctrl_parse=
_groups(pinctrl);
cac53fceca07b4 Daniel Palmer 2020-12-07  1534  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1535  	ret =3D pinctrl_enable(pinc=
trl->pctl);
cac53fceca07b4 Daniel Palmer 2020-12-07  1536  	if (ret)
cac53fceca07b4 Daniel Palmer 2020-12-07  1537  		dev_err(pinctrl->dev, "fai=
led to enable pinctrl\n");
cac53fceca07b4 Daniel Palmer 2020-12-07  1538  =

cac53fceca07b4 Daniel Palmer 2020-12-07  1539  	return 0;
cac53fceca07b4 Daniel Palmer 2020-12-07  1540  }
cac53fceca07b4 Daniel Palmer 2020-12-07  1541  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8203550120621630649==--

