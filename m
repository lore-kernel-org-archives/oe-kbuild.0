Content-Type: multipart/mixed; boundary="===============7285600076702513672=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peda-linux-mux:for-next 3/3] drivers/mux/core.c:726:16: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 19 Dec 2021 02:28:27 +0800
Message-ID: <202112190241.PFd8guZ5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7285600076702513672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aswath Govindraju <a-govindraju@ti.com>
CC: Peter Rosin <peda@axentia.se>

tree:   https://gitlab.com/peda-linux/mux.git for-next
head:   f20e55504ef448d3e78d9d5ecf8de4bf06725462
commit: f20e55504ef448d3e78d9d5ecf8de4bf06725462 [3/3] mux: Add support for=
 reading mux state from consumer DT node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20211216 (https://download.01.org/0day-ci/archi=
ve/20211219/202112190241.PFd8guZ5-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3=
d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add peda-linux-mux https://gitlab.com/peda-linux/mux.git
        git fetch --no-tags peda-linux-mux for-next
        git checkout f20e55504ef448d3e78d9d5ecf8de4bf06725462
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mmc/host/sh_mmcif.c:866:5: note: Access to field 'blocks' result=
s in a dereference of a null pointer (loaded from variable 'data')
                                   data->blocks << 16);
                                   ^~~~
   drivers/mmc/host/sh_mmcif.c:971:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:971:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:994:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:994:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1085:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1085:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1179:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1179:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1285:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1285:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/input/mouse/elantech.c:182:8: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   *val =3D param[0];
                        ^
   drivers/input/mouse/elantech.c:1485:2: note: Taking false branch
           if (elantech_detect(psmouse, 0))
           ^
   drivers/input/mouse/elantech.c:1488:6: note: Calling 'elantech_set_absol=
