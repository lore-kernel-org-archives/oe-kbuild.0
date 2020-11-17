Content-Type: multipart/mixed; boundary="===============0420536346986626621=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/phy/mscc/mscc_ptp.c:138:12: warning: Redundant condition: cond. '!cond || (cond && upper)' is equivalent to '!cond || upper'
Date: Tue, 17 Nov 2020 23:48:07 +0800
Message-ID: <202011172304.Cppp31xf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0420536346986626621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Quentin Schulz <quentin.schulz@bootlin.com>
CC: Antoine Tenart <antoine.tenart@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9c87c9f41245baa3fc4716cf39141439cf405b01
commit: ab2bf933935710ac545f94e49d16b5eab01f846f net: phy: mscc: 1588 block=
 initialization
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/taskstats.c:220:0: warning: syntax error [syntaxError]
   =

   ^
--
>> drivers/net/phy/mscc/mscc_ptp.c:138:12: warning: Redundant condition: co=
nd. '!cond || (cond && upper)' is equivalent to '!cond || upper' [redundant=
Condition]
    if (!cond || (cond && upper))
              ^

vim +138 drivers/net/phy/mscc/mscc_ptp.c

ab2bf933935710a Quentin Schulz 2020-06-23  104  =

ab2bf933935710a Quentin Schulz 2020-06-23  105  static void vsc85xx_ts_writ=
e_csr(struct phy_device *phydev, enum ts_blk blk,
ab2bf933935710a Quentin Schulz 2020-06-23  106  				 u16 addr, u32 val)
ab2bf933935710a Quentin Schulz 2020-06-23  107  {
ab2bf933935710a Quentin Schulz 2020-06-23  108  	struct vsc8531_private *pr=
iv =3D phydev->priv;
ab2bf933935710a Quentin Schulz 2020-06-23  109  	bool base_port =3D phydev-=
>mdio.addr =3D=3D priv->ts_base_addr;
ab2bf933935710a Quentin Schulz 2020-06-23  110  	u32 reg, bypass, cnt =3D 0=
, lower =3D val & 0xffff, upper =3D val >> 16;
ab2bf933935710a Quentin Schulz 2020-06-23  111  	bool cond =3D (addr =3D=3D=
 MSCC_PHY_PTP_LTC_CTRL ||
ab2bf933935710a Quentin Schulz 2020-06-23  112  		     addr =3D=3D MSCC_PHY=
_1588_INGR_VSC85XX_INT_MASK ||
ab2bf933935710a Quentin Schulz 2020-06-23  113  		     addr =3D=3D MSCC_PHY=
_1588_VSC85XX_INT_MASK ||
ab2bf933935710a Quentin Schulz 2020-06-23  114  		     addr =3D=3D MSCC_PHY=
_1588_INGR_VSC85XX_INT_STATUS ||
ab2bf933935710a Quentin Schulz 2020-06-23  115  		     addr =3D=3D MSCC_PHY=
_1588_VSC85XX_INT_STATUS) &&
ab2bf933935710a Quentin Schulz 2020-06-23  116  		    blk =3D=3D PROCESSOR;
ab2bf933935710a Quentin Schulz 2020-06-23  117  	enum ts_blk_hw blk_hw;
ab2bf933935710a Quentin Schulz 2020-06-23  118  =

ab2bf933935710a Quentin Schulz 2020-06-23  119  	switch (blk) {
ab2bf933935710a Quentin Schulz 2020-06-23  120  	case INGRESS:
ab2bf933935710a Quentin Schulz 2020-06-23  121  		blk_hw =3D base_port ? IN=
GRESS_ENGINE_0 : INGRESS_ENGINE_1;
ab2bf933935710a Quentin Schulz 2020-06-23  122  		break;
ab2bf933935710a Quentin Schulz 2020-06-23  123  	case EGRESS:
ab2bf933935710a Quentin Schulz 2020-06-23  124  		blk_hw =3D base_port ? EG=
RESS_ENGINE_0 : EGRESS_ENGINE_1;
ab2bf933935710a Quentin Schulz 2020-06-23  125  		break;
ab2bf933935710a Quentin Schulz 2020-06-23  126  	case PROCESSOR:
ab2bf933935710a Quentin Schulz 2020-06-23  127  	default:
ab2bf933935710a Quentin Schulz 2020-06-23  128  		blk_hw =3D base_port ? PR=
OCESSOR_0 : PROCESSOR_1;
ab2bf933935710a Quentin Schulz 2020-06-23  129  		break;
ab2bf933935710a Quentin Schulz 2020-06-23  130  	}
ab2bf933935710a Quentin Schulz 2020-06-23  131  =

ab2bf933935710a Quentin Schulz 2020-06-23  132  	mutex_lock(&phydev->mdio.b=
us->mdio_lock);
ab2bf933935710a Quentin Schulz 2020-06-23  133  =

ab2bf933935710a Quentin Schulz 2020-06-23  134  	bypass =3D phy_ts_base_rea=
d(phydev, MSCC_PHY_BYPASS_CONTROL);
ab2bf933935710a Quentin Schulz 2020-06-23  135  =

ab2bf933935710a Quentin Schulz 2020-06-23  136  	phy_ts_base_write(phydev, =
MSCC_EXT_PAGE_ACCESS, MSCC_PHY_PAGE_1588);
ab2bf933935710a Quentin Schulz 2020-06-23  137  =

ab2bf933935710a Quentin Schulz 2020-06-23 @138  	if (!cond || (cond && uppe=
r))
ab2bf933935710a Quentin Schulz 2020-06-23  139  		phy_ts_base_write(phydev,=
 MSCC_PHY_TS_CSR_DATA_MSB, upper);
ab2bf933935710a Quentin Schulz 2020-06-23  140  =

ab2bf933935710a Quentin Schulz 2020-06-23  141  	phy_ts_base_write(phydev, =
MSCC_PHY_TS_CSR_DATA_LSB, lower);
ab2bf933935710a Quentin Schulz 2020-06-23  142  =

ab2bf933935710a Quentin Schulz 2020-06-23  143  	phy_ts_base_write(phydev, =
MSCC_PHY_TS_BIU_ADDR_CNTL, BIU_ADDR_EXE |
ab2bf933935710a Quentin Schulz 2020-06-23  144  			  BIU_ADDR_WRITE | BIU_B=
LK_ID(blk_hw) |
ab2bf933935710a Quentin Schulz 2020-06-23  145  			  BIU_CSR_ADDR(addr));
ab2bf933935710a Quentin Schulz 2020-06-23  146  =

ab2bf933935710a Quentin Schulz 2020-06-23  147  	do {
ab2bf933935710a Quentin Schulz 2020-06-23  148  		reg =3D phy_ts_base_read(=
phydev, MSCC_PHY_TS_BIU_ADDR_CNTL);
ab2bf933935710a Quentin Schulz 2020-06-23  149  	} while (!(reg & BIU_ADDR_=
EXE) && cnt++ < BIU_ADDR_CNT_MAX);
ab2bf933935710a Quentin Schulz 2020-06-23  150  =

ab2bf933935710a Quentin Schulz 2020-06-23  151  	phy_ts_base_write(phydev, =
MSCC_EXT_PAGE_ACCESS, MSCC_PHY_PAGE_STANDARD);
ab2bf933935710a Quentin Schulz 2020-06-23  152  =

ab2bf933935710a Quentin Schulz 2020-06-23  153  	if (cond && upper)
ab2bf933935710a Quentin Schulz 2020-06-23  154  		phy_ts_base_write(phydev,=
 MSCC_PHY_BYPASS_CONTROL, bypass);
ab2bf933935710a Quentin Schulz 2020-06-23  155  =

ab2bf933935710a Quentin Schulz 2020-06-23  156  	mutex_unlock(&phydev->mdio=
.bus->mdio_lock);
ab2bf933935710a Quentin Schulz 2020-06-23  157  }
ab2bf933935710a Quentin Schulz 2020-06-23  158  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0420536346986626621==--

