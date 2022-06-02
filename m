Content-Type: multipart/mixed; boundary="===============1820911302307581905=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_ptp.c:109:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 02 Jun 2022 15:33:33 +0800
Message-ID: <202206021535.sYPEI5L1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1820911302307581905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/ethernet/intel/ice/ice_ptp.c:109:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jacob Keller <jacob.e.keller@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d1dc87763f406d4e67caf16dbe438a5647692395
commit: 67569a7f940130fcfe9041e07a614a5263a9944d ice: report the PTP clock =
index in ethtool .get_ts_info
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220524 (https://download.01.org/0day-ci/arch=
ive/20220602/202206021535.sYPEI5L1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D67569a7f940130fcfe9041e07a614a5263a9944d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 67569a7f940130fcfe9041e07a614a5263a9944d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/ata/libata-eh.c:530:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(host->host_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/ata/libata-eh.c:538:2: note: Calling 'ata_scsi_port_error_handle=
r'
           ata_scsi_port_error_handler(host, ap);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:654:6: note: Assuming field 'error_handler' is n=
on-null
           if (ap->ops->error_handler) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:654:2: note: Taking true branch
           if (ap->ops->error_handler) {
           ^
   drivers/ata/libata-eh.c:658:3: note: Calling 'ata_eh_acquire'
                   ata_eh_acquire(ap);
                   ^~~~~~~~~~~~~~~~~~
   drivers/ata/libata-eh.c:464:2: note: Assuming field 'eh_owner' is null
           WARN_ON_ONCE(ap->host->eh_owner);
           ^
   include/asm-generic/bug.h:102:23: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                ^~~~~~~~~~~~
   drivers/ata/libata-eh.c:464:2: note: Taking false branch
           WARN_ON_ONCE(ap->host->eh_owner);
           ^
   include/asm-generic/bug.h:103:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   drivers/ata/libata-eh.c:465:23: note: Dereference of null pointer
           ap->host->eh_owner =3D current;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/ata/libata-eh.c:480:37: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           WARN_ON_ONCE(ap->host->eh_owner !=3D current);
                                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:102:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   drivers/ata/libata-eh.c:480:37: note: Dereference of null pointer
           WARN_ON_ONCE(ap->host->eh_owner !=3D current);
                                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:102:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   drivers/ata/libata-eh.c:777:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
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
   29 warnings generated.
>> drivers/net/ethernet/intel/ice/ice_ptp.c:109:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_ptp.c:109:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   include/linux/time64.h:67:50: warning: The left operand of '+' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           set_normalized_timespec64(&ts_delta, lhs.tv_sec + rhs.tv_sec,
                                                           ^
   drivers/net/ethernet/intel/ice/ice_ptp.c:358:22: note: Left side of '&&'=
 is false
           struct ice_pf *pf =3D ptp_info_to_pf(info);
                               ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:24:15: note: expanded from macr=
o 'ptp_info_to_pf'
           container_of(__ptp_info_to_ptp((i)), struct ice_pf, ptp)
                        ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:22:2: note: expanded from macro=
 '__ptp_info_to_ptp'
           container_of((i), struct ice_ptp, info)
           ^
   include/linux/kernel.h:716:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/ethernet/intel/ice/ice_ptp.c:358:22: note: Taking false bran=
ch
           struct ice_pf *pf =3D ptp_info_to_pf(info);
                               ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:24:15: note: expanded from macr=
o 'ptp_info_to_pf'
           container_of(__ptp_info_to_ptp((i)), struct ice_pf, ptp)
                        ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:22:2: note: expanded from macro=
 '__ptp_info_to_ptp'
           container_of((i), struct ice_ptp, info)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
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
   drivers/net/ethernet/intel/ice/ice_ptp.c:358:22: note: Loop condition is=
 false.  Exiting loop
           struct ice_pf *pf =3D ptp_info_to_pf(info);
                               ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:24:15: note: expanded from macr=
o 'ptp_info_to_pf'
           container_of(__ptp_info_to_ptp((i)), struct ice_pf, ptp)
                        ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:22:2: note: expanded from macro=
 '__ptp_info_to_ptp'
           container_of((i), struct ice_ptp, info)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
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
   drivers/net/ethernet/intel/ice/ice_ptp.c:358:22: note: Left side of '&&'=
 is false
           struct ice_pf *pf =3D ptp_info_to_pf(info);
                               ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:24:2: note: expanded from macro=
 'ptp_info_to_pf'
           container_of(__ptp_info_to_ptp((i)), struct ice_pf, ptp)
           ^
   include/linux/kernel.h:716:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/ethernet/intel/ice/ice_ptp.c:358:22: note: Taking false bran=
ch
           struct ice_pf *pf =3D ptp_info_to_pf(info);
                               ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:24:2: note: expanded from macro=
 'ptp_info_to_pf'
           container_of(__ptp_info_to_ptp((i)), struct ice_pf, ptp)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
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
   drivers/net/ethernet/intel/ice/ice_ptp.c:358:22: note: Loop condition is=
 false.  Exiting loop
           struct ice_pf *pf =3D ptp_info_to_pf(info);
                               ^
   drivers/net/ethernet/intel/ice/ice_ptp.h:24:2: note: expanded from macro=
 'ptp_info_to_pf'
           container_of(__ptp_info_to_ptp((i)), struct ice_pf, ptp)
           ^

vim +/dev +109 drivers/net/ethernet/intel/ice/ice_ptp.c

67569a7f940130 Jacob Keller 2021-06-09   98  =

67569a7f940130 Jacob Keller 2021-06-09   99  /**
67569a7f940130 Jacob Keller 2021-06-09  100   * ice_clear_ptp_clock_index -=
 Clear the PTP clock index
67569a7f940130 Jacob Keller 2021-06-09  101   * @pf: the PF pointer
67569a7f940130 Jacob Keller 2021-06-09  102   *
67569a7f940130 Jacob Keller 2021-06-09  103   * Clear the PTP clock index f=
or this device. Must be called when
67569a7f940130 Jacob Keller 2021-06-09  104   * unregistering the PTP clock=
, in order to ensure other PFs stop reporting
67569a7f940130 Jacob Keller 2021-06-09  105   * a clock object that no long=
er exists.
67569a7f940130 Jacob Keller 2021-06-09  106   */
67569a7f940130 Jacob Keller 2021-06-09  107  static void ice_clear_ptp_cloc=
k_index(struct ice_pf *pf)
67569a7f940130 Jacob Keller 2021-06-09  108  {
67569a7f940130 Jacob Keller 2021-06-09 @109  	struct device *dev =3D ice_pf=
_to_dev(pf);
67569a7f940130 Jacob Keller 2021-06-09  110  	enum ice_aqc_driver_params pa=
ram_idx;
67569a7f940130 Jacob Keller 2021-06-09  111  	struct ice_hw *hw =3D &pf->hw;
67569a7f940130 Jacob Keller 2021-06-09  112  	u8 tmr_idx;
67569a7f940130 Jacob Keller 2021-06-09  113  	int err;
67569a7f940130 Jacob Keller 2021-06-09  114  =

67569a7f940130 Jacob Keller 2021-06-09  115  	/* Do not clear the index if =
we don't own the timer */
67569a7f940130 Jacob Keller 2021-06-09  116  	if (!hw->func_caps.ts_func_in=
fo.src_tmr_owned)
67569a7f940130 Jacob Keller 2021-06-09  117  		return;
67569a7f940130 Jacob Keller 2021-06-09  118  =

67569a7f940130 Jacob Keller 2021-06-09  119  	tmr_idx =3D hw->func_caps.ts_=
func_info.tmr_index_assoc;
67569a7f940130 Jacob Keller 2021-06-09  120  	if (!tmr_idx)
67569a7f940130 Jacob Keller 2021-06-09  121  		param_idx =3D ICE_AQC_DRIVER=
_PARAM_CLK_IDX_TMR0;
67569a7f940130 Jacob Keller 2021-06-09  122  	else
67569a7f940130 Jacob Keller 2021-06-09  123  		param_idx =3D ICE_AQC_DRIVER=
_PARAM_CLK_IDX_TMR1;
67569a7f940130 Jacob Keller 2021-06-09  124  =

67569a7f940130 Jacob Keller 2021-06-09  125  	err =3D ice_aq_set_driver_par=
am(hw, param_idx, 0, NULL);
67569a7f940130 Jacob Keller 2021-06-09  126  	if (err) {
67569a7f940130 Jacob Keller 2021-06-09  127  		dev_dbg(dev, "Failed to clea=
r PTP clock index parameter, err %d aq_err %s\n",
67569a7f940130 Jacob Keller 2021-06-09  128  			err, ice_aq_str(hw->adminq.=
sq_last_status));
67569a7f940130 Jacob Keller 2021-06-09  129  	}
67569a7f940130 Jacob Keller 2021-06-09  130  }
67569a7f940130 Jacob Keller 2021-06-09  131  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1820911302307581905==--

