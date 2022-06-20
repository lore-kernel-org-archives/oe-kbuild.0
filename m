Content-Type: multipart/mixed; boundary="===============1541664394738177022=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1583/4317] drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 20 Jun 2022 15:40:20 +0800
Message-ID: <202206201559.FYCRh5Yk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1541664394738177022==
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
head:   07dc787be2316e243a16a33d0a9b734cd9365bd3
commit: 6066bac15bc61ccebb00194e507bbcf6991d2eb1 [1583/4317] phy: qcom-qmp-=
combo: cleanup the driver
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: riscv-randconfig-c006-20220617 (https://download.01.org/0day-ci/arc=
hive/20220620/202206201559.FYCRh5Yk-lkp(a)intel.com/config)
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
           ^
   include/linux/printk.h:538:2: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   lib/test_lockup.c:398:2: note: Calling 'test_free_pages'
           test_free_pages(&pages);
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:323:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, next, pages, lru)
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   drivers/media/pci/ttpci/budget-core.c:67:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(budget->grabbing, 0x00, budget->buffer_size);
           ^~~~~~
   drivers/media/pci/ttpci/budget-core.c:67:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(budget->grabbing, 0x00, budget->buffer_size);
           ^~~~~~
   drivers/media/pci/ttpci/budget-core.c:419:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(budget, 0, sizeof(struct budget));
           ^~~~~~
   drivers/media/pci/ttpci/budget-core.c:419:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(budget, 0, sizeof(struct budget));
           ^~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   drivers/media/pci/ttpci/budget-av.c:327:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&budget_av->ca, 0, sizeof(struct dvb_ca_en50221));
           ^~~~~~
   drivers/media/pci/ttpci/budget-av.c:327:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&budget_av->ca, 0, sizeof(struct dvb_ca_en50221));
           ^~~~~~
   drivers/media/pci/ttpci/budget-av.c:1407:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(i, &knc1_inputs[i->index], sizeof(struct v4l2_input));
           ^~~~~~
   drivers/media/pci/ttpci/budget-av.c:1407:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(i, &knc1_inputs[i->index], sizeof(struct v4l2_input));
           ^~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
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
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/ntb/ntb_transport.c:673:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(offset, 0, sizeof(struct ntb_payload_header));
                   ^~~~~~
   drivers/ntb/ntb_transport.c:673:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(offset, 0, sizeof(struct ntb_payload_header));
                   ^~~~~~
   drivers/ntb/ntb_transport.c:1169:11: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
           mw_num =3D QP_TO_MW(nt, qp_num);
                    ^
   drivers/ntb/ntb_transport.c:272:32: note: expanded from macro 'QP_TO_MW'
   #define QP_TO_MW(nt, qp)        ((qp) % nt->mw_count)
                                         ^
   drivers/ntb/ntb_transport.c:1252:6: note: Assuming field 'mw_set_trans' =
is non-null
           if (!ndev->ops->mw_set_trans) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ntb/ntb_transport.c:1252:2: note: Taking false branch
           if (!ndev->ops->mw_set_trans) {
           ^
   drivers/ntb/ntb_transport.c:1257:2: note: Taking false branch
           if (ntb_db_is_unsafe(ndev))
           ^
   drivers/ntb/ntb_transport.c:1260:2: note: Taking false branch
           if (ntb_spad_is_unsafe(ndev))
           ^
   drivers/ntb/ntb_transport.c:1264:6: note: Assuming the condition is false
           if (ntb_peer_port_count(ndev) !=3D NTB_DEF_PEER_CNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ntb/ntb_transport.c:1264:2: note: Taking false branch
           if (ntb_peer_port_count(ndev) !=3D NTB_DEF_PEER_CNT)
           ^
   drivers/ntb/ntb_transport.c:1270:6: note: Assuming 'nt' is non-null
           if (!nt)
               ^~~
   drivers/ntb/ntb_transport.c:1270:2: note: Taking false branch
           if (!nt)
           ^
   drivers/ntb/ntb_transport.c:1279:6: note: Assuming 'use_msi' is false
           if (use_msi && mw_count > 1) {
               ^~~~~~~
   drivers/ntb/ntb_transport.c:1279:14: note: Left side of '&&' is false
           if (use_msi && mw_count > 1) {
                       ^
   drivers/ntb/ntb_transport.c:1291:6: note: Assuming the condition is false
           if (spad_count < NTB_TRANSPORT_MIN_SPADS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ntb/ntb_transport.c:1291:2: note: Taking false branch
           if (spad_count < NTB_TRANSPORT_MIN_SPADS) {
           ^
   drivers/ntb/ntb_transport.c:1298:17: note: Assuming '__UNIQUE_ID___x256'=
 is >=3D '__UNIQUE_ID___y257'
           nt->mw_count =3D min(mw_count, max_mw_count_for_spads);
                          ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/ntb/ntb_transport.c:1298:17: note: '?' condition is false
           nt->mw_count =3D min(mw_count, max_mw_count_for_spads);
                          ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })

vim +/qmp +1701 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

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
--===============1541664394738177022==--

