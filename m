Content-Type: multipart/mixed; boundary="===============7807402695018227031=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 4719/9999] drivers/media/platform/ti/cal/cal.c:1159:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 01 Feb 2022 12:07:11 +0800
Message-ID: <202202011253.8WjWF54y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7807402695018227031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Pratyush Yadav <p.yadav@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   922b857ee8fee5618ce14477086f791cf4dfdf15
commit: be89a309e118171c1c0dd622ec3e963010738795 [4719/9999] media: ti-vpe:=
 cal: fix ctx uninitialization
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220201/202202011253.8WjWF54y-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18a=
cb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout be89a309e118171c1c0dd622ec3e963010738795
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/via-camera.c:1259:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D vb2_queue_init(vq);
           ^     ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/via-camera.c:1259:2: note: Value stored to 'ret' =
is never read
           ret =3D vb2_queue_init(vq);
           ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/pxa_camera.c:1356:25: warning: Value stored to 'p=
cdev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct pxa_camera_dev *pcdev =3D vb2_get_drv_priv(vb->vb2_queue);
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/pxa_camera.c:1356:25: note: Value stored to 'pcde=
v' during its initialization is never read
           struct pxa_camera_dev *pcdev =3D vb2_get_drv_priv(vb->vb2_queue);
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/platform/ti/cal/cal.c:630:17: warning: The result of the l=
eft shift is undefined due to shifting by '32', which is greater or equal t=
o the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOpe=
ratorResult]
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                                        ^
   drivers/media/platform/ti/cal/cal_regs.h:133:34: note: expanded from mac=
ro 'CAL_HL_IRQ_CIO_MASK'
   #define CAL_HL_IRQ_CIO_MASK(i)                  BIT(16 + (i) * 8)
                                                   ^~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/media/platform/ti/cal/cal.c:621:6: note: Assuming 'status' is no=
