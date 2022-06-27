Content-Type: multipart/mixed; boundary="===============8334856737748542130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1575/5720] drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Jun 2022 03:04:30 +0000
Message-ID: <202206252323.qfkP4Oli-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8334856737748542130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
hy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored to 'qmp' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2f9cb3d3bd73fc2225d66aa8fcffb632ed3eb235
commit: 6066bac15bc61ccebb00194e507bbcf6991d2eb1 [1575/5720] phy: qcom-qmp-=
combo: cleanup the driver
:::::: branch date: 32 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220617
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6066bac15bc61ccebb00194e507bbcf6991d2eb1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6066bac15bc61ccebb00194e507bbcf6991d2eb1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/extcon/extcon-fsa9480.c:272:6: note: Assuming 'info' is non-null
           if (!info)
               ^~~~~
   drivers/extcon/extcon-fsa9480.c:272:2: note: Taking false branch
           if (!info)
           ^
   drivers/extcon/extcon-fsa9480.c:281:2: note: Taking false branch
           if (IS_ERR(info->edev)) {
           ^
   drivers/extcon/extcon-fsa9480.c:288:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:288:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:294:2: note: Taking false branch
           if (IS_ERR(info->regmap)) {
           ^
   drivers/extcon/extcon-fsa9480.c:316:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:316:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:322:2: note: Calling 'fsa9480_detect_dev'
           fsa9480_detect_dev(info);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Assuming 'val1' is >=3D 0
           if (val1 < 0 || val2 < 0) {
               ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Left side of '||' is false
   drivers/extcon/extcon-fsa9480.c:227:18: note: Assuming 'val2' is >=3D 0
           if (val1 < 0 || val2 < 0) {
                           ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:2: note: Taking false branch
           if (val1 < 0 || val2 < 0) {
           ^
   drivers/extcon/extcon-fsa9480.c:233:2: note: Loop condition is false.  E=
xiting loop
           dev_info(usbsw->dev, "dev1: 0x%x, dev2: 0x%x\n", val1, val2);
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:442:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/extcon/extcon-fsa9480.c:236:2: note: Calling 'fsa9480_handle_cha=
nge'
           fsa9480_handle_change(usbsw, usbsw->cable & ~val, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:205:2: note: Loop condition is true.  En=
tering loop body
           while (mask) {
           ^
   drivers/extcon/extcon-fsa9480.c:206:3: note: 'dev' initialized to 31
                   int dev =3D fls64(mask) - 1;
                   ^~~~~~~
   drivers/extcon/extcon-fsa9480.c:207:3: note: Assigned value is garbage o=
r undefined
                   u64 cables =3D cable_types[dev];
                   ^            ~~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1563:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
           ^~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1563:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
           ^~~~~~
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored=
 to 'qmp' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: note: Value stored to=
 'qmp' during its initialization is never read
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2259:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2259:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2267:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->de=
v));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2267:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->de=
v));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2375:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2375:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/rtc/rtc-m41t80.c:491:28: warning: The result of the left shift i=
s undefined because the left operand is negative [clang-analyzer-core.Undef=
inedBinaryOperatorResult]
           reg =3D (reg & 0x0f) | (val << 4);
                                 ~~~ ^
   drivers/rtc/rtc-m41t80.c:476:17: note: Assuming the condition is false
           int reg_sqw =3D (m41t80->features & M41T80_FEATURE_SQ_ALT) ?
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-m41t80.c:476:16: note: '?' condition is false
           int reg_sqw =3D (m41t80->features & M41T80_FEATURE_SQ_ALT) ?
                         ^
   drivers/rtc/rtc-m41t80.c:480:6: note: Assuming 'rate' is < M41T80_SQW_MA=
X_FREQ
           if (rate >=3D M41T80_SQW_MAX_FREQ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-m41t80.c:480:2: note: Taking false branch
           if (rate >=3D M41T80_SQW_MAX_FREQ)
           ^
   drivers/rtc/rtc-m41t80.c:482:11: note: Assuming the condition is false
           else if (rate >=3D M41T80_SQW_MAX_FREQ / 4)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-m41t80.c:482:7: note: Taking false branch
           else if (rate >=3D M41T80_SQW_MAX_FREQ / 4)
                ^
   drivers/rtc/rtc-m41t80.c:484:11: note: Assuming 'rate' is not equal to 0
           else if (rate)
                    ^~~~
   drivers/rtc/rtc-m41t80.c:484:7: note: Taking true branch
           else if (rate)
                ^
   drivers/rtc/rtc-m41t80.c:485:14: note: '?' condition is false
                   val =3D 15 - ilog2(rate);
                              ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/rtc/rtc-m41t80.c:485:14: note: '?' condition is true
                   val =3D 15 - ilog2(rate);
                              ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/rtc/rtc-m41t80.c:485:3: note: The value -16 is assigned to 'val'
                   val =3D 15 - ilog2(rate);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-m41t80.c:488:6: note: Assuming 'reg' is >=3D 0
           if (reg < 0)
               ^~~~~~~
   drivers/rtc/rtc-m41t80.c:488:2: note: Taking false branch
           if (reg < 0)
           ^
   drivers/rtc/rtc-m41t80.c:491:28: note: The result of the left shift is u=
ndefined because the left operand is negative
           reg =3D (reg & 0x0f) | (val << 4);
                                 ~~~ ^
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   mm/mmzone.c:79:2: warning: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           memset(lruvec, 0, sizeof(struct lruvec));
           ^~~~~~
   mm/mmzone.c:79:2: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
           memset(lruvec, 0, sizeof(struct lruvec));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/qmp +1701 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1556  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1557  static int qcom_qmp_dp_ph=
y_configure(struct phy *phy, union phy_configure_opts *opts)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1558  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1559  	const struct phy_configu=
re_opts_dp *dp_opts =3D &opts->dp;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1560  	struct qmp_phy *qphy =3D=
 phy_get_drvdata(phy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1561  	const struct qmp_phy_cfg=
 *cfg =3D qphy->cfg;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1562  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08 @1563  	memcpy(&qphy->dp_opts, d=
p_opts, sizeof(*dp_opts));
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1564  	if (qphy->dp_opts.set_vo=
ltages) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1565  		cfg->configure_dp_tx(qp=
hy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1566  		qphy->dp_opts.set_volta=
ges =3D 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1567  	}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1568  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1569  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1570  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1571  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1572  static int qcom_qmp_dp_ph=
y_calibrate(struct phy *phy)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1573  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1574  	struct qmp_phy *qphy =3D=
 phy_get_drvdata(phy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1575  	const struct qmp_phy_cfg=
 *cfg =3D qphy->cfg;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1576  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1577  	if (cfg->calibrate_dp_ph=
y)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1578  		return cfg->calibrate_d=
p_phy(qphy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1579  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1580  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1581  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1582  =

033f3a16fb9283 Dmitry Baryshkov 2022-06-08  1583  static int qcom_qmp_phy_c=
ombo_com_init(struct qmp_phy *qphy)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1584  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1585  	struct qcom_qmp *qmp =3D=
 qphy->qmp;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1586  	const struct qmp_phy_cfg=
 *cfg =3D qphy->cfg;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1587  	void __iomem *pcs =3D qp=
hy->pcs;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1588  	void __iomem *dp_com =3D=
 qmp->dp_com;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1589  	int ret, i;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1590  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1591  	mutex_lock(&qmp->phy_mut=
ex);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1592  	if (qmp->init_count++) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1593  		mutex_unlock(&qmp->phy_=
mutex);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1594  		return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1595  	}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1596  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1597  	/* turn on regulator sup=
plies */
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1598  	ret =3D regulator_bulk_e=
nable(cfg->num_vregs, qmp->vregs);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1599  	if (ret) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1600  		dev_err(qmp->dev, "fail=
ed to enable regulators, err=3D%d\n", ret);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1601  		goto err_unlock;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1602  	}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1603  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1604  	for (i =3D 0; i < cfg->n=
um_resets; i++) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1605  		ret =3D reset_control_a=
ssert(qmp->resets[i]);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1606  		if (ret) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1607  			dev_err(qmp->dev, "%s =
reset assert failed\n",
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1608  				cfg->reset_list[i]);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1609  			goto err_disable_regul=
ators;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1610  		}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1611  	}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1612  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1613  	for (i =3D cfg->num_rese=
ts - 1; i >=3D 0; i--) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1614  		ret =3D reset_control_d=
eassert(qmp->resets[i]);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1615  		if (ret) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1616  			dev_err(qmp->dev, "%s =
reset deassert failed\n",
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1617  				qphy->cfg->reset_list=
[i]);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1618  			goto err_assert_reset;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1619  		}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1620  	}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1621  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1622  	ret =3D clk_bulk_prepare=
_enable(cfg->num_clks, qmp->clks);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1623  	if (ret)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1624  		goto err_assert_reset;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1625  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1626  	if (cfg->has_phy_dp_com_=
ctrl) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1627  		qphy_setbits(dp_com, QP=
HY_V3_DP_COM_POWER_DOWN_CTRL,
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1628  			     SW_PWRDN);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1629  		/* override hardware co=
ntrol for reset of qmp phy */
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1630  		qphy_setbits(dp_com, QP=
HY_V3_DP_COM_RESET_OVRD_CTRL,
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1631  			     SW_DPPHY_RESET_MU=
X | SW_DPPHY_RESET |
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1632  			     SW_USB3PHY_RESET_=
MUX | SW_USB3PHY_RESET);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1633  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1634  		/* Default type-c orien=
tation, i.e CC1 */
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1635  		qphy_setbits(dp_com, QP=
HY_V3_DP_COM_TYPEC_CTRL, 0x02);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1636  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1637  		qphy_setbits(dp_com, QP=
HY_V3_DP_COM_PHY_MODE_CTRL,
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1638  			     USB3_MODE | DP_MO=
DE);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1639  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1640  		/* bring both QMP USB a=
nd QMP DP PHYs PCS block out of reset */
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1641  		qphy_clrbits(dp_com, QP=
HY_V3_DP_COM_RESET_OVRD_CTRL,
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1642  			     SW_DPPHY_RESET_MU=
X | SW_DPPHY_RESET |
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1643  			     SW_USB3PHY_RESET_=
MUX | SW_USB3PHY_RESET);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1644  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1645  		qphy_clrbits(dp_com, QP=
HY_V3_DP_COM_SWI_CTRL, 0x03);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1646  		qphy_clrbits(dp_com, QP=
HY_V3_DP_COM_SW_RESET, SW_RESET);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1647  	}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1648  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1649  	if (cfg->regs[QPHY_PCS_P=
OWER_DOWN_CONTROL])
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1650  		qphy_setbits(pcs,
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1651  				cfg->regs[QPHY_PCS_PO=
WER_DOWN_CONTROL],
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1652  				cfg->pwrdn_ctrl);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1653  	else
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1654  		qphy_setbits(pcs, QPHY_=
POWER_DOWN_CONTROL,
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1655  				cfg->pwrdn_ctrl);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1656  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1657  	mutex_unlock(&qmp->phy_m=
utex);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1658  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1659  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1660  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1661  err_assert_reset:
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1662  	while (++i < cfg->num_re=
sets)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1663  		reset_control_assert(qm=
p->resets[i]);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1664  err_disable_regulators:
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1665  	regulator_bulk_disable(c=
fg->num_vregs, qmp->vregs);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1666  err_unlock:
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1667  	mutex_unlock(&qmp->phy_m=
utex);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1668  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1669  	return ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1670  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1671  =

033f3a16fb9283 Dmitry Baryshkov 2022-06-08  1672  static int qcom_qmp_phy_c=
ombo_com_exit(struct qmp_phy *qphy)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1673  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1674  	struct qcom_qmp *qmp =3D=
 qphy->qmp;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1675  	const struct qmp_phy_cfg=
 *cfg =3D qphy->cfg;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1676  	int i =3D cfg->num_reset=
s;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1677  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1678  	mutex_lock(&qmp->phy_mut=
ex);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1679  	if (--qmp->init_count) {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1680  		mutex_unlock(&qmp->phy_=
mutex);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1681  		return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1682  	}
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1683  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1684  	reset_control_assert(qmp=
->ufs_reset);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1685  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1686  	while (--i >=3D 0)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1687  		reset_control_assert(qm=
p->resets[i]);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1688  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1689  	clk_bulk_disable_unprepa=
re(cfg->num_clks, qmp->clks);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1690  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1691  	regulator_bulk_disable(c=
fg->num_vregs, qmp->vregs);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1692  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1693  	mutex_unlock(&qmp->phy_m=
utex);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1694  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1695  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1696  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1697  =

033f3a16fb9283 Dmitry Baryshkov 2022-06-08  1698  static int qcom_qmp_phy_c=
ombo_init(struct phy *phy)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1699  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1700  	struct qmp_phy *qphy =3D=
 phy_get_drvdata(phy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08 @1701  	struct qcom_qmp *qmp =3D=
 qphy->qmp;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1702  	const struct qmp_phy_cfg=
 *cfg =3D qphy->cfg;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1703  	int ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1704  	dev_vdbg(qmp->dev, "Init=
ializing QMP phy\n");
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1705  =

033f3a16fb9283 Dmitry Baryshkov 2022-06-08  1706  	ret =3D qcom_qmp_phy_com=
bo_com_init(qphy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1707  	if (ret)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1708  		return ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1709  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1710  	if (cfg->type =3D=3D PHY=
_TYPE_DP)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1711  		cfg->dp_aux_init(qphy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1712  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1713  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1714  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1715  =


:::::: The code at line 1701 was first introduced by commit
:::::: 94a407cc17a445ddb3f7315cee0b0916d35d177c phy: qcom-qmp: create copie=
s of QMP PHY driver

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8334856737748542130==--

