Content-Type: multipart/mixed; boundary="===============4435105534179630884=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_ptp.c:109:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 29 May 2022 14:27:50 +0800
Message-ID: <202205291455.l3CbC31D-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4435105534179630884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jacob Keller <jacob.e.keller@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 67569a7f940130fcfe9041e07a614a5263a9944d ice: report the PTP clock =
index in ethtool .get_ts_info
date:   12 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220524 (https://download.01.org/0day-ci/arch=
ive/20220529/202205291455.l3CbC31D-lkp(a)intel.com/config)
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
           if (skb_put_padto(skb, ETH_ZLEN) < 0)
           ^
   drivers/net/ethernet/rdc/r6040.c:803:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&lp->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/net/ethernet/rdc/r6040.c:803:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&lp->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/net/ethernet/rdc/r6040.c:806:6: note: Assuming field 'tx_free_de=
sc' is not equal to 0
           if (!lp->tx_free_desc) {
               ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/rdc/r6040.c:806:2: note: Taking false branch
           if (!lp->tx_free_desc) {
           ^
   drivers/net/ethernet/rdc/r6040.c:825:7: note: Calling 'netdev_xmit_more'
           if (!netdev_xmit_more() || netif_queue_stopped(dev))
                ^~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:4949:9: note: Loop condition is false.  Exitin=
g loop
           return __this_cpu_read(softnet_data.xmit.more);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:4949:9: note: Control jumps to 'case 1:'  at l=
ine 4949
           return __this_cpu_read(softnet_data.xmit.more);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   include/linux/netdevice.h:4949:9: note: Loop condition is false.  Exitin=
g loop
           return __this_cpu_read(softnet_data.xmit.more);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:321:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 1: pscr_ret__ =3D stem##1(variable); break;                =
  \
                                ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:67:3: note: expanded from macro 'raw_cpu_ge=
neric_read'
           *raw_cpu_ptr(&(pcp));                                           \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:4949:9: note: Dereference of null pointer
           return __this_cpu_read(softnet_data.xmit.more);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/percpu-defs.h:321:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 1: pscr_ret__ =3D stem##1(variable); break;                =
  \
                                ^~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:182:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
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
--===============4435105534179630884==--

