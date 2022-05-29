Content-Type: multipart/mixed; boundary="===============2585939247705369995=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/elx/efct/efct_hw.c:1518:3: warning: Value stored to 'ctx' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 30 May 2022 02:18:41 +0800
Message-ID: <202205300249.0VPxOAZe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2585939247705369995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: James Smart <jsmart2021@gmail.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Daniel Wagner <dwagner@suse.de>
CC: Ram Vegesna <ram.vegesna@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   664a393a2663a0f62fc1b18157ccae33dcdbb8c8
commit: ebc076b3eddc807729bd81f7bc48e798a3ddc477 scsi: elx: efct: Tie into =
kernel Kconfig and build process
date:   12 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220524 (https://download.01.org/0day-ci/arch=
ive/20220530/202205300249.0VPxOAZe-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Debc076b3eddc807729bd81f7bc48e798a3ddc477
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ebc076b3eddc807729bd81f7bc48e798a3ddc477
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~
   drivers/atm/fore200e.c:1234:5: note: Taking true branch
       if (activate) {
       ^
   drivers/atm/fore200e.c:1252:9: note: 'activate' is 1
       if (activate) {
           ^~~~~~~~
   drivers/atm/fore200e.c:1252:5: note: Taking true branch
       if (activate) {
       ^
   drivers/atm/fore200e.c:1259:2: note: 1st function call argument is an un=
initialized value
           fore200e->bus->write(*(u32*)&vpvc,         (u32 __iomem *)&entry=
->cp_entry->cmd.activate_block.vpvc);
           ^                    ~~~~~~~~~~~~
   drivers/atm/fore200e.c:1263:2: warning: 1st function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           fore200e->bus->write(*(u32*)&vpvc,         (u32 __iomem *)&entry=
->cp_entry->cmd.deactivate_block.vpvc);
           ^
   drivers/atm/fore200e.c:1419:5: note: Assuming 'vcc' is non-null
       ASSERT(vcc);
       ^
   drivers/atm/fore200e.c:85:30: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                                ^~~~~~~
   drivers/atm/fore200e.c:1419:5: note: Taking false branch
       ASSERT(vcc);
       ^
   drivers/atm/fore200e.c:85:26: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                            ^
   drivers/atm/fore200e.c:1422:13: note: Assuming field 'vpi' is >=3D 0
       ASSERT((vcc->vpi >=3D 0) && (vcc->vpi < 1<<FORE200E_VPI_BITS));
               ^
   drivers/atm/fore200e.c:85:32: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                                  ^~~~
   drivers/atm/fore200e.c:1422:12: note: Left side of '&&' is true
       ASSERT((vcc->vpi >=3D 0) && (vcc->vpi < 1<<FORE200E_VPI_BITS));
              ^
   drivers/atm/fore200e.c:1422:32: note: Assuming the condition is true
       ASSERT((vcc->vpi >=3D 0) && (vcc->vpi < 1<<FORE200E_VPI_BITS));
                                  ^
   drivers/atm/fore200e.c:85:32: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                                  ^~~~
   drivers/atm/fore200e.c:1422:5: note: Taking false branch
       ASSERT((vcc->vpi >=3D 0) && (vcc->vpi < 1<<FORE200E_VPI_BITS));
       ^
   drivers/atm/fore200e.c:85:26: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                            ^
   drivers/atm/fore200e.c:1423:13: note: Assuming field 'vci' is >=3D 0
       ASSERT((vcc->vci >=3D 0) && (vcc->vci < 1<<FORE200E_VCI_BITS));
               ^
   drivers/atm/fore200e.c:85:32: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                                  ^~~~
   drivers/atm/fore200e.c:1423:12: note: Left side of '&&' is true
       ASSERT((vcc->vci >=3D 0) && (vcc->vci < 1<<FORE200E_VCI_BITS));
              ^
   drivers/atm/fore200e.c:1423:32: note: Assuming the condition is true
       ASSERT((vcc->vci >=3D 0) && (vcc->vci < 1<<FORE200E_VCI_BITS));
                                  ^
   drivers/atm/fore200e.c:85:32: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                                  ^~~~
   drivers/atm/fore200e.c:1423:5: note: Taking false branch
       ASSERT((vcc->vci >=3D 0) && (vcc->vci < 1<<FORE200E_VCI_BITS));
       ^
   drivers/atm/fore200e.c:85:26: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)     if (!(expr)) { \
                            ^
   drivers/atm/fore200e.c:1425:5: note: Loop condition is false.  Exiting l=
oop
       DPRINTK(2, "closing %d.%d.%d:%d\n", vcc->itf, vcc->vpi, vcc->vci, fo=
re200e_atm2fore_aal(vcc->qos.aal));
       ^
   drivers/atm/fore200e.c:71:42: note: expanded from macro 'DPRINTK'
   #define DPRINTK(level, format, args...)  do {} while (0)
                                            ^
   drivers/atm/fore200e.c:1429:5: note: Calling 'fore200e_activate_vcin'
       fore200e_activate_vcin(fore200e, 0, vcc, 0);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/fore200e.c:1234:9: note: 'activate' is 0
       if (activate) {
           ^~~~~~~~
   drivers/atm/fore200e.c:1234:5: note: Taking false branch
       if (activate) {
       ^
   drivers/atm/fore200e.c:1252:9: note: 'activate' is 0
       if (activate) {
           ^~~~~~~~
   drivers/atm/fore200e.c:1252:5: note: Taking false branch
       if (activate) {
       ^
   drivers/atm/fore200e.c:1263:2: note: 1st function call argument is an un=
initialized value
           fore200e->bus->write(*(u32*)&vpvc,         (u32 __iomem *)&entry=
->cp_entry->cmd.deactivate_block.vpvc);
           ^                    ~~~~~~~~~~~~
   Suppressed 25 warnings (13 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/scsi/elx/efct/efct_hw.c:1518:3: warning: Value stored to 'ctx' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ctx =3D list_first_entry(&hw->cmd_head,
                   ^
   drivers/scsi/elx/efct/efct_hw.c:1518:3: note: Value stored to 'ctx' is n=
ever read
>> drivers/scsi/elx/efct/efct_hw.c:1593:29: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
                   io->wq =3D hw->wq_cpu_array[raw_smp_processor_id()];
                                             ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   drivers/scsi/elx/efct/efct_hw.c:2709:8: note: Calling 'efct_hw_io_alloc'
           hio =3D efct_hw_io_alloc(hw);
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_hw.c:1614:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&hw->io_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/scsi/elx/efct/efct_hw.c:1614:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&hw->io_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/scsi/elx/efct/efct_hw.c:1615:7: note: Calling '_efct_hw_io_alloc'
           io =3D _efct_hw_io_alloc(hw);
                ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_hw.c:1583:6: note: Assuming the condition is =
true
           if (!list_empty(&hw->io_free)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_hw.c:1583:2: note: Taking true branch
           if (!list_empty(&hw->io_free)) {
           ^
   drivers/scsi/elx/efct/efct_hw.c:1584:8: note: Left side of '&&' is false
                   io =3D list_first_entry(&hw->io_free, struct efct_hw_io,
                        ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/scsi/elx/efct/efct_hw.c:1584:8: note: Taking false branch
                   io =3D list_first_entry(&hw->io_free, struct efct_hw_io,
                        ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/scsi/elx/efct/efct_hw.c:1584:8: note: Loop condition is false.  =
Exiting loop
                   io =3D list_first_entry(&hw->io_free, struct efct_hw_io,
                        ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/scsi/elx/efct/efct_hw.c:1588:6: note: 'io' is non-null
           if (io) {
               ^~
   drivers/scsi/elx/efct/efct_hw.c:1588:2: note: Taking true branch
           if (io) {
           ^
   drivers/scsi/elx/efct/efct_hw.c:1593:29: note: Dereference of null point=
er
                   io->wq =3D hw->wq_cpu_array[raw_smp_processor_id()];
                                             ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
--
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/ata/libata-eh.c:777:2: note: Dereference of null pointer
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/usb/misc/yurex.c:196:2: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/usb/misc/yurex.c:196:2: note: Dereference of null pointer
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/usb/misc/yurex.c:435:2: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/usb/misc/yurex.c:435:2: note: Dereference of null pointer
           DEFINE_WAIT(wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/scsi/pm8001/pm8001_init.c:410:3: warning: Value stored to 'rc' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -ENOMEM;
                   ^    ~~~~~~~
   drivers/scsi/pm8001/pm8001_init.c:410:3: note: Value stored to 'rc' is n=
ever read
                   rc =3D -ENOMEM;
                   ^    ~~~~~~~
   Suppressed 24 warnings (12 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/scsi/elx/efct/efct_hw_queues.c:196:23: warning: Access to field =
'hw' results in a dereference of an undefined pointer value [clang-analyzer=
-core.NullDereference]
           struct efct_hw *hw =3D eqs[0]->hw;
                                ^
   drivers/scsi/elx/efct/efct_hw_queues.c:32:14: note: Assuming 'i' is >=3D=
 field 'n_eq'
           for (i =3D 0; i < hw->config.n_eq; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_hw_queues.c:32:2: note: Loop condition is fal=
se. Execution continues on line 73
           for (i =3D 0; i < hw->config.n_eq; i++) {
           ^
   drivers/scsi/elx/efct/efct_hw_queues.c:73:6: note: Calling 'efct_hw_new_=
cq_set'
           if (efct_hw_new_cq_set(eqs, cqs, i, hw->num_qentries[SLI4_QTYPE_=
CQ])) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/elx/efct/efct_hw_queues.c:196:23: note: Access to field 'hw=
' results in a dereference of an undefined pointer value
           struct efct_hw *hw =3D eqs[0]->hw;
                                ^~~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
>> drivers/scsi/elx/efct/efct_lio.c:1156:15: warning: Value stored to 'efct=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct efct *efct =3D nport->efc->base;
                        ^~~~   ~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1156:15: note: Value stored to 'efct' d=
uring its initialization is never read
           struct efct *efct =3D nport->efc->base;
                        ^~~~   ~~~~~~~~~~~~~~~~
>> drivers/scsi/elx/efct/efct_lio.c:1366:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "FROM_INITIATOR";
                   ^      ~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1366:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "FROM_INITIATOR";
                   ^      ~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1370:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "TO_INITIATOR";
                   ^      ~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1370:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "TO_INITIATOR";
                   ^      ~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1374:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "BIDIR";
                   ^      ~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1374:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "BIDIR";
                   ^      ~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1378:3: warning: Value stored to 'ddir'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   ddir =3D "NONE";
                   ^      ~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1378:3: note: Value stored to 'ddir' is=
 never read
                   ddir =3D "NONE";
                   ^      ~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: warning: Access to field 'gener=
ate_node_acls' results in a dereference of a null pointer (loaded from vari=
able 'a') [clang-analyzer-core.NullDereference]
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1515:10: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           a->name =3D val;                                                =
    \
           ~       ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Left side of '&&' is false
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
                                      ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Taking false branch
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
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
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Loop condition is false. =
 Exiting loop
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
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
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: 'tpg' initialized to a nu=
ll pointer value
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:2: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: 'a' initialized to a null=
 pointer value
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1500:2: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           struct efct_lio_tpg_attrib *a =3D &tpg->tpg_attrib;             =
    \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Assuming 'ret' is >=3D 0
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1505:6: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           if (ret < 0) {                                                  =
  \
               ^~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Taking false branch
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
--
   include/scsi/scsi_device.h:451:31: note: expanded from macro 'scsi_execu=
te'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
                                        ^
   include/scsi/scsi_device.h:462:9: note: Taking false branch
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:451:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
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
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/scsi/scsi_device.h:462:9: note: Loop condition is false.  Exitin=
g loop
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:451:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
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
   include/scsi/scsi_device.h:462:9: note: Calling '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:453:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:217:4: note: 'data_direction' is not equal to DM=
A_TO_DEVICE
                           data_direction =3D=3D DMA_TO_DEVICE ?
                           ^~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:217:4: note: '?' condition is false
   drivers/scsi/scsi_lib.c:219:4: note: '?' condition is false
                           rq_flags & RQF_PM ? BLK_MQ_REQ_PM : 0);
                           ^
   drivers/scsi/scsi_lib.c:220:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   drivers/scsi/scsi_lib.c:221:3: note: Returning without writing to 'sshdr=
->response_code'
                   return PTR_ERR(req);
                   ^
   include/scsi/scsi_device.h:462:9: note: Returning from '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:453:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi_device.h:462:2: note: Returning without writing to 'ss=
hdr->response_code'
           return scsi_execute(sdev, cmd, data_direction, buffer,
           ^
   drivers/scsi/scsi_lib.c:2139:11: note: Returning from 'scsi_execute_req'
           result =3D scsi_execute_req(sdev, cmd, DMA_FROM_DEVICE, buffer, =
len,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/scsi/scsi_lib.c:2141:6: note: Assuming 'result' is >=3D 0
           if (result < 0)
               ^~~~~~~~~~
   drivers/scsi/scsi_lib.c:2141:2: note: Taking false branch
           if (result < 0)
           ^
   drivers/scsi/scsi_lib.c:2149:2: note: Taking true branch
           if (!scsi_status_is_good(result)) {
           ^
   drivers/scsi/scsi_lib.c:2150:7: note: Calling 'scsi_sense_valid'
                   if (scsi_sense_valid(sshdr)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi_common.h:63:7: note: 'sshdr' is non-null
           if (!sshdr)
                ^~~~~
   include/scsi/scsi_common.h:63:2: note: Taking false branch
           if (!sshdr)
           ^
   include/scsi/scsi_common.h:66:31: note: The left operand of '&' is a gar=
bage value
           return (sshdr->response_code & 0x70) =3D=3D 0x70;
                   ~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/scsi/elx/efct/efct_unsol.c:147:27: warning: Value stored to 'fch=
dr' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
                   struct fc_frame_header  *fchdr =3D seq->header->dma.virt;
                                            ^~~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_unsol.c:147:27: note: Value stored to 'fchdr'=
 during its initialization is never read
                   struct fc_frame_header  *fchdr =3D seq->header->dma.virt;
                                            ^~~~~   ~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/elx/efct/efct_unsol.c:320:15: warning: Value stored to 'efc=
t' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct efct *efct =3D node->efct;
                        ^~~~   ~~~~~~~~~~
   drivers/scsi/elx/efct/efct_unsol.c:320:15: note: Value stored to 'efct' =
during its initialization is never read
           struct efct *efct =3D node->efct;
                        ^~~~   ~~~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/scsi/elx/libefc/efc_cmds.c:36:14: warning: Value stored to 'efc'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_cmds.c:36:14: note: Value stored to 'efc' du=
ring its initialization is never read
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_cmds.c:314:14: warning: Value stored to 'efc=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct efc *efc =3D domain->efc;
                       ^~~   ~~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_cmds.c:314:14: note: Value stored to 'efc' d=
uring its initialization is never read
           struct efc *efc =3D domain->efc;
                       ^~~   ~~~~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/scsi/elx/libefc/efc_fabric.c:77:14: warning: Value stored to 'ef=
c' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_fabric.c:77:14: note: Value stored to 'efc' =
during its initialization is never read
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
>> drivers/scsi/elx/libefc/efc_fabric.c:398:19: warning: Value stored to 'n=
ode' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct efc_node *node =3D ctx->app;
                            ^~~~   ~~~~~~~~
   drivers/scsi/elx/libefc/efc_fabric.c:398:19: note: Value stored to 'node=
' during its initialization is never read
           struct efc_node *node =3D ctx->app;
                            ^~~~   ~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/mtd/ubi/block.c:124:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, val);
           ^~~~~~
   drivers/mtd/ubi/block.c:124:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(buf, val);
           ^~~~~~
   drivers/mtd/ubi/block.c:144:4: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(param->name, tokens[1]);
                           ^~~~~~
   drivers/mtd/ubi/block.c:144:4: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                           strcpy(param->name, tokens[1]);
                           ^~~~~~
   drivers/mtd/ubi/block.c:149:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(param->name, tokens[0]);
                   ^~~~~~
   drivers/mtd/ubi/block.c:149:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(param->name, tokens[0]);
                   ^~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/mtd/ubi/gluebi.c:323:3: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
                   err_msg("gluebi MTD device %d form UBI device %d volume =
%d already exists",
                   ^
   drivers/mtd/ubi/gluebi.c:32:9: note: expanded from macro 'err_msg'
                  current->pid, __func__, ##__VA_ARGS__)
                  ^
   drivers/mtd/ubi/gluebi.c:449:2: note: Control jumps to 'case UBI_VOLUME_=
ADDED:'  at line 450
           switch (l) {
           ^
   drivers/mtd/ubi/gluebi.c:451:3: note: Calling 'gluebi_create'
                   gluebi_create(&nt->di, &nt->vi);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/gluebi.c:284:11: note: Calling 'kzalloc'
           gluebi =3D kzalloc(sizeof(struct gluebi_device), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:544:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:561:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/gluebi.c:284:11: note: Returning from 'kzalloc'
           gluebi =3D kzalloc(sizeof(struct gluebi_device), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/gluebi.c:285:6: note: Assuming 'gluebi' is non-null
           if (!gluebi)
               ^~~~~~~
   drivers/mtd/ubi/gluebi.c:285:2: note: Taking false branch
           if (!gluebi)
           ^
   drivers/mtd/ubi/gluebi.c:289:14: note: Calling 'kmemdup'
           mtd->name =3D kmemdup(vi->name, vi->name_len + 1, GFP_KERNEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:266:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && p_size < size)
                                          ^
   include/linux/fortify-string.h:268:6: note: Assuming 'p_size' is >=3D 's=
ize'
           if (p_size < size)
               ^~~~~~~~~~~~~
   include/linux/fortify-string.h:268:2: note: Taking false branch
           if (p_size < size)
           ^
   include/linux/fortify-string.h:270:2: note: Returning pointer, which par=
ticipates in a condition later
           return __real_kmemdup(p, size, gfp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/gluebi.c:289:14: note: Returning from 'kmemdup'
           mtd->name =3D kmemdup(vi->name, vi->name_len + 1, GFP_KERNEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/gluebi.c:290:6: note: Assuming field 'name' is non-null
           if (!mtd->name) {
               ^~~~~~~~~~
   drivers/mtd/ubi/gluebi.c:290:2: note: Taking false branch
           if (!mtd->name) {
           ^
   drivers/mtd/ubi/gluebi.c:298:6: note: Assuming field 'ro_mode' is not eq=
ual to 0
           if (!di->ro_mode)
               ^~~~~~~~~~~~
   drivers/mtd/ubi/gluebi.c:298:2: note: Taking false branch
           if (!di->ro_mode)
           ^
   drivers/mtd/ubi/gluebi.c:314:6: note: Assuming field 'vol_type' is not e=
qual to UBI_DYNAMIC_VOLUME
           if (vi->vol_type =3D=3D UBI_DYNAMIC_VOLUME)
--
           ^
   drivers/usb/gadget/composite.c:1695:2: note: Control jumps to 'case 6:' =
 at line 1698
           switch (ctrl->bRequest) {
           ^
   drivers/usb/gadget/composite.c:1699:7: note: Assuming field 'bRequestTyp=
e' is equal to USB_DIR_IN
                   if (ctrl->bRequestType !=3D USB_DIR_IN)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:1699:3: note: Taking false branch
                   if (ctrl->bRequestType !=3D USB_DIR_IN)
                   ^
   drivers/usb/gadget/composite.c:1701:3: note: Control jumps to 'case 2:' =
 at line 1738
                   switch (w_value >> 8) {
                   ^
   drivers/usb/gadget/composite.c:1739:12: note: Calling 'config_desc'
                           value =3D config_desc(cdev, w_value);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:560:6: note: Assuming field 'speed' is >=
=3D USB_SPEED_SUPER
           if (gadget->speed >=3D USB_SPEED_SUPER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:560:2: note: Taking true branch
           if (gadget->speed >=3D USB_SPEED_SUPER)
           ^
   drivers/usb/gadget/composite.c:578:6: note: Assuming 'c' is null
           if (c)
               ^
   drivers/usb/gadget/composite.c:578:2: note: Taking false branch
           if (c)
           ^
   drivers/usb/gadget/composite.c:581:10: note: Value assigned to 'pos'
           while ((pos =3D pos->next) !=3D  &cdev->configs) {
                   ^~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:581:2: note: Loop condition is true.  Ent=
ering loop body
           while ((pos =3D pos->next) !=3D  &cdev->configs) {
           ^
   drivers/usb/gadget/composite.c:582:7: note: Left side of '&&' is false
                   c =3D list_entry(pos, typeof(*c), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/composite.c:582:7: note: Taking false branch
                   c =3D list_entry(pos, typeof(*c), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
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
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/usb/gadget/composite.c:582:7: note: Loop condition is false.  Ex=
iting loop
                   c =3D list_entry(pos, typeof(*c), list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
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
   drivers/usb/gadget/composite.c:585:7: note: Assuming 'c' is equal to fie=
ld 'os_desc_config'
                   if (c =3D=3D cdev->os_desc_config)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:585:3: note: Taking true branch
                   if (c =3D=3D cdev->os_desc_config)
                   ^
   drivers/usb/gadget/composite.c:586:4: note:  Execution continues on line=
 581
                           continue;
                           ^
   drivers/usb/gadget/composite.c:581:16: note: Access to field 'next' resu=
lts in a dereference of a null pointer (loaded from variable 'pos')
           while ((pos =3D pos->next) !=3D  &cdev->configs) {
                         ^~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/scsi/elx/libefc/efc_node.c:592:14: warning: Value stored to 'efc=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_node.c:592:14: note: Value stored to 'efc' d=
uring its initialization is never read
           struct efc *efc =3D node->efc;
                       ^~~   ~~~~~~~~~
>> drivers/scsi/elx/libefc/efc_node.c:653:2: warning: Value stored to 'efc'=
 is never read [clang-analyzer-deadcode.DeadStores]
           efc =3D node->efc;
           ^     ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_node.c:653:2: note: Value stored to 'efc' is=
 never read
           efc =3D node->efc;
           ^     ~~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/scsi/elx/libefc/efc_nport.c:442:14: warning: Value stored to 'ef=
c' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   drivers/scsi/elx/libefc/efc_nport.c:442:14: note: Value stored to 'efc' =
during its initialization is never read
           struct efc *efc =3D nport->efc;
                       ^~~   ~~~~~~~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/scsi/elx/libefc/efc_device.c:51:2: warning: Value stored to 'efc=
' is never read [clang-analyzer-deadcode.DeadStores]
           efc =3D node->efc;
           ^     ~~~~~~~~~
   drivers/scsi/elx/libefc/efc_device.c:51:2: note: Value stored to 'efc' i=
s never read
           efc =3D node->efc;
           ^     ~~~~~~~~~
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/scsi/bfa/bfad_im.c:223:3: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
                   set_current_state(TASK_UNINTERRUPTIBLE);
                   ^
   include/linux/sched.h:141:3: note: expanded from macro 'set_current_stat=
e'
                   current->task_state_change =3D _THIS_IP_;         \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/scsi/bfa/bfad_im.c:201:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&bfad->bfad_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/scsi/bfa/bfad_im.c:201:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&bfad->bfad_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/scsi/bfa/bfad_im.c:203:6: note: Assuming 'hal_io' is non-null
           if (!hal_io) {
               ^~~~~~~
   drivers/scsi/bfa/bfad_im.c:203:2: note: Taking false branch
           if (!hal_io) {
           ^
   drivers/scsi/bfa/bfad_im.c:208:6: note: Assuming 'cmnd' is equal to fiel=
d 'dio'
           if (hal_io->dio !=3D (struct bfad_ioim_s *) cmnd) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/bfa/bfad_im.c:208:2: note: Taking false branch
           if (hal_io->dio !=3D (struct bfad_ioim_s *) cmnd) {
           ^
   drivers/scsi/bfa/bfad_im.c:214:2: note: Assuming 'bfa_log_level' is not =
equal to 4
           BFA_LOG(KERN_INFO, bfad, bfa_log_level,
           ^
   drivers/scsi/bfa/bfad_drv.h:285:7: note: expanded from macro 'BFA_LOG'
           if (((mask) =3D=3D 4) || (level[1] <=3D '4'))                   =
      \
                ^~~~~~~~~~~
   drivers/scsi/bfa/bfad_im.c:214:2: note: Left side of '||' is false
           BFA_LOG(KERN_INFO, bfad, bfa_log_level,
           ^
   drivers/scsi/bfa/bfad_drv.h:285:6: note: expanded from macro 'BFA_LOG'
           if (((mask) =3D=3D 4) || (level[1] <=3D '4'))                   =
      \
               ^
   drivers/scsi/bfa/bfad_im.c:214:2: note: Taking false branch
           BFA_LOG(KERN_INFO, bfad, bfa_log_level,
           ^
   drivers/scsi/bfa/bfad_drv.h:285:2: note: expanded from macro 'BFA_LOG'
           if (((mask) =3D=3D 4) || (level[1] <=3D '4'))                   =
      \
           ^
   drivers/scsi/bfa/bfad_im.c:214:2: note: Loop condition is false.  Exitin=
g loop
           BFA_LOG(KERN_INFO, bfad, bfa_log_level,
           ^
   drivers/scsi/bfa/bfad_drv.h:283:52: note: expanded from macro 'BFA_LOG'
   #define BFA_LOG(level, bfad, mask, fmt, arg...)                         \
                                                                           ^
   drivers/scsi/bfa/bfad_im.c:222:2: note: Loop condition is true.  Enterin=
g loop body
           while ((struct bfa_ioim_s *) cmnd->host_scribble =3D=3D hal_io) {
           ^
   drivers/scsi/bfa/bfad_im.c:223:3: note: Taking false branch
                   set_current_state(TASK_UNINTERRUPTIBLE);
                   ^
   include/linux/sched.h:140:3: note: expanded from macro 'set_current_stat=
e'
                   WARN_ON_ONCE(is_special_task_state(state_value));\
                   ^
   include/asm-generic/bug.h:103:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   drivers/scsi/bfa/bfad_im.c:223:3: note: Dereference of null pointer
                   set_current_state(TASK_UNINTERRUPTIBLE);

vim +/ctx +1518 drivers/scsi/elx/efct/efct_hw.c

580c0255e4effe James Smart 2021-06-01  1500  =

580c0255e4effe James Smart 2021-06-01  1501  static int
580c0255e4effe James Smart 2021-06-01  1502  efct_hw_command_cancel(struct =
efct_hw *hw)
580c0255e4effe James Smart 2021-06-01  1503  {
580c0255e4effe James Smart 2021-06-01  1504  	unsigned long flags =3D 0;
580c0255e4effe James Smart 2021-06-01  1505  	int rc =3D 0;
580c0255e4effe James Smart 2021-06-01  1506  =

580c0255e4effe James Smart 2021-06-01  1507  	spin_lock_irqsave(&hw->cmd_lo=
ck, flags);
580c0255e4effe James Smart 2021-06-01  1508  =

580c0255e4effe James Smart 2021-06-01  1509  	/*
580c0255e4effe James Smart 2021-06-01  1510  	 * Manually clean up remainin=
g commands. Note: since this calls
580c0255e4effe James Smart 2021-06-01  1511  	 * efct_hw_command_process(),=
 we'll also process the cmd_pending
580c0255e4effe James Smart 2021-06-01  1512  	 * list, so no need to manual=
ly clean that out.
580c0255e4effe James Smart 2021-06-01  1513  	 */
580c0255e4effe James Smart 2021-06-01  1514  	while (!list_empty(&hw->cmd_h=
ead)) {
580c0255e4effe James Smart 2021-06-01  1515  		u8		mqe[SLI4_BMBX_SIZE] =3D =
{ 0 };
580c0255e4effe James Smart 2021-06-01  1516  		struct efct_command_ctx *ctx;
580c0255e4effe James Smart 2021-06-01  1517  =

580c0255e4effe James Smart 2021-06-01 @1518  		ctx =3D list_first_entry(&hw=
->cmd_head,
580c0255e4effe James Smart 2021-06-01  1519  				       struct efct_command=
_ctx, list_entry);
580c0255e4effe James Smart 2021-06-01  1520  =

580c0255e4effe James Smart 2021-06-01  1521  		efc_log_debug(hw->os, "hung =
command %08x\n",
580c0255e4effe James Smart 2021-06-01  1522  			      !ctx ? U32_MAX :
580c0255e4effe James Smart 2021-06-01  1523  			      (!ctx->buf ? U32_MAX =
: *((u32 *)ctx->buf)));
580c0255e4effe James Smart 2021-06-01  1524  		spin_unlock_irqrestore(&hw->=
cmd_lock, flags);
580c0255e4effe James Smart 2021-06-01  1525  		rc =3D efct_hw_command_proce=
ss(hw, -1, mqe, SLI4_BMBX_SIZE);
580c0255e4effe James Smart 2021-06-01  1526  		spin_lock_irqsave(&hw->cmd_l=
ock, flags);
580c0255e4effe James Smart 2021-06-01  1527  	}
580c0255e4effe James Smart 2021-06-01  1528  =

580c0255e4effe James Smart 2021-06-01  1529  	spin_unlock_irqrestore(&hw->c=
md_lock, flags);
580c0255e4effe James Smart 2021-06-01  1530  =

580c0255e4effe James Smart 2021-06-01  1531  	return rc;
580c0255e4effe James Smart 2021-06-01  1532  }
580c0255e4effe James Smart 2021-06-01  1533  =

580c0255e4effe James Smart 2021-06-01  1534  static void
580c0255e4effe James Smart 2021-06-01  1535  efct_mbox_rsp_cb(struct efct_h=
w *hw, int status, u8 *mqe, void *arg)
580c0255e4effe James Smart 2021-06-01  1536  {
580c0255e4effe James Smart 2021-06-01  1537  	struct efct_mbox_rqst_ctx *ct=
x =3D arg;
580c0255e4effe James Smart 2021-06-01  1538  =

580c0255e4effe James Smart 2021-06-01  1539  	if (ctx) {
580c0255e4effe James Smart 2021-06-01  1540  		if (ctx->callback)
580c0255e4effe James Smart 2021-06-01  1541  			(*ctx->callback)(hw->os->ef=
cport, status, mqe,
580c0255e4effe James Smart 2021-06-01  1542  					 ctx->arg);
580c0255e4effe James Smart 2021-06-01  1543  =

580c0255e4effe James Smart 2021-06-01  1544  		mempool_free(ctx, hw->mbox_r=
qst_pool);
580c0255e4effe James Smart 2021-06-01  1545  	}
580c0255e4effe James Smart 2021-06-01  1546  }
580c0255e4effe James Smart 2021-06-01  1547  =

580c0255e4effe James Smart 2021-06-01  1548  int
580c0255e4effe James Smart 2021-06-01  1549  efct_issue_mbox_rqst(void *bas=
e, void *cmd, void *cb, void *arg)
580c0255e4effe James Smart 2021-06-01  1550  {
580c0255e4effe James Smart 2021-06-01  1551  	struct efct_mbox_rqst_ctx *ct=
x;
580c0255e4effe James Smart 2021-06-01  1552  	struct efct *efct =3D base;
580c0255e4effe James Smart 2021-06-01  1553  	struct efct_hw *hw =3D &efct-=
>hw;
580c0255e4effe James Smart 2021-06-01  1554  	int rc;
580c0255e4effe James Smart 2021-06-01  1555  =

580c0255e4effe James Smart 2021-06-01  1556  	/*
580c0255e4effe James Smart 2021-06-01  1557  	 * Allocate a callback contex=
t (which includes the mbox cmd buffer),
580c0255e4effe James Smart 2021-06-01  1558  	 * we need this to be persist=
ent as the mbox cmd submission may be
580c0255e4effe James Smart 2021-06-01  1559  	 * queued and executed later =
execution.
580c0255e4effe James Smart 2021-06-01  1560  	 */
580c0255e4effe James Smart 2021-06-01  1561  	ctx =3D mempool_alloc(hw->mbo=
x_rqst_pool, GFP_ATOMIC);
580c0255e4effe James Smart 2021-06-01  1562  	if (!ctx)
580c0255e4effe James Smart 2021-06-01  1563  		return -EIO;
580c0255e4effe James Smart 2021-06-01  1564  =

580c0255e4effe James Smart 2021-06-01  1565  	ctx->callback =3D cb;
580c0255e4effe James Smart 2021-06-01  1566  	ctx->arg =3D arg;
580c0255e4effe James Smart 2021-06-01  1567  =

580c0255e4effe James Smart 2021-06-01  1568  	rc =3D efct_hw_command(hw, cm=
d, EFCT_CMD_NOWAIT, efct_mbox_rsp_cb, ctx);
580c0255e4effe James Smart 2021-06-01  1569  	if (rc) {
580c0255e4effe James Smart 2021-06-01  1570  		efc_log_err(efct, "issue mbo=
x rqst failure rc:%d\n", rc);
580c0255e4effe James Smart 2021-06-01  1571  		mempool_free(ctx, hw->mbox_r=
qst_pool);
580c0255e4effe James Smart 2021-06-01  1572  		return -EIO;
580c0255e4effe James Smart 2021-06-01  1573  	}
580c0255e4effe James Smart 2021-06-01  1574  =

580c0255e4effe James Smart 2021-06-01  1575  	return 0;
580c0255e4effe James Smart 2021-06-01  1576  }
63de51327a64c7 James Smart 2021-06-01  1577  =

63de51327a64c7 James Smart 2021-06-01  1578  static inline struct efct_hw_i=
o *
63de51327a64c7 James Smart 2021-06-01  1579  _efct_hw_io_alloc(struct efct_=
hw *hw)
63de51327a64c7 James Smart 2021-06-01  1580  {
63de51327a64c7 James Smart 2021-06-01  1581  	struct efct_hw_io *io =3D NUL=
L;
63de51327a64c7 James Smart 2021-06-01  1582  =

63de51327a64c7 James Smart 2021-06-01  1583  	if (!list_empty(&hw->io_free)=
) {
63de51327a64c7 James Smart 2021-06-01  1584  		io =3D list_first_entry(&hw-=
>io_free, struct efct_hw_io,
63de51327a64c7 James Smart 2021-06-01  1585  				      list_entry);
63de51327a64c7 James Smart 2021-06-01  1586  		list_del(&io->list_entry);
63de51327a64c7 James Smart 2021-06-01  1587  	}
63de51327a64c7 James Smart 2021-06-01  1588  	if (io) {
63de51327a64c7 James Smart 2021-06-01  1589  		INIT_LIST_HEAD(&io->list_ent=
ry);
63de51327a64c7 James Smart 2021-06-01  1590  		list_add_tail(&io->list_entr=
y, &hw->io_inuse);
63de51327a64c7 James Smart 2021-06-01  1591  		io->state =3D EFCT_HW_IO_STA=
TE_INUSE;
63de51327a64c7 James Smart 2021-06-01  1592  		io->abort_reqtag =3D U32_MAX;
63de51327a64c7 James Smart 2021-06-01 @1593  		io->wq =3D hw->wq_cpu_array[=
raw_smp_processor_id()];
63de51327a64c7 James Smart 2021-06-01  1594  		if (!io->wq) {
63de51327a64c7 James Smart 2021-06-01  1595  			efc_log_err(hw->os, "WQ not=
 assigned for cpu:%d\n",
63de51327a64c7 James Smart 2021-06-01  1596  				    raw_smp_processor_id()=
);
63de51327a64c7 James Smart 2021-06-01  1597  			io->wq =3D hw->hw_wq[0];
63de51327a64c7 James Smart 2021-06-01  1598  		}
63de51327a64c7 James Smart 2021-06-01  1599  		kref_init(&io->ref);
63de51327a64c7 James Smart 2021-06-01  1600  		io->release =3D efct_hw_io_f=
ree_internal;
63de51327a64c7 James Smart 2021-06-01  1601  	} else {
63de51327a64c7 James Smart 2021-06-01  1602  		atomic_add(1, &hw->io_alloc_=
failed_count);
63de51327a64c7 James Smart 2021-06-01  1603  	}
63de51327a64c7 James Smart 2021-06-01  1604  =

63de51327a64c7 James Smart 2021-06-01  1605  	return io;
63de51327a64c7 James Smart 2021-06-01  1606  }
63de51327a64c7 James Smart 2021-06-01  1607  =


:::::: The code at line 1518 was first introduced by commit
:::::: 580c0255e4effe49b9974044e78a03e76d977618 scsi: elx: efct: RQ buffer,=
 memory pool allocation and deallocation APIs

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2585939247705369995==--

