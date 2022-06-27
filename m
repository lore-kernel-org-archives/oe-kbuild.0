Content-Type: multipart/mixed; boundary="===============5682387334335052699=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1577/5720] drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:582:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Jun 2022 03:04:29 +0000
Message-ID: <202206261517.wU5Ehotq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5682387334335052699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
hy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:582:19: warning: Value stored to 'q=
mp' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]"
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
commit: 4856865b0dec88570edfbdf3e9c3b551923c0768 [1577/5720] phy: qcom-qmp-=
pcie-msm8996: cleanup the driver
:::::: branch date: 2 days ago
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
it/commit/?id=3D4856865b0dec88570edfbdf3e9c3b551923c0768
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4856865b0dec88570edfbdf3e9c3b551923c0768
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/hwmon/max6621.c:323:10: note: Calling 'max6621_temp_mc2reg'
                           val =3D max6621_temp_mc2reg(val);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/max6621.c:135:23: note: The result of the left shift is un=
defined because the left operand is negative
           return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
                  ~~~~~~~~~~~~~ ^
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/target/target_core_file.c:502:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0xff, bufsize);
           ^~~~~~
   drivers/target/target_core_file.c:502:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0xff, bufsize);
           ^~~~~~
   drivers/target/target_core_file.c:799:7: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           bl =3D sprintf(b + bl, "TCM FILEIO ID: %u", fd_dev->fd_dev_id);
                ^~~~~~~
   drivers/target/target_core_file.c:799:7: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           bl =3D sprintf(b + bl, "TCM FILEIO ID: %u", fd_dev->fd_dev_id);
                ^~~~~~~
   drivers/target/target_core_file.c:800:8: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           bl +=3D sprintf(b + bl, "        File: %s  Size: %llu  Mode: %s =
Async: %d\n",
                 ^~~~~~~
   drivers/target/target_core_file.c:800:8: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           bl +=3D sprintf(b + bl, "        File: %s  Size: %llu  Mode: %s =
Async: %d\n",
                 ^~~~~~~
   drivers/target/target_core_file.c:851:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, FD_MAX_DEV_PROT_NAME, "%s.protection",
           ^~~~~~~~
   drivers/target/target_core_file.c:851:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, FD_MAX_DEV_PROT_NAME, "%s.protection",
           ^~~~~~~~
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
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/dma/sh/usb-dmac.c:720:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(pdev_irqname, "ch%u", index);
           ^~~~~~~
   drivers/dma/sh/usb-dmac.c:720:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(pdev_irqname, "ch%u", index);
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/dma/sh/rz-dmac.c:753:2: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(pdev_irqname, "ch%u", index);
           ^~~~~~~
   drivers/dma/sh/rz-dmac.c:753:2: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           sprintf(pdev_irqname, "ch%u", index);
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:1884:19: warning: Value stored =
to 'qmp' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:1884:19: note: Value stored to =
'qmp' during its initialization is never read
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2256:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2256:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
>> drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:582:19: warning: Value =
stored to 'qmp' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:582:19: note: Value sto=
red to 'qmp' during its initialization is never read
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:927:2: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:927:2: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:943:2: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, sizeof(prop_name), "lane%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:943:2: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
           snprintf(prop_name, sizeof(prop_name), "lane%d", id);
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/opp/core.c:995:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->old_opp.supplies, old_opp->supplies, size);
                   ^~~~~~
   drivers/opp/core.c:995:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(data->old_opp.supplies, old_opp->supplies, size);
                   ^~~~~~
   drivers/opp/core.c:996:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->new_opp.supplies, opp->supplies, size);
                   ^~~~~~
   drivers/opp/core.c:996:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(data->new_opp.supplies, opp->supplies, size);
                   ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/opp/of.c:586:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "opp-microvolt-%s",
                   ^~~~~~~~
   drivers/opp/of.c:586:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "opp-microvolt-%s",
                   ^~~~~~~~
   drivers/opp/of.c:593:3: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "opp-microvolt");
                   ^~~~~~~
   drivers/opp/of.c:593:3: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
                   sprintf(name, "opp-microvolt");
                   ^~~~~~~
   drivers/opp/of.c:649:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "opp-microamp-%s",
                   ^~~~~~~~
   drivers/opp/of.c:649:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "opp-microamp-%s",
                   ^~~~~~~~
   drivers/opp/of.c:656:3: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "opp-microamp");
                   ^~~~~~~
   drivers/opp/of.c:656:3: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
                   sprintf(name, "opp-microamp");
                   ^~~~~~~
   drivers/opp/of.c:693:2: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "opp-microwatt");
           ^~~~~~~
   drivers/opp/of.c:693:2: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           sprintf(name, "opp-microwatt");
           ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/phy/cadence/phy-cadence-sierra.c:750:2: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev), clk=
_names[clk_index]);
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-sierra.c:750:2: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev), clk=
_names[clk_index]);
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-sierra.c:848:2: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-sierra.c:848:2: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: warning: Value stored to =
'value' is never read [clang-analyzer-deadcode.DeadStores]
           value |=3D RXDET_IN_P3_32KHZ;
           ^
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: note: Value stored to 'va=
lue' is never read
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/phy/hisilicon/phy-hi3670-usb3.c:355:3: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_write(priv->pctrl, PCTRL_PERI_CTRL3,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/hisilicon/phy-hi3670-usb3.c:355:3: note: Value stored to 're=
t' is never read

vim +/qmp +582 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c

94a407cc17a445 Dmitry Baryshkov 2022-06-08  578  =

2abf0c8e61a900 Dmitry Baryshkov 2022-06-08  579  static int qcom_qmp_phy_pc=
ie_msm8996_init(struct phy *phy)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  580  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  581  	struct qmp_phy *qphy =3D =
phy_get_drvdata(phy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08 @582  	struct qcom_qmp *qmp =3D =
qphy->qmp;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  583  	int ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  584  	dev_vdbg(qmp->dev, "Initi=
alizing QMP phy\n");
94a407cc17a445 Dmitry Baryshkov 2022-06-08  585  =

2abf0c8e61a900 Dmitry Baryshkov 2022-06-08  586  	ret =3D qcom_qmp_phy_pcie=
_msm8996_com_init(qphy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  587  	if (ret)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  588  		return ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  589  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  590  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  591  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  592  =


:::::: The code at line 582 was first introduced by commit
:::::: 94a407cc17a445ddb3f7315cee0b0916d35d177c phy: qcom-qmp: create copie=
s of QMP PHY driver

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5682387334335052699==--

