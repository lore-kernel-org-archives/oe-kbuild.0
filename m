Content-Type: multipart/mixed; boundary="===============7167415937466665189=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9748/9999] drivers/net/wireless/ath/ath11k/core.c:1364:3: warning: Value stored to 'fail_cont_count' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 23 Feb 2022 15:23:35 +0800
Message-ID: <202202231504.K56Ll89h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7167415937466665189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   e9d25e91a257da70c77f1f4b8397a82fe5ba2298
commit: da4be8dec6ed58e488189c2d7e13da7509552bb1 [9748/9999] BACKPORT: FROM=
LIST: ath11k: add support for device recovery for QCA6390/WCN6855
:::::: branch date: 8 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20223/202202231504.K56Ll89h-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout da4be8dec6ed58e488189c2d7e13da7509552bb1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:743:6: note: Returning from 'IS_ERR'
           if (IS_ERR(spdif->clk_sys)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:743:2: note: Taking false branch
           if (IS_ERR(spdif->clk_sys)) {
           ^
   sound/soc/img/img-spdif-in.c:750:7: note: Calling 'pm_runtime_enabled'
           if (!pm_runtime_enabled(&pdev->dev)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_runtime.h:173:9: note: Assuming field 'disable_depth' i=
s 0, which participates in a condition later
           return !dev->power.disable_depth;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_runtime.h:173:2: note: Returning without writing to 'de=
v->power.disable_depth', which participates in a condition later
           return !dev->power.disable_depth;
           ^
   include/linux/pm_runtime.h:173:2: note: Returning the value 1, which par=
ticipates in a condition later
           return !dev->power.disable_depth;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:750:7: note: Returning from 'pm_runtime_ena=
bled'
           if (!pm_runtime_enabled(&pdev->dev)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:750:2: note: Taking false branch
           if (!pm_runtime_enabled(&pdev->dev)) {
           ^
   sound/soc/img/img-spdif-in.c:756:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   sound/soc/img/img-spdif-in.c:756:2: note: Taking false branch
           if (ret < 0) {
           ^
   sound/soc/img/img-spdif-in.c:762:6: note: Calling 'IS_ERR'
           if (IS_ERR(rst)) {
               ^~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:762:6: note: Returning from 'IS_ERR'
           if (IS_ERR(rst)) {
               ^~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:762:2: note: Taking true branch
           if (IS_ERR(rst)) {
           ^
   sound/soc/img/img-spdif-in.c:763:3: note: Taking false branch
                   if (PTR_ERR(rst) =3D=3D -EPROBE_DEFER) {
                   ^
   sound/soc/img/img-spdif-in.c:767:3: note: Taking false branch
                   dev_dbg(dev, "No top level reset found\n");
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/img/img-spdif-in.c:768:3: note: Calling 'img_spdif_in_writel'
                   img_spdif_in_writel(spdif, IMG_SPDIF_IN_SOFT_RESET_MASK,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:117:1: note: Returning without writing to '=
spdif->lock_release'
   }
   ^
   sound/soc/img/img-spdif-in.c:768:3: note: Returning from 'img_spdif_in_w=
ritel'
                   img_spdif_in_writel(spdif, IMG_SPDIF_IN_SOFT_RESET_MASK,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:770:3: note: Calling 'img_spdif_in_writel'
                   img_spdif_in_writel(spdif, 0, IMG_SPDIF_IN_SOFT_RESET);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:117:1: note: Returning without writing to '=
spdif->lock_release'
   }
   ^
   sound/soc/img/img-spdif-in.c:770:3: note: Returning from 'img_spdif_in_w=
ritel'
                   img_spdif_in_writel(spdif, 0, IMG_SPDIF_IN_SOFT_RESET);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:776:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_init(&spdif->lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   sound/soc/img/img-spdif-in.c:783:2: note: The value -128 is assigned to =
field 'lock_release'
           spdif->lock_release =3D -128;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:787:30: note: The result of the left shift =
is undefined because the left operand is negative
           reg |=3D (spdif->lock_release << IMG_SPDIF_IN_CTL_LOCKLO_SHIFT) &
                   ~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/net/wireless/ath/ath11k/core.c:1364:3: warning: Value stored to =
'fail_cont_count' is never read [clang-analyzer-deadcode.DeadStores]
                   fail_cont_count =3D atomic_inc_return(&ab->fail_cont_cou=
nt);
                   ^
   drivers/net/wireless/ath/ath11k/core.c:1364:3: note: Value stored to 'fa=
il_cont_count' is never read
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/net/wireless/ath/ath11k/wmi.c:947:2: warning: Value stored to 'p=
tr' is never read [clang-analyzer-deadcode.DeadStores]
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:947:2: note: Value stored to 'ptr'=
 is never read
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:6273:7: warning: 2nd function call=
 argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ar =3D ath11k_mac_get_ar_by_vdev_id(ab, peer_del_resp.vdev_id);
                ^
   drivers/net/wireless/ath/ath11k/wmi.c:7358:7: note: Taking false branch
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/wmi.c:7358:7: note: Loop condition is fa=
lse.  Exiting loop
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7358:7: note: Taking false branch
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:48:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/wmi.c:7358:7: note: Loop condition is fa=
lse.  Exiting loop
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:48:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'

vim +/fail_cont_count +1364 drivers/net/wireless/ath/ath11k/core.c

d5c65159f28953 Kalle Valo 2019-11-23  1319  =

da4be8dec6ed58 Wen Gong   2022-02-09  1320  static void ath11k_core_reset(s=
truct work_struct *work)
da4be8dec6ed58 Wen Gong   2022-02-09  1321  {
da4be8dec6ed58 Wen Gong   2022-02-09  1322  	struct ath11k_base *ab =3D con=
tainer_of(work, struct ath11k_base, reset_work);
da4be8dec6ed58 Wen Gong   2022-02-09  1323  	int reset_count, fail_cont_cou=
nt;
da4be8dec6ed58 Wen Gong   2022-02-09  1324  	long time_left;
da4be8dec6ed58 Wen Gong   2022-02-09  1325  =

da4be8dec6ed58 Wen Gong   2022-02-09  1326  	if (!(test_bit(ATH11K_FLAG_REG=
ISTERED, &ab->dev_flags))) {
da4be8dec6ed58 Wen Gong   2022-02-09  1327  		ath11k_warn(ab, "ignore reset=
 dev flags 0x%lx\n", ab->dev_flags);
da4be8dec6ed58 Wen Gong   2022-02-09  1328  		return;
da4be8dec6ed58 Wen Gong   2022-02-09  1329  	}
da4be8dec6ed58 Wen Gong   2022-02-09  1330  =

da4be8dec6ed58 Wen Gong   2022-02-09  1331  	/* Sometimes the recovery will=
 fail and then the next all recovery fail,
da4be8dec6ed58 Wen Gong   2022-02-09  1332  	 * this is to avoid infinite r=
ecovery since it can not recovery success.
da4be8dec6ed58 Wen Gong   2022-02-09  1333  	 */
da4be8dec6ed58 Wen Gong   2022-02-09  1334  	fail_cont_count =3D atomic_rea=
d(&ab->fail_cont_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1335  =

da4be8dec6ed58 Wen Gong   2022-02-09  1336  	if (fail_cont_count >=3D ATH11=
K_RESET_MAX_FAIL_COUNT_FINAL)
da4be8dec6ed58 Wen Gong   2022-02-09  1337  		return;
da4be8dec6ed58 Wen Gong   2022-02-09  1338  =

da4be8dec6ed58 Wen Gong   2022-02-09  1339  	if (fail_cont_count >=3D ATH11=
K_RESET_MAX_FAIL_COUNT_FIRST &&
da4be8dec6ed58 Wen Gong   2022-02-09  1340  	    time_before(jiffies, ab->r=
eset_fail_timeout))
da4be8dec6ed58 Wen Gong   2022-02-09  1341  		return;
da4be8dec6ed58 Wen Gong   2022-02-09  1342  =

da4be8dec6ed58 Wen Gong   2022-02-09  1343  	reset_count =3D atomic_inc_ret=
urn(&ab->reset_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1344  =

da4be8dec6ed58 Wen Gong   2022-02-09  1345  	if (reset_count > 1) {
da4be8dec6ed58 Wen Gong   2022-02-09  1346  		/* Sometimes it happened anot=
her reset worker before the previous one
da4be8dec6ed58 Wen Gong   2022-02-09  1347  		 * completed, then the second=
 reset worker will destroy the previous one,
da4be8dec6ed58 Wen Gong   2022-02-09  1348  		 * thus below is to avoid tha=
t.
da4be8dec6ed58 Wen Gong   2022-02-09  1349  		 */
da4be8dec6ed58 Wen Gong   2022-02-09  1350  		ath11k_warn(ab, "already rese=
ting count %d\n", reset_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1351  =

da4be8dec6ed58 Wen Gong   2022-02-09  1352  		reinit_completion(&ab->reset_=
complete);
da4be8dec6ed58 Wen Gong   2022-02-09  1353  		time_left =3D wait_for_comple=
tion_timeout(&ab->reset_complete,
da4be8dec6ed58 Wen Gong   2022-02-09  1354  							ATH11K_RESET_TIMEOUT_HZ);
da4be8dec6ed58 Wen Gong   2022-02-09  1355  =

da4be8dec6ed58 Wen Gong   2022-02-09  1356  		if (time_left) {
da4be8dec6ed58 Wen Gong   2022-02-09  1357  			ath11k_dbg(ab, ATH11K_DBG_BO=
OT, "to skip reset\n");
da4be8dec6ed58 Wen Gong   2022-02-09  1358  			atomic_dec(&ab->reset_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1359  			return;
da4be8dec6ed58 Wen Gong   2022-02-09  1360  		}
da4be8dec6ed58 Wen Gong   2022-02-09  1361  =

da4be8dec6ed58 Wen Gong   2022-02-09  1362  		ab->reset_fail_timeout =3D ji=
ffies + ATH11K_RESET_FAIL_TIMEOUT_HZ;
da4be8dec6ed58 Wen Gong   2022-02-09  1363  		/* Record the continuous reco=
very fail count when recovery failed*/
da4be8dec6ed58 Wen Gong   2022-02-09 @1364  		fail_cont_count =3D atomic_in=
c_return(&ab->fail_cont_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1365  	}
da4be8dec6ed58 Wen Gong   2022-02-09  1366  =

da4be8dec6ed58 Wen Gong   2022-02-09  1367  	ath11k_dbg(ab, ATH11K_DBG_BOOT=
, "reset starting\n");
da4be8dec6ed58 Wen Gong   2022-02-09  1368  =

da4be8dec6ed58 Wen Gong   2022-02-09  1369  	ab->is_reset =3D true;
da4be8dec6ed58 Wen Gong   2022-02-09  1370  	atomic_set(&ab->recovery_count=
, 0);
da4be8dec6ed58 Wen Gong   2022-02-09  1371  =

da4be8dec6ed58 Wen Gong   2022-02-09  1372  	ath11k_hif_power_down(ab);
da4be8dec6ed58 Wen Gong   2022-02-09  1373  	ath11k_qmi_free_resource(ab);
da4be8dec6ed58 Wen Gong   2022-02-09  1374  	ath11k_hif_power_up(ab);
da4be8dec6ed58 Wen Gong   2022-02-09  1375  =

da4be8dec6ed58 Wen Gong   2022-02-09  1376  	ath11k_dbg(ab, ATH11K_DBG_BOOT=
, "reset started\n");
da4be8dec6ed58 Wen Gong   2022-02-09  1377  }
da4be8dec6ed58 Wen Gong   2022-02-09  1378  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7167415937466665189==--

