Content-Type: multipart/mixed; boundary="===============5225605984323128597=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/4] ASoC: rockchip: add support for i2s-tdm controller
Date: Mon, 30 Aug 2021 22:41:43 +0800
Message-ID: <202108302243.DvDLTbOw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5225605984323128597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210828140205.21973-2-frattaroli.nicolas@gmail.com>
References: <20210828140205.21973-2-frattaroli.nicolas@gmail.com>
TO: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-kernel(a)vger.kernel.org
CC: alsa-devel(a)alsa-project.org
CC: linux-arm-kernel(a)lists.infradead.org

Hi Nicolas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on asoc/for-next sound/for-next linus/master v5.14=
 next-20210830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicolas-Frattaroli/Rockchi=
p-I2S-TDM-controller/20210828-220355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-m031-20210830 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/rockchip/rockchip_i2s_tdm.c:1739 rockchip_i2s_tdm_probe() warn: i=
gnoring unreachable code.

vim +1739 sound/soc/rockchip/rockchip_i2s_tdm.c

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1553  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1554  static int rockchip_i2s=
_tdm_probe(struct platform_device *pdev)
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1555  {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1556  	struct device_node *no=
de =3D pdev->dev.of_node;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1557  	struct device_node *cr=
u_node;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1558  	const struct of_device=
_id *of_id;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1559  	struct rk_i2s_tdm_dev =
*i2s_tdm;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1560  	struct resource *res;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1561  	void __iomem *regs;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1562  	int ret;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1563  	int val;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1564  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1565  	i2s_tdm =3D devm_kzall=
oc(&pdev->dev, sizeof(*i2s_tdm), GFP_KERNEL);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1566  	if (!i2s_tdm)
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1567  		return -ENOMEM;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1568  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1569  	i2s_tdm->dev =3D &pdev=
->dev;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1570  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1571  	of_id =3D of_match_dev=
ice(rockchip_i2s_tdm_match, &pdev->dev);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1572  	if (!of_id || !of_id->=
data)
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1573  		return -EINVAL;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1574  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1575  	spin_lock_init(&i2s_td=
m->lock);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1576  	i2s_tdm->soc_data =3D =
(struct rk_i2s_soc_data *)of_id->data;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1577  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1578  	rockchip_i2s_tdm_init_=
dai(i2s_tdm);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1579  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1580  	i2s_tdm->frame_width =
=3D 64;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1581  	if (!of_property_read_=
u32(node, "rockchip,frame-width", &val)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1582  		if (val >=3D 32 && (v=
al % 2 =3D=3D 0) && val <=3D 512) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1583  			i2s_tdm->frame_width=
 =3D val;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1584  		} else {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1585  			dev_err(i2s_tdm->dev=
, "unsupported frame width: '%d'\n",
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1586  				val);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1587  			return -EINVAL;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1588  		}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1589  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1590  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1591  	i2s_tdm->clk_trcm =3D =
TRCM_TXRX;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1592  	if (of_property_read_b=
ool(node, "rockchip,trcm-sync-tx-only"))
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1593  		i2s_tdm->clk_trcm =3D=
 TRCM_TX;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1594  	if (of_property_read_b=
ool(node, "rockchip,trcm-sync-rx-only")) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1595  		if (i2s_tdm->clk_trcm=
) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1596  			dev_err(i2s_tdm->dev=
, "invalid trcm-sync configuration\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1597  			return -EINVAL;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1598  		}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1599  		i2s_tdm->clk_trcm =3D=
 TRCM_RX;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1600  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1601  	if (i2s_tdm->clk_trcm =
!=3D TRCM_TXRX)
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1602  		i2s_tdm_dai.symmetric=
_rate =3D 1;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1603  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1604  	i2s_tdm->tdm_fsync_hal=
f_frame =3D
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1605  		of_property_read_bool=
(node, "rockchip,tdm-fsync-half-frame");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1606  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1607  	i2s_tdm->grf =3D sysco=
n_regmap_lookup_by_phandle(node, "rockchip,grf");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1608  	if (IS_ERR(i2s_tdm->gr=
f))
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1609  		return dev_err_probe(=
i2s_tdm->dev, PTR_ERR(i2s_tdm->grf),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1610  				     "Error in rock=
chip,grf\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1611  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1612  	if (i2s_tdm->clk_trcm =
!=3D TRCM_TXRX) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1613  		cru_node =3D of_parse=
_phandle(node, "rockchip,cru", 0);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1614  		i2s_tdm->cru_base =3D=
 of_iomap(cru_node, 0);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1615  		of_node_put(cru_node);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1616  		if (!i2s_tdm->cru_bas=
e) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1617  			dev_err(i2s_tdm->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1618  				"Missing or unsuppo=
rted rockchip,cru node\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1619  			return -ENOENT;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1620  		}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1621  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1622  		i2s_tdm->tx_reset_id =
=3D of_i2s_resetid_get(node, "tx-m");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1623  		i2s_tdm->rx_reset_id =
=3D of_i2s_resetid_get(node, "rx-m");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1624  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1625  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1626  	i2s_tdm->tx_reset =3D =
devm_reset_control_get_exclusive(&pdev->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1627  							     "tx-m");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1628  	if (IS_ERR(i2s_tdm->tx=
_reset)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1629  		ret =3D PTR_ERR(i2s_t=
dm->tx_reset);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1630  		return dev_err_probe(=
i2s_tdm->dev, ret,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1631  				     "Error in tx-m=
 reset control\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1632  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1633  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1634  	i2s_tdm->rx_reset =3D =
devm_reset_control_get_exclusive(&pdev->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1635  							     "rx-m");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1636  	if (IS_ERR(i2s_tdm->rx=
_reset)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1637  		ret =3D PTR_ERR(i2s_t=
dm->rx_reset);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1638  		return dev_err_probe(=
i2s_tdm->dev, ret,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1639  				     "Error in rx-m=
 reset control\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1640  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1641  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1642  	i2s_tdm->hclk =3D devm=
_clk_get(&pdev->dev, "hclk");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1643  	if (IS_ERR(i2s_tdm->hc=
lk)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1644  		return dev_err_probe(=
i2s_tdm->dev, PTR_ERR(i2s_tdm->hclk),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1645  				     "Failed to get=
 clock hclk\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1646  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1647  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1648  	i2s_tdm->mclk_tx =3D d=
evm_clk_get(&pdev->dev, "mclk_tx");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1649  	if (IS_ERR(i2s_tdm->mc=
lk_tx)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1650  		return dev_err_probe(=
i2s_tdm->dev, PTR_ERR(i2s_tdm->mclk_tx),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1651  				     "Failed to get=
 clock mclk_tx\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1652  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1653  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1654  	i2s_tdm->mclk_rx =3D d=
evm_clk_get(&pdev->dev, "mclk_rx");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1655  	if (IS_ERR(i2s_tdm->mc=
lk_rx)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1656  		return dev_err_probe(=
i2s_tdm->dev, PTR_ERR(i2s_tdm->mclk_rx),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1657  				     "Failed to get=
 clock mclk_rx\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1658  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1659  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1660  	i2s_tdm->io_multiplex =
=3D
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1661  		of_property_read_bool=
(node, "rockchip,io-multiplex");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1662  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1663  	i2s_tdm->mclk_calibrat=
e =3D
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1664  		of_property_read_bool=
(node, "rockchip,mclk-calibrate");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1665  	if (i2s_tdm->mclk_cali=
brate) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1666  		i2s_tdm->mclk_tx_src =
=3D devm_clk_get(&pdev->dev, "mclk_tx_src");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1667  		if (IS_ERR(i2s_tdm->m=
clk_tx_src)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1668  			return dev_err_probe=
(i2s_tdm->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1669  					     PTR_ERR(i2s_t=
dm->mclk_tx_src),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1670  					     "Failed to ge=
t clock mclk_tx_src\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1671  		}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1672  		i2s_tdm->mclk_rx_src =
=3D devm_clk_get(&pdev->dev, "mclk_rx_src");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1673  		if (IS_ERR(i2s_tdm->m=
clk_rx_src)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1674  			return dev_err_probe=
(i2s_tdm->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1675  					     PTR_ERR(i2s_t=
dm->mclk_rx_src),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1676  					     "Failed to ge=
t clock mclk_rx_src\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1677  		}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1678  		i2s_tdm->mclk_root0 =
=3D devm_clk_get(&pdev->dev, "mclk_root0");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1679  		if (IS_ERR(i2s_tdm->m=
clk_root0)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1680  			return dev_err_probe=
(i2s_tdm->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1681  					     PTR_ERR(i2s_t=
dm->mclk_root0),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1682  					     "Failed to ge=
t clock mclk_root0\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1683  		}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1684  		i2s_tdm->mclk_root1 =
=3D devm_clk_get(&pdev->dev, "mclk_root1");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1685  		if (IS_ERR(i2s_tdm->m=
clk_root1)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1686  			return dev_err_probe=
(i2s_tdm->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1687  					     PTR_ERR(i2s_t=
dm->mclk_root1),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1688  					     "Failed to ge=
t clock mclk_root1\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1689  		}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1690  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1691  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1692  	res =3D platform_get_r=
esource(pdev, IORESOURCE_MEM, 0);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1693  	regs =3D devm_ioremap_=
resource(&pdev->dev, res);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1694  	if (IS_ERR(regs)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1695  		return dev_err_probe(=
i2s_tdm->dev, PTR_ERR(regs),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1696  				     "Failed to get=
 resource IORESOURCE_MEM\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1697  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1698  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1699  	i2s_tdm->regmap =3D de=
vm_regmap_init_mmio(&pdev->dev, regs,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1700  					    &rockchip_i2s_=
tdm_regmap_config);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1701  	if (IS_ERR(i2s_tdm->re=
gmap)) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1702  		return dev_err_probe(=
i2s_tdm->dev, PTR_ERR(i2s_tdm->regmap),
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1703  				     "Failed to ini=
tialise regmap\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1704  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1705  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1706  	i2s_tdm->playback_dma_=
data.addr =3D res->start + I2S_TXDR;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1707  	i2s_tdm->playback_dma_=
data.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1708  	i2s_tdm->playback_dma_=
data.maxburst =3D 8;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1709  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1710  	i2s_tdm->capture_dma_d=
ata.addr =3D res->start + I2S_RXDR;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1711  	i2s_tdm->capture_dma_d=
ata.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1712  	i2s_tdm->capture_dma_d=
ata.maxburst =3D 8;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1713  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1714  	ret =3D rockchip_i2s_t=
dm_tx_path_prepare(i2s_tdm, node);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1715  	if (ret < 0) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1716  		dev_err(&pdev->dev, "=
I2S TX path prepare failed: %d\n", ret);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1717  		return ret;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1718  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1719  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1720  	ret =3D rockchip_i2s_t=
dm_rx_path_prepare(i2s_tdm, node);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1721  	if (ret < 0) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1722  		dev_err(&pdev->dev, "=
I2S RX path prepare failed: %d\n", ret);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1723  		return ret;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1724  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1725  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1726  	atomic_set(&i2s_tdm->r=
efcount, 0);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1727  	dev_set_drvdata(&pdev-=
>dev, i2s_tdm);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1728  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1729  	ret =3D clk_prepare_en=
able(i2s_tdm->hclk);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1730  	if (ret) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1731  		return dev_err_probe(=
i2s_tdm->dev, ret,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1732  				     "Failed to ena=
ble clock hclk\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1733  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1734  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1735  	ret =3D i2s_tdm_prepar=
e_enable_mclk(i2s_tdm);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1736  	if (ret) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1737  		return dev_err_probe(=
i2s_tdm->dev, ret,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1738  				     "Failed to ena=
ble one or more mclks\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28 @1739  		goto err_disable_hclk;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1740  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1741  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1742  	if (i2s_tdm->mclk_cali=
brate) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1743  		i2s_tdm->mclk_root0_i=
nitial_freq =3D clk_get_rate(i2s_tdm->mclk_root0);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1744  		i2s_tdm->mclk_root1_i=
nitial_freq =3D clk_get_rate(i2s_tdm->mclk_root1);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1745  		i2s_tdm->mclk_root0_f=
req =3D i2s_tdm->mclk_root0_initial_freq;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1746  		i2s_tdm->mclk_root1_f=
req =3D i2s_tdm->mclk_root1_initial_freq;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1747  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1748  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1749  	pm_runtime_enable(&pde=
v->dev);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1750  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1751  	regmap_update_bits(i2s=
_tdm->regmap, I2S_DMACR, I2S_DMACR_TDL_MASK,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1752  			   I2S_DMACR_TDL(16)=
);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1753  	regmap_update_bits(i2s=
_tdm->regmap, I2S_DMACR, I2S_DMACR_RDL_MASK,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1754  			   I2S_DMACR_RDL(16)=
);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1755  	regmap_update_bits(i2s=
_tdm->regmap, I2S_CKR, I2S_CKR_TRCM_MASK,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1756  			   i2s_tdm->clk_trcm=
 << I2S_CKR_TRCM_SHIFT);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1757  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1758  	if (i2s_tdm->soc_data =
&& i2s_tdm->soc_data->init)
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1759  		i2s_tdm->soc_data->in=
it(&pdev->dev, res->start);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1760  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1761  	ret =3D devm_snd_soc_r=
egister_component(&pdev->dev,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1762  					      &rockchip_i2=
s_tdm_component,
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1763  					      &i2s_tdm_dai=
, 1);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1764  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1765  	if (ret) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1766  		dev_err(&pdev->dev, "=
Could not register DAI\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1767  		goto err_suspend;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1768  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1769  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1770  	ret =3D devm_snd_dmaen=
gine_pcm_register(&pdev->dev, NULL, 0);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1771  	if (ret) {
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1772  		dev_err(&pdev->dev, "=
Could not register PCM\n");
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1773  		goto err_suspend;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1774  	}
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1775  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1776  	return 0;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1777  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1778  err_suspend:
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1779  	if (!pm_runtime_status=
_suspended(&pdev->dev))
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1780  		i2s_tdm_runtime_suspe=
nd(&pdev->dev);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1781  	pm_runtime_disable(&pd=
ev->dev);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1782  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1783  err_disable_hclk:
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1784  	if (!IS_ERR(i2s_tdm->h=
clk))
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1785  		clk_disable_unprepare=
(i2s_tdm->hclk);
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1786  =

d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1787  	return ret;
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1788  }
d1a262aa5c36c4 Nicolas Frattaroli 2021-08-28  1789  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5225605984323128597==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AQA=
--===============5225605984323128597==--

