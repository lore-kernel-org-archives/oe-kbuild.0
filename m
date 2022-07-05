Content-Type: multipart/mixed; boundary="===============6773292573823680536=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/i2c/busses/i2c-qcom-geni.c:683:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 06 Jul 2022 00:56:00 +0800
Message-ID: <202207060024.lH3g0gCI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6773292573823680536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
2c/busses/i2c-qcom-geni.c:683:3: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vinod Koul <vkoul@kernel.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c1084b6c5620a743f86947caca66d90f24060f56
commit: d8703554f4dea9775417525b22b3d65ed1c6b16e i2c: qcom-geni: Add suppor=
t for GPI DMA
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220703 (https://download.01.org/0day-ci/arc=
hive/20220706/202207060024.lH3g0gCI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5d7876=
89b14574fe58ba9798563f4a6df6059fbf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd8703554f4dea9775417525b22b3d65ed1c6b16e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d8703554f4dea9775417525b22b3d65ed1c6b16e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/typec/class.c:528:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           alt->roles =3D desc->roles;
                      ^
   drivers/usb/typec/class.c:1940:6: note: Assuming 'altmodes_node' is non-=
null
           if (!altmodes_node)
               ^~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1940:2: note: Taking false branch
           if (!altmodes_node)
           ^
   drivers/usb/typec/class.c:1943:2: note: Loop condition is true.  Enterin=
g loop body
           fwnode_for_each_child_node(altmodes_node, child) {
           ^
   include/linux/property.h:101:2: note: expanded from macro 'fwnode_for_ea=
ch_child_node'
           for (child =3D fwnode_get_next_child_node(fwnode, NULL); child; =
  \
           ^
   drivers/usb/typec/class.c:1945:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1945:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1952:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1952:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1958:7: note: Assuming 'index' is < 'n'
                   if (index >=3D n) {
                       ^~~~~~~~~~
   drivers/usb/typec/class.c:1958:3: note: Taking false branch
                   if (index >=3D n) {
                   ^
   drivers/usb/typec/class.c:1967:9: note: Calling 'typec_port_register_alt=
mode'
                   alt =3D typec_port_register_altmode(port, &desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1915:2: note: Taking false branch
           if (IS_ERR(mux))
           ^
   drivers/usb/typec/class.c:1918:9: note: Calling 'typec_register_altmode'
           adev =3D typec_register_altmode(&port->dev, desc);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:519:8: note: Calling 'kzalloc'
           alt =3D kzalloc(sizeof(*alt), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:519:8: note: Returning from 'kzalloc'
           alt =3D kzalloc(sizeof(*alt), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:520:6: note: Assuming 'alt' is non-null
           if (!alt) {
               ^~~~
   drivers/usb/typec/class.c:520:2: note: Taking false branch
           if (!alt) {
           ^
   drivers/usb/typec/class.c:528:13: note: Assigned value is garbage or und=
efined
           alt->roles =3D desc->roles;
                      ^ ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/tuners/fc0011.c:252:3: warning: Value stored to 'bandwidth=
' is never read [clang-analyzer-deadcode.DeadStores]
                   bandwidth =3D 6000;
                   ^           ~~~~
   drivers/media/tuners/fc0011.c:252:3: note: Value stored to 'bandwidth' i=
s never read
                   bandwidth =3D 6000;
                   ^           ~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6773292573823680536==--