t equal to 0
           if (status) {
               ^~~~~~
   drivers/media/platform/ti/cal/cal.c:621:2: note: Taking true branch
           if (status) {
           ^
   drivers/media/platform/ti/cal/cal.c:626:7: note: Assuming the condition =
is false
                   if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:626:3: note: Taking false branch
                   if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
                   ^
   drivers/media/platform/ti/cal/cal.c:629:15: note: Assuming 'i' is < fiel=
d 'num_csi2_phy'
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:629:3: note: Loop condition is true.=
  Entering loop body
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                   ^
   drivers/media/platform/ti/cal/cal.c:630:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:630:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                           ^
   drivers/media/platform/ti/cal/cal.c:641:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:641:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                           ^
   drivers/media/platform/ti/cal/cal.c:629:15: note: Assuming 'i' is < fiel=
d 'num_csi2_phy'
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:629:3: note: Loop condition is true.=
  Entering loop body
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                   ^
   drivers/media/platform/ti/cal/cal.c:630:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:630:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                           ^
   drivers/media/platform/ti/cal/cal.c:641:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:641:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                           ^
   drivers/media/platform/ti/cal/cal.c:629:15: note: Assuming 'i' is < fiel=
d 'num_csi2_phy'
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:629:3: note: Loop condition is true.=
  Entering loop body
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                   ^
   drivers/media/platform/ti/cal/cal.c:630:17: note: The result of the left=
 shift is undefined due to shifting by '32', which is greater or equal to t=
he width of type 'unsigned long'
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                                        ^
   drivers/media/platform/ti/cal/cal_regs.h:133:34: note: expanded from mac=
ro 'CAL_HL_IRQ_CIO_MASK'
   #define CAL_HL_IRQ_CIO_MASK(i)                  BIT(16 + (i) * 8)
                                                   ^~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
>> drivers/media/platform/ti/cal/cal.c:1159:3: warning: Use of memory after=
 it is freed [clang-analyzer-unix.Malloc]
                   cal_camerarx_destroy(cal->phy[i]);
                   ^                    ~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:1059:6: note: Assuming 'cal' is non-=
null
           if (!cal)
               ^~~~
   drivers/media/platform/ti/cal/cal.c:1059:2: note: Taking false branch
           if (!cal)
           ^
   drivers/media/platform/ti/cal/cal.c:1063:6: note: Assuming field 'data' =
is non-null
           if (!cal->data) {
               ^~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:1063:2: note: Taking false branch
           if (!cal->data) {
           ^
   drivers/media/platform/ti/cal/cal.c:1073:2: note: Taking false branch
           if (IS_ERR(cal->fclk)) {
           ^
   drivers/media/platform/ti/cal/cal.c:1079:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/media/platform/ti/cal/cal.c:1079:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/media/platform/ti/cal/cal.c:1085:2: note: Taking false branch
           if (IS_ERR(cal->base))
           ^
   drivers/media/platform/ti/cal/cal.c:1088:2: note: Assuming 'cal_debug' i=
s < 1
           cal_dbg(1, cal, "ioresource %s@%pa - %pa\n",
           ^
   drivers/media/platform/ti/cal/cal.h:238:7: note: expanded from macro 'ca=
l_dbg'
                   if (cal_debug >=3D (level))                             =
  \
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:1088:2: note: Taking false branch
           cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
           ^
   drivers/media/platform/ti/cal/cal.h:238:3: note: expanded from macro 'ca=
l_dbg'
                   if (cal_debug >=3D (level))                             =
  \
                   ^
   drivers/media/platform/ti/cal/cal.c:1088:2: note: Loop condition is fals=
e.  Exiting loop
           cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
           ^
   drivers/media/platform/ti/cal/cal.h:237:2: note: expanded from macro 'ca=
l_dbg'
           do {                                                            \
           ^
   drivers/media/platform/ti/cal/cal.c:1092:2: note: Assuming 'cal_debug' i=
s < 1
           cal_dbg(1, cal, "got irq# %d\n", irq);
           ^
   drivers/media/platform/ti/cal/cal.h:238:7: note: expanded from macro 'ca=
l_dbg'
                   if (cal_debug >=3D (level))                             =
  \
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:1092:2: note: Taking false branch
           cal_dbg(1, cal, "got irq# %d\n", irq);
           ^
   drivers/media/platform/ti/cal/cal.h:238:3: note: expanded from macro 'ca=
l_dbg'
                   if (cal_debug >=3D (level))                             =
  \
                   ^
   drivers/media/platform/ti/cal/cal.c:1092:2: note: Loop condition is fals=
e.  Exiting loop
           cal_dbg(1, cal, "got irq# %d\n", irq);
           ^
   drivers/media/platform/ti/cal/cal.h:237:2: note: expanded from macro 'ca=
l_dbg'
           do {                                                            \
           ^
   drivers/media/platform/ti/cal/cal.c:1095:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/platform/ti/cal/cal.c:1095:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/platform/ti/cal/cal.c:1101:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/media/platform/ti/cal/cal.c:1101:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/platform/ti/cal/cal.c:1109:6: note: Assuming 'ret' is >=3D=
 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/platform/ti/cal/cal.c:1109:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/media/platform/ti/cal/cal.c:1113:14: note: Assuming 'i' is < fie=
ld 'num_csi2_phy'
           for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:1113:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
           ^
   drivers/media/platform/ti/cal/cal.c:1115:3: note: Taking false branch
                   if (IS_ERR(cal->phy[i])) {
                   ^
   drivers/media/platform/ti/cal/cal.c:1121:7: note: Assuming field 'source=
_node' is non-null
                   if (cal->phy[i]->source_node)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:1121:3: note: Taking true branch
                   if (cal->phy[i]->source_node)
                   ^
   drivers/media/platform/ti/cal/cal.c:1113:14: note: Assuming 'i' is >=3D =
field 'num_csi2_phy'
           for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/cal/cal.c:1113:2: note: Loop condition is fals=
e. Execution continues on line 1125
           for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {

vim +1159 drivers/media/platform/ti/cal/cal.c

af30d4f36ef35d drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1049  =

343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1050  static int cal_probe(struct platform_device *pdev)
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1051  {
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1052  	struct cal_dev *cal;
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1053  	bool connected =3D false;
6341aa2ee4dd95 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1054  	unsigned int i;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1055  	int ret;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1056  	int irq;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1057  =

97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1058  	cal =3D devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1059  	if (!cal)
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1060  		return -ENOMEM;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1061  =

97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1062  	cal->data =3D of_device_get_match_data(&pdev->dev);
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1063  	if (!cal->data) {
65ee4280f19cb1 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
19-11-12  1064  		dev_err(&pdev->dev, "Could not get feature data based on =
compatible version\n");
65ee4280f19cb1 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
19-11-12  1065  		return -ENODEV;
65ee4280f19cb1 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
19-11-12  1066  	}
65ee4280f19cb1 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
19-11-12  1067  =

92790656cee2f0 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1068  	cal->dev =3D &pdev->dev;
214f995c20938f drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1069  	platform_set_drvdata(pdev, cal);
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1070  =

214f995c20938f drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1071  	/* Acquire resources: clocks, CAMERARX regmap, I/O memory =
and IRQ. */
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1072  	cal->fclk =3D devm_clk_get(&pdev->dev, "fck");
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1073  	if (IS_ERR(cal->fclk)) {
6dfcbde592e0fc drivers/media/platform/ti-vpe/cal.c Tomi Valkeinen        20=
20-03-25  1074  		dev_err(&pdev->dev, "cannot get CAL fclk\n");
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1075  		return PTR_ERR(cal->fclk);
6dfcbde592e0fc drivers/media/platform/ti-vpe/cal.c Tomi Valkeinen        20=
20-03-25  1076  	}
6dfcbde592e0fc drivers/media/platform/ti-vpe/cal.c Tomi Valkeinen        20=
20-03-25  1077  =

af30d4f36ef35d drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1078  	ret =3D cal_init_camerarx_regmap(cal);
573e298cfe6794 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1079  	if (ret < 0)
573e298cfe6794 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1080  		return ret;
65ee4280f19cb1 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
19-11-12  1081  =

97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1082  	cal->res =3D platform_get_resource_byname(pdev, IORESOURCE=
_MEM,
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1083  						"cal_top");
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1084  	cal->base =3D devm_ioremap_resource(&pdev->dev, cal->res);
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1085  	if (IS_ERR(cal->base))
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1086  		return PTR_ERR(cal->base);
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1087  =

97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1088  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1089  		cal->res->name, &cal->res->start, &cal->res->end);
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1090  =

343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1091  	irq =3D platform_get_irq(pdev, 0);
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1092  	cal_dbg(1, cal, "got irq# %d\n", irq);
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1093  	ret =3D devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_=
MODULE_NAME,
97cf202807c915 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1094  			       cal);
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1095  	if (ret)
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1096  		return ret;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1097  =

05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1098  	/* Read the revision and hardware info to verify hardware =
access. */
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1099  	pm_runtime_enable(&pdev->dev);
8d7c0744cae4c4 drivers/media/platform/ti/cal/cal.c Mauro Carvalho Chehab 20=
21-07-14  1100  	ret =3D pm_runtime_resume_and_get(&pdev->dev);
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1101  	if (ret)
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1102  		goto error_pm_runtime;
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1103  =

05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1104  	cal_get_hwinfo(cal);
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1105  	pm_runtime_put_sync(&pdev->dev);
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1106  =

01d4f990d859d2 drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1107  	/* Initialize the media device. */
01d4f990d859d2 drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1108  	ret =3D cal_media_init(cal);
01d4f990d859d2 drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1109  	if (ret < 0)
01d4f990d859d2 drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1110  		goto error_pm_runtime;
01d4f990d859d2 drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1111  =

214f995c20938f drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1112  	/* Create CAMERARX PHYs. */
2f63379b93fa38 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1113  	for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
2f63379b93fa38 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1114  		cal->phy[i] =3D cal_camerarx_create(cal, i);
d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1115  		if (IS_ERR(cal->phy[i])) {
d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1116  			ret =3D PTR_ERR(cal->phy[i]);
d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1117  			cal->phy[i] =3D NULL;
d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1118  			goto error_camerarx;
d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1119  		}
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1120  =

346e423a6bfd8e drivers/media/platform/ti/cal/cal.c Tomi Valkeinen        20=
21-07-14  1121  		if (cal->phy[i]->source_node)
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1122  			connected =3D true;
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1123  	}
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1124  =

f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1125  	if (!connected) {
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1126  		cal_err(cal, "Neither port is configured, no point in sta=
ying up\n");
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1127  		ret =3D -ENODEV;
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1128  		goto error_camerarx;
65ee4280f19cb1 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
19-11-12  1129  	}
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1130  =

214f995c20938f drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1131  	/* Create contexts. */
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1132  	for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
346e423a6bfd8e drivers/media/platform/ti/cal/cal.c Tomi Valkeinen        20=
21-07-14  1133  		if (!cal->phy[i]->source_node)
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1134  			continue;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1135  =

f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1136  		cal->ctx[i] =3D cal_ctx_create(cal, i);
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1137  		if (!cal->ctx[i]) {
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1138  			cal_err(cal, "Failed to create context %u\n", i);
b4b784953c49c0 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1139  			ret =3D -ENODEV;
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1140  			goto error_context;
f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1141  		}
fae8ab25144c55 drivers/media/platform/ti/cal/cal.c Tomi Valkeinen        20=
21-07-14  1142  =

fae8ab25144c55 drivers/media/platform/ti/cal/cal.c Tomi Valkeinen        20=
21-07-14  1143  		cal->num_contexts++;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1144  	}
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1145  =

45dd15e6ce2241 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1146  	/* Register the media device. */
45dd15e6ce2241 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1147  	ret =3D cal_media_register(cal);
a539a0536f6e22 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1148  	if (ret)
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1149  		goto error_context;
a539a0536f6e22 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1150  =

343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1151  	return 0;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1152  =

f5ddf19eca3328 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1153  error_context:
fae8ab25144c55 drivers/media/platform/ti/cal/cal.c Tomi Valkeinen        20=
21-07-14  1154  	for (i =3D 0; i < cal->num_contexts; i++)
be89a309e11817 drivers/media/platform/ti/cal/cal.c Tomi Valkeinen        20=
21-07-14  1155  		cal_ctx_destroy(cal->ctx[i]);
d079f94c90469f drivers/media/platform/ti-vpe/cal.c Steve Longerbeam      20=
18-09-29  1156  =

d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1157  error_camerarx:
be7c12577352fd drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1158  	for (i =3D 0; i < cal->data->num_csi2_phy; i++)
d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06 @1159  		cal_camerarx_destroy(cal->phy[i]);
d3665f3b7c08bc drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1160  =

01d4f990d859d2 drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1161  	cal_media_cleanup(cal);
01d4f990d859d2 drivers/media/platform/ti/cal/cal.c Laurent Pinchart      20=
21-07-14  1162  =

05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1163  error_pm_runtime:
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1164  	pm_runtime_disable(&pdev->dev);
05930cf1e5c5d7 drivers/media/platform/ti-vpe/cal.c Laurent Pinchart      20=
20-07-06  1165  =

343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1166  	return ret;
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1167  }
343e89a792a571 drivers/media/platform/ti-vpe/cal.c Benoit Parrot         20=
16-01-06  1168  =


:::::: The code at line 1159 was first introduced by commit
:::::: d3665f3b7c08bc50f97b2f308f4b745f7e80b3e8 media: ti-vpe: cal: Add cal=
_camerarx_destroy() to cleanup CAMERARX

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7807402695018227031==--

