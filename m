Content-Type: multipart/mixed; boundary="===============4968165856688101602=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [andersson:tuxsuite 42/42] drivers/phy/qualcomm/phy-qcom-qmp.c:6408 qcom_qmp_phy_typec_mux_set() warn: ignoring unreachable code.
Date: Wed, 09 Mar 2022 13:38:37 +0800
Message-ID: <202203091354.JOyw4sg5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4968165856688101602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://github.com/andersson/kernel tuxsuite
head:   d1c9502cfe160da3c09a0f379147f16d559e4ab7
commit: d1c9502cfe160da3c09a0f379147f16d559e4ab7 [42/42] qmp mux usb hackery
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: parisc-randconfig-m031-20220304 (https://download.01.org/0day-ci/ar=
chive/20220309/202203091354.JOyw4sg5-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/phy/qualcomm/phy-qcom-qmp.c:6408 qcom_qmp_phy_typec_mux_set() warn:=
 ignoring unreachable code.

vim +6408 drivers/phy/qualcomm/phy-qcom-qmp.c

d1c9502cfe160da Bjorn Andersson 2022-02-07  6391  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6392  	if (qmp->orientation =3D=
=3D TYPEC_ORIENTATION_REVERSE)
d1c9502cfe160da Bjorn Andersson 2022-02-07  6393  		writel(BIT(1) | BIT(0),=
 dp_com + QPHY_V3_DP_COM_TYPEC_CTRL);
9c69eea32729f86 Bjorn Andersson 2021-06-03  6394  	else
d1c9502cfe160da Bjorn Andersson 2022-02-07  6395  		writel(BIT(1), dp_com +=
 QPHY_V3_DP_COM_TYPEC_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6396  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6397  //	writel(0, dp_com + QPH=
Y_V3_DP_COM_SWI_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6398  //	writel(0, dp_com + QPH=
Y_V3_DP_COM_SW_RESET);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6399  		=

d1c9502cfe160da Bjorn Andersson 2022-02-07  6400  //	writel(SW_PWRDN, dp_co=
m + QPHY_V3_DP_COM_POWER_DOWN_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6401  	writel(0, dp_com + QPHY_=
V3_DP_COM_RESET_OVRD_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6402  			=

d1c9502cfe160da Bjorn Andersson 2022-02-07  6403  //	qcom_qmp_phy_kick_usb(=
usb_phy);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6404  	qcom_qmp_phy_kick_dp(dp_=
phy);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6405  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6406  	return 0;
d1c9502cfe160da Bjorn Andersson 2022-02-07  6407  =

d1c9502cfe160da Bjorn Andersson 2022-02-07 @6408  	mutex_lock(&qmp->phy_mut=
ex);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6409  	if (!qmp->init_count || =
mode_ctrl =3D=3D qmp->mode_ctrl) {
d1c9502cfe160da Bjorn Andersson 2022-02-07  6410  		mutex_unlock(&qmp->phy_=
mutex);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6411  		return 0;
d1c9502cfe160da Bjorn Andersson 2022-02-07  6412  	}
d1c9502cfe160da Bjorn Andersson 2022-02-07  6413  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6414  	printk(KERN_ERR "%s() MO=
DE_CTRL: %#x\n", __func__, mode_ctrl);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6415  		=

d1c9502cfe160da Bjorn Andersson 2022-02-07  6416  	writel(SW_DPPHY_RESET_MU=
X | SW_DPPHY_RESET |
d1c9502cfe160da Bjorn Andersson 2022-02-07  6417  	      SW_USB3PHY_RESET_M=
UX | SW_USB3PHY_RESET,
d1c9502cfe160da Bjorn Andersson 2022-02-07  6418  	      dp_com + QPHY_V3_D=
P_COM_RESET_OVRD_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6419  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6420  	writel(mode_ctrl, dp_com=
 + QPHY_V3_DP_COM_PHY_MODE_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6421  	writel(SW_RESET, dp_com =
+ QPHY_V3_DP_COM_SW_RESET);
9c69eea32729f86 Bjorn Andersson 2021-06-03  6422  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6423  	if (qmp->orientation =3D=
=3D TYPEC_ORIENTATION_REVERSE)
d1c9502cfe160da Bjorn Andersson 2022-02-07  6424  		writel(BIT(1) | BIT(0),=
 dp_com + QPHY_V3_DP_COM_TYPEC_CTRL);
9c69eea32729f86 Bjorn Andersson 2021-06-03  6425  	else
d1c9502cfe160da Bjorn Andersson 2022-02-07  6426  		writel(BIT(1), dp_com +=
 QPHY_V3_DP_COM_TYPEC_CTRL);
9c69eea32729f86 Bjorn Andersson 2021-06-03  6427  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6428  	writel(0, dp_com + QPHY_=
V3_DP_COM_SWI_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6429  	writel(0, dp_com + QPHY_=
V3_DP_COM_SW_RESET);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6430  		=

d1c9502cfe160da Bjorn Andersson 2022-02-07  6431  	writel(SW_PWRDN, dp_com =
+ QPHY_V3_DP_COM_POWER_DOWN_CTRL);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6432  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6433  	if (mode_ctrl & USB3_MOD=
E) {
d1c9502cfe160da Bjorn Andersson 2022-02-07  6434  		const struct qmp_phy_cf=
g *cfg =3D usb_phy->cfg;
d1c9502cfe160da Bjorn Andersson 2022-02-07  6435  		void __iomem *pcs =3D u=
sb_phy->pcs;
d1c9502cfe160da Bjorn Andersson 2022-02-07  6436  =

d1c9502cfe160da Bjorn Andersson 2022-02-07  6437  		qphy_clrbits(pcs, cfg->=
regs[QPHY_SW_RESET], SW_RESET);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6438  		qphy_setbits(pcs, cfg->=
regs[QPHY_START_CTRL], cfg->start_ctrl);
d1c9502cfe160da Bjorn Andersson 2022-02-07  6439  	}
d1c9502cfe160da Bjorn Andersson 2022-02-07  6440  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4968165856688101602==--

