Content-Type: multipart/mixed; boundary="===============4019567680538318600=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 4/5] ath11k: add support for device recovery for QCA6390/WCN6855
Date: Thu, 10 Feb 2022 18:22:41 +0800
Message-ID: <202202101840.AalHfv14-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4019567680538318600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220208104947.25791-5-quic_wgong@quicinc.com>
References: <20220208104947.25791-5-quic_wgong@quicinc.com>
TO: Wen Gong <quic_wgong@quicinc.com>

Hi Wen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 76680d49b5e0e661bc4abcdaf13fb7e124b4ca08]

url:    https://github.com/0day-ci/linux/commits/Wen-Gong/ath11k-add-featur=
e-for-device-recovery/20220208-194321
base:   76680d49b5e0e661bc4abcdaf13fb7e124b4ca08
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20210/202202101840.AalHfv14-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2a8ac8c524013b4d43efd46da=
5c10746f74586b7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Wen-Gong/ath11k-add-feature-for-de=
vice-recovery/20220208-194321
        git checkout 2a8ac8c524013b4d43efd46da5c10746f74586b7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/hid/hid-core.c:1723:3: note: Calling 'hid_output_report'
                   hid_output_report(report, buf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1630:14: note: Field 'id' is <=3D 0
           if (report->id > 0)
                       ^
   drivers/hid/hid-core.c:1630:2: note: Taking false branch
           if (report->id > 0)
           ^
   drivers/hid/hid-core.c:1634:14: note: Assuming 'n' is < field 'maxfield'
           for (n =3D 0; n < report->maxfield; n++)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1634:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < report->maxfield; n++)
           ^
   drivers/hid/hid-core.c:1635:3: note: Calling 'hid_output_field'
                   hid_output_field(report->device, report->field[n], data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1597:2: note: 'size' initialized here
           unsigned size =3D field->report_size;
           ^~~~~~~~~~~~~
   drivers/hid/hid-core.c:1600:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1600:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1601:7: note: Assuming field 'logical_minimum' is=
 < 0
                   if (field->logical_minimum < 0) /* signed values */
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1601:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1602:4: note: Calling 'implement'
                           implement(hid, data, offset + n * size, size,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1421:15: note: Assuming 'n' is <=3D 32
           if (unlikely(n > 32)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/hid/hid-core.c:1421:2: note: Taking false branch
           if (unlikely(n > 32)) {
           ^
   drivers/hid/hid-core.c:1425:13: note: Assuming 'n' is >=3D 32
           } else if (n < 32) {
                      ^~~~~~
   drivers/hid/hid-core.c:1425:9: note: Taking false branch
           } else if (n < 32) {
                  ^
   drivers/hid/hid-core.c:1602:4: note: Returning from 'implement'
                           implement(hid, data, offset + n * size, size,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1600:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1600:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1601:14: note: Field 'logical_minimum' is < 0
                   if (field->logical_minimum < 0) /* signed values */
                              ^
   drivers/hid/hid-core.c:1601:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1603:31: note: Passing the value 32 via 2nd param=
eter 'n'
                                     s32ton(field->value[n], size));
                                                             ^~~~
   drivers/hid/hid-core.c:1603:7: note: Calling 's32ton'
                                     s32ton(field->value[n], size));
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1334:6: note: Assuming 'a' is 0
           if (a && a !=3D -1)
               ^
   drivers/hid/hid-core.c:1334:8: note: Left side of '&&' is false
           if (a && a !=3D -1)
                 ^
   drivers/hid/hid-core.c:1336:21: note: The result of the left shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'int'
           return value & ((1 << n) - 1);
                              ^  ~
   drivers/hid/hid-core.c:1984:3: warning: Value stored to 'len' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   len +=3D sprintf(buf + len, "%shidraw%d", len ? "," : "",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1984:3: note: Value stored to 'len' is never read
                   len +=3D sprintf(buf + len, "%shidraw%d", len ? "," : "",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/net/wireless/ath/ath11k/core.c:1389:3: warning: Value stored to =
'fail_cont_count' is never read [clang-analyzer-deadcode.DeadStores]
                   fail_cont_count =3D atomic_inc_return(&ab->fail_cont_cou=
nt);
                   ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/core.c:1389:3: note: Value stored to 'fa=
il_cont_count' is never read
                   fail_cont_count =3D atomic_inc_return(&ab->fail_cont_cou=
nt);
                   ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/net/wireless/ath/ath11k/wmi.c:953:2: warning: Value stored to 'p=
tr' is never read [clang-analyzer-deadcode.DeadStores]
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:953:2: note: Value stored to 'ptr'=
 is never read
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:6617:7: warning: 2nd function call=
 argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ar =3D ath11k_mac_get_ar_by_vdev_id(ab, peer_del_resp.vdev_id);
                ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Taking false branch
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Loop condition is fa=
lse.  Exiting loop
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Taking false branch
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Loop condition is fa=
lse.  Exiting loop
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)

vim +/fail_cont_count +1389 drivers/net/wireless/ath/ath11k/core.c

d5c65159f28953 Kalle Valo 2019-11-23  1344  =

2a8ac8c524013b Wen Gong   2022-02-08  1345  static void ath11k_core_reset(s=
truct work_struct *work)
2a8ac8c524013b Wen Gong   2022-02-08  1346  {
2a8ac8c524013b Wen Gong   2022-02-08  1347  	struct ath11k_base *ab =3D con=
tainer_of(work, struct ath11k_base, reset_work);
2a8ac8c524013b Wen Gong   2022-02-08  1348  	int reset_count, fail_cont_cou=
nt;
2a8ac8c524013b Wen Gong   2022-02-08  1349  	long time_left;
2a8ac8c524013b Wen Gong   2022-02-08  1350  =

2a8ac8c524013b Wen Gong   2022-02-08  1351  	if (!(test_bit(ATH11K_FLAG_REG=
ISTERED, &ab->dev_flags))) {
2a8ac8c524013b Wen Gong   2022-02-08  1352  		ath11k_warn(ab, "ignore reset=
 dev flags 0x%lx\n", ab->dev_flags);
2a8ac8c524013b Wen Gong   2022-02-08  1353  		return;
2a8ac8c524013b Wen Gong   2022-02-08  1354  	}
2a8ac8c524013b Wen Gong   2022-02-08  1355  =

2a8ac8c524013b Wen Gong   2022-02-08  1356  	/* Sometimes the recovery will=
 fail and then the next all recovery fail,
2a8ac8c524013b Wen Gong   2022-02-08  1357  	 * this is to avoid infinite r=
ecovery since it can not recovery success.
2a8ac8c524013b Wen Gong   2022-02-08  1358  	 */
2a8ac8c524013b Wen Gong   2022-02-08  1359  	fail_cont_count =3D atomic_rea=
d(&ab->fail_cont_count);
2a8ac8c524013b Wen Gong   2022-02-08  1360  =

2a8ac8c524013b Wen Gong   2022-02-08  1361  	if (fail_cont_count >=3D ATH11=
K_RESET_MAX_FAIL_COUNT_FINAL)
2a8ac8c524013b Wen Gong   2022-02-08  1362  		return;
2a8ac8c524013b Wen Gong   2022-02-08  1363  =

2a8ac8c524013b Wen Gong   2022-02-08  1364  	if (fail_cont_count >=3D ATH11=
K_RESET_MAX_FAIL_COUNT_FIRST &&
2a8ac8c524013b Wen Gong   2022-02-08  1365  	    time_before(jiffies, ab->r=
eset_fail_timeout))
2a8ac8c524013b Wen Gong   2022-02-08  1366  		return;
2a8ac8c524013b Wen Gong   2022-02-08  1367  =

2a8ac8c524013b Wen Gong   2022-02-08  1368  	reset_count =3D atomic_inc_ret=
urn(&ab->reset_count);
2a8ac8c524013b Wen Gong   2022-02-08  1369  =

2a8ac8c524013b Wen Gong   2022-02-08  1370  	if (reset_count > 1) {
2a8ac8c524013b Wen Gong   2022-02-08  1371  		/* Sometimes it happened anot=
her reset worker before the previous one
2a8ac8c524013b Wen Gong   2022-02-08  1372  		 * completed, then the second=
 reset worker will destroy the previous one,
2a8ac8c524013b Wen Gong   2022-02-08  1373  		 * thus below is to avoid tha=
t.
2a8ac8c524013b Wen Gong   2022-02-08  1374  		 */
2a8ac8c524013b Wen Gong   2022-02-08  1375  		ath11k_warn(ab, "already rese=
ting count %d\n", reset_count);
2a8ac8c524013b Wen Gong   2022-02-08  1376  =

2a8ac8c524013b Wen Gong   2022-02-08  1377  		reinit_completion(&ab->reset_=
complete);
2a8ac8c524013b Wen Gong   2022-02-08  1378  		time_left =3D wait_for_comple=
tion_timeout(&ab->reset_complete,
2a8ac8c524013b Wen Gong   2022-02-08  1379  							ATH11K_RESET_TIMEOUT_HZ);
2a8ac8c524013b Wen Gong   2022-02-08  1380  =

2a8ac8c524013b Wen Gong   2022-02-08  1381  		if (time_left) {
2a8ac8c524013b Wen Gong   2022-02-08  1382  			ath11k_dbg(ab, ATH11K_DBG_BO=
OT, "to skip reset\n");
2a8ac8c524013b Wen Gong   2022-02-08  1383  			atomic_dec(&ab->reset_count);
2a8ac8c524013b Wen Gong   2022-02-08  1384  			return;
2a8ac8c524013b Wen Gong   2022-02-08  1385  		}
2a8ac8c524013b Wen Gong   2022-02-08  1386  =

2a8ac8c524013b Wen Gong   2022-02-08  1387  		ab->reset_fail_timeout =3D ji=
ffies + ATH11K_RESET_FAIL_TIMEOUT_HZ;
2a8ac8c524013b Wen Gong   2022-02-08  1388  		/* Record the continuous reco=
very fail count when recovery failed*/
2a8ac8c524013b Wen Gong   2022-02-08 @1389  		fail_cont_count =3D atomic_in=
c_return(&ab->fail_cont_count);
2a8ac8c524013b Wen Gong   2022-02-08  1390  	}
2a8ac8c524013b Wen Gong   2022-02-08  1391  =

2a8ac8c524013b Wen Gong   2022-02-08  1392  	ath11k_dbg(ab, ATH11K_DBG_BOOT=
, "reset starting\n");
2a8ac8c524013b Wen Gong   2022-02-08  1393  =

2a8ac8c524013b Wen Gong   2022-02-08  1394  	ab->is_reset =3D true;
2a8ac8c524013b Wen Gong   2022-02-08  1395  	atomic_set(&ab->recovery_count=
, 0);
2a8ac8c524013b Wen Gong   2022-02-08  1396  =

2a8ac8c524013b Wen Gong   2022-02-08  1397  	ath11k_hif_power_down(ab);
2a8ac8c524013b Wen Gong   2022-02-08  1398  	ath11k_qmi_free_resource(ab);
2a8ac8c524013b Wen Gong   2022-02-08  1399  	ath11k_hif_power_up(ab);
2a8ac8c524013b Wen Gong   2022-02-08  1400  =

2a8ac8c524013b Wen Gong   2022-02-08  1401  	ath11k_dbg(ab, ATH11K_DBG_BOOT=
, "reset started\n");
2a8ac8c524013b Wen Gong   2022-02-08  1402  }
2a8ac8c524013b Wen Gong   2022-02-08  1403  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4019567680538318600==--

