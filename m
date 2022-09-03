Content-Type: multipart/mixed; boundary="===============0621528005305593571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-split 5/17] fs/btrfs/disk-io.c:648:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sat, 03 Sep 2022 15:25:36 +0800
Message-ID: <202209031511.OHEgJ9Ak-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0621528005305593571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
disk-io.c:648:2: warning: Undefined or garbage value returned to caller [cl=
ang-analyzer-core.uninitialized.UndefReturn]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-split
head:   557db0fac4ee6917f81d59f65bb1cd1fd4059d06
commit: 444caad1964c7ec3745a152e10afb1ea1e36c6b5 [5/17] btrfs: handle check=
sum generation in the storage layer
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-c005-20220901 (https://download.01.org/0day-ci/arch=
ive/20220903/202209031511.OHEgJ9Ak-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc btrfs-bio-split
        git checkout 444caad1964c7ec3745a152e10afb1ea1e36c6b5
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1492:2: note: Taking false branch
           if (scsi_command_size(cdb) > sizeof(cmd->__t_task_cdb)) {
           ^
   drivers/target/target_core_transport.c:1508:2: note: Calling 'trace_targ=
et_sequencer_start'
           trace_target_sequencer_start(cmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/target.h:132:1: note: Taking true branch
   TRACE_EVENT(target_sequencer_start,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/target.h:132:1: note: Dereference of null pointer
   TRACE_EVENT(target_sequencer_start,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   include/trace/events/target.h:169:1: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
   TRACE_EVENT(target_cmd_complete,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   drivers/target/target_core_transport.c:3502:2: note: Assuming the condit=
ion is false
           WARN_ON_ONCE(cmd->se_cmd_flags & SCF_SCSI_TMR_CDB);
           ^
   include/asm-generic/bug.h:180:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   drivers/target/target_core_transport.c:3505:2: note: Calling 'trace_targ=
et_cmd_complete'
           trace_target_cmd_complete(cmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/target.h:169:1: note: Taking true branch
   TRACE_EVENT(target_cmd_complete,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/target.h:169:1: note: Dereference of null pointer
   TRACE_EVENT(target_cmd_complete,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> fs/btrfs/disk-io.c:648:2: warning: Undefined or garbage value returned t=
o caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   fs/btrfs/disk-io.c:640:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   fs/btrfs/disk-io.c:642:2: note: Assuming field 'bi_size' is 0
           bio_for_each_segment(bvec, &bbio->bio, iter) {
           ^
   include/linux/bio.h:152:2: note: expanded from macro 'bio_for_each_segme=
nt'
           __bio_for_each_segment(bvl, bio, iter, (bio)->bi_iter)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bio.h:147:7: note: expanded from macro '__bio_for_each_seg=
ment'
                (iter).bi_size &&                                          \
                ^~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:642:2: note: Left side of '&&' is false
           bio_for_each_segment(bvec, &bbio->bio, iter) {
           ^
   include/linux/bio.h:152:2: note: expanded from macro 'bio_for_each_segme=
nt'
           __bio_for_each_segment(bvl, bio, iter, (bio)->bi_iter)
           ^
   include/linux/bio.h:147:22: note: expanded from macro '__bio_for_each_se=
gment'
                (iter).bi_size &&                                          \
                               ^
   fs/btrfs/disk-io.c:648:2: note: Undefined or garbage value returned to c=
aller
           return ret;
           ^      ~~~
   fs/btrfs/disk-io.c:1725:4: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                           set_current_state(TASK_INTERRUPTIBLE);
                           ^
   include/linux/sched.h:209:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:137:3: note: expanded from macro 'debug_normal_sta=
te_change'
                   current->task_state_change =3D _THIS_IP_;               =
  \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/disk-io.c:1663:2: note: Loop condition is true.  Entering loop =
body
           while (1) {
           ^
   fs/btrfs/disk-io.c:1669:3: note: Taking true branch
                   if (btrfs_need_cleaner_sleep(fs_info))
                   ^
   fs/btrfs/disk-io.c:1670:4: note: Control jumps to line 1719
                           goto sleep;
                           ^
   fs/btrfs/disk-io.c:1720:7: note: Assuming the condition is false
                   if (kthread_should_park())
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:1720:3: note: Taking false branch
                   if (kthread_should_park())
                   ^
   fs/btrfs/disk-io.c:1722:7: note: Assuming the condition is false
                   if (kthread_should_stop())
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:1722:3: note: Taking false branch
                   if (kthread_should_stop())
                   ^
   fs/btrfs/disk-io.c:1724:8: note: 'again' is 0
                   if (!again) {
                        ^~~~~
   fs/btrfs/disk-io.c:1724:3: note: Taking true branch
                   if (!again) {
                   ^
   fs/btrfs/disk-io.c:1725:4: note: Dereference of null pointer
                           set_current_state(TASK_INTERRUPTIBLE);
                           ^
   include/linux/sched.h:209:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:137:3: note: expanded from macro 'debug_normal_sta=
te_change'
                   current->task_state_change =3D _THIS_IP_;               =
  \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/disk-io.c:4568:6: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           if (current->flags & PF_MEMALLOC)
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/btrfs/disk-io.c:4589:2: note: Calling '__btrfs_btree_balance_dirty'
           __btrfs_btree_balance_dirty(fs_info, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:4568:6: note: Dereference of null pointer
           if (current->flags & PF_MEMALLOC)
               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)

vim +648 fs/btrfs/disk-io.c

ce9adaa5a792c2 Chris Mason       2008-04-09  634  =

444caad1964c7e Christoph Hellwig 2022-08-24  635  int btree_csum_one_bio(st=
ruct btrfs_bio *bbio)
44b8bd7edda4f6 Chris Mason       2008-04-16  636  {
444caad1964c7e Christoph Hellwig 2022-08-24  637  	struct btrfs_fs_info *fs=
_info =3D btrfs_sb(bbio->inode->i_sb);
444caad1964c7e Christoph Hellwig 2022-08-24  638  	struct bvec_iter iter;
444caad1964c7e Christoph Hellwig 2022-08-24  639  	struct bio_vec bvec;
444caad1964c7e Christoph Hellwig 2022-08-24  640  	int ret;
ce3ed71a580945 Chris Mason       2008-09-23  641  =

444caad1964c7e Christoph Hellwig 2022-08-24  642  	bio_for_each_segment(bve=
c, &bbio->bio, iter) {
444caad1964c7e Christoph Hellwig 2022-08-24  643  		ret =3D csum_dirty_buff=
er(fs_info, &bvec);
79787eaab46121 Jeff Mahoney      2012-03-12  644  		if (ret)
79787eaab46121 Jeff Mahoney      2012-03-12  645  			break;
ce3ed71a580945 Chris Mason       2008-09-23  646  	}
2c30c71bd653af Kent Overstreet   2013-11-07  647  =

444caad1964c7e Christoph Hellwig 2022-08-24 @648  	return ret;
de0022b9da616b Josef Bacik       2012-09-25  649  }
de0022b9da616b Josef Bacik       2012-09-25  650  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0621528005305593571==--

