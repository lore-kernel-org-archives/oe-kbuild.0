Content-Type: multipart/mixed; boundary="===============6017629089636571424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mailbox: pcc: Handle all PCC subtypes correctly in pcc_mbox_irq
Date: Sat, 11 Dec 2021 09:32:26 +0800
Message-ID: <202112110925.83I7jqKe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6017629089636571424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211209092146.620024-1-sudeep.holla@arm.com>
References: <20211209092146.620024-1-sudeep.holla@arm.com>
TO: Sudeep Holla <sudeep.holla@arm.com>
TO: linux-kernel(a)vger.kernel.org
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: linux-acpi(a)vger.kernel.org
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: Justin He <justin.he@arm.com>

Hi Sudeep,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on fujitsu-integration/mailbox-for-next linus/mast=
er v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sudeep-Holla/mailbox-pcc-H=
andle-all-PCC-subtypes-correctly-in-pcc_mbox_irq/20211209-172331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
136057256686de39cc3a07c2e39ef6bc43003ff6
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20211209 (https://download.01.org/0day-ci/ar=
chive/20211211/202112110925.83I7jqKe-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a5c9987836ae9937053ca154b=
c04e6f178cf2f94
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sudeep-Holla/mailbox-pcc-Handle-al=
l-PCC-subtypes-correctly-in-pcc_mbox_irq/20211209-172331
        git checkout a5c9987836ae9937053ca154bc04e6f178cf2f94
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/reada.c:122:6: note: 'err' is -5
           if (err)
               ^~~
   fs/btrfs/reada.c:122:2: note: Taking true branch
           if (err)
           ^
   fs/btrfs/reada.c:123:3: note: Control jumps to line 181
                   goto cleanup;
                   ^
   fs/btrfs/reada.c:181:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&list)) {
           ^
   fs/btrfs/reada.c:191:7: note: Assuming the condition is false
                   if (atomic_dec_and_test(&rc->elems)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/reada.c:191:3: note: Taking false branch
                   if (atomic_dec_and_test(&rc->elems)) {
                   ^
   fs/btrfs/reada.c:181:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&list)) {
           ^
   fs/btrfs/reada.c:188:3: note: Memory is released
                   kfree(rec);
                   ^~~~~~~~~~
   fs/btrfs/reada.c:191:7: note: Assuming the condition is false
                   if (atomic_dec_and_test(&rc->elems)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/reada.c:191:3: note: Taking false branch
                   if (atomic_dec_and_test(&rc->elems)) {
                   ^
   fs/btrfs/reada.c:181:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&list)) {
           ^
   fs/btrfs/reada.c:186:3: note: Calling 'list_del'
                   list_del(&rec->list);
                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/mailbox/pcc.c:194:6: warning: The left expression of the compoun=
d assignment is an uninitialized value. The computed value will also be gar=
bage [clang-analyzer-core.uninitialized.Assign]
           val &=3D reg->preserve_mask;
               ^
   drivers/mailbox/pcc.c:373:8: note: Calling 'pcc_chan_reg_read_modify_wri=
te'
           ret =3D pcc_chan_reg_read_modify_write(&pchan->cmd_update);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:188:2: note: 'val' declared without an initial val=
ue
           u64 val;
           ^~~~~~~
   drivers/mailbox/pcc.c:190:8: note: Calling 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(reg, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:157:6: note: Assuming field 'gas' is non-null, whi=
ch participates in a condition later
           if (!reg->gas) {
               ^~~~~~~~~
   drivers/mailbox/pcc.c:157:2: note: Taking false branch
           if (!reg->gas) {
           ^
   drivers/mailbox/pcc.c:162:6: note: Assuming field 'vaddr' is non-null
           if (reg->vaddr)
               ^~~~~~~~~~
   drivers/mailbox/pcc.c:162:2: note: Taking true branch
           if (reg->vaddr)
           ^
   drivers/mailbox/pcc.c:163:3: note: Calling 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:119:2: note: 'Default' branch taken. Execution con=
tinues on line 119
           switch (bit_width) {
           ^
   drivers/mailbox/pcc.c:133:1: note: Returning without writing to '*val'
   }
   ^
   drivers/mailbox/pcc.c:163:3: note: Returning from 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:167:2: note: Returning without writing to '*val'
           return ret;
           ^
   drivers/mailbox/pcc.c:167:2: note: Returning zero (loaded from 'ret'), w=
hich participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/mailbox/pcc.c:190:8: note: Returning from 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(reg, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:191:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mailbox/pcc.c:191:2: note: Taking false branch
           if (ret)
           ^
   drivers/mailbox/pcc.c:194:6: note: The left expression of the compound a=
ssignment is an uninitialized value. The computed value will also be garbage
           val &=3D reg->preserve_mask;
           ~~~ ^
>> drivers/mailbox/pcc.c:244:6: warning: Branch condition evaluates to a ga=
rbage value [clang-analyzer-core.uninitialized.Branch]
           if (val) { /* Ensure GAS exists and value is non-zero */
               ^~~
   drivers/mailbox/pcc.c:235:2: note: 'val' declared without an initial val=
ue
           u64 val;
           ^~~~~~~
   drivers/mailbox/pcc.c:240:8: note: Calling 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(&pchan->cmd_complete, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:157:6: note: Assuming field 'gas' is non-null, whi=
ch participates in a condition later
           if (!reg->gas) {
               ^~~~~~~~~
   drivers/mailbox/pcc.c:157:2: note: Taking false branch
           if (!reg->gas) {
           ^
   drivers/mailbox/pcc.c:162:6: note: Assuming field 'vaddr' is non-null
           if (reg->vaddr)
               ^~~~~~~~~~
   drivers/mailbox/pcc.c:162:2: note: Taking true branch
           if (reg->vaddr)
           ^
   drivers/mailbox/pcc.c:163:3: note: Calling 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:119:2: note: 'Default' branch taken. Execution con=
tinues on line 119
           switch (bit_width) {
           ^
   drivers/mailbox/pcc.c:133:1: note: Returning without writing to '*val'
   }
   ^
   drivers/mailbox/pcc.c:163:3: note: Returning from 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:167:2: note: Returning without writing to '*val'
           return ret;
           ^
   drivers/mailbox/pcc.c:167:2: note: Returning zero (loaded from 'ret'), w=
hich participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/mailbox/pcc.c:240:8: note: Returning from 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(&pchan->cmd_complete, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:241:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mailbox/pcc.c:241:2: note: Taking false branch
           if (ret)
           ^
   drivers/mailbox/pcc.c:244:6: note: Branch condition evaluates to a garba=
ge value
           if (val) { /* Ensure GAS exists and value is non-zero */
               ^~~
   drivers/mailbox/pcc.c:294:3: warning: 1st function call argument is an u=
ninitialized value [clang-analyzer-core.CallAndMessage]
                   dev_err(dev, "Channel not found for idx: %d\n", subspace=
_id);
                   ^
   include/linux/dev_printk.h:144:24: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
                                 ^                   ~~~
   include/linux/dev_printk.h:110:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                   ^       ~~~
   drivers/mailbox/pcc.c:285:2: note: 'dev' declared without an initial val=
ue
           struct device *dev;
           ^~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:288:6: note: Assuming 'subspace_id' is >=3D 0
           if (subspace_id < 0 || subspace_id >=3D pcc_chan_count)
               ^~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:288:6: note: Left side of '||' is false
   drivers/mailbox/pcc.c:288:25: note: Assuming 'subspace_id' is < 'pcc_cha=
n_count'
           if (subspace_id < 0 || subspace_id >=3D pcc_chan_count)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:288:2: note: Taking false branch
           if (subspace_id < 0 || subspace_id >=3D pcc_chan_count)
           ^
   drivers/mailbox/pcc.c:293:6: note: Calling 'IS_ERR'
           if (IS_ERR(chan) || chan->cl) {
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
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
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:293:6: note: Returning from 'IS_ERR'
           if (IS_ERR(chan) || chan->cl) {
               ^~~~~~~~~~~~
   drivers/mailbox/pcc.c:293:19: note: Left side of '||' is true
           if (IS_ERR(chan) || chan->cl) {
                            ^
   drivers/mailbox/pcc.c:294:3: note: Loop condition is false.  Exiting loop
                   dev_err(dev, "Channel not found for idx: %d\n", subspace=
_id);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'

vim +244 drivers/mailbox/pcc.c

aca314efb17727 hotran       2016-08-15  223  =

aca314efb17727 hotran       2016-08-15  224  /**
aca314efb17727 hotran       2016-08-15  225   * pcc_mbox_irq - PCC mailbox =
interrupt handler
10dcc2d66292f9 Sudeep Holla 2021-09-17  226   * @irq:	interrupt number
10dcc2d66292f9 Sudeep Holla 2021-09-17  227   * @p: data/cookie passed from=
 the caller to identify the channel
10dcc2d66292f9 Sudeep Holla 2021-09-17  228   *
10dcc2d66292f9 Sudeep Holla 2021-09-17  229   * Returns: IRQ_HANDLED if int=
errupt is handled or IRQ_NONE if not
aca314efb17727 hotran       2016-08-15  230   */
aca314efb17727 hotran       2016-08-15  231  static irqreturn_t pcc_mbox_ir=
q(int irq, void *p)
aca314efb17727 hotran       2016-08-15  232  {
80b2bdde002c52 Sudeep Holla 2021-09-17  233  	struct pcc_chan_info *pchan;
aca314efb17727 hotran       2016-08-15  234  	struct mbox_chan *chan =3D p;
c45ded7e11352d Sudeep Holla 2021-09-17  235  	u64 val;
c45ded7e11352d Sudeep Holla 2021-09-17  236  	int ret;
aca314efb17727 hotran       2016-08-15  237  =

bf18123e78f4d1 Sudeep Holla 2021-09-17  238  	pchan =3D chan->con_priv;
aca314efb17727 hotran       2016-08-15  239  =

c45ded7e11352d Sudeep Holla 2021-09-17  240  	ret =3D pcc_chan_reg_read(&pc=
han->cmd_complete, &val);
c45ded7e11352d Sudeep Holla 2021-09-17  241  	if (ret)
c45ded7e11352d Sudeep Holla 2021-09-17  242  		return IRQ_NONE;
c45ded7e11352d Sudeep Holla 2021-09-17  243  =

a5c9987836ae99 Sudeep Holla 2021-12-09 @244  	if (val) { /* Ensure GAS exis=
ts and value is non-zero */
c45ded7e11352d Sudeep Holla 2021-09-17  245  		val &=3D pchan->cmd_complete=
.status_mask;
c45ded7e11352d Sudeep Holla 2021-09-17  246  		if (!val)
c45ded7e11352d Sudeep Holla 2021-09-17  247  			return IRQ_NONE;
a5c9987836ae99 Sudeep Holla 2021-12-09  248  	}
c45ded7e11352d Sudeep Holla 2021-09-17  249  =

c45ded7e11352d Sudeep Holla 2021-09-17  250  	ret =3D pcc_chan_reg_read(&pc=
han->error, &val);
c45ded7e11352d Sudeep Holla 2021-09-17  251  	if (ret)
c45ded7e11352d Sudeep Holla 2021-09-17  252  		return IRQ_NONE;
c45ded7e11352d Sudeep Holla 2021-09-17  253  	val &=3D pchan->error.status_=
mask;
c45ded7e11352d Sudeep Holla 2021-09-17  254  	if (val) {
c45ded7e11352d Sudeep Holla 2021-09-17  255  		val &=3D ~pchan->error.statu=
s_mask;
c45ded7e11352d Sudeep Holla 2021-09-17  256  		pcc_chan_reg_write(&pchan->e=
rror, val);
c45ded7e11352d Sudeep Holla 2021-09-17  257  		return IRQ_NONE;
c45ded7e11352d Sudeep Holla 2021-09-17  258  	}
c45ded7e11352d Sudeep Holla 2021-09-17  259  =

bf18123e78f4d1 Sudeep Holla 2021-09-17  260  	if (pcc_chan_reg_read_modify_=
write(&pchan->plat_irq_ack))
aca314efb17727 hotran       2016-08-15  261  		return IRQ_NONE;
aca314efb17727 hotran       2016-08-15  262  =

bf18123e78f4d1 Sudeep Holla 2021-09-17  263  	mbox_chan_received_data(chan,=
 NULL);
aca314efb17727 hotran       2016-08-15  264  =

aca314efb17727 hotran       2016-08-15  265  	return IRQ_HANDLED;
aca314efb17727 hotran       2016-08-15  266  }
aca314efb17727 hotran       2016-08-15  267  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6017629089636571424==--

