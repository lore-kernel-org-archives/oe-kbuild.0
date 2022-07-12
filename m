Content-Type: multipart/mixed; boundary="===============5203614858231168381=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 01/36] target: Handle MI_REPORT_SUPPORTED_OPERATION_CODES
Date: Tue, 12 Jul 2022 10:05:55 +0800
Message-ID: <202207120920.oEIle78M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5203614858231168381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
arget/target_core_alua.c:323:9: warning: Array access (from variable 'buf')=
 results in an undefined pointer dereference [clang-analyzer-core.NullDeref=
erence]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <118900ffaf094a279f7799ac9d2c73265c889121.1657149962.git.Thinh=
.Nguyen@synopsys.com>
References: <118900ffaf094a279f7799ac9d2c73265c889121.1657149962.git.Thinh.=
Nguyen@synopsys.com>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: linux-scsi(a)vger.kernel.org
TO: target-devel(a)vger.kernel.org
TO: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: John Youn <John.Youn@synopsys.com>
CC: Felipe Balbi <balbi@kernel.org>
CC: Greg KH <greg@kroah.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: linux-usb(a)vger.kernel.org

Hi Thinh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 90557fa89d3e99286506593fd5180f699c41b152]

url:    https://github.com/intel-lab-lkp/linux/commits/Thinh-Nguyen/usb-gad=
get-f_tcm-Enhance-UASP-driver/20220707-074014
base:   90557fa89d3e99286506593fd5180f699c41b152
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: s390-randconfig-c005-20220710 (https://download.01.org/0day-ci/arch=
ive/20220712/202207120920.oEIle78M-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e=
267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9a7c7d74b2c2d3c8524=
342cb0278ab8b77714bad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thinh-Nguyen/usb-gadget-f_tcm-Enha=
nce-UASP-driver/20220707-074014
        git checkout 9a7c7d74b2c2d3c8524342cb0278ab8b77714bad
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   fs/ntfs3/file.c:906:2: note: Taking false branch
           if (!pages)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs3/file.c:909:2: note: Dereference of null pointer
           current->backing_dev_info =3D inode_to_bdi(inode);
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ntfs3/file.c:992:3: warning: Value stored to 'frame' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   frame =3D pos >> frame_bits;
                   ^       ~~~~~~~~~~~~~~~~~
   fs/ntfs3/file.c:992:3: note: Value stored to 'frame' is never read
                   frame =3D pos >> frame_bits;
                   ^       ~~~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (36 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   drivers/target/target_core_alua.c:1910:2: note: Calling 'spin_lock'
           spin_lock(&lun->lun_tg_pt_gp_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:349:2: note: Calling '__raw_spin_lock'
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:215:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:47:30: note: expanded from macro '_raw_=
spin_lock'
   #define _raw_spin_lock(lock) __raw_spin_lock(lock)
                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:133:2: note: Loop condition is false.  =
Exiting loop
           spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
           ^
   include/linux/lockdep.h:522:35: note: expanded from macro 'spin_acquire'
   #define spin_acquire(l, s, t, i)                lock_acquire_exclusive(l=
, s, t, NULL, i)
                                                   ^
   include/linux/lockdep.h:518:48: note: expanded from macro 'lock_acquire_=
exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, =
s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:356:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:134:44: note: Calling 'do_raw_spin_lock'
           LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
                                                     ^
   include/linux/lockdep.h:477:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:185:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_=
once'
           if (!arch_spin_trylock_once(lp))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
>> drivers/target/target_core_alua.c:323:9: warning: Array access (from var=
iable 'buf') results in an undefined pointer dereference [clang-analyzer-co=
re.NullDereference]
           buf[1] =3D supported;
           ~~~    ^
   drivers/target/target_core_alua.c:271:2: note: 'buf' declared without an=
 initial value
           unsigned char *buf;
           ^~~~~~~~~~~~~~~~~~
   drivers/target/target_core_alua.c:274:6: note: Assuming the condition is=
 true
           if (cdb[2] !=3D 1) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/target/target_core_alua.c:274:2: note: '?' condition is false
           if (cdb[2] !=3D 1) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/target/target_core_alua.c:274:2: note: '?' condition is true
           if (cdb[2] !=3D 1) {
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
   drivers/target/target_core_alua.c:274:2: note: Taking true branch
           if (cdb[2] !=3D 1) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/target/target_core_alua.c:275:3: note: Left side of '&&' is true
                   pr_warn("Invalid command format %d\n", cdb[2]);
                   ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:388:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/target/target_core_alua.c:275:3: note: '?' condition is true
                   pr_warn("Invalid command format %d\n", cdb[2]);
                   ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:388:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/target/target_core_alua.c:275:3: note: Left side of '&&' is true
                   pr_warn("Invalid command format %d\n", cdb[2]);
                   ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:388:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/target/target_core_alua.c:275:3: note: Taking true branch
                   pr_warn("Invalid command format %d\n", cdb[2]);
                   ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)

vim +/buf +323 drivers/target/target_core_alua.c

c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  261  =

9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  262  /*
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  263   * REPORT_SUPPORTED_OPER=
ATION_CODES
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  264   *
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  265   * See spc4r17 section 6=
.27
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  266   */
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  267  sense_reason_t
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  268  target_emulate_report_su=
pported_opcodes(struct se_cmd *cmd)
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  269  {
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  270  	unsigned char *cdb =3D =
cmd->t_task_cdb;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  271  	unsigned char *buf;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  272  	u8 supported =3D 0;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  273  =

9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  274  	if (cdb[2] !=3D 1) {
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  275  		pr_warn("Invalid comma=
nd format %d\n", cdb[2]);
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  276  		goto out;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  277  	}
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  278  =

9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  279  	buf =3D transport_kmap_=
data_sg(cmd);
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  280  	if (!buf)
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  281  		return TCM_LOGICAL_UNI=
T_COMMUNICATION_FAILURE;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  282  =

9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  283  	switch (cdb[3]) {
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  284  	case INQUIRY:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  285  	case MODE_SENSE:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  286  	case MODE_SENSE_10:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  287  	case READ_CAPACITY:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  288  	case SERVICE_ACTION_IN_=
16:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  289  	case REPORT_LUNS:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  290  	case REQUEST_SENSE:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  291  	case SYNCHRONIZE_CACHE:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  292  	case REZERO_UNIT:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  293  	case SEEK_6:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  294  	case SEEK_10:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  295  	case TEST_UNIT_READY:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  296  	case SEND_DIAGNOSTIC:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  297  	case MAINTENANCE_IN:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  298  	case READ_6:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  299  	case READ_10:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  300  	case READ_16:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  301  	case WRITE_6:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  302  	case WRITE_10:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  303  	case WRITE_16:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  304  	case VERIFY_16:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  305  	case MODE_SELECT:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  306  	case MODE_SELECT_10:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  307  	case START_STOP:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  308  	case SECURITY_PROTOCOL_=
IN:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  309  	case SECURITY_PROTOCOL_=
OUT:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  310  		supported =3D 3;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  311  		break;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  312  	case ATA_12:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  313  	case ATA_16:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  314  	case VERIFY:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  315  	case ZBC_IN:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  316  	case ZBC_OUT:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  317  	default:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  318  		break;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  319  	}
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  320  =

9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  321  	transport_kunmap_data_s=
g(cmd);
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  322  out:
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06 @323  	buf[1] =3D supported;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  324  	target_complete_cmd(cmd=
, SAM_STAT_GOOD);
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  325  	return 0;
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  326  }
9a7c7d74b2c2d3 Thinh Nguyen       2022-07-06  327  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5203614858231168381==--

