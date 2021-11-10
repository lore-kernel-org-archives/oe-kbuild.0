Content-Type: multipart/mixed; boundary="===============7981386197726961714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/rcar/rcar_canfd.c:1869 rcar_canfd_probe() error: uninitialized symbol 'ch_irq'.
Date: Thu, 11 Nov 2021 06:12:47 +0800
Message-ID: <202111110635.tbccowMa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7981386197726961714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

Hi Cai,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   881007522c8fcc3785c75432dbb149ca1b78e106
commit: ac4224087312d7212bd3411f1e393f4b7cb1ff15 can: rcar: Kconfig: Add he=
lper dependency on COMPILE_TEST
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-m031-20211012 (attached as .config)
compiler: mips64el-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/can/rcar/rcar_canfd.c:1869 rcar_canfd_probe() error: uninitiali=
zed symbol 'ch_irq'.
drivers/net/can/rcar/rcar_canfd.c:1878 rcar_canfd_probe() error: uninitiali=
zed symbol 'g_irq'.
drivers/net/can/rcar/rcar_canfd.c:1887 rcar_canfd_probe() error: uninitiali=
zed symbol 'g_recc_irq'.
drivers/net/can/rcar/rcar_canfd.c:1897 rcar_canfd_probe() error: uninitiali=
zed symbol 'g_err_irq'.

