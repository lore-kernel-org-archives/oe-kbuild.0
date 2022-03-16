Content-Type: multipart/mixed; boundary="===============5862333248174902259=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] staging: rts5208: Resolve checkpath.pl issues.
Date: Wed, 16 Mar 2022 08:30:25 +0800
Message-ID: <202203160807.K3AjX7FR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5862333248174902259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <Yi/5nEXVmzZrbfbz@sckzor-linux.localdomain>
References: <Yi/5nEXVmzZrbfbz@sckzor-linux.localdomain>
TO: Charlie Sands <sandsch@northvilleschools.net>
TO: gregkh(a)linuxfoundation.org
CC: linux-staging(a)lists.linux.dev
CC: linux-kernel(a)vger.kernel.org

Hi Charlie,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Charlie-Sands/staging-rts5=
208-Resolve-checkpath-pl-issues/20220315-102944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
56955aae9fc2c59fa3c9b32f1f147cdbe05e5ac4
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220316/202203160807.K3AjX7FR-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f5=
0fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/db68d91d62af3bfc71979b5fd=
01ca858a56a22ba
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Charlie-Sands/staging-rts5208-Reso=
lve-checkpath-pl-issues/20220315-102944
        git checkout db68d91d62af3bfc71979b5fd01ca858a56a22ba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/md/dm-kcopyd.c:246:10: warning: Access to field 'next' results i=
