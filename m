Content-Type: multipart/mixed; boundary="===============6586418169265641377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_ptp.c:109:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 26 May 2022 13:18:17 +0800
Message-ID: <202205261324.92r8ipTC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6586418169265641377==
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
head:   d7227785e384d4422b3ca189aa5bf19f462337cc
commit: 67569a7f940130fcfe9041e07a614a5263a9944d ice: report the PTP clock =
index in ethtool .get_ts_info
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220524 (https://download.01.org/0day-ci/arch=
ive/20220526/202205261324.92r8ipTC-lkp(a)intel.com/config)
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
   arch/s390/include/asm/pci_io.h:76:2: note: Control jumps to 'case 1:'  a=
t line 77
           switch (len) {
           ^
   arch/s390/include/asm/pci_io.h:79:3: note:  Execution continues on line =
93
                   break;
                   ^
   arch/s390/include/asm/pci_io.h:93:2: note: Returning value, which partic=
ipates in a condition later
           return zpci_store(dst, val, len);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:174:9: note: Returning from 'zpci_write_s=
ingle'
                           rc =3D zpci_write_single(dst, src, size);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:175:7: note: Assuming 'rc' is 0
                   if (rc)
                       ^~
   arch/s390/include/asm/pci_io.h:175:3: note: Taking false branch
                   if (rc)
                   ^
   arch/s390/include/asm/pci_io.h:167:2: note: Loop condition is true.  Ent=
ering loop body
           while (n > 0) {
           ^
   arch/s390/include/asm/pci_io.h:168:10: note: Calling 'zpci_get_max_write=
_size'
                   size =3D zpci_get_max_write_size((u64 __force) dst,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:129:14: note: 'len' is <=3D 'max'
           int count =3D len > max ? max : len, size =3D 1;
                       ^~~
   arch/s390/include/asm/pci_io.h:129:14: note: '?' condition is false
   arch/s390/include/asm/pci_io.h:131:9: note: Assuming the condition is tr=
ue
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                  ^~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:131:9: note: Left side of '&&' is true
   arch/s390/include/asm/pci_io.h:131:25: note: Assuming the condition is t=
rue
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                                  ^~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:131:9: note: Left side of '&&' is true
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                  ^
   arch/s390/include/asm/pci_io.h:131:2: note: Loop condition is true.  Ent=
ering loop body
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
           ^
   arch/s390/include/asm/pci_io.h:131:9: note: Assuming the condition is tr=
ue
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                  ^~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:131:9: note: Left side of '&&' is true
   arch/s390/include/asm/pci_io.h:131:25: note: Assuming the condition is t=
rue
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                                  ^~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:131:9: note: Left side of '&&' is true
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                  ^
   arch/s390/include/asm/pci_io.h:131:2: note: Loop condition is true.  Ent=
ering loop body
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
           ^
   arch/s390/include/asm/pci_io.h:131:9: note: Assuming the condition is tr=
ue
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                  ^~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:131:9: note: Left side of '&&' is true
   arch/s390/include/asm/pci_io.h:131:25: note: Assuming the condition is t=
rue
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                                  ^~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:131:9: note: Left side of '&&' is true
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                  ^
   arch/s390/include/asm/pci_io.h:131:2: note: Loop condition is true.  Ent=
ering loop body
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
           ^
   arch/s390/include/asm/pci_io.h:131:9: note: Assuming the condition is fa=
lse
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                  ^~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:131:22: note: Left side of '&&' is false
           while (!(src & 0x1) && !(dst & 0x1) && ((size << 1) <=3D count))=
 {
                               ^
   arch/s390/include/asm/pci_io.h:136:2: note: Returning the value 8 (loade=
d from 'size'), which participates in a condition later
           return size;
           ^~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:168:10: note: Returning from 'zpci_get_ma=
x_write_size'
                   size =3D zpci_get_max_write_size((u64 __force) dst,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:171:7: note: 'size' is <=3D 8
                   if (size > 8) /* main path */
                       ^~~~
   arch/s390/include/asm/pci_io.h:171:3: note: Taking false branch
                   if (size > 8) /* main path */
                   ^
   arch/s390/include/asm/pci_io.h:174:9: note: Calling 'zpci_write_single'
                           rc =3D zpci_write_single(dst, src, size);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pci_io.h:76:2: note: Control jumps to 'case 8:'  a=
t line 86
           switch (len) {
           ^
   arch/s390/include/asm/pci_io.h:87:7: note: Assigned value is garbage or =
undefined
                   val =3D (u64) *((u64 *) src);
                       ^ ~~~~~~~~~~~~~~~~~~~~
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
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

67569a7f940130f Jacob Keller 2021-06-09   98  =

67569a7f940130f Jacob Keller 2021-06-09   99  /**
67569a7f940130f Jacob Keller 2021-06-09  100   * ice_clear_ptp_clock_index =
- Clear the PTP clock index
67569a7f940130f Jacob Keller 2021-06-09  101   * @pf: the PF pointer
67569a7f940130f Jacob Keller 2021-06-09  102   *
67569a7f940130f Jacob Keller 2021-06-09  103   * Clear the PTP clock index =
for this device. Must be called when
67569a7f940130f Jacob Keller 2021-06-09  104   * unregistering the PTP cloc=
k, in order to ensure other PFs stop reporting
67569a7f940130f Jacob Keller 2021-06-09  105   * a clock object that no lon=
ger exists.
67569a7f940130f Jacob Keller 2021-06-09  106   */
67569a7f940130f Jacob Keller 2021-06-09  107  static void ice_clear_ptp_clo=
ck_index(struct ice_pf *pf)
67569a7f940130f Jacob Keller 2021-06-09  108  {
67569a7f940130f Jacob Keller 2021-06-09 @109  	struct device *dev =3D ice_p=
f_to_dev(pf);
67569a7f940130f Jacob Keller 2021-06-09  110  	enum ice_aqc_driver_params p=
aram_idx;
67569a7f940130f Jacob Keller 2021-06-09  111  	struct ice_hw *hw =3D &pf->h=
w;
67569a7f940130f Jacob Keller 2021-06-09  112  	u8 tmr_idx;
67569a7f940130f Jacob Keller 2021-06-09  113  	int err;
67569a7f940130f Jacob Keller 2021-06-09  114  =

67569a7f940130f Jacob Keller 2021-06-09  115  	/* Do not clear the index if=
 we don't own the timer */
67569a7f940130f Jacob Keller 2021-06-09  116  	if (!hw->func_caps.ts_func_i=
nfo.src_tmr_owned)
67569a7f940130f Jacob Keller 2021-06-09  117  		return;
67569a7f940130f Jacob Keller 2021-06-09  118  =

67569a7f940130f Jacob Keller 2021-06-09  119  	tmr_idx =3D hw->func_caps.ts=
_func_info.tmr_index_assoc;
67569a7f940130f Jacob Keller 2021-06-09  120  	if (!tmr_idx)
67569a7f940130f Jacob Keller 2021-06-09  121  		param_idx =3D ICE_AQC_DRIVE=
R_PARAM_CLK_IDX_TMR0;
67569a7f940130f Jacob Keller 2021-06-09  122  	else
67569a7f940130f Jacob Keller 2021-06-09  123  		param_idx =3D ICE_AQC_DRIVE=
R_PARAM_CLK_IDX_TMR1;
67569a7f940130f Jacob Keller 2021-06-09  124  =

67569a7f940130f Jacob Keller 2021-06-09  125  	err =3D ice_aq_set_driver_pa=
ram(hw, param_idx, 0, NULL);
67569a7f940130f Jacob Keller 2021-06-09  126  	if (err) {
67569a7f940130f Jacob Keller 2021-06-09  127  		dev_dbg(dev, "Failed to cle=
ar PTP clock index parameter, err %d aq_err %s\n",
67569a7f940130f Jacob Keller 2021-06-09  128  			err, ice_aq_str(hw->adminq=
.sq_last_status));
67569a7f940130f Jacob Keller 2021-06-09  129  	}
67569a7f940130f Jacob Keller 2021-06-09  130  }
67569a7f940130f Jacob Keller 2021-06-09  131  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6586418169265641377==--

