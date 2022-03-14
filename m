Content-Type: multipart/mixed; boundary="===============6179723119695278743=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [wsa:i2c/for-mergewindow 42/58] drivers/i2c/busses/i2c-qcom-geni.c:683:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 14 Mar 2022 18:49:12 +0800
Message-ID: <202203141801.SwJCPiCw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6179723119695278743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-mergewindow
head:   8b6d8d00a46a12a4baa08d547d4231e50a558254
commit: d8703554f4dea9775417525b22b3d65ed1c6b16e [42/58] i2c: qcom-geni: Ad=
d support for GPI DMA
:::::: branch date: 3 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-c002-20220313 (https://download.01.org/0day-ci/archi=
ve/20220314/202203141801.SwJCPiCw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb=
2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/com=
mit/?id=3Dd8703554f4dea9775417525b22b3d65ed1c6b16e
        git remote add wsa https://git.kernel.org/pub/scm/linux/kernel/git/=
wsa/linux.git
        git fetch --no-tags wsa i2c/for-mergewindow
        git checkout d8703554f4dea9775417525b22b3d65ed1c6b16e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:592:3: note: Taking false branch
                   if (i < num - 1)
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:597:7: note: Assuming the condition i=
s false
                   if (msgs[i].flags & I2C_M_RD) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:597:3: note: Taking false branch
                   if (msgs[i].flags & I2C_M_RD) {
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:604:10: note: Calling 'geni_i2c_gpi'
                   ret =3D  geni_i2c_gpi(gi2c, &msgs[i], &config,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:512:6: note: Assuming 'dma_buf' is no=
n-null
           if (!dma_buf)
               ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:512:2: note: Taking false branch
           if (!dma_buf)
           ^
   drivers/i2c/busses/i2c-qcom-geni.c:515:6: note: 'op' is equal to I2C_WRI=
TE
           if (op =3D=3D I2C_WRITE)
               ^~
   drivers/i2c/busses/i2c-qcom-geni.c:515:2: note: Taking true branch
           if (op =3D=3D I2C_WRITE)
           ^
   drivers/i2c/busses/i2c-qcom-geni.c:521:2: note: Taking false branch
           if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
           ^
   drivers/i2c/busses/i2c-qcom-geni.c:531:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/i2c/busses/i2c-qcom-geni.c:531:2: note: Taking false branch
           if (ret) {
           ^
   drivers/i2c/busses/i2c-qcom-geni.c:540:6: note: 'op' is equal to I2C_WRI=
TE
           if (op =3D=3D I2C_WRITE)
               ^~
   drivers/i2c/busses/i2c-qcom-geni.c:540:2: note: Taking true branch
           if (op =3D=3D I2C_WRITE)
           ^
   drivers/i2c/busses/i2c-qcom-geni.c:546:6: note: Assuming 'desc' is non-n=
ull
           if (!desc) {
               ^~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:546:2: note: Taking false branch
           if (!desc) {
           ^
   drivers/i2c/busses/i2c-qcom-geni.c:558:2: note: Returning zero, which pa=
rticipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:604:10: note: Returning from 'geni_i2=
c_gpi'
                   ret =3D  geni_i2c_gpi(gi2c, &msgs[i], &config,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:606:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/i2c/busses/i2c-qcom-geni.c:606:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:609:7: note: Assuming the condition i=
s false
                   if (msgs[i].flags & I2C_M_RD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:609:3: note: Taking false branch
                   if (msgs[i].flags & I2C_M_RD)
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:614:7: note: Assuming 'timeout' is no=
t equal to 0
                   if (!timeout) {
                       ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:614:3: note: Taking false branch
                   if (!timeout) {
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:621:7: note: Assuming field 'err' is =
not equal to 0
                   if (gi2c->err) {
                       ^~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:621:3: note: Taking true branch
                   if (gi2c->err) {
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:623:4: note: Control jumps to line 632
                           goto err;
                           ^
   drivers/i2c/busses/i2c-qcom-geni.c:632:2: note: Loop condition is false.=
  Exiting loop
           dev_err(gi2c->se.dev, "GPI transfer failed: %d\n", ret);
           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/i2c/busses/i2c-qcom-geni.c:635:2: note: 6th function call argume=
nt is an uninitialized value
           geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_a=
ddr);
           ^                                                           ~~~~=
~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:683:3: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D geni_i2c_gpi_xfer(gi2c, msgs, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:683:3: note: Value stored to 'ret' is=
 never read
                   ret =3D geni_i2c_gpi_xfer(gi2c, msgs, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:685:3: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D geni_i2c_fifo_xfer(gi2c, msgs, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:685:3: note: Value stored to 'ret' is=
 never read
                   ret =3D geni_i2c_fifo_xfer(gi2c, msgs, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clocksource/sh_mtu2.c:364:26: warning: The right operand of '+' =
is a garbage value due to array index out of bounds [clang-analyzer-core.Un=
definedBinaryOperatorResult]
           ch->base =3D mtu->mapbase + sh_mtu2_channel_offsets[index];
                                   ^
   drivers/clocksource/sh_mtu2.c:455:2: note: Taking true branch
           if (!is_sh_early_platform_device(pdev)) {
           ^
   drivers/clocksource/sh_mtu2.c:460:6: note: Assuming 'mtu' is null
           if (mtu) {
               ^~~
   drivers/clocksource/sh_mtu2.c:460:2: note: Taking false branch
           if (mtu) {
           ^
   drivers/clocksource/sh_mtu2.c:466:6: note: Assuming 'mtu' is not equal t=
o NULL
           if (mtu =3D=3D NULL)
               ^~~~~~~~~~~
   drivers/clocksource/sh_mtu2.c:466:2: note: Taking false branch
           if (mtu =3D=3D NULL)
           ^
   drivers/clocksource/sh_mtu2.c:469:8: note: Calling 'sh_mtu2_setup'
           ret =3D sh_mtu2_setup(mtu, pdev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/sh_mtu2.c:395:2: note: Loop condition is false.  Exi=
ting loop
           raw_spin_lock_init(&mtu->lock);
           ^
   include/linux/spinlock.h:102:39: note: expanded from macro 'raw_spin_loc=
k_init'
   # define raw_spin_lock_init(lock)                                       \
                                                                           ^
   drivers/clocksource/sh_mtu2.c:399:6: note: Calling 'IS_ERR'
           if (IS_ERR(mtu->clk)) {
               ^~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/sh_mtu2.c:399:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mtu->clk)) {
               ^~~~~~~~~~~~~~~~
   drivers/clocksource/sh_mtu2.c:399:2: note: Taking false branch
           if (IS_ERR(mtu->clk)) {
           ^
   drivers/clocksource/sh_mtu2.c:405:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/clocksource/sh_mtu2.c:405:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/clocksource/sh_mtu2.c:410:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/clocksource/sh_mtu2.c:410:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/clocksource/sh_mtu2.c:417:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/clocksource/sh_mtu2.c:417:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/clocksource/sh_mtu2.c:420:22: note: Assuming '__UNIQUE_ID___x179=
' is >=3D '__UNIQUE_ID___y180'
           mtu->num_channels =3D min_t(unsigned int, ret,
                               ^
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
                            ^~~~~~~~~~
   drivers/clocksource/sh_mtu2.c:420:22: note: '?' condition is false
           mtu->num_channels =3D min_t(unsigned int, ret,
                               ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)

vim +/ret +683 drivers/i2c/busses/i2c-qcom-geni.c

d8703554f4dea9 Vinod Koul                  2022-02-21  661  =

37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  662  static int geni=
_i2c_xfer(struct i2c_adapter *adap,
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  663  			 struct i2c_=
msg msgs[],
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  664  			 int num)
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  665  {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  666  	struct geni_i2=
c_dev *gi2c =3D i2c_get_adapdata(adap);
d8703554f4dea9 Vinod Koul                  2022-02-21  667  	int ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  668  =

37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  669  	gi2c->err =3D =
0;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  670  	reinit_complet=
ion(&gi2c->done);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  671  	ret =3D pm_run=
time_get_sync(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  672  	if (ret < 0) {
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  673  		dev_err(gi2c-=
>se.dev, "error turning SE resources:%d\n", ret);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  674  		pm_runtime_pu=
t_noidle(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  675  		/* Set device=
 in suspended since resume failed */
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  676  		pm_runtime_se=
t_suspended(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  677  		return ret;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  678  	}
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  679  =

37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  680  	qcom_geni_i2c_=
conf(gi2c);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  681  =

d8703554f4dea9 Vinod Koul                  2022-02-21  682  	if (gi2c->gpi_=
mode)
d8703554f4dea9 Vinod Koul                  2022-02-21 @683  		ret =3D geni_=
i2c_gpi_xfer(gi2c, msgs, num);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  684  	else
d8703554f4dea9 Vinod Koul                  2022-02-21  685  		ret =3D geni_=
i2c_fifo_xfer(gi2c, msgs, num);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  686  =

37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  687  	pm_runtime_mar=
k_last_busy(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  688  	pm_runtime_put=
_autosuspend(gi2c->se.dev);
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  689  	gi2c->cur =3D =
NULL;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  690  	gi2c->err =3D =
0;
d8703554f4dea9 Vinod Koul                  2022-02-21  691  	return num;
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  692  }
37692de5d52353 Karthikeyan Ramasubramanian 2018-07-30  693  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6179723119695278743==--