ute_mode'
           if (elantech_set_absolute_mode(psmouse)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/elantech.c:1019:2: note: 'Default' branch taken. Exe=
cution continues on line 1060
           switch (etd->info.hw_version) {
           ^
   drivers/input/mouse/elantech.c:1060:6: note: 'rc' is equal to 0
           if (rc =3D=3D 0) {
               ^~
   drivers/input/mouse/elantech.c:1060:2: note: Taking true branch
           if (rc =3D=3D 0) {
           ^
   drivers/input/mouse/elantech.c:1068:9: note: Calling 'elantech_read_reg'
                           rc =3D elantech_read_reg(psmouse, 0x10, &val);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/elantech.c:143:6: note: 'reg' is >=3D 7
           if (reg < 0x07 || reg > 0x26)
               ^~~
   drivers/input/mouse/elantech.c:143:6: note: Left side of '||' is false
   drivers/input/mouse/elantech.c:143:20: note: 'reg' is <=3D 38
           if (reg < 0x07 || reg > 0x26)
                             ^~~
   drivers/input/mouse/elantech.c:143:2: note: Taking false branch
           if (reg < 0x07 || reg > 0x26)
           ^
   drivers/input/mouse/elantech.c:146:6: note: 'reg' is <=3D 17
           if (reg > 0x11 && reg < 0x20)
               ^~~
   drivers/input/mouse/elantech.c:146:17: note: Left side of '&&' is false
           if (reg > 0x11 && reg < 0x20)
                          ^
   drivers/input/mouse/elantech.c:149:2: note: 'Default' branch taken. Exec=
ution continues on line 179
           switch (etd->info.hw_version) {
           ^
   drivers/input/mouse/elantech.c:179:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/input/mouse/elantech.c:179:2: note: Taking false branch
           if (rc)
           ^
   drivers/input/mouse/elantech.c:181:21: note: Field 'hw_version' is not e=
qual to 4
           else if (etd->info.hw_version !=3D 4)
                              ^
   drivers/input/mouse/elantech.c:181:7: note: Taking true branch
           else if (etd->info.hw_version !=3D 4)
                ^
   drivers/input/mouse/elantech.c:182:8: note: Assigned value is garbage or=
 undefined
                   *val =3D param[0];
                        ^ ~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/mux/core.c:726:16: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
           mstate->state =3D state;
                         ^ ~~~~~
   drivers/mux/core.c:709:2: note: 'state' declared without an initial value
           int state;
           ^~~~~~~~~
   drivers/mux/core.c:712:6: note: Assuming 'mstate' is non-null
           if (!mstate)
               ^~~~~~~
   drivers/mux/core.c:712:2: note: Taking false branch
           if (!mstate)
           ^
   drivers/mux/core.c:716:6: note: Assuming 'ptr' is non-null
           if (!ptr)
               ^~~~
   drivers/mux/core.c:716:2: note: Taking false branch
           if (!ptr)
           ^
   drivers/mux/core.c:719:13: note: Calling 'mux_get'
           mux_ctrl =3D mux_get(dev, mux_name, &state);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/core.c:541:6: note: Assuming 'mux_name' is non-null
           if (mux_name) {
               ^~~~~~~~
   drivers/mux/core.c:541:2: note: Taking true branch
           if (mux_name) {
           ^
   drivers/mux/core.c:542:7: note: 'state' is non-null
                   if (state)
                       ^~~~~
   drivers/mux/core.c:542:3: note: Taking true branch
                   if (state)
                   ^
   drivers/mux/core.c:548:7: note: Assuming 'index' is < 0
                   if (index < 0) {
                       ^~~~~~~~~
   drivers/mux/core.c:548:3: note: Taking true branch
                   if (index < 0) {
                   ^
   drivers/mux/core.c:549:4: note: Loop condition is false.  Exiting loop
                           dev_err(dev, "mux controller '%s' not found\n",
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
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mux/core.c:719:13: note: Returning from 'mux_get'
           mux_ctrl =3D mux_get(dev, mux_name, &state);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/core.c:720:6: note: Calling 'IS_ERR'
           if (IS_ERR(mux_ctrl)) {
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
   drivers/mux/core.c:720:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mux_ctrl)) {
               ^~~~~~~~~~~~~~~~
   drivers/mux/core.c:720:2: note: Taking false branch
           if (IS_ERR(mux_ctrl)) {
           ^
   drivers/mux/core.c:726:16: note: Assigned value is garbage or undefined
           mstate->state =3D state;
                         ^ ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \

vim +726 drivers/mux/core.c

f20e55504ef448 Aswath Govindraju 2021-12-02  695  =

f20e55504ef448 Aswath Govindraju 2021-12-02  696  /**
f20e55504ef448 Aswath Govindraju 2021-12-02  697   * devm_mux_state_get() -=
 Get the mux-state for a device, with resource
f20e55504ef448 Aswath Govindraju 2021-12-02  698   *			  management.
f20e55504ef448 Aswath Govindraju 2021-12-02  699   * @dev: The device that =
needs a mux-control.
f20e55504ef448 Aswath Govindraju 2021-12-02  700   * @mux_name: The name id=
entifying the mux-control.
f20e55504ef448 Aswath Govindraju 2021-12-02  701   *
f20e55504ef448 Aswath Govindraju 2021-12-02  702   * Return: Pointer to the=
 mux-state, or an ERR_PTR with a negative errno.
f20e55504ef448 Aswath Govindraju 2021-12-02  703   */
f20e55504ef448 Aswath Govindraju 2021-12-02  704  struct mux_state *devm_mu=
x_state_get(struct device *dev,
f20e55504ef448 Aswath Govindraju 2021-12-02  705  				     const char *mux_=
name)
f20e55504ef448 Aswath Govindraju 2021-12-02  706  {
f20e55504ef448 Aswath Govindraju 2021-12-02  707  	struct mux_state **ptr, =
*mstate;
f20e55504ef448 Aswath Govindraju 2021-12-02  708  	struct mux_control *mux_=
ctrl;
f20e55504ef448 Aswath Govindraju 2021-12-02  709  	int state;
f20e55504ef448 Aswath Govindraju 2021-12-02  710  =

f20e55504ef448 Aswath Govindraju 2021-12-02  711  	mstate =3D devm_kzalloc(=
dev, sizeof(struct mux_state), GFP_KERNEL);
f20e55504ef448 Aswath Govindraju 2021-12-02  712  	if (!mstate)
f20e55504ef448 Aswath Govindraju 2021-12-02  713  		return ERR_PTR(-ENOMEM);
f20e55504ef448 Aswath Govindraju 2021-12-02  714  =

f20e55504ef448 Aswath Govindraju 2021-12-02  715  	ptr =3D devres_alloc(dev=
m_mux_state_release, sizeof(*ptr), GFP_KERNEL);
f20e55504ef448 Aswath Govindraju 2021-12-02  716  	if (!ptr)
f20e55504ef448 Aswath Govindraju 2021-12-02  717  		return ERR_PTR(-ENOMEM);
f20e55504ef448 Aswath Govindraju 2021-12-02  718  =

f20e55504ef448 Aswath Govindraju 2021-12-02  719  	mux_ctrl =3D mux_get(dev=
, mux_name, &state);
f20e55504ef448 Aswath Govindraju 2021-12-02  720  	if (IS_ERR(mux_ctrl)) {
f20e55504ef448 Aswath Govindraju 2021-12-02  721  		devres_free(ptr);
f20e55504ef448 Aswath Govindraju 2021-12-02  722  		return (struct mux_stat=
e *)mux_ctrl;
f20e55504ef448 Aswath Govindraju 2021-12-02  723  	}
f20e55504ef448 Aswath Govindraju 2021-12-02  724  =

f20e55504ef448 Aswath Govindraju 2021-12-02  725  	mstate->mux =3D mux_ctrl;
f20e55504ef448 Aswath Govindraju 2021-12-02 @726  	mstate->state =3D state;
f20e55504ef448 Aswath Govindraju 2021-12-02  727  	*ptr =3D mstate;
f20e55504ef448 Aswath Govindraju 2021-12-02  728  	devres_add(dev, ptr);
f20e55504ef448 Aswath Govindraju 2021-12-02  729  =

f20e55504ef448 Aswath Govindraju 2021-12-02  730  	return mstate;
f20e55504ef448 Aswath Govindraju 2021-12-02  731  }
f20e55504ef448 Aswath Govindraju 2021-12-02  732  EXPORT_SYMBOL_GPL(devm_mu=
x_state_get);
f20e55504ef448 Aswath Govindraju 2021-12-02  733  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7285600076702513672==--

