Content-Type: multipart/mixed; boundary="===============0997478665592491224=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/marvell/mmp-driver.c:63:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 07 Jun 2022 01:52:48 +0800
Message-ID: <202206070112.xlhQuKfX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0997478665592491224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/marvell/mmp-driver.c:63:17: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: dc7bbea90075b57772e9a28043061bf71d96f06f media: platform: rename ma=
rvell-ccic/ to marvell/
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220607/202206070112.xlhQuKfX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddc7bbea90075b57772e9a28043061bf71d96f06f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dc7bbea90075b57772e9a28043061bf71d96f06f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/usb/cx231xx/cx231xx-417.c:728:12: warning: The left operan=
d of '!=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperator=
Result]
           if (value !=3D 0x12345678) {
               ~~~~~ ^
   drivers/media/usb/cx231xx/cx231xx-417.c:719:6: note: 'value' declared wi=
thout an initial value
           u32 value, flag, retval =3D 0;
               ^~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:722:2: note: Assuming 'v4l_debug=
' is < 3
           dprintk(3, "%s: command(0x%X) =3D %s\n", __func__, command,
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:78:7: note: expanded from macro =
'dprintk'
                   if (v4l_debug >=3D level) \
                       ^~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:722:2: note: Taking false branch
           dprintk(3, "%s: command(0x%X) =3D %s\n", __func__, command,
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:78:3: note: expanded from macro =
'dprintk'
                   if (v4l_debug >=3D level) \
                   ^
   drivers/media/usb/cx231xx/cx231xx-417.c:722:2: note: Loop condition is f=
alse.  Exiting loop
           dprintk(3, "%s: command(0x%X) =3D %s\n", __func__, command,
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:77:2: note: expanded from macro =
'dprintk'
           do {                            \
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:727:2: note: Calling 'mc417_memo=
ry_read'
           mc417_memory_read(dev, dev->cx23417_mailbox - 4, &value);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:560:6: note: Assuming 'ret' is <=
 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:560:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:561:3: note: Returning without w=
riting to '*value'
                   return ret;
                   ^
   drivers/media/usb/cx231xx/cx231xx-417.c:727:2: note: Returning from 'mc4=
17_memory_read'
           mc417_memory_read(dev, dev->cx23417_mailbox - 4, &value);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:728:12: note: The left operand o=
f '!=3D' is a garbage value
           if (value !=3D 0x12345678) {
               ~~~~~ ^
   drivers/media/usb/cx231xx/cx231xx-417.c:738:6: warning: Branch condition=
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (flag) {
               ^~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:719:13: note: 'flag' declared wi=
thout an initial value
           u32 value, flag, retval =3D 0;
                      ^~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:722:2: note: Assuming 'v4l_debug=
' is < 3
           dprintk(3, "%s: command(0x%X) =3D %s\n", __func__, command,
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:78:7: note: expanded from macro =
'dprintk'
                   if (v4l_debug >=3D level) \
                       ^~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:722:2: note: Taking false branch
           dprintk(3, "%s: command(0x%X) =3D %s\n", __func__, command,
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:78:3: note: expanded from macro =
'dprintk'
                   if (v4l_debug >=3D level) \
                   ^
   drivers/media/usb/cx231xx/cx231xx-417.c:722:2: note: Loop condition is f=
alse.  Exiting loop
           dprintk(3, "%s: command(0x%X) =3D %s\n", __func__, command,
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:77:2: note: expanded from macro =
'dprintk'
           do {                            \
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:728:6: note: Assuming 'value' is=
 equal to 305419896
           if (value !=3D 0x12345678) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:728:2: note: Taking false branch
           if (value !=3D 0x12345678) {
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:737:2: note: Calling 'mc417_memo=
ry_read'
           mc417_memory_read(dev, dev->cx23417_mailbox, &flag);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:560:6: note: Assuming 'ret' is <=
 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:560:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/media/usb/cx231xx/cx231xx-417.c:561:3: note: Returning without w=
riting to '*value'
                   return ret;
                   ^
   drivers/media/usb/cx231xx/cx231xx-417.c:737:2: note: Returning from 'mc4=
17_memory_read'
           mc417_memory_read(dev, dev->cx23417_mailbox, &flag);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:738:6: note: Branch condition ev=
aluates to a garbage value
           if (flag) {
               ^~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:961:2: warning: Value stored to =
'retval' is never read [clang-analyzer-deadcode.DeadStores]
           retval |=3D mc417_memory_read(dev, 0x900C, &value);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-417.c:961:2: note: Value stored to 're=
tval' is never read
           retval |=3D mc417_memory_read(dev, 0x900C, &value);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/marvell/mmp-driver.c:63:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D &cam->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/marvell/mmp-driver.c:63:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D &cam->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/omap3isp/isp.c:529:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D isp->dev;
                          ^~~   ~~~~~~~~
   drivers/media/platform/omap3isp/isp.c:529:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D isp->dev;
                          ^~~   ~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/omap3isp/ispcsiphy.c:63:14: warning: The left ope=
rand of '<<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperato=
rResult]
           reg |=3D mode << shift;
                       ^
   drivers/media/platform/omap3isp/ispcsiphy.c:264:6: note: Assuming field =
'vdd' is not equal to NULL
           if (phy->vdd =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:264:2: note: Taking false br=
anch
           if (phy->vdd =3D=3D NULL) {
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:273:6: note: Assuming 'rval'=
 is >=3D 0
           if (rval < 0)
               ^~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:273:2: note: Taking false br=
anch
           if (rval < 0)
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:277:6: note: Assuming 'rval'=
 is >=3D 0
           if (rval < 0)
               ^~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:277:2: note: Taking false br=
anch
           if (rval < 0)
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:282:9: note: Calling 'omap3i=
sp_csiphy_config'
           rval =3D omap3isp_csiphy_config(phy);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:172:6: note: Assuming field =
'interface' is not equal to ISP_INTERFACE_CCP2B_PHY1
           if (buscfg->interface =3D=3D ISP_INTERFACE_CCP2B_PHY1
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:172:6: note: Left side of '|=
|' is false
   drivers/media/platform/omap3isp/ispcsiphy.c:173:9: note: Assuming field =
'interface' is not equal to ISP_INTERFACE_CCP2B_PHY2
               || buscfg->interface =3D=3D ISP_INTERFACE_CCP2B_PHY2) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:172:2: note: Taking false br=
anch
           if (buscfg->interface =3D=3D ISP_INTERFACE_CCP2B_PHY1
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:181:6: note: Assuming 'num_d=
ata_lanes' is <=3D field 'num_data_lanes'
           if (num_data_lanes > phy->num_data_lanes)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:181:2: note: Taking false br=
anch
           if (num_data_lanes > phy->num_data_lanes)
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:185:14: note: Assuming 'i' i=
s >=3D 'num_data_lanes'
           for (i =3D 0; i < num_data_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:185:2: note: Loop condition =
is false. Execution continues on line 195
           for (i =3D 0; i < num_data_lanes; i++) {
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:195:6: note: Assuming field =
'pol' is <=3D 1
           if (lanes->clk.pol > 1 || lanes->clk.pos > 3)
               ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:195:6: note: Left side of '|=
|' is false
   drivers/media/platform/omap3isp/ispcsiphy.c:195:28: note: Assuming field=
 'pos' is <=3D 3
           if (lanes->clk.pol > 1 || lanes->clk.pos > 3)
                                     ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:195:2: note: Taking false br=
anch
           if (lanes->clk.pol > 1 || lanes->clk.pos > 3)
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:198:6: note: Assuming field =
'pos' is not equal to 0
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:198:6: note: Left side of '|=
|' is false
   drivers/media/platform/omap3isp/ispcsiphy.c:198:2: note: Taking false br=
anch
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:206:2: note: Calling 'csiphy=
_routing_cfg'
           csiphy_routing_cfg(phy, buscfg->interface, true,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:105:6: note: Assuming field =
'phy_type' is equal to ISP_PHY_TYPE_3630
           if (phy->isp->phy_type =3D=3D ISP_PHY_TYPE_3630 && on)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:105:6: note: Left side of '&=
&' is true
   drivers/media/platform/omap3isp/ispcsiphy.c:105:49: note: 'on' is true
           if (phy->isp->phy_type =3D=3D ISP_PHY_TYPE_3630 && on)
                                                          ^~
   drivers/media/platform/omap3isp/ispcsiphy.c:105:2: note: Taking true bra=
nch
           if (phy->isp->phy_type =3D=3D ISP_PHY_TYPE_3630 && on)
           ^
   drivers/media/platform/omap3isp/ispcsiphy.c:106:10: note: Calling 'csiph=
y_routing_cfg_3630'
                   return csiphy_routing_cfg_3630(phy, iface, ccp2_strobe);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/omap3isp/ispcsiphy.c:28:13: note: 'mode' declared=
 without an initial value
           u32 shift, mode;

vim +/dev +63 drivers/media/platform/marvell/mmp-driver.c

67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11   49  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   50  /*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   51   * calc the dphy register values
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   52   * There are three dphy registers being used.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   53   * dphy[0] - CSI2_DPHY3
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   54   * dphy[1] - CSI2_DPHY5
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   55   * dphy[2] - CSI2_DPHY6
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   56   * CSI2_DPHY3 and CSI2_DPHY6 can be set with a =
default value
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   57   * or be calculated dynamically
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   58   */
e81afa6f28f974 drivers/media/platform/marvell-ccic/mmp-driver.c Mauro Carva=
lho Chehab 2018-04-05   59  static void mmpcam_calc_dphy(struct mcam_camera=
 *mcam)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   60  {
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   61  	struct mmp_camera *cam =3D mcam_to_cam(mcam);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   62  	struct mmp_camera_platform_data *pdata =3D cam=
->pdev->dev.platform_data;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  @63  	struct device *dev =3D &cam->pdev->dev;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   64  	unsigned long tx_clk_esc;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   65  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   66  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   67  	 * If CSI2_DPHY3 is calculated dynamically,
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   68  	 * pdata->lane_clk should be already set
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   69  	 * either in the board driver statically
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   70  	 * or in the sensor driver dynamically.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   71  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   72  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   73  	 * dphy[0] - CSI2_DPHY3:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   74  	 *  bit 0 ~ bit 7: HS Term Enable.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   75  	 *   defines the time that the DPHY
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   76  	 *   wait before enabling the data
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   77  	 *   lane termination after detecting
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   78  	 *   that the sensor has driven the data
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   79  	 *   lanes to the LP00 bridge state.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   80  	 *   The value is calculated by:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   81  	 *   (Max T(D_TERM_EN)/Period(DDR)) - 1
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   82  	 *  bit 8 ~ bit 15: HS_SETTLE
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   83  	 *   Time interval during which the HS
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   84  	 *   receiver shall ignore any Data Lane
8b72c18d467fad drivers/media/platform/marvell-ccic/mmp-driver.c Mauro Carva=
lho Chehab 2019-02-18   85  	 *   HS transitions.
8b72c18d467fad drivers/media/platform/marvell-ccic/mmp-driver.c Mauro Carva=
lho Chehab 2019-02-18   86  	 *   The value has been calibrated on
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   87  	 *   different boards. It seems to work well.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   88  	 *
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   89  	 *  More detail please refer
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   90  	 *  MIPI Alliance Spectification for D-PHY
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   91  	 *  document for explanation of HS-SETTLE
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   92  	 *  and D-TERM-EN.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   93  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   94  	switch (pdata->dphy3_algo) {
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   95  	case DPHY3_ALGO_PXA910:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   96  		/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   97  		 * Calculate CSI2_DPHY3 algo for PXA910
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   98  		 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   99  		pdata->dphy[0] =3D
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  100  			(((1 + (pdata->lane_clk * 80) / 1000) & 0xff=
) << 8)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  101  			| (1 + pdata->lane_clk * 35 / 1000);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  102  		break;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  103  	case DPHY3_ALGO_PXA2128:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  104  		/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  105  		 * Calculate CSI2_DPHY3 algo for PXA2128
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  106  		 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  107  		pdata->dphy[0] =3D
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  108  			(((2 + (pdata->lane_clk * 110) / 1000) & 0xf=
f) << 8)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  109  			| (1 + pdata->lane_clk * 35 / 1000);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  110  		break;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  111  	default:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  112  		/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  113  		 * Use default CSI2_DPHY3 value for PXA688/PX=
A988
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  114  		 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  115  		dev_dbg(dev, "camera: use the default CSI2_DP=
HY3 value\n");
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11  116  	}
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11  117  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  118  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  119  	 * mipi_clk will never be changed, it is a fix=
ed value on MMP
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  120  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  121  	if (IS_ERR(cam->mipi_clk))
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  122  		return;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  123  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  124  	/* get the escape clk, this is hard coded */
326f5a3fc502f9 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-11-05  125  	clk_prepare_enable(cam->mipi_clk);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  126  	tx_clk_esc =3D (clk_get_rate(cam->mipi_clk) / =
1000000) / 12;
326f5a3fc502f9 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-11-05  127  	clk_disable_unprepare(cam->mipi_clk);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  128  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  129  	 * dphy[2] - CSI2_DPHY6:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  130  	 * bit 0 ~ bit 7: CK Term Enable
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  131  	 *  Time for the Clock Lane receiver to enable=
 the HS line
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  132  	 *  termination. The value is calculated simil=
arly with
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  133  	 *  HS Term Enable
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  134  	 * bit 8 ~ bit 15: CK Settle
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  135  	 *  Time interval during which the HS receiver=
 shall ignore
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  136  	 *  any Clock Lane HS transitions.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  137  	 *  The value is calibrated on the boards.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  138  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  139  	pdata->dphy[2] =3D
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  140  		((((534 * tx_clk_esc) / 2000 - 1) & 0xff) << =
8)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  141  		| (((38 * tx_clk_esc) / 1000 - 1) & 0xff);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  142  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  143  	dev_dbg(dev, "camera: DPHY sets: dphy3=3D0x%x,=
 dphy5=3D0x%x, dphy6=3D0x%x\n",
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  144  		pdata->dphy[0], pdata->dphy[1], pdata->dphy[2=
]);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  145  }
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11  146  =


:::::: The code at line 63 was first introduced by commit
:::::: 05fed81625bf755cc67c5864cdfd18b69ea828d1 [media] marvell-ccic: add M=
IPI support for marvell-ccic driver

:::::: TO: Libin Yang <lbyang@marvell.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0997478665592491224==--

