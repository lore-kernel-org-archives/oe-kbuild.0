Content-Type: multipart/mixed; boundary="===============5004307806950862719=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_ptp.c:109:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 03 Jun 2022 00:16:24 +0800
Message-ID: <202206030022.cznYNbE1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5004307806950862719==
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
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220524 (https://download.01.org/0day-ci/arch=
ive/20220603/202206030022.cznYNbE1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
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
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/md/dm-snap-persistent.c:632:6: warning: Branch condition evaluat=
es to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (new_snapshot) {
               ^~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:609:9: note: 'new_snapshot' declared wit=
hout an initial value
           int r, new_snapshot;
                  ^~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:615:6: note: Calling 'read_header'
           r =3D read_header(ps, &new_snapshot);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:315:6: note: Assuming field 'chunk_size'=
 is not equal to 0
           if (!ps->store->chunk_size) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:315:2: note: Taking false branch
           if (!ps->store->chunk_size) {
           ^
   drivers/md/dm-snap-persistent.c:325:2: note: Taking true branch
           if (IS_ERR(ps->io_client))
           ^
   drivers/md/dm-snap-persistent.c:326:3: note: Returning without writing t=
o 'ps->callbacks', which participates in a condition later
                   return PTR_ERR(ps->io_client);
                   ^
   drivers/md/dm-snap-persistent.c:326:3: note: Returning without writing t=
o '*new_snapshot'
   drivers/md/dm-snap-persistent.c:326:3: note: Returning value, which part=
icipates in a condition later
                   return PTR_ERR(ps->io_client);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:615:6: note: Returning from 'read_header'
           r =3D read_header(ps, &new_snapshot);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:616:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/md/dm-snap-persistent.c:616:2: note: Taking false branch
           if (r)
           ^
   drivers/md/dm-snap-persistent.c:624:18: note: Calling 'kvcalloc'
           ps->callbacks =3D kvcalloc(ps->exceptions_per_area,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:827:9: note: Calling 'kvmalloc_array'
           return kvmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:819:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/mm.h:822:2: note: Returning pointer, which participates in=
 a condition later
           return kvmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:827:9: note: Returning from 'kvmalloc_array'
           return kvmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:827:2: note: Returning pointer, which participates in=
 a condition later
           return kvmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:624:18: note: Returning from 'kvcalloc'
           ps->callbacks =3D kvcalloc(ps->exceptions_per_area,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:626:6: note: Assuming field 'callbacks' =
is non-null
           if (!ps->callbacks)
               ^~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:626:2: note: Taking false branch
           if (!ps->callbacks)
           ^
   drivers/md/dm-snap-persistent.c:632:6: note: Branch condition evaluates =
to a garbage value
           if (new_snapshot) {
               ^~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
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
--===============5004307806950862719==--

