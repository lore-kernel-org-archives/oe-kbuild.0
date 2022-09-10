Content-Type: multipart/mixed; boundary="===============6791850590605597042=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/phy/hisilicon/phy-hi3670-pcie.c:204:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sat, 10 Sep 2022 15:25:00 +0800
Message-ID: <202209101542.VhrWcfJ2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6791850590605597042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/p=
hy/hisilicon/phy-hi3670-pcie.c:204:13: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Vinod Koul <vkoul@kernel.org>
CC: Manivannan Sadhasivam <mani@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce888220d5c7a805e0e155302a318d5d23e62950
commit: 73075011ffff876de8516a1e583dc41869293da9 phy: HiSilicon: Add driver=
 for Kirin 970 PCIe PHY
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220906 (https://download.01.org/0day-ci/archi=
ve/20220910/202209101542.VhrWcfJ2-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D73075011ffff876de8516a1e583dc41869293da9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 73075011ffff876de8516a1e583dc41869293da9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/phy/hisilicon/phy-hi3670-pcie.c: In function 'hi3670_pcie_phy_oe=
_enable':
>> drivers/phy/hisilicon/phy-hi3670-pcie.c:204:13: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     204 |         u32 val;
         |             ^~~
     'hi3670_pcie_phy_oe_enable': event 1
       |
       |  204 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/phy/hisilicon/phy-hi3670-pcie.c: In function 'hi3670_pcie_natura=
l_cfg':
   drivers/phy/hisilicon/phy-hi3670-pcie.c:280:13: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     280 |         u32 val;
         |             ^~~
     'hi3670_pcie_natural_cfg': event 1
       |
       |  280 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/phy/hisilicon/phy-hi3670-pcie.c: In function 'hi3670_pcie_phyref=
_gt':
   drivers/phy/hisilicon/phy-hi3670-pcie.c:388:22: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     388 |         unsigned int val;
         |                      ^~~
     'hi3670_pcie_phyref_gt': event 1
       |
       |  388 |         unsigned int val;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/phy/hisilicon/phy-hi3670-pcie.c: In function 'hi3670_pcie_oe_ctr=
l':
   drivers/phy/hisilicon/phy-hi3670-pcie.c:405:22: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     405 |         unsigned int val;
         |                      ^~~
     'hi3670_pcie_oe_ctrl': event 1
       |
       |  405 |         unsigned int val;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/phy/hisilicon/phy-hi3670-pcie.c: In function 'hi3670_pcie_ioref_=
gt':
   drivers/phy/hisilicon/phy-hi3670-pcie.c:431:22: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     431 |         unsigned int val;
         |                      ^~~
     'hi3670_pcie_ioref_gt': event 1
       |
       |  431 |         unsigned int val;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/phy/hisilicon/phy-hi3670-pcie.c: In function 'hi3670_pcie_phy_po=
wer_on':
   drivers/phy/hisilicon/phy-hi3670-pcie.c:663:13: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     663 |         int val, ret;
         |             ^~~
     'hi3670_pcie_phy_power_on': event 1
       |
       |  663 |         int val, ret;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +204 drivers/phy/hisilicon/phy-hi3670-pcie.c

73075011ffff87 Mauro Carvalho Chehab 2021-09-28  201  =

73075011ffff87 Mauro Carvalho Chehab 2021-09-28  202  static void hi3670_pc=
ie_phy_oe_enable(struct hi3670_pcie_phy *phy, bool enable)
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  203  {
73075011ffff87 Mauro Carvalho Chehab 2021-09-28 @204  	u32 val;
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  205  =

73075011ffff87 Mauro Carvalho Chehab 2021-09-28  206  	regmap_read(phy->sys=
ctrl, SCTRL_PCIE_OE_OFFSET, &val);
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  207  	val |=3D PCIE_DEBOUN=
CE_PARAM;
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  208  	if (enable)
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  209  		val &=3D ~PCIE_OE_B=
YPASS;
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  210  	else
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  211  		val |=3D PCIE_OE_BY=
PASS;
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  212  	regmap_write(phy->sy=
sctrl, SCTRL_PCIE_OE_OFFSET, val);
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  213  }
73075011ffff87 Mauro Carvalho Chehab 2021-09-28  214  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6791850590605597042==--