vim +/ch_irq +1869 drivers/net/can/rcar/rcar_canfd.c

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1753  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1754  static int rcar_ca=
nfd_probe(struct platform_device *pdev)
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1755  {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1756  	void __iomem *add=
r;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1757  	u32 sts, ch, fcan=
_freq;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1758  	struct rcar_canfd=
_global *gpriv;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1759  	struct device_nod=
e *of_child;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1760  	unsigned long cha=
nnels_mask =3D 0;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1761  	int err, ch_irq, =
g_irq;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1762  	int g_err_irq, g_=
recc_irq;
6f4c2eea353809 Ramesh Shanmugasundaram 2016-06-22  1763  	bool fdmode =3D t=
rue;			/* CAN FD only mode - default */
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1764  	enum rcanfd_chip_=
id chip_id;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1765  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1766  	chip_id =3D (uint=
ptr_t)of_device_get_match_data(&pdev->dev);
6f4c2eea353809 Ramesh Shanmugasundaram 2016-06-22  1767  =

6f4c2eea353809 Ramesh Shanmugasundaram 2016-06-22  1768  	if (of_property_r=
ead_bool(pdev->dev.of_node, "renesas,no-can-fd"))
6f4c2eea353809 Ramesh Shanmugasundaram 2016-06-22  1769  		fdmode =3D false=
;			/* Classical CAN only mode */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1770  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1771  	of_child =3D of_g=
et_child_by_name(pdev->dev.of_node, "channel0");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1772  	if (of_child && o=
f_device_is_available(of_child))
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1773  		channels_mask |=
=3D BIT(0);	/* Channel 0 */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1774  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1775  	of_child =3D of_g=
et_child_by_name(pdev->dev.of_node, "channel1");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1776  	if (of_child && o=
f_device_is_available(of_child))
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1777  		channels_mask |=
=3D BIT(1);	/* Channel 1 */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1778  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1779  	if (chip_id =3D=
=3D RENESAS_RCAR_GEN3) {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1780  		ch_irq =3D platf=
orm_get_irq_byname_optional(pdev, "ch_int");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1781  		if (ch_irq < 0) {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1782  			/* For backward=
 compatibility get irq by index */
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1783  			ch_irq =3D plat=
form_get_irq(pdev, 0);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1784  			if (ch_irq < 0)
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1785  				return ch_irq;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1786  		}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1787  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1788  		g_irq =3D platfo=
rm_get_irq_byname_optional(pdev, "g_int");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1789  		if (g_irq < 0) {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1790  			/* For backward=
 compatibility get irq by index */
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1791  			g_irq =3D platf=
orm_get_irq(pdev, 1);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1792  			if (g_irq < 0)
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1793  				return g_irq;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1794  		}
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1795  	} else {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1796  		g_err_irq =3D pl=
atform_get_irq_byname(pdev, "g_err");
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1797  		if (g_err_irq < =
0)
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1798  			return g_err_ir=
q;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1799  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1800  		g_recc_irq =3D p=
latform_get_irq_byname(pdev, "g_recc");
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1801  		if (g_recc_irq <=
 0)
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1802  			return g_recc_i=
rq;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1803  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1804  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1805  	/* Global control=
ler context */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1806  	gpriv =3D devm_kz=
alloc(&pdev->dev, sizeof(*gpriv), GFP_KERNEL);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1807  	if (!gpriv) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1808  		err =3D -ENOMEM;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1809  		goto fail_dev;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1810  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1811  	gpriv->pdev =3D p=
dev;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1812  	gpriv->channels_m=
ask =3D channels_mask;
6f4c2eea353809 Ramesh Shanmugasundaram 2016-06-22  1813  	gpriv->fdmode =3D=
 fdmode;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1814  	gpriv->chip_id =
=3D chip_id;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1815  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1816  	if (gpriv->chip_i=
d =3D=3D RENESAS_RZG2L) {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1817  		gpriv->rstc1 =3D=
 devm_reset_control_get_exclusive(&pdev->dev, "rstp_n");
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1818  		if (IS_ERR(gpriv=
->rstc1))
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1819  			return dev_err_=
probe(&pdev->dev, PTR_ERR(gpriv->rstc1),
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1820  					     "failed =
to get rstp_n\n");
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1821  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1822  		gpriv->rstc2 =3D=
 devm_reset_control_get_exclusive(&pdev->dev, "rstc_n");
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1823  		if (IS_ERR(gpriv=
->rstc2))
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1824  			return dev_err_=
probe(&pdev->dev, PTR_ERR(gpriv->rstc2),
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1825  					     "failed =
to get rstc_n\n");
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1826  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1827  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1828  	/* Peripheral clo=
ck */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1829  	gpriv->clkp =3D d=
evm_clk_get(&pdev->dev, "fck");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1830  	if (IS_ERR(gpriv-=
>clkp)) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1831  		err =3D PTR_ERR(=
gpriv->clkp);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1832  		dev_err(&pdev->d=
ev, "cannot get peripheral clock, error %d\n",
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1833  			err);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1834  		goto fail_dev;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1835  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1836  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1837  	/* fCAN clock: Pi=
ck External clock. If not available fallback to
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1838  	 * CANFD clock
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1839  	 */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1840  	gpriv->can_clk =
=3D devm_clk_get(&pdev->dev, "can_clk");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1841  	if (IS_ERR(gpriv-=
>can_clk) || (clk_get_rate(gpriv->can_clk) =3D=3D 0)) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1842  		gpriv->can_clk =
=3D devm_clk_get(&pdev->dev, "canfd");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1843  		if (IS_ERR(gpriv=
->can_clk)) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1844  			err =3D PTR_ERR=
(gpriv->can_clk);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1845  			dev_err(&pdev->=
dev,
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1846  				"cannot get ca=
nfd clock, error %d\n", err);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1847  			goto fail_dev;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1848  		}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1849  		gpriv->fcan =3D =
RCANFD_CANFDCLK;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1850  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1851  	} else {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1852  		gpriv->fcan =3D =
RCANFD_EXTCLK;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1853  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1854  	fcan_freq =3D clk=
_get_rate(gpriv->can_clk);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1855  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1856  	if (gpriv->fcan =
=3D=3D RCANFD_CANFDCLK && gpriv->chip_id =3D=3D RENESAS_RCAR_GEN3)
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1857  		/* CANFD clock i=
s further divided by (1/2) within the IP */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1858  		fcan_freq /=3D 2;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1859  =

ac9921ded292bf YueHaibing              2019-10-15  1860  	addr =3D devm_pla=
tform_ioremap_resource(pdev, 0);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1861  	if (IS_ERR(addr))=
 {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1862  		err =3D PTR_ERR(=
addr);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1863  		goto fail_dev;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1864  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1865  	gpriv->base =3D a=
ddr;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1866  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1867  	/* Request IRQ th=
at's common for both channels */
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1868  	if (gpriv->chip_i=
d =3D=3D RENESAS_RCAR_GEN3) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17 @1869  		err =3D devm_req=
uest_irq(&pdev->dev, ch_irq,
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1870  				       rcar_ca=
nfd_channel_interrupt, 0,
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1871  				       "canfd.=
ch_int", gpriv);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1872  		if (err) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1873  			dev_err(&pdev->=
dev, "devm_request_irq(%d) failed, error %d\n",
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1874  				ch_irq, err);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1875  			goto fail_dev;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1876  		}
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1877  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17 @1878  		err =3D devm_req=
uest_irq(&pdev->dev, g_irq,
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1879  				       rcar_ca=
nfd_global_interrupt, 0,
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1880  				       "canfd.=
g_int", gpriv);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1881  		if (err) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1882  			dev_err(&pdev->=
dev, "devm_request_irq(%d) failed, error %d\n",
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1883  				g_irq, err);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1884  			goto fail_dev;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1885  		}
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1886  	} else {
76e9353a80e9e9 Lad Prabhakar           2021-07-27 @1887  		err =3D devm_req=
uest_irq(&pdev->dev, g_recc_irq,
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1888  				       rcar_ca=
nfd_global_receive_fifo_interrupt, 0,
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1889  				       "canfd.=
g_recc", gpriv);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1890  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1891  		if (err) {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1892  			dev_err(&pdev->=
dev, "devm_request_irq(%d) failed, error %d\n",
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1893  				g_recc_irq, er=
r);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1894  			goto fail_dev;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1895  		}
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1896  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27 @1897  		err =3D devm_req=
uest_irq(&pdev->dev, g_err_irq,
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1898  				       rcar_ca=
nfd_global_err_interrupt, 0,
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1899  				       "canfd.=
g_err", gpriv);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1900  		if (err) {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1901  			dev_err(&pdev->=
dev, "devm_request_irq(%d) failed, error %d\n",
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1902  				g_err_irq, err=
);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1903  			goto fail_dev;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1904  		}
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1905  	}
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1906  =

76e9353a80e9e9 Lad Prabhakar           2021-07-27  1907  	err =3D reset_con=
trol_reset(gpriv->rstc1);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1908  	if (err)
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1909  		goto fail_dev;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1910  	err =3D reset_con=
trol_reset(gpriv->rstc2);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1911  	if (err) {
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1912  		reset_control_as=
sert(gpriv->rstc1);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1913  		goto fail_dev;
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1914  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1915  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1916  	/* Enable periphe=
ral clock for register access */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1917  	err =3D clk_prepa=
re_enable(gpriv->clkp);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1918  	if (err) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1919  		dev_err(&pdev->d=
ev,
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1920  			"failed to enab=
le peripheral clock, error %d\n", err);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1921  		goto fail_reset;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1922  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1923  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1924  	err =3D rcar_canf=
d_reset_controller(gpriv);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1925  	if (err) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1926  		dev_err(&pdev->d=
ev, "reset controller failed\n");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1927  		goto fail_clk;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1928  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1929  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1930  	/* Controller in =
Global reset & Channel reset mode */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1931  	rcar_canfd_config=
ure_controller(gpriv);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1932  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1933  	/* Configure per =
channel attributes */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1934  	for_each_set_bit(=
ch, &gpriv->channels_mask, RCANFD_NUM_CHANNELS) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1935  		/* Configure Cha=
nnel's Rx fifo */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1936  		rcar_canfd_confi=
gure_rx(gpriv, ch);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1937  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1938  		/* Configure Cha=
nnel's Tx (Common) fifo */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1939  		rcar_canfd_confi=
gure_tx(gpriv, ch);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1940  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1941  		/* Configure rec=
eive rules */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1942  		rcar_canfd_confi=
gure_afl_rules(gpriv, ch);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1943  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1944  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1945  	/* Configure comm=
on interrupts */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1946  	rcar_canfd_enable=
_global_interrupts(gpriv);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1947  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1948  	/* Start Global o=
peration mode */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1949  	rcar_canfd_update=
_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GMDC_MASK,
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1950  			      RCANFD_GC=
TR_GMDC_GOPM);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1951  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1952  	/* Verify mode ch=
ange */
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1953  	err =3D readl_pol=
l_timeout((gpriv->base + RCANFD_GSTS), sts,
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1954  				 !(sts & RCANF=
D_GSTS_GNOPM), 2, 500000);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1955  	if (err) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1956  		dev_err(&pdev->d=
ev, "global operational mode failed\n");
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1957  		goto fail_mode;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1958  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1959  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1960  	for_each_set_bit(=
ch, &gpriv->channels_mask, RCANFD_NUM_CHANNELS) {
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1961  		err =3D rcar_can=
fd_channel_probe(gpriv, ch, fcan_freq);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1962  		if (err)
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1963  			goto fail_chann=
el;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1964  	}
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1965  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1966  	platform_set_drvd=
ata(pdev, gpriv);
6f4c2eea353809 Ramesh Shanmugasundaram 2016-06-22  1967  	dev_info(&pdev->d=
ev, "global operational state (clk %d, fdmode %d)\n",
6f4c2eea353809 Ramesh Shanmugasundaram 2016-06-22  1968  		 gpriv->fcan, gp=
riv->fdmode);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1969  	return 0;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1970  =

dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1971  fail_channel:
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1972  	for_each_set_bit(=
ch, &gpriv->channels_mask, RCANFD_NUM_CHANNELS)
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1973  		rcar_canfd_chann=
el_remove(gpriv, ch);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1974  fail_mode:
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1975  	rcar_canfd_disabl=
e_global_interrupts(gpriv);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1976  fail_clk:
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1977  	clk_disable_unpre=
pare(gpriv->clkp);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1978  fail_reset:
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1979  	reset_control_ass=
ert(gpriv->rstc1);
76e9353a80e9e9 Lad Prabhakar           2021-07-27  1980  	reset_control_ass=
ert(gpriv->rstc2);
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1981  fail_dev:
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1982  	return err;
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1983  }
dd3bd23eb43891 Ramesh Shanmugasundaram 2016-06-17  1984  =


:::::: The code at line 1869 was first introduced by commit
:::::: dd3bd23eb438919aeeb73a7116642731ef8f73a8 can: rcar_canfd: Add Renesa=
s R-Car CAN FD driver

:::::: TO: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.co=
m>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7981386197726961714==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7981386197726961714==--

