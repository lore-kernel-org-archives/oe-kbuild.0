Content-Type: multipart/mixed; boundary="===============6853556520717907676=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/rcar/rcar_canfd.c:1869 rcar_canfd_probe() error: uninitialized symbol 'ch_irq'.
Date: Tue, 09 Nov 2021 07:59:42 +0800
Message-ID: <202111090731.rOYXOok6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6853556520717907676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d2f38a3c6507b2520101f9a3807ed98f1bdc545a
commit: ac4224087312d7212bd3411f1e393f4b7cb1ff15 can: rcar: Kconfig: Add he=
lper dependency on COMPILE_TEST
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-m031-20211028 (attached as .config)
compiler: s390-linux-gcc (GCC) 11.2.0

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

--===============6853556520717907676==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6853556520717907676==--

