Content-Type: multipart/mixed; boundary="===============1824988957144119572=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/rcar/rcar_canfd.c:1869 rcar_canfd_probe() error: uninitialized symbol 'ch_irq'.
Date: Mon, 29 Nov 2021 07:43:30 +0800
Message-ID: <202111290746.NTFgroUw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1824988957144119572==
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
head:   d06c942efea40e1701ade200477a7449008d9f24
commit: ac4224087312d7212bd3411f1e393f4b7cb1ff15 can: rcar: Kconfig: Add he=
lper dependency on COMPILE_TEST
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-m031-20211128 (https://download.01.org/0day-ci/=
archive/20211129/202111290746.NTFgroUw-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

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
--===============1824988957144119572==--