n a dereference of a null pointer (loaded from variable 'pl') [clang-analyz=
er-core.NullDereference]
                   next =3D pl->next;
                          ^
   drivers/md/dm-kcopyd.c:913:6: note: Assuming 'kc' is non-null
           if (!kc)
               ^~~
   drivers/md/dm-kcopyd.c:913:2: note: Taking false branch
           if (!kc)
           ^
   drivers/md/dm-kcopyd.c:916:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_init(&kc->job_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/md/dm-kcopyd.c:924:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/md/dm-kcopyd.c:924:2: note: Taking false branch
           if (r)
           ^
   drivers/md/dm-kcopyd.c:927:2: note: Loop condition is false.  Exiting lo=
op
           INIT_WORK(&kc->kcopyd_work, do_work);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/md/dm-kcopyd.c:929:6: note: Assuming field 'kcopyd_wq' is non-nu=
ll
           if (!kc->kcopyd_wq) {
               ^~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:929:2: note: Taking false branch
           if (!kc->kcopyd_wq) {
           ^
   drivers/md/dm-kcopyd.c:939:6: note: Calling 'client_reserve_pages'
           r =3D client_reserve_pages(kc, reserve_pages);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:309:20: note: 'pl' initialized to a null pointer =
value
           struct page_list *pl =3D NULL, *next;
                             ^~
   drivers/md/dm-kcopyd.c:311:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:311:2: note: Loop condition is false. Execution c=
ontinues on line 322
           for (i =3D 0; i < nr_pages; i++) {
           ^
   drivers/md/dm-kcopyd.c:323:23: note: Passing null pointer value via 2nd =
parameter 'pl'
           kcopyd_put_pages(kc, pl);
                                ^~
   drivers/md/dm-kcopyd.c:323:2: note: Calling 'kcopyd_put_pages'
           kcopyd_put_pages(kc, pl);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:246:10: note: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'pl')
                   next =3D pl->next;
                          ^~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/staging/greybus/uart.c:273:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D kfifo_out(&gb_tty->write_fifo, &request->data[0],
                   ^
   drivers/staging/greybus/uart.c:273:3: note: Value stored to 'ret' is nev=
er read
   drivers/staging/greybus/uart.c:571:3: warning: Value stored to 'retval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/uart.c:571:3: note: Value stored to 'retval' is =
never read
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/uart.c:590:3: warning: Value stored to 'retval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/uart.c:590:3: note: Value stored to 'retval' is =
never read
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/staging/rts5208/rtsx.c:187:19: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rtsx_dev *dev =3D host_to_rtsx(srb->device->host);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx.c:187:19: note: Value stored to 'dev' durin=
g its initialization is never read
           struct rtsx_dev *dev =3D host_to_rtsx(srb->device->host);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx.c:384:7: warning: Access to field 'sc_data_=
direction' results in a dereference of a null pointer (loaded from field 's=
rb') [clang-analyzer-core.NullDereference]
                   if (chip->srb->sc_data_direction =3D=3D DMA_BIDIRECTIONA=
L) {
                       ^     ~~~
   drivers/staging/rts5208/rtsx.c:356:2: note: Loop condition is true.  Ent=
ering loop body
           for (;;) {
           ^
   drivers/staging/rts5208/rtsx.c:357:7: note: Assuming the condition is fa=
lse
                   if (wait_for_completion_interruptible(&dev->cmnd_ready))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx.c:357:3: note: Taking false branch
                   if (wait_for_completion_interruptible(&dev->cmnd_ready))
                   ^
   drivers/staging/rts5208/rtsx.c:364:7: note: Assuming field 'rtsx_stat' i=
s not equal to RTSX_STAT_DISCONNECT
                   if (rtsx_chk_stat(chip, RTSX_STAT_DISCONNECT)) {
                       ^
   drivers/staging/rts5208/rtsx_chip.h:935:36: note: expanded from macro 'r=
tsx_chk_stat'
   #define rtsx_chk_stat(chip, stat)       ((chip)->rtsx_stat =3D=3D (stat))
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx.c:364:3: note: Taking false branch
                   if (rtsx_chk_stat(chip, RTSX_STAT_DISCONNECT)) {
                   ^
   drivers/staging/rts5208/rtsx.c:374:7: note: Assuming field 'rtsx_stat' i=
s equal to RTSX_STAT_ABORT
                   if (rtsx_chk_stat(chip, RTSX_STAT_ABORT)) {
                       ^
   drivers/staging/rts5208/rtsx_chip.h:935:36: note: expanded from macro 'r=
tsx_chk_stat'
   #define rtsx_chk_stat(chip, stat)       ((chip)->rtsx_stat =3D=3D (stat))
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx.c:374:3: note: Taking true branch
                   if (rtsx_chk_stat(chip, RTSX_STAT_ABORT)) {
                   ^
   drivers/staging/rts5208/rtsx.c:376:4: note: Control jumps to line 424
                           goto skip_for_abort;
                           ^
   drivers/staging/rts5208/rtsx.c:424:4: note: Loop condition is false.  Ex=
iting loop
                           dev_err(&dev->pci->dev, "scsi command aborted\n"=
);
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
   drivers/staging/rts5208/rtsx.c:427:7: note: Field 'rtsx_stat' is equal t=
o RTSX_STAT_ABORT
                   if (rtsx_chk_stat(chip, RTSX_STAT_ABORT)) {
                       ^
   drivers/staging/rts5208/rtsx_chip.h:935:44: note: expanded from macro 'r=
tsx_chk_stat'
   #define rtsx_chk_stat(chip, stat)       ((chip)->rtsx_stat =3D=3D (stat))
                                                    ^
   drivers/staging/rts5208/rtsx.c:427:3: note: Taking true branch
                   if (rtsx_chk_stat(chip, RTSX_STAT_ABORT)) {
                   ^
   drivers/staging/rts5208/rtsx.c:430:4: note: RTSX_STAT_IDLE is equal to R=
TSX_STAT_IDLE
                           rtsx_set_stat(chip, RTSX_STAT_IDLE);
                           ^
   drivers/staging/rts5208/rtsx_chip.h:929:6: note: expanded from macro 'rt=
sx_set_stat'
           if ((stat) !=3D RTSX_STAT_IDLE) {                         \
               ^~~~~~
   drivers/staging/rts5208/rtsx.c:430:4: note: Taking false branch
                           rtsx_set_stat(chip, RTSX_STAT_IDLE);
                           ^
   drivers/staging/rts5208/rtsx_chip.h:929:2: note: expanded from macro 'rt=
sx_set_stat'
           if ((stat) !=3D RTSX_STAT_IDLE) {                         \
           ^
   drivers/staging/rts5208/rtsx.c:430:4: note: Loop condition is false.  Ex=
iting loop
                           rtsx_set_stat(chip, RTSX_STAT_IDLE);
                           ^
   drivers/staging/rts5208/rtsx_chip.h:927:38: note: expanded from macro 'r=
tsx_set_stat'
   #define rtsx_set_stat(chip, stat)                               \
                                                                   ^
   drivers/staging/rts5208/rtsx.c:434:3: note: Null pointer value stored to=
 field 'srb'
                   chip->srb =3D NULL;
                   ^~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx.c:356:2: note: Loop condition is true.  Ent=
ering loop body
           for (;;) {
           ^
   drivers/staging/rts5208/rtsx.c:357:7: note: Assuming the condition is fa=
lse
                   if (wait_for_completion_interruptible(&dev->cmnd_ready))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx.c:357:3: note: Taking false branch
                   if (wait_for_completion_interruptible(&dev->cmnd_ready))
                   ^
   drivers/staging/rts5208/rtsx.c:364:7: note: Field 'rtsx_stat' is not equ=
al to RTSX_STAT_DISCONNECT
                   if (rtsx_chk_stat(chip, RTSX_STAT_DISCONNECT)) {
                       ^
   drivers/staging/rts5208/rtsx_chip.h:935:44: note: expanded from macro 'r=
tsx_chk_stat'
   #define rtsx_chk_stat(chip, stat)       ((chip)->rtsx_stat =3D=3D (stat))

vim +/dev +187 drivers/staging/rts5208/rtsx.c

fa590c222fbaa4 Micky Ching    2013-11-12  180  =

228fc259045878 MingChia Chung 2016-08-28  181  /*
228fc259045878 MingChia Chung 2016-08-28  182   * This invokes the transpor=
t reset mechanism to reset the state of the
228fc259045878 MingChia Chung 2016-08-28  183   * device
228fc259045878 MingChia Chung 2016-08-28  184   */
fa590c222fbaa4 Micky Ching    2013-11-12  185  static int device_reset(stru=
ct scsi_cmnd *srb)
fa590c222fbaa4 Micky Ching    2013-11-12  186  {
fa590c222fbaa4 Micky Ching    2013-11-12 @187  	struct rtsx_dev *dev =3D ho=
st_to_rtsx(srb->device->host);
fa590c222fbaa4 Micky Ching    2013-11-12  188  =

de9a009b934a14 Colin Ian King 2017-02-02  189  	return SUCCESS;
fa590c222fbaa4 Micky Ching    2013-11-12  190  }
fa590c222fbaa4 Micky Ching    2013-11-12  191  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5862333248174902259==--

